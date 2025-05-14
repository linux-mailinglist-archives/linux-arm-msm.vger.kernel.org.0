Return-Path: <linux-arm-msm+bounces-57998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B2AB77AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E914C59BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA20296FD4;
	Wed, 14 May 2025 21:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CX6nGlzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D136296719;
	Wed, 14 May 2025 21:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256686; cv=none; b=up0hmD+Q2wAxgmwB6DGhIPaU5arN7iJ4BVOAIztioOzr40NYVXCqi04WQDMXsTeCM1g6Sea+wZY75mY1xCuL3a/j6oRFfkt+d/4oixqMfTPGeKdEtUPWyil1SWZ5YorL0owSmsrrQGOHcC2NST2KKwTwnngw3fZ2cCf5N9eMaDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256686; c=relaxed/simple;
	bh=zpvP6SG+V8t3D1f/rqv343NqairaURkH9nLfQePzjQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fsf5t6RBu0rzFm4p8od0ZboGhgzc1piaNjIC4sbIotjgyNitpd6UEQK51qdL47+yyIrLD7eWpQOiajgIBR5HuOn8vaQJtNrDN/R03qdBcBef4aia1BSXTap3p4GGu9msFcANjzXhq0nbM6f30TVCvElN1hYbQGi1G9chf48Ck68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CX6nGlzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBC3C4CEE3;
	Wed, 14 May 2025 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256684;
	bh=zpvP6SG+V8t3D1f/rqv343NqairaURkH9nLfQePzjQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CX6nGlzPPj3CxgmZVvjDj/x8nAeLcFioMJAqKj/l9kwXwoAUeVIFXEKUkmylvURzO
	 9AYSHJrvO9VFNVO0NUldIZK7m+QMOPdTenrKKs/iSKH8Z1uFuw4tind7pvHd8u66Ap
	 5FKtD3913+inI/ALitTg11tyI5Ld1WNunG/QR0OCyFJdppv+7eqZXUYVCCTyli6DI1
	 UWvlHNNVQ0e0wuRTtvzC940SEkp3tDTkuaiEoK3n5J6OiRMTazU3BKPA1zCpnjLNex
	 u5URMD839LyHNujXZTF9XwrN5Af8z35H5uOgizTgnlAAqAI3cnfZ16IjU3KYJMdlZs
	 v13KFMPHOKyZg==
From: Bjorn Andersson <andersson@kernel.org>
To: kernel@quicinc.com,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_akdwived@quicinc.com,
	uchheda@qti.qualcomm.com,
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Cc: Sahil Chandna <quic_chandna@quicinc.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
Date: Wed, 14 May 2025 22:03:52 +0100
Message-ID: <174725663050.90041.10602793586013241412.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250323123333.1622860-1-quic_nkumarsi@quicinc.com>
References: <20250323123333.1622860-1-quic_nkumarsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Mar 2025 18:03:33 +0530, Nirmesh Kumar Singh wrote:
> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
      commit: 6a563a9760af9d5476faf8b3fd419b0714ab0b4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

