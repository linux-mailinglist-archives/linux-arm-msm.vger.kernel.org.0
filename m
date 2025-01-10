Return-Path: <linux-arm-msm+bounces-44691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB49A08413
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F973A3D62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05D11C683;
	Fri, 10 Jan 2025 00:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFamolNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A20C4AEE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736469378; cv=none; b=EwsDWagIM33l+FmpOr3cpYf+atbMEpr0Eu3y5SQBQt9rOybr6ZTGIWbDPuRT45OxZ9kg/6M1OvEDT6022eUhLy9ykadcfR7Kpt/7QTbkgCBsBRAg2upxGdbjAmWS0/E8ysHOujuWFTHioh+XczUqqXGNFRXap0KkamTnvn0tA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736469378; c=relaxed/simple;
	bh=6xICFHMpCxosi0gUwiynmplBiLRVEa83rAxJzP3S7RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZ+hGiSsxCo+eKx2o5adOIs1JW9pZB4HhrD616qPL7UlDt0jXNDHp387Hq6csev5j6PuyI/+cvZCqUYzQPrZj7BewyWsNfSGKb1kleNTS15ls0+jD18ilsqcFY7kdAUAU8/GlsRaRA/sFF9losO8otoc3QowW6BkO/FDdMMwzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFamolNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509EEUGA007563
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2UFCBivwhiM1gcHoI269zCVONI5NtEXRX7Kbx2/usY=; b=eFamolNZISTBR5Om
	n+q59gu25ENNPZiIXZtcB8ec21Y6MB7e1aNz7bO61H7Jar4Ge4JCMJydiAAjiLwM
	1+0voHH1TFCTfW729lmm+iM3Kauz/iXGNWCkA8py0FYA4j8Oz4fbxSnqLFPkKcyL
	K6diyagYq2dtPeaOYt0bCGkqK0qm7ZTh+Pu++zYQpd0EQkzP3/tdc6lk9dKrxeQ+
	4m5WGfJvBFVMKTIK/gZpX1qxlQsHxre71K99s7XIwAONq3cOyciUeKt8Eyp3EV6P
	A2Z/eOLOxKBzLBRqaiwSnyLw8UIhyCPiV6cd6O0ipp/sUJk3o1SdOUubbnM4Yd+h
	BWuh2w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442g209ah0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:36:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8eda4d80aso2661986d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 16:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736469375; x=1737074175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2UFCBivwhiM1gcHoI269zCVONI5NtEXRX7Kbx2/usY=;
        b=tWIT5Vhi7C9xjdrtgE/ycoqoKuwdv9zuo+3gM+TKoVZ78iQ1XbI6Ra8oNizC8J1Lka
         OX5ABHtdu+BXCrwS+O2ovj9FoRT1OGQR2cITvZDMIQYt5/kxrOhg/PSz5T6N7ij8GpBV
         HMXv5gEndmZHvDQwvTQqYxKSWFaB18sId/AYFQlxWT/2xv5MZSEgqv7YkigR+ZO5OBi7
         EXKUsTxlvfDtoNxaQCwFCxy2kh91CGf8sCOQ97O1kOwY8eTaETFbSf+dvkJQ3qsNbCvR
         c2+KeNb2w9EPUwfplAg7gHfnkNmOMosRyq2oyS06W/v0sjnfobla0OwGiBseFYnZnB8Z
         5fWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkPBrYEvH30Y0Tod42189RRubkSxtAKGtOPNIxfCfNy/WBiillOZrMEuEE9ohLtQxOxUCaS1jHj5Qh8sjn@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfZbcGXx60Tim9P9c9OumL29Cxiemieb9zidqwARXwspuSDiq
	nqJiPj67JbsN/fTVjm9UcCKl3clN/+7rQMyLlBNlFRuEDVA77us++Y907ZldH0sJhTxJisv1/5P
	NIo+AvNllk2iFnNQ042+DlT+RRysKVXXhOdnvJUACiXzCX5pud3TJa6xs9pRzNHbr
X-Gm-Gg: ASbGncvz/6fx2Ml+6q9mgX4Y4KkOVh5Qna5kPqt7TdFtafHgtctzJv9SCXteZGIs1ad
	KKv52qzkr6Jvj+zYPpxK/32YibRzw/lKrFAhq83sRDhe8wuerxJFu1pyO9gYawzDIwGJg81LuSK
	YQqPv97ZyPcAZdvqCEL9/qkWarH5ASknof7wuO8HBul3qu7SQgJUsetRfue3iXYLP4vEp82jI2R
	rXO/WMjIgyHVBLffOM5nFsGHi3dA61BaQd21tyBzcHatrXqxKG83iNmQ4vRDKPl/uJObrWfFJzm
	NO5EpaSxtJXDleff7I278TAgxnDpT+Gpbr0=
X-Received: by 2002:ac8:5e4a:0:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-46c7108eeafmr43191781cf.6.1736469375336;
        Thu, 09 Jan 2025 16:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqzJDZC5DsrsgRLLer86gUYngDWm9d7wxVogvt+ECZYaejlq5jX6dZf6OMucVEMdVDHi+XJg==
X-Received: by 2002:ac8:5e4a:0:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-46c7108eeafmr43191601cf.6.1736469374995;
        Thu, 09 Jan 2025 16:36:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c3cdsm1086838a12.1.2025.01.09.16.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 16:36:14 -0800 (PST)
Message-ID: <9127e720-aeda-4b7a-b9d2-406c7f0ebd03@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 01:36:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
To: Mark Kettenis <kettenis@openbsd.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109205232.92336-1-kettenis@openbsd.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109205232.92336-1-kettenis@openbsd.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rNNB0MBB0gexGg_-oGof4aMA_bJOXcg6
X-Proofpoint-GUID: rNNB0MBB0gexGg_-oGof4aMA_bJOXcg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=685 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100002

On 9.01.2025 9:52 PM, Mark Kettenis wrote:
> Make this USB controller consistent with the others on this platform.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

