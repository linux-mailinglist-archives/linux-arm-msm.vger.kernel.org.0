Return-Path: <linux-arm-msm+bounces-107597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLBuBEPKBWqFbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:12:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C254225B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9698D3011861
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D723C09E4;
	Thu, 14 May 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAQG1aji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80F34A76A;
	Thu, 14 May 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764351; cv=none; b=LfOH9DWItzu8hcg8eWBFhZkNRdBzlTt3CNvl65x7u47C672Xoh+8wEsb2Gw+rWP6TxQo8ePYupdywC9ZxOOoZEnSzA7ZT46XcDLGnTsi10pO0Ezq/PxzlpkYuA3yGGA8C21KBwUP156quKCMEylOF9G85KdY1RL/hLFLopSFmOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764351; c=relaxed/simple;
	bh=X3byKglcwlhKASxew5az7nbemUDAZMnxLRsW1MMcPi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iObmokWf4mucPR6mNW214CarN7GllDYBQ/HBvU04O8tzSwNRBpkVHRNczaeYYcqTZe8zxQvMl0GWZgqGMIQHr6cPfcUMdJ18yBWOuJxRGjUkrpJ1PQD5t7Sa+jz0+nxKK9UXgDuO7/g5z9WVuMNrpHeCTPUvSH477rt2jPsoXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAQG1aji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02050C2BCB3;
	Thu, 14 May 2026 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764351;
	bh=X3byKglcwlhKASxew5az7nbemUDAZMnxLRsW1MMcPi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GAQG1ajiTPZ4fr1JygczqIYs2XuPYCMwZ8+BHKZGz9gXSAA0CLG+YMYLhaGidWAm2
	 9JeXTytJbN/i3tZ5dyxoAWjhMwoHMqw5Tbed3XaD9Ha2c7kNfoD4aWtKdn+9mgl1jL
	 U3ynUGLaBblrHrBW1ktjC86JEOY5wbk+hUd9d6wrkY0jrNNmpaf7hJ70FObP7KiZvk
	 5r36F20IBCKpWBK93MGgwigrO04cBQ+Rc5eO6fZbjg1oTQg6/VIE0nM15h74TZdm+y
	 nQF8CnsFanA/tUq4WrM/iS4xT/H6edsBmoFYnRlBibvvDYTMB2qYrerpCVl3iofD3u
	 zFEoueRGFBnzg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
References: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: mfd: qcom,tcsr: Add
 compatible for Nord
Message-Id: <177876434874.2727968.11616112100538201915.b4-ty@b4>
Date: Thu, 14 May 2026 14:12:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 634C254225B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107597-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 04 May 2026 16:11:22 +0800, Shawn Guo wrote:
> Document Top Control and Status Register (TCSR) controller on Qualcomm
> Nord SoC.

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
      commit: 9b67d03470e1afe66b65d4f814af3506910e8113

--
Lee Jones [李琼斯]


