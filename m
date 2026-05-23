Return-Path: <linux-arm-msm+bounces-109461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF26NZEQEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:27:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF05BCAF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D45253038D6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3520E37F8BC;
	Sat, 23 May 2026 02:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mY6uM+Lh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC69342CB2;
	Sat, 23 May 2026 02:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502842; cv=none; b=CIdkismrif0ZrybUhFZJcRsyVOsLX7B0gRS31UzF0yOTEBC/dALNkqKR82Rb+utg2vRWDVZ7G0vlQLYGGs60EJiky1WzD3uWjPQbJe0Rb6L274u93yyhz0esZXZAuqlrjf012T6eYvlvSK/TN44ALWtNSPd7Z4HCj+0qTrV4bU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502842; c=relaxed/simple;
	bh=dp4Pw23n/mHzj2l9NiWlMXA5ORClSLnA/OrhBd6ppFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTgAJ5hGrDghooy6SEcgXgKLREWiq23BZKongvexzrLXeXTx7i8XZhK7XniArF+gFkVENVou3g+gKdNYCVQw4+5WZ2q5AS+3JO5SFkcISoAh8Jue5s/ituskJMyABcorFigk/qp4oQblFBnznZNNKNogjME9z/HJ9Uxfs1Vi1kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mY6uM+Lh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931AB1F00ACF;
	Sat, 23 May 2026 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502840;
	bh=4r8MfUnpgSyov5Pcld0q6gH9ZLQZNp/Msg1JBlcgFZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mY6uM+LhTjGORVDExzSgSh/g2rWvHHSlTxVzk4bGI2KjtbBNOafe+S5h744+7hP8S
	 HdG800CmbM+Td2PoJbIfO5/TSS1Er76EIaaSW//3l15pfc5le2p7MT1lMxkGcKc8fu
	 Pb6N8zWFND747sBrSFiFIFy6Tgh/Z/Q6EKuaeE4lJgNwTT3Tm6EuZtAHl/keOkEzu0
	 zbLo0FGmuPmdVnXoY+ddSM6yOUIVMAxQUE3mStUWsYSYEXqQ+T82OTAYws2M0hA9Wx
	 69XlvCCiDdffsoo/Ha1OJnxSpfp4jI2zLIr+iWh0nvYprLZdz84em1UsizbmiTxnBK
	 ucOA2VEl7lDUw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: sc8280xp: thermal zones fixes & additions
Date: Fri, 22 May 2026 21:20:05 -0500
Message-ID: <177950280363.1097700.16797543420488367071.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
References: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109461-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 35CF05BCAF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 07 May 2026 22:34:34 +0800, Xilin Wu wrote:
> The polling-delay-passive properties are unneeded, remove them. And the
> SC8280XP contains a lot of TSENS sensors which are not yet described.
> Add the thermal zones for them.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sc8280xp: drop unused polling-delay-passive properties
      commit: 6ba85ffe796ab4eff37e3229999b34a99954fb49

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

