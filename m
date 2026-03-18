Return-Path: <linux-arm-msm+bounces-98507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L8iEcC5umlWawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265C2BD5B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30E49305B015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6DF3DA5CE;
	Wed, 18 Mar 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l29KzxEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVgeQ9xG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B833CCFB5
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843785; cv=none; b=mSJcLMKsLH3Rfdjl011gT56/E2Fq/KwXmXZ+9hZFrEbpEMYltNhZBsBNs7R1rssHww+6jkyyE/K4EPztWsHfdd1KSTqCvjqu8IwjxenYCuc+YC74Ed/8MZMSggp++VIRKOK4nIpfYLzz5rNB/cidhPlx5kkerUHfrru/m+EUJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843785; c=relaxed/simple;
	bh=BnNtG2+4onVNNX2OaIm5EMN4cNpyAEVfVStNa8PGg3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIx8F5lO18033Tol/1b21yCieO4A3TGWm2NP9HtECOIo42ODqVCNzOOn6ELo3kJOnaYVEISlw8+N57NfIuL0bZgnrO/W/Zwgu86VBor6Vu7qCY1dgaNj+RYQaDsNFgCnP5/X5ptGGA+4xIktgQXLeEDwBFfAh7iQ04kaJgTUfbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l29KzxEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVgeQ9xG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBB980320091
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUh4I7sO2YLCMMOdv6qQad+D2pc7UYmsbiI2qmFYL4k=; b=l29KzxEmrTChTI6O
	ov7PDuAXbT5QdiXojpuSiRQYRshl0FFbwZZJrkIeDSoMRr7oNqvSHrzBYsOkhXJ1
	8qt/qLHouePy5Zf+v24I3Z7XMDthteZLqxtVYF+qfSFdU2iGjTD6+H4N77cBCdW0
	ZT+sqEkobUFiUaBsVYC21sQF0X/bv0ILCj09LjDN+UXNZm98n3omyO0rDPDUBTPU
	A4ukXrt/lYojsyeUxyjKh8L9cey+r6poD5JgknDaoGY/rwd30Ki85CkVVF70tiv4
	eMULGZtVHjHiXVmzNn65rJ0vki+R1j95elyuQYDh2BYJ/gsYYsVdvSb5caDWnBQv
	G5yAaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrmhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:23:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5092135f2e9so388855591cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773843783; x=1774448583; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TUh4I7sO2YLCMMOdv6qQad+D2pc7UYmsbiI2qmFYL4k=;
        b=QVgeQ9xGk8x/d2XxiHJZg95WnFpYW+6zeuFWkr4669zU/1M+EQPVbDt0+3AxJFkz5C
         gj2Wfix9IHibY9W0C+6vCpBLJumY8vQe+NfZ/FGNpOTJFIYjxpF7K/h3m9kGDsjBF5/8
         GX4agzNItr8nf/zur/LCdQiu+vqwUR7jpJsnK2iIeW7OLWDvxLkLg2mTj63i2bh54M7Y
         j5rz5nS376YNhGehihxCiOHCZkRvMjfH141AtwUC90BF52mU+cJRJeD+bazRGePhp+dr
         ktFte6XTWYGOxLYfOphXbckROyNbs0Tg/AKLoh7scdqtod5JlnjNd/91a8vLZr3kIg/7
         t5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843783; x=1774448583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUh4I7sO2YLCMMOdv6qQad+D2pc7UYmsbiI2qmFYL4k=;
        b=ZyPVQMoxpAPxGmUEc1GGs6lMBpHGSwMIjJTNuRnRv3PikKA8/rU+tDh1jaVnDzHhWj
         hwtxlmHwPlPkC16tg9iEprQKbZJvSr3XnL2WM7bnex0Iq5N4tLWl5HZM800txjXc7uvw
         teD646kvsOvlnK2lIlQf3pGQmSjV0hP5ZjTfYsEfO2+eK/b/sQ1bJJfbY+6sP7hReaGA
         fbFYNa0okpq6Lfp/JHqDDLoJVg34H2CEZP20b/xkYQzpMXyRMTNoPZIcARWZLfRyFLW8
         NFKcr3JiPogBUSXlLtGAz+v3ImJhwjzFaGm8CjLFpxOm0RdQfbz11aUWTV3zYvVxDhci
         ECNw==
X-Forwarded-Encrypted: i=1; AJvYcCVjoGd6DMwSqM6cQxowhKnVnWsl/+QiV8ACByVAqyLQXXQ8OvsD+inz+yr1j7rf8zU6mHFgzHgvZmrU2t5a@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4KV/8E2DmQnNzEzb6clNQRP0O3n87rI+edcYME0OETdnFov6
	5wcNesvnHxTXfix0YrKfDHWhimT+y17dlzYNJHSC/EeGWorGA7QV2xTi2gCpnAX+wLGcM/7q/qL
	+J67RCv7gSVHhNred2D6MZt+7rXvm3EdnC+mbNaxcZf6bzuuODQSFyjUsybZMivJZ49wv
X-Gm-Gg: ATEYQzxBJbOYdfdbxNGirMBUxwiBDid0b+WC4oMs15dfEAeWIR7DYz+LEGz3LeHEkgB
	e16dcp5WwUiHSuXawEz7WXvH5XTyOp04v5OImBREJ7qzYAZsDTAMpMyuaH/sAlnCPZa9XKoiYUf
	VTBCNxt/BP+MLt6SrmqMmscMVaQt+Hq8DgwKYt0n/H66sBCjEbCT+s3jbsFYOaigb6nRUtEvG7v
	RGQ5h69UkdtFHhZb3A6ha1kzNHLKyvbxJbwVRE2vxlVsmTiFy4kzDfEXsRjTCnDuQoiwZGL2bRs
	Xxi01orV1by3vi6b+zQ7uBOgk9xNbQaSto4+4Jw4WKn670FOAa7fIwF2p1PwuI95Zh4wvfWHgic
	tCYKismiYuDcH3TmdPOXz1w5uhI5AhZBI/RwWv4fK1LdghIw6Fq48vuWZMGyShRITMDLr3Gc7yG
	9+9faXdo1nCiULnGaEUBkaX4WtdgiGD6xTB8g=
X-Received: by 2002:a05:622a:110b:b0:501:3b93:bb37 with SMTP id d75a77b69052e-50b1487e881mr42201121cf.39.1773843782736;
        Wed, 18 Mar 2026 07:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:110b:b0:501:3b93:bb37 with SMTP id d75a77b69052e-50b1487e881mr42200261cf.39.1773843781999;
        Wed, 18 Mar 2026 07:23:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5156dedsm6176061fa.3.2026.03.18.07.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:23:00 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:22:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?C=C3=A9dric?= Bellegarde <cedric.bellegarde@adishatz.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, antomani103@gmail.com,
        mitltlatltl@gmail.com, krzk@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ registration before
 atomic_mode_set
Message-ID: <ubxvfyx4tugfliwffrrlbe2oliep6nhp5dbpjry4vmamldz2ow@qncsubi7heex>
References: <20260318110126.274347-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318110126.274347-1-cedric.bellegarde@adishatz.org>
X-Proofpoint-GUID: _OaeqyOcbw9kecd6fo5IhvRHD2RETaPA
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bab547 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=LCWlJkpBAAAA:8
 a=h7vFti6rFQqOaJsGGxgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyMiBTYWx0ZWRfX7buFaXmqOpAs
 PabwArrxknThnp4G4d7kEUgF+FZ+2tbQQkbDw+Cx5ZlBalGVviaaLgKW+gT6iL3tPjz4Orhuz48
 cIm6Hroix/GxTjx7QqNqH+b/kQhJVC8pkNZVnfnHVpO3Q1o62tDEh6VHNHAKxtcAltz3PyoAWrp
 hWRlMfPj38laXNachkdJImWKwf6DmnhbQQG+nfV8Ieced6LDFc28khsKk/fijMU0sApR4XHrrf7
 WOnwOE8sq6bYlXcUFnKSXTQLNqx7F5r16qJbcijXcy5EXB5LAYTTeoORFXpvuEW0AjKT7mDp93w
 mSJByIVO0pp2/+5ViMssdLDs3I8pq5Rl4245orH/WzEnN3qK7EW0MJ1sDR+uIx7AFh3GRdgrqe9
 XLg3qHs/WOdGMwnYR25nhMr07dfIRzCyUkqRnRSffW690JgjMC7djfLTGMWUjGhgcqOrBXd/cI9
 HyESJepemTJSod+oW5w==
X-Proofpoint-ORIG-GUID: _OaeqyOcbw9kecd6fo5IhvRHD2RETaPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180122
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98507-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,adishatz.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4265C2BD5B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:01:26PM +0100, Cédric Bellegarde wrote:
> dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
> at any time in response to a userspace vblank request, independently
> of the atomic commit sequence. If this happens before the encoder's
> first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.
> 
> Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
> invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
> values of 134217727 and 31 respectively due to unsigned wraparound
> in the (irq_idx - 1) macros, resulting in the confusing error:
> 
>   [dpu error]invalid IRQ=[134217727, 31]
> 
> Since irq[INTR_IDX_RDPTR] will be properly populated by
> atomic_mode_set() and registered by irq_enable() as part of the
> normal modeset sequence, silently skip the vblank IRQ registration
> when the index has not yet been initialized. This matches the
> existing pattern of the master encoder check above it.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 1aa74ecb08be..8a3e09d21c38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -256,6 +256,10 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
>  	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>  		goto end;
>  
> +	/* IRQ not yet initialized */
> +	if (!phys_enc->irq[INTR_IDX_RDPTR])
> +		goto end;

No, it will return success, making the rest of the system wait for the
vblank. Instead the driver in such a case should return -EINVAL or
-ENOENT.

> +
>  	/* protect against negative */
>  	if (!enable && refcount == 0) {
>  		ret = -EINVAL;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

