Return-Path: <linux-arm-msm+bounces-95048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fPWZM69xpmnLPwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 06:29:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B311E93A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 06:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B66730692C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 05:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB332ED87F;
	Tue,  3 Mar 2026 05:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMzYkBoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZ4tMA8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E73BB48
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 05:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515756; cv=none; b=bBTd+UVnF2D5FsDLxvcJUjol2iyUGdEd0bRNWrcfVrvjpZ+ejvphD7bYSl2j14aFUR0R+g/5+NIRsx6JZ2pd0541Dv9rkn8BwgcYFiCFaiS3tfC63a+fkOEEYI++lF0j4yjhAmc9UdQwIYgkykpQ/qkgoQ/oGHVHya/51LrO3gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515756; c=relaxed/simple;
	bh=kMYCg7I2kPwDeCvV2K6Cv0ureERWjK8HbaaRV0rsZy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXy7acBJr2HENp2Cxe975xh8CkRaZcWy96ebjEahLyLGsjlba0EBCnq1sXiXbswRTAfwBn6yV/YJidff85OZ8OlDJvB3DX8KdO9QZb3dwzEIfWeJHrLeE8XWZ+GXkmXtHhnoOq++avPulRGYN8lNmxIVnsOBdQPdJxJCW06+1CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMzYkBoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZ4tMA8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623539Tq3362548
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 05:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVvQbdfjR71xwh/hnLqQ/BK/FfNPjqN0HqaVUrwZXiE=; b=KMzYkBoX4KA0ZlXh
	WiMFJeACYavAdvQ7/yEbey4kKhxZV1eECosd+lxuIHZNVbyxw9Ok3LBbswEULrak
	d+KyQA+PnonwNdgsw6fX2737pZ5FwjbFRnx3IxTdb3UGI7bw2VSWyVHETY2PKsT5
	rCrJKHEP+/VzNJth02qvb8jUr8/gaJv93LTy2rVugS3egZHKcv2mObEx2C4767h+
	jYkoYhQ9zxHIM4z3gCZUmyHxlL3mi+KAdj7+EOUJIDlBZs0WGlPjD/m9FleLHwjA
	CWhzFpvNB9fV4ObjtLHU53n2R3c+KyGcj/5Rer9qFvTKvWbltTzl34UMlq+LQWXj
	EzeBZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fr276-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:29:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so26605345a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 21:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772515754; x=1773120554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVvQbdfjR71xwh/hnLqQ/BK/FfNPjqN0HqaVUrwZXiE=;
        b=aZ4tMA8wJema+0o2n70HZLRWuwb+IoP/KpIjCpKEgSI1u6PKnPOa7YPaOhztENMUcM
         D65Gbr/XLQ9wdjSayjDzrIrKaWut/8nFKSF1E8x61lKG5TGPgOyiXX91SJlh7CcLeI5m
         mYp6YaxGYOwFGVnxzCL9TD1n0tKaP1wQ3KPxpts5R2xm7NLs2gHRDCF5CS0XpnQmPZ/v
         SKe08OvS0KXLNG2d0PUDOeIZKJfthRdpfUPaOb/ZwdmnWM3DBUMZPAWFH5bhtcX+i+A8
         M/Bvn+Srnayqbm9AGNEMBqrHtuM7JViY5X0V255Nw3v+udcB55I16HeyyxD7R/PC+XFH
         +JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772515754; x=1773120554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVvQbdfjR71xwh/hnLqQ/BK/FfNPjqN0HqaVUrwZXiE=;
        b=l113CQrcv4pQiZUzeAjvWcXkcffMqHAbv40clwS/w4Kt+4iQMaL+kRdlvsiuAF3S+8
         LT/Av3+o69/Hught3L/vD27r23sQzj2vSHthlLt46hlBTtneSFwdv0o9TnBAQ4gDS4hp
         /P6kts/c4P+vVpZpbVWgzRRJbB0m07pD9idFyGD89whAliCrzsyysWr07tzApEwXKzKD
         gM0ZKMXPsdTH2vyD1BrqqkIF8GA2iCGbHyK1SHjaMm+ZrZaILI54mUtXwxX0nDIPKPAK
         5eJ5bLqPBcZy1t69eZIOfeGfx/1P8byETumqjtZ50AosRDNjhCubUC+e/eJmaTv0n+kb
         ZITw==
X-Forwarded-Encrypted: i=1; AJvYcCUHTntmut8m/HNkckBv23hK3bocca2lThAtzpam9/OYiVIFGpgipAH50lLPcQR6VsE46Gf/PdJzqP77J8oL@vger.kernel.org
X-Gm-Message-State: AOJu0YxeE2onyoJcu85sqenUl3mwXwNCfRbm/zJLWBRCGq5tEGTQ2GOq
	e1w1LAiqAfPxb3gxdNfXVMxL3XlYqhHO6VjJqPW8dBAiaM8oQiF5qnoQ1xJi1QZX3it2YpZ7066
	k+tbBI4k175Gt6fUX5Pwyp7SXF9Ym+ayDcJEZwYlh6G7m3V+D55N4DmLnw1z4psRmyVQ7
X-Gm-Gg: ATEYQzxfr2JIhFvv+koVt7qZJ0DtbluYm7xW4iD7JDH/DDILEeYND0eV+tv1jS+1Rfb
	wXFwXgFNtGxfSmQnO1O7bc9GxRNdOFAnb7AwMf/IYkyKBiCZDbpDl0ukxniuvM81dsS6kzedyFj
	r1YuH6GEJjCGUiZCn9Mc1tOP2d15F9T0tI68hgcpjEiYQyNG9ICa0OU8Ji9v1r9X+V/yiyK+fe8
	xm1derfjVt1GFoFntfPFCqRbBeLnGDeGbdSUO1DnWMD802GQX5PCVY3nWtsRMAMGNLcMqWwtas/
	yv6ASYxXqXmEF3IqkfCtvPwEw36YuOoGFfzD+W+64AK/91x4DQDSIgoZ2PpTelpBPyirQ1tANll
	Wp9ABuVdgkOjcSjeh7NMDAyibwAxVqLzUMJEWQFCiLEnlG5/h
X-Received: by 2002:a17:90b:51cd:b0:356:1f96:9fdd with SMTP id 98e67ed59e1d1-35965ce17f9mr14084417a91.33.1772515753691;
        Mon, 02 Mar 2026 21:29:13 -0800 (PST)
X-Received: by 2002:a17:90b:51cd:b0:356:1f96:9fdd with SMTP id 98e67ed59e1d1-35965ce17f9mr14084387a91.33.1772515753194;
        Mon, 02 Mar 2026 21:29:13 -0800 (PST)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm1103599a91.16.2026.03.02.21.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:29:12 -0800 (PST)
Message-ID: <5de8797f-a131-4ad5-97e8-005b751bdad5@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:59:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
 <7dbc0e99-cffb-403a-be7a-27d1b47712fd@oss.qualcomm.com>
 <8d658491-bc1c-410a-97f5-bde1a00764b2@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d658491-bc1c-410a-97f5-bde1a00764b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a671aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e-IyLFVPmCgX-Kw4_c0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: R6gCK-g2QB58esvw-GgZ9nmhu01wosZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfX25KLRPyVIJBZ
 g9Gyh9njER9L698hNmkcqEKPp3TE8TesDDSUJ2P2NhRz5e6wAQbRSdPeG9aZcop0iXOc7EqU1Yz
 grCxtblF2VGOTZWdUmIE4S0HZqEwmwqN5KTRwGvatAdTyqbro8eHnCi9k9hz/3/WlAEK7hKtIiy
 lQz4md9OCxJpj7RSjsj1bcBIbKyBZtsP3pRhQNFGhvNEVZjPxqcc3Zi80n9JYwy50CCnDHRHG8Z
 EsvbZeIQvxHxVJ1THNst70I7O7P/5U2NPXOUT2hUUuk1h/8yKIkzRMOUyL8VJXBSBKiYFrTz5hb
 9PiWCKzxI1swwzTbKg9dVkCCEWeKRKP7HmG7GgzmGHohW6l0M8XL8+zxHOFAW3bCXdKPG3E7BSK
 BKx3iepXz1t/lYB7tX69sMYTwj6qNtdn3K3Wk87+uJQEGZFdjQ7OGuNXOXgNo1x6A0zOvxF/D6w
 x0IMsQ5GHxlfTgVm70g==
X-Proofpoint-GUID: R6gCK-g2QB58esvw-GgZ9nmhu01wosZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030033
X-Rspamd-Queue-Id: F3B311E93A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-95048-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3d64000:email,aaf0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/23/2026 6:51 PM, Konrad Dybcio wrote:
> On 2/21/26 7:22 PM, Akhil P Oommen wrote:
>> On 2/20/2026 11:24 AM, Taniya Das wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>>> is simply a separate block housing the GX GDSC) nodes, required to
>>> power up the graphics-related hardware.
>>>
>>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>>> needs some more work and will be enabled later.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 64 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -4,7 +4,9 @@
>>>   */
>>>  
>>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>> @@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
>>>  			#power-domain-cells = <1>;
>>>  		};
>>>  
>>> +		gxclkctl: clock-controller@3d64000 {
>>> +			compatible = "qcom,sm8750-gxclkctl";
>>> +			reg = <0x0 0x03d64000 0x0 0x6000>;
>>> +
>>> +			power-domains = <&rpmhpd RPMHPD_GFX>,
>>> +					<&rpmhpd RPMHPD_GMXC>,
>>> +					<&gpucc GPU_CC_CX_GDSC>;
>>> +
>>> +			#power-domain-cells = <1>;
>>> +		};
>>> +
>>> +		gpucc: clock-controller@3d90000 {
>>> +			compatible = "qcom,sm8750-gpucc";
>>> +			reg = <0x0 0x03d90000 0x0 0x9800>;
>>> +
>>> +			clocks = <&bi_tcxo_div2>,
>>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>>> +
>>> +			#clock-cells = <1>;
>>> +			#reset-cells = <1>;
>>> +			#power-domain-cells = <1>;
>>
>> On Pakala and newer GPUs, we need to scale GMU (which is connected to
>> the CX GDSC) freq. Is this DT description sufficient to allow scaling of
>> GMU OPP?
> 
> No, certainly not.
> 
> I see that GPU_CC on this one is exclusively powered by VDD_CX, with
> some MXA backing, so the natural course of action would be to add a
> RPMHPD_CX power-domains handle here. Then, voting on the CX_GDSC will
> propagate the performance state to RPMHPD_CX.
> 
> Taniya, I see there's also some MXA backing. Do we need to scale it,
> or is "just ON" fine here?
> 

MXA is required along with CX and I will update the bindings accordingly
to take care of required power domains.

-- 
Thanks,
Taniya Das


