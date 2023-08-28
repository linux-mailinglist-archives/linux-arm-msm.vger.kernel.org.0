Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2219F78A957
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 11:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjH1JxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 05:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjH1Jwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 05:52:43 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FC5C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 02:52:41 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7485d37283so2912053276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693216360; x=1693821160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4iv/JVooTdRcGn4VXnFzieGpl8nHeZBo/P865iiXNfE=;
        b=KnpkMXApvRWuvHJiqzWW9Vj3gJUs9u0ELfyOpwOxh+0R3fpOC5UACTCVqeRB/C4slC
         RSGd2yzZp2/p9mDcyPp5lLW3V+HS/cxHCSn1heUYFox5MSJmtwmVe7BTgtg+56BEde5L
         JYogENsE+cZd3CCL49s0psjT6w0Vcrmv1aHg4n5EdrIH9XrB4K7jOzTr0A26kvB7dmGI
         dVGax5XV/qeCZcPvUlLaoU4GbVUwnWTub91Li88n5ugu7Cji13HVhiuI0C9wAD/GgswI
         F2N0B+i5ggh0BVMZAJX/8o/ACN4T8MBvaXmdKTYCE1jF51x0+iLf47nKsKRQ0ZLlpYTK
         Zvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693216360; x=1693821160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iv/JVooTdRcGn4VXnFzieGpl8nHeZBo/P865iiXNfE=;
        b=SZXNtKyIo7qkD39+WBCLUTsCmJQv6XxYM5cX8O+dlwFPeKsZY/KmfiQIe+/Sr/No4L
         Ai8NLJ41ZzYppjf9hcEOc49KkFiErLphLTg2x/gLAgirruiG7uQofpttN2QluZU9kCWO
         4B9lhSNEWE8xEn/zzVTbb6kl81hwwE94Z9iQfAwe/CkhPiWaDPWfQEeZDHGC9wald2jb
         gowvrY40cKxxMwNfbQY9/s1Knvfr1totAOduZSiTzCWevhN/93V9yq5kaPT80feOGZ9P
         wG1dPogwC0jC9ShCNHYQCFRkJ4wJyLzJG5xUqVoI0hxQBkIOYO3Csh1YgEIodAH/s2O0
         8/Zg==
X-Gm-Message-State: AOJu0YyjRsVVdiskeywsyPHGZzdZDSE0il9DRjrP6fcYm4i8a1oYf2Nu
        hGgmHB4kmzk1VB6IXWlOMZiE2z7ckrkTREfjFc4juw==
X-Google-Smtp-Source: AGHT+IFX+udoOeg5/6HAqdhCbZhWEP274z/f9AovSZs427dI6MIQVKDmeIBkpl86fS5i5YExKQoFSo/WKisUqelRNww=
X-Received: by 2002:a25:244e:0:b0:cf2:a664:688e with SMTP id
 k75-20020a25244e000000b00cf2a664688emr25254296ybk.40.1693216360604; Mon, 28
 Aug 2023 02:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230828-qcom-tcpc-v3-1-e95b7afa34d9@quicinc.com> <9a69b3d5-66bd-4085-8b36-2972b06e0a0a@linaro.org>
In-Reply-To: <9a69b3d5-66bd-4085-8b36-2972b06e0a0a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 12:52:29 +0300
Message-ID: <CAA8EJpoputqEhnbonWaHBbLVc-k-FFV6+nUY_2WszhsribDNGA@mail.gmail.com>
Subject: Re: [PATCH v3] usb: typec: qcom: check regulator enable status before
 disabling it
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     quic_huliu@quicinc.com,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Aug 2023 at 12:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 28.08.2023 07:16, Hui Liu via B4 Relay wrote:
> > From: Hui Liu <quic_huliu@quicinc.com>
> >
> > Check regulator enable status before disabling it to avoid
> > unbalanced regulator disable warnings.
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> > ---
> > Changes in v3:
> > - Take Bryan's proposal to remove enable/disable operation in pdphy
> > enable and pdphy disable function, then enable regulator in pdphy start
> > function and disable it in pdphy stop function.
> The commit message makes no sense now, it should have been updated
> to reflect what you're doing after the logic had changed.

Not to mention that Reviewed-by and Acked-by tags make little sense
now, as patch contents were heavily modified.

-- 
With best wishes
Dmitry
