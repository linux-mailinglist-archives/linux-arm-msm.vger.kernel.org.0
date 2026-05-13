Return-Path: <linux-arm-msm+bounces-107259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CD0Ms9aBGqjHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:04:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F7531DAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA830300C82F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AD637C0EB;
	Wed, 13 May 2026 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ch8w4AuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZz/LUWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4BE37F72F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670027; cv=none; b=BCVybmvMM0iR2spVAkOn6cFJk+2lmVRbgwkZp1lNal/hKoD7dx+BO+G03BLEOCwWyw2EfkMcpVLEuWiPGzY38CG/Gv5n7VFFqcbAl0SMqjcmTYtBaJEm1ZhgSE+S0HTozzXv7E3rg4UzdUeQdBZAcybLjhGaai1Zu2w5hjzEfJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670027; c=relaxed/simple;
	bh=yt2x7cHtd96/kUcJkMEIM1meLw6bUQUeIedyEM2TIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqCC8RVQL8CYNZFmL0S5jR79OYraQreGICskkeaD4BfXGzBYbi89LqzaOzYDAttPLow9sjZGtAp3dqTzhfxlliINB9lpufvhusA9+JBGWNqSDT5EtqmXc2fVKQkihs+fAHDFJ4NmtDazMYESxonwgcT6p3hTORW57N33cPuhEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ch8w4AuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZz/LUWu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVOsc3430231
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yyfwuNihNlS+U6UDbASjReM3
	6Po/zUqBzFqCxRvlu6o=; b=Ch8w4AuGigSzAr32yzYxiSTWZ2Q2is6XbuO5942O
	6dIk/RHFsaIVLDNQBMhQ7+Jy0v8ZioKJc9fhe7iCsmJNl6CNODB+Jd2vAvWpjoV3
	Nk8g0HNtnEjlptmUHxuI4gyYuB+Nbdy1LIp9Q4cN0VIL/WdOIUQ8clSONL2IrIRm
	mYsB2kVbRpEnykIsOWxekk5vKh0xgJTnbRWVMUNXl0UtIcGjCiI326PxMJ64S0xv
	brQLREXpkr5+jxfg+WEYAsP67D8RtWEXUbsBLsulsr2cWN7ODHniivI1PrC58j3u
	PHthB+2x5dezWABnn4UNC6bwfFvnsn4v8PefQnr3RyZm2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg3ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:00:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so127946651cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670024; x=1779274824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yyfwuNihNlS+U6UDbASjReM36Po/zUqBzFqCxRvlu6o=;
        b=iZz/LUWuAeVWg9pgtRQ7YoLn4Ll5s5g4YZEI0JgR1uDSeJcifnXxwMQwDjyqLxE6Gl
         NzgMHoyZ9NNjLIWmC4uQJ81A7Yv2vZkvJ0Hs8rS7nwMHeiTkotxDj+pZfrp6ayUuXmuO
         yCM80psqknLnulgvP5o1shL2g0ozT9FKb2UYnzpBSW5E6uxzO4tlyA0Swi1bkRpbmVit
         EE4Q5aqIVUqSi9H6GCVMkjGaUBTsLHTLR4TKzLZ4R7vLX0hCAwuU+6E0/fsH9kVSfy4/
         XKMI2nXV0IZYa0vRPogC27zlJwLdrwSDrm0g2u+AEw2OruPVhJ5MJvLs99nbWEAkKvZY
         oiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670024; x=1779274824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyfwuNihNlS+U6UDbASjReM36Po/zUqBzFqCxRvlu6o=;
        b=RdkbDVOYPdZzJl8YFf3yDu84nJIFfc2qxDdbGkhfMHi5aSqcTtIdqmf66VULtp5VJ3
         7mu7kZ7G9DmCFNUvfrapFqopGZ7bavK8cKIFgRMzWvSpr43PNI2TISKcX90xPk2DKJi5
         mkH4IfzFoIkhtYcq6iOnbfnDLAbmj2C1cog6gw7qxaCy8nQvhQywCdOV0fZyN0o8VthH
         0OYgzDhhpQJ7jbfWUMil8qwNrjrl5aqmgJoAvmV8k/z44BYpEGbrMx7GTi+DyQlscrKK
         G198PzZuDyFLQCaufXjUta5mVEbZRIdXgqyfjkRrES3oETslGrBCHb0ldaBEhyAZfFzK
         rKxg==
X-Forwarded-Encrypted: i=1; AFNElJ+yRJv4Ht6zgAzby1siwt9DHFlYziPU+C7SyfIr1C/Elo31kstba3coYxvyzorYMhQX1uoZwdd60pyMV7DU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8W6tLmlkdwn1prkH62XX+irvTUZrwH71GH3u9B+8LjYGHaZW
	j2um257ulE2QtFawrn3A4j1McEAsXeuBaCG3hzgEmOHveQAsLK7ZhotbTcnlFGVupva8bXhFr0R
	LfRFuXesApII/tSqbLap2Okxwy2cL+fVKMKBQcY2oquPtqwq4Xs0pR+VzODeyb8dnTJUY
X-Gm-Gg: Acq92OEczttXXTEIuaCf2CFRFMGzMjmVOFCV+xicBzt/lT6rL9vKGg0GXLbDamAtfSE
	APWmHUM3RCJTACADkLpFPJt2JFLergT2A6FZIx7oz4zx2rWtjgoxKYgsOqQTZPztmcXiw4y7NMy
	H/4p0bvKBZKR63ejDeD29dXjuvzvtT1oeAz/snUor6StRwdsB4/6JwA4c32gIxJ7EXmHBafcmvj
	n0UhViWoVSkyNJY066DWHESrHJbtyvGxfnwnLWF/Ug+blFpo9nyPu+JXU2+Sm0SRay/RqqJMjFH
	PYXr4hVa+6NCaeh6PyWMvG70V/huHagE3U+WDYarszCxPmJIFPOT1rHBqKDngyW0eaauU79rV6T
	sFuI1I/zE8cMhpKitt5dUoy6JOEdHRpTBWmvP5O5VTSl2nhQhW6D0YfsIPLXz/aRHTkw6p6L7QN
	fpdNIILxTo6wzKWbRdaozOWe5YpNcL4yhdK00=
X-Received: by 2002:a05:622a:5:b0:509:965f:888f with SMTP id d75a77b69052e-5162f2a4b4dmr36745501cf.0.1778670022276;
        Wed, 13 May 2026 04:00:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5:b0:509:965f:888f with SMTP id d75a77b69052e-5162f2a4b4dmr36739091cf.0.1778670018592;
        Wed, 13 May 2026 04:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm2517463e87.22.2026.05.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:00:16 -0700 (PDT)
Date: Wed, 13 May 2026 14:00:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 3/6] media: qcom: iris: Add B frames support for
 encoder
Message-ID: <vayghe665w66b2whefdstroyrleozjzfye4t5ckvjmju2rnftk@mxquiebncit5>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-GUID: z1QnwX0XiAO8ywS1xaJKUDO3WndURV12
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a0459c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=fARREy4TeX19WRZZn4cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNSBTYWx0ZWRfX08KmVNLB2aEy
 7fk/RUPT/4MLHZHrCT7gvuiE4vZyFHrTjh5UYqfC5frFndIKxJIsQAd3nOn+bIJ3SpDZcZfnZXZ
 PqvGX4yOIOnAXsnMGHJoQn6rNYc923muyDWv+LuN4GFCGQk3Lnn1avH5POe9JtbFsWN9Q3uTAUK
 4tkc96L6iZZdcFakOrzNNneaqTW1p+oru7AF/FbjOh/AkvuPqKmHtC8oGHCk6w2in6lRazcYAdW
 LY3fQMZernU+Z2B+o+76w7HoVb8FDm4voDUcQVb1kkdJKpADlPmfJe++ZXcmTligioBO+Frqjx8
 OxxkqQefHCEqSgNo1mw1XDz/qZ2onXuFc5zJ7VjwRUvYhfCZmP2vQ6d/j4qmYPWBDN/QbUVUPT0
 AdlTgzAA6hWX2oQzRUbUVb1MVANH2USqq3ct+ViPCWEzNlk8kM44t3fbJ4b+rvmaJulBQqaZF6S
 ouueySHI8TQ4WedxjEg==
X-Proofpoint-ORIG-GUID: z1QnwX0XiAO8ywS1xaJKUDO3WndURV12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130115
X-Rspamd-Queue-Id: DA9F7531DAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107259-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:12PM +0800, Wangao Wang wrote:
> Add support for B-frame configuration on both gen1 and gen2 encoders by
> enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 18 +++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 10 ++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
>  8 files changed, 84 insertions(+), 1 deletion(-)
> 
> +int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
> +	u32 b_frame = inst->fw_caps[B_FRAME].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_intra_period intra_period;
> +
> +	if (!gop_size || b_frame >= gop_size)
> +		return -EINVAL;

The same comment. Maybe I misunderstand something, please correct me if
I'm wrong. The definition of the GOP_SIZE capability allows 0 as a valid
value. Here you are declining it. Why?

> +
> +	/*
> +	 * intra_period represents the length of a GOP, which includes both P-frames
> +	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
> +	 * communicated to the firmware.
> +	 */
> +	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
> +	intra_period.bframes = b_frame;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &intra_period, sizeof(intra_period));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;

-- 
With best wishes
Dmitry

