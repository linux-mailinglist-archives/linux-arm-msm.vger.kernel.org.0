Return-Path: <linux-arm-msm+bounces-21384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4B8D738E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFA09B214CF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD01D51A;
	Sun,  2 Jun 2024 03:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf+wQR5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78CBA5E;
	Sun,  2 Jun 2024 03:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300433; cv=none; b=inYVEJ10z8ZQjuvx/7rpEEXXqZmY4TA+klcnGCPweYq+mHdB5PzY3qP+mAtC0O1LLrrOn32xGqkemJGV/iz8CgOh1Ux+75RtraM+3Zp7Wyl/adOd2+SPF65QiDiiXafX5tNaG22dmVHU0iedpr7pipfm3stHsMmZ4C8U4lUEMIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300433; c=relaxed/simple;
	bh=865vvNkE2ql37C4r+SfpJyfuRSbszGjNcSahysUI4BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKUlgr0HpAqdyPU1oGLkwFNU2DK+YLF0YBa4TxbwdHlUTR7WjK4yLzizyooRuzddhNoO3D4ZEMgiB7cy5s/yrwroIHRw0Qps+//uV9DJaiBmMpS28r2EPO68zNaRA+luLW3mfvJSXSeNbl74hUbACVrB/Nb3WjxDXE3EaXQcxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf+wQR5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0B6C4AF07;
	Sun,  2 Jun 2024 03:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300433;
	bh=865vvNkE2ql37C4r+SfpJyfuRSbszGjNcSahysUI4BU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qf+wQR5tSM7pt7HXDtXpjlYUQs1P6vv09oTbXClLjhWemBjuAIYDSHjXny94/+KH8
	 63XKCRpus03QppiczAPhjLNCciD5nPpRaRmhAuZ7MIhVAhGk/9cTinTc0I4z5jqKGE
	 QQMuwcRmPE25QpyVN6TJeGMizlNtgnTGgfAnOMDKlEaneKpbYAvB6eiWrJbycQLOvw
	 nHi7ElLVibWI+6c7XymxxbhlDTayM9DEjYAX9GszJW0K391FJ3KRmy6TJd9cNSUj49
	 xj5wbfqIeB40LxF0f4EN+rurdvY/M4+X+6uS/Q7Kmo6zRHCNR0AhUQW1SeGSXzKk2d
	 vQycDp9GsezOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add proper support for NVMe (PCIe 6a)
Date: Sat,  1 Jun 2024 22:53:39 -0500
Message-ID: <171730042585.665897.10251765543577074938.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 18:43:38 +0300, Abel Vesa wrote:
> With this, the NVMe is fully functional and stable on both CRD and QCP.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100-crd: Fix the PHY regulator for PCIe 6a
      commit: cf7d2157aa87dca6f078a2d4867fd0a9dbc357aa
[2/3] arm64: dts: qcom: x1e80100-qcp: Fix the PHY regulator for PCIe 6a
      commit: 87042003f6ea7d075784db98da6903738a38f3cf
[3/3] arm64: dts: qcom: x1e80100: Describe the PCIe 6a resources
      commit: eb57cbe730d10ec8c6505492a9f3252b160e0f1e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

