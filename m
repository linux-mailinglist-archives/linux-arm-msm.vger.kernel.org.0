Return-Path: <linux-arm-msm+bounces-109452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOTkGSIQEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:25:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F35BCA91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D7813078B19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE6F36C9D0;
	Sat, 23 May 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MM83fw0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA331372EE0;
	Sat, 23 May 2026 02:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502831; cv=none; b=JLtMcMkwL/29MQdT2dtGqpqwgvfQnOukdneVxKrP7hqEZXLtESHTGCkftIAiC30vYzC7rJHwJdWTmBGb4CmiMBh4w2CptBi8wii5WxoGEQfDtiqeKWY52780oNVdcjdlB0P9ZVaNgodB5oIGJ26rlJDPm7QCuoYZFNkuItRShMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502831; c=relaxed/simple;
	bh=8kMdChDAfM4xEN8AEEajEi2puaYefEQtmn815NE37rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/mZYfajnhkZlmTIhthoZzIrVO9DoOc4f213+cXSzwhge9F2zwbyP08mD5TL2h612di48EH71YbP/o/NqWJUx3gj7IjaoK4tDkAHh7R1c9DqcRSxSiHo1GTnPqlSbbI9GswXYJJpM4gsgurCSYZl9KPHdvs/VZoQHvmF9UruiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MM83fw0+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712461F000E9;
	Sat, 23 May 2026 02:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502829;
	bh=mtBw5kmSt2Rbfv07qzmeCjje3mVTBvJNKeHY6HKm/uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MM83fw0+pqjHTdhepkLtkrvzdKdXGRLKpbDcjCVwIqp79e/ZjbfiV6NhqN375L0Kb
	 miYfHHlLSLYu/SGfId1aMI6kzwzbj5j+AiOKldo8MSNA60+1GSZPQYQELGeKvgwvC/
	 hj7GOGG3wAP6BMGb/fAEV4V+BrHrBA+f3mL9wBB1UvchwLp5cucnIFPBQlTryFayYM
	 zSIFHeNlCYTKvuawr3F9MBLdMTJMBG4Mz/7WzKIQTLIbiDhtwiEgzg3dB4Swib13OD
	 lyfKDQh2ZrXsuqi4rTiR9Z6+nBuyFZwqt9sFzQrRVnL6Q8CVhYq8Q3IJBMpZONxBDC
	 gFwaitdxSO/JQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: pixel 3a xl support with tianma panel
Date: Fri, 22 May 2026 21:19:56 -0500
Message-ID: <177950280367.1097700.1562962771338381951.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513172549.1345-1-mailingradian@gmail.com>
References: <20260513172549.1345-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-109452-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org,lists.freedesktop.org,zhan.science];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1B8F35BCA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 13 May 2026 13:25:47 -0400, Richard Acayan wrote:
> This expands Pixel 3a support to the Pixel 3a XL, starting with one of
> the panel variants. The Pixel 3a XL has two variants with panels from
> Samsung or from Tianma/Novatek.
> 
> This series depends on the IMX355 front camera devicetree patches
> (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sdm670-google: add common device tree include
      commit: fe9f4a46895dc3062cedcdd38772dd578de9e62f
[2/2] arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
      commit: f3919fa784a3e6dd557dfe2c41072f55742e013f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

