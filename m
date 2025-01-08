Return-Path: <linux-arm-msm+bounces-44274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146FA05078
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D2F1884306
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A271AA7A3;
	Wed,  8 Jan 2025 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAa+Cwr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAD71A83EC;
	Wed,  8 Jan 2025 02:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302405; cv=none; b=riZBD5k7k0WnqwmbxpSdL4BjoFrnwrK2B55ZMiRRc/nmUXolMS5itCCOJCJB6gHQQG/NjVtG7GIdPXOBQl5AKjPykVS3Qb8ibpMH7xvdsHvDy8yElukYv69xLUOmt50dUd9ly5Rk6JS5xBRTmyPvvO/DJ+h+trdZS9nqMEYrWvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302405; c=relaxed/simple;
	bh=sEvrBYkeHxriOOYACaz1Rg2NUbK8djz2fyZLuumVDwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=faCJ5xMXBy7AIBk5+31jO7+HfNIK58MGAn+NQUreF15kDVCg+1T/ssHboZL9C/1fbN/pekVy8R7WP7bpIBv8ozF3eb8iNMejJHt0zxPnRhBiMjLpSI/jowy9XRCKoMcguBvyEY5cJOXB1BETvmIcXAMMY5G5oqxxhs8uGeoDBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAa+Cwr+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59F6C4CEDF;
	Wed,  8 Jan 2025 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302405;
	bh=sEvrBYkeHxriOOYACaz1Rg2NUbK8djz2fyZLuumVDwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MAa+Cwr+KOnQfUAFp+e3D2K9Rvcm26lsav39BwmyD5SbOzl4DYOrR0QFsegNNjCpt
	 1MdkMQ6e7v61wykEd0Yd63ks322dIA0XJjgUQHst5/A01dO465d+6age4neHqFsT1H
	 cAla/0Xn3zhKzU/Rixxcd7LC18oUcGN3kb5VJ4H0nfazyZ3DocXyUye2kUek0xXRSA
	 iM33XKZrmgxiE9F+G3t0LFSIGM4HGyjYcvbqe33ce/we0ZebX7urUkKRtd/zlG+9UQ
	 CWeELVwxvx+klPSq8+PXCzXUCG7qwaG1IaGw39uss1ah4NiBVlFIxKlBG4vi7gtNLq
	 pf8wMgIVijYyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers
Date: Tue,  7 Jan 2025 20:13:16 -0600
Message-ID: <173630239530.95965.12883981771624442797.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107155452.389154-1-krzysztof.kozlowski@linaro.org>
References: <20250107155452.389154-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 16:54:52 +0100, Krzysztof Kozlowski wrote:
> Enable necessary drivers for booting Qualcomm SM8750 based boards like
> MTP8750 and QRD8750.  The clock controller (GCC), interconnect and
> pinctrl drivers are considered necessary for early boot debugging, e.g.
> via serial console, thus make them built-in.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers
      commit: 87be7b32e4847dfddbe44f6ea281afbabafd08d5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

