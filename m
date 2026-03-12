Return-Path: <linux-arm-msm+bounces-97132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMlRM8pKsml7LQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:10:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22B26D4DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 463C5302B204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 05:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05A7397682;
	Thu, 12 Mar 2026 05:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMCHbv8k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212F38C2C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773292232; cv=pass; b=P3HNCkLfY74Q3aQUFBZG7HUkdrjVxE1bNUyrgfsbN5HR9gKH2LZ9au6r9zw0WlKNBzPrc09I+lPy4SjX5srBXu2z6iwZ5NECKnkVVCZszVXihS/UU6BaKr37vTzFLvn0uZbw/Ez1H3OFwDcDrRHlP7BQyxD8irQzkNNNZC1PW2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773292232; c=relaxed/simple;
	bh=2RvlbfyPBp0OCTZSWXAzRVccTVdOZnBY4R9F6Vzx7h0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IV5Rgs6LHtCLpEKkHy4MPrSi8ppY6QmH28ivm1/XVIptenKuW480N5EpahJGt6kigrfGzVjbUnsFFI+ArIc88igALulJ1eN6C7DcPFHv0TTxtm2+USyZf4Oyvjg85iu7KVfGGCjCQ63WS6yBPRcRkXM44OC+hQnHremgW62t+N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMCHbv8k; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b255b1dd0so614211e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 22:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773292230; cv=none;
        d=google.com; s=arc-20240605;
        b=Zbc+dUbV5Pq9CxbB8TbhmxwfgQNe92YmKpP1jy4TkkrzlyBzphEHXUJddll/2CnmP8
         nHdahHrYMSeUkS7NNeieGXP4/I+g27IRjRiN68XotCXa6z11+mix6sxhH/qySVkQfTcq
         mjLxN1w5ZIdYjBYPGo65nXB1WoWbaOmzmAeQdWc9Y+OE/S5qCTTIvkGvxJPt5MrZBBww
         NnVXrkHgEBo+apwgdfrmjDTOsPMXopGQ8F6TKIk3Cw9PO9iYIzKOHpsZJlxTLV5GGTX5
         YxrnNndqe5+4ajIMKCkV5wJ+c+FlYQznzz6AVq0INueQruP4KhhQzrhZIa4ZKcC/hor4
         obKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWcvi8r5zhb1XtI8LQ0y1u0RL/IpsZ2+XzabNVzn4i0=;
        fh=RHlbS9d8AXhd27VfOUqGVYoFj0k2xjDKORVS9+iOpMM=;
        b=CmGxBM76w8/0GG5TkS6yqXNHg/93JwbOUyL08DG1lSRIIQzysdAzeL2pKkAsrFvvua
         MBxBS9lp8Mqie/MkV0rPpXtBARZ3E6VCsOo2llyYMYTZwACYbZI3tngmMg0o1n0JMDtw
         KkQtVm5tPHeQjBOiVKNxIw2vIHQShuFxBnyOgGaRbm4FjQbuIpuSQlhFXt8V5IO/Ovbg
         WyNZgPeka7rAIHoOA+cV0UtODC5mzJ6MBj/0qOYtRqgfsl2C+kh6JkseaicYJByOHhoc
         bp2gK1agqHTEVsGuwqSoaH9OyHWz3zuyI8vw7inqpVzql6L7jh+2dM+jD3h8t7An0gJT
         6ArQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773292230; x=1773897030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWcvi8r5zhb1XtI8LQ0y1u0RL/IpsZ2+XzabNVzn4i0=;
        b=QMCHbv8kLVxJznYrwYGfwwSqbS+h9Xrevus0zwsEersgFxZ1YEP03b/CRjo3gqZCbC
         neWKX9q03uITjU5BgagUkDwGVScqz1JNR2OmK+mJUm1QijKxqLLLUAhszWLcjLeLXEcl
         QcrzHrncGOumvpFxaqlHKrjUAGTwOHSIB3OK58MLWU6Euq0Umh35X3sVDHocqQWkY7LA
         XX9yiZkslcJcWfqKBsc6DnNDIBtyIHDTz8u7yjYEcyNI3lj7cvPk3mF0T9WqwkHFzok9
         LPZQ0QlRzIpvD7IVigaqwiEL+bFWV8qI0YMqKJY0VopyJrYTisPGxwp6ZczQx83ujgJ6
         nixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773292230; x=1773897030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PWcvi8r5zhb1XtI8LQ0y1u0RL/IpsZ2+XzabNVzn4i0=;
        b=KqXJ3hXthBBm4j3434Ttfvr6XTcGPQVi359bwBKb2R7dohMWzubxNbxt6d0sDrK06e
         YskuiDOPEGeFl+xNg6pfz288MUE4+p6+kmUqgMvBa51IRs3IpkCVMZELmp3Qi+LY/Msk
         HkiJHHxrpIckQMxFKCV1W8Bmrav0xpdTYAD50ZgVwZXBFS3GlGeB+rXYE4lL6Bv4J9Ng
         wd94ORHfijtKFH3WdnANwcsB/Hh3VVsJzmZPbfQxuP6I6coCnl6rPuHzgWOHXXXtn994
         uZr6sOCh7m6ogAAd0dMBL4BIBTIjRlyUPccsFrwMPKNQ77fCkgGT7PEQ8rXhoLuRXodF
         zy8A==
X-Forwarded-Encrypted: i=1; AJvYcCVWx5F2H8vskrLCHR2NgSfAFveiBgxt5SZdwVuW+runNSgGWq050KRh4BpnDeVRWHlsFyqmeajlzzHHkLYG@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ6f8NeicFvoivjWu5p/zpErIfKvAntW1x3vqsemyNwdc0qmS3
	XKAg3+cWI5Yjs6ZkV9sPPASHjKnVtq57rq0n4Bd2bpIZcTfmahSCSuDyJ5wKBIUVJjQq201ygm9
	lXWwsuFV5mTcdy5RNFKSjxu1sx0lObeNAMEdLdop2pg==
X-Gm-Gg: ATEYQzzLFDBkDRe/45JqAghsx+2OwC4taWpC40LThTawCvCZLeYoghSG0DaNlKKVi9f
	/rZxB0IRYhxLSU0HXElAsKyaHxfV2x2GSG3L+0FqJ1n3eO8hD8veDvnms1EsRZs+dduZZhx7jO5
	LfrBgrGByMeqO9ncX9HSZjVLqVqxuQO0VsmOYJIlfyjgbf8gwFEqz06YH+L3pOEK4BVgQcrBoV+
	5BSKJAmifX0YvyipcDBEkw+aqWEXpEVNJSVIGVbSqlZPjV7f3VJINS4lIn0mNwUyjPtTFTsjxnQ
	LOlvtU1e
X-Received: by 2002:a05:6122:905:b0:559:ed61:4693 with SMTP id
 71dfb90a1353d-56b47502a82mr1980826e0c.10.1773292230367; Wed, 11 Mar 2026
 22:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
In-Reply-To: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 12 Mar 2026 13:10:07 +0800
X-Gm-Features: AaiRm5032nIOTt8byfCch6Yp4UmYC08WVVLg9N-eS-xixBXOUFqlyg4aKIp8AV0
Message-ID: <CAH2e8h4qnF3UxWFrU59BrStWMDc-=Vz9ZNmuq8Q3smhHeUzxyw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode panels
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97132-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,lists.sr.ht,collabora.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4C22B26D4DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 6:31=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
> programming dsi registers") makes a false and ungrounded statement that
> "Since CMD mode does not use this, we can remove !(msm_host->mode_flags
> & MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
> dsi_timing_setup() affects both command mode and video mode panels, and
> by no longer having any path that sets bits_per_pclk =3D 48 (contrary to
> the updated code-comment) all DSI DSC panels on SM8350 and above (i.e.
> with widebus support) regress thanks to this patch.
>
> The entire reason that video mode was originally omitted from this code
> path is because it was never tested before; any change that enables
> widebus for video mode panels should not regress the command mode path.
>
> Thus add back the path allows 6 bytes or 48 bits to be sent per pclk
> on command mode DSI panels with widebus, restoring the panel on devices
> like the Sony Xperia 1 III and upwards.
>
> Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programm=
ing dsi registers")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Apologies, I messed up, I had sent the same fixes days ago.
https://lore.kernel.org/linux-arm-msm/20260307111250.105772-2-mitltlatltl@g=
mail.com/

> In addition I can't say I understand the original commit message
> at all; it mentions a BPC=3D10 mode however the highest format that
> mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
> ever return anything above 24, which is the original amount the
> non-command-mode path defaulted to (regardless of widebus)...  Was that
> patch doing anything for video mode at all?
>

RGB888 is the dst bpc, which is tied to qcom,mdss-dsi-bpp in the downstream=
.

Actually, we should use src bpc here, another fixe
https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltlatltl@g=
mail.com/

> It feels like the conditional introduced here is only making things more
> confusing, but I don't have enough input to confirm what the video-mode
> path should be doing in widebus mode (multiply BPC by the number of
> components and by 2 in case of widebus?).

I left a comment. For CMD mode, it consumes 6 bytes, for Video mode,

  * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
- * enabled, bus width is extended to 6 bytes.
+ * enabled, MDP always sends out 48-bit compressed data per
+ * pclk and on average, DSI consumes an amount of compressed
+ * data equivalent to the uncompressed pixel depth per pclk.



Best wishes,
Pengyu Luo

