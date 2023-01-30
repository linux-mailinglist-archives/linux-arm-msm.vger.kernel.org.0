Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0064680B31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 11:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236046AbjA3Kqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 05:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236024AbjA3Kqn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 05:46:43 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C88D31E20
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 02:46:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q10so10618506wrm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 02:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mI/eqdmLtpTRm3CiiBv1CsF9GzqTZ8zAMSJPlSWHw6A=;
        b=zblJ4ooAIMWAOG2z8HOQvhJ1wGk0wAogbJRSJ9CEea3zhJU64pTcw0DJFKKOkVL9BT
         Fx97l6Aa/3PswNP4hYxh4A9qYE1GQnuAAGHLuAgYl09vtcQPCnCQKdsxltRAPjyuNE/4
         Zk40Sb5FwwNbjxw7vB8FfFMzFKFV+xV5pQdfKTxrZLk2HyJXWOu+LASd1Lnf0X34dXHR
         vw+TcA1t65dhotD9YIPSe5ubIBr47Sb26nZMpJjssFPNXA+PLDX4wKkIIG9QjEOyGMBv
         FPHhXem44uZCvi0HR1O9GEvs6W4bLIiUd9RcJ8UIN0BsFAx90kTaF0W83UigGzWpFREV
         rWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI/eqdmLtpTRm3CiiBv1CsF9GzqTZ8zAMSJPlSWHw6A=;
        b=Z4sIXiOApNmNeaVi3jwkHBT2QWak2OJLuCLrhWz9KeS6L0ciSx7eWDIEZ9bk+kIcJL
         /MiNqI3zNxWdT0GdiIVd6BAHzTQKh54Gyobmh4sk0ng3lStgjJJEDlHkDadpP5a/a8pr
         R/bzUw2JUKYgLGJPzCIQa+k66P/53QJwFNjTPzQtghrogjW6A4nvA9ZBYF3fQQJLQTLj
         D+de7aot9OTqo7Yf+BjmHGEa1yKSn+P2vPxabEBeqCOIbGAkjtxNRsioPQCyh4k/e4FA
         TYldXPTGTeVdYH5lfBa/4IZzcaHIlIFGJc5Rn4U4FMwIxw5BlZFVDRTK8z/MbZLv96LK
         D1og==
X-Gm-Message-State: AFqh2krL8ehgxOhDEsczr/aV3a/8ZFda6qypsRJ3Gi2NdTqMKT1/cVly
        yYaxACdH4mvaPPmExVBQ1pgAeg==
X-Google-Smtp-Source: AMrXdXugqBoUB2xDTDq/4ERLbixH7Siy6ILXLzBtUGoLH5aRm9+ClxjifdpY5DPp384oDXQlOvdTuw==
X-Received: by 2002:adf:f0c1:0:b0:2bc:67d:c018 with SMTP id x1-20020adff0c1000000b002bc067dc018mr42851833wro.48.1675075598090;
        Mon, 30 Jan 2023 02:46:38 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q3-20020adff503000000b002bfae1398bbsm11707320wro.42.2023.01.30.02.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:46:37 -0800 (PST)
Date:   Mon, 30 Jan 2023 12:46:36 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Fix regulators node names
Message-ID: <Y9egDJtDrNVpyfsm@linaro.org>
References: <20230127130106.1136226-1-abel.vesa@linaro.org>
 <7428b6d9-1653-4a4a-8e12-bc7ededef8a0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7428b6d9-1653-4a4a-8e12-bc7ededef8a0@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-01-27 16:33:31, Krzysztof Kozlowski wrote:
> On 27/01/2023 14:01, Abel Vesa wrote:
> > Bindings check fails as the schema expects the regulator node names to
> > have the suffix -regulators, so use the name and the id of the pmic to
> > compile the node name instead.
> > 
> > Fixes: 71342fb91eae ("arm64: dts: qcom: Add base SM8550 MTP dts")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> No, the original code is what we requested.
> 
> You are making it now incorrect (although bindings need to catch up).
> 
> See:
> https://lore.kernel.org/linux-arm-msm/9e805614-8d21-4f8b-1b31-790686c95aa5@linaro.org/T/#t

OK, fair point. Ignore this patch then.

> 
> Best regards,
> Krzysztof
> 
