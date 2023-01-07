Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC499660F5D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 15:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbjAGOL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 09:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjAGOLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 09:11:55 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E133C717
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 06:11:51 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id c124so4606411ybb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LvDFrCDqXrDdNZrnNjxL8kkjxccK3YMI3z/Q6Pw1gY=;
        b=pVJ3XW1isQV0BdXebNNNiXrBOtNFPXLLsav2dPlKzieH7sqtfGkSwslQ99bL9cMjw4
         ig1G3VQIU54/Vr4Zg9GKlNgVH4rQutIrWlTdiGuhlBqy9f18GEdxrk1EJeoSXakoVPBd
         frzm9bctQ1qYxKkZy2SLmkKy7SwuTZzNzpvRm6GlL3FzQ1XkeRHF1gf/AuF9pBV4ZGpw
         DLGzxS9J+qL9VtOkutNl4ZqaRCKXx8hMPJp6IbIX4+NLOZlIXb0edslmpmSNWOPvdckw
         V2QX7O6qhDf0y7Al/zfS0OrFuKOOYZ3IwfiMJaFNdaLMnzPfLUNRRAbJ16RXN4U7TjQZ
         YAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LvDFrCDqXrDdNZrnNjxL8kkjxccK3YMI3z/Q6Pw1gY=;
        b=ruop85FAfptrTpOioIrfJoNGThnv/4U9D9QDzG4GtKKxl8bYfzktrIAz+qtQSYjrmt
         Q22TPKrhxljLhypG9wFDTYZIJ2NSB0475110A6SogVO09+2G1a+4efhkJZqVcb4QQf0p
         xkvFUmHQBRefdkBQPXslGwTeV78uuEep4cbdpU0HSF4aFw7gKLCPaC6lXlAZPxDM7Cm8
         njd365WlsketP008muK2beafDrFwGx72chfqMnNc+Ybyd2ZCK3cYbEoJmRRQKmznn4sk
         k3JdSKuDMe2c1w9qcfpHAJfScsGwen5mtd9VkYdtcDTDGGweeVfA0M4UOhFwljOjd8ya
         MO1A==
X-Gm-Message-State: AFqh2koJF9YxPKJktD7AQj/xuqtvqyCButZ7A6kV2lrgqm1KHjAbOnZc
        iayw7gKLS8fR5k9fiCUSjEunoMPYfLUlxWiXVkEXtg==
X-Google-Smtp-Source: AMrXdXsvNPVQ8osWNCSBDbgr0/CRLqZ02x0UJg56e+eC7no6psBYuHFJSL86LGzwVzsU3fP5Wb6V+NUpKBpVgTijmt4=
X-Received: by 2002:a25:c404:0:b0:757:591e:cee3 with SMTP id
 u4-20020a25c404000000b00757591ecee3mr6481129ybf.15.1673100711080; Sat, 07 Jan
 2023 06:11:51 -0800 (PST)
MIME-Version: 1.0
References: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
 <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com> <17e2d99d-31e5-b29a-e729-4f4d70b2efbc@linaro.org>
In-Reply-To: <17e2d99d-31e5-b29a-e729-4f4d70b2efbc@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 7 Jan 2023 16:11:39 +0200
Message-ID: <CAA8EJprcVT=vyEhU0Nbtr4Wu1YxcGs+NLNxtpTaFtaJSTqvgYw@mail.gmail.com>
Subject: Re: Annoying message on the console for the db845c board
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Jan 2023 at 22:08, Daniel Lezcano <daniel.lezcano@linaro.org> wro=
te:
>
> On 06/01/2023 19:14, Dmitry Baryshkov wrote:
> > On Fri, 6 Jan 2023 at 18:37, Daniel Lezcano <daniel.lezcano@linaro.org>=
 wrote:
> >>
> >>
> >> Hi all,
> >>
> >> Does anyone have an idea on how to fix these timeout messages ? They a=
re
> >> displayed again and again every 5 seconds and that saturates the
> >> filesystem after awhile.
> >
> > Could you please check that you have CONFIG_QCOM_RMTFS_MEM enabled and
> > the rmtfs daemon running?
> > I think that's the usual cause of such messages.
>
> Yes, I have the option and the daemon running:
>
> zcat /proc/config.gz | grep CONFIG_QCOM_RMTFS_MEM
> CONFIG_QCOM_RMTFS_MEM=3Dy
>
> ps -ef | grep rmtfs
> root      9888     1  2 20:07 ?        00:00:00 /usr/bin/rmtfs -r -P -s

I don't seem to be able to reproduce it here. Could you please share
your kernel commit, .config and md5sums of
/lib/firmware/qcom/sdm845/m*

Thank you.

>
>
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>


--=20
With best wishes
Dmitry
