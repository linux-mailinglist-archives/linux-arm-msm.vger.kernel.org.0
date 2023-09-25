Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3186B7AD629
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 12:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjIYKiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 06:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjIYKiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 06:38:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003A89B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:37:55 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-532c66a105bso7107157a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638274; x=1696243074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGghZheFgcUR7dMTyW2af1MMF9tD2msZKaFdfOnW2ak=;
        b=sLcW81cd/ojgWDKhXAyU8Jbg8Rg+b7Rj5PywDiQvG/iu4XNltDOMjNuv1Yj7G3cGL/
         WhDH9MF52fFM1VKPaK4AMs1I6sqKbMgAnYHRwf4msFaXikT2L36gJYK7uOF1NaYELq+9
         SVVRL3LfoZbVXx1mXP0pYGYHLSryT0ALHuo4VoHugci3qxdw5E7TiY/RT/s1UCwcbkp8
         YsXyX9EVzbFMnScpK7NsaMZSOgeLhsFF+nqasFE4jQW9VmJfKEOVtNjzIziSMZoxiAjN
         AZ2sIRui+IVTZ45dvycqyHWu3QlTBAjrGdCtV76wgcQjooIMms0GVxv6aoP7Rm9X/oe3
         cvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638274; x=1696243074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGghZheFgcUR7dMTyW2af1MMF9tD2msZKaFdfOnW2ak=;
        b=lNpbrcU5cUiHORevMFEOLk+CrIVP3hsAKSwVdMaTDSO5zH+zRpy6vkUl386TqWwvMq
         kwzl90azpyd/AGwM6VmFU7dgCPUedXKUt7h4fZ4HeR6gAzVD2kmClQoYGggyMpCjUIXo
         tYZ5ZGIsyVC2O5gW/5efqQPMtQ6cIpsNv+2QFqzeZg+Te1RA+Zhm2OIIVYfNRHOqVYNy
         WLQk2Eq7ug6xjmxzzeDB0WvXBbHKi+SHR6GvoC3/lgp79FqUdpOc67QrpAkjHS9KOlsy
         3c5IbgvCYbC2pg029S3nxgzOEvnOHsPp0jcDdljdJ86h7XOx0ku5J6d0/MJs7gLyAqkD
         1grw==
X-Gm-Message-State: AOJu0Yym1VPCCqudqxEybNBHTTnabQBs2YxagbuBBmQGFNoGJSC5LfaS
        2MDeTUNT/RuTKDrDpy6N5dA78x+IuTgTO3bSVog=
X-Google-Smtp-Source: AGHT+IH7VjXImbBigUelVhM0Z5rngKqZswAbcFnmM/TfO1kxTwisUcU0a7eAZcoTIRvst0CAQFzYjA==
X-Received: by 2002:aa7:c481:0:b0:52c:b469:bafd with SMTP id m1-20020aa7c481000000b0052cb469bafdmr4504674edq.41.1695638274456;
        Mon, 25 Sep 2023 03:37:54 -0700 (PDT)
Received: from linaro.org ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id y11-20020aa7cccb000000b005331f6d4a30sm5325436edt.56.2023.09.25.03.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 03:37:54 -0700 (PDT)
Date:   Mon, 25 Sep 2023 13:37:52 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, andersson@kernel.org,
        bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Add interconnect bandwidth for PCIe Gen4
Message-ID: <ZRFjAIYQQZnbNIdt@linaro.org>
References: <20230924160713.217086-1-manivannan.sadhasivam@linaro.org>
 <f49d0543-17bb-4105-9cdf-3df8c116481a@linaro.org>
 <ZRFiD3EXwZI/B8JB@linaro.org>
 <18635bed-b7e3-4acb-b176-cd9f87a35c7f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18635bed-b7e3-4acb-b176-cd9f87a35c7f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-09-25 12:34:53, Konrad Dybcio wrote:
> On 25.09.2023 12:33, Abel Vesa wrote:
> > On 23-09-25 10:57:47, Konrad Dybcio wrote:
> >> On 24.09.2023 18:07, Manivannan Sadhasivam wrote:
> >>> PCIe Gen4 supports the interconnect bandwidth of 1969 MBps. So let's add
> >>> the bandwidth support in the driver. Otherwise, the default bandwidth of
> >>> 985 MBps will be used.
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >>> ---
> >>>  drivers/pci/controller/dwc/pcie-qcom.c | 7 +++++--
> >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> >>> index 297442c969b6..6853123f92c1 100644
> >>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> >>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> >>> @@ -1384,11 +1384,14 @@ static void qcom_pcie_icc_update(struct qcom_pcie *pcie)
> >>>  	case 2:
> >>>  		bw = MBps_to_icc(500);
> >>>  		break;
> >>> +	case 3:
> >>> +		bw = MBps_to_icc(985);
> >>> +		break;
> >>>  	default:
> >>>  		WARN_ON_ONCE(1);
> >>>  		fallthrough;
> >>> -	case 3:
> >>> -		bw = MBps_to_icc(985);
> >>> +	case 4:
> >>> +		bw = MBps_to_icc(1969);
> >>>  		break;
> >> Are you adding case 4 under `default`? That looks.. bizzare..
> > 
> > That's intentional. You want it to use 1969MBps if there is a different
> > gen value. AFAIU.
> Gah right, then the commit message is wrong.

Yep, should be: "Otherwise, the default bandwidth of 1969 MBps will be
used."

But maybe we should not default to that. Maybe we should still default
to 985 MBps.

> 
> Konrad
