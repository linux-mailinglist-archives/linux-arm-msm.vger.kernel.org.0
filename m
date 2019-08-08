Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3494A85B79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 09:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731201AbfHHHV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 03:21:28 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44204 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHHHV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 03:21:28 -0400
Received: by mail-qk1-f196.google.com with SMTP id d79so67937282qke.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2019 00:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oIuRu9x7BA84LVZGVSmmDxEPe3MTxe7R9+5xyMTxusA=;
        b=ONE8YxtFpRzZEu9RvwpcU7Dh1j/4lT1e/vBPVWopR7NvjDMMHQY4T99c8BuAOUlRTc
         HEOPt88aZYXsfS85An9DCNmqnrD1Y5Qu27Bgz/yqo9UHjAM0D9VbbYnCBdr3VudNOUd5
         LAvrgb9fH6pKFzvdSG0LKIWddKNKN+BVM9pmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oIuRu9x7BA84LVZGVSmmDxEPe3MTxe7R9+5xyMTxusA=;
        b=WXnY1yNGwO/KWHd8+nW4KyqD9rUX+xeijKsPPRgcfXXZL35Ozhea5bgJAcmWSvD5iz
         Mpm/Clf3KbqV2dqa/u87qH1KW+4KDAYYy0Vb0NPXL7W9AQW4BCKkMPO7stT05Jn20w7T
         /WTu5vdM8PJzQQYyOVf63zROTL76YNNZ0k5v2SL94+w1RfnaFQ8Pw6B6dbrHg8jbgOVA
         LiOu88AlptCbw7b1Hp5qMWb7kT28Z6p5dS4gV2ySukNJCgFzxt/gRENtDXYwgiqwkaBE
         XxJMUK/PlmI4mwfsLD0sVHT4RjdlGBMS2mDJHCFHfjQvKPY9f8D7S222wUBpIaQQUZjI
         lcSA==
X-Gm-Message-State: APjAAAWj80VAue5Lnm6/WihKCX3jiQx9Ywz0tm6pqKD+LjMeg1WYbKEz
        X1VssZ9oSK6iIciLQebc7vr8Qh4qLtc=
X-Google-Smtp-Source: APXvYqysae4dg0uRMU4t6lVj9NK0/XQesRo/lZ1/7oXJR1UVNpCMVxoGdazDwWLwN68Fkx+07uQHUA==
X-Received: by 2002:a37:a16:: with SMTP id 22mr58217qkk.85.1565248886892;
        Thu, 08 Aug 2019 00:21:26 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id p1sm457877qkk.98.2019.08.08.00.21.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 00:21:26 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id d79so67937229qke.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2019 00:21:25 -0700 (PDT)
X-Received: by 2002:a37:9904:: with SMTP id b4mr11502899qke.159.1565248885032;
 Thu, 08 Aug 2019 00:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190808060737.3506-1-bgodavar@codeaurora.org> <56fe734d517399c6509f6e9c45f9b096@codeaurora.org>
In-Reply-To: <56fe734d517399c6509f6e9c45f9b096@codeaurora.org>
From:   Claire Chang <tientzu@chromium.org>
Date:   Thu, 8 Aug 2019 15:21:13 +0800
X-Gmail-Original-Message-ID: <CALiNf29bmSbjT4pmzGGG_WzmC6gaZS+vBeRQUiQuT85bm-iMsg@mail.gmail.com>
Message-ID: <CALiNf29bmSbjT4pmzGGG_WzmC6gaZS+vBeRQUiQuT85bm-iMsg@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btqca: Reset download type to default
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, c_hbandi@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: Claire Chang <tientzu@chromium.org>

Hi,

Please add the Fixes: tag and I will add my Reviewed-by: tag.

Thanks,
Claire

On Thu, Aug 8, 2019 at 2:21 PM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> +Claire
>
> On 2019-08-08 14:07, Balakrishna Godavarthi wrote:
> > This patch will reset the download flag to default value
> > before retrieving the download mode type.
> >
> > Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> > ---
> >  drivers/bluetooth/btqca.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > index 2221935fac7e..9fb247c10855 100644
> > --- a/drivers/bluetooth/btqca.c
> > +++ b/drivers/bluetooth/btqca.c
> > @@ -140,6 +140,7 @@ static void qca_tlv_check_data(struct rome_config
> > *config,
> >       BT_DBG("Length\t\t : %d bytes", length);
> >
> >       config->dnld_mode = ROME_SKIP_EVT_NONE;
> > +     config->dnld_type = ROME_SKIP_EVT_NONE;
> >
> >       switch (config->type) {
> >       case TLV_TYPE_PATCH:
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project
