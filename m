Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F527D7251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 19:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjJYRdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 13:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjJYRdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 13:33:09 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C2A181
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 10:33:07 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-579de633419so57971647b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698255186; x=1698859986; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XvBhZBmkny2j95CjstPK5yQ0xRcuhGsDbkOImnFtxnI=;
        b=REsHipNJhxDpbqsKqK0/8UUA/k9MQLyoMEjWBZUsMgP4SioicgBhkMb744+z6EPlI7
         iNWrRFhakjskfPtGpKrmXK8UvFO+Xg6c7cyc9Db3y6B1jzSUMyQgP9aHIqoa3jyJr8xV
         CGRMIUu+nsBINcescIxn7hw0M83Kz991NBf12xh6YjdRBQAmuxFGg90YBhQmIT5yKZtz
         9XNqjz4Jzx7P2B+7CkRvms60wnUc9XotdLrIBmFL1M3zoQbWJk3lvVjgyBifj3Deglw6
         bFmGpgITPeCXmvLfrf3Y5i7WTtZ1J8moFL9oxsEVluilnmZHyRHnXbLn7a1/B75YiDmS
         GGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698255186; x=1698859986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvBhZBmkny2j95CjstPK5yQ0xRcuhGsDbkOImnFtxnI=;
        b=QjmIertHwFYuzKCCbs94k4ObCQN+eniabpkSOWgRkYinuezD/lElAfFrbPRJKSDsal
         GXeW88AqzWzLAljOZXCk35jNsZucULVkL+OQlg17m9FT4dr6+Zg3wX6SoiKkDYtT7glK
         /nO4MiF+9d8tQm2DPexs/LUJfYgjm4SElg74++xbqHib061dLQk/U1Om7gUv/H/M9C6d
         u9RER6BEWUCHvqDouAwpI5HOYZCzICCHbICWibBj45TkeCo397ceyX7B8vssk/XkccQq
         WN4c7K52JTUNwPWk8cHGk5wITVvkBwh0V5/R03/scDzW4BeFwz7t5kO/OKmSLjpIF4DD
         yknA==
X-Gm-Message-State: AOJu0YyheT/FVqkr/aLXRiMlMR5x3KBSWPsvL8ivAJj7V6xPi4W/K9Jt
        lta6+IplF4MHV9x3A09zvzQhijzsMZ+CXZpyD5MLyQ==
X-Google-Smtp-Source: AGHT+IE8BcBJeQtpMzL82hUdFUv1oZgIuxkummUuwntiC5NFdCUbZrOx510qgUYWkp+wlXZSk33+4m9GJfsMdsOpQog=
X-Received: by 2002:a0d:ddc7:0:b0:59b:bed9:9a3a with SMTP id
 g190-20020a0dddc7000000b0059bbed99a3amr16384399ywe.41.1698255186343; Wed, 25
 Oct 2023 10:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231025135943.13854-1-quic_sibis@quicinc.com> <20231025135943.13854-4-quic_sibis@quicinc.com>
In-Reply-To: <20231025135943.13854-4-quic_sibis@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 20:32:55 +0300
Message-ID: <CAA8EJppyoRfFat=hrRRqBDyHK9_y9VdyYm3AY+JAvotBx-RFzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add SC8380XP power domains
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org,
        ulf.hansson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 17:01, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> From: Abel Vesa <abel.vesa@linaro.org>
>
> Add the power domains exposed by RPMH in the Qualcomm SC8380XP platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

-- 
With best wishes
Dmitry
