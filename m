Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFFC4F6C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 23:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbiDFVN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 17:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236335AbiDFVNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 17:13:00 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9801BD9BA
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 12:57:42 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id x5so3156906qvk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KUZUtAp0dNwDr70/3lwG/QXaTgnWDHbJ/WL9ZfSGWRk=;
        b=QbEWGQvz8QdfpaSSWzt2ahUaFClQusByq1H7eAXIihyrMv69CUSc0Obwe9mDIEr+oq
         NVWT1dMj8rWahYjX3IMWk05Ru6cZtKqAjPdMbDTslI8oP6q38LzSn9KvbFLG82O0eNLk
         nz3dUf6pE/rhl9TEzuuT5wZJiYKG1jTyA8zUQMMPF8d5hExV6C24zDjKWnELb7k4bqMo
         DQGpCIhtv25SC5mskEG2mecROEJIZo4OJZIlx09IKRBVlYVeXc0BT4p4NA8jU/npMJxs
         Kd9v1vP26RIrHpzdWT89Mj8lmCH62Y+loDYx6ml3LCJFpfxLaYcMX2ww4Z5yBdrkl+mE
         Dxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KUZUtAp0dNwDr70/3lwG/QXaTgnWDHbJ/WL9ZfSGWRk=;
        b=g6MtlraIDJMeSwjBL3o5Whg4S/znZ4ga3rtwhzpZ+mGCVxKcnlUUoLRO0ONUnCcCP/
         7RT63akpPkIJinT/pVztGRrrKJH7Vb/3rZ/Z0pDI4WnRFxE2L2piQirop7nESkunS8Jn
         6QnpHseKccRIDZYjm9v2dwz3t65q1XQrOYO5IlYaI8PID8a14qvGvHiF4xeZm1UVk5U8
         K51dIJY22vnlj3fXxoZ5oZ4gxb4eU6dPR/dLUSYdGsmLivEQSei5qQLjxCjIe25k7A4S
         Oh1vAcIzAwn1xR8l1fOJAzKzRAhhz2r07ZYxhwwOOTKAdVtgE72qWv6yZLpRB9NvDo+d
         Z45Q==
X-Gm-Message-State: AOAM530mFBtIDSnjc8KXRSK0WvcHnEUo+FBgJq08cVFwGpC6qmMd7b9I
        QRvzuYWY+EHWCi++ejf9QCQ1PxZd4q6xbGlo4gGUtg==
X-Google-Smtp-Source: ABdhPJwW5Y59IRMz9jgyY9HfpNawpulXkvT7vk6Ukk08ydzcarQ2XkfE97k98h2L3Ubtj03m63GiXZksPtvgTMY9kOk=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr8928927qvk.119.1649275061386; Wed, 06 Apr
 2022 12:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org> <20220406154028.EC897C385A3@smtp.kernel.org>
In-Reply-To: <20220406154028.EC897C385A3@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Apr 2022 22:57:30 +0300
Message-ID: <CAA8EJpod2cNOYr3g+DmdWo_2Ujv7-pW39fBKqcpCPvtVgP5-NQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node
 for tsens
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Apr 2022 at 18:40, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-05 17:26:44)
> > Currently gcc-msm8960 driver manually creates tsens device. Instantiate
> > the device using DT node instead. This follow the IPQ8064 device tree
> > schema.
>
> Why can't the schema be changed?

But these commits change the schema. They make apq8064 follow more
logical scheme of ipq8064.


-- 
With best wishes
Dmitry
