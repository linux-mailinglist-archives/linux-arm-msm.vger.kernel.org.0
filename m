Return-Path: <linux-arm-msm+bounces-98549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMHWH3PvumkBdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:31:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E22C14A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8DCB31769C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6EA3D3322;
	Wed, 18 Mar 2026 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZ4gdx9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FE3BFE33
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858181; cv=pass; b=lcAqniNIhIi7wwKehKUcBZyPk4QsC7BRH5FHyhontwXHqjqmbN0gMurc2EGbBCaEC3RLCEtmk4vVKz05s9RKuu3XYSgBWjZRdaFj3u4Ky5ocLjpHV7ZlR8PtyUKIf5otGJ8ZyOI6Qo4rcCPDXoQnS8iaVqgxFhGhqZivTl+iFv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858181; c=relaxed/simple;
	bh=nyP+gtfZxd9qCAN1bjq0tI03dKg3ytpQ2Du0Rew8xyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwQkb2lpsl0FOpYGJIOyW0J9JcLnFt0pr0g4hCyzA/TReSrfETUW8uQB1s3In4sD5Ygxho3Qtk8SIRNO8aSak7+ci1AjugpWUxwR8K7V4+ulBVGtrnsRKB+sqLv46Xr+gFRgCNNScFhRXt/ct4n5cpEMJzt7YIj4DFRjKt3oW7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZ4gdx9A; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a27dddecb0so202927e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773858178; cv=none;
        d=google.com; s=arc-20240605;
        b=i4ph/BvyY7CHMoQk7TZWU8/7i195JFMC6o3VLhmZC8LPdgufHcgFS5DTeqxtKBPAKO
         t7n9cpk34532+N+DUQfLj46y+svgbLz/zMc8Mnuy3obGN0+z4nIYch3MGzsvLejwHuDD
         Se9ifD6zVG5h1D+7Fdx1/pg8gYug1+SuXBiwxgyGY4YIUzX6BH+oqYDM8CT39X7qvw4a
         NvhIi3yn4fLDgY7CkuCA35Zjm54gtw7azo9VraqdJs/jztN4E8UYybvhye9hHhpO4Z0x
         qMySTMeY2wYKnWlRw79hiOWn7xM8mszn0vGucNp+XHrqFrUnxYGrn5BzmxjUg/S38det
         K2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iA23sR2q1qivlc4Reij+0B975e1ViOsO76XTHCFysUI=;
        fh=GBwMqzdV2qs4fH29fDxR/r3VczmDSKOziSMCMn5/8r0=;
        b=WK9EY6Kantn4ZTA5rEL7gEDYIW0hd/LgRQKKxeyebUdLVoWiClComWx4HmbbXzuJmC
         9vDNewyhYeIQPfhyYpWWAPrdYQv8qv4zqD6Y+iYjW6PA7lu1o54WVTyKmZbjf4C0DIwB
         9A80ugSgT7+LX93kN8zlmvJEyNQxOsIT6LXPxP1ox8Zr5qBXLlt3pGuYtwJs5QKJn09f
         AYMcB23ihL2uQc5c5nha0j0REvkW7fqaKbrRkguApUEjvmXKFxElerZPw9baDt6gbox2
         /Ncn6CVc5YijYYBZDywG208zvJ2UFHnBxcwlDeX7GbEZgtHsk3JieG8340ud5YeWTE1I
         bWAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773858178; x=1774462978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iA23sR2q1qivlc4Reij+0B975e1ViOsO76XTHCFysUI=;
        b=YZ4gdx9A2rbswMrwxvebnlw+8nWeyXoe1AeBlA1idbva3MG7siL7pMmsbyBwaiBC+4
         BJcVgkh7IyQi0prgOGkmyBOmS6NKLFbIqoOOCAA6YOXznotAyI1SMn6B7TdSOBUoucv5
         650d3koZP6OWJbsCIvg9XJCvE7icJ6TljFHiLCywrwxHyoQXAbp9jKiP1r5qAvSD/Pvk
         uLz9/PYLTPrODfWSvvWu8P1eppaFTb55q54GRStzNvgtvU/9ac8TB8HP1YQIfpwZRwZA
         K626q+SKnwCGGW7G9dbAywhptkJ8387SfQLd0KQi2DcHlNLglmBAFUu6grONzuHhmVck
         k/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773858178; x=1774462978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA23sR2q1qivlc4Reij+0B975e1ViOsO76XTHCFysUI=;
        b=l6bgH7po3UHGaTOavM1AreFz8iMplq7eaUFJUCBiJn9m1xkZ6WfJUumt8jQlu3zAkA
         9TrdBSQMGnoTOyzKDih0QkllRdweVO2uERoxNnlyoqTDpCBUeKO1fso5ujxt0SdrdnR+
         R+c86oOkbC28dSK6dgVMQDU1DhOK+VFDAvxuthjUMRz8WOG3pZ+8XuRMsP85fqq+5udY
         vpEAuwjee5CcWeyu47oiPzUkXyzC3+oVPgvyW0/wMFBkJo2jH50TP+E2La4u3raa9Jqe
         VlKg5SRhYbrN8Le4DhxyWofwKTlNSNNGS03d+XWAio0eQjQFWMVpRL6OAlB2MKyIW4wR
         Enqw==
X-Forwarded-Encrypted: i=1; AJvYcCU7iaTKwgRv2uu+OBbfTthhyK1JejMCslJTnbkgqGi7XJxlqjBNAWaQFrtyhVg7TqChIJF0/b3wvxjcgONy@vger.kernel.org
X-Gm-Message-State: AOJu0YxCHw/u73/gZYBL7kiVNxRuv18BjezwgJa1OkVGaYr0RyDk9H9H
	62z0oFk4NbFYVfUYL3tSxJmkr9gVeIe0Bt6BuZtTcNRjrRJef3XWVqnUAFtJ86mioK0a4LN6tsE
	AzCMIykItifoOoMv/R4wbH0/FCx9KSAidEZaIRn8MqgIZ1XumtqSKK1Q=
X-Gm-Gg: ATEYQzw5lI6MNM+uSpAqHA/IdzZ/UNJ06MQDJRkdSKCTdI9+xDXm/trKu+JRK5y6I/j
	KIc7qVNsAlVXZR+2vk4yqxvJ8G3eltZ6mXAVa9VcV0kpX3WcP1gHZokuIlKt3IyFhajtocCDrqL
	JwlfekKP7y5nwRf1GCvIGRpqx5goQGzUGFziv+/YMmko2I5VzzRP5dBKB9nl02mM6SnQWY0TzoR
	T917bl/5fGB/4J/0xxvnoeUNrzt/FvKjatNnilwymgXjIJXC6QGmhW0ppkUjIVNSMK1YZjNUXcS
	aQt+m+YG
X-Received: by 2002:a05:6512:39cc:b0:5a2:7c67:4b3 with SMTP id
 2adb3069b0e04-5a27c670581mr1032726e87.2.1773858177947; Wed, 18 Mar 2026
 11:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315214153.3682-1-rosenp@gmail.com>
In-Reply-To: <20260315214153.3682-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Mar 2026 19:22:21 +0100
X-Gm-Features: AaiRm52kpaoiFPpZGuLu4fw_l_zJBBCJEDVi43rk0eejFBLBLds96ejXR6F-tws
Message-ID: <CAPDyKFr1C_0Eirrx62bkp63ph_y9Ly8FjGbZVjYH9iCtAZGhbw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: cpr: simplify main allocation
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	"open list:QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98549-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: F41E22C14A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 15 Mar 2026 at 22:42, Rosen Penev <rosenp@gmail.com> wrote:
>
> Remove kcalloc by using a flexible array member to combine allocations.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/cpr.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/cpr.c b/drivers/pmdomain/qcom/cpr.c
> index 3ee8184e4be3..c30690ef6919 100644
> --- a/drivers/pmdomain/qcom/cpr.c
> +++ b/drivers/pmdomain/qcom/cpr.c
> @@ -239,7 +239,6 @@ struct cpr_drv {
>         u32                     gcnt;
>         unsigned long           flags;
>
> -       struct fuse_corner      *fuse_corners;
>         struct corner           *corners;
>
>         const struct cpr_desc *desc;
> @@ -247,6 +246,8 @@ struct cpr_drv {
>         const struct cpr_fuse *cpr_fuses;
>
>         struct dentry *debugfs;
> +
> +       struct fuse_corner      fuse_corners[];
>  };
>
>  static bool cpr_is_allowed(struct cpr_drv *drv)
> @@ -1600,19 +1601,15 @@ static int cpr_probe(struct platform_device *pdev)
>         if (!data || !data->cpr_desc || !data->acc_desc)
>                 return -EINVAL;
>
> -       drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> +       drv = devm_kzalloc(dev,
> +                       struct_size(drv, fuse_corners, data->cpr_desc->num_fuse_corners),
> +                       GFP_KERNEL);
>         if (!drv)
>                 return -ENOMEM;
>         drv->dev = dev;
>         drv->desc = data->cpr_desc;
>         drv->acc_desc = data->acc_desc;
>
> -       drv->fuse_corners = devm_kcalloc(dev, drv->desc->num_fuse_corners,
> -                                        sizeof(*drv->fuse_corners),
> -                                        GFP_KERNEL);
> -       if (!drv->fuse_corners)
> -               return -ENOMEM;
> -
>         np = of_parse_phandle(dev->of_node, "acc-syscon", 0);
>         if (!np)
>                 return -ENODEV;
> --
> 2.53.0
>

