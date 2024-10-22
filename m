Return-Path: <linux-arm-msm+bounces-35328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8C9A987B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7505D1C219A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C5714658C;
	Tue, 22 Oct 2024 05:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8+JkDOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECBB139566;
	Tue, 22 Oct 2024 05:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575144; cv=none; b=PFV+P+9RvLKdWhcW+KtlhrKVIuldcZEq7b8tnhSzI47XJTh8E4UhpIBEoi5CbSgjCr5l0B93S83t/7V9h11kqDJ1yQlEvUI1t06pjY02KYFy2TPC1Eq6102jMhr2cs32Np6ypxEmTGoZSwHR399bUXBYm0yxhYOH+iPhWNXQrM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575144; c=relaxed/simple;
	bh=SVR1YzNYBxDl66dJoNkcDCN41pPVRrJm6SKLlp9sSAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I+wXd2CC7PmUpPRQK9EUemt5g+117NHXnZMcJqfVCumlibNuqjvWxsVIMbeOfcV6XAOvsG3atGd0h6V5m+k0vVYGtV4b/bF8k4xzIeQdhj/7kjmZMM2sTRHknaqcp/vi4tM5wiw+Vfv5hkl60W7qmmH5IgyBV1W42v9ODTl9ZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8+JkDOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075ECC4CEC3;
	Tue, 22 Oct 2024 05:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575144;
	bh=SVR1YzNYBxDl66dJoNkcDCN41pPVRrJm6SKLlp9sSAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i8+JkDOK7adUz8O/it1mR9RfOmzgs9jyF2Yhr3i/ApjpfM1ye+alCR7yzXGp2SS0y
	 oJxJWBk8V0sslplGbqYLVnmpPuO6lW9+/MFzI2HMXKmp8pvq2zfUyoRBomzEY2veUN
	 2gMFQK52NYTS71G3Me48kjs+b+pzAJuxPh4TlOO4IhFTgBMjHoBQIl8nr4UUi+z5W4
	 RvGdFgu5J1HR+ToUMJ0RijtiHRTgsXBjFLpK2yZv+YCZXkI+Cw19YH1Jgf+Rz7Yvvr
	 Dji/csKer2QMziqnEK++MQis2Wwx2meBt6ROvx85I78h5U7oFM/xeYtTijFyBqCew5
	 j+PUOvktW3cEQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20241018-qcs8300_ufs_phy_binding-v4-1-261c7c5fb8ff@quicinc.com>
References: <20241018-qcs8300_ufs_phy_binding-v4-1-261c7c5fb8ff@quicinc.com>
Subject: Re: [PATCH v4] dt-bindings: phy: Add QMP UFS PHY compatible for
 QCS8300
Message-Id: <172957514092.488852.4271758268313965008.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 18 Oct 2024 13:57:50 +0800, Jingyi Wang wrote:
> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
> on the SA8775P.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Add QMP UFS PHY compatible for QCS8300
      commit: 30c280bc8e4555d55d7de7b85983990356c1e8e9

Best regards,
-- 
~Vinod



