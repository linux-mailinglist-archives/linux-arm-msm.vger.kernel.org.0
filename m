Return-Path: <linux-arm-msm+bounces-106520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH+rKMb4/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:40:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AA4EEC4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F07330AAB7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C8D48C8CE;
	Thu,  7 May 2026 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpsvdSEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437D23264E7;
	Thu,  7 May 2026 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186093; cv=none; b=l9bCm1tqUlobdb/YkuhQAaNu2X5uyQjcgOoPrPwb27150fnN1TbOGjf3uArY8zOTNHaSYsjds9wPdFXpCw5P7CxB0Pbfn7eQXpfDmNLtHyuUItfxW7QmB7EjHlVLbFehle5nLgWCTxgyairBEslLLksz09rYlhJ+bjO4tPMHYDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186093; c=relaxed/simple;
	bh=16jqoewHM6BKoPp/s7nhS3uNZKEN2BrqgUO6WqrSbbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ww4iZf0snUGaTvoAZ1wnSnL3Zl28PLg87WxNQ4xwtH4GnO91OUzjeHXeSGJsjR+mx4gHVUIrbXCUJEwAu821wl12emmiv7p4itG6uXbSBT9vzeqRFZiaoPOAODTer/jBX+ZwK6JurlgLF05KKbA1Tz7XMEhTl1poZtjlCCSpv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpsvdSEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E4CC4DDE3;
	Thu,  7 May 2026 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186093;
	bh=16jqoewHM6BKoPp/s7nhS3uNZKEN2BrqgUO6WqrSbbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpsvdSEhSKEUsVe/eLbHFLzybNzfutPQUqotnhiT6V+AYaFJNJNY07LqjRwCZ8utQ
	 g7t36PWYCuIHiVuoTOgxSTovMssQutiU6uLbH+iAkWO3BC2q6GkvdpD5Y806rAZF/u
	 Fdpc6p8PwFX9JThfdG0uZkPcQS9NenMnfrH60qDRiMMY9ry0rzsRzZMfg1JIeRbeA7
	 A65syZBjIetbZ8sDMsnmzSrRk/qdDpJK6kPjd3sCNvSjbAcizC/O1HJQASlHK7UJ6h
	 C8RFaceJGU5UHwJAMdBsNY6GEMbHQLvc/0yvpx4AT0sc3FLRBX5oJR0NLXRMhuEjW5
	 ZqTS7+ir3LOEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Add support for Awinic AW86938 haptic driver
Date: Thu,  7 May 2026 15:34:18 -0500
Message-ID: <177818605993.73000.16772057162907380051.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 506AA4EEC4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-106520-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Mon, 02 Mar 2026 11:50:24 +0100, Griffin Kroah-Hartman wrote:
> Add devicetree bindings and driver support for the AW86938 haptic driver
> chip, and add it to the devicetree for the Fairphone (Gen. 6) smartphone.
> 
> This haptics chip is quite similar to the AW86927, and shares many core
> features but has some notable differences, including some extra
> features.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support
      commit: 66fb209e6035ed90cbff71c48c60124803da5c63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

