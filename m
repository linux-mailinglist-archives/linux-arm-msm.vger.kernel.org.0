Return-Path: <linux-arm-msm+bounces-109451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NLCMxQQEWrggwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:25:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541565BCA7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1847230750DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DBE33ADB1;
	Sat, 23 May 2026 02:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/2cyfcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8036C9D0;
	Sat, 23 May 2026 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502829; cv=none; b=iv3ANqOm8qa5a1HJ6ou9g8/MtjKeN1GLJu7XikYIbeUnoWj5YfOgOv8cyZv0ViSd6w2LtkHFznEZaqaCBkLtztxIbtPqGW3watpJv+WEE+itAUd8IfE1pc61S5ggUEFyplKigr+CImxpcVJUznUKFLTNLo3DXQCg93hq5jZJYtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502829; c=relaxed/simple;
	bh=AVNZKY6dqdTn+HxsSF1uyKDaz1IM5vJzobVANjxdxIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XStqsfNnCh+vxD1bseKjNfr7ngWhsT/biJtcWnFhSI3Up2kruPXAb6xLhJ6fDLDOoTHjtRA2hYFFDgQyiMxdAZh+Q/0GJUuuo3k+wAuwis+3HkkFbtXMWd3YoTaKYEi65HOt6mI8MXvIyix2PPY7TS0zPKt1SZW082IeQYaRwGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/2cyfcM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4361F00A3A;
	Sat, 23 May 2026 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502828;
	bh=lFM5PWOdU5SJvKfq+edrZNlVRfXERJPQJqK2WjRV0rI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/2cyfcMuq7HfchzqdP1HEW7M5rJk1BvAIrR9mnaRzzTJw+GYeIc1SpNgXtHyqHyA
	 /Lz/aPZV360LhT296CJp3I94RTxdzj/9uYKdEVxOSkJW+iog4F/8g/GJ8kowfmGh+A
	 t7A2ZnfB1rhCbS9dKRLx36EMpCInCC15ADxyqoKAXm//gsvu/JmUDJ0iFTnVLurCS/
	 68QX8NQK+HMi6/jjohzFCT8pyBC1k63/uQo/7LHpCaBfP9/Nuv0CLjZJv65Ui1T0tI
	 OFRAdfKDHGSexVL7e0SfHqFVYVHWupXYddbCjnZnallvaOrtrUgOt5ExSpf8z2pZVf
	 JVBTC+1CPulXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: Yifei Zhan <yifei@zhan.science>
Subject: Re: (subset) [PATCH v3 0/5] Support for the Pixel 3a XL with the Tianma panel
Date: Fri, 22 May 2026 21:19:55 -0500
Message-ID: <177950280316.1097700.11750721441821313484.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310002606.16413-1-mailingradian@gmail.com>
References: <20260310002606.16413-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109451-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 541565BCA7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Mar 2026 20:26:01 -0400, Richard Acayan wrote:
> This expands Pixel 3a support to the Pixel 3a XL, starting with one of
> the panel variants. The Pixel 3a XL has two variants with panels from
> Samsung or from Tianma/Novatek.
> 
> This series depends on the IMX355 front camera devicetree patches
> (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: sdm670-google: add common device tree include
      commit: fe9f4a46895dc3062cedcdd38772dd578de9e62f
[5/5] arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
      commit: f3919fa784a3e6dd557dfe2c41072f55742e013f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

