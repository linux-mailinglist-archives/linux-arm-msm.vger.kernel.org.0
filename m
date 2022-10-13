Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70BE35FD65E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 10:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiJMIoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 04:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiJMIoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 04:44:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF7714BB79
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 01:44:11 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id 13so2402137ejn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1turIhhCY/CNq6vedzeKW5KsXI/Kc8E5BbkBmS9//dw=;
        b=W4aCnSv/pS6sxxmcDpVOLBiP3nJa+/KfvNOAeQNKJGBglZJN2eu9WG3GmO3KaZrfnT
         3d0BNOc6SDzFsMGcqWZxJDpHvhWOss+9Vw6wv/sokjE+5TgI71wcW+8Usml460WG5aRk
         9/w0FI8nsS4UIET/gHIO/QLb3xP/qLk65Yf+yChupUoVPlYwal+MUcBlhLlzRm66Rmj+
         PU19fwARVl9hYcNrQj48Gf38HXVk55g2NrpRJ1jZPT3+RITN629FpNKAusBtspBkQI+6
         6SmeTpe2y4On5r+0xwHWsCOrZ3OgRbUXmHALGB4P67K19COng0K63b9EvqwdORPok8f2
         7mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1turIhhCY/CNq6vedzeKW5KsXI/Kc8E5BbkBmS9//dw=;
        b=j0nI+awQI8S7hFfYTjY9QArh7aKZk2EkknEeqfWc//YKkbN8cgHtuL+tXsMhR9xTHk
         18Eex4K3+QNvUkYCqcfS6Ubx3cmlc2hyO2S0ZT4+f471hNszByznap9p/NErmE6W4G8J
         Y+8KCn1HPUohdxNPjHGUd9iz17vmRCAUU2gLooJ1IaSYeuWCYa/dqVzJw2qG+8J2Dhli
         rpp1umMzAJO0fWKzw6NATMqgxB0N1xyjOnzNx9gPMCqZaMAKIGAR0Sg9rHqd23wC3K0f
         cOieXhlDoFEuE8wf9ZhJu9JvSC2ud4Dp5CK3lSMXbtmsbKT/mdqiTxlCHSalki63RASV
         ImAw==
X-Gm-Message-State: ACrzQf30h1q+yHf6Cj3X5EgYFX+VQegHZvdHvwPcroHZfsK8R/HoPJUy
        u8PnDwEOIRJgByg8sDTbdmmlpywVzyGEeQT4awWGHw==
X-Google-Smtp-Source: AMsMyM7wNqIO+EB2D/0v+xopEqUBPYinzoMy1XCYOu8eZX0GDYt8CcigXnBWY7cmGmj8pgyuwPwQq+sHevEYcnC4UP8=
X-Received: by 2002:a17:907:5c2:b0:77e:def7:65d8 with SMTP id
 wg2-20020a17090705c200b0077edef765d8mr25999403ejb.487.1665650650112; Thu, 13
 Oct 2022 01:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221007132009.1886-1-quic_mmitkov@quicinc.com> <20221007132009.1886-5-quic_mmitkov@quicinc.com>
In-Reply-To: <20221007132009.1886-5-quic_mmitkov@quicinc.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 13 Oct 2022 10:43:59 +0200
Message-ID: <CAG3jFyurUzHruDxCt33A+YPyqjhgk6u1tctbL+97GuTmZOyaqw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: camss: sm8250: Pipeline starting and
 stopping for multiple virtual channels
To:     quic_mmitkov@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org, cgera@qti.qualcomm.com,
        gchinnab@quicinc.com, ayasan@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 7 Oct 2022 at 15:20, <quic_mmitkov@quicinc.com> wrote:
>
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>
> Use the multistream series function video_device_pipeline_alloc_start
> to allows multiple clients of the same pipeline.
>
> If any of the entities in the pipeline doesn't return success at stop
> (e.g. if a VFE line remains running), the full pipeline won't be stopped.
> This allows for stopping and starting streams at any point without
> disrupting the other running streams.
>
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 21 ++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 81fb3a5bc1d5..b042faf3dcda 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -353,6 +353,7 @@ static int video_get_subdev_format(struct camss_video *video,
>
>         fmt.pad = pad;
>         fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +       fmt.stream = 0;
>
>         ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>         if (ret)
> @@ -493,9 +494,11 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>         struct v4l2_subdev *subdev;
>         int ret;
>
> -       ret = video_device_pipeline_start(vdev, &video->pipe);
> -       if (ret < 0)
> +       ret = video_device_pipeline_alloc_start(vdev);
> +       if (ret < 0) {
> +               dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
>                 return ret;
> +       }
>
>         ret = video_check_format(video);
>         if (ret < 0)
> @@ -536,6 +539,7 @@ static void video_stop_streaming(struct vb2_queue *q)
>         struct media_entity *entity;
>         struct media_pad *pad;
>         struct v4l2_subdev *subdev;
> +       int ret;
>
>         entity = &vdev->entity;
>         while (1) {
> @@ -550,7 +554,18 @@ static void video_stop_streaming(struct vb2_queue *q)
>                 entity = pad->entity;
>                 subdev = media_entity_to_v4l2_subdev(entity);
>
> -               v4l2_subdev_call(subdev, video, s_stream, 0);
> +               ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> +
> +               if (ret == -EBUSY) {
> +                       /* Don't stop if other instances of the pipeline are still running */
> +                       dev_dbg(video->camss->dev, "Video pipeline still used, don't stop streaming.\n");
> +                       return;
> +               }
> +
> +               if (ret) {
> +                       dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> +                       return;
> +               }
>         }
>
>         video_device_pipeline_stop(vdev);
> --
> 2.37.3
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
