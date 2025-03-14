Return-Path: <linux-arm-msm+bounces-51510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B4A61FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0260418972F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 22:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E25205506;
	Fri, 14 Mar 2025 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzKToMXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6A6204F98
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741989637; cv=none; b=fEvjfnPE7/m7kNpTOHD4/Tgu7zMJzNfNBWBywUYqJKFfxrBZ3L1AFcfrmADjjiDhCAtLNhI4c3ybcE9N+T97MI02yg0oHpY3cSWpzHsVBGTsZ/iFSLpDC344SKG5FbTXDDEtlAwDvcXO3CfD1XTC+d++RMU/pEvXzflojAPAAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741989637; c=relaxed/simple;
	bh=F02AKkUaTlzJK4g0YtQD8ijiADWt6Tzos2Yh5nMglHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJW75LcQIer5KGRa5mil04eh6jYfM/veMR4d8iLWAzo4MFHtwhTubJQFyAc59iBYJi3qRYqBgatN2T6wv0gl3IKncceZfWCJgsdk5k3eZegQ+y2DnGi7kiA4MpI/wgGLCxMZWhtLHZoC+XYRLBLnetz6F5KBTlWKtwx1ShLveSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzKToMXi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EL5o8m022787
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+S1x35o0+RphZNHTGFMos0lvmrnsghifnHcTnuDmnCc=; b=AzKToMXiceXu5WH8
	rnbpcAvdNZBQeGxEquwC5vVnpv3mYBzEaCHcBsXBEjXFubWxUWFkGzEvHvzEaEQc
	ItoAGKPfaelzkXerZsNQY2yIT3Skp776q8pG6th6QIhPou0ZG+gOoggMkO8wio69
	z3NLYO/xw8cYKfjZuZUVu0/WUj0w5G9wAihEtHVeIC6WNvkdow4Syw/siVRoaHpx
	eyiMekciYS0Wef/zPhEzxH9o2VH4DLQUlsYS7h6/oMqAc4Dw1Ch8jLgZBfo4wkl3
	xMrkcGYRk8Dp566g8SLStvZxb+zXPfLatFMpjMzrWp1JTtWb8d2Sujx899A9IAYM
	fCJy7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45chmqsy4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:00:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f3766737so5986746d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 15:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741989634; x=1742594434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+S1x35o0+RphZNHTGFMos0lvmrnsghifnHcTnuDmnCc=;
        b=F6glhjEaFfGYMSEgoDQEID319r70crZjUV5ZI/zHlVN6SIyewBA/cZTG96k1LJxBc8
         /CnJXAFHa6IEutTR+QxwyHlLMZ4635g7ohFdtD3YLFKQtQ4zynOJSKh9C+LLIVrQ0VlQ
         el7jMsxdKOJbWvINfD/OP4pfhN6l9ETUt/Pd00MKvkl+uJ5oYwbhhIWL9XrKUxJbL9be
         Ih57SNjW2QqRmZWifwIjLDxx64JEpQ1wSK/WhxR8kMVkNl/vdHpo+m88P9JUtW87B3tn
         dASOngy96yNs43IJJmHvD9TnSIAfGHnffc+6JqvLSDTPFv7pDaLnGBTXAlkMOuLyrvFJ
         JDQw==
X-Forwarded-Encrypted: i=1; AJvYcCVma/yj1JqnbIrxoxmN4pBH6V2MM7utGj693aw7LHIaWJdCTebjjFfZm0VSnnxfgdI/0q6c0Sjq5WVVg+s8@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4ZbV3CdLawuUDDg+ZqzoP/iwtFb03MldTaGY+bAh+XvaUw4H
	Gd2h7Px/o2E9eWAGtGdpNXLSW/sMVppasvEPT83ITEfCkFsBpE9KJWn8EjTXs9gb6WjPUYwlJ7R
	BBaQgVa4wlvXPGDYsXfOhoixCIjOAHreowgakYC+Zx9j+x5il92tP9RJdI58kSaxk
X-Gm-Gg: ASbGnctNd8gCg+VQfMLB2zLR5jJdkxKzkBHOKd41MQFTYKwMMpgHHr29tqUQNUqmBdx
	brpFWYsu3F1vPj+WPDLXZ7Uv+EAED6L7pybKEVMIg3WSHpUn0HNMBMYcmGYtWyqYnHE7gVCtZg+
	HVTZJBQ4PipCT2UrftXVXPW2uzx2R1LSHv0bciQkh3J+z8IuqCaxGtJbfEbsS1syGDmyOhIsAjx
	OeDPtNBiYG4OsPS6/ZQlfy7SQAHfcDyHfkQGgMdbgVbQf4fq0GvuVhMxqo8yAWM+qCVMah6NMNY
	R7lHcUSsDvCDga9QHFLchji7f9E9Yg0GjWVGQQ9yEAOVotRTNpyJfdY8o1Ia5mMICOJoJQ==
X-Received: by 2002:a05:620a:1914:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c57c92fb9fmr229581585a.14.1741989633702;
        Fri, 14 Mar 2025 15:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHihXQb37dkTZP33cmAIecNe94bbPFEDLSIhRXMbiQi1aPGV4bULdUCeeXm3pISvZTk9kv1Kg==
X-Received: by 2002:a05:620a:1914:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c57c92fb9fmr229579085a.14.1741989633255;
        Fri, 14 Mar 2025 15:00:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aec15sm277125666b.34.2025.03.14.15.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:00:32 -0700 (PDT)
Message-ID: <c5ead68a-f108-4e73-aea0-d6cb562092ac@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:00:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Dmitry Baryshkov <lumag@kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
 <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XtHWzzheBG0iqMKqbETjCh18rgZxE5qI
X-Proofpoint-GUID: XtHWzzheBG0iqMKqbETjCh18rgZxE5qI
X-Authority-Analysis: v=2.4 cv=d9P1yQjE c=1 sm=1 tr=0 ts=67d4a703 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=vlatggBPyhKtcxP6hQoA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxlogscore=721 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140169

On 3/12/25 7:53 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 06, 2025 at 07:13:17PM +0530, Pratyush Brahma wrote:
>> Add the PCIe SMMU node to enable address translations
>> for pcie.
>>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

Please hold off merging this patch, there's some internal investigation
required

Konrad

