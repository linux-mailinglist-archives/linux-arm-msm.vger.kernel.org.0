Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CF37C6DAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347193AbjJLML7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 08:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347177AbjJLML6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 08:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39276B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 05:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697112633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
        b=d1iVdSa97CjilKJHnv/QN5D8IEqZa6i3MJdqq6fp9bN6tvG00bp1APDsFipD9h95u5B/iQ
        lQBz53LxKyYt57xSDuq9vL28Mi9A0WHAyLr243Ny+BP/zBS4sKh4d3H8+oEZbvVhEdId0m
        amlHQoZsHdIeG1vkrm4R6nV8yMjZ2DI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-ASSRDZjqMhWIJ8fiOy6YGQ-1; Thu, 12 Oct 2023 08:10:16 -0400
X-MC-Unique: ASSRDZjqMhWIJ8fiOy6YGQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae0bf9c0b4so70633166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 05:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112615; x=1697717415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
        b=BX1PJMD6svbHIJnBJ9icPT9nXKst7XpkykiCz9G2AO/cfqZXRzlCpV8SqjQpQsIsDG
         eX/+sDNzPeGxti9GpjsdiSu6mmhYBfDI7Zvkb6CWcRQ0+WFR7KnRL3ArleadcCcHXYlh
         b+f6as7nKDb1cervP+sJf9NKTgkvDkUT/Fke8wJC+Itx+TsRx15qNleSDKxQiJMHbYTy
         BK2x4c36SQRwEueOrvt07gJwqColPFeAIo9dCgX516ghCNypBiQYIB8ib6qp8TOCvYqP
         /3Mjw6Tsr0N0k1vGPOz2D7rYYqLOjK143dyz37FsE/B0isCbETcSsp5tMY2pjje8ricl
         fpNA==
X-Gm-Message-State: AOJu0Yy/6jHLuIh1cgRu84+xuWK1EMz5oJUA+nFr5M4CUjerOmJXwYKq
        nnfDpF5RtJdDK78efR8I8G3zAvQZBYnvR4OvAf3LKmH+9nctcOHbIMP5It2v0DOu9jxlCm6IRDh
        EKo4MFbt1V6VPek4rLqM5sNUGTw==
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625682eju.27.1697112615683;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkVyuhaskOIIVNVit9o80c6O2JAINjoNgAy46RiSAkOYOLUZ42tscH4PSdUZo1OCucR3X4XQ==
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625662eju.27.1697112615307;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la18-20020a170906ad9200b0099cd008c1a4sm11019663ejb.136.2023.10.12.05.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:14 -0700 (PDT)
Message-ID: <7ad450c4-78df-ed5c-a05d-5dca8201d081@redhat.com>
Date:   Thu, 12 Oct 2023 14:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 16/56] media: atomisp: Use vb2_get_buffer() instead of
 directly access to buffers array
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
 <20231012114642.19040-17-benjamin.gaignard@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-17-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
> This could allow to change the type bufs[] field of vb2_buffer structure if
> needed.
> No need to check the result of vb2_get_buffer, vb2_ioctl_dqbuf() already
> checked that it is valid.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
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
> index a8e4779d007f..a8a964b2f1a8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1059,7 +1059,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	if (ret)
>  		return ret;
>  
> -	vb = pipe->vb_queue.bufs[buf->index];
> +	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
>  	frame = vb_to_frame(vb);
>  
>  	buf->reserved = asd->frame_status[buf->index];

