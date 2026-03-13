Return-Path: <linux-arm-msm+bounces-97363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN2HIOLLs2n2awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:33:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0E27FB57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB9B630242B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11CA383C84;
	Fri, 13 Mar 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2M514VPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37194382F10
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390803; cv=none; b=PWEmQaVc+Hs8jM49lJ6GXUaa8UnkcX2zuwVdSyaIPtSG7BRe5FSSlgf89rk46ueqfMPGwxXju3q699dZ1l7RbngmYWjX75YC5Fd2PgOh1Oi3BePZOZ/wttdE58fhGpJGgGD5dFlvzS/sKoBbFpa774myMFkVAnYGsqsQ1l9VBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390803; c=relaxed/simple;
	bh=nIe5XlUNriiR8D6Am6b8PFXzokq99k3sTxbhixq+J8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Bp44HDQ5a7m7HmvBpLnBPhVPdVrl7B1K4aLuFV2eQaHsVN0yWSa4MtsbB/dL8HOZlL1QNBBnMdZo7NBrC7991cXMXz0a6hV+7Fh+ze+WsvI/ZpEYdRmOHoc0kE3hS7CCQ4IoDLnJEyx7zS9sf31CEUOlMKDd4WPMnQNdTEU9POI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2M514VPN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b940a00415cso240684066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773390799; x=1773995599; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/of78zuCI1x5T6ZYrwM97n73xB/ugxAeVuA7riCgkNo=;
        b=2M514VPN9upyiskCuWgTj0DFIuTItOSqYDh9f3BkMEcLSchNXzj3/TIkYP/7oPmmVE
         t1Z9jzYBayoHRe7IhM9wFkoEB/6h+WFN+c5+onPqwuNUX9MwVz4EgVOLhgn4KFWn+YLc
         QtpVrQ+zrky7cncsgG0FGh9BUQxEBShonC7rUUCjJWlFBFBH/j4st0jy9yxtEAEnUiro
         3DrNAZU3Z3u92FA34o28w0PRd+rCQAGc7xwUPkUblZ0STH9TJsFfdZDaYlczuOV8wUy2
         +yDfPDDKwbQIVR2FB8G7LyAodcnjY2kZ16YTl4a+yyTpZbihgX9fF9IbKycmkqp6kNqW
         6jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390799; x=1773995599;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/of78zuCI1x5T6ZYrwM97n73xB/ugxAeVuA7riCgkNo=;
        b=V0NfFJ8QmCdC9zkpJAPs2k60U5vc6ftR5SEmwhTPCndgD/JgUiau8H4U7Hf87ZpR1m
         k+rMwQEsXd7/jAYK3hPWzs/yuU5XLXcr9vOwrYwkuWjY/IiMwOHviJchpCb1mYow+hXX
         Q3+oVO4wVkLex6jIxATIpRr6vtgzUznihw/hY8NZS4F8oZiOX1LaFducbrchFcPYFasj
         UMJ/TbVSuVbpEao1wC87AQD0DGf1EcFHItH7Qii7uUHUJ3Yfne4IUQtFW0WfPluxC3IU
         cFrULa/vWpKql1qCVODzN13zj2l/RizWuhXvt1TNUkinyVeVRvKEW7S2ffH/22tNM4ZW
         Lt/g==
X-Gm-Message-State: AOJu0YxxmosWn0wUoNTSTVCnoGY1dUwBkS06SPNa5W5zGMWQsiLvBG+R
	kCvd/Up0rE/DilboaL2MjmV0RXg2YEzmXEZ93wAXQtfsMeh0qP9dn9t4Y232nnwhWco=
X-Gm-Gg: ATEYQzwRa/82GijO343e7ApM8QHxjfPwT+ZQPC7ArZjUirr9g/kXkCA/zGSc2/n04xE
	dpGzDEngdGQJ9aSUP4E+HhEev8NxX2Dq/PYpqGQexN6dQTj9EU4KUytAO1qMfLaj/mK4J6bCfsD
	BKLhJgNWSA9bUQR3DZV22YVoFeKq0VOG00OlcRYEiiCzr6n8caxEs/HaJLQjmbLPrFAN6hzqCmz
	c7VCdXTVazQDf+Iw2SYv5LUj9Xs2MrCXvB+IDE8f+/fqZiLNlLDxHHRxwuR1xcCUJ1BV+O782bV
	ipw/6mHGBhI12bCC5GYV9wBM6ecfdGe3jTWyN6MsCUhmDbXvJEpztawkY1/m5/FstQIt67X8BjY
	rxo9reOtk4Uqe9HV4zmus52Cq9jIcYhclZiybN85Flp7nOal1ObSjN9zqqL13H4AJV4DPKj5dyx
	udf/vXVTpwRyeSvxGsdNJsf0ZlxYdJW6lL/YDojkXnj6X4QEmIUrMASIOha5Tb1l3bjZuG
X-Received: by 2002:a17:906:4a9a:b0:b97:f3:1231 with SMTP id a640c23a62f3a-b97653525a2mr101020566b.57.1773390799228;
        Fri, 13 Mar 2026 01:33:19 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc1c154sm28620666b.27.2026.03.13.01.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 09:33:18 +0100
Message-Id: <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mahadevan P" <mahadevan.p@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <regressions@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97363-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 06C0E27FB57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mahadevan,

On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
>
> Enable merge3d support on SC7280 to allow combining streams from
> two layer mixers into a single non-DSC interface. This capability
> removes the width restriction and enables buffer sizes beyond the
> 2400-pixel limit.
>
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC72=
80 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>

This patch is causing display regression on QCM6490 fairphone-fp5.

With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
screen. When reverting this patch everything becomes working again.

See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/=
issues/41

@Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
quickly?

Regards
Luca

#regzbot introduced: 2892de3f4f985fa779c330468e2f341fdb762ccd

> ---
> Changes in v2:
>   - Updated commit message for clarity (Dmitry).
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++=
--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/dri=
vers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 8f978b9c3452..2f8688224f34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps =3D {
>  	.has_dim_layer =3D true,
>  	.has_idle_pc =3D true,
>  	.max_linewidth =3D 2400,
> +	.has_3d_merge =3D true,
>  	.pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
>  };
> =20
> @@ -134,17 +135,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] =
=3D {
>  		.name =3D "pingpong_2", .id =3D PINGPONG_2,
>  		.base =3D 0x6b000, .len =3D 0,
>  		.sblk =3D &sc7280_pp_sblk,
> -		.merge_3d =3D 0,
> +		.merge_3d =3D MERGE_3D_1,
>  		.intr_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  	}, {
>  		.name =3D "pingpong_3", .id =3D PINGPONG_3,
>  		.base =3D 0x6c000, .len =3D 0,
>  		.sblk =3D &sc7280_pp_sblk,
> -		.merge_3d =3D 0,
> +		.merge_3d =3D MERGE_3D_1,
>  		.intr_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  	},
>  };
> =20
> +static const struct dpu_merge_3d_cfg sc7280_merge_3d[] =3D {
> +	{
> +		.name =3D "merge_3d_1", .id =3D MERGE_3D_1,
> +		.base =3D 0x4f000, .len =3D 0x8,
> +	},
> +};
> +
>  /* NOTE: sc7280 only has one DSC hard slice encoder */
>  static const struct dpu_dsc_cfg sc7280_dsc[] =3D {
>  	{
> @@ -247,6 +255,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg =3D {
>  	.mixer =3D sc7280_lm,
>  	.pingpong_count =3D ARRAY_SIZE(sc7280_pp),
>  	.pingpong =3D sc7280_pp,
> +	.merge_3d_count =3D ARRAY_SIZE(sc7280_merge_3d),
> +	.merge_3d =3D sc7280_merge_3d,
>  	.dsc_count =3D ARRAY_SIZE(sc7280_dsc),
>  	.dsc =3D sc7280_dsc,
>  	.wb_count =3D ARRAY_SIZE(sc7280_wb),
>
> ---
> base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
> change-id: 20251231-4k-969b53d2ea4c
>
> Best regards,


