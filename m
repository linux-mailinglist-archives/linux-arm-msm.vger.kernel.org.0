Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09067280D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 15:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbjFHNC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 09:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbjFHNCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 09:02:54 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9C02727
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 06:02:52 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-651e298be3fso484013b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686229372; x=1688821372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kW5FnoKH7KmkpYlZqwEQzZ4Llthi1qtTvmtw7Q6w08w=;
        b=cn4MYvLNxKBjLwr4MoPYNSbR33ipLaeNSe1gXAqV8Zp4oJnJKSCIJlkFad0n848TI9
         Erqj1vrIZT00tlp215b8GpzUO4keUAe+BKUjsBcbJp1Oebx8XEwYHOrEUKLqmg0Og3pA
         ufsCUJnqlm2WbYx1gCAcYb5CBGZp3u3oIPV3q7DGkxS9JxiTK1L6UwAqzVFqTwk2sP7J
         CuPL6XcsU6/2ujXb4UJKlCZ5hswNDI2D11LidTg3RMxtwbS5cazDn2uFV6rnndsG+ZYV
         oa1diprkux7d8iOR+ar7WkPMQeAVMaSGP46xrmcdP4EuIqDkBelwgbRzF9ONz3jcu6I0
         /hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686229372; x=1688821372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kW5FnoKH7KmkpYlZqwEQzZ4Llthi1qtTvmtw7Q6w08w=;
        b=EX+JHt0V4d/X4Gz6BYmiKI8M4x1+PNR/znFm2VlplaBMSCRIkMk25bD+KMDkGhJ1TI
         62FORdstgRc/PKQscSj+VL8kIttOOksS4zF6LTYl7zDcs4V9nADraQ0SoOuncAkuyYjT
         RH89JJBLJJ3bHoEItPE5Hw2RmsrAFOeKfegFsrlp8iZKkWbc1OEcIe1S/2vWa3fwVc/5
         oebts6+6hR14hYaJ3X1vHO4fjCaQFxqWaQz4e2ZilxCHKDN5ToDGxjYGvT7yf1xhRgEW
         PwDO03SKQgBpwhjnfLpBTUwxkbRDrrkwydnWlBneTGLcC5s3m8U2zCTAi7Y/lPAKZq0N
         UcQQ==
X-Gm-Message-State: AC+VfDwYDnD74YUbpwnJ5U6pMGfY4qDMTOp5dcTsbt5dBIr/JQ8oHMRx
        KkOuI9HpP6KdkwWHyWzFhFEd
X-Google-Smtp-Source: ACHHUZ6/y7oKCY50CIIGwomUoDVxX5cSvlwoKVjD7S+7FZD+2ikjnGdNKQLV4ee6jPPR6diEJfGZ0A==
X-Received: by 2002:a17:902:f684:b0:1a6:6fe3:df8d with SMTP id l4-20020a170902f68400b001a66fe3df8dmr10831013plg.8.1686229371840;
        Thu, 08 Jun 2023 06:02:51 -0700 (PDT)
Received: from thinkpad ([117.202.186.138])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001b077301a58sm1407428plb.79.2023.06.08.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:02:51 -0700 (PDT)
Date:   Thu, 8 Jun 2023 18:32:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Li Jun <jun.li@nxp.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: Re: [PATCH 2/2] USB: dwc3: fix use-after-free on core driver unbind
Message-ID: <20230608130246.GF5672@thinkpad>
References: <20230607100540.31045-1-johan+linaro@kernel.org>
 <20230607100540.31045-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607100540.31045-3-johan+linaro@kernel.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 07, 2023 at 12:05:40PM +0200, Johan Hovold wrote:
> Some dwc3 glue drivers are currently accessing the driver data of the
> child core device directly, which is clearly a bad idea as the child may
> not have probed yet or may have been unbound from its driver.
> 
> As a workaround until the glue drivers have been fixed, clear the driver
> data pointer before allowing the glue parent device to runtime suspend
> to prevent its driver from accessing data that has been freed during
> unbind.
> 
> Fixes: 6dd2565989b4 ("usb: dwc3: add imx8mp dwc3 glue layer driver")
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> Cc: stable@vger.kernel.org      # 5.12
> Cc: Li Jun <jun.li@nxp.com>
> Cc: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> Cc: Krishna Kurapati <quic_kriskura@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/dwc3/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 7b2ce013cc5b..d68958e151a7 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1929,6 +1929,11 @@ static int dwc3_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
> +	/*
> +	 * HACK: Clear the driver data, which is currently accessed by parent
> +	 * glue drivers, before allowing the parent to suspend.
> +	 */
> +	platform_set_drvdata(pdev, NULL);

This is required because you have seen the glue driver going to runtime suspend
once the below pm_runtime_set_suspended() is completed?

- Mani

>  	pm_runtime_set_suspended(&pdev->dev);
>  
>  	dwc3_free_event_buffers(dwc);
> -- 
> 2.39.3
> 

-- 
மணிவண்ணன் சதாசிவம்
