Return-Path: <linux-arm-msm+bounces-3832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C0B8099DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD2D1C20CC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0BE63C6;
	Fri,  8 Dec 2023 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7wC/aRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8513D65;
	Fri,  8 Dec 2023 02:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFC0C433C7;
	Fri,  8 Dec 2023 02:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004027;
	bh=fCU91NRDGUv9xh9unCDOKnEWr9bjeIP2qmnEa73L4rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7wC/aRqs3mYByXvTkRkgRbWcl/WlmQqSeZhhGqxXRYHQmAN4+lcWSMfq526OM8rV
	 3FRn0I9Bn2Ss/LLdf97E9DvhxzVs13bAn3jj65ZlH3xYVrnFPZ3/kdAnTdf7qHIhKe
	 6Vxgc5VnOXZrBwxuXhfrYsYkTv5MwMjTeYK4lU6SAvKI8LJaSaU0b1ZqEX0BsY9Sz/
	 od+GdXL/E/2nfISkBjdIWFDMMOOmLxE5fKPMKfxrdrcc8tvp1Hwe6FD9fbFOee5ApR
	 u5WJCpH/P0turZAyMwNnmBAOHid37hgeUB3M6BpWxT4x6+4swDqaJ7MzFltwvkn4Gv
	 xMeKVPhIQshIw==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add devicetree support of Interconnects and USB for SDX75
Date: Thu,  7 Dec 2023 18:57:51 -0800
Message-ID: <170200426925.2871025.11709635276060964808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117080737.606687-1-quic_rohiagar@quicinc.com>
References: <20231117080737.606687-1-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Nov 2023 13:37:34 +0530, Rohit Agarwal wrote:
> Changes in v5:
>  - Rebased on 6.7-rc1.
>  - Collected the Ack tag.
> 
> Changes in v4:
>  - Reordered the interconnect to keep it in sorted order in patch 1/3.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: Add interconnect nodes for SDX75
      commit: ea72a527bd205283db08287cd49737e889788065
[2/3] arm64: dts: qcom: Add USB3 and PHY support on SDX75
      commit: f47303a8d0b50e762930d4d09ea883fd741394ea
[3/3] arm64: dts: qcom: sdx75-idp: Enable USB3 and PHY support
      commit: a8db1c061f8b4d6881253640119f651031eb3786

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

