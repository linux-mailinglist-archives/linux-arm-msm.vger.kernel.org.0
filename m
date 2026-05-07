Return-Path: <linux-arm-msm+bounces-106526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ALJLCX5/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:42:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C894EECB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D1B9306C4EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3C6496901;
	Thu,  7 May 2026 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPJPuKQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287E7331A76;
	Thu,  7 May 2026 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186104; cv=none; b=M2TBm4dgwj4Do0qfQK1oxKJJiAyQRogS/kOkOuuAyH62WVaIFWqp01QlnT4XrquEN5dFHNknOYO7LBGa5Ai8Egep/ZpV8SeKZdtyyv6Io4SL62AzqhtcH4Wf2bSESFK1XGYf/A86HtKLeiAgFA/daj8wgNQ3j+IBpF9K5f+28EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186104; c=relaxed/simple;
	bh=Mkb2fUZdS58KQI6GU7z6yEmOIhuKVHUKhTOuoSHfcoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmOGG4f+Oj1gD5jrfy1gDRd3hyHLn2qDpg9TbSbVDdJqWaTqiQLd/cVYvE59RPNiRXHNsB0CMK3NvbDWsO480pikgVpiPmmKc/gwyHWRaRXf2xwQQUaViZsS2kMr1WyjC3Wb02uopelUmVjdbdayEFF6ITvyvlR2r9CUg8gVwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPJPuKQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE31C2BCB2;
	Thu,  7 May 2026 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186104;
	bh=Mkb2fUZdS58KQI6GU7z6yEmOIhuKVHUKhTOuoSHfcoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jPJPuKQ2AvWeWPEN04sdWmMQor2Vwi3PofIedsule2XMt4KPe7JzQpxSS++gPuGLX
	 lXTYX831aV0Ap7Dgg92MDKKq3EbgnUApUCndy0m21MGrG6cGkmeCptKtD2XCJhZyw8
	 DBXefkRkMA4gnw+6eSDBkQ/dXQKQ/QBcjKcoMAli+l0swtie46J3o4udDGw5Y48dEx
	 EoY4q3ncwfgWSDy0tz8ootUBzc4BmLfpLADHgXuPGdAPFaKEAvef34/lQ7iY873I/q
	 gF/NrYtUxmZdgjfqSU8Vv9pubSKOsbhCClassoKXPv6NIrrGR3Bq377M22BbbniR00
	 4CtP1IZki/Igg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support
Date: Thu,  7 May 2026 15:34:24 -0500
Message-ID: <177818606019.73000.16971125796875847089.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-aw86938-driver-v5-1-0712909df423@fairphone.com>
References: <20260403-aw86938-driver-v5-1-0712909df423@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 37C894EECB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106526-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Fri, 03 Apr 2026 10:21:33 +0200, Luca Weiss wrote:
> Add the required node for haptic playback (Awinic AW86938)
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support
      commit: 66fb209e6035ed90cbff71c48c60124803da5c63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

