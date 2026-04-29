Return-Path: <linux-arm-msm+bounces-105097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL2iKEmD8WnghQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:04:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABF48EF01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F5FA304BB8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 03:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A35219EB;
	Wed, 29 Apr 2026 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqvbxoc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdGdIrKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C621388E59
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435121; cv=none; b=Eac49UHtGXLvzSljK87/SWAF/Ucr6dz1hjntRmNrIR/Ni4KMAvs762VybKWxUBhURjNb9J/GHnuRrfnPclqqlPszQqeR9hRrBIImaVVp2FqOKJuK47ZF9GMchwnT00rVFilp8FM/7tzMQqoaDwiZVWuN8gekFTMuFbTQPTC2Alw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435121; c=relaxed/simple;
	bh=ZCOByCBmJgU5tRotLIWofq3KXzb8k8G+0DVRt5ppUlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bD7GTr3nMrUA63TMM9RFfgmKGFgB4VXmWUrICghpThDb/2GOQg2SvDXuWeKquOtU5U+e8HFSFzcahxtQD5vqnj/GIN7JqXJCq/eb2MLtFVs6tg2Yq7e5Dnx67RfxZD9TxQO74+qwSsl0KCL4uNw/DpPgcVE2DHlxbeQa4HI5MCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqvbxoc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdGdIrKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T1RYP63634329
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=; b=eqvbxoc5JxzEGYK3
	Z3LPORgme9LVEUOdCg6GUesvAfbnL11p6vaWo4T0AWiul/sH4A1pp7YTBWbkYN4F
	kz0f21vgUmH7KSy0BG+uhx+0fBv92POLKFyuZnRCWIwfrdNafuMuLOutu76Bk+uL
	DoC9WkR4nSHrYJZvzp8l7pwtrR4kSh6oti/CV/KNZmS6zUN4M+yhV/S210FIT7Rx
	Dh7FyxH6kBbYZs5nB72FiMMQi6ystl75Um7QJEpaxDDYIlwHJFO80EQbnrpu1Eua
	NpKn9/14FqIW1I0ASIA8quFAyBuMztuYcTxtIFCIuX7g0+Bi/bzerxOQuwMt5oVX
	wdF/6w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dty87tdrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:58:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7985752be1so4887430a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777435117; x=1778039917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=;
        b=AdGdIrKIa0MHJz+3HFVPxlVxBtINk9KbY19rWq2+H6KB4dNbhEmQ63WVgf7pbvYlvE
         S+czzQOCwEN90HbPorCyw9/huA6DGg6zGeJ8uGQO5avMDSqoCVF3KznjHVWHEEysFLQ7
         MKwqkjmWbyB/49e7D44N8l329vb8qSNYy7wgbyHJWpMOCisyt1dcPw0kVqIHvfDETGei
         G31Cb9kUgnhYutVZFOT9Yp3pgAtDLSegFqs4ReJYeT7JYHmZ6Uqs1jX+NvLUjkZB6WXg
         g8gE20frDp+IY6QwBT/RtKSeeOHwuboUcxmaCEq0SbV+nhihRuwukJ9HEi0d7T9mf+RJ
         yLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435117; x=1778039917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3kEYLGfACg2uadnFQdqQQ4tRsbnjuzhQmK8R76cMfA=;
        b=Zxh+4mxSWuwDAaZx8Ushqi8ZPX7X9VJGn/jgCvw1WvxciOM4WdLbBz5VgSYM9L9785
         eupk1q6W3+xfGOjzmFolETyx9haHAmM3rkoF75D6l0sOPPZiOTCJvX8b7a4kcaesNIZv
         Oo7S+ij0EaFyt7RW9rJI7pdKNqCy/aB9/GbwHTkZaLKIjIDG7omDA3vaZ66qCepTjq6Z
         iAeSYoRamQwQzLoI+ocY69pkU7Q7taL2hf4hBYIsL6Vr7cnWxX36rEAsumE2roRFympf
         84d4kkLxDWT8QgjbRrGkl2iG2oN19daDgcjLABVmlr0geugB/juff0V6vTPMPHmNDQ9U
         Iu6g==
X-Gm-Message-State: AOJu0YzLIFkgrIz1LmTlunFj0GoFNbsbPuduZDHjggz9k9hQPLPdbCY1
	hZGs0qP/fGv1x1YGmcGsFtDO/aM9gNs0jOpoWxq+I72YCUF80PprEsZ4KmqHkvB//FIGPjnJaxm
	OTLkcRP43g+CnaIwD5X+i72cBiOY3agts0d6vdGu3t0UTUFRstXRt2AIf8hVrTftFEUX+FYwFZj
	5+
X-Gm-Gg: AeBDiet50b6fk+m8D5pDIRigmBwZkJyXnS1/mUQWPWxTDC2MZ5DZtm3aXsud2hY/Tv8
	dUkKoyKGor/KTTfNF7P4/R6abx/yc/qLOOOHcW7uh6cUj4y3WKET6ScKJHuxGLaXa7h92fSJeyC
	4bmK/bAPmd7rFY8yHnzn875gSzQxyM3PVWKiD56aaiF6Vq9gDPUehR3FpyKeMLWLJveki+zdgiM
	ZC9EsgFShb/L0W0RswDnXNu1sBEYbSqklVOR4Fqeu0DyfkEdF1O88NujYFqVmynMB/GlJ4rDGQN
	z+jSlYSWvg5aWC2/mFySp90na1rzFWfnxQwLUsvkkYWYS+vmx5QYrIWY3DOUT1jICJd41nNMpHP
	De9x66vkzJsDXTfX7HSH+Ki3R2gfnp0wV46J5NN56PFODX5q1kpBuyn0oNBwr5fjgI4BdZbHe3A
	==
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr2079189b3a.9.1777435116653;
        Tue, 28 Apr 2026 20:58:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr2079158b3a.9.1777435116101;
        Tue, 28 Apr 2026 20:58:36 -0700 (PDT)
Received: from [10.48.22.70] ([27.60.165.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed85c411sm657051b3a.41.2026.04.28.20.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:58:35 -0700 (PDT)
Message-ID: <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=abJRWxot c=1 sm=1 tr=0 ts=69f181ee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=XvYZRKXU5Z7yJT35SDuk6Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vUSe85TNU2mlbxuYXrwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: hKyp6weiqZD1-4k7_7fg0F5C7i1asocr
X-Proofpoint-ORIG-GUID: hKyp6weiqZD1-4k7_7fg0F5C7i1asocr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzMiBTYWx0ZWRfX5b4OEldSf4r+
 oOtz33mFkgQ05ZzbGMcgNR2dqmIPpZMtdR2UGpnYJGQWslObTgfZMgbigOgB8Hy1wdV3BYu3FBb
 rmfhzQCx+blUHBo6SBDbzULvpB3AZYV4CcVsoIij3g/BMn8ApOCVqf0hdtUNmotuyA/p8PNBYAj
 N73kO35n+MpqnetkEmE8E/VFmEO0fR/K3GE8CoxVsMymlyKRiuYy3X9ZqnXuDLAw7ZTfoLiOJRN
 HIXoMprayXGpOzsQAcCKpwGTpCJSVz7sFyytn0DgpOS9fAklOObwYcT5olEWu/8cFqdKrfHBU4H
 7T/Lr3hH4GF+Yjau801yYfXPfT70O0tSU+lf84SAaw/E49kd6Szh3BudtMdhLnldkvACSmR8oF0
 v2jBYyDismmsdxm0J33/DZPZPB9Abnv5sSH1ho+6EEYihCjS9oiFpB0kc5ybQHDQh/FNNW5Fj/d
 Jy30JKuIcdHA3VUjiHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290032
X-Rspamd-Queue-Id: 0CABF48EF01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,1a98000:email];
	TAGGED_FROM(0.00)[bounces-105097-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.053];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/24/2026 4:51 PM, Konrad Dybcio wrote:
> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ9650 SoC and
>> rdp488 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> Overall looks good, just a couple comments
>
> [...]
>
>> +		CPU0: cpu@0 {
> Labels should be lowercase

Ack.

>
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> You likely want to add #cooling-cells = <2>

I left it because to add it along with the TSENS support. Do you prefer 
to add it now? do let me know.

>   
>
> [...]
>
>> +	pmu-a55 {
>> +		compatible = "arm,cortex-a55-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> You'll need to do something like:
>
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

Thanks for the pointers. Let me check and update.

>
> [...]
>
>> +			uart1: serial@1a98000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0x0 0x01a98000 0x0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
> nit: please keep a \n above status

Ack.

>
> Konrad

