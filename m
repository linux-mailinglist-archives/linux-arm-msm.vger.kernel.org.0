Return-Path: <linux-arm-msm+bounces-102775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEfdK6MI2mkEyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:38:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB803DEFF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 944DD30215B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E4F2EA731;
	Sat, 11 Apr 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KojuZtuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A42DF126
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896718; cv=none; b=d7eR98R9F4RzXwP7KRSDJn+N/i79jr5g1v3k6eFhBXtS15e5YIfrRECO23AwjHjvdMyKktUWPMKjAltPnI6EwwLxMqnq/C+BhqAWf+SiSpqjqeV0e3AifCBF7YiAQi2HKalEGVqPCeGAn/TChODv0NvhMXSEMoa3RsHrZkuqUP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896718; c=relaxed/simple;
	bh=WJwPAsSYyhBmXwIaIw1VAto7NG+MlEuN2t6R5r+/qJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AItATVhkMswAcPHA58+p9P85ubwJwryygufenvm8c4GraEV9WrWPjfflO1LeEHleC8AjTuQlM3LFbcUSO9hIGs2Is0EQqQcn5yxM3jOrXj9HvmztsvjyvLmfq0y9MbixpFUYRbFgLMH6UZ/32kLL3Jl83PoB9X24CzKo1wIx6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KojuZtuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631EAC4CEF7;
	Sat, 11 Apr 2026 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896718;
	bh=WJwPAsSYyhBmXwIaIw1VAto7NG+MlEuN2t6R5r+/qJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KojuZtuXa+vfA+4gyCMqMFo1YA6loJ6n8pXUWBGJKSsrjBq6nD9XMBtxdy95aFDZG
	 upszcPCrjivP+hrJcwlzW4LAnH4rY6Un69RhXgwhOKRxnC5MjZgulSlOOb8M8vhNDE
	 VOJosRb7JzeG130LU17K7XZq9xAzym9kEUWxtqhNmEVgF7T0OdNeia0hvlUg2Cyicn
	 ZkAe80SSGgXH/Zik5Ol0Bm4rsW1Tmcg26AMnCmZjpgwlgybjGKv40sk+gj/YnGh4Wu
	 WvORo8CJdOUvDpC8VaQ1fup7Z+7V7/ZxHVnGRjQdzeCnDD9D5yI5OSRUT8VLwCpTM3
	 VBdHT3LBvtkoQ==
Date: Sat, 11 Apr 2026 10:38:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Paul Sajna <sajattack@postmarketos.org>, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, 
	Sudarshan Shetty <tessolveupstream@gmail.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Casey Connolly <casey.connolly@linaro.org>, Jie Zhang <quic_jiezh@quicinc.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Alexander Martinz <amartinz@shiftphones.com>, 
	Amir Dahan <system64fumo@tuta.io>, Christopher Brown <crispybrown@gmail.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>, Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [GIT PULL] A few more Arm64 DeviceTree updates for v7.1
Message-ID: <20260411-amusing-hot-koala-cfcdaf@quoll>
References: <20260406132007.2264408-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132007.2264408-1-andersson@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102775-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,arndb.de,postmarketos.org,oss.qualcomm.com,gmail.com,linaro.org,quicinc.com,shiftphones.com,tuta.io];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DB803DEFF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 08:20:07AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
> 
>   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1-2
> 
> for you to fetch changes up to af241225893ac4933bb8f0615f2dfda8ea2326ce:
> 
>   arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X (2026-04-02 16:08:54 -0500)
> 
> ----------------------------------------------------------------

A note: your GPG key has expired. Consider dropping expiration time. At
least I am planning to drop it in my next keys update.

Best regards,
Krzysztof


