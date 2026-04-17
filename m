Return-Path: <linux-arm-msm+bounces-103574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DS/KsnB4mny9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:27:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97E41F27A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77419300EAAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819472DEA9D;
	Fri, 17 Apr 2026 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcvSllyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315F175A66
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468353; cv=pass; b=ODRt7Dk4mZEHwICtvFPmjI0fjlfBR+WGyL3Stcj+X2dexy3c9L+AcMi9vGPbe3BXTlIx0jjO8qY70aenZMNmeihQN0gGaeebvb3nRwR92oKVkt+nbJH7rCZu867+8DV2SD1Bpn8s0aFHKHwxbC0p/xR3LvaPupwoRa0cJvx6ZI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468353; c=relaxed/simple;
	bh=MjIQctpj736FvOr9r9T+GH2PdlFKJhGbVkysNIKcyPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nj52CyxEUZdgGzfaYv6fpAzVykv8x/s7TsCF9DfRUviPBE1+1mle0Y+ARuUKP0OtogY4YPC0GmaLOmU4uoJV9cdJy6n9n+NqWQtsEzULb5aPOPjjOckss0kLBNhjMNXbQN+lAyZ1NtOb/uF9JGSgwues2kfzgoXLg3R122sPTD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcvSllyB; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso338849466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776468350; cv=none;
        d=google.com; s=arc-20240605;
        b=CxauXnM6fjoce6fX5gYS6JvhPtpBq+lVnKrMzHpStp0K7LmcwVpQXNABO6V+EBAeOo
         Gx9ZYsQrrrVSd02dOjs0tBzjO2Yld9FmoRfkx6FIhQSZFK1y+ylu2/kMCFsF6W35SKSa
         rMXrD4khNkDDlmTB5b9zvP41upoq9OZrGvfKg+cafO5fiocHKqCZ0qLsVF0hovvcRatg
         j2lIZCTrz42GfJSG/xfZkP51zugfKWWmiDBxFpYnlen5dLwp0Jl2Xovm5t838cLlUnnP
         t5XdprutMXu0fKvpea6HFsYmliqncgA6nndb77DiDeHGqI6B0vSlFCVbgBvRG7Y0Xpei
         8OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCPgH9fB3idgCLADxB85+xCruOhXdU05koe/w11w3pc=;
        fh=CQG8aLFu4+znSa8+cG7Ih16/ysaySpnB66D1COnXhZw=;
        b=H2WtESNe53PETDJuhi8fkUQQAkzUafSD5XtQkB8bFYvNBzEuMPDO+MhvEncVQmDcm5
         hNZlPj60kwfEfPXFk+j88OLmbZIE0meBxBbs2hfGSxwQ1H3dvnbG1IhrOSi2YBwDfSNv
         Kk45yGyMrtn4pEqbTFt1WH3x473so9md5ZJXycMB9ep2WY6bbuuyBZ5AVCmFVC1ssiKb
         5yFLbVMvlwefjHuLtbQdmZbXGTPo41nArwhUgpkZzsSFTJK9B233iEW0O4EVv4+2dQFQ
         Kj6GxjsxT8NZ//Z26PArJGZ+iG0jnQ21o8Fru3EH3XZ4PAs8VFdTWcL1qg1I1IH2mE7r
         GXaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776468350; x=1777073150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCPgH9fB3idgCLADxB85+xCruOhXdU05koe/w11w3pc=;
        b=pcvSllyB0Atra2mVoHDfKYSiKA7LpjQEE4euyq6pATI0o98Xj02HvL1hvsaLtEV6nr
         2wTC1ZCs1xItJ3ZxArLTqCRsv+H6xN1+GT6h9sTn3KCZRF/DO6U8GjqIzFiH7+ZqZniR
         F7Vpv1UbIywfr0JV/VJG3WRiXqadFxW8Sfyr3RYTVDbtplQSAOCrbi2TDkqWwHR9NWEX
         SFufNAJ+TkXRwMhj8RbTc59rLHlo4sLXp5mz0TdR90MVJXfcmaeZXbAGbZbhbi5Zuvxr
         7X/PKz2BQHMxxyG1t21xoWSUbMzfTxhvtvi2g4Aom1Dd0jgU+kGhvrC4ye+V0vVrzOx+
         eK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468350; x=1777073150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCPgH9fB3idgCLADxB85+xCruOhXdU05koe/w11w3pc=;
        b=KFvIw+Kptf/yNkJx5P4zHMTh2S/fy7twPUHnUVV2DnnrRZes3bHcdFPUJd3PP8sQZo
         wfNz0rDUEXWESkzzPIZw9efzNd3lr/ASgSHOnUU8uuV9/vLhetF2z/t2d7xuF5rcPjth
         gJbOxdtAERFlOHPk/uiiFDkHGBxXWnx+b++2d/BGxlFbD4H14jrXNauBI3tVgX40kOpX
         RUb3LOghs5S4v0EPWOF0RJHHtCQKrZM8yLrEmBtm0Dr1Eclo5s5PnwCvUcdUliL9Fmrz
         EoJTWAwV4ZNXGXjuamn07CN0SQU5L7Sa/5124ZlMAe8v0VH2FMxoTsvj60wLMwd6mMGW
         nZRA==
X-Forwarded-Encrypted: i=1; AFNElJ9mCpA2rxxJyQoomo5UR0GyxlPfz+mik4BS0skEKYKTobXA7JbB0O4kzcbvDEVdTLThxdQ0cgIHm1kW5odn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcgr9eVJ5opnLDo/lfnYMuTNULj8CwOazUR55BWqdWKtYchPjd
	0c6jB5tjxb5zBeLElilpJa55FtYdquMHGyxhPw2cLbdCLdzOnAejQbf9zmW/5bmUi1z4UdI6eI7
	Iwkvadh/QQnBfEJm/XAZYyJe6n+qiT6Y=
X-Gm-Gg: AeBDiesnVTp7yy/EoUmPxwPPaEquhp9xyPsA33fgSraExA0jUvoIVN+M4cBdKLcru0f
	ZTRHv6MAr+RGCSt+z91RSdU7LkYzAjQev+ET8rt6w5puMVbNQzNZOndto1iXUrEqLVkqX+B87c/
	l7muwPIFLScBzIA8ce5gj2mIapvhUKCm6uI/c2rskh+C+EClvdxVx8dvKOUrfabpfyQiZsAZ7dP
	BCAHOx+Q70XnRv2F2l/H5whI5lPyHZk0ZBORjIBglQ9zJBwlMEKBWt7YBfHKFmk4t7QLKPwgm2E
	Tec8XSi+a84YyN6onr7bp+Q4d7yGm/x6EAP0/k4cj3R/2Q8EQBFEkMtO4MLeYkpnukgWctMoEzd
	30AioQwdxgz+XEg+1
X-Received: by 2002:a17:907:3f17:b0:ba3:7d65:c373 with SMTP id
 a640c23a62f3a-ba4218ef69amr259731266b.10.1776468350071; Fri, 17 Apr 2026
 16:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417-wcnss_ctrl-v1-1-5811ffbd8f49@gmail.com> <bn7vppl2ndcz4b6alpr33eniy7ft7fztnwnm4ez4eenbi7wu6q@km3xn3syfqfq>
In-Reply-To: <bn7vppl2ndcz4b6alpr33eniy7ft7fztnwnm4ez4eenbi7wu6q@km3xn3syfqfq>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 17 Apr 2026 16:25:38 -0700
X-Gm-Features: AQROBzAc10qC_aLa_pPG470OeaJCwb81skq5_4gFjHoE5hVWvddjxSJffozaBJ8
Message-ID: <CAKxU2N91-yFCUds7K1ZhYeLab2cduOUct59wj-KfUA_QO3PfYg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: wcnss_ctrl: fix firmware leak on req
 allocation failure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0D97E41F27A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 3:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Apr 17, 2026 at 09:17:52PM +0800, Felix Gu wrote:
> > In wcnss_download_nv(), if kzalloc_flex() fails, the current code
> > returns -ENOMEM directly and leaves the firmware reference unreleased.
> >
> > Fixes: 908061f0ad30 ("soc: qcom: wcnss: simplify allocation of req")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
Same as
https://lore.kernel.org/linux-arm-msm/20260407221519.6824-1-rosenp@gmail.co=
m/
> > ---
> >  drivers/soc/qcom/wcnss_ctrl.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> >
> --
> With best wishes
> Dmitry

