Return-Path: <linux-arm-msm+bounces-107470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJBnO9DNBGqXPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:15:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD0539BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B14A3073549
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A013BFAC8;
	Wed, 13 May 2026 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwSY5afp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2A3BED6A;
	Wed, 13 May 2026 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699393; cv=none; b=g3s3FpF1jqqNDWrlKNryhd1uvy3Cqsdd6iPMk96dp+PsEJET8D+bggzTMZcHhj8ZJ0T9Fy1lyp8c7RMeqhbRlxPhEwCO854kxpAsao1VTRU3JNdZrfTo9rol/boOBC//tlC2j9nC+sBJe6/ZDVcPTyBBq6keBVjrp4kGdMj1OJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699393; c=relaxed/simple;
	bh=WL5OEvMUQQ7OrwuuyIA4c+m9KQP2c5qq3Dghjnt1vsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VroVtYBVj1sIlS+GqnaIgM/wj9yBJ3xegP0Sf7VjD9sWiWN4NA566MphGUEXH7YvP6kHy7hXUlExN4BYELkTofETja60aE7NvY7f1AWMCaoXNQDMg0fd3v9BzydbywdeN4ef+MW3tz1lOzs85RnWgMaRRi3GXjfU+vGJim2a7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwSY5afp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA1FC2BCC6;
	Wed, 13 May 2026 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699393;
	bh=WL5OEvMUQQ7OrwuuyIA4c+m9KQP2c5qq3Dghjnt1vsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwSY5afpzH9tT1aRPBOo7ZMB8zZCKrGA8t29Z+6oHW9kj34li45H2wgaWY3N+Rf8P
	 CT624gKtIvWGBwjAWoWas6/VFNlI6827X2z2eXwE/41SEADE5PkPEVnq6LudLiRJDI
	 UwIIloIwpaBhRdCuy3DLTJbIq0zhhQ64YveY4mnvnxkms0ugnEy1RsDN9m8PNRVBAY
	 7kULZOBR+wTXBAGsOlikPWLh+gAxusbJgHxpi4LFxnj0xfRwvm+VtsQBKinqOq2mZz
	 I29VdXxW/mjujsuaivtzhySlibeVepFkUAtUeRdWrnPmvf9G505Btz7AF6Q/xBcKaQ
	 C/v5YPUwL/bMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] IPA support on qcm2290
Date: Wed, 13 May 2026 14:09:29 -0500
Message-ID: <177869936437.1496622.7203773008975759520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310112309.79261-1-wojciech.slenska@gmail.com>
References: <20260310112309.79261-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9AFD0539BC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107470-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 10 Mar 2026 12:22:29 +0100, Wojciech Slenska wrote:
> This series adds IPA support for the QCM2290 SoC.
> 
> The configuration is based on SC7180, as both SoCs
> implement IPA v4.2.
> 

Applied, thanks!

[2/2] arm64: dts: qcom: agatti: Add IPA nodes
      commit: 9c633eec37782b2d31281a0289882bb419b5ad18

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

