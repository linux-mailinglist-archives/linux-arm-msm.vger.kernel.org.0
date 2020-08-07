Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E59C23F437
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 23:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgHGV2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 17:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgHGV2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 17:28:37 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4B5C061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2020 14:28:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i6so2232476edy.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 14:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdNucF0koSppcU0GmU9pSl6fM9HVcxNoH43SdcmhMo4=;
        b=WRZkwZaLt55Y2h276GQIL0EwY8JZgUt+nO04eGdR+5coh476ORbcDKISCIzllLYqgr
         7pXl9SAv+kRl9cT8mG/IIezkcnD/mOK8BF31NyqErmOkrd2TjVOko70lECZRwmQMlz1Y
         b8cFcuQo1C617FdhnPXZESL8OsSbpCtiVGg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdNucF0koSppcU0GmU9pSl6fM9HVcxNoH43SdcmhMo4=;
        b=Lce2hPHeqo5rZvySoREcl0nF6GTXDC1BfIumGSGWixT2RsjqQ3W08MGvZhacAyK2x+
         f+LNDxg7kzHDP9p4vkQGi/YQlAmTYnKVNkMACbdH9wLWs9o4LL2geSlXSWjuPAUMytDh
         NMXZGPJoZcWkPGtNmAV+62Xs+mWpFjTMqjH8qXqGi0hLMLfj1QzoVrDUufbXlpABhfhB
         FHthM/rXZFaUqUrdS8rFsVlecMBy/Oh5h6wZTdiR5BHjK60wZgLM+wWlbNp3kfRaTvGV
         b+ZMlJChH8JrLBCwkpvjwSVL//rcSfx1ep7BLI8E7wppOJrqrfLa0w/ik3161mjvPoTx
         08+Q==
X-Gm-Message-State: AOAM5327sDNE5peUDjD2J/jxBgtOvaXPWflE3SKkBNhqHaJI8IMskNRQ
        28p9n76sANEWJUyKX5jIUFpHqSB8XoQ=
X-Google-Smtp-Source: ABdhPJzpGTl902FGHbNYQ7qs3SOF6bDzDGQR7VeCStV7ggcCzRf4SfTraX/ujfFahvn/5sdIf1jvXA==
X-Received: by 2002:a05:6402:304b:: with SMTP id bu11mr10450224edb.106.1596835715932;
        Fri, 07 Aug 2020 14:28:35 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id by3sm6633716ejb.9.2020.08.07.14.28.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 14:28:35 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id c15so2856983wrs.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2020 14:28:35 -0700 (PDT)
X-Received: by 2002:adf:fdce:: with SMTP id i14mr13480967wrs.273.1596835714967;
 Fri, 07 Aug 2020 14:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org> <20200730114632.6717-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20200730114632.6717-2-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 7 Aug 2020 14:28:22 -0700
X-Gmail-Original-Message-ID: <CAMfZQbx36rZc=9p8a=mGSqwvtfQ-KRO+5=8yEuo-NA+eeoBBNg@mail.gmail.com>
Message-ID: <CAMfZQbx36rZc=9p8a=mGSqwvtfQ-KRO+5=8yEuo-NA+eeoBBNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] venus: parser: Prepare parser for multiple invocations
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 30, 2020 at 4:47 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Presently the hfi_parser has been called only once during driver
> probe. To prepare the parser function to be called multiple times
> from recovery we need to initialize few variables which are used
> during parsing time.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 7f515a4b9bd1..363ee2a65453 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -239,6 +239,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>
>         parser_init(inst, &codecs, &domain);
>
> +       core->codecs_count = 0;
> +       memset(core->caps, 0, sizeof(core->caps));
> +
>         while (words_count) {
>                 data = word + 1;
>
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
