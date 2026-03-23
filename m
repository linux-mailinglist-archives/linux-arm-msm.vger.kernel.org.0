Return-Path: <linux-arm-msm+bounces-99318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNKHFqVWwWmBSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:05:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD692F5BB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E39B311C8D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997E53B27EA;
	Mon, 23 Mar 2026 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxjhZNkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759FA3B27D0;
	Mon, 23 Mar 2026 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277450; cv=none; b=k/oodf/MDG2CITK9dEYU0n7L7lAg2e6PXajjTMGRMOZtCoN1Y10CJiKNe7aY2FuOdgjtJN1jTJeERnmClZ7e3nlels8hUBGy5haaot7tEx4Gtrm5zljf9Y5HUebpvbbCymeR3tU/DvljVcmB0/XT4U//fAX2WTGCNLKtNQ9j/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277450; c=relaxed/simple;
	bh=4qRIaeK+Da2Id63knZn2dzzm1FvJA0BnNJE+LD/2WjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFSXGeDXO8knw04szonlciadMDyXxJdXyfoS2ON8U0pTfEzMatLVLcUPg6dx+3QZEOxtd0pjn/Nkn/NjzwV7G1HSXGcuT351wIUpy/2G09d0ObrsunSGP5KfvwFg2BFjhQblp/d4+4glbGrvLmkvpeNKdqtOtrIiXqZcvq0ZjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxjhZNkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F4BC2BCB1;
	Mon, 23 Mar 2026 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277450;
	bh=4qRIaeK+Da2Id63knZn2dzzm1FvJA0BnNJE+LD/2WjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxjhZNkS2Ut2+sLlTX46A+gUZrd8Y7ppfrxmE0Z3ymWX/ypA2inppnRFHvkfujqOz
	 K2k3/Rehty+pASTISXLsv48qCd2M9YgaC7o5FAqQJ9ZQU6B1DEcvnATd/WsXSkxKtA
	 PERTQUsdX12noT5WbwQBrfOANfIIeqCeAf8mMusSMg0htPKozQI2T0KQMh1+tr6LY7
	 iDv735E+fmbZAQNjWrmHGjHACE+qWiPzCSxUSVMVGs9HuQ4ZBe4YHcoPrPEKA7pUTm
	 kI4kMdUkA2tvR8WeB0PiUe3BVd1BAS6wWFxkfdTGcidxnEWaLTL0yGmePX/hPz63Th
	 RGx0jYHh7DibQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Petr Hodina <petr.hodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Enable uart and bluetooth for Xperia devices
Date: Mon, 23 Mar 2026 09:50:43 -0500
Message-ID: <177427743914.13372.7392803305106120222.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
References: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,protonmail.com];
	TAGGED_FROM(0.00)[bounces-99318-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0CD692F5BB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 13:24:23 +0100, Petr Hodina wrote:
> This fixes the uart instances defined in the dts so the serial
> console will now work if uart is attached to Rx pin on the uSD pinout.
> Also now enables bluetooth.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Correct uart instances
      commit: 89b28c2954138695b424aeea6e9c84db6038a41c
[2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth
      commit: 3a8d129af774b36f01cbe5e6dd9f9a62dd04a058

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

