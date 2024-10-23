Return-Path: <linux-arm-msm+bounces-35499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50E9ABCA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278011F239A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E79383CDA;
	Wed, 23 Oct 2024 04:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKLMiyo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D3B610B;
	Wed, 23 Oct 2024 04:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656970; cv=none; b=KKF3A4VcNs59VCQa0HuP5pzAd7U/Y9hShWri+9I3KVM/5lVbpZuhUP6m7JnPZJbdXtifTVH/A7FmLgA8ijnbB0VDxn2g5oyl5+LLbPVEbcuggpxjQ9qSyxH4Imf542X7SLkdf1JOhvXnAO8AnfzlFIFlnnboZMdZ8gD2luRLCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656970; c=relaxed/simple;
	bh=h6NhKOQ6eEXS1Vi0lkLhGlJe67YDw+ij0cq5jGWAVnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/ag+zwpIBEKv5PGlYULkpOBC1/yb1HNc0OZ8nNlLpRcjKCzAypPkjQNEU5HuEg8S2UB8S4CeeaMyIZCwRPqVdRtlAM2i/WeoR04rrLg2LVq9ca5sM4vvWKq1yiXhmsS7HyIGFS6aimbSTPXfAK1pJqLt42uqnEHSe8KV0w5n4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKLMiyo2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FBAC4CEC6;
	Wed, 23 Oct 2024 04:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656969;
	bh=h6NhKOQ6eEXS1Vi0lkLhGlJe67YDw+ij0cq5jGWAVnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKLMiyo2fSnxEqY1KbNPu/yXy2QXFQcxYrSvvN8xDrzb1sBCM9/hYhUUXr5J2yEJn
	 L8+5BS5/AWBdLwqeLAHnnTVYTbbbg5whiYSElhq2USDD4dJtROEYY4JXnGSJaCx2mw
	 nu/03PXuvQAXrDgWtT6bRXudj+6/+vs7CoDBKDEm/XCcov3htMpGdvjRyHySZeKx1/
	 d3Bfww7ZQiWbkbz0rmK76DSYRSAhrAzzdivrzjjm7Vl2llJLLbpIi2t+JRc6KY5qiB
	 NLF5iUNY5kH49+4Ln2rPFOgMKFVd+/JCj4uMs8af4GnVL3JmOySBglEMSUAFGmG11d
	 koLdB0tg/tSBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags
Date: Tue, 22 Oct 2024 23:15:47 -0500
Message-ID: <172965696388.224417.10571960256822836381.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-v2-1-0bfd64556238@linaro.org>
References: <20241021-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-v2-1-0bfd64556238@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Oct 2024 15:46:25 +0300, Abel Vesa wrote:
> Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
> configuration on machine suspend. Currently, the QMP combo PHY driver
> doesn't reinitialise the HW on resume. Under such conditions, the USB
> SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
> RET_ON. This has been already done for USB 0 and 1 SS PHY GDSCs,
> Do this also for the USB MP SS1 PHY GDSC config. The USB MP SS0 PHY GDSC
> already has it.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags
      commit: e7f37a7d16310d3c9474825de26a67f00983ebea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

