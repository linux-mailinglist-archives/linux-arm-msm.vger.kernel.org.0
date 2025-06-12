Return-Path: <linux-arm-msm+bounces-61053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5014AD6686
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F393A0400
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AB722D9E6;
	Thu, 12 Jun 2025 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2439T40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC41622D4F9;
	Thu, 12 Jun 2025 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700866; cv=none; b=l2L/7zGbxTSiIsI1Khe2cyKV0BRYBK7uy4Hf0GrEficIyGlN/PvvxepZuYwcjtCOPFQeap5XUSeCgNF+QRN876krx/boKzkVulcbl4+dunSe0LW4VqWdcLcNDKgg8IeJ3bikiEeskeMxS2ddE5efjWKeurYlhNLjU+pIpW4ESD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700866; c=relaxed/simple;
	bh=tWoYJleyJqwjf76qvFtP0cOBOfcKNn3pStGHLxNPSeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h25RAOMeYGeA87oA9hYmwE9bAbYOFKoYkeaSMGfeBdnmG7fktW9FUpNaOoEDjVa4OGSUgIwyVNzw7OcXrbbhu8/SMbn9gNT/ywZ5SDBOyVQ3Yf0cRKh9mav633uOLz//20tq5kHa+mV8AjN8qKdBBJC45dLMuMZGDD+S2kP8wwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2439T40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F25C4CEF0;
	Thu, 12 Jun 2025 04:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700866;
	bh=tWoYJleyJqwjf76qvFtP0cOBOfcKNn3pStGHLxNPSeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W2439T40qrp/Z1JkyLMrBu8Qdrmo3KMfQHUlPiCB+myhX/nUXS9OpXENiPkSk5Xr8
	 M7RIY5ypEJ8imM1/kORVE2Roc0lHWbD062XsKqGPr0edNDNRV1V2x4oDqigOBrU5XK
	 01WFbcx79KYd3pPIEPDVptLzhWkUPDvnkcqEmEvPYpdzHlQWEx58HXh4c9+gSNnaXV
	 mxgO210y2R1o4JnAZx4Wl4JSuRqeJ1AHNqZeDJ48Sm7jM1RmE/NA7uM49uRwEBG6hq
	 3cnSSgA7dATWXAWs3aYbKfskH08fJccweeimoBuaHeUruCH7/QVaDd3tqfE1iRI6TV
	 02gk7mZCGH2Mg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	robh@kernel.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	quic_abhinavk@quicinc.com,
	quic_rajeevny@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_jesszhan@quicinc.com,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v8 RESEND 0/2] Add DSI display support for SA8775P target
Date: Wed, 11 Jun 2025 23:00:46 -0500
Message-ID: <174970084187.547582.69937628185004387.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
References: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Jun 2025 12:48:49 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
      commit: 73db32b01c9f89daf84613cc9c62ce5fe93745aa
[2/2] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
      commit: ec04e5b4a1887d7c5d29f4efae4e54576c407605

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

