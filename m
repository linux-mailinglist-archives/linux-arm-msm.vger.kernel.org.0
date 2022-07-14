Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5D245750BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 16:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbiGNO1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 10:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239875AbiGNO12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 10:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D2B4599EA
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657808846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RNJXv/KlGONTEw9UXAEACL1ZXePk/fcM/JbeLsfKXUw=;
        b=S6ecHgbp6JJXU6cfRTYlI3TiARta1b53TRGk8AdxBqDp70qqdyg6R5A4LTb9rFQll20vz7
        +x0oCjuoTPNV97cwbnd22H23l5KYdmIbbqg9/LCE4hevPdXP91m43pl7RM5N4rVRq2pYQu
        hQhT+PQ5qWgz/ONy/dwOXLx/5evswgI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-JY9tQgeNNNWyMIYoppu7AA-1; Thu, 14 Jul 2022 10:27:25 -0400
X-MC-Unique: JY9tQgeNNNWyMIYoppu7AA-1
Received: by mail-qt1-f197.google.com with SMTP id cf20-20020a05622a401400b0031ed2d3fcd6so1162989qtb.20
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RNJXv/KlGONTEw9UXAEACL1ZXePk/fcM/JbeLsfKXUw=;
        b=GA2bqi99n/mWV6dtUMiI4p3WjlRgPhz32ptnlcj9+UiJeEQyZ74LRHyJO8MEcb36J7
         y0HmFO02kQXGny72FuTCHNdhVaHhVC6v5U162ZaQFuE/3sARI9Qj3IlKJH1aNpRG5/JM
         5p0TL1RMYBJGdQhC1WWp7xjpiEJxedsr7OfNDFkpas7j0xwH4cR9dxAb9h7pvZqdD21k
         vrM3im4/cUgdYor2XWGMfT3pH9R1MQj+GDDOiaMcu8RegCLCYUXFrV0Re66p+6SCKGh4
         PSuN4fztpCTgou4VftVMDzkPQBgkTDEQHGauS0eXovfUMqOKefy23Yvcqz26bb+EpuuJ
         nv1w==
X-Gm-Message-State: AJIora++WSWc/Z46/tVWk5Aj4OFazPEZnRDqOOJdo0KEc37RgbFcxcpw
        CmE6EUejrAM3fOvBQFfd+f5Lag/DqFHanBBvLavsmZVbd2FnqQo90w1TcgGypM6ImjalWQFDinV
        lTb1pQJ0JoD3qcUr8C/qHI2xk0Q==
X-Received: by 2002:a05:620a:f89:b0:6ae:d418:f478 with SMTP id b9-20020a05620a0f8900b006aed418f478mr6128523qkn.344.1657808844826;
        Thu, 14 Jul 2022 07:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5up/uVQSQVJGK2rot92yODR4yGOS6QtM36+OI4Q093IbCDbzMZioEvPtNIyYuRZVqtbwvyQ==
X-Received: by 2002:a05:620a:f89:b0:6ae:d418:f478 with SMTP id b9-20020a05620a0f8900b006aed418f478mr6128500qkn.344.1657808844567;
        Thu, 14 Jul 2022 07:27:24 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id r14-20020ac867ce000000b0031eb47652dcsm1534529qtp.59.2022.07.14.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:27:24 -0700 (PDT)
Date:   Thu, 14 Jul 2022 10:27:23 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] PCI: qcom: Sort device-id table
Message-ID: <YtAny03L/RLk9nv6@xps13>
References: <20220714071348.6792-1-johan+linaro@kernel.org>
 <20220714071348.6792-9-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714071348.6792-9-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 14, 2022 at 09:13:48AM +0200, Johan Hovold wrote:
> Sort the device-id table entries alphabetically by compatible string to
> make it easier to find entries and add new ones.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8dddb72f8647..fea921cca8fa 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1749,24 +1749,24 @@ static int qcom_pcie_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qcom_pcie_match[] = {
> +	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
> +	{ .compatible = "qcom,pcie-ipq6018", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-ipq8064", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
> -	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
> -	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>  	{ .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
>  	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

qcom,pcie-ipq4019 should be moved up above qcom,pcie-ipq6018.

Brian

