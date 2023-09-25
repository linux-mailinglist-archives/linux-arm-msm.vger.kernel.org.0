Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327727AD60F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 12:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjIYKeE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 06:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjIYKeD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 06:34:03 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DBFAB
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:33:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9ae75ece209so561485266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638034; x=1696242834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekCv4qzE66DA9iSUYqv5BiKSB2t3mh63TAlLnqGfHvY=;
        b=Jtz28gQNbDQCex1zu5TcxEHE3N8LNUjVrSLD+VM8q+/OruhKMtcKpeVoIa2y1FYfkl
         pNRxkDSWdP78zovMznhZPZJUv7HhwI0FCB1fM/34UOnau1l8LdIcAx6BT4KrrTDOleIh
         VzDHMX7oFRgrvq1nuK55fXRLEubOpWtg7pd82BJynGArSv6Ln7jpY/lYiSblK7CNT1ZE
         7Ayux8l/FCURDfUajgAVJIVGrN10lF9qJHC6D/GAJsNB1ZAGkyu0K3LEf7pG1qHHE662
         9OHWCCUZiLLwGSj8WvWrDqR2zAWca1Zk9ag+z7UcIbv7/4vztz2Wtrlg+BVUarG9QwjI
         kXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638034; x=1696242834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekCv4qzE66DA9iSUYqv5BiKSB2t3mh63TAlLnqGfHvY=;
        b=fp7au7GdQ2wza7Kr7dGcLnd9ytLXPYXvS/RsKkuZrFpcKdtq9SMK+Z68Jm2VTlFfKH
         //U/0QYMhyQTZ8T+7Rzhk8OOas4eu0IcUjgO5rGfP43q+c7ordZPyaqVZcfYMLEaCec1
         Is3f95rYYiw3yWaZNcHTojRD+gXAEUjYsIv9dqbQa3C92RWFj7hqngxxqPUZtmGGopKw
         np1ZFfvWQSAwQVqi1R6njGqnM4PG3JSBB0GgkRVwF2joJBTpUKLbaIte6BiO22Od44v8
         Nqv3hBwcmpVdkRCHpNFfbTsYQxSh4NCPjUnsKQPwFirVFjV0jltUNzi7N0kw/QozKNCJ
         jIaA==
X-Gm-Message-State: AOJu0YwIuavOituat+OhgYybVaMAQL4mDwg+M6OZH7vCkoKaQxGelsKb
        1vZjBWbkT5BllIiXTag0YQSotg==
X-Google-Smtp-Source: AGHT+IGDOBf7GsrQglZf0+8h8vnRYXgH/eCzX9qj4ZhPwRp3Mst8jCCWek8RtGVV9RKUTj83nCJXEg==
X-Received: by 2002:a17:906:3153:b0:9ae:552a:3d3f with SMTP id e19-20020a170906315300b009ae552a3d3fmr5619986eje.28.1695638034032;
        Mon, 25 Sep 2023 03:33:54 -0700 (PDT)
Received: from linaro.org ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090639d200b00982a352f078sm6046747eje.124.2023.09.25.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 03:33:53 -0700 (PDT)
Date:   Mon, 25 Sep 2023 13:33:51 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, andersson@kernel.org,
        bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Add interconnect bandwidth for PCIe Gen4
Message-ID: <ZRFiD3EXwZI/B8JB@linaro.org>
References: <20230924160713.217086-1-manivannan.sadhasivam@linaro.org>
 <f49d0543-17bb-4105-9cdf-3df8c116481a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f49d0543-17bb-4105-9cdf-3df8c116481a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-09-25 10:57:47, Konrad Dybcio wrote:
> On 24.09.2023 18:07, Manivannan Sadhasivam wrote:
> > PCIe Gen4 supports the interconnect bandwidth of 1969 MBps. So let's add
> > the bandwidth support in the driver. Otherwise, the default bandwidth of
> > 985 MBps will be used.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 297442c969b6..6853123f92c1 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1384,11 +1384,14 @@ static void qcom_pcie_icc_update(struct qcom_pcie *pcie)
> >  	case 2:
> >  		bw = MBps_to_icc(500);
> >  		break;
> > +	case 3:
> > +		bw = MBps_to_icc(985);
> > +		break;
> >  	default:
> >  		WARN_ON_ONCE(1);
> >  		fallthrough;
> > -	case 3:
> > -		bw = MBps_to_icc(985);
> > +	case 4:
> > +		bw = MBps_to_icc(1969);
> >  		break;
> Are you adding case 4 under `default`? That looks.. bizzare..

That's intentional. You want it to use 1969MBps if there is a different
gen value. AFAIU.

> 
> Konrad
