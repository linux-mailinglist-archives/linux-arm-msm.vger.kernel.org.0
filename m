Return-Path: <linux-arm-msm+bounces-42843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DA9F860B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E275C18923DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C501BD9C2;
	Thu, 19 Dec 2024 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jyvo7OAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6E1A0BDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640668; cv=none; b=Wtr0p1GkyvBss9j3fKg+fKjacRhTbkMmXdjaJOijd3bQPHASJ09UYChiCRavOd43ITl75NVFvP+N4Or4iOGpJ8k/H+Nf6fLAuofEedTxjvM19nx6QKlsVFD2p0q3IaRX0O+uOAflETnKBtCnJ4cPDAJRIxQVfjC5dHybu3ZhIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640668; c=relaxed/simple;
	bh=hHd9PbPfS3ni7tGULC2ouoqqu6qX1CfaGkpYQHYA5+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGmSxqPDg3TZEAHiILdaU1XwDbfSaruLCWTmhMMRoZVRF9bgUocb08LBWWN9WAgp4ZtcZ7ooHgFvmSQBTVT2YuqoR6tuvxn6q3Swxmts0pJCgJ8Am0lTLNw+Q7Adswuj/+6/BwJh9yi0YILoaAqs9XdI/5Fv+pF1PABNOGR+j3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jyvo7OAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGeZP0004020
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ezdn7/t2mAMCrk94+KdhwAqMUM9TyhNKtYrJbo04zGo=; b=Jyvo7OArCf9R55OW
	VAbtzNrn9fFGVbaN8ywtQRcyNG8box+z+LzEk/J0nvJK3eQuB+YoNQ2GJkTMdUQ7
	UN9dMJsl9ou+tltiJVfNpS87HfRiHVJ7vaffITfdigrBkoHZCzX37Xx1nqN9QeUt
	ikZxIoM86Z5PPYnV0JY/g0BWQ2+/dnHyzm4I6/7Psy3PLESQUslSkZs04EjZ6wU7
	ZLZZJDNQuVZLk9cO7Yth/m66ZrnJcqxXmqwM2JySk5HrtIjVXNZ7Epa4cnQqvYw3
	wnNxwr/pGWYzFeuVCpdzxRBPQpsog/DHUwyEOAHypkXNgi49zpdkHYOhHJZoVpT+
	2DCeIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mq7frhv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:37:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b71321b993so14760485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640665; x=1735245465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezdn7/t2mAMCrk94+KdhwAqMUM9TyhNKtYrJbo04zGo=;
        b=DsJPrO3S929pnbLEKq16yRaQf0pC8avGAGMBbpDUVWJPwvzpWiPwrIrYKxETzjrGNo
         RS75EUeKWM6yyJ6Fxq/ZMGzBGyTRoUFw5b4r6cnurMePtTnEUo+USq7tC/ArNErUIPFs
         9hq1NwEnvY1XOuwjG0L0xPwE67i12Ijt630mb7ZkFCu2+GsoV0vl9MPCFkvJZa5Th4If
         wow4fAMJe6vjy7MsSmVdnBQP1sJr11h5yuJmdnUFvAjps7mvVZqU0vvo7lm2PXwkiMD2
         N7RRocyo4Yf9D3keZ2RaZbPFpp8EhwHDI0BwzPq4JW31K2FukHhNSPQUneNtxjDzYMY3
         /cag==
X-Gm-Message-State: AOJu0YzVbH59R5XEhcIfT3fYlE29HVgNqGAhK5u7MOXW5j2ej2XkSvQo
	GO5tc2wwIvQInDi3fW7a5Xl/d4/h8efgUxKSUeRvQSaI+G7lYQjdNOqYGAtjbmjOdnsmTYvqGUO
	WVW4yIlkWJYquSI2FwcBCfsBvGcnQy4g2yv6VuxjxXqjK4NAu+RagYRxlebL66K0o
X-Gm-Gg: ASbGncuL3Kfmxbi5/NqUPmjjv7/ENGObjKVyhGpfctvCnMDZ5NcA12iUFpkCt2NlEsA
	u78qrD1r2QppMPy8XSNx1RqmGOn4Uko+amg4bCFgDPQFvo8PhWE2HV3Z56zms9KrW5Ez5D/TMYY
	ZnGh9Y/Gns0fICGvBqanC8GOW+M3O1tU4/66puc5hR+4O+BV/fyPdFhohdYYzMMs6VLVqbyDwjd
	jXU1Jlo3ugF7cOdfXlXiUmn4RjfMQE5skYdhKv+XZUv1V04GwbH18CblxjEqOI8tG2gWnneMwdV
	EI/34jkzicaDDX/eGBHVf1FT3KQkHFVoILg=
X-Received: by 2002:a05:620a:880a:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7b9ba735bb1mr17229285a.5.1734640665388;
        Thu, 19 Dec 2024 12:37:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkNMrnNtwUsPN1pZdefExuscBv5TH9Ehpsom+xgPadLLae8lTb3T5vdPsX99u/Q62WI8YYpg==
X-Received: by 2002:a05:620a:880a:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7b9ba735bb1mr17227985a.5.1734640665059;
        Thu, 19 Dec 2024 12:37:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06f942sm100571166b.200.2024.12.19.12.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:37:44 -0800 (PST)
Message-ID: <9d41e986-9b6f-4858-9051-ec1d23317b04@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:37:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
To: maud_spierings@hotmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
 <20241204-asus_qcom_display-v6-3-91079cd8234e@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-asus_qcom_display-v6-3-91079cd8234e@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gyYKtsTafW_HTvQKtesMjZ2QzwaJTP4S
X-Proofpoint-ORIG-GUID: gyYKtsTafW_HTvQKtesMjZ2QzwaJTP4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=910 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190163

On 4.12.2024 1:26 PM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add bluetooth for the asus vivobook s15
> Describe wlan configuration
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

