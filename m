Return-Path: <linux-arm-msm+bounces-3104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7C8020EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA0F8B20A77
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127148BFA;
	Sun,  3 Dec 2023 04:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNhm4ApF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8779E0;
	Sun,  3 Dec 2023 04:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FBCC433B8;
	Sun,  3 Dec 2023 04:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579125;
	bh=M4xkuJe3k5E0eNvrVJw+MYeOpXAqlbo3VFnwIeWclkw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CNhm4ApF6TiLWkFIUYE8FNFk5ML+35VDPBHMQtY1YOUR+5G0/a7U9A+ZG5/lBYTbh
	 bOxMbLjWf7wWWVgtC4iAvthUYYMVTjY7ddGEqBmJEbWzhUjDIOAfHdwGN4y8VmV+Qq
	 8J0+ob/7C2378CgH7gyWszwm83q48r7HtWsoJ36rCgk/jYNZh+BTFp4cWuAHET8vZF
	 8I89njKAHyoWRJuc/Jfn4zC5LSyMnEGor4trpx20Vvu24/vTpkhjaw3uEbRTotYBLp
	 PVTbMP/xAe0A6wiuI3eNaoj4JV0qdlF30Vs9/2ua4CVM6dUbv41P3NgYeqHgkOnncs
	 /lYiImZDc1g3A==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sridharan S N <quic_sridsn@quicinc.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the IPQ board types
Date: Sat,  2 Dec 2023 20:54:51 -0800
Message-ID: <170157925794.1717511.4625471524765370512.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927093130.4098385-1-quic_sridsn@quicinc.com>
References: <20230927093130.4098385-1-quic_sridsn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 27 Sep 2023 15:01:30 +0530, Sridharan S N wrote:
> IPQ bootloaders do not need these information to select the
> the DTB blob. So dropping the board names from board section.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: drop the IPQ board types
      commit: 14259fcdaf72d3ce93ad9c2b12cc0e96ed5a0c4e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

