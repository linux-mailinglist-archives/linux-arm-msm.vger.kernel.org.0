Return-Path: <linux-arm-msm+bounces-51475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856AA61B65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88DBD18985A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0624B206F3E;
	Fri, 14 Mar 2025 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGyJNfgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2416206F33;
	Fri, 14 Mar 2025 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982493; cv=none; b=p/hCYDTg7QXKth0WjV9XntFkQH9MFpRie37BHSFKj3BdjYyU/Kbv02WfquovUusMDgmxb0McJMVA3kFFXpcskzxkF+pmCGiEcfBhCWE6UlKSe1tvqMM3AmceKRmlWV8KWj3H/F7W8Z1RgQlXVesiUr6K128ohetQC/17sJ5JRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982493; c=relaxed/simple;
	bh=dWmTT2w8DtTLo6c0MyozSkyV4PT9/dNJhnh9BnnEiPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQLx92zbCEGVU2bd40xXWYZQ98OxQGwlaBALVLjkYJCyxDrAc8af5/rL8L/DvLznLpNK3gO8Yt7O4/xAck+t/LRacx9KzkKl4lDI81cKyLzWCOtLvjNb5hunE2P5KfJrRFcZmz8FCN9xv3TrSiL4FApRPtvlRIltBTFJWB/kT9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGyJNfgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0100C4CEE3;
	Fri, 14 Mar 2025 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982493;
	bh=dWmTT2w8DtTLo6c0MyozSkyV4PT9/dNJhnh9BnnEiPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGyJNfgivapTpXUwU2jM88RZJ0mhZkbrEhSAJjO8Wy3hQJBA2jzJKVgGUp/Q39HCy
	 GQjoDg3+tck2Biv8o663ToCIJfM+L9XHop8ga8LnZwHH431U7/ivFeUqSAjq2oPC9o
	 Hn7gscKa3Bg9uguVOKpMzZ4BQci1ZZDYz7rXTH6tzmTkmgFVPD4aYHcZQSllC2Vtcv
	 lzDfvDhsjlIZ0kGBv+ckH4zj6GXDa2VqzrFSguh6dTBUBGryAJ49RL1YzLHEs6IqFd
	 WYz2B+PuOUFwUf7tEbe1OUux4V1XGJCxTUmq8HFaICJwBP2K8KpB1cdSXrhXookb//
	 +VIleqPv+bzVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sam Day <me@samcday.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] ARM: dts: qcom: msm8960: Add BAM
Date: Fri, 14 Mar 2025 15:00:49 -0500
Message-ID: <174198247874.1604753.10761474496613059537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213-expressatt-bam-v3-1-0ff338f488b2@gmail.com>
References: <20250213-expressatt-bam-v3-1-0ff338f488b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Feb 2025 22:28:39 -0800, Rudraksha Gupta wrote:
> Copy bam nodes from qcom-ipq8064.dtsi and change
> the reg values to match msm8960.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8960: Add BAM
      commit: 5ee449c75f49c9a6b0cbff7848f922183e7888c1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

