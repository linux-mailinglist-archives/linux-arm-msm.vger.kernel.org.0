Return-Path: <linux-arm-msm+bounces-26105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC4930CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 05:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484402812B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 03:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B850B64E;
	Mon, 15 Jul 2024 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAab4LbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2A4A18;
	Mon, 15 Jul 2024 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721013294; cv=none; b=A4AhqftijcR+0Y6fuAwOh92DAbXxvDeX7ga0WMOzwnf1i0bVLdXAmS+xM0uPcrl+DO8k14MPEl100P99WjtepU1ilzWBaqakYVK4SYEgz1+omMugjmeyyQgdg0LbAomi/zIRzkkPa7qZhJZaOdAfeNzmviPHyjbpbcNO1m6gf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721013294; c=relaxed/simple;
	bh=x5AvqTqpIXGu3vcK908wxWBVAiDR0ZnwL0oXx1c4XHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7XsWTz9rqP2oRJINSGTpdNGG32p8EYI9XnzfV247/uz/0M2xhbuSKF19g7UjTSpDm2WwQrKVD3gfaAsXj2llQxOYmG7nDfW1Ekxo0cxzHiGRR92qZ28BlD8j3vmJc6X9RlYGE1Eo3SWyO3E7NislQRIDMlwy1h+2M9MGRMLFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAab4LbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2D7C116B1;
	Mon, 15 Jul 2024 03:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721013293;
	bh=x5AvqTqpIXGu3vcK908wxWBVAiDR0ZnwL0oXx1c4XHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAab4LbX7n0V2vM0mPxsO/+7iV0YlQFWP/KuVPVp3AiMDefbwujJgXh6JBJ06k6aQ
	 dkzVOd688qaPDPEnylBYAjcUwBfL8Z93P49BlLnTKngGmqZWX70FSZNZdQNkx9KWKN
	 RITqorJCxA5+Wz/e3Jw/wuONxsSWULVW9Y71UhkxNV/claw4Py7/kjRwboEEGTcf17
	 nsWwjvgMYdL73G2t1B9zgPB2QAnzkh3Fw9Q8BsMBSaRi+H3M9e9CT76smUnOjvllTn
	 i/UdBkchoGKtOpijwFJ3Ip88EA/rTRq5hcCQJK6AEiKk3sdyfY5dVa0UeHujeo072C
	 bIvS1GuuSGt1g==
Date: Sun, 14 Jul 2024 20:14:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	conor+dt@kernel.org, quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com, abel.vesa@linaro.org
Subject: Re: [PATCH V6 2/5] mailbox: Add support for QTI CPUCP mailbox
 controller
Message-ID: <20240715031451.GA2940276@thelio-3990X>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612124056.39230-3-quic_sibis@quicinc.com>

Hi Sibi,

On Wed, Jun 12, 2024 at 06:10:53PM +0530, Sibi Sankar wrote:
> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
> this driver enables communication between AP and CPUCP by acting as
> a doorbell between them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v5:
> * Fix build error reported by kernel test robot by adding 64BIT requirement
>   to COMPILE_TEST
...
> +config QCOM_CPUCP_MBOX
> +	tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
> +	depends on ARCH_QCOM || (COMPILE_TEST && 64BIT)

This doesn't work, ARCH=arm allmodconfig is still broken with:

  drivers/mailbox/qcom-cpucp-mbox.c: In function 'qcom_cpucp_mbox_irq_fn':
  drivers/mailbox/qcom-cpucp-mbox.c:54:18: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Wimplicit-function-declaration]
     54 |         status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
        |                  ^~~~~
        |                  readb
  drivers/mailbox/qcom-cpucp-mbox.c:65:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
     65 |                 writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
        |                 ^~~~~~
        |                 writel

because there is ARCH_QCOM for that architecture as well.

You could resolve this by just including either io-64-nonatomic-hi-lo.h
or io-64-nonatomic-lo-hi.h or shuffling the dependencies to require
64BIT unconditionally:

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index d1f6c758b5e8..8d46b76c23fd 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -278,7 +278,7 @@ config SPRD_MBOX
 
 config QCOM_CPUCP_MBOX
 	tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
-	depends on ARCH_QCOM || (COMPILE_TEST && 64BIT)
+	depends on 64BIT && (ARCH_QCOM || COMPILE_TEST)
 	help
 	  Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mailbox
 	  controller driver enables communication between AP and CPUCP. Say

Cheers,
Nathan

