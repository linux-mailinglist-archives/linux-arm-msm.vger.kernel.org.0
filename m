Return-Path: <linux-arm-msm+bounces-104412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL7hEbM662nRJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:41:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D845C5AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B42930143EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1618838B15F;
	Fri, 24 Apr 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU68V2J0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQqcNEpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8135E37CD55
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023658; cv=none; b=msgRNWaic6DrsyfajJo7rf10KuvTd9sO1kGzN3rzIeQQ5m/1h2yaSyHG31SKVV+U3RGsOS07gBKkc61ma2GVhald7H5tKgSAx15KTvWBEzeXxqoSqoTnJSiU0czkxuhXcJSMq1hEs8vszsn0cLEeY3Oexv7AY0ZRc4LYJ9t228s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023658; c=relaxed/simple;
	bh=Vf9H2UG05qoKr398eIXjoUC57YQbGM7DmdYxZ9Ef0Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOjTtiBE2Q6R7UYGZGy5HqIsp1JvznasSF3aGjpvyOXAr3Id9fOJQLljtFFW3HHhMUJD0JATDNpemOGV7Jlz2SwlCNB0qZ6LYVKqh6LOTWbLyx7xww+r8RUUYSihTH21ayhvTsZHznDBqfA6bUW91kiuVjgavyaIlawT6h7/tVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iU68V2J0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQqcNEpR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9Umxt519555
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUhERKpJzC7ZYA/PnGzU9lEKyH7Mxyrhg7LHLvtN+QQ=; b=iU68V2J0hud5/fJy
	nuvb94oFVoUDgL7peYgVg3ExtzCV+kGhH/+iaNbTHa4CCtIV2bZxsaxaqriRbh4t
	PJ5BTc3jH7ybihihfQ0fAW7sjC8m94cNisCxHCTPkoQWqEGzNddAMA+3Zjg/Pp0F
	1tghCwRagqdU3BCG8qxjQGxJGbzoMa+h6ZhsLCktXN5uXjj7lBUbQph0vTqHysRr
	1slNLPgbnTDFYeUj6Kc4kMaItlFNy75CT+SFAYrb+negNIf5VrwJAnKxiCnGo9US
	5FV+8Lm2hSwYU+KlA6ct0Ymy7MFXaYkPnbUxlE78qp/3AGE9TtWpRbzixFOOxkkQ
	DD36LA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhdb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:40:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e429ba4dfso12017421cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777023654; x=1777628454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUhERKpJzC7ZYA/PnGzU9lEKyH7Mxyrhg7LHLvtN+QQ=;
        b=YQqcNEpRoItbgZX95Oy4MwWuT60XpuDcklvr+9GNFbJCyP1nO36kc4XzqrTBS3tAAq
         TnzO3AnXo4b65Wb4gmW7vbSNDqwo9GnJy0TVSjDLvKYdqyJ63N3NuWnLRKitk3xWExgf
         8R7BjWZMKITl224fh8T7AZ+158wVPrzgCrPBwjUVOxTT40eqmxzBNKZ4gy1aLW/5NXL/
         NNJX0HuHzZ//G8jUCS5bJOH6yyNJuUWI1f13aeBBegEn9/B3b3STW55ZjSaaV01MQVuF
         oTSVw5u3k0+yeQpJQZYTA9Dfg3peEmiwUu70oO2vBCOQ+Mm970xJbf6U3DKEyOrBVu3m
         FStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023654; x=1777628454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUhERKpJzC7ZYA/PnGzU9lEKyH7Mxyrhg7LHLvtN+QQ=;
        b=UcihGGDjyDHN4FGXNKfcQA5l7798s5tqtD30aol9VZHTV/1H7QikCxIz36L2Ap9Upv
         DVzVKXoaQ1Q6F+Cyc+yke0D4ULU56qv44FWzsTEropLoUlXI68D+Luz2CiQxMHXmYGDH
         +Ee+0I0/bPw3/9YfY0lTxqJPTmp1ZwFDdvXlk1VeZ81xNrr6Co9d1tdXDLvKgpMo9DR4
         ZueK4FOJ6aDQ3JxFe2EdoUrIXUXB1v28+c9weI2p1Ey5esMdqb3xFr7boI5BW1MTvBcn
         rgEQELJLNA/qrrOiDnycMFXW1k0VvWkRGqpMURp2Fn5YGN/C+vTm0HkV0EFGaxK5Ez72
         3HPA==
X-Forwarded-Encrypted: i=1; AFNElJ9XtReVj2wvNMr5sCowCP7GN8b/op4mrJzCZA4E9VG82yBMRoKhcWIAfoaVIokD20fjxeJS10dR+KGSO/1M@vger.kernel.org
X-Gm-Message-State: AOJu0YwuaEd2NeE2WAvtDRfZQKWeoKqLqiOIdNo6ohYnpFWRf7O9tY+M
	4kvmaub5xsclHnAKCQRexGMrFmO9E1BajbxiRvyozFAYn2DGWgJrvJqWVBgYjSgSDnXgoEvfn6b
	P+qrLRymvOlgOQDPdvwC1g/qHXsSWI8H62xV7ptvgD0yVlbVxiMNavsO2ySROaqr5efu3
X-Gm-Gg: AeBDiev+Hahe0lUIjQ2w4hZ4nCExyj90E6b4LIZ2IJfgjPj5MMP4zDrNAIfdis/TZBl
	kqqZyKm3lIge8pTx5OzJ5E0kTYWdmTDiYXCyx3/C4RXQf1dUuJMydyeTWFmyVosfpY3Q3x/ZhgY
	2lFFDuGVYROyU2NsE61M0mgmTia9A/TG++8ZyuH/pvPUudNXZKd3xmPEB+xLmA0ucSMGgF/qwPP
	ZBkRK95CEIyV5Hh40VPu/cI+stuilcxqoScD9rAhaAWOf77xL49xMYDVxKOlIAst5CtgxRtj8Aj
	f0Tt7Yqy0KAnaVuG+gk1KoZ1DsLTwg/T9KdNI/eIALMONpZZ7n2xevmmX5xj4IILJ2MQL/ZbVKj
	+WSK++8iqHCCw8OJAW1y0CZnyuLdo8qu08T4Nn8ubHwEu2gc8WVtS21pbJYz+3qteFEfknLCTYA
	L9AHTw3wb7mHUDaw==
X-Received: by 2002:a05:620a:4589:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8e78bee4fc9mr2868065785a.0.1777023653812;
        Fri, 24 Apr 2026 02:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8e78bee4fc9mr2868063185a.0.1777023653393;
        Fri, 24 Apr 2026 02:40:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d4561fsm5009428a12.16.2026.04.24.02.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:40:52 -0700 (PDT)
Message-ID: <31c1a601-c249-426b-8f0e-30d729907a89@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:40:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
 <23fbb36e-56b4-4ecf-94e9-4038c6311b31@oss.qualcomm.com>
 <oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb3aa6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=aOPa8h4f5WR7Ygev7eEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MCBTYWx0ZWRfX1jCBYaz8rvko
 Dazpzbnq9uu8eW3GvVi8eqW6p1SmYt2PijiUPQky5UmED4JJznbH0FkDSsEuiDG0i/xypxwD0bd
 o/e4fMGJADx8/B0khUh/oC4zk+bXI7EFQfrVIp3dM30PHXDEyxadr9jKHPk4HE8x4Bcx6fdIYXG
 uWr0MQtx/txCCkJoFcCMi2Qeko/3rP5GEPaQNl31uu6prRyu09owvvEjs+Ja3aC6wqjX8QgTo6j
 a387dzMdzla1GsGSWscsg777nA6RescTXs1b9+n9dCntqR7Dg7YJRSqa1RjemNUDHQP1DKcNL6P
 NkQYessAUj6DchiXQujo81vFPOyLFm7XtplymsnCeGEZwLvYzPWSYg9Sg5sMpqnCj2gYC+rdqNk
 29JFE7RiBriFFePKXh1U97z6K06TcdslR92IDHW65vSmSlJwRTGqBjfvPwbmtQY6DXcCOHuxm0F
 weSLpGRVYxpcLEeDaDg==
X-Proofpoint-ORIG-GUID: twGD9OPyxxji_O2EYT9BukIFcbsr9xC3
X-Proofpoint-GUID: twGD9OPyxxji_O2EYT9BukIFcbsr9xC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240090
X-Rspamd-Queue-Id: 089D845C5AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-104412-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,pm.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 10:34 PM, Alexander Koskovich wrote:
> On Wednesday, April 22nd, 2026 at 9:04 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/16/26 1:05 PM, Alexander Koskovich wrote:
>>> Add catalog entry and register configuration for the Adreno 810
>>> found in Qualcomm SM7635 (Milos) based devices.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---

[...]

>>> +static const u32 a810_ifpc_reglist_regs[] = {
>>> +	REG_A8XX_RBBM_NC_MODE_CNTL,
>>> +	REG_A8XX_RBBM_PERFCTR_CNTL,
>>
>> This list matches the expectations, modulo this RBBM_PERFCTR_CNTL
> 
> Note on this, added this shortly before submitting this series as requested by Akhil:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40613#note_3395308

Yes, I forgot about that bit. So it's OK.

[...]

>>> +		.speedbins = ADRENO_SPEEDBINS(
>>> +			{ 0,   0 },
>>> +			{ 242, 1 },
>>> +			{ 221, 2 },
>>> +		),
>>
>> The DTs I have all point to SMEM-based SKU checks. Did you find these
>> numbers empirically?
> 
> Yes, and I used speedbin instead as upstream doesn't support the SKU checks
> downstream does. Utilizing GPU_CC_FREQ_LIMIT_VAL to serve as speedbin
> on this platform.

Hm, I'm not sure whether it's a stable identifier on this platform, or
whether it just worked by change. Akhil?

Konrad

