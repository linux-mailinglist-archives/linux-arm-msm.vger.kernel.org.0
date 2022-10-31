Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688A3613EAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiJaUGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiJaUGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A7C13EAF
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667246749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H3ZU5SpqvPjaqpTfjZ04SSbHmjl8vKSTt7kMWQY1QWg=;
        b=LB61e3idhadxPd0DIWx5e40WqqdqnEoADf4ZxPCVMJVWXkI9kpbwFosZIniXRpc8p5uCn7
        mVhfsSHA+7bGGinybO0ZQ15foS4FsnC9dm8BkugmrRFuGVJ/Hj64J/uK8LS8rnmlOOpiuB
        MHhr8YzcJS8bFLffX/cChzRqZXTtbts=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-p58LcTm7OwW08XBME60IWw-1; Mon, 31 Oct 2022 16:05:47 -0400
X-MC-Unique: p58LcTm7OwW08XBME60IWw-1
Received: by mail-ot1-f71.google.com with SMTP id a22-20020a0568300b9600b0065c0cef3662so6918429otv.14
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 13:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3ZU5SpqvPjaqpTfjZ04SSbHmjl8vKSTt7kMWQY1QWg=;
        b=w0G8Wv6kwAxIrMu7rK/d6hFmLI+7DtUN2c9XvlZte4QDvHo5PWWGjpBUJBTou5yVRD
         RsojhkPrUMwxeNM2C4sk+9wD1suAFtux6czc1HU3N50AO/QskqUyYkyF0O1l0FU/BC4q
         trX9XBI1eae+BjmhDbGe2uhyC+r+rfh/OsBFvvLUyS0/n+5IQgiTxfXzuo4AGJUvA/V0
         ZiXDjK0XzgYxQESUfUZCG5vDOljmVcSrng3iEtk2aZRoKkoMHLU0sSt1KFYPM3151idb
         sLius7GGtWOLuhayOB2ariPSxgqeSHVpIByXdq7ipTlCI3T01JRuuS7qksHBh/NI25ai
         ruJQ==
X-Gm-Message-State: ACrzQf0CNYpJY4q2vDwF/czCXQ7ETVLAMalJJeGiCJM/RFdfsATUqQ3G
        2tM0HCQZYxDcQW1Qfot0GSWtJc2Zx1qJUwfBVSXkl2vcI/BU6N9Jru4Xdsd1dGJ6TX+CPJRjAPa
        G+AQ5taGCVOiSSw9FkGGvElVffQ==
X-Received: by 2002:a05:6830:6401:b0:661:c74e:6b03 with SMTP id cj1-20020a056830640100b00661c74e6b03mr7158951otb.291.1667246746795;
        Mon, 31 Oct 2022 13:05:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4UUO37SZvA4qjX9uf7dmQCxxsJtcyXRaXYuTlx2k2AoBUUULV+m0zUJOEaCdymKZ+gqdzveQ==
X-Received: by 2002:a05:6830:6401:b0:661:c74e:6b03 with SMTP id cj1-20020a056830640100b00661c74e6b03mr7158939otb.291.1667246746589;
        Mon, 31 Oct 2022 13:05:46 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id y1-20020a056830108100b00660fe564e12sm3092167oto.58.2022.10.31.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:05:46 -0700 (PDT)
Date:   Mon, 31 Oct 2022 15:05:43 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 11/15] scsi: ufs: ufs-qcom: Use dev_err_probe() for
 printing probe error
Message-ID: <20221031200543.7j3pw4idrawxge2h@halaney-x13s>
References: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
 <20221031180217.32512-12-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031180217.32512-12-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 31, 2022 at 11:32:13PM +0530, Manivannan Sadhasivam wrote:
> Make use of dev_err_probe() for printing the probe error.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8bb0f4415f1a..38e2ed749d75 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1441,9 +1441,9 @@ static int ufs_qcom_probe(struct platform_device *pdev)
>  	/* Perform generic probe */
>  	err = ufshcd_pltfrm_init(pdev, &ufs_hba_qcom_vops);
>  	if (err)
> -		dev_err(dev, "ufshcd_pltfrm_init() failed %d\n", err);
> +		return dev_err_probe(dev, err, "ufshcd_pltfrm_init() failed\n");
>  
> -	return err;
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.25.1
> 

