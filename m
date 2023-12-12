Return-Path: <linux-arm-msm+bounces-4440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED8380F457
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 18:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1711C20CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 17:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0951B7D896;
	Tue, 12 Dec 2023 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ni5IZcri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F987B3CC;
	Tue, 12 Dec 2023 17:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5E0C433C8;
	Tue, 12 Dec 2023 17:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401681;
	bh=xLkBkixDQKbXEltygIuDMWgT2+tKHTyJguNt0oCZ1Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ni5IZcrivfNznvASlMU0Q2n6Kp8hvI9+Q6CHG54W2Vku+AoedZxkjuqwdIEV7z/Bp
	 rs89sLvn3o4hxHoeYW/sw1Znd8HQaLkOTQUUquwY8nhU4nTgiZOFLrjnKitcinbZ4P
	 zcG41Qx/178fc5iXLGQEQqJn4g1xe0pXetJHH8xmNMihtZPi6mr/MeiBqjPEzuO9ji
	 OVxegVdQpX9pM3Pij4Rr7tgC3yKfL4PW82A5jANb11ao9Lzd+bMn1vzv08R7ndAPgi
	 0eq8fau88PzsfwBn1h4Wx4HXiyFI0I3rK+W1ZI1dT5Eib3+kUAdFHQlAGQWz8u/uyi
	 5rro2tioVaSlQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 0/6] SM8450 / SM8550 Adreno
Date: Tue, 12 Dec 2023 17:20:54 +0000
Message-Id: <170238387694.3096344.13849459949323517316.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
References: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 04 Dec 2023 13:55:19 +0100, Konrad Dybcio wrote:
> Following the merging of related bindings, driver and mesa changes, enable
> the GPU on both of these platforms.
> 
> P1 for Will/iommu, rest for qcom
> 
> 

Applied SMMU bindings change to will (for-joerg/arm-smmu/bindings), thanks!

[1/6] dt-bindings: arm-smmu: Document SM8[45]50 GPU SMMU
      https://git.kernel.org/will/c/4fff78dc2490
Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

