Return-Path: <linux-arm-msm+bounces-4667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314FB8128D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93EE9B21240
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29528DDD1;
	Thu, 14 Dec 2023 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfzg5m5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316DE107
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:12:51 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5b383b4184fso70583647b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702537970; x=1703142770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=93QX/jgZBqRf6fwN+rr8BYXawe/tGzkWINFxkuFYXG4=;
        b=dfzg5m5cRX7sJEbzHZkDU1RpFdYfhM9dqpHmaRCh9PD7VuxEib1ezVAoSwiaq6rreV
         sizhc+8uHaMbd+0784yyeK0ic77oeRl99O79Iyr34nKGtN5KMw2wWQDpqVoRC0l8RAG8
         /J9SVHewGzhyX3jNErvlN9OiRYGz4JKSmlJ8UtLZnoLHZR31VBPxJiwJme98bV3rYLkw
         LtOMIImPKnGyTwzKayLExy9OFzXFFUh2vU2PmR9nPBp/gxpGVfLFfXvROuoot4xz52LL
         A57MfkS+6SNteP8vkGj/bmdcs3SPCGHn1zpV8KZUUmTUghmqIzEQXv4iAzaZGNRuSsZA
         3Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702537970; x=1703142770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93QX/jgZBqRf6fwN+rr8BYXawe/tGzkWINFxkuFYXG4=;
        b=hr6AWC+zzT7uywoN101NkcBjo9cm+HZenvSAg/zngu2F1+68FcYNgKToT9xgIz2bzs
         jNXUqpefucWuPBmFdkhVktBTinERtO2oafkvgFqkGLZAeCHzIfYfVFCqdqw6DPyzWpZd
         lqm65Dc0Z3Wyo0/629hGa4v3bAQQfcP1pVDcVJtWmFYVP+63A8DCxercQMFBqYVFOm6E
         lvOiXt2zgEgR2QtNAU1L+H7pFdP+zugx6s1tRmHuOhgW4QSI8qNfGKdi4mQE80LYFA7W
         YQ3MsHhhJOafUkN+3NTEv2vIT2ls2TBASLR2S66JhlgMCv+q3NboP24t07OFgIlURXG4
         tckQ==
X-Gm-Message-State: AOJu0YxBAFkjsZEtJHrqVy/xAynp2goJpKIOre8UF0mN8kqGRMsTcDhF
	UMCOcj3WxCXxvctQvKIdHK2uAdTa9xZX8GLnsUIRaw==
X-Google-Smtp-Source: AGHT+IGhCYJ6oqVzy6LbBhSToBcgh/7Ie6zjhhlYJRcHkOc+QFWGJAo1D/JpyUKQrMnIvCrzM0Nb9dc+JGLDE73Mp5g=
X-Received: by 2002:a81:49c8:0:b0:5de:93b6:7045 with SMTP id
 w191-20020a8149c8000000b005de93b67045mr8139176ywa.39.1702537970292; Wed, 13
 Dec 2023 23:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214062847.2215542-1-quic_ipkumar@quicinc.com> <20231214062847.2215542-5-quic_ipkumar@quicinc.com>
In-Reply-To: <20231214062847.2215542-5-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 09:12:39 +0200
Message-ID: <CAA8EJppV1UnC_Howfn1_4Ox-jftrRRF63QesFzqCSX+tC4c6FQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] phy: qcom: Add support for Pipe clock rate from
 device data
To: Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kw@linux.com, vkoul@kernel.org, kishon@kernel.org, 
	mani@kernel.org, quic_nsekar@quicinc.com, quic_srichara@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_varada@quicinc.com, quic_devipriy@quicinc.com, quic_kathirav@quicinc.com, 
	quic_anusha@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 08:29, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> Qualcomm IPQ5332 has the same PCIe UNIPHY PHY with different pipe
> clock rate. Add support to define the pipe clock rate in device
> data.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

With the name fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> This patch depends on the below series which adds PCIe support in
> Qualcomm IPQ5018
> https://lore.kernel.org/all/20231003120846.28626-1-quic_nsekar@quicinc.com/
>
>  drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> index 5ef6ae7276cf..9f9a03faf6fa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> @@ -54,6 +54,7 @@ struct uniphy_pcie_data {
>         unsigned int phy_type;
>         const struct uniphy_regs *init_seq;
>         unsigned int init_seq_num;
> +       unsigned int pipe_clk_rate;
>  };
>
>  struct qcom_uniphy_pcie {
> @@ -117,6 +118,7 @@ static const struct uniphy_pcie_data ipq5018_2x2_data = {
>         .phy_type       = PHY_TYPE_PCIE_GEN2,
>         .init_seq       = ipq5018_regs,
>         .init_seq_num   = ARRAY_SIZE(ipq5018_regs),
> +       .pipe_clk_rate  = 125000000,
>  };
>
>  static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
> @@ -232,6 +234,7 @@ static int qcom_uniphy_pcie_get_resources(struct platform_device *pdev,
>  static int phy_pipe_clk_register(struct qcom_uniphy_pcie  *phy,
>                                  struct device_node *np)
>  {
> +       const struct uniphy_pcie_data *data = phy->data;
>         struct clk_fixed_rate *fixed;
>         struct clk_init_data init = { };
>         int ret;
> @@ -247,7 +250,7 @@ static int phy_pipe_clk_register(struct qcom_uniphy_pcie  *phy,
>                 return -ENOMEM;
>
>         init.ops = &clk_fixed_rate_ops;
> -       fixed->fixed_rate = 125000000;
> +       fixed->fixed_rate = data->pipe_clk_rate;
>         fixed->hw.init = &init;
>
>         ret = devm_clk_hw_register(phy->dev, &fixed->hw);
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

