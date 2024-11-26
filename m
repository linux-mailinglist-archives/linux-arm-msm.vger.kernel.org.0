Return-Path: <linux-arm-msm+bounces-39226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34119D9D30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 19:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3241643CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 18:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098811DD9AD;
	Tue, 26 Nov 2024 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNVpXuD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B41DD87C;
	Tue, 26 Nov 2024 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732644810; cv=none; b=OvGlGgQkJ1vMwBZz5rCYhjNno4vsTnEuyI7R8YhNwgzzGPJSdFr7bZE3CfQD4kI37VUhN3+6G6mgnEzcEVMdD/A/EGNMcmbwWtFkNEXNYRItJ3djpucvO7f3CSxzAuIZtj1sgD4y2L3aSjIb5UqLgsEOm3Qhgz9dDXiVDYFZr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732644810; c=relaxed/simple;
	bh=BQkT98an5k79mH1rE1/XZVZUDrrIXpXdkEYMYEpOdQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUUXdIB4lnYCGSds+qEtF4u9ueL7uvQAw6hNWpV3crAIEdlv+F7bX8REOLM67AwvcRgVjwKkXs80u7qxsLd5FAjLOnewU9kYOy9+fbRUNfIt8UfBLv/sW2uakuaR5qFnz/OS0NJArgybiB2126h1Wlo9Ei4BN0JXMuVm0A+nfpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNVpXuD4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EDAC4CECF;
	Tue, 26 Nov 2024 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732644810;
	bh=BQkT98an5k79mH1rE1/XZVZUDrrIXpXdkEYMYEpOdQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNVpXuD4CpDuGo1X6ygFufKs0noyFhgXzKkl9XQZTBzToIeEeRMsOrZfGwhyzpIoN
	 9Xan5YZrGtvCuTBBGhHBzCnxmuGG6ZltpXxdVySCULFaoCsbMl6WMeIlXfAqy56eFl
	 ow5rliasd369bL4OiWnIQM3aWtOZtCfJPgk13Yjl1j699gXAyC8UKSGYinxG67HMnX
	 hkOFYRkjv0agMeUQm7qod0ynz+8twQvIx9fEQ7i5h1eYFu78Dx6C8tYClz6OSZqXrN
	 ka/VqCw2Tncu7I0tKXK930Pm4TP+ysptQuKssa7tNJKTRKUXOv90rWV+sZvuGrPy6q
	 Zc7SpKy+NvciQ==
Date: Tue, 26 Nov 2024 12:13:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Tingguo Cheng <quic_tingguoc@quicinc.com>, 
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: add initial support for QCS8300
 DTSI
Message-ID: <mjth25v54mioefjet2udacqqwvw7tfbhemmvjps4utjm545hyn@3f7zwohi4qee>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>

On Wed, Sep 25, 2024 at 06:43:34PM +0800, Jingyi Wang wrote:
> Add initial DTSI for QCS8300 SoC.
> 
> Features added in this revision:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> [Zhenhua: added the smmu node]
> Co-developed-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> [Xin: added ufs/adsp/gpdsp nodes]
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> [Kyle: added the aoss_qmp node]
> Co-developed-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> [Tingguo: added the rpmhpd nodes]
> Co-developed-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> [Raviteja: added interconnect nodes]
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

Sorry, thought I had replied to this already, but I must have confused
it with QCS615.

Please see my feedback regarding signed-off-by and subject line:
https://lore.kernel.org/all/4bhsuysjm2uwkk52g4pkspiadsf5y4m2afotj7ggo2lnj24ip2@yqkijcdkiloj/
https://lore.kernel.org/all/2qvv3zrop2i5hurrn7bfggfkjb7rqlbfa7bxiekdisi6c57gxd@d2fptisjhy3j/



For reference, here's the qcs615 v5.
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

Regards,
Bjorn

