Return-Path: <linux-arm-msm+bounces-107666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOZsCnXkBWoAdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:04:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD77543B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2D71307F0C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A815A426D3C;
	Thu, 14 May 2026 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWxDfgVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D0426699;
	Thu, 14 May 2026 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770174; cv=none; b=dx9yYpFvfQSsBbyZGv0sSrHOjW771NitoRhxXNELwtkhLLJ6YYBHArdG0FQeAVjmoz+6IbfHVXOulILot/lHgD2wyJ/RjSTuEA8Lb2TZ/VZ+q4wdfOONJffOGuETxz0wkSC6aMi0RWYZdKcS/IeY5yVtClZ6XdPLggyP5NRaVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770174; c=relaxed/simple;
	bh=miWqwuXW4uXn7hP5kXnio9l83Z0PIMZVknVLD+RZEsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MfhJ/0YmvtkQ4Jp1M/wMM5SJk4KE76PP+i6nf425qddHKQ0QJ/THvaWwBvzRwk+3Hz7dutayKMxwUfuwSm659Mc0I5GwI4gm4ShBgTB3HQzFmhYluZLqLfiiu+F68e2QaZSzJdyeqzIAVzbiRcgy4xCR+NOpm7JplZwyGakYeaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWxDfgVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEDEC2BCB8;
	Thu, 14 May 2026 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778770174;
	bh=miWqwuXW4uXn7hP5kXnio9l83Z0PIMZVknVLD+RZEsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YWxDfgViCkqYN3jJyyecDYTNh2tiJpTlFd9lZdEhsTkcTN9Q4D/EfS0gpSLrua5JR
	 E0bf76Bnzpix4v7ycJOxKxP2SvRnbVf/IVJxatP2zxwiQjIbqcd1HQi7RQzxYb+Zir
	 uMVKDt9b5+inMQ4JVMmUxvczTNSuKJWpV1bjFQkwsp5jsbYDL86v8z3EaRGV4NfIK+
	 NDFULWkiCH4c/8yFUPl/FkGW5RGrDblTZILrBB7vI30nY039PRCBEJujXBh2JrIXw+
	 zL8WcTq0Kzm8Hv1FEN80/ZyK0uMf0/jLsy4+V+M3b/NIGa2kqgRCvmr1/TiUdclPPO
	 4lELGujZ5r5dg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070109.18271-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070109.18271-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] mfd: qcom: Unify user-visible "Qualcomm" name
Message-Id: <177877017297.2799073.11189624330763951508.b4-ty@b4>
Date: Thu, 14 May 2026 15:49:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 6DD77543B20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107666-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 27 Apr 2026 09:01:10 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.

Applied, thanks!

[1/1] mfd: qcom: Unify user-visible "Qualcomm" name
      commit: e3071bdd833d6152d8bfc87182e5ceb7eb0eebfe

--
Lee Jones [李琼斯]


