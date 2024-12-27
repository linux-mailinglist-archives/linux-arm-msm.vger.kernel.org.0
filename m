Return-Path: <linux-arm-msm+bounces-43453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9579FD00B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 232AF1881E71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C1735952;
	Fri, 27 Dec 2024 04:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+Kh4rUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EB191;
	Fri, 27 Dec 2024 04:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272932; cv=none; b=D1YkmqSQ5i0ULMMeRpIOmP4Jav3JnQoHnfgERVALtLBDyUpGpKLsB26Yc6X168SFnXScrAQb/8WITT9x06sjYjyZtEZHkJdnSVDBqJlPBgNYGHpmN+wKHqfx/xZ7nV1P7QGKJ7tix/daeQCnhCCIEYXs0d5ReYbmtRFS1oOC+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272932; c=relaxed/simple;
	bh=ONtBFaGNx9XwKn01Y5d1keOMVgEwo5mlV60lhtsPxNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iU6+Wh8sVID3xU8vo7u8SblyF4d0SyMwf8XR9tfI5Go+6GR7kX+1B+KnIOB+TXnsBNAAtnKJIHiCpv4xyPn2rMxFg13QNp8IiGEmrudTGzd+5nDjpWKFjRGm+SgL+fLmm6FxA387WxtOMM+oanD/olqoCDYkzcIJjtwBSA2Fkdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+Kh4rUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BACC4CED0;
	Fri, 27 Dec 2024 04:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272930;
	bh=ONtBFaGNx9XwKn01Y5d1keOMVgEwo5mlV60lhtsPxNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+Kh4rUYawbH0qd5CUGeu7RuUmLfnRCy6tey3nVkm9wbwbc9fvHE3Tec7hC7enawT
	 8IwIRCd6qVobO6sdxlVp5fKInz2UNkENwJI6b+H7UMDqJNXk86lvmO65glGV7iPh+M
	 +ab19mjIUcFTMs+JIiEAimxHFAaKyQSD6RDRYkdzJJEy5X2nvFT8evOwxobItjp/d1
	 s+uqpj5sx5Wg4SVAc1XIhW6n6MCq7zYHSWRXd6os+nZKWlg5JNFLBrR0i1I1gtJGml
	 8Kcfm3rinOkRP5aJV8UEr68kIb2+xU/Yjtimjx0+T06PG3yxVmBpIyefHPWdZZHjsD
	 7stjMr/UByT/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	stable@kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8[56]50: correct MDSS interconnects
Date: Thu, 26 Dec 2024 22:15:20 -0600
Message-ID: <173527291942.1467503.6964791268697075537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 26 Oct 2024 20:59:39 +0300, Dmitry Baryshkov wrote:
> Both SM8550 and SM8650 misuse mdp1-mem interconnect path for the
> LLCC->EBI path, while it should only be used for the MDP->EBI paths.
> 
> This kind of misuse can result in bandwidth underflows, possibly
> degrading picture quality as the required memory bandwidth is divided
> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: correct MDSS interconnects
      commit: b8591df49cde459e3b84cdc0517d7bf92053d244
[2/2] arm64: dts: qcom: sm8650: correct MDSS interconnects
      commit: 9fa33cbca3d2842f1f47ed4e5f6574e611dae32b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

