Return-Path: <linux-arm-msm+bounces-72860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE79AB50377
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19F3D17B548
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C7636999C;
	Tue,  9 Sep 2025 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggbaNYI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99B369992;
	Tue,  9 Sep 2025 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437011; cv=none; b=QO0rEv8jj9sRlm1RtdK9R89L2xY3XpZZo+WiILjqQYOz5je2cSYABeykDf52Q7jZKz1fPLnShCFIgieuTm5aHpNVDV4uXU5QXZ2W7x2cLifzbzNWFOOHa1rHDLhJd6nzGrg89z6HAt6Q3kSuR4T/LXiGtf7yOu8FBS008qQlxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437011; c=relaxed/simple;
	bh=gAVKz9brxw0TcuVYhe9WUrPcw4V7o31sxZLSYC7QtQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWJsvesxPKUSH0EBD48J0xR9BFZ6Q4CG3u5IN4xTZPO1W/8YJq5ehG4ePDjxogu9RvWQXx6T5IQNTrp3KQCSbo9tMlFRfDgY9C2eaQj24RufXxD55nfGFMaIvDBlgVTXtXYsH0cC53/RHW5obv9M1Ea0qRX2vrT5DHdPkwAXdGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggbaNYI0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F381EC4CEF4;
	Tue,  9 Sep 2025 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437010;
	bh=gAVKz9brxw0TcuVYhe9WUrPcw4V7o31sxZLSYC7QtQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ggbaNYI0u8tNnWMWRB0GTx32io2BeNXhHCUA9hysZ/vN0yGkI5+q0dHWZzcgWoXOB
	 lbVO7HHtL+L87DMqhgjZ3irIm/HhZzbYcQK05FM6i+u/6wve2gJfbGT3w/vp41gOyu
	 XH7+j3YUpBFlpPyP8wqtFjJ4txv/WwQE/iodlxoSjwuFJjk2T+7Yl+AR+I7VmsYgQC
	 BK8fNK2Ue2j3gMft2Tz4sy+EVsOKGLyiOaIbk1IUWn49SzG6OK+fbNA1yDir3u6P8z
	 9GLM/TRzfKmYlTLP+zvaAWn347989fK62dQpGxeoDO1vatlvBrvMSAz7ZC3bTiCdp7
	 3l5FOwKerW6ww==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Renjiang Han <quic_renjiang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/2] media: venus: enable venus on sm6150
Date: Tue,  9 Sep 2025 11:56:38 -0500
Message-ID: <175743699540.2735486.15808430780705543692.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
References: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 26 Aug 2025 16:23:37 +0530, Renjiang Han wrote:
> SM6150 uses the same video core as SC7180, so reuse the same resource
> data of SC7180 for SM6150 to enable video functionality.
> 
> Validated this series on SM6150 and SC7180.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm6150: add venus node to devicetree
      commit: b83d3cc7a59c29918964cc0961dc3fef9ad32b53
[2/2] arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec
      commit: cafb56f78a04c90b41109d077a1b8aef2736980b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

