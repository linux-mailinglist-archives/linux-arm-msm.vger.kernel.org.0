Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA3A689E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 16:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjBCPfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 10:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjBCPfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 10:35:11 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D716DB2E
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 07:35:08 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 129so6738122ybb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 07:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SgtdwyB6zGEZlht7tWh9KxiXeSiDWMDUiGZf9n9XB78=;
        b=DemdBuRm+gmRja4cU8gNUWkFw78YcvN0Z4mP4ZA+kQ912OvZPn9iFFJRN2QzA5qJze
         xd1hTObobSQPSDTiqpDmTXM4Rmn2NkmJm5Xb/AN+V+4orpVTxbLxYszgHOeAFJxXPQua
         rQEOrJqS/nLcFUzKmzz5VV07NhDSpTYtRveJrK1VvytC9LrMzx/VTu9J73zhRKOnKekh
         87UFGeeCRkXeObDpFLQHE1K+M8K9KePkNjLnfEFC/XigxS53SKbOJuThqcBr9K+46+N/
         6hviDu1ZiQB32RqN3htYOis/IaBaPIl8yKpeeQOro32TxLoPR1/9zKTy5XFYF5GhhoR1
         RChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgtdwyB6zGEZlht7tWh9KxiXeSiDWMDUiGZf9n9XB78=;
        b=azlVzsdoqUby+0PZWXiBWbScUG8O1TBGcCErnAoubmCtWy7yN2Wj/k2YmTBx+jefKz
         qrHiBqfTfOvxYXOU7hfFZ5TILcB1aWpui9oyDNDgvG2x8ZREwxirxA4y3qvethpTozsS
         N5h3MR9brezCY/DMgYid1YJ1kIhocskydlAIwUCe6Zracas2yCh80vtPmOuLs+pW0AsK
         4o2daAaXjo5ha0uLpczF/A6VblVp3IJOwW5NSpZJaEkv6YLHbu/oeDNDw9qlOjSeB2Nl
         6VMKKmX6maVqTnzyYD3iY62107zQOGypr4RBQVEMKS/s3F89wR1Oz3oyJa9G9ZnVv3hU
         3KAQ==
X-Gm-Message-State: AO0yUKXyAseIOmozv2FFYiIjP5X58kYPB0JNv5qAhHoJ3NjoB3Ib8pUy
        D4fnL2zh4xBflfv+a7KiprWJpUQdChwWjHCs+OVhPw==
X-Google-Smtp-Source: AK7set/Za6HY+Tt76yrl2IztiqJnit9wiTXUo80f4wOcCUEUtjCDg4mj0GS6ohG2AnCrpbDqCnmJgPzmYmUdspw0sgA=
X-Received: by 2002:a25:ae66:0:b0:80b:c940:caa0 with SMTP id
 g38-20020a25ae66000000b0080bc940caa0mr1391956ybe.15.1675438507870; Fri, 03
 Feb 2023 07:35:07 -0800 (PST)
MIME-Version: 1.0
References: <1675419435-30726-1-git-send-email-quic_mojha@quicinc.com>
 <1bca9111-1ad4-ad1d-b30a-9d2fbddf9e3a@linaro.org> <3ca6d220-447e-0578-b525-3fb470be7edf@quicinc.com>
In-Reply-To: <3ca6d220-447e-0578-b525-3fb470be7edf@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 3 Feb 2023 17:34:56 +0200
Message-ID: <CAA8EJpoVByj28GFNUKydONsS8UZqO-5eSqSsvZHcEHaJbW+Gig@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: qcom_scm: modify qcom_scm_set_download_mode()
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 3 Feb 2023 at 16:53, Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>
>
>
> On 2/3/2023 8:21 PM, Srinivas Kandagatla wrote:
> >
> >
> > On 03/02/2023 10:17, Mukesh Ojha wrote:
> >> Modify qcom_scm_set_download_mode() such that it can support
> >> multiple modes. There is no functional change with this change.
> >>
> >> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> >> ---
> >> Changes in v2:
> >>    - Stop changing legacy scm id for dload mode.
> >>
> >>   drivers/firmware/qcom_scm.c | 15 +++++++--------
> >>   include/linux/qcom_scm.h    |  5 +++++
> >>   2 files changed, 12 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> >> index cdbfe54..6245b97 100644
> >> --- a/drivers/firmware/qcom_scm.c
> >> +++ b/drivers/firmware/qcom_scm.c
> >> @@ -400,7 +400,7 @@ int qcom_scm_set_remote_state(u32 state, u32 id)
> >>   }
> >>   EXPORT_SYMBOL(qcom_scm_set_remote_state);
> >> -static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
> >> +static int __qcom_scm_set_dload_mode(struct device *dev, enum
> >> qcom_download_mode mode)
> >>   {
> >>       struct qcom_scm_desc desc = {
> >>           .svc = QCOM_SCM_SVC_BOOT,
> >> @@ -410,12 +410,12 @@ static int __qcom_scm_set_dload_mode(struct
> >> device *dev, bool enable)
> >>           .owner = ARM_SMCCC_OWNER_SIP,
> >>       };
> >> -    desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
> >> +    desc.args[1] = mode ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
> >
> > I think this line should be:
> >
> >      desc.args[1] = mode;
> >
>
> Should be fine..for backward compatibility as we want to avoid what is
> passed to trust zone without check and since this is legacy code, i
> would like to avoid.

I'd second Srini here. Please remove the ternary operator and pass
mode directly. If you'd like to limit the 'mode' argument, do so
directly (and return an error if the mode is not supported).

However there still exists a bigger problem in my opinion. You are
changing an API. Please provide a user for this API. 'The user will be
provided separately/later/whatever' is usually not enough.



-- 
With best wishes
Dmitry
