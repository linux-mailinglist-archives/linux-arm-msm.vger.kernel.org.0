Return-Path: <linux-arm-msm+bounces-98483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OYWBXyvumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:58:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D282BC7AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6FCF31FF222
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C083DEAE0;
	Wed, 18 Mar 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvcCIFEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173C3DEAD9;
	Wed, 18 Mar 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841856; cv=none; b=qHA4IKvgwbc3hWUvwxdx0EArnQgukay7dl/BN9KORXZ9siQeyRtEP32nwe/fv4EetQvSK/7LoQEEfpUQDT/hKlWELdU86XNu1vjHdREMhh3I6g9pycJnaHNHhlwJelHAK9ZAFDX/Bhi/szohllYWIYwKk86EPSYU4DBFu89Gg5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841856; c=relaxed/simple;
	bh=h/qnSC9O9l/eFr8LmVvIiG9pULy9xPEYbVm5UO4mhsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ARcJ8hfHWkCsZFEiAQNVmXDAb+89uFD8JL+h/SWVh4vck5ZmSXWTItlqVDy5BfnEtJHAHpoavBquqB6LjtfuflQFtMbEV7f25RshrcFRXXpQxowt54EC/CMHu7Kqypxb1Dh0AUdwBer3vBfuyRCfMdHVFRy5OeewIUnuVLCa4Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvcCIFEd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C60C19421;
	Wed, 18 Mar 2026 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841855;
	bh=h/qnSC9O9l/eFr8LmVvIiG9pULy9xPEYbVm5UO4mhsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PvcCIFEdE1fBp9jVZ2kqpsHUKSSgG+ikOoRXiNEQfHBwa/RaE+ZnA7l/EgA51waPS
	 NJDHRNcifUb/I8ZsGC1s/GX8tckQ7l9e03rvayHkWAotJbyDH8Jp8MVhUvJ0ON/0V4
	 YdEzojoNioTW6HhTJcorsA/PsjBUzxraGde/Pob41ztxnATgzGRvnHfSPLlqfLP4ad
	 73tIdmCDUvhc9qGIiBVfaaK/qOKN9UB4/Fay6gZ8T4f8QbBYdcvHteyD5xW/0V1V5b
	 PFZQoifBJkaAuvqG+mce8m5+WHW+l6HzW/qlz6g+/oNt+L52/tadppzLnGwy/1VKod
	 eDjMAGvGpdmBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect sensor
Date: Wed, 18 Mar 2026 08:50:14 -0500
Message-ID: <177384182914.14526.6817086467365588868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98483-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,fairphone.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1D282BC7AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Feb 2026 15:21:06 +0100, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect sensor
      commit: e46755582c062bbda37ec81a68511e7a539b7b29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

