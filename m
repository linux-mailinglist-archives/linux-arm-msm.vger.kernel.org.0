Return-Path: <linux-arm-msm+bounces-106518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C6uLbX6/GmgWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:48:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D874EEEE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D2B23105BF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738E448B370;
	Thu,  7 May 2026 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma5JFNDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB12322C78;
	Thu,  7 May 2026 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186090; cv=none; b=XPDjLEGaI5HJh307+agDJZ8+iArWbokoFmP3ymxUDPZtbzpRj3FXCL/QOyx4N6+jVP2jfaEcLaruzEQdrkqPj9DInzmyDh2B0pyEPX5am68nsUAXL0nS5xOeOedOoorRzjRX1HRu02joiXvy4fate9UnFEvJ8sIO8+/fGGXqcdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186090; c=relaxed/simple;
	bh=gBSg43E1+gZv8T4tOvmVeRwE71ueQsFm0p1IWlRdYdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqN4DdGMyJSOz6PYXxqJ1rnw499CZdJAvry4sk/rVJudqIjXO7//rD4GscJBaT1xVQTas0CtZEAEy6tLgBOqYc5H/gWB3GBN/HkLLJHv4JslS3jOtEGBeENKzPxoL1pxnrXW5wCJAMzsZa3xHA+lMh0alMceDXjmjZ1iL1YR340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ma5JFNDs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242CDC4AF55;
	Thu,  7 May 2026 20:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186089;
	bh=gBSg43E1+gZv8T4tOvmVeRwE71ueQsFm0p1IWlRdYdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ma5JFNDsU6gNFmKZoUVO/oeg1vBUhxicti9HA9Vq8CfPCqO/IhK9eb1E9qI32rqbZ
	 Kbz7Gq4ayxjTDVVKmxYVah9B56f8ZN3AOsbTcoyOPd9Pc4Lo2UeInDgOlnNFpPwu21
	 c2Ha5aLyEGHKu0M4y6bKsIkGdV2NpA2wESFoZmAZ1WiL6Rm53HmMHoWiHYqxuE/ogZ
	 wODjm9RDcs833DCdeEW/OzaFv8Tnefro2DFl5R5jRgHMBpbgE2lMsDncuM6O7/HwY9
	 7XKZGEwqFS5b+uqN3gkhFQByx92lWsY2s+1vzUngZNRoeHHUYl0CU86Jti5OwUp8CY
	 3621nIJhmw+yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Martinz <amartinz@shift.eco>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	David Heidelberg <david@ixit.cz>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
	biemster <l.j.beemster@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v3 0/5] NFC support for five Qualcomm SDM845 phones
Date: Thu,  7 May 2026 15:34:16 -0500
Message-ID: <177818606034.73000.2091597676731274522.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 20D874EEEE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Fri, 03 Apr 2026 15:58:45 +0200, David Heidelberg wrote:
> - OnePlus 6 / 6T
>  - Pixel 3 / 3 XL
>  - SHIFT 6MQ
> 
> Verified with NFC card using neard:
> 
> systemctl enable --now neard
> nfctool --device nfc0 -1
> nfctool -d nfc0 -p
> gdbus introspect --system --dest org.neard --object-path /org/neard/nfc0/tag0/record0
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: sdm845-oneplus: Enable NFC
      commit: 50fc93244973f5ebc97eb06857fb6bed0e3cbd39
[3/5] arm64: dts: qcom: sdm845-shift-axolotl: Correct touchscreen sleep state
      commit: 0689aa70fe28ba13eb1d8b10d50e08157ade9670
[4/5] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
      commit: f585772843ba6add712bbf2505055f34d07b8622
[5/5] arm64: dts: qcom: sdm845-google-common: Enable NFC
      commit: 10f91b0dfaf6008e5b4f75a3f4d8a507f4c0d5ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

