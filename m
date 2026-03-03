Return-Path: <linux-arm-msm+bounces-95228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAV/HjR0p2mehgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:52:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E6A1F8814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18D7B302C346
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38652375AB8;
	Tue,  3 Mar 2026 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FW4I5nNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Azxdd9Ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4F3750AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581906; cv=none; b=UKP25ZmSLafMxZSiCi/077YXqxrlXC87RX4amWx45YQz2Nec4KeiebjcTVwVShCXr5sBt8qV9VTsY3+swlc7JhaSi2rrk7wDXKbmdZanzvxB6os8XzVUXE7fx8QnhQAiecIN0KGqJ4bHl5dfWYUewOqZdHFXbm4JAFem1KvUKxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581906; c=relaxed/simple;
	bh=Bby4bIhu2hZqyUu4JjsDDqsnrdQH6/sSRvwIrlCeRrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3/FZkx9S6fWsHhn3Eo8bhASc191ABK0qFbaXJoiE+3irbkcS+r4U9459aYcNki2lCbBCWr5+W7zYq4Ya7j0DQhNYnkpiMuUcslouJ3h9SLdB7E3RXt+Jx3ea/CI14R6oZ9QQ1IDnTClz33ChqG8Pvx80eDLxEf7gSjARE5z600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FW4I5nNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Azxdd9Ye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623HBhe32787135
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tek9uhlm2h1k7JiB2+lAHLOsL/qiE45qQ/vw4e2qztQ=; b=FW4I5nNOHeX38DBb
	ebtuRtObFnn08Gud4xSSYdXxcXUD3qZh7f+H81wV1O4e16nhbJDgGjs4L0LpGo0i
	fztZ6cb7TnC2i7xXUrpAbDNepfblgTDtS66L7ty6TXE1+RgR06a+7e4XGviKHb2M
	3/L++RrL6eW76Tuj8AOnvAzgGZ2O2AxGy7mPelTwwFehMFZ2P8Yea1svqpKBGB4B
	YHvp7sUCNbCQ3JddAjEz+m7pl3J2cDx68VnwzP74Voh4nmBsdIKHr3PxPsc0mWZx
	Jh20L9FU8zy7mDZGqpSoOgsIkkFDhAXfeDE3dsqPmU5Kc3BKFDJWRXNFKRELCuvo
	b48utQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvha2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:51:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127337c8e52so8730183c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772581903; x=1773186703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tek9uhlm2h1k7JiB2+lAHLOsL/qiE45qQ/vw4e2qztQ=;
        b=Azxdd9YeEpi+Iw7kpM9tmK2QMf4FhMO6Onhdg5qaeUhswkKgnn9bfFVj6L48droyWN
         mN6M7sCFUMbXHH2gPLQe/oPSI00kWm6WBzjT/pb6QVdw2o33uZXLVZvlpLjm7GxF/Nm/
         fHbrEbJp8LcHTJgizowVOYHEc6H3Rnd0YIVRKGoqd0KLVCXMfAOL69SVgzlHUTQMV2kO
         9PETubN3wRwckTk2HmjWGI4SlpC5GDcOGxE/+A1R+iO97kMpZZnHC2gAwCCe11TmcD5y
         jEBeYQAHn7IV345jj6cJTshJYThNIOmBvD2AwLd3j+N1tDuHYrHBlTkXSgxXIkkHzJwr
         uG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581903; x=1773186703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tek9uhlm2h1k7JiB2+lAHLOsL/qiE45qQ/vw4e2qztQ=;
        b=V0R5G/gLEL+x60jLWGezNqAoRz1aRULxqIFcrL2NorEQ0fQ80Q1q3OAtYY0y4Egnlq
         fN8dAe4B1BWUcArjAnPQMRSLk/xIDofbdh3pFtRqeyOzT1Q6E+/C/kOadg7lDmKrREw2
         vOaYVOks/UKFZuLM+OfD3HiqL9Qz6AwL6gb/rRSyZOJXDSDqK0Ulq0ro4qkklNyuvIcI
         AOFzKU0p3Hif3HZ2Q9WRNP+QmMmFuQJADpO/dXuJXoYIUvRBMVE+boVckdhkfVcIG/IG
         XAXZpt5macd/RSJzzDj+ELVrljXtqjgytJT0T2UAlWGalfFcOwZht/heWQwSzPujUAqx
         gXWw==
X-Forwarded-Encrypted: i=1; AJvYcCXWy4n+nLTSpWRyTIJiUQFQ2GpfiY7lMZwTFfnNkD8vO1zztB5enINxDut/cqnssZpynh6bOd1ES/oLRFSX@vger.kernel.org
X-Gm-Message-State: AOJu0YyZy9myCum2V7d2EGYHFBEwwe6d8hBCuLiDSEsDgS1uXVHCzsFn
	ycM2TDjR0CGOUz2DyQErVNz+n52cczBEJPTeV4tUbBLNtRHw0ZJeSo2+u1criTQrODKwitevsbz
	Nuwwywbi3jOniXU/LgzmdD+RqQbymCYt/UKPcnrlRqA/Mo2X2hT4b15tARP8PeMwWt5vDHyVWtL
	g1
X-Gm-Gg: ATEYQzx8pMvvPctTz3KiC8k5iI3ES/uul9IA7C7hIfpybzZ7GolGPX+1zD0hztR8khu
	rDtOlMQUFzKuSadmH5vibZhTayg0f9yyaFnfTzgCBcryyN/6k5ZN6suMPkyHGzFtO55Q+MUFecH
	YD9yZ1Gjf6uXo2SrbnKKcnpU3m1Y5ziSU5N8odCtwD4wGqzi/JFM0AeXnx1Q7I8dIVprBMBX2cW
	CkbZCi56LZRuvOy7Gi5p9owlV3tlEr33aN2pmimekL25idgjIMR6XugQLSrrfmJNnKLY4jc9ypa
	ym72WQLmVfLEtOcal6zbMPHqB4ghlB+FpXpnVPOE4FrT93d6odZIceA9tQEPhRuFZNnZnyR5dJk
	osiHOJwYbFVZyHkeYXBbbj7HPaXWTBkE5Tlsai4H7tsRRJte0MXZY2qY/5Z2ZUFi2pgZzvk0E5o
	oU
X-Received: by 2002:a05:7022:78d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-128b70949f3mr23941c88.19.1772581903413;
        Tue, 03 Mar 2026 15:51:43 -0800 (PST)
X-Received: by 2002:a05:7022:78d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-128b70949f3mr23910c88.19.1772581902816;
        Tue, 03 Mar 2026 15:51:42 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be249ed6a4sm1984701eec.11.2026.03.03.15.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 15:51:42 -0800 (PST)
Message-ID: <b5d41d1c-1856-4155-a0ad-36acfe29715e@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:51:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
 <f83f616d-9114-426d-bc9b-42ddc839686f@oss.qualcomm.com>
 <qcrwodgyayhyd7rpfglsxkefrufgqxjcs6n7druwr46wmkojvo@263ooobucj2c>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <qcrwodgyayhyd7rpfglsxkefrufgqxjcs6n7druwr46wmkojvo@263ooobucj2c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX8/0cW+z//Ik8
 14Ggbvm34vOJ4CILkiVfh6m8wLDSAMTDBCJKQcauKsopiHm02QuPkX41e7ANj0nBW3IsBQ6pZwC
 ktcc5u+FjTptiuoERvxv5eViQRCW/p1FDGaJhYbjIPkDvZ1QbmlZamnZAlg7dZzeeme2hcpOVTf
 yPJ7SJD/in6UEUcnsXq7pPj2L8P6KWHSdHslzYOPZn1pS3cJAxYEWRotEQZCgc7vNMZoqjC/e9O
 61qBVBsFNu2ZHtP2aYdOsPfCf2WIxd3S/iDR+L9DE5lj1goY+2E00c9JtEHIbp26KtGEro8C0DB
 ef7L4smc5/EsoHyJsDM24Wx/aZ+p/Xc+UD///6m7h6zbGM+kohbWBttY41f16wprHlh+lpfIbXc
 Ohx8+Cb+SLnSpcXWDW3DEV1ziUPaU5FHesHDNOdgTDQTUfcKYUmugMW1L6OtwwR75S5PgCyFliM
 V4d3Q30qKYgXFThhmAw==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a77410 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xyu7nF3SspGO5Dy-1yQA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Fdo_M2YCZ4nfOTysw7e1f8h0koSOx1gy
X-Proofpoint-ORIG-GUID: Fdo_M2YCZ4nfOTysw7e1f8h0koSOx1gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030196
X-Rspamd-Queue-Id: E0E6A1F8814
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95228-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 3:49 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 03, 2026 at 03:24:16PM -0800, Vijay Kumar Tumati wrote:
>>
>>
>> On 3/3/2026 2:31 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 02, 2026 at 05:51:24PM -0800, Vijay Kumar Tumati wrote:
>>>> Hi Bryan,
>>>>
>>>> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
>>>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>>> As we are cleaning up the PHY device nodes, we should consider fixing the
>>>> power domains as well. Although TOP GDSC is defined as a power domain, it is
>>>> not the power source for the PHY devices. Rather, it is the MMCX, MXC and
>>>> optionally MXA based on the architecture (Refer to 'Voltage rail' column for
>>>> PHY clocks in IPCAT). There is no
>>>> parent-child relationship between the TOP GDSC and these in the clock driver
>>>> and it was just working as the required power rails are getting enabled
>>>> by/for other MM devices.
>>>
>>> Which domains are required to access CSI PHY registers?
>> PHY register access requires the PHY core clock, cam_top_ahb clock. So in my
>> understanding, we need to trace these clocks in the topology backwards up
>> until at least the RCG, and all the voltage rails powering these clocks will
>> be the required power domains. Having said that, just register access works
>> even if the voltage rails are configured to the min level, which camcc does
>> already.
> 
> Are they not gated by the GDSC?
All the Titan CAMCC clocks are gated by the TOP GDSC, yes.
> 
>>>
>>>>> +
>>>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>>> +    };
>>>>> +
>>>
>> Thanks,
>> Vijay.
> 
Thanks,
Vijay.

