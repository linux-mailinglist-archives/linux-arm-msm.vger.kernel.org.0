Return-Path: <linux-arm-msm+bounces-98593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG66Jbduu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:34:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0882C58A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE8631BF0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA35E386551;
	Thu, 19 Mar 2026 03:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+W1uQQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972BF3859E4;
	Thu, 19 Mar 2026 03:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891097; cv=none; b=p+ZFowMoRN2ujTkpX9RQqSU6cFFAWZ20oZ5mrp5vIrxc4KzqctZ4CxMTNjBXFpaZU1ukG8pOPRTk5Ybb9T5xL4y57mQY9W77OpCe7wR8of9WEGF3kxlMSK5zYDNlDSis1/ueY2o597UnUrQRtAWW73maRGhp+W9Z1All4x1F+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891097; c=relaxed/simple;
	bh=6VYJLLONOLlln7lxgXlXBXZYaMAb0juqS/3R3mHaVwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5FMh3t7o0Hml3EC0rAY8svpsDTSyRyV2eT7pshdZC7d9TU+GJ3AefXKYqmLpwpQE8hthIegZ9ju6M4W7vopfJI26UT3gsmezofS8gisJccZ1+ZVgyYvtH6l+9PIEs3KVHQHd1pavkbxPmY8dGzYrxZRiU0ynzyLe6ykfhUkM/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+W1uQQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A151BC2BCB2;
	Thu, 19 Mar 2026 03:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891097;
	bh=6VYJLLONOLlln7lxgXlXBXZYaMAb0juqS/3R3mHaVwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+W1uQQjZytzZVSHx6dxz72l68/ZiGxolwqn/AyWfteSxwgPvhSOTej2jBiB8/2Wd
	 JXxnZWRJbSbNTfCnNIr1W/0POYz/n9O/8HdgyZcrGO/blT6KGzGf0woXYRe3z928EV
	 We6X6gkyjfp1Mq/CbmihBOye4vcKUJY4H6ebZBFJEAl0RnCGqEhDtuHYVjkU/7pyrH
	 mpVhid5vT8t3Ts9WW721iUS7HNEOiNa31uML10lnUevzEDWqZP+o9C4vUWWIWDM/MB
	 zo2+9AspPt65Tu0ZgKiWuVHCzYcrF1yavkJ8t2ASKuEegzPn0GEkXAkWKEVJjRirJg
	 UFUFWcNLmSUqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/4] arm64: dts: qcom: sm8750: Enable display
Date: Wed, 18 Mar 2026 22:31:16 -0500
Message-ID: <177389107869.16612.17730446555306560266.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
References: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98593-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A0882C58A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 17 Mar 2026 18:08:18 +0100, Krzysztof Kozlowski wrote:
> Changes in v5:
> - Drop 192 MHz OPP mode, because it is not correct (should be 19.2) and
>   not needed (Abel)
> - 0 -> 0x0 in reg in few places
> - Link to v4: https://patch.msgid.link/20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com
> 
> Resent with some tags added (but not half-done reviews - please ack
> patches if you do not intend to actually review them)
> - Link to v4: https://patch.msgid.link/20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      commit: 02a72bbf8e5a7ad451c962669b271ded69158cd2
[2/4] arm64: dts: qcom: sm8750-mtp: Enable display
      commit: 905ec7020f7e79eeb03958bf314a237d627a2788
[3/4] arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C accessory mode
      commit: 8cdfbdbdd97dc4edff458e1a2b16b6dce2790405
[4/4] arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB
      commit: 1b2d8cc7c73a2d09ee252c86e3ae1406001b69c8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

