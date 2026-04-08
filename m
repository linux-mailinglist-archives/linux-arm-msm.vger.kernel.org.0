Return-Path: <linux-arm-msm+bounces-102308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKC8KvAn1mnqBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:03:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A233BA3B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 576AE301D330
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828873890E1;
	Wed,  8 Apr 2026 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCfMcKL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926E37A498
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642596; cv=pass; b=IEOfxt6K8JAIBue38LpwINRk1tFs4lceZ04I+6L9t0GdETJnt8AhyX9tapWAGUg9Ft+ZjGAdEgOg5d0oE2NpbxyMJ107RoZRU1q0Z2xj/k1Enz5XxgM1lXy2Ljo5KYpD6wVHth1Md3mlYWATrYTNYyTUugq8t99IT5b22+hRJLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642596; c=relaxed/simple;
	bh=CBr4/JXzyveZ9gUjyhTdPsUF3GY3HDOAxtnHRkj3OQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQlkD+KBA7m4xVoEYkJcKhPxKcMOy3C3bzFt9DFx31Tji/7nvu3ltOyryfeo1G+M54pMKHJWLYT+Qf9Iz+r6HgZe7AEbF5ENKNPHO12RRth721flc3S+67Yy/QqK8MfoiKvJBzK29AxQFByWkzq4HI8aN+/e/5srnefxB+gwoD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCfMcKL9; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2b383cefaso5707264e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 03:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642589; cv=none;
        d=google.com; s=arc-20240605;
        b=HSrior+2H3HwrCHb7RDyKfSbCj0t3S5ZKVbIYQ+KV/kuBmo51HFQk2oQoPM/fLJcH6
         MFSz2FE90WWkFnsQ0jl28godQIT5t3v0ymXCFwy5lKCbTvgj6kPpQYIeuDEEaq9HSMTM
         htVUbG6JdNhsO312QesgWncNDrSRrp7Je2gEaHkpS+hHFpAbYdYwFiNIzpqgd4g7E/K+
         S8TJ4QhOuT3/zfSDU9ACd7DPxEHSFLRmdIh+QJvlFCVxQO0a2UqmG/b412N+/TGQPFsG
         R/DpBzjrNS4gEkrOAgxBqOXX18jRRlM9P9jtYN73K9sziF5zhTbLZhxiYDK1p22tyRvh
         9ocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PEyrayE2kYN1hY65mdTstp1ag2rGZYENgFQhfxeU98A=;
        fh=Rg20nejnSWTO4vKDvEB6FS+j0PV/3B0xCj8FRxxhUrs=;
        b=VP/gR3tomeOKuM+FNN6UFngRcxOv0snwpoPMiatEwmUYhj3Mq2DfxV3fPGrR43Y12t
         2fJY7BmImW/uRg5R5YwF40IleTMMHQ2eh8kVDv1H6oHllRrgMZfnRKSwmFaSJ1BTJ1wi
         Xg290xWirKj1V+374X0seQEC9Z0jlFoErttFpV9iQUetFXskdB6HjQbijqzIXqDn2abw
         Je/9kTQ51VpN2ihy+i0fIkkS1aCbzH5NG7OxfZsAYMw7kw5fDSER8zvYFswr2+zqpQ9x
         wHxXSMLfjgHWoMyqafEVMtGwE4XgfMtPjTdEq4Sg2O0MRnssY1nBQDsDncBynmH2d9+w
         h7UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775642589; x=1776247389; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PEyrayE2kYN1hY65mdTstp1ag2rGZYENgFQhfxeU98A=;
        b=pCfMcKL9Y0KCWzgHWUFZx3POM7nyiVv2I6dXSphZpQYejwzQKz7nSAO21dgvv/9qtZ
         B4/Bihpgl+9v7dJDQBTog7kt10I77hHBlwVwMGTu8O9RY3kzjM1vPq29Yt0oQb/HmItK
         7zcHlo/YW7MfDKD1DGbK3ivQKdoDIjUv/5Rh1zDx64xt6WDAeVs7KjcobL5LJE+AiCrb
         rzp/3PT4kHOq6rzAk0SC/Fzque5OIT4K5jVqI677q2Lr+8XJlv2ejQgMrhsjoT2e19fs
         oB8xpbMuN7BpLFf2SN+87lPt0cCSIfJSFF4aICosp+RZz6FElsToU5SE9reh2Ntx6Ptb
         oA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642589; x=1776247389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEyrayE2kYN1hY65mdTstp1ag2rGZYENgFQhfxeU98A=;
        b=mugFQ3FQgFEU1140HRxkthwvPq/cdLDHA/krvbJKT6KXk4pu835RYyD/Hu0thK8BcV
         R7M7FU6OrdnaXJDhTh74WepDGxMbzmIGobTbTaNUgzpYQV92DU1Jz/jopXA365RlYps4
         H9+gfWHQZvlhEM6FADDR8P+XAQ1Gj3sXhSnJVwnqwhU6t7Yagy8snGm5UG7T6HcbQEPF
         hK54XdEgbjNWAl7bjdr4qhgEH9n8SPC1XlxubqKwUhdXIn6tVeCqVZxAor/uvyFmGwIS
         daMt6vydwFnXET2AOl3UQ/0XsXoqkGN09WdAHHuwNtiTU/B7xAD9WSL2YWJn+eBfFU2x
         xF4w==
X-Forwarded-Encrypted: i=1; AJvYcCVMvLXMDXx+T5ajm41eU+kRL7xDwhugk90tpGGlxzqiYFv3epSfKYtzvFzNX0JafIq3EwZqY15GkBdRPdkL@vger.kernel.org
X-Gm-Message-State: AOJu0YwsS3olEHrNaJRr5Mt94qAySGSrG9MNyxktYIdCm0ZYh8g9Dfsh
	NmThVbisVIe24xtfXwodRgvKwkUmamukq90sR77rLemyd+yxsWuicthIcYf8ljqhkhSP29OdJSW
	UJMxC2aiyUprQpO5hLqAYAMA+QCFnNXN4xb54NtFdIw==
X-Gm-Gg: AeBDieuxQmXp5RVq1D2EfC24tqMsLdSHL5YNZbgdPXKnQa5Nib4IVMQIdkMgK5K/3XN
	1Pd5slSFjMXSHW5xxfz5fOrBTNfFhf63vjSZKbszvGZeG1EtQshcOT6Mb4rToB+5AqoJqKRhZRe
	ggGZMyqAumGRMtqByy5Qyi0Opa1AmS1jk/ocA5dxkqJ02Drj+onpzbqWS+oLEIesSBWY/KrGTPK
	bHwMYB7SzUiAxvR8948yIZA+3hnbuILPDL8EAhXwc+WlhAo8t68vSNwB23PTPRXoOjq1COVDO4r
	8gCPbmk=
X-Received: by 2002:a19:f014:0:b0:5a3:7baf:516 with SMTP id
 2adb3069b0e04-5a37baf0529mr4522892e87.16.1775642588660; Wed, 08 Apr 2026
 03:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402025406.94272-1-rosenp@gmail.com>
In-Reply-To: <20260402025406.94272-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 8 Apr 2026 12:02:32 +0200
X-Gm-Features: AQROBzDWexNARo4IjITkl94P5SbK9YSsttWqIbmtAP-BJVdX4RN61uj8AM8oTYA
Message-ID: <CAPDyKFo=1MnF0SQTrE=K4Miqn8LQ+pW_p7Z-+cf=sRzt0g1zEg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: cpr: add COMPILE_TEST support
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pm@vger.kernel.org, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102308-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 03A233BA3B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 at 04:54, Rosen Penev <rosenp@gmail.com> wrote:
>
> Allows the buildbots to build the driver on other platforms. There's
> nothing special arch specific thing going on here.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/Kconfig b/drivers/pmdomain/qcom/Kconfig
> index 3d3948eabef0..72cbcfe7a0c9 100644
> --- a/drivers/pmdomain/qcom/Kconfig
> +++ b/drivers/pmdomain/qcom/Kconfig
> @@ -3,7 +3,7 @@ menu "Qualcomm PM Domains"
>
>  config QCOM_CPR
>         tristate "QCOM Core Power Reduction (CPR) support"
> -       depends on ARCH_QCOM && HAS_IOMEM
> +       depends on (ARCH_QCOM || COMPILE_TEST) && HAS_IOMEM
>         select PM_OPP
>         select REGMAP
>         help
> --
> 2.53.0
>

