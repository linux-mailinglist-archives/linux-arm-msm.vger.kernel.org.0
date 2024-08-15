Return-Path: <linux-arm-msm+bounces-28695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450F953BE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EE91C20C19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3094166F33;
	Thu, 15 Aug 2024 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbC913GL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D0166F1B;
	Thu, 15 Aug 2024 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754488; cv=none; b=p2tRFNPbaHdoP0De2IptzpOAADtGdxn1QOIc52PyBxaNFDSCoKDYzaNVCYIuJCowZrl2eNA5EJZ0FwazA6k5w1wDxlC4ttzLrNR6Hn+mOj3cSeMtGConVU9mJg8Vi74Mje4oej9tllmr41jpMwcinn4Q4maCNUJZQ2sLSoGNVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754488; c=relaxed/simple;
	bh=jdtvxN12j2glT96MLJMEePFrWPUlhpG6F8MXoF5kH14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8BPpdnlHqEy4n/I+2mFVtrmmFSrph9qxJr+3DERo2X9v1tpXxBzopXWLK2UM+28dyfOPIJ7Gf+GWEC93cQHEqSdDw8qoBKkP8X/NQriplyw9uJZJuuU4iGXFCX8q/Qt9XSUzb+XqJ3jHXGlAWGEUeIoE0KMTl0fI4B8KmZSkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbC913GL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5C1C32786;
	Thu, 15 Aug 2024 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754488;
	bh=jdtvxN12j2glT96MLJMEePFrWPUlhpG6F8MXoF5kH14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbC913GLibFgD2FuhIWSWHRgoLcCVBjNtv9qU9iRgPpSG6ADYnJ8TjgFaUzLnNXPg
	 GsQkH07EelXy03jy+VqhJBr8OhnclTZbxEZ+WlShMPCnOYcDWBWgOGr4H4wp2kftjB
	 OFB2AMs0BtOQX5GQkDDSyQZ34XlahVAB1Rzfu44LQdrahAvj49k6qKoLupdssK3hu9
	 0dz6Vg5K5zDSCBh1RKeC3X7TihBFbYeRE3XT6CTm84DlJe4t27XcWWgEa7z4JBAx1v
	 Il3BwTI6p0rNsFZLaO0toq0Qs9L0jSRBBhdBuA6h8/cjDGwsXSbfpKB29gsXaWkIRj
	 B8uHajLqentsw==
From: Bjorn Andersson <andersson@kernel.org>
To: mathieu.poirier@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manivannan.sadhasivam@linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Naina Mehta <quic_nainmeht@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/5] Add MPSS remoteproc support for SDX75
Date: Thu, 15 Aug 2024 15:40:41 -0500
Message-ID: <172375444806.1011236.14414517896816771380.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
References: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Jul 2024 12:19:19 +0530, Naina Mehta wrote:
> Add modem support to SDX75 using the PAS remoteproc driver.
> Also, add qlink_logging memory region and split MPSS DSM
> region into 2 separate regions.
> 
> These patches were co-authored by Rohit Agarwal while at
> Qualcomm.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: sdx75: update reserved memory regions for mpss
      commit: 7a7d98fca65db42647b25de6e964a5cbd9743486
[4/5] arm64: dts: qcom: sdx75: Add remoteproc node
      commit: 41c72f36b2862f17266107a957b25aabc4702db0
[5/5] arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node
      commit: 42a7b7ca4d1ddc456093af434e511f540a89c8e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

