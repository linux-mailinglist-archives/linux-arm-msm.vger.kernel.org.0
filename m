Return-Path: <linux-arm-msm+bounces-34615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D44999A0E49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89C4A1F23D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB9C2101B5;
	Wed, 16 Oct 2024 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZWMiRV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024421019F;
	Wed, 16 Oct 2024 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092740; cv=none; b=q22O7bcuVTWQIqz7SE1Eo9m8/zcgVqdtepl65gZyZ5QKyBPCKxjJnPrNB2Ebs1S3Hw51nkcGHlfsbjGyHEwpze0sZ56XFQXd/Qj4q4IFnmzwjNSgR6CK6c0u/3mhQJzU5oJrQQN/kUwNK+hXDr49KMdDRi2zh7RB2M8feznD5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092740; c=relaxed/simple;
	bh=rMfpyhiV+PbTmmZBrYFuon3KYhuIs8mqAm0v4X/7tkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBKk2waj/RRWOXSlyXG9blU9I5pBH+N+p/QBo1IpqqmOyaRQahNDHpbX3Nld3PMndzYjtEpDEyhId1l5YCWZ5byIUIrF6lTXrMz3Qwi6fs52rVdeD38BehSyiLYBYxvwXAbWXiF1PW4+gekRFW0fmShq04PYKnVzd919Fw6vSco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZWMiRV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDB2C4CEC5;
	Wed, 16 Oct 2024 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092740;
	bh=rMfpyhiV+PbTmmZBrYFuon3KYhuIs8mqAm0v4X/7tkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZWMiRV8LssVPwOt6LJS/t3sZcLPVC3DeaOwXiPPkCJGOA+kPlN4LgOovu8BF5wdL
	 5ON6E++tsY9vLUIY7nxF9xsJMrFepyRG2qOrwfEtPUoX8gHIG9+f7cqDQng4tFc4pA
	 gGije7CFU6fXad6PUZN/WtWMscVCLnVGheoPuccuvUm/MWZKhh1vsgG+pk3ij9JF0a
	 xEWN+0aMXyVWfoTgte8W7v8w4D5vnYwgfTG9s/Uhb0Bi7VjzOsKu2BpXEssJ+kH0FM
	 ptRs/9lA4yNnSqrtkj8S1CMluyy+p0ysdEeq98oGeqGakKEOkTbp+hI6Or4HzKJrEe
	 a58l+A3zrteYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: rename vph-pwr regulator nodes
Date: Wed, 16 Oct 2024 10:32:15 -0500
Message-ID: <172909273721.703216.8542227612470713556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015122601.16127-1-johan+linaro@kernel.org>
References: <20241015122601.16127-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Oct 2024 14:26:00 +0200, Johan Hovold wrote:
> Rename the x1e80100 vph-pwr regulator nodes to use "regulator" as a
> prefix for consistency with the other fixed regulators.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: rename vph-pwr regulator nodes
      commit: 87c1870b5aea744d73f0e4442a285056c64d1239

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

