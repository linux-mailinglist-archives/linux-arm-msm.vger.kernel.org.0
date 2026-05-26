Return-Path: <linux-arm-msm+bounces-109749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOeEOE5WFWpAUgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:14:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC265D24A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AAD03014941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D833B9949;
	Tue, 26 May 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="N2XsJ7Zu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD33B6C15;
	Tue, 26 May 2026 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783244; cv=pass; b=tVDlhYGQzE+NakxRQ/ZdQzdFNKajruNUBGMNHe/0bhoB6lGXvTsb9VtOiY3x5QRVK6y0INQmMt7ASOiDNQMj4HAQey4cybil2rTTbUiz6mJYVgKgqIOZwmtih1sOC39xgo9d5wIqt98jOUUOxOaOWPwySWW+NJQiAjOT0RSRd68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783244; c=relaxed/simple;
	bh=P7wa+c6ir3HFOsyQyi0Sn8GIG1OHw74Jj4E/Zw88OQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuYSz8ARaKkzaRLNLMShaWOaBWbXwHdkRr9TIcl3OPlHZ1ZW3h4ZfKlyRsRc6EhbyyjY97AcnlJKt346nPeojUQngCnKI+rnKwG7dSNjXV+f9WnUG+ZhubiUyaoBIJGvnCpRT0dDh1sOp3zL4VMAQpOQ6apBW7djoxge/oWDg+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b=N2XsJ7Zu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779783227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k3bA9HZNIzRtUPkmE7kwEdDdWYNg8Aloog46APd+EBI91iqlgCkYTcmeu+VwXU+Sw46Jc/QCkOmZaQaeUiJASy7NrpRtLtV5sVL+Scec7eIP5a9CegKiEDvMGEwE3mJcbWEq9wxd9CLy6Pce61/sni7BEQ4/mwHcbZMHOX1Ua24=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779783227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z57MFPRsdwTmrFHrY8/qbDvLzFQNW2cw6NkQLTP27iU=; 
	b=hpU22Gp48+Z0Wm97DWuzKpDSxvEs3nK3Jhxi56iDpdeyPjisXbv9qicq/DDDEqHyS3cyyUexsNTY4fND4bYJjeB4IPMofqlRl+ojNBsD12f89/4HzqfZeWz8vYOz7GPgq7qGYE5RhB6oGL2d4hnnrhignG0O5Q41z7x26/beKto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
	dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779783227;
	s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=z57MFPRsdwTmrFHrY8/qbDvLzFQNW2cw6NkQLTP27iU=;
	b=N2XsJ7ZuTI0GBkgNN7kDh2yF6QLEPsugXHZZ3iyooyQIsKzksWv0PCuRazJr9/24
	I32TRZV2Q+65kefvmIgyYEXnOy9a+V/J33o7uaa+PXaLj1hWylgj8mf66KZtQG7t7c7
	xu59xxy2IqWO8SbveGXxMgJYKfmoyibp7E/Kx6gA=
Received: by mx.zohomail.com with SMTPS id 1779783214315576.654606631172;
	Tue, 26 May 2026 01:13:34 -0700 (PDT)
Message-ID: <e26a72b9-db14-42bd-9d3c-7e9620a71926@collabora.com>
Date: Tue, 26 May 2026 13:43:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: disable mr-label-maker-test
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Helen Koike <helen.fornazier@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260522-drm-ci-mr-label-v1-1-39f778123b30@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20260522-drm-ci-mr-label-v1-1-39f778123b30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109749-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,poorly.run];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4DC265D24A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 22/05/26 07:58, Dmitry Baryshkov wrote:
> The MR labelling is not used for DRM CI, however the job got enabled as
> a part of the CI pipeline and now prevents it from being executed.
> Disable the mr-label-maker-test job implicitly.
> 
> Link: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1672049
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 56088c5393cd..c1087731d1a2 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -386,6 +386,10 @@ linkcheck-docs:
>      rules:
>       - when: never
>   
> +mr-label-maker-test:
> +   rules:
> +    - when: never
> +

Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh

>   test-docs:
>      rules:
>       - when: never
> 
> ---
> base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
> change-id: 20260522-drm-ci-mr-label-727766d73e95
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 
> 


