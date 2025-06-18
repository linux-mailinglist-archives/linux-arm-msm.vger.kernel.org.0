Return-Path: <linux-arm-msm+bounces-61662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02AADE215
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13FE67A1DDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B9F21170D;
	Wed, 18 Jun 2025 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff1633s4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E3211460;
	Wed, 18 Jun 2025 04:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219778; cv=none; b=C0pXLo/4d7h7hhYI36rF7MfMXJwHuoL8neJ68skjPSMgLJKJ0Hra2z38g8Vjn98jQt8VAgplJLcqJkLZOcOLY1Il179YDWa+8cVqZ4ZskmXRrEFL6Vkh+sGLbo6HLYxbfFt3ycB8LHw+ZMDb8rYbgN1QssykpJsCDqVVGX+PPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219778; c=relaxed/simple;
	bh=vN2FOJ//6DaCoFloteK8X8ToMa2qiuGZ6Y6Yq9YA99Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iue2EFNadD4zjqNcClmfIrx8LGAp4bMBDA8Z3j19h1UE2mEAyANgV7DbVUj5elKKUYBjbASdZOqoN4IaaOKlafYxDDlCr+KROyO25W7NpE9OnRlJOtnR+UOrLMw5dMQFrtM+pKBscJXM7HClOupVRzRknjvBRc7y+yFLnxJ6vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff1633s4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B19C4CEEE;
	Wed, 18 Jun 2025 04:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219777;
	bh=vN2FOJ//6DaCoFloteK8X8ToMa2qiuGZ6Y6Yq9YA99Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ff1633s4CJTqNmNB27atCrTeguPzq5gw5wujKL2OaupmwStNCyB4Px7zAq+e+EZ4x
	 XTa56FTTQLZLu6Ibc75lJALdfISp44sU+HIeznF8SQ0JjJxDsnCdaCDFmeadXVKt3a
	 nvBRL5av/zY6mPM1BfFv8gIy4M3d6ZPRjEs7LGSLmpnyEiVzoUorSTXeSkXCU+vY/g
	 vupPUSBDtiQMpMSwP8hyHR84s/BNRigPbsTqUkdaqDFQZNe1m8z6A7sZfScqNvVOgQ
	 soC2aqqcPR2YhE6e1RN4oscJ+3hVILe4KNOnVOhmGVlhqadPCsU4UXiXFsJNEYkICX
	 5zNQ+mdAS5emw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/10] Grab IPA IMEM slice through DT, part 2
Date: Tue, 17 Jun 2025 23:09:21 -0500
Message-ID: <175021976645.732077.14110178796470465850.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 23 May 2025 01:18:15 +0200, Konrad Dybcio wrote:
> The IPA IMEM slice addresses/sizes are hardcoded in the driver. That's
> mucho no bueno, especially since the same versions of IPA are used
> across a number of vastly different platforms, which invalidates that
> approach completely.
> 
> This series wires up the IMEM slices in DT on almost all platforms
> (need some more time for SDX55/65) and fills in the necessary bindings
> holes.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: sram: qcom,imem: Add a number of missing compatibles
        commit: 9cea10a4f5a39fde32bf7b8addfa5f9175174e0e
[02/10] arm64: dts: qcom: sdm845: Expand IMEM region
        commit: 81a4a7de3d4031e77b5796479ef21aefb0862807
[03/10] arm64: dts: qcom: sc7180: Expand IMEM region
        commit: 965e28cad4739b11f1bc58c0a9935e025938bb1f
[04/10] arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
        (no commit info)
[05/10] arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
        (no commit info)
[06/10] arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
        (no commit info)
[07/10] arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
        (no commit info)
[08/10] arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
        (no commit info)
[09/10] arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
        (no commit info)
[10/10] arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice
        (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

