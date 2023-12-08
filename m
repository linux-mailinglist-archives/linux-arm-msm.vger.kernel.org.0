Return-Path: <linux-arm-msm+bounces-3827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879688099C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C50C1C20D2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420F05234;
	Fri,  8 Dec 2023 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzE4EsGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3FC567F;
	Fri,  8 Dec 2023 02:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB756C43395;
	Fri,  8 Dec 2023 02:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004022;
	bh=pysi8htMunee7u1NPHdnoL40w2QhPb/UHl0xep3gWU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CzE4EsGvOarFmf/sIMpkUiaXOg1IWrsiAo7wAUEBwi+QtVLSNyqWxwQKr+Ngp3JSp
	 czKmGjFMzTdsT+1Ooxt6rTyvYdM5agqFurmM7KZesdmaLDXP7fQ1b6XjYzqGOcUm18
	 7FETakOm+HQH4F5to+gW7expKybUjTo3Mwb5u5ypCnRMy/Fdg+i5gVhHcS9g3y+UGZ
	 AoGSDYJpGkNPHWvQQGjcNK4pNABgyLew53WdEs53RPXRNaqmyMd+luW9KGvynyo0IB
	 70ojT/hxGR5rhKysG7SNV10xnK7V3S45AjD2x23b3l5FZuPW4YFrhuNyjmBUY/WCAn
	 /aD5Gt6+w7Abw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: (subset) [PATCH V5 0/4] Add support for Qualcomm ECPRI clock controller
Date: Thu,  7 Dec 2023 18:57:46 -0800
Message-ID: <170200426932.2871025.11902995660815720558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123064735.2979802-1-quic_imrashai@quicinc.com>
References: <20231123064735.2979802-1-quic_imrashai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Nov 2023 12:17:31 +0530, Imran Shaik wrote:
> The ECPRI clock controller support for QDU1000 and QRU1000. The clock
> controller has a special branch which requires an additional memory to
> be enabled/disabled before the branch ops.
> 
> Changes since v4:
>  - Aligned the lines as per the review comments
>  - Used the clk_hw_get_name implicitly in WARN as per the review comments
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: qdu1000: Add ECPRI clock controller
      commit: 66ec7b4f471300003c13b87a99bbd55255da5ba9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

