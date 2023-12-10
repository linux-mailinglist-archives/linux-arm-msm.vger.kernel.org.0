Return-Path: <linux-arm-msm+bounces-4130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2780BE19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 240DCB209A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 23:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882B71E519;
	Sun, 10 Dec 2023 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWKXD/+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB341CA9B;
	Sun, 10 Dec 2023 23:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58EAC433CD;
	Sun, 10 Dec 2023 23:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250476;
	bh=VJVGmOcmvxDg+2Q6DzzktB9ab6LfUMqLIbFh2jLy2Gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HWKXD/+63HmoiF1/vPwh/6eVOq9q1+VfZ9+64SvtCHaYNa7KXDhcHJw2WljqDIr5N
	 /1hsozP/JYUXfiXS2Mu1L1JfgeJvHHM6p1zSZGk44IaQhNaTfpQu4/fseAXd3b1GOI
	 0hmiADOzdii2/akWE5wt0X2YzdVq3D31zHLvMy7ZsjokEPfV3EuAj42eXWnv+0q36T
	 GIR7S0lPNxtO5LY2mcP9e5rG48h3fmZ/XDdnGQuuy+BKvlvio3mxj1pFYSKIpBpx4K
	 UMA/6UgLstM/GJRhbVHxJRRDxNtlxjGIL785B0iIpj3U6q72Y1VwWapOmDSJ82d6yj
	 6bzmakW6Vl7sw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Subject: Re: (subset) [PATCH v6 0/3] Add UFS host controller and Phy nodes for sc7280
Date: Sun, 10 Dec 2023 15:25:38 -0800
Message-ID: <170225073874.1947106.18057937177931917498.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205-sc7280-ufs-v6-0-ad6ca7796de7@fairphone.com>
References: <20231205-sc7280-ufs-v6-0-ad6ca7796de7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Dec 2023 15:38:53 +0100, Luca Weiss wrote:
> This patch adds UFS host controller and Phy nodes for Qualcomm sc7280
> SoC and enable it on some sc7280-based boards.
> 
> Pick up the patchset from Nitin since the last revision (v4) has been
> sent end of September and is blocking qcm6490-fairphone-fp5 UFS.
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sc7280: Add UFS nodes for sc7280 soc
      commit: c8a074789d71c1e26920f9333125590fac84f8c7
[3/3] arm64: dts: qcom: sc7280: Add UFS nodes for sc7280 IDP board
      commit: 9b07340c55a8e918f2667fb911e9b2edc428793c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

