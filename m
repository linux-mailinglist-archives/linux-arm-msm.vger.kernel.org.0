Return-Path: <linux-arm-msm+bounces-34295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9A99C64B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD81F2848EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A5C156256;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Llze9jh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C601547EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899262; cv=none; b=vDjevFi13MxLsYQx6Gdurz+bvbavcNWYdBPFeTIUxqHaKLJNnbcnrGeX2qs/nCCpZ8J+PhTO4s47+0lbTCsf/6R3wg96FYDw02bj/BYSyWwRKwEePSYFnUMnhjilu6jYVHD1jAk8aEqsk+qnOWVZ6AH67ON/tkENVqwXvXbyHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899262; c=relaxed/simple;
	bh=q+NlL4DsYHEgc8vwNfGB3UevLXD776VA9p6DwABQLAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8uBo42Ik0AJ7ObQkfqQTah5AtzeBNZwKTGdTghMKFciJOwNfG5gPDRYktULSC82mgb6hSCEj/oXuP685/STWHmktyr2gKKR9t8PvmYmNCU7EIuHV+/gQsL3MTN5RCyrcLEsFyrHBg7WvbIO+UMDHCH1u6lPFxTdEzvuT3KwUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Llze9jh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 550B0C4CEC7;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728899262;
	bh=q+NlL4DsYHEgc8vwNfGB3UevLXD776VA9p6DwABQLAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Llze9jh3RVsB+7X+EYcV8Ljenpo2CJMmdhiM2nfE9/D5bVUIQ1JZ8++0o/AUlOO5Y
	 tx4pBDa4Kh+SrUlfXL9Ywqje2m1uyMzM9ZQK+catdtXfFx9zWG2oQrJ5deRMDdR71g
	 4upaie9zciKjJpC0PP7JuQMNi8CBLE5eMfwfmDYh9zxoi481dKCDxsZwIrakwlMvps
	 GPiWcLuohASvMx+rb+gwKxpVdJnO3OEq7TownveQ97w8DRfr09wBnB2Lb1H0VJAPGX
	 Ytuh+pm17g4XYFYyNuIRAcY5DW9lNm41wGftu89ttcE+TCBwYi4Q74LmkvfNqlVAWp
	 Khhw8Fe83ZE+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E65FCFC530;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
From: fangez via B4 Relay <devnull+quic_fangez.quicinc.com@kernel.org>
Date: Mon, 14 Oct 2024 17:47:27 +0800
Subject: [PATCH 1/6] arm64: defconfig: Enable SX150X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
To: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
 quic_xiangxuy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728899259; l=655;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=2oL5VRIgrDO2dMYMSsbMFqFY/afbcI/s90GaKevkxFE=;
 b=N7GvkedBJSFbgSnJZKVagff/qigmGINyMf44K8RHHSACNGxZKqi7ny0vi3HcL+rVrUj85sYOP
 qQOBT35qyxsBZOdTCfg8jAtARN5h6woDtft2VVmwXm5G1+ynndYjdnr
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Endpoint-Received: by B4 Relay for quic_fangez@quicinc.com/20241014 with
 auth_id=245
X-Original-From: fangez <quic_fangez@quicinc.com>
Reply-To: quic_fangez@quicinc.com

From: lliu6 <quic_lliu6@quicinc.com>

Enable SX150X pinctrl driver.

Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 76f3a6ee93e979e9e39cb0283699a2753b0dddf4..13ff005ebe0e9cfcf171b08add24465d0ab94f05 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -630,6 +630,7 @@ CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8550=y
 CONFIG_PINCTRL_SM8650=y
+CONFIG_PINCTRL_SX150X=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m

-- 
2.25.1



