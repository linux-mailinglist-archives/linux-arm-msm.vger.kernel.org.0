Return-Path: <linux-arm-msm+bounces-98229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wluyEqN5uWmyGwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:56:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096072AD622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0124230791D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AF32DB79C;
	Tue, 17 Mar 2026 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P86317Ey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDD2D949B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762956; cv=none; b=PFELQAgn+m1sgkBxUqXGI17RZ2R4SYNp5hPzwPs+ljOmYMMk+1hfjVUsQYwaEpKCKj4ASiJLRIqhmsOSqMToFOC2WAOLgTFZDS8SbV4iU8wGuxpD9OKfRq6lEhvGfo1W+lODson6xaAOQswYEDPnXaJi8PIde5ifi9ouTjmLHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762956; c=relaxed/simple;
	bh=Q1bDDOrF2wOLk30u1o/3WHRFCu3v+rlUgESHZeMeR6U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=f08F4BUOyIvyFPCvukwXKx897oyIxvWe11h19h+bU8XSMlNtwujuotlcMC/DOMSLD/gYqRjYyUgLliGWJkqgAJu5feHcYXLZVc589SGV9KrTzkVO4maTlXVAx8F7AJF/YK+SZy3DMMGbrFdPBRcc4gYxPvHrOg5sCZuxVqHq0V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P86317Ey; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6651702ea48so4687274a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773762953; x=1774367753; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWDB8KL3PBcEqK0ozqAtIpGnPn1jWzWERBO0Z7aA2SA=;
        b=P86317Ey+KXN7SOe7hU/YxnYA18iz5JZfIo5q/J0avlUftHGYGGC6jGurClMtFPuCV
         +0vXMvu/Y7ubBfve13oAui+D80d1az2S8J/BONtG6Bm8485fgUa82zryvRCsm1mfSuiR
         FUoXkphQR0v7UPVbRWr8/9w95b+xU5tHNd6S3NczOCZpFKr+aWJpxB/V7De/oHQViXKF
         ZobnBhzNnGSACOLmgDOtkI4O/2brNjz4FbJUlciBQ04t/33PxQ2l4r/quc0/U1+vNsv4
         NkUTtoZip1dWrlLqlCbtfQRMpn3qoB/o6/zZ6v/x6KKY85oWIovaJFJCdpHZzUADzpXd
         qLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762953; x=1774367753;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWDB8KL3PBcEqK0ozqAtIpGnPn1jWzWERBO0Z7aA2SA=;
        b=JM6VZ5iVAK/Khe/44VGgJL4/Ey4J1uPgBjXGBr7ivb6qX/2NY4O5suHp4iJCWOwtkV
         7yBxum+ZPdLgqboZEWmU/eIvxiRRq+V8aKBbgg9t5iajkSQEl2FZtPQwForbrTydJpA6
         uZzXTtd1HZ5j/aWGZnlixD22o+qfwCn3+hQyUb+kX3MpkGit369dBR6e4Ak7hhCWlWLF
         IfNMvbFHJfsoyOIjlEOrV4Z1fJKuzyv7kgUbp6zlm+dk415GNCnzmKruuYJXOCPSBPqW
         wa0g8rEe48auzzfL1W1Q5Xrw59rgf6JvF1koEG3P0gcei8P1S3lDYfh+vyzl93H2SzAw
         7vew==
X-Gm-Message-State: AOJu0YxYCjsrkG1ybt11+soB7IaZB8nV8WDuBVhsYwbsJEXDd2guVoXS
	qBqbcronyUbEM+vP9BMLTgTCgio3AGBHBH31nFp/Mlnslzrchy2LaX69EuAOaLDhv7k=
X-Gm-Gg: ATEYQzy4a5/FZcVmNzh1BWmlcV61Ck7+t0YirD3/DIGNz2DiCjBqeiSZJ+k3n+zL+Vs
	zmI5OCMocklcq/7PBaXNsLQgGccag1ZXBhZ+WPYw9fj5GsMhHWgPa1+/JqIoVhO4XRUQq5ue9FC
	vPYSmPmKfFHKwD0bw/FgooPg64LGIjfRwnYnf/7EdcKwFN9tarCCVEn0VikAxRp5Qg2NpV8AGFC
	j28D1/E30yZBHEaXEQTht+p/rvONpEc7HmDUoWC0esaSmMkVGh4XAquHFU1MV9FLUIpPy+UElmp
	WF5Ce11EVdJjmFFRET5/9wClFMW4EwOZkcI5O7U7indO85h/C6A7paLRRbqT20Pcx3o6cJHfcYP
	ReX65Fz1qrR1NH5X9/ImQFEpUPsdzSXmMMUYpB/s4rqe4plFLZu5xyQu6V5Ucr3dlJ4NCnWq10M
	I4NYEwX3SzicnDjWfJVNC/6PlyCHCIBFaUAFEeQu36P1FB2YU9Umhm9OrdC2sJh4tHVhrR
X-Received: by 2002:a17:906:209c:b0:b97:3376:7ce with SMTP id a640c23a62f3a-b9765153c1fmr602242366b.26.1773762952679;
        Tue, 17 Mar 2026 08:55:52 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13ee5c0sm15707366b.5.2026.03.17.08.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 16:55:51 +0100
Message-Id: <DH56HMTRUY0M.VHEHW4AHW1XH@fairphone.com>
Subject: Re: [PATCH] drm/msm/dpu: don't try using 2 LMs if only one DSC is
 available
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Luca
 Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
In-Reply-To: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98229-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 096072AD622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 17, 2026 at 4:30 PM CET, Dmitry Baryshkov wrote:
> Current topology code will try using 2 LMs with just one DSC, which
> breaks cases like SC7280 / Fairphone5. Forbid using 2 LMs split in such
> a case.
>
> Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.co=
m/
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Thanks for fixing, Dmitry!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index 6bf7c46379ae..96b67ea3fb4c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_top=
ology(
>  		topology.num_lm =3D 2;
>  	else if (topology.num_dsc =3D=3D 2)
>  		topology.num_lm =3D 2;
> -	else if (dpu_kms->catalog->caps->has_3d_merge)
> +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> +		 topology.num_dsc =3D=3D 0)
>  		topology.num_lm =3D (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>  	else
>  		topology.num_lm =3D 1;
>
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260317-fix-3d-dsc-4b073977ea19
>
> Best regards,


