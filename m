Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530F549EE3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 23:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242229AbiA0WoO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 17:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238808AbiA0WoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 17:44:13 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9B2C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 14:44:13 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q186so8833164oih.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 14:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qSVKg7QZolISP6CL5b8ywycxZ4eSO4ME5S7Xwxs213U=;
        b=lCcj/YjgaTpAlalRmpvtJQ/UCinvUZbRA9eUiHZhQD7E5jN4xLRKHLDlDIcMCnTRCu
         VGfKHHUcHcpwOTrk8eglOlSjaQhDiWgqp0SO+CizBk+xAeTcKf5e892ZE/dIRY76sHjZ
         C17pHcz6fmaFbkfIIu7hBgPWOgnL1lDwUjWE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qSVKg7QZolISP6CL5b8ywycxZ4eSO4ME5S7Xwxs213U=;
        b=B6MQKW3rqktvbGg4QJ5jgU61yxLCdbYPqfrGbCNoyYQq5CMN4/3ak8GKD4z9Qrx5iQ
         S3gHzhI17zMAxAxBLdKzjxCR2tr4X6pqt0qpJlrGasduIrbjyRsxAWeJmQ/lSn/6RGKC
         CdiO2F1Uo1MYm6bE449UtpPCDZe2/9qPro07glff4HviQgLnsEDr80mOHnncE6VGbGS7
         CdqmLQVvBs1mAfN6uVHTTr73IxGNdWU2xZaS1/MJxe3aCvNG4ASR8M9Xv2DbdngslnXq
         pAJz365LvIzm4vCa2l8FKFzP6ffpjKwV5Iad9QtN9H293jRI/iYkyPlDNJTCVPdfmB8j
         B1ZA==
X-Gm-Message-State: AOAM531PA9PXaJlR3NjnHMhlAxPpdBfUd7SnB+mBzptRIyaEf0iXHTN1
        bmP1gMhAoudjMW2s+XbvggLuLJAarDnK2B9I/M3Z997okYY=
X-Google-Smtp-Source: ABdhPJxeu4g7MfMP+1tgPBzH30aCdvexTG7BkQSmwQCJuBHQCEk/KNDciKzXewaSrUaJUSrJfMRHftNA2sOuP6IbKd4=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr8419513oib.40.1643323453189;
 Thu, 27 Jan 2022 14:44:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Jan 2022 14:44:12 -0800
MIME-Version: 1.0
In-Reply-To: <20220127210024.25597-4-quic_amelende@quicinc.com>
References: <20220127210024.25597-1-quic_amelende@quicinc.com> <20220127210024.25597-4-quic_amelende@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 27 Jan 2022 14:44:12 -0800
Message-ID: <CAE-0n53oQEs+GO8+SXf1Zp4RT3FNvFzpDT+jYJA4fub77w+utw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] input: misc: pm8941-pwrkey: add software key press
 debouncing support
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, collinsd@codeaurora.org,
        bjorn.andersson@linaro.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Anjelique Melendez (2022-01-27 13:00:27)
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index 7005aede4f81..bcdbe260b684 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
[...]
>
> +static int pm8941_pwrkey_sw_debounce_init(struct pm8941_pwrkey *pwrkey)
> +{
> +       unsigned int val, addr, mask;
> +       int error;
> +
> +       if (pwrkey->data->has_pon_pbs && !pwrkey->pon_pbs_baseaddr) {
> +               dev_err(pwrkey->dev, "PON_PBS address missing, can't read HW debounce time\n");
> +               return 0;
> +       }
> +
> +       if (pwrkey->pon_pbs_baseaddr)
> +               addr = pwrkey->pon_pbs_baseaddr + PON_DBC_CTL;
> +       else
> +               addr = pwrkey->baseaddr + PON_DBC_CTL;
> +       error = regmap_read(pwrkey->regmap, addr, &val);
> +       if (error)
> +               return error;
> +
> +       if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY)
> +               mask = 0xf;
> +       else
> +               mask = 0x7;
> +
> +       pwrkey->sw_debounce_time_us = 2 * USEC_PER_SEC /
> +                                               (1 << (mask - (val & mask)));

         pwrkey->sw_debounce_time_us = 2 * USEC_PER_SEC / (1 << (mask
- (val & mask)));

Nitpick: Put this one one line?

> +
> +       dev_dbg(pwrkey->dev, "SW debounce time = %u us\n",
> +               pwrkey->sw_debounce_time_us);
> +
> +       return 0;
> +}
> +
>  static int __maybe_unused pm8941_pwrkey_suspend(struct device *dev)
>  {
>         struct pm8941_pwrkey *pwrkey = dev_get_drvdata(dev);
