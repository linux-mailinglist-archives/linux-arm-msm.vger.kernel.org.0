Return-Path: <linux-arm-msm+bounces-22215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 446CB902886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 20:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D8AA1C22CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 18:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51737E761;
	Mon, 10 Jun 2024 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZ8Ky1sU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271F143742
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 18:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043670; cv=none; b=HCr6SW3372NveUxE49WbiJUCpOYNOP/g6fKTxcHZX+8sFqpFm/71A8W1/nNTCejN8n2tiNyUIGGmqEP8kYH3zs0cB2FJ0OoJCCM7dHGqu1BDDdBCUtGC4Mu4sa7waKO2q+Jhg8CCRYopNNnMkGa+17CdGkAoVC2DbcFS/vSmCyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043670; c=relaxed/simple;
	bh=95FiMUpZb2b+8p9BVgE3LvKmhqEeLvy6ih6bMqiMFQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJnqyXFwofJ3A21nAwxQPj+4o8tALMlwma53qevW2dMXHJHPxZFoubHx1W7VsQsVFabvI0xe40B0UDSXrfYEr86OJ00tbVG0lB1oELUOq6IJm3rmnMqpNfeljSKiEGSbaC+V0AArI5uMOhjXNXk0lnrS3HfZG6GwTCV8JXnf130=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZ8Ky1sU; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso61472611fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718043667; x=1718648467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnYAtJi8XoxF7sJ5y+wltvHttJeQMrJzENkfOs3Z7b0=;
        b=qZ8Ky1sUmiNetH86HUBwDfhgr7LPU+2rUVa5sKKtsmuU+ZN5DD2SWrfHotXxg4EfOt
         z5D3CC7sTEzi3cXCZNE89ukBpTiQNlBEX2ANI31vOrKS2wDVNI9VBGEryAJ0iuDi2kri
         zaHsvJby/+ZjO/PyMmQaw0vM6IBMfc2W6OS3RNff8OIryTEcQv4fbnMIr5W8eU+eKnNK
         Qe/zcn5INW6qkNHlZJqjLnp12aTdnFa1Seadi3qxEcDtlb43r3a25XsTKoYJ7SCn8IK3
         L94gijMXTwis+TepPh83a1b9rNpVnGljP3XiyWPCnk2PA+4N8vF3yRHFsD+p2hKuEpbd
         IAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043667; x=1718648467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnYAtJi8XoxF7sJ5y+wltvHttJeQMrJzENkfOs3Z7b0=;
        b=RN0PS1LgoD7mpU/QbZGN7LRCr1WrLU9CasBQETZ8Ji/3A4age9Q0jUNXl9tWwX2Orm
         shkRpK0RAvBtBkLz8K2sth/a/KlceZLUAVf6LXsXWQR9ttHCxPNg8vZqfADKqOha70MG
         +zDHqZeo9WbYbm7IqPd3mkok998niuCNNCtXYlrtGfW7KJiCNQZVVF2N9JhLgoVtdJpe
         v4s6nzaskI5pt2vcin+DqCdHCpLZrCfU/7CFIgSgMSrTQY4uKRhnkz3D9SVPy/FfUOZd
         TzWcVWvPrUuF+v3+4pyX0OMUUctUhUbrRphBhADolr9hH91+T7W/DqpKLYpFs3dIqU8n
         snDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgWgRRsEN+iKmBXwrdkshoi5m+CVOd8+hj3u8kLPVgqqStHvRsL5+bJU0Y3WbRrAlTNUVdpjOfMYCn3SiJ+evaTP1yyD3Rm+b+YeXszQ==
X-Gm-Message-State: AOJu0Ywo8zrq05xPHJN69aNQFykNgyuCIZBb7yxFJLEgZEo1Q6NEbjlx
	xd83lgJXsAOUxdAgo+0fnXYXof5JxRtYMRCXFqgHVx77lA7ALCGYdrrtoTADAg4=
X-Google-Smtp-Source: AGHT+IEOaiS3QCsG3cHQ7fBhEVzQEEu4578nuBDUOUe33tQnb3AEMzXevw3ArSb2z/1KCm6uNXSKgg==
X-Received: by 2002:a2e:9c91:0:b0:2eb:e852:4f4a with SMTP id 38308e7fff4ca-2ebe85250a5mr18200551fa.35.1718043666952;
        Mon, 10 Jun 2024 11:21:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ebe510450csm8553671fa.77.2024.06.10.11.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:21:06 -0700 (PDT)
Date: Mon, 10 Jun 2024 21:21:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-idp: Update protected
 clocks list
Message-ID: <qiwy4uyxdrzp2omabh5nacdi37plomua22xsduvpatvb2pcp26@il6ncp7iluj6>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-4-quic_tdas@quicinc.com>
 <4dvqegoz45ct5rqknf6vgi6rvh4osaecfyp7fcrs26lcsq4npu@dwoyubuqlbss>
 <3710a210-265c-493d-9d2f-27ebf486d00e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3710a210-265c-493d-9d2f-27ebf486d00e@quicinc.com>

On Mon, Jun 10, 2024 at 03:57:34PM +0530, Taniya Das wrote:
> 
> 
> On 5/31/2024 5:34 PM, Dmitry Baryshkov wrote:
> > On Fri, May 31, 2024 at 03:52:51PM +0530, Taniya Das wrote:
> > > Certain clocks are not accessible on QCM6490-IDP board,
> > > thus mark them as protected. Update the lpassaudio node to
> > > support the new compatible as the lpassaudio needs to support
> > > the reset functionality on the QCM6490 board and the rest of
> > > the Audio functionality would be provided from the LPASS
> > > firmware.
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 28 +++++++++++++++++++++++-
> > >   1 file changed, 27 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > > index a0668f767e4b..4eece564331a 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > > @@ -1,6 +1,6 @@
> > >   // SPDX-License-Identifier: BSD-3-Clause
> > >   /*
> > > - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > >    */
> > >   /dts-v1/;
> > > @@ -688,3 +688,29 @@
> > >   &wifi {
> > >   	memory-region = <&wlan_fw_mem>;
> > >   };
> > > +
> > > +&gcc {
> > > +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> > > +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> > > +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> > > +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> > > +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> > > +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> > > +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> > > +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> > > +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> > > +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> > > +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> > > +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> > > +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> > > +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> > > +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> > > +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> > > +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> > > +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> > 
> > Is there any reason why this list is significantly larger than a list
> > for RB3g2 or FP5?
> > 
> 
> Unfortunately these are all protected on the IDP board and any access would
> cause a NoC error and then board will fail to boot up.

Why? I mean, why does it contain the clocks that are allowed to be
touched on RB3g2 and FP5?

-- 
With best wishes
Dmitry

