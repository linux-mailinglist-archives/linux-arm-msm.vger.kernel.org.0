Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C51075D64F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 23:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGUVQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 17:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjGUVQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 17:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9E5359C
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689974086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AucQCy4EnWPkoso2uzU/nf9OwRCQs6NxgaktwWeEhXE=;
        b=Km0dWAq2eh9IRm3XR0qCCHa/rWdYWTnJa1mLVwDuS8jjqqEcQWEqUad8hxo/KPM5Nv5bqH
        HojGtsB0sDgHVdJ24lhamyZIwyKrTE0nn388GTOTmV9L18n+qvMJ4PTrAYbnStAtoMLjxi
        jldqPHYg29rFZzXmw0dG1Gr3BcHHd3s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-q4ecLO62OKSouvpzubpnQg-1; Fri, 21 Jul 2023 17:14:44 -0400
X-MC-Unique: q4ecLO62OKSouvpzubpnQg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635e91cba88so28612936d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 14:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689974084; x=1690578884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AucQCy4EnWPkoso2uzU/nf9OwRCQs6NxgaktwWeEhXE=;
        b=jD7yqq+e3D7EccoB+R6tvDYQ3dEcgudArYO4jxcBZ+OFvUSeASaadHjTcmtw9jaIwY
         5mzgi3ut6aUxf929Nk3kDEnjDGmANG9t/z4VFiuGr8hjYy6rv7m/0160XMGTaNoCq2G/
         xZbXHcsS28Gn4Kc1HrE5nwOFZlbeDiG4rPMOnGPMl/FdfmKrLB1GNTr8/6xheH9XdAlq
         7A7B05bvzq4M7yXEkgs3Hg6KfsTd1vYgrlK+0jbneoDcwXQEuDLbdQa6xT+F1w7/WHQU
         5ThIzwIvGMTEHG9b5+M5PuqLTT8uA9ElQFSY11CxG1kR/guqxIm35bGawrh684NsoMhx
         8yuw==
X-Gm-Message-State: ABy/qLZ7YETVx8uJnS2zhzRSAkiI7nOr7HgWOHotlLvWB0XlVOQOs9ky
        BC9R+J8gEfWHlhlQWiXvuyMOs0o6E6IkgtWcTTEH+aCgOUsFIe3ReXbFEaWoqR87lChWoTDlPid
        3jpxSjt2TSAuThFNX3cYOk7kBfw==
X-Received: by 2002:a0c:f907:0:b0:5f4:5af6:1304 with SMTP id v7-20020a0cf907000000b005f45af61304mr1213661qvn.16.1689974084334;
        Fri, 21 Jul 2023 14:14:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGVrQNjzF4DBXjYQf8nrO32CEZALTxhI79MrPwcX2lK9z4QDzLcWJNFd+xdC4Hmp+SIWIpFuA==
X-Received: by 2002:a0c:f907:0:b0:5f4:5af6:1304 with SMTP id v7-20020a0cf907000000b005f45af61304mr1213645qvn.16.1689974084073;
        Fri, 21 Jul 2023 14:14:44 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id m6-20020a0cdb86000000b0063c7037f85fsm1565490qvk.73.2023.07.21.14.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 14:14:43 -0700 (PDT)
Date:   Fri, 21 Jul 2023 16:14:41 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: Log clk_get("iface") failures
Message-ID: <ydy3ubtg75kzml23cowxpkmapoe2vlajm3r5sjglilffuhxr5q@t77ck5lknudy>
References: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721164901.2155287-1-quic_bjorande@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 21, 2023 at 09:49:01AM -0700, Bjorn Andersson wrote:
> Failing to acquire the iface clock makes probing of the Qualcomm
> SoundWire driver fail without providing any indication to the user. Make
> the driver log the error to aid debugging system configuration issues.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 55be9f4b8d59..e51b1dfce82d 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1550,7 +1550,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  
>  	ctrl->hclk = devm_clk_get(dev, "iface");
>  	if (IS_ERR(ctrl->hclk)) {
> -		ret = PTR_ERR(ctrl->hclk);
> +		ret = dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface clock\n");
>  		goto err_init;
>  	}
>  
> -- 
> 2.25.1
> 

