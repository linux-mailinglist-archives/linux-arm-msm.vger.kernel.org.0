Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B6F1805F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 19:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgCJSLA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 14:11:00 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36611 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgCJSLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 14:11:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id g12so5758576plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=zsKib0GqynNKua7iAWBmqWACz2JHoCf4kZ0aZVNqsbQ=;
        b=HLZpkhv24sgfXCUG4fX3MIo+Au43vnAfit8xW0HNvvMmiJukq0nlQHasooY+XayfsH
         bPDPnsiOCYxI3bQG7B0B/K/8wZgxUxSAH4dukVWksxBstHWMBiG0AFIKs5cR34NvIry0
         7XpgDvrSHWGOiZ1HYqWiFG8XWhw20Xr6INzc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=zsKib0GqynNKua7iAWBmqWACz2JHoCf4kZ0aZVNqsbQ=;
        b=BiYKhitfzEbciMAdQNihwwsig7PHNFBwoNcYmXsXx4whJfN23SvO+lFZWvXjK/ZsHn
         G5lA01kJiYJtLyM/EXKo0Euxxomgg3bcQYKNNVH58OGWk+9G0pEAib0BZOoD6SSF4L/w
         M8FuvsZPaNYGPAK2HpBtkaXgfRIk6wQ4tX1/ZdWdBNkUMdBxlRyuHw5t2UD45+Rc7Uw3
         iebDnyMyo2O6b7Q0Ia2kQ76GuF+A9HGA6IZHxgDxPfaa8Sr//QMQXvyfeQykd2cazm/h
         YO5bM7ZJvfNsBJwnnJgUdfsS9o72xQcmHBfAmLC6rxb/dz8am6JLsoI3r+pjoSmqLimn
         RTrA==
X-Gm-Message-State: ANhLgQ1VPyhsoo0JTzlp+dQ9eg6OgOw/fqYMZU3SHoGO2KdFWbdj5fRH
        dXNwyCHi+VO7PuNZ1Iiz2Qy7K11pyOw=
X-Google-Smtp-Source: ADFU+vvi/bGVsNtmguU66YqisKjD03wxFAZstCH06FyZW30xgi/xqHri6gRo4LARgAX/p5XdWG7+gQ==
X-Received: by 2002:a17:902:ab8f:: with SMTP id f15mr22089420plr.280.1583863857702;
        Tue, 10 Mar 2020 11:10:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e2sm14277262pgv.81.2020.03.10.11.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:10:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-4-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-4-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: qcom: Update PIL relocation info on load
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:10:56 -0700
Message-ID: <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:36)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qco=
m_q6v5_adsp.c
> index e953886b2eb7..d5cdff942535 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -164,10 +166,18 @@ static int qcom_adsp_shutdown(struct qcom_adsp *ads=
p)
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>         struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
> +       int ret;
> +
> +       ret =3D qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> +                                   adsp->mem_region, adsp->mem_phys,
> +                                   adsp->mem_size, &adsp->mem_reloc);
> +       if (ret)
> +               return ret;
> =20
> -       return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> -                            adsp->mem_region, adsp->mem_phys, adsp->mem_=
size,
> -                            &adsp->mem_reloc);
> +       /* Failures only affect post mortem debugging, so ignore return v=
alue */
> +       qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_s=
ize);

If the return value was void then the comment wouldn't be necessary and
it would be self documenting as such. Can we do that?
