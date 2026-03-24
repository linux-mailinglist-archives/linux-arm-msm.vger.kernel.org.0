Return-Path: <linux-arm-msm+bounces-99551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPiMFGwKwmmOZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:52:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B568301DCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 405073027B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829D339F17C;
	Tue, 24 Mar 2026 03:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUnzAakW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E80F37CD5D;
	Tue, 24 Mar 2026 03:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324243; cv=none; b=FQFTMBHoUflN0DNvoBaEUU+uRbrBHZ3peEUDeqwwO1O7wIeAZq4K5ZmnFC+WXKsp4CppfBIJXQiNAgrkLgJYhYNmXpac5IoHYkHtkiKLKSSeS/unQkiF06ZMLRxKGsszvVpxKpudtATR43U9w3FmywkqdoO0hY2wrbhEw/++Myo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324243; c=relaxed/simple;
	bh=NBA17OjnfoRMK3yy32Vvg7P1XMfqNxgtd/jusYj6USc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Irp8U9kpUXg///mzPZhzR5IFmf6FIqhmM2fMM91CEv9onrr5EQPHjPDALbvhvZO8BUOSfrYoHVWL+ckLWIlW3ZVf4hw76nz9NVQQzU/4wTHBR6/yFiP8woprUylLLV2sETopQrof9T7ERjw61aSex+Q4vFAbk8Hr8fea7Q+Lt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUnzAakW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C2EC19424;
	Tue, 24 Mar 2026 03:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774324243;
	bh=NBA17OjnfoRMK3yy32Vvg7P1XMfqNxgtd/jusYj6USc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUnzAakWBJkrHqaK0tUkAc2c8EdBnEGY016gC4uFS1mKRa4kablIvnB7PKVCjBfNb
	 q0sVhH7VdYQIulPzHDLgVvye40a+ltOz5zGq5I48BwhQpoy1SeJpluE1xX/KRZpiit
	 IohvGBuY222pRevvEMNTYGN2cMt4NcMiwQyxFI9PYTGrIZvToCRwuTPPEpoMDDVrY9
	 XmH7DmWWI6RpfSQ382YWJER5RfAfjRgM7sbShl3j+ydgHMP3tvwI6FO6VS/xmTunTs
	 uBJo/Yz6WFcOmufJvJN942FerVFTEM4wXxPWEDL+YQhwlbncfvoHlGcQdHB1zNGfdA
	 vj1w0ejb5PYRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: firmware: qcom,scm: document Eliza SCM Firmware Interface
Date: Mon, 23 Mar 2026 22:50:35 -0500
Message-ID: <177432423484.37653.3862045260966517643.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311-eliza-bindings-scm-v2-1-b2d2e69068e3@oss.qualcomm.com>
References: <20260311-eliza-bindings-scm-v2-1-b2d2e69068e3@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99551-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B568301DCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 10:43:02 +0200, Abel Vesa wrote:
> Document the SCM Firmware Interface on the Eliza SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: document Eliza SCM Firmware Interface
      commit: b4d4a4f6e2ca171c5f1ef6b9e387943542eded09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

