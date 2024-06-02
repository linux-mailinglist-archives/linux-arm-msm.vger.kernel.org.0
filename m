Return-Path: <linux-arm-msm+bounces-21391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F88D73A3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA3A8282C94
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E79381B9;
	Sun,  2 Jun 2024 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K46LPcWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5DF39856;
	Sun,  2 Jun 2024 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300441; cv=none; b=ehEffxUKarOPbB32YL1bqb2WJ1E6v5JpynvQ0KIB7OLV/x2NAtZNtnkdh4as+SyKfFZLR8C+c8q6OYNIOTc2Pn2+NOcVHi8qlkh3nCFzgc8yz92EJcecKg5o632BgR0QRdrPAgIWRx6nIgtLPkYSOgr0O4u8KrQ6zUnSj37eHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300441; c=relaxed/simple;
	bh=FYrIwLbbyhlzrez/Px1a6s0I2ijlJ7ZksPsqCcmPrI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzJyF3toldAJzSgxDzO9iKOg/HgPWYNfdFUpZUgsmfuCFTm5wJMimIthh5A3vWuO7gYP2J7Ft8xR/b/MBUGOqICwAaC4ICuj/x2KA135MDamyYS/yf40YbjUDOnJ/bBCsovDgGrYZCTezc60i60BVpMS/sk6gQKwBLhKI6L9tVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K46LPcWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1EFC4AF07;
	Sun,  2 Jun 2024 03:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300440;
	bh=FYrIwLbbyhlzrez/Px1a6s0I2ijlJ7ZksPsqCcmPrI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K46LPcWwDg/OCDp5fBg8wmqgEW7//myWZy02CDhX41Uzh/Wb99n6WyZUEydtsOB1k
	 G3U5qIq2CLkX4ArLynNq5kMtBn5emCdv3H0i8Yga/lZPR3B2uFM3GkYnhSuWO1hy+/
	 SqcFJH4rbaT6SF9wd+MG/IxaC/KitspJ7W5NzJFWkGbWRN2yx+GR/DEFFxvmeS0/i3
	 A86qKeuumRl0jY2KvZM/UZxYBWk7wgU7SdbhodyZnvNNL0qXQofC2GNTyCLOx7bt25
	 uC5UIpUKMla2BtP7pyiabKrWmJXPrS+kXDv7njq8Vqd1DFfPb/L3KAD2znj/8nMrd0
	 cG/srrzBhV0IA==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_kbajaj@quicinc.com,
	kernel@quicinc.com
Subject: Re: [PATCH v2 0/2] arm64: qcom: sa8775p: Add IMEM and PIL info region
Date: Sat,  1 Jun 2024 22:53:46 -0500
Message-ID: <171730042582.665897.11252613950608156281.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240531093531.238075-1-quic_tengfan@quicinc.com>
References: <20240531093531.238075-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 May 2024 17:35:29 +0800, Tengfei Fan wrote:
> Add IMEM and PIL info region for the SA8775p platform.
> 
> 

Applied, thanks!

[1/2] dt-bindings: soc: qcom: add qcom,sa8775p-imem compatible
      commit: 9ca6eaf1337693e4e626359b76016912921dc557
[2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info region
      commit: 93f340084d05e7c109c0de20cca429492a377c37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

