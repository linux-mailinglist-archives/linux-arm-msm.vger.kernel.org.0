Return-Path: <linux-arm-msm+bounces-46648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E2A24A13
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 737A6163F6E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11C71C3BEE;
	Sat,  1 Feb 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wuczx6zz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC617A90F
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738425390; cv=none; b=htawyPUVKHHZaMjOwQn58fdtTE7/weGHHTwcaRY9BQyGMBQ/sHN8MJT5TCzMcg1ifuJJBPovL0AsBmXlD9wfQutXNhKC07H+q7H3/tmqXRF3Y02cpyG5uFot0E1hnsNyx8gorGXJmSCciZp3L9O3Yr1ltAIea7z4OZf/WKmHtH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738425390; c=relaxed/simple;
	bh=3ynjV06sDgDSo077gCycJ6AmBGSkax0gKYdfkjSHV34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBhjRbBZv72BBQGhmdbHWGKRLAXHzsFwQ7yHAcZ+U+oCR8cPeNjOe8V8J1Jgqdf3cjlSrUhCv7A3+JpzoAB5kF9nUuzkJiTkZlRz+RSKTMQ5mmGKRskyGBQ3W5Y6SzWNwYSzOYiU4Umt4xGRo709EDfpiAYbTRvdxlv9HE/LkBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wuczx6zz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511EFWe8020462
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Feb 2025 15:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxAI9QfYzUboOCqPfk86tl0uJEcqlI27N0d6rOMmn2g=; b=Wuczx6zz54Cwy1gA
	XovtkIrG5aZ+hXsHE7QufKxE9d+kBV+zVhLaV94NPy19REaCUYF/MXe0O4Av6FHb
	fTiYGKmTOwQcDENGyh/St69Ga/Qv0cjwIN81+Zr5rS7FRsOVhMchRwrb8n8sV1ne
	/T8xS0VM4fqx+zxncVffSYtqVyw8XwRvo6j1LiVNQDNTRMIAEZkFCBOEfdm4yFer
	N9KsUr+/dvVrXScbvFDztgmCXjK+eOBtDQiX+7RZFt4n18bWYM7fGciDjskmJlgV
	qTy8Ui6wEFn82oWuvecWS2AUEGPAQVe28tQu1Afn20FAhA6L+SCSyj++xFMS542E
	T/clpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6s1344-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 15:56:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6f28dc247so69930185a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 07:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738425387; x=1739030187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxAI9QfYzUboOCqPfk86tl0uJEcqlI27N0d6rOMmn2g=;
        b=ErdQJjVGNZf56bOpL7E0CR817RBJPvbMPQaFTgF1YTI3UU6dLHHJrJY1JDYFSH1IEy
         Uf+ZK2/8wa3dsl/0cW5q6zEzUUYeYgIc04/G5JH3XfD/g7OTJBykDh6gDZA90sTGfH2L
         2lJSzinMem4BWeeHzGtMxoflJIWkQGyKEnil+FwI8auwr+7CuQnVRGQ0kg+Frf9oFfJA
         +FvZrV/c4aVw/e9h7yrnzQ0boTVcayZqrV1CrXz5yyFxai6ZWCr/0L/9IqbFtGBQlnrQ
         QmwgS0qJX8rx+TJbV5ETUiYMdQx8QX2/6LEklHf6PTWMi9L2gca2G6hUTXy1CvfihZ1L
         P6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWDkk+/ZfN528N0556MjVhR5q9l5pA1Y2N43goMxIuf6lt8reS8Om7rsRB2XNFunYnl/ngmW/9Fd3uQypG@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUy/XpgeytHpwrnXBHU7+SEkZmhzRcjQpV9uwuaesuy4Xra2Y
	VB/Di7hCUdX+/x3udYCEYnPbmS/e7lMBn2G6nFLxl/Mt1FCWazpKuGICD91i2Q4se4kS0NU+pOP
	kb7UW8CoaavKVP5A1sBrGBvfkUML97ioLJexPEJXYOUxLuLtfxLD7KYICO8ZGnhPh
X-Gm-Gg: ASbGnct6g1ab/ieut4dUqAvZMj+lkPH3I1huqBMvBUCAv7FuKfBRXJIamOnUN93pwEF
	5MQ3qF3GS8k5yNEFhW7SNFUOGIY1n5wgLieyUmgbyrDilix49PYXFrVJ4aS+5p1vNNM/4ELQCM3
	1qYa5eu+MlXb6CU/UqMvYzud4+ihTQ2/qz+oGycGvrKBCIsezZ/gFs3hu9O+vz1kVV71zbg0f1X
	VJ8ZZ+Xqn4KPjSTx078aJMOaZlGaXXbKGgRYhyOuv5FwkgCW3tU99kX4CozemASIlq6DVoO5SIl
	97gRDBU2Zy89LlLx1wJgD17GPeiAvlTDrUB4C4sFeX3ByYzgFW/Wg94GJyw=
X-Received: by 2002:a05:620a:4246:b0:7b6:da92:fcd5 with SMTP id af79cd13be357-7bffcd0a7bbmr802317785a.9.1738425387277;
        Sat, 01 Feb 2025 07:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCspEPtqtytsQHm2+LoVv9U32cEp2WRHWSz2SmhEQGoYUVNNLQcIl4uNOb1zVwXxus0FRB5Q==
X-Received: by 2002:a05:620a:4246:b0:7b6:da92:fcd5 with SMTP id af79cd13be357-7bffcd0a7bbmr802316185a.9.1738425386886;
        Sat, 01 Feb 2025 07:56:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4b6dsm4577092a12.24.2025.02.01.07.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:56:25 -0800 (PST)
Message-ID: <96c4af07-6adb-470a-8cbf-784bb544ff76@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:56:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number
 constraints
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-2-02659a08b044@oss.qualcomm.com>
 <20250127-hungry-bald-groundhog-4f7d4b@krzk-bin>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-hungry-bald-groundhog-4f7d4b@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7UEqxzoQ8q6m0F5G7RAu6eC-h-qJZ8By
X-Proofpoint-GUID: 7UEqxzoQ8q6m0F5G7RAu6eC-h-qJZ8By
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010138

On 27.01.2025 9:26 AM, Krzysztof Kozlowski wrote:
> On Sat, Jan 25, 2025 at 04:31:18AM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> (Almost?) all QMP PHYs come with both a "full reset" ("phy") and a
>> "retain certain registers" one ("phy_nocsr").
>>
>> Drop the maxItems=1 constraint for resets and reset_names as we go
>> ahead and straighten out the DT usage. After that's done (which
>> will involve modifying some clock drivers etc.), we may set
>> *min*Items to 2, bar some possible exceptions.
> 
> You drop minItems now, so that's a bit confusing. If all devices have
> two resets, just change in top-level resets the minItems -> 2 now and
> mention that it does not affect the ABI, because Linux will support
> missing reset and it describes the hardware more accurately.

This will generate a ton of warnings and resolving them may take an
additional cycle, as I'd need to get things merged through clk too,
so I thought this is a good transitional solution

Konrad

