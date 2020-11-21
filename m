Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70472BBB6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 02:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgKUBPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 20:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbgKUBPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 20:15:08 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCCFC061A04
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 17:15:06 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id cf17so7803074edb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 17:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jgg+Y5ywzjlLOxHuvKCT73gpn9o8pAGSmfL0hmL9PgA=;
        b=Qk0NEn97BUPgBLgL7KdCNXn7Z7KA0yyu/f9vD+U9grPl9Mq+Jm62m/Be4wxdPOpqi4
         ia+nwGLowFG65tZhX2aK0BzxWiT23YVJNAIwn2xmGsDEKJqwhk3RurmKjH9JnexXzIz9
         SG2t1QqsG0xhLSiwNwKGsAhMpus2qIvks2LZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgg+Y5ywzjlLOxHuvKCT73gpn9o8pAGSmfL0hmL9PgA=;
        b=EutEeOmzglf0dOWzofBGCXsdBUYu+GW43h+BTBOiBchxn49Kch5PsIU7XAnB94Lvy0
         04WBZn7bWK1gza+/alJogC3CmMXUmR+HODvLw28cczm7nC8/eno+enkG7+kdCBnQqD/S
         99JbGqH3SKKzhdz0eggZHYAI0Vt3O18gWONTUaX/frVkJyU+ZjsVvbl+MeHqdPbxAa9G
         v2tocV6KPR59xxs3jpIC6hnGxNu00rk+PuUvBUsJrwwnERX9TRFyQ9AKuljWyswQf+eH
         JxwASbTapBzjycCWPMi5uJjd6chTDT/fRKRNBPKspVAwE1HEGlAcjQblWnoa3+yzhu+C
         eO5Q==
X-Gm-Message-State: AOAM530bwfpfIvjway6L0wa+/U1M+hSi9KvpAw42iQUt0sIwBYvXOehy
        niIVdb/JNi99gXm7QB0cIj5Ah6bP5g4iGQ==
X-Google-Smtp-Source: ABdhPJxKgN/fCEw/T5lMcMStFec6jdOMFuFUROEUrRisL8zzMpX6OTsjIrt+EncQjsXpO6dENxytFQ==
X-Received: by 2002:aa7:c499:: with SMTP id m25mr37118874edq.237.1605921304659;
        Fri, 20 Nov 2020 17:15:04 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id d2sm1725943ejr.31.2020.11.20.17.15.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 17:15:04 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id d12so12647153wrr.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 17:15:03 -0800 (PST)
X-Received: by 2002:a05:6000:1150:: with SMTP id d16mr18069305wrx.320.1605921303371;
 Fri, 20 Nov 2020 17:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org> <20201120001037.10032-3-stanimir.varbanov@linaro.org>
In-Reply-To: <20201120001037.10032-3-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 20 Nov 2020 17:14:50 -0800
X-Gmail-Original-Message-ID: <CAMfZQbwjRTuF7_joa9sL0HLTkFC70FqymPOmtxmETt38qey+NA@mail.gmail.com>
Message-ID: <CAMfZQbwjRTuF7_joa9sL0HLTkFC70FqymPOmtxmETt38qey+NA@mail.gmail.com>
Subject: Re: [PATCH 2/3] venus: Limit HFI sessions to the maximum supported
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 4:12 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Currently we rely on firmware to return error when we reach the maximum
> supported number of sessions. But this errors are happened at reqbuf
> time which is a bit later. The more reasonable way looks like is to
> return the error on driver open.
>
> To achieve that modify hfi_session_create to return error when we reach
> maximum count of sessions and thus refuse open.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/hfi.c       | 19 +++++++++++++++----
>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +++
>  3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index db0e6738281e..3a477fcdd3a8 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -96,6 +96,7 @@ struct venus_format {
>  #define MAX_CAP_ENTRIES                32
>  #define MAX_ALLOC_MODE_ENTRIES 16
>  #define MAX_CODEC_NUM          32
> +#define MAX_SESSIONS           16
>
>  struct raw_formats {
>         u32 buftype;
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index 638ed5cfe05e..8420be6d3991 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -175,6 +175,7 @@ static int wait_session_msg(struct venus_inst *inst)
>  int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
>  {
>         struct venus_core *core = inst->core;
> +       int ret;
>
>         if (!ops)
>                 return -EINVAL;
> @@ -183,12 +184,22 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
>         init_completion(&inst->done);
>         inst->ops = ops;
>
> -       mutex_lock(&core->lock);
> -       list_add_tail(&inst->list, &core->instances);
> -       atomic_inc(&core->insts_count);
> +       ret = mutex_lock_interruptible(&core->lock);
> +       if (ret)
> +               return ret;
> +
> +       ret = atomic_read(&core->insts_count);
> +       if (ret + 1 > core->max_sessions_supported) {
> +               ret = -EAGAIN;
> +       } else {
> +               atomic_inc(&core->insts_count);
> +               list_add_tail(&inst->list, &core->instances);
> +               ret = 0;
> +       }
> +
>         mutex_unlock(&core->lock);
>
> -       return 0;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(hfi_session_create);
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 363ee2a65453..52898633a8e6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -276,6 +276,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>                 words_count--;
>         }
>

My understanding of the hardware is that there is a max number of
macroblocks that can be worked on at a time.  That works out to
nominally 16 clips.  But large clips can take more resources.  Does
|max_sessions_supported| get updated with the amount that system can
use?  Or is it always a constant?

If it changes depending on system load, then couldn't
|core->max_sessions_supported| be 0 if all of the resources have been
used up?  If that is the case then the below check would appear to be
incorrect.

> +       if (!core->max_sessions_supported)
> +               core->max_sessions_supported = MAX_SESSIONS;
> +
>         parser_fini(inst, codecs, domain);
>
>         return HFI_ERR_NONE;
> --
> 2.17.1
>
