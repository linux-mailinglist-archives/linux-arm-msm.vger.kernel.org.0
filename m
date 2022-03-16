Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B35B4DAD04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 09:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354747AbiCPI6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 04:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354719AbiCPI6P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 04:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E595D65169
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647421021;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0Bc153qdO6aJS+V+8boSatM96Pn9LsInVn8PpJNJpKY=;
        b=V60Ao4Zw1OA7tAOzdGW44leJ0jkElJhSPole8p+6UPMribGjSmwXawi+d7wL2Q1uaj/FON
        k2CwETmF1FBe7qqQ65ImSpIasQTWKeABDsfs/Z/Z9ZDbgpp3vQdsjJ7ohAKIiOP5I7+x9l
        Ax1/tYInHk81E+ISM4zKnhPSG9WCdaE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-tLNwxN1PO8KosA3umiEOag-1; Wed, 16 Mar 2022 04:56:59 -0400
X-MC-Unique: tLNwxN1PO8KosA3umiEOag-1
Received: by mail-wr1-f71.google.com with SMTP id a16-20020adff7d0000000b001f0473a6b25so333931wrq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 01:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Bc153qdO6aJS+V+8boSatM96Pn9LsInVn8PpJNJpKY=;
        b=mEJb9R3OYXfurEnqb1I97Bveo2AQVaqy1SNhGWFQ3PbdLzonYTGIBcTirrk+FH0+6S
         sd1MP05jcyZRq8sSxw3d4THSqrr5mT/o/bmXqm5yhU8CLvf6fHoieu6zhVwSd9hBBW4i
         l+0iq93VDbWUmY2eCj6g7ICogsCHQBzZSeT2wKhbXd9s08TCgC10r0f+GlHfP46fAi7I
         wCE3REZoIEJWz0kD4Xn09/9CHObY1uAitrIA/CJpaj+R8uJbWMrgfev3cLIuPYf4LAAC
         WLmMLIbQnYppcvqcr3XjOHTiCaYL/0Vf88GOPlpI6pvau7MfFwuzgl33ixInuiWooLzN
         +hqw==
X-Gm-Message-State: AOAM530ZK0fE827s5BMwc6MGBuvgqmnuoF+Yuf0T6Bfd8WEcjX3dViZh
        2fkLJKOB7GblQP9tx6KiQE/wvmEI6Y8pwWqHIzYb8CVSKZBRV/Aio6Ti+KgpnnI2if8QRP5cEIe
        MOT58FA/IiT3PhORxxwrZA0qpZw==
X-Received: by 2002:a5d:4d4b:0:b0:1f1:d99e:1122 with SMTP id a11-20020a5d4d4b000000b001f1d99e1122mr23570224wru.604.1647421018441;
        Wed, 16 Mar 2022 01:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxg+HdKFc+OlgI5Uf6j74GkTyT+tlDfMeOChHK9/5Na0k8DDsBUyiZqTzroGOmIKGPRSv82g==
X-Received: by 2002:a5d:4d4b:0:b0:1f1:d99e:1122 with SMTP id a11-20020a5d4d4b000000b001f1d99e1122mr23570190wru.604.1647421018228;
        Wed, 16 Mar 2022 01:56:58 -0700 (PDT)
Received: from redhat.com ([2.53.2.35])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d59a1000000b00203d83b0ae4sm1136056wrr.109.2022.03.16.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 01:56:57 -0700 (PDT)
Date:   Wed, 16 Mar 2022 04:56:48 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v4 08/11] vdpa: Use helper for safer setting of
 driver_override
Message-ID: <20220316045633-mutt-send-email-mst@kernel.org>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
 <20220312132856.65163-9-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220312132856.65163-9-krzysztof.kozlowski@canonical.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 12, 2022 at 02:28:53PM +0100, Krzysztof Kozlowski wrote:
> Use a helper to set driver_override to reduce amount of duplicated code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge with the rest of the patchset.

> ---
>  drivers/vdpa/vdpa.c  | 29 ++++-------------------------
>  include/linux/vdpa.h |  4 +++-
>  2 files changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> index 1ea525433a5c..2dabed1df35c 100644
> --- a/drivers/vdpa/vdpa.c
> +++ b/drivers/vdpa/vdpa.c
> @@ -77,32 +77,11 @@ static ssize_t driver_override_store(struct device *dev,
>  				     const char *buf, size_t count)
>  {
>  	struct vdpa_device *vdev = dev_to_vdpa(dev);
> -	const char *driver_override, *old;
> -	char *cp;
> +	int ret;
>  
> -	/* We need to keep extra room for a newline */
> -	if (count >= (PAGE_SIZE - 1))
> -		return -EINVAL;
> -
> -	driver_override = kstrndup(buf, count, GFP_KERNEL);
> -	if (!driver_override)
> -		return -ENOMEM;
> -
> -	cp = strchr(driver_override, '\n');
> -	if (cp)
> -		*cp = '\0';
> -
> -	device_lock(dev);
> -	old = vdev->driver_override;
> -	if (strlen(driver_override)) {
> -		vdev->driver_override = driver_override;
> -	} else {
> -		kfree(driver_override);
> -		vdev->driver_override = NULL;
> -	}
> -	device_unlock(dev);
> -
> -	kfree(old);
> +	ret = driver_set_override(dev, &vdev->driver_override, buf, count);
> +	if (ret)
> +		return ret;
>  
>  	return count;
>  }
> diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
> index 721089bb4c84..37117404660e 100644
> --- a/include/linux/vdpa.h
> +++ b/include/linux/vdpa.h
> @@ -64,7 +64,9 @@ struct vdpa_mgmt_dev;
>   * struct vdpa_device - representation of a vDPA device
>   * @dev: underlying device
>   * @dma_dev: the actual device that is performing DMA
> - * @driver_override: driver name to force a match
> + * @driver_override: driver name to force a match; do not set directly,
> + *                   because core frees it; use driver_set_override() to
> + *                   set or clear it.
>   * @config: the configuration ops for this device.
>   * @cf_mutex: Protects get and set access to configuration layout.
>   * @index: device index
> -- 
> 2.32.0

