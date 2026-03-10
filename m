Return-Path: <linux-arm-msm+bounces-96455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEsXK96Gr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:50:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E092446A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 994C9304C6A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7523B8BCA;
	Tue, 10 Mar 2026 02:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAqkDq5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB13AE715;
	Tue, 10 Mar 2026 02:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110889; cv=none; b=Mv0tWTaGVm/wact6BnwoaK4GP8ciROmJgeNwq0TZDgog1uNgKqDphil2Yny20PMBGhtGlvZHx7yqqimIgOZ/PpCnI+2EONto+8enyMsTR+wtw9Wv240shrl1+AOZJ41suVToiQgHVVRzWM6EohaF/4DmGF6eTUonEhYZClOqGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110889; c=relaxed/simple;
	bh=W45ZP5D0CAegV+yjKCbGwNmowt+Sq+b0kKm/0pVQjvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAuGNFJP8kzxttUmu2Zl/HrwQGzQPXlqGksGu7qc/Bxk9wTMWchE8w83+M0cN1JZBW5nScrLWZCg6ao2ieF/7K2437ailNVkJXsfp5Wks6dnAuICFHwVc5cdDW9i5t/X5rUGgfsxB4pNP+RxVMIRuR1XO5kgzbNDR7IIlE1NhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAqkDq5j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0727AC19423;
	Tue, 10 Mar 2026 02:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110889;
	bh=W45ZP5D0CAegV+yjKCbGwNmowt+Sq+b0kKm/0pVQjvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iAqkDq5jJVdoCmqYUFA5lVkhVP45lwuIYcsRJBC8x8QWicXcDQXJL9htoVjuytqdr
	 Ttx5zlbDGXgrUceGeLLwHWkreoO19Nr9D6KcMO1cBxOeH7ZUC65NrRv+REUE7NvHex
	 1CFixGnHfksS0xoyEqFeLPjobSLgtUq2Gsi5j6QQrim2+OakvqRDJdscPIrjqWMKFx
	 0U91opkjoHCc0VRBhdPWENuP/SMggngpqkgLTMPlSQ/mxr810yKF43NuZME9+Ubi9/
	 ZUjuYNHb0PSR1/CKrW9DkObq8ciblhBJCf+HgmUW2tXLnDUC0Er4LRCiMvQajjlcQ+
	 QPcEyXsp8PwBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] Add support for ECS LIVA QC710 mini PC/devkit
Date: Mon,  9 Mar 2026 21:45:44 -0500
Message-ID: <177311073309.23763.2930165926198703821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120234029.419825-2-val@packett.cool>
References: <20260120234029.419825-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 45E092446A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96455-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,infradead.org:url]
X-Rspamd-Action: no action


On Tue, 20 Jan 2026 20:30:04 -0300, Val Packett wrote:
> v2:
> * Added missing dt-bindings:vendor-prefixes patches
> * Applied suggested cleanups and formatting
> * Dropped power-on disable block
> * Added qcom,uefi-rtc-info for the RTC
> * Added qcom,calibration-variant for the WiFi
>   * Board file sent: https://lists.infradead.org/pipermail/ath10k/2026-January/016719.html
> * Added a comment about USB ports on the HS hub
> * Picked up tags
> 
> [...]

Applied, thanks!

[7/7] firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710
      commit: 34a49e8508b5d00816d25fe3758b474471e7e051

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

