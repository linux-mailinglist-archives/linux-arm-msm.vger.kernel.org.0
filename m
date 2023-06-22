Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9977473A65E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 18:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbjFVQqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjFVQqi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 12:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A07B1FDF
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687452354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q6LLoDXAD0fPuc6AsW0BAVbjdcqFGmumwyZ+jo/wBt4=;
        b=F5GnnESvKjnYu/ey9gviN20Q5siww8KfsBF/u/Qdv1Iv8ghgMarbGSltwk++4mzhP0XYW4
        483iYCJWx9KfAsdake4a9s4p0acoAfqXhJ0tTKu6t6C7c2Q7AJnBNQQ7ZgvKJv7nh/wYXW
        eOxG3wfXoGnw0hAthCdnMbw1eAP4eBc=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-ygufftXSOzmcI90lYKlw9g-1; Thu, 22 Jun 2023 12:45:49 -0400
X-MC-Unique: ygufftXSOzmcI90lYKlw9g-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6b2ac1fe3d6so7028810a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 09:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687452348; x=1690044348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6LLoDXAD0fPuc6AsW0BAVbjdcqFGmumwyZ+jo/wBt4=;
        b=fu7w/KKSQfWQBmZr7cFEcJLVri14AhzBwGTKf7Dqx2Qt2AGbCleQLG0aDqf0CraddZ
         R6Kk5LbmYYNq0BQLv6bgdpiKfLf45hGhWuT8tx9ScuPACdYaS8QxSTffTyLl/42iDoGU
         bSIBA4rZZVcJvsP1EgZfN1KUyRMjN8H2RF3rkBAxi7HN+SP60Ej7Q8kpig5hDtwpbYfF
         ld9vufOwzU6VcNm/lxDXwSus2q1/VPLBgHYeoFbpQSJ/l+ROG40//zN3+D6wz0tXE53G
         iTwh+ngd0jorz1PHmDpHyrSZ3sMHLkp6nX23QSXqeZNtNhvgUzM5UGr3mTZKcoz7EllS
         Ctgg==
X-Gm-Message-State: AC+VfDyvrMsv110r8S3fAZGktGI/tYKD7ciApOvUVZo6V8xxjEpPYG1M
        AtRKlqhh6RentVoo5o+oCDoZp6wiyJNV5b6kPghDGPP+0arv0ojUZ1uoaJrhiuMO7UKplt5EqHV
        rBH8cC8bMPlwSoC4D7dld77kQtg==
X-Received: by 2002:a9d:7cc9:0:b0:6b5:b654:6d52 with SMTP id r9-20020a9d7cc9000000b006b5b6546d52mr5972034otn.8.1687452348486;
        Thu, 22 Jun 2023 09:45:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58fV++PhlPXYEECuy/QGlkeVFyp9FOiUQFioQbIDyJnts066atIqJRXo+P+fhPbGGa+c0vZw==
X-Received: by 2002:a9d:7cc9:0:b0:6b5:b654:6d52 with SMTP id r9-20020a9d7cc9000000b006b5b6546d52mr5972023otn.8.1687452348243;
        Thu, 22 Jun 2023 09:45:48 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id p13-20020a056830130d00b006b469ace1b1sm3007058otq.22.2023.06.22.09.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 09:45:47 -0700 (PDT)
Date:   Thu, 22 Jun 2023 11:45:44 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [RESEND v7 2/3] scsi: ufs: ufs-qcom: Switch to the new ICE API
Message-ID: <20230622164544.4exzdv2hoptgitdx@halaney-x13s>
References: <20230612192847.1599416-1-abel.vesa@linaro.org>
 <20230612192847.1599416-3-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612192847.1599416-3-abel.vesa@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 10:28:46PM +0300, Abel Vesa wrote:
> Now that there is a new dedicated ICE driver, drop the ufs-qcom-ice and
> use the new ICE api provided by the Qualcomm soc driver ice. The platforms
> that already have ICE support will use the API as library since there will
> not be a devicetree node, but instead they have reg range. In this case,
> the of_qcom_ice_get will return an ICE instance created for the consumer's
> device. But if there are platforms that do not have ice reg in the
> consumer devicetree node and instead provide a dedicated ICE devicetree
> node, the of_qcom_ice_get will look up the device based on qcom,ice
> property and will get the ICE instance registered by the probe function
> of the ice driver.
> 
> The ICE clock is now handle by the new driver. This is done by enabling
> it on the creation of the ICE instance and then enabling/disabling it on
> UFS runtime resume/suspend.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/ufs/host/Kconfig        |   2 +-
>  drivers/ufs/host/Makefile       |   4 +-
>  drivers/ufs/host/ufs-qcom-ice.c | 244 --------------------------------
>  drivers/ufs/host/ufs-qcom.c     |  99 ++++++++++++-
>  drivers/ufs/host/ufs-qcom.h     |  32 +----
>  5 files changed, 104 insertions(+), 277 deletions(-)
>  delete mode 100644 drivers/ufs/host/ufs-qcom-ice.c
> 
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index 8793e3433580..16624ba08050 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -59,7 +59,7 @@ config SCSI_UFS_QCOM
>  	depends on SCSI_UFSHCD_PLATFORM && ARCH_QCOM
>  	depends on GENERIC_MSI_IRQ
>  	depends on RESET_CONTROLLER
> -	select QCOM_SCM if SCSI_UFS_CRYPTO
> +	select QCOM_INLINE_CRYPTO_ENGINE if SCSI_UFS_CRYPTO
>  	help
>  	  This selects the QCOM specific additions to UFSHCD platform driver.
>  	  UFS host on QCOM needs some vendor specific configuration before
> diff --git a/drivers/ufs/host/Makefile b/drivers/ufs/host/Makefile
> index d7c5bf7fa512..4573aead02eb 100644
> --- a/drivers/ufs/host/Makefile
> +++ b/drivers/ufs/host/Makefile
> @@ -3,9 +3,7 @@
>  obj-$(CONFIG_SCSI_UFS_DWC_TC_PCI) += tc-dwc-g210-pci.o ufshcd-dwc.o tc-dwc-g210.o
>  obj-$(CONFIG_SCSI_UFS_DWC_TC_PLATFORM) += tc-dwc-g210-pltfrm.o ufshcd-dwc.o tc-dwc-g210.o
>  obj-$(CONFIG_SCSI_UFS_CDNS_PLATFORM) += cdns-pltfrm.o
> -obj-$(CONFIG_SCSI_UFS_QCOM) += ufs_qcom.o
> -ufs_qcom-y += ufs-qcom.o
> -ufs_qcom-$(CONFIG_SCSI_UFS_CRYPTO) += ufs-qcom-ice.o
> +obj-$(CONFIG_SCSI_UFS_QCOM) += ufs-qcom.o

The change from ufs_qcom.o to ufs-qcom.o here makes ufs_qcom.ko turn
into ufs-qcom.ko.

That broke a (fragile :P ) initramfs development script I play with. Not
sure if that's any sort of contract with userspace or not, but thought
I'd report it at least in case someone has a strong opinion.

Thanks,
Andrew

