Return-Path: <linux-arm-msm+bounces-37917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3479C8DC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04BAB1F24B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 15:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44FA13AD39;
	Thu, 14 Nov 2024 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwgL8P42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8565674E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731597677; cv=none; b=AkwNnHgdSusFYekoaP2g0KsgWDQEkUCmv7vnfGDfw8cmV14Zb2Hwe8W2UlZfFA57MozTVQcsly9V47olJjANcxXDThVh6njRnFlU8lPWQHCV5o4fH1FHm5qRZLlyItGAsxiU7whO9zXIDSeHS2e88yWm0Lv+uYVnx3N/5DWlVz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731597677; c=relaxed/simple;
	bh=7MCZRzZ/AzkPceyOazDlSUQhVeaRggBpqmxYwL+WVy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIJM6vp4mMaQxzA9hiqLOWyfWKdDs2oCHyoJv/3Bk+WYSK6dufhjPmPMRcobXDfgC4q9pagziXGrADupj6/6bG/sl4GYAiHfue3GV95Vr7oci9xipeidRSGiLRu80HFLKWIBmMHoI28NyHBcYEuFU6XEgzA/B0VkZZepRAKUK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwgL8P42; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9oZXF021424
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVzFCO4CN/tzo7kgRuNz7PpOy9J23iqDC72boSlkowY=; b=XwgL8P42UMpQwgSM
	5051syUZoYacPcsQ0YeAQAHKQsJiD4noPtXH57ShFWsBK93UDEuxNEzhBaZMFpKK
	BrWt3qWrHkV3Ps32MxZNUgl6wKbDwUhHXQq090alckTyXjZupz+gu3gdkPCxrDOD
	Qpxnx1llx5KXmpLIQ7zvk34bYogpDyBVrhJ4QSpafxHO6kVrC41sZ3BTxyByllms
	C8uhMH4cSjUVG6oxiOQsLqQihKjhQncVm2fCIYs2zluYWI+cF/pSgsXoSpQkvfsw
	VZi4kv/8Fv6iaAHYFQRKS76Vxh7YgDv41ynKmfM+kQnjzN5vi2BeXzKV8zzi5QhZ
	3U7FXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8rusy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:21:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460f924d8bcso1311901cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 07:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731597662; x=1732202462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVzFCO4CN/tzo7kgRuNz7PpOy9J23iqDC72boSlkowY=;
        b=WC1EWpuGoPR+oaQ3YUb+4k15Cfso7sjScp8t5SCI/8qVPvoRLxBMeU0JcyHWEqb48o
         BKFlyb0TqLvExMl+7KaR0XbEJSwXvk0m7lIGQrqAuO6bbb1C37eAatJeN1ddrm5LZQVo
         NTkhQLguItQWi1ckRazzy2bR5lE+MIlBI2O3SMHK5tJWxVGP6W4fLY9xk9EnE3wK7U7F
         1SKE5TEaHS0WAbJqf1EFxHIICs5cGqFi0HTMflY+V4RMvLkIM13+KSu/ENZTRje5mOmk
         GO2OGhXfq5CuFDqgwn/48XfhjIs1+/9bcIB7Eey9tnVVlxOzZaLphvh3HmPfjrtJv2lN
         CIeg==
X-Forwarded-Encrypted: i=1; AJvYcCWOXPdkO8sRDjcXAUiHGY4U0k1VmuQJkgJzGOXVWQz2G1Gx6FTSAjDfxHJC0I+59lOX1t71BUvtu6oY5gsy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+5Nn5B1iI0jfr0Ur7Ze+4UxHLopv9cazpiT3cEYtcJLXwbAjO
	JuwviKbWILgOWixL2XifOxxDpvq+dNYuUYjzLzwSGT8HEDhVsG49RDdQLO4TKQ6mqbR/9YXno9i
	jqeMBd22zbSmbyYmPPn1+B7qpeYalAPWhHB99TvHnai2Hd/f2LSoww38SpfAOfuPq
X-Gm-Gg: ASbGncsLD8zQx6VDPzyxMGB/eoskkQzcAeYC9Lu59WyXNuNAluK6qjrqoZu+86++Gyt
	Y4BVqVUgWKh5jDHe3xbKwrFZ+Xa+F6Hgb6ffvSOQ8pIciI+QmwqulrS9Pz+Mp69iiN+/9zTduPQ
	Xh9WUzAvsstm7O8a8aS4jZ4zGtMCzFgtbzeJ4BTUw6GIH5kRaDrwnS0HBcTmtkDO8OdUC/lVbBV
	h/+PJT9nMzvSmX6E3bxP7XcKLahhX3GH87hlza0R1PP5AhbnF+z6k7av0REM4HL/8hXetl4Q6TN
	f+5SvCHC1JzAErTAfWSjiToatELJ2TU=
X-Received: by 2002:ac8:59c7:0:b0:458:3297:806f with SMTP id d75a77b69052e-463093f1c4cmr153434411cf.10.1731597662551;
        Thu, 14 Nov 2024 07:21:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk+y59ahE80IlwvZJl+xqJ/l+nf1VpXpaxxM3G29yJNwW6rj3keR7gGJ6umEv5Aet5TJbTwA==
X-Received: by 2002:ac8:59c7:0:b0:458:3297:806f with SMTP id d75a77b69052e-463093f1c4cmr153434191cf.10.1731597662104;
        Thu, 14 Nov 2024 07:21:02 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df5161bsm75427866b.60.2024.11.14.07.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:21:01 -0800 (PST)
Message-ID: <c0b3bd36-6ec0-4d7d-9a65-5b8f02cd6c98@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 16:20:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: qcs615: add UFS node
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Xin Liu <quic_liuxin@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, quic_jiegan@quicinc.com,
        quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com,
        quic_sayalil@quicinc.com
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
 <20241017042300.872963-4-quic_liuxin@quicinc.com>
 <5fe37609-ed58-4617-bd5f-90edc90f5d8b@oss.qualcomm.com>
 <28069114-9893-486b-a8d8-4c8b9ada1b0c@quicinc.com>
 <20241113092716.h3mabw4bzgc5gcha@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113092716.h3mabw4bzgc5gcha@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zJJ1v7f5Ser8DMxb2_uiOyiEabIQ995l
X-Proofpoint-ORIG-GUID: zJJ1v7f5Ser8DMxb2_uiOyiEabIQ995l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=727 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140120

On 13.11.2024 10:27 AM, Manivannan Sadhasivam wrote:
> On Wed, Nov 13, 2024 at 05:19:49PM +0800, Xin Liu wrote:
>>
>>
>> 在 2024/10/26 3:24, Konrad Dybcio 写道:
>>> On 17.10.2024 6:22 AM, Xin Liu wrote:
>>>> From: Sayali Lokhande <quic_sayalil@quicinc.com>	
>>>> 	
>>>> Add the UFS Host Controller node and its PHY for QCS615 SoC.
>>>>
>>>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> ---

[...]


>>>> +
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		ufs_mem_phy: phy@1d87000 {
>>>> +			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
>>>> +			reg = <0x0 0x01d87000 0x0 0xe00>;
>>>
>>> This register region is a bit longer
>> I just confirmed again, there's no problem here.

I'd happen to disagree, please make it 0xe10-long

Konrad

