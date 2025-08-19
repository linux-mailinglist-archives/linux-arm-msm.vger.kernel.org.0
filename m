Return-Path: <linux-arm-msm+bounces-69666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCCB2B9E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D280E521B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F10D2773C0;
	Tue, 19 Aug 2025 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RA1xZPkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DF26E146
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586296; cv=none; b=jWvISX6tp711zcW6+nkMFGgLEpuj8SER9Z1+XVR/UVcRFmigR768r8FsryqT+rlvx74LlqBSiY7moN3eaognKLb2/4QjsLMfq0KpPT1AaHdF/N77ChoVbSvIfBziP6heBn9/fA27RWP1H5Db4Kfc81hv7XrGCFMGHs0VktWAlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586296; c=relaxed/simple;
	bh=ytBpBRy+4SzRAfoTHldnKXycB1vfiRkT22aOMpmBfLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blWR8p4GlZ8uFwjVZrrVOkdU/poLOAKotZ0TakaPgqEqwBhS0BT20IPrPd0p7TI6MU0mQeqpQW/KVJ4uyjJkzYofGF0ttYjOfkTT0ExDoW+vbD4Iar7YUU3h0TrfgeRpEFz1GvlSp5DRdAL2lpZhnzWAucpWz/xvsp1NVgVyCNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RA1xZPkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IN6p3a027312
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=; b=RA1xZPkvzllF0MpV
	naoDi0yR2CxSqphg6p90qxi8lyy6MADcfyIb+nkKPjEoCoBV9uc+tBLfOsHmszpO
	xyJO08L2fhdIpPJKpszYhLkQzhlB3U8XKYaiWda/pkkAkRVK3HmBcdHV0DAx9+Dn
	LX7AjA3/OdnWRDTgQV94el6hFDRookIlXq1U+6SF1dzX2ia/3+Dp3slRNc/522k9
	oI1RPosK4xauiQymYlcQyykReT4tCir++VLdkabDx3DL02Rhn640eXmVfoqZLr2N
	VaG/+Tx1EDRKPPhWBqP31mETZ1MukY3FNGhCQAJj0+KAMbUMmdoOC5MBnAwSyNYG
	u2tiRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunuqwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:51:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581ce13aso103936205ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755586293; x=1756191093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=;
        b=Xcudw0iS1tOrly3bu18LANZhrfcCnLMTmJpNdOBAr6fH2wEk+/pMhTQQ0SWqMHRx1U
         AQ4LnWnGeo9CvJx5VqJ/aMkAHguoFZgHguShHjE+QOZx+dXjcs/i4Kso6+uBsDKyl6N3
         rlRr6XkGVunwjg8dIYrxBGTkPglnmpNWw3ZaddEmmnU92lhM1WF9H2kgcZwOfea+cZss
         0BE3sfxpZISqWbe3KL3enxEHIoDZULD34uCQPrpnGo/o/HfRnLq1vwy1+niJ+NWQNJDq
         9R6pas4ER/3bhz6bQsmFBZ5oWd3ZABmsQkedsvObBCDxlAMZAgNt1Qi/3A6QJIuqLy5Z
         AnaA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Nz7w5FuiVENVb1qWeA4y0OCNdzRbqwyP0zRteVMT7Zhj5PmYIa5YzC8J1CvAOKTqlKYZ6F4gTNsU3G7a@vger.kernel.org
X-Gm-Message-State: AOJu0YyplVhZTkwickY5i1pheSCIR2eazcfqJ6CBq9uqBHBANwMkxtk3
	Xt6mqTbG35FwGzeNgOi77VIJN1j7SbHzXpGDNp8pI2tTUG603ThqUWtfFOS98rsmz2OlIk6XTAp
	t3F02hDivNX90goewblYZ+mPH5j3oQSL0HQRuu0JcbUGvtk0ReboUx8nHdWSxSmbgBake
X-Gm-Gg: ASbGncsO3M9/C2uWn92GxSTeC8AnapxqYze2gefHelSBxe25XOBfHz/StHksaorKP8w
	RsXsfqCz41QN8DqhTzDV1aYAy3abFNq9o5bsHezFp+XpFF75Nq/YRJVFd/W4lzNgsyv+mrYobRY
	UaZtmHhrv2qj4JMZHx/heNdq3UylXt1NxDjSkK7s1Vl84v7oja+g0UV6fuJlEGcFDAgLpdYFhHN
	npogc+Yswsk+lqnufhGfAPKclXeRkTuHp3UrSoRFELosqIF4Bh7Knyb08CBp+CrgTybFm2QIQRM
	CPPGWPEqBtbrA50KmupgjW/eFkg8CT2pW/Bge8KxZYyjpWySUI198VH2uSzisNIOT16umLwdNTD
	76mYjwUQGteY7eNk+YVO+XDdmvpYZ4XZu
X-Received: by 2002:a17:902:da8c:b0:240:aba:fe3b with SMTP id d9443c01a7336-245e02d7726mr20776605ad.16.1755586292679;
        Mon, 18 Aug 2025 23:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrRQRvLzaR0no9uz4wl3VWShxiXhdMnGmDhx8W5wXZivwjwGSDV2ohd6ogQppD0UOvYx2W2A==
X-Received: by 2002:a17:902:da8c:b0:240:aba:fe3b with SMTP id d9443c01a7336-245e02d7726mr20776395ad.16.1755586292249;
        Mon, 18 Aug 2025 23:51:32 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446caa3e5bsm99455325ad.33.2025.08.18.23.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:51:31 -0700 (PDT)
Message-ID: <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:51:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R5Bl0jv-QnEv-7GHWzi0XCtAVXT87i0q
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a41ef5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XWQ9mN7VkJ-Tecl8lUkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX0nSasKQKGeSt
 WXp3KrjNQSpnFfm8w35AddpBEhtzq6mtpqDWAzskZVsocRQSQPKZqmL3/785KiR2nZ79ADxey0m
 aaB/SndIbnsE9JDHNWLO2ne9roZr2X8Reix4vEOINoI0lttmVsnOmfLhA1fwcg9wEEIILsbTDwg
 7viEXzV/sh4PlNbn2A/poWfjR0nBFa5QVFuSiP2whJ3sVvwUr/iBY7r4TmMU5engTQrK10S86vB
 LdbX0SRgntMcw+bOXvTCRpqV2YssFUCWZoMPxMFWVhbuaEN0O7DYjTURsMI52pD33xNeOKWZv0R
 fH7Sd86R8rEal7lArZbBA4NKw0QuGHnuQImurnKkBgKYNQDRIclDPZhrP0aNE2cD6UMwdodwpNn
 9WYbGNmT
X-Proofpoint-ORIG-GUID: R5Bl0jv-QnEv-7GHWzi0XCtAVXT87i0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071



On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
> On 19/08/2025 08:35, YijieYang wrote:
>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>
>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>> functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> 
> Why do you mix up DTS and net-next patches? This only makes difficult to
> apply it, for no benefits.

The DTS changes and driver code modifications work together to achieve a 
single purpose, so I included them in one patch series. Should I 
consider splitting them into two separate series?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


