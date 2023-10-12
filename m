Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B265B7C6DA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 14:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347242AbjJLMLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 08:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343987AbjJLMLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 08:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33610C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697112628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
        b=SrCSLvreBIdBuPQM/ha4E3z3Kz37BfdrQ3thw0VpnxSanDR3ndvLBJ71x8TJhN+DJy8VHq
        yAGxBmUT9ArOJPrCPC4epac2kdYtpBbaCVMExKLLQv2h4+JZPC2dFCd/fgdGOPWIXyPBH9
        v0ofpKPvkaib8MrgB921PlXT1F/HfzA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-v9IWdNW-Pc2UpjQIxt15ww-1; Thu, 12 Oct 2023 08:10:27 -0400
X-MC-Unique: v9IWdNW-Pc2UpjQIxt15ww-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9a5d86705e4so68685466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 05:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112626; x=1697717426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
        b=EIdoExiK9qEHKVApy8M1pB1443eoJbegbdNp0aHq9r4kN3AKiXEnnAFM2EPpmqAqTH
         5UYPl4rZ2tv3flpzugHvf+chYV/2QY0qzTcxKeSjjhTbtRoPPoxkBahn9jjCe2XNcT7g
         WXDId1jr7GJ2KocpYuiTU0B4qnYc1JxL4scFt1VN0nIHpOtuWkNYX0SkY2niukNh6Tkm
         4pRaXzDdqHg3G0gxT113N1eO1SYNqpuh6wptehfeh9yc/lSyL8GlBLfxDjm5kfDDNhMX
         GklqhewSy8mYEopqS431lQ5WOcCIVj8rplHCcjO9fTFFEOE+LLpogwj/6M0msUWuvYSg
         PdLQ==
X-Gm-Message-State: AOJu0YwXvgPCHIJkWd++0flT4Pw9ELljfBINEcRUCXMC/4UiDx4mTPkU
        Rihp+EAVTmKKDQWpE1MU1eLf6GdWxAAu+BFNmpFVD9CfSVu866rA4NsZQms5rYyjRFKnsaY77ti
        mh7ndaN0vxQg2oKtG0XtIKciiLg==
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703357ejb.48.1697112625896;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjvJVtD0uQR8XMo2cR7XmHJlpYVc+HmbN4viv4pGPb6gmHPLLfBWOiJNvTCRNd4xhqfQomHg==
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703329ejb.48.1697112625566;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906711a00b0099329b3ab67sm11000199ejj.71.2023.10.12.05.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Message-ID: <c9e693a2-845f-9ef1-e3cb-724cece84756@redhat.com>
Date:   Thu, 12 Oct 2023 14:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 17/56] media: atomisp: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-18-benjamin.gaignard@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-18-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index a8a964b2f1a8..09c0091b920f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1028,7 +1028,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  
> -	if (buf->index >= vdev->queue->num_buffers)
> +	if (buf->index >= vb2_get_num_buffers(vdev->queue))
>  		return -EINVAL;
>  
>  	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {

