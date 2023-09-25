Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4FA7AD61D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 12:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjIYKfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 06:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjIYKfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 06:35:31 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5038E9B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:35:25 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-530e721f077so7289161a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638124; x=1696242924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZyhdDrJV352zjI8Tuutto6xY83e30C6wGWItGEl1bg=;
        b=Cko3Tcz1hPAvoCWT0LFyrSyw2JNb+XIk2AA5M4bqa2S3pRHfUi+RkWZOZIouvjKGjc
         /GBmiTfosyLk3ng4C6mfvHnsqGkEtXshqLDq/oUO5cyAVdAjg7Q0cjnD6iRh7o+yQGa6
         cIYfkOgVWLa35TzFsW5Fuf1HElRsia1yqQbeVr+PCZ+oRg4s9ApFJu+KUE742rGK00fv
         3rVHdWvfGZVu8UQGqdmUkaEwCuMUZsQjr91hG3uIT4RxcqViC8r9Rldyk+ndEnkPBoKM
         MG1U0eBgRgU7xyoxDzg4SLywfq7qWM08aNHBacTIGB8s4B86cWm76fBv7hjM2PH0F1PV
         zZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638124; x=1696242924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZyhdDrJV352zjI8Tuutto6xY83e30C6wGWItGEl1bg=;
        b=Ul0J00pdx5ISTom/DPdsEF6mMQNuzGqmJ15XqkfMFVdeIAcWUewQMjiA+J2MQeoQCm
         AWNR4Dt2imWqNLxUfzXlIU7TyPIpVdXfDvbudKBG9UoE1Nstcr3PYQmwpRSy3rq8sabk
         wZD9Un/bgQ368f/KreLAXhA9JknDgxST6boFzLHvFc2hXXxSwcIrP+fiO0Vwr/dS7Aua
         U5h0Jivl9Xk1S95Crxx6A4zWYnFsviNOs8yPAkImBnxf/JYGwwnBDulwAsSNUPaqbI0L
         Nya/sYkd7ZPyA1Bczl9m211r6Y0EUQyVQqdW2aH2dRttFPZmvH5lpxmEikJCGY7vlRgB
         XR5A==
X-Gm-Message-State: AOJu0YwGJNb28wGPCqps5YdcLTmD/POG9Hmkdg+r1prEHBrKB9frmcy2
        glFeNBrWvSBJ5TnwOwFP7YJiPw==
X-Google-Smtp-Source: AGHT+IHeWDey9ff2pNFAI61f8fEuT7PvDrj5H5KGhIfRV8o8wptuSEBdpJpduIKo8rNExZXT82luWw==
X-Received: by 2002:a05:6402:1150:b0:52c:8a13:2126 with SMTP id g16-20020a056402115000b0052c8a132126mr5599128edw.37.1695638123786;
        Mon, 25 Sep 2023 03:35:23 -0700 (PDT)
Received: from linaro.org ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id w10-20020aa7dcca000000b005309eb7544fsm5363243edu.45.2023.09.25.03.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 03:35:23 -0700 (PDT)
Date:   Mon, 25 Sep 2023 13:35:21 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     lpieralisi@kernel.org, kw@linux.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, bhelgaas@google.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Add interconnect bandwidth for PCIe Gen4
Message-ID: <ZRFiacVntTpNpy9/@linaro.org>
References: <20230924160713.217086-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924160713.217086-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-09-24 18:07:13, Manivannan Sadhasivam wrote:
> PCIe Gen4 supports the interconnect bandwidth of 1969 MBps. So let's add
> the bandwidth support in the driver. Otherwise, the default bandwidth of
> 985 MBps will be used.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Tested-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 297442c969b6..6853123f92c1 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1384,11 +1384,14 @@ static void qcom_pcie_icc_update(struct qcom_pcie *pcie)
>  	case 2:
>  		bw = MBps_to_icc(500);
>  		break;
> +	case 3:
> +		bw = MBps_to_icc(985);
> +		break;
>  	default:
>  		WARN_ON_ONCE(1);
>  		fallthrough;
> -	case 3:
> -		bw = MBps_to_icc(985);
> +	case 4:
> +		bw = MBps_to_icc(1969);
>  		break;
>  	}
>  
> -- 
> 2.25.1
> 
