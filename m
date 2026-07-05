Return-Path: <linux-arm-msm+bounces-116562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rfspMcSYSmrUEwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 335FD70ABC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RR9EVRVs;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116562-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116562-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3EA93016823
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 17:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93252FB084;
	Sun,  5 Jul 2026 17:47:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E179F279DB6
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 17:47:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783273665; cv=none; b=uFs+8HajT50hKrbGeVsHNJNoFsfem99jPOp5de7HZG4w6lxY7iqlZPTdAG7B4JWITkAz2ou9gZzcbD/8rCWAOGMEVGm0DuYNVzQyh+xxJX0Ue5TWZDUrbbEftIEfI8a3rkNq4JYeIZiaKvziehP3qGtk4hfmJKov0ULbG/ZQ9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783273665; c=relaxed/simple;
	bh=+DWCiJuHtexmYzOgAlNi4lBL2tdyHsr209Svskkd2Rs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CL3TiYbHAJYuXLnp/F41LdqzuiWbiY2HDl56Mf3qcc6M2Rc7tPfT+168qCe/VsipGh6YLkeqUVER2dBZuVnfe98XGZLHoxhiuYHz/xM/Rs083/nBiqY7ZTsoaUk+yoKvhlYoBiuFTlpPcDpJIZR4COesRG2qk5pAdxhPrj5iaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR9EVRVs; arc=none smtp.client-ip=209.85.161.46
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a15ca0d761so1513707eaf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783273662; x=1783878462; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75FEqaRZi7gyVEUOxCRUP71SjurGrXH97prx6jJpO3Y=;
        b=RR9EVRVsmCAw+wcrAKa4ntkKxPOIH9RrIpAy1ENR/V+W4NGiDXFGjZO52kbHPTlV/5
         lXnuIBS+6aYZiccU/hhfLr5wh571ToWp0Vfgpy0XY2bp6nK1j6fHro6pdciCpoCr56sh
         zdzQpGurW1AuVtlQ56rt11qsotsNcVxBRXSAHsDbwPBK/K0bhvLmeC+FtxNYqz1AoS3Z
         vyWEK9HiFkuemMIXcEd3GjymH0ZCe4z4DTp6ba9VNpn8egmWadrPOGb+nGPN4LpYGD2S
         MFq+7VUj/T54+Rnqwc+OzfJ4YU3dR3xTs5e/D8u+3K64Xapud3rE2veJ3V71Xzmk0+vC
         Ub2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783273662; x=1783878462;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75FEqaRZi7gyVEUOxCRUP71SjurGrXH97prx6jJpO3Y=;
        b=NNPT1rERVe5MyhIfS/t2cDd+p574cXa1sgEVNWVPX+kM496XhJNsp/Qvn2UXFprmnG
         EomW//lWST1CQ5NqkAFmGtXN62btX79/Cinm9lRB67aKIkQRA5nU/+BmpRMqvWld1AXQ
         U9y/t7oowcugz3r3Iom+FQnygWPxaITD6OeJtEr0ZxeW5DPsMIh/rRYMEXW/Y2vCVb0l
         o50pZHGG6wehP0DjDffq3tuQClcaY/aHY3O+VWXuIoueFhzs5+jaauhorQFwiWUxTND3
         mWaoEJi4E0GUs5DDpIjVh8/h7xJWSNXQ8gzf4wbJViobL2p2RKFZC3p1xNgnb8cjtYRE
         jptw==
X-Gm-Message-State: AOJu0YxmrfPCVnmQ/rPZK0qF5znw1VduvVIDQJWIaCTJLkNlVi05XrEM
	GzeisVM4T96HCksB5Ov9HXWRTMM2on3uoQValH9BxA4xcIF2ilTAdXdi
X-Gm-Gg: AfdE7cmi2Dp3cFxgqyNTBlQIX6+xX1PkCzeds9BTQkDOxhkpxL5Fx3DpjV04U8cvaoN
	cI8WvSXbcWvSOoON1qmAWXDieGfnvT7evTO1Dx97WBDEh/DaUpt3Rh1WIiPki1NcNaOmFDj1f/l
	kkMtl4FfKoV3H8fmdZxLyY7O4qPIz4WSKZWX0TfumXlguj/5wjFAjdkaOZHWtDHAWbMlm8tat+l
	nzQK0ZdcAMMIxMcB/s4acLFwHCJPcvMD+cm3v1lffNR0zNBUpbsNqnDaLPmvWiq70VeiHZjBGe/
	OljnIH5d+019TidR4SKp1XW8Nqafm6R2aQTll4f+E7Kze/p4XYktaZdgLMGb7S1Av28GWzITh8y
	1n+glyHiR/PtE43f/XI3rpkuM/Gz56i2Pfqq9GtCdLOYdfArKh3tF0nGhO7Agq/4WGq/MIDZqLV
	9lExNweAiv5ZErJol6ETPXYfJZ75n6pjtAUTMzG/j3l/nrrl0JHg==
X-Received: by 2002:a05:6820:3095:b0:6a1:8192:4d75 with SMTP id 006d021491bc7-6a32f5d6b94mr4075618eaf.64.1783273661937;
        Sun, 05 Jul 2026 10:47:41 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb559559sm8482157fac.9.2026.07.05.10.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 12:47:39 -0500
Message-Id: <DJQTR5SRX5DL.20UJ66ES758CN@gmail.com>
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang Rui"
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, "Kamal Wadhwa"
 <kamal.wadhwa@oss.qualcomm.com>, "David Collins"
 <david.collins@oss.qualcomm.com>, "Anjelique Melendez"
 <anjelique.melendez@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
 <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
In-Reply-To: <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116562-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[m32285159@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 335FD70ABC3

On Sun Jul 5, 2026 at 11:53 AM CDT
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> devm_request_threaded_irq internally prints an error message using
> dev_err_probe in case of any errors. Remove the error print in the
> devm_request_threaded_irq failure path as it is not needed.
>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Seems like I'm a bit late to the party, I got distracted messing with
email templates. Oh well.

Reviewed-by: Maxwell Doose <m32285159@gmail.com>

--=20
best regards,
max

