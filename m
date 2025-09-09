Return-Path: <linux-arm-msm+bounces-72856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB2B5036F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1BF1C669ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B68736298A;
	Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adon6VqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021B36209C;
	Tue,  9 Sep 2025 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437007; cv=none; b=BMskJM9EbG3JMVpn/z5WN2csfOd80Wu7D5SzRRzP7AZaG0Ywet21Ovqk19CyeZVsQG7iu6W3qz3ihzQm/7vVDu92zWO9ph18mWBCii3MrAzGUPP0Im5WyB4JTq2l66PNT6e662lRkXRrBtDGnBWgmw8gMEEJWylXyzN0jNXUHkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437007; c=relaxed/simple;
	bh=zytzlqMbxEdF92RBbFU5sLbfxKEMFtNch/Ro1HOAnHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxyck27bWptnuIqWlt+u44EaaFlBsH0vTe0stPcmw4UaDwIKmi3IUqpXswX4wRXQpfMVhuBWTKVLmB2tF0G1SAlbHMCfpIL27RKMd94PPoD84eLBzMUwpgZdJ356NsizcpWVL17mCGeLsPUnrxBpoGnyEbxVcAUq0cNo6rJSA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adon6VqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B55AC4CEFD;
	Tue,  9 Sep 2025 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437006;
	bh=zytzlqMbxEdF92RBbFU5sLbfxKEMFtNch/Ro1HOAnHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=adon6VqRxPFZ1IbnUwHtFMl6VFB18VPUSL+W4iNCIP28mSxQGkV6PyiB3Oqb3r7+q
	 wvFO0iRMQ7sc54iJ6FmoZBElHZA451f3uYfO0gAWXDU87ao2l3vldX2zNsqpVWSxVo
	 IRIXH9ftV/BdVT6HtdV/6veKwLPC8g3cPyyYbzQBHlLsjBirrJ5g8duje4q2B65Eb2
	 MjdPRVVQ5gN1cbJXA29q1z77xB1ORU+T7ShKSqM9Qx82PNxyBpyHsHdBtPgC2fpo3n
	 pW3O2ji0OH9AZfBYnD+v1CyH5s+CpmHzIUsjtbvEzcvqQvghmnlzV+0i3BGzRX4j3a
	 1lkSVKUKn+8Zw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-romulus: Add WCN7850 Wi-Fi/BT
Date: Tue,  9 Sep 2025 11:56:34 -0500
Message-ID: <175743699538.2735486.1288022540614498775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250909-topic-romulus_wifi_pci-v2-1-3dc495d5559f@oss.qualcomm.com>
References: <20250909-topic-romulus_wifi_pci-v2-1-3dc495d5559f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Sep 2025 10:24:07 +0200, Konrad Dybcio wrote:
> It comes soldered onboard, just like on the QCP.
> 
> Unfortunately, the rfkill pin is triggered by default, so a workaround
> is needed to convince the Linux driver to enable the hw, after which it
> works just fine.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-romulus: Add WCN7850 Wi-Fi/BT
      commit: fc8089535425897b6efacc8531e4b5b63b85b435

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

