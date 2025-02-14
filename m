Return-Path: <linux-arm-msm+bounces-48081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F1A36873
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B920171322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C9920F082;
	Fri, 14 Feb 2025 22:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="In/Vu61a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2420E329;
	Fri, 14 Feb 2025 22:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572720; cv=none; b=N4RDFm03XIDJgtJCgza2ceERpcu+7Ep5yFBP7+Yjbzwb0NhkiJNuoPiZHYgWgBedZPvXEXq1jc6MskgLIJw6KPnDF2TAvLvBD+zE7rurW6vXVDOiLVq+r8CxwxpPOtzW6CTe4rB5Mwf0zIdCtCA/bDx3mfv9cCW/r9i5yfUWH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572720; c=relaxed/simple;
	bh=2+F4uzUvCaJ6mczFnFULjzJ2WlsrmWoy78rWy/Ik3Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BHKo6T4EULm5T9Tci8IcTklyl6eRy6nPOuQeEKvKLZc85UV23mjmFj1cbDBkZX9xq0WiY/G+PHbyW0dfA9GeEyaGmQBVpfWzTMAggrUQwUdqBYU2dJO41RJAIYLi+qShbgQ3c9CRyeLxK0+sfXURawVB6jc/HpCzDtZbLGE/lt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=In/Vu61a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2224DC4CEE7;
	Fri, 14 Feb 2025 22:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572720;
	bh=2+F4uzUvCaJ6mczFnFULjzJ2WlsrmWoy78rWy/Ik3Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=In/Vu61a1Tqi6dGszdz2hfaHCuHngz/zxsI4tvMSpDWWZ/735CxT1GGVO20Bj7cs7
	 OeWf0JevpBwBAnpG2DOrOs2NzS92XQtKd3iBOzuzQQWU9R5eQ7xwr67vZ9dIvWji/g
	 jDgl+LGoHq+E9zH/14FNMzwHa6cz2cZzexoUO9wBPY5NpGVnhj3T7ZtcdIMzz8ffOt
	 G4bQEX8CIarG7sKtHJU4PtX59bJyTp54MZWV8L3RLp/q15sMh0Il8YPNND8sRHsv0E
	 3LC6CEOQbl8JhyGwxt3C/vnOv5WBsZlW0bsXG9hr2GKrBdKhZzI6Gbap/PbZZUyT++
	 AkY7gIdp+T1kw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: (subset) [PATCH v4 0/6] Add support for GPUCC, CAMCC and VIDEOCC on Qualcomm QCS8300 platform
Date: Fri, 14 Feb 2025 16:38:22 -0600
Message-ID: <173957268928.110887.2461798982444149225.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
References: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Jan 2025 14:27:43 +0530, Imran Shaik wrote:
> This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
> QCS8300 platform.
> 
> 

Applied, thanks!

[2/6] clk: qcom: Add support for GPU Clock Controller on QCS8300
      commit: 165a5dce03ecc3d5ce41ebb2947d5fdf93412dce
[6/6] clk: qcom: Add support for Video Clock Controller on QCS8300
      commit: 63847e845c56d936abfc495fa8e192234f7a1f8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

