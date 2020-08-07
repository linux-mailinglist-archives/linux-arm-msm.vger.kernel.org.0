Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7C023F525
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Aug 2020 01:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgHGXRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 19:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgHGXRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 19:17:47 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C52C061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2020 16:17:45 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a26so3699160ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=uEfOm+DIoBJEQPRggKsqD/6K343VADgWw4J5soIp4mA=;
        b=dv1DEOfjuOxASatUB7O3COgLAdZmAgtyeMQhG54fA3/2ZjH9iClolbSINHdcnp/rHF
         JYFmq2+McWsQmT7AC4fDouu6tJ+Dr/S48tTQiuMj5WrOd+pDoWAOMKCkjyuQzCZHix0e
         joB/jrcDY0nyj73Qft4ycQk/jW642GmEK1NAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=uEfOm+DIoBJEQPRggKsqD/6K343VADgWw4J5soIp4mA=;
        b=qcqgX9os/lzXN3+QECudWLqmYZEsRSpyPdmqQnSm4D7QVQ5Y+vQfX0MbDj2FpZPpcI
         iRk1h6i9irtaVzejARjgnf3mevL0Cf524pDh/SWHDXWKQbnZm0VKmRf647qKi8vHc4n3
         fBcJ1c2t6l0F6NgmzSLjX9xu1JO5aw2ApE4gfpshMF/l496366b/EeQBSDaGXZCG94oW
         xkxZRFYCAgVRgEqx+jrhYAlATCfNleEaICvzne4In+2KMRYathB7deUGk4bp/hk1vz21
         y/eFvI9WAd1PRZsh7RXhOM+YJCremyLRFIU1Dt41palFcZ52m4qdVR3b4k6Mqj1fTTUo
         BpzA==
X-Gm-Message-State: AOAM532CzwJAEBIMT2ZUpBd92NsVQYLS/LH9ECOtI4xLgB1UqGXrUt6K
        URtsaPtkeAziJn/kLYI2xIWRSTxvgi0=
X-Google-Smtp-Source: ABdhPJyv+rP3r9Jnd4w6h4r8jA4eWml/XZ9VMjX9gxhAL6/+3NKnUqRIytNCD3HWkpk572kxrqI9Gw==
X-Received: by 2002:a17:906:1911:: with SMTP id a17mr10853506eje.431.1596842264192;
        Fri, 07 Aug 2020 16:17:44 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id v14sm6845800ejb.63.2020.08.07.16.17.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 16:17:43 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id p14so3002684wmg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 16:17:43 -0700 (PDT)
X-Received: by 2002:a1c:6446:: with SMTP id y67mt9333959wmb.49.1596842262920;
 Fri, 07 Aug 2020 16:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200804114845.25086-1-user@vgarodia-linux>
In-Reply-To: <20200804114845.25086-1-user@vgarodia-linux>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 7 Aug 2020 16:17:30 -0700
X-Gmail-Original-Message-ID: <CAMfZQbxE1KAC03_7L1qqkb1gDr12SoO-UFs+UN9jAhQ6dCs0zQ@mail.gmail.com>
Message-ID: <CAMfZQbxE1KAC03_7L1qqkb1gDr12SoO-UFs+UN9jAhQ6dCs0zQ@mail.gmail.com>
Subject: Re: [PATCH] venus: fixes for list corruption
Cc:     linux-media@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org,
        Rajeshwar Kurapaty <rkurapat@qti.qualcomm.com>,
        Giri Kapalli <gkapalli@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 4, 2020 at 5:23 AM Vikash Garodia <"Vikash
Garodia"@qti.qualcomm.com> wrote:
>
> From: Vikash Garodia <vgarodia@codeaurora.org>
>
> There are few list handling issues while adding and deleting
> node in the registered buf list in the driver.
> 1. list addition - buffer added into the list during buf_init
> while not deleted during cleanup.
> 2. list deletion - In capture streamoff, the list was reinitialized.
> As a result, if any node was present in the list, it would
> lead to issue while cleaning up that node during buf_cleanup.
>
> Corresponding call traces below:
> [  165.751014] Call trace:
> [  165.753541]  __list_add_valid+0x58/0x88
> [  165.757532]  venus_helper_vb2_buf_init+0x74/0xa8 [venus_core]
> [  165.763450]  vdec_buf_init+0x34/0xb4 [venus_dec]
> [  165.768271]  __buf_prepare+0x598/0x8a0 [videobuf2_common]
> [  165.773820]  vb2_core_qbuf+0xb4/0x334 [videobuf2_common]
> [  165.779298]  vb2_qbuf+0x78/0xb8 [videobuf2_v4l2]
> [  165.784053]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
> [  165.789067]  v4l2_m2m_ioctl_qbuf+0x2c/0x38 [v4l2_mem2mem]
> [  165.794624]  v4l_qbuf+0x48/0x58
>
> [ 1797.556001] Call trace:
> [ 1797.558516]  __list_del_entry_valid+0x88/0x9c
> [ 1797.562989]  vdec_buf_cleanup+0x54/0x228 [venus_dec]
> [ 1797.568088]  __buf_prepare+0x270/0x8a0 [videobuf2_common]
> [ 1797.573625]  vb2_core_qbuf+0xb4/0x338 [videobuf2_common]
> [ 1797.579082]  vb2_qbuf+0x78/0xb8 [videobuf2_v4l2]
> [ 1797.583830]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
> [ 1797.588843]  v4l2_m2m_ioctl_qbuf+0x2c/0x38 [v4l2_mem2mem]
> [ 1797.594389]  v4l_qbuf+0x48/0x58
>
> Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 7c4c483d5438..76be14efbfb0 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1088,8 +1088,6 @@ static int vdec_stop_capture(struct venus_inst *inst)
>                 break;
>         }
>
> -       INIT_LIST_HEAD(&inst->registeredbufs);
> -
>         return ret;
>  }
>
> @@ -1189,6 +1187,14 @@ static int vdec_buf_init(struct vb2_buffer *vb)
>  static void vdec_buf_cleanup(struct vb2_buffer *vb)
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +       struct venus_buffer *buf = to_venus_buffer(vbuf);
> +
> +       mutex_lock(&inst->lock);
> +       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               if (!list_empty(&inst->registeredbufs))
> +                       list_del_init(&buf->reg_list);
> +       mutex_unlock(&inst->lock);
>
>         inst->buf_count--;
>         if (!inst->buf_count)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
