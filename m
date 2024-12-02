Return-Path: <linux-arm-msm+bounces-39916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E90999E087F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0A83171444
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02C970826;
	Mon,  2 Dec 2024 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D875zyDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24E4D9FE;
	Mon,  2 Dec 2024 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154672; cv=none; b=CdlRmS4Clr/gOzJRT7e1ajserZz7gYstC+5/G/LiyHA6vDibLIrFNyjMwfndBTKGsJjE4nQ/PwG9xBS4fM2iyuEGbCoqBXUwN31fc+WGGwFiHTX7drVCHj4zhvfvYndC6VciQ2UrsxgFj9BbS+ujoIdgICSDnJD3U/TyPWMScRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154672; c=relaxed/simple;
	bh=TdJIo9rbpSkZfR4W04BrtErK00BVRHFt+iRd8f3zNwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5MygeMY/w2Ad8mb9IiHYdc0baCicxD4ihIx4iV/aJL/icZfXBoPlu8+oVMyxeo+F27TFfkoByYO0ifn9ksRLknjHE9IytVS8hp7meWyhWuRYBaQfRjBmq2eVNNS8zI3ZT/Rc/6Muwe89hUAQWodjpC3Dsa6aluWkONyja59fWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D875zyDz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885B3C4CED9;
	Mon,  2 Dec 2024 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154672;
	bh=TdJIo9rbpSkZfR4W04BrtErK00BVRHFt+iRd8f3zNwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D875zyDzvbC7embwPNcDmI8b8WRxaML1SR7hhoT/eEngpaucpISXMgCkfR7H2LXGe
	 PcONtEVqcsD9pUjib5w/vPCLXhxvpszpmCj/Lo0rLhwtCqbwPBhFsR3MzRPiKzw/Bh
	 tsOnqjkYCsAgiVs/j2JpKo3DYSJqsydV0pPt+z7pKvsHp5C6fcUI4FdMw4ykVnDQqJ
	 edwctG52X40+7U/VAtrAu9gxK3RnZeLgpr5L0PRybOB2ZCUIn3WklV7oAFJ1NGbKQN
	 ny2WT5cPoi7MhXnHGzFD+BMRMaq0YmbMmLVXXV8Z/l5IyoYxENY/WEfpLqObJYFyh0
	 Uhr8J5rGPlx+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions
Date: Mon,  2 Dec 2024 09:50:59 -0600
Message-ID: <173315466523.263019.5335489688536018100.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128145147.145618-1-manivannan.sadhasivam@linaro.org>
References: <20241128145147.145618-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 28 Nov 2024 20:21:47 +0530, Manivannan Sadhasivam wrote:
> For both the controller instances, size of the 'addr_space' region should
> be 0x1fe00000 as per the hardware memory layout.
> 
> Otherwise, endpoint drivers cannot request even reasonable BAR size of 1MB.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions
      commit: e60b14f47d779edc38bc1f14d2c995d477cec6f9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

