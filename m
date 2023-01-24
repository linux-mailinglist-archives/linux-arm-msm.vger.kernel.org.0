Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53CB67A038
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 18:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbjAXRbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 12:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234410AbjAXRbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 12:31:45 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6F04E53B
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 09:31:41 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-506609635cbso14130357b3.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QAWZNKWNBnz2nm7fG3oJ2Ondshli1quuAhafNezlm2I=;
        b=vmOWgr9rkUwzXlseFVsT2j864QAGrD36dNV6+hb9Z7hRLYJ8B5WeRZdEpjer9y7ZXe
         y3QrwhGV4pSrb3uagpnMn9m7/R87CzSOQh1IMiI/Ze8ueXecFpmJdcSaN8I9jtsmCAcN
         xFYH9X4OMx83uCjY9yqRshrNksPwFYRMa4Rny8507wYI6TRGrzwtgTMuGK5om09FRo3V
         6GUQgPGuq8fDJDIGNIxBaQExAtH7HCjVd4U5z+9I7stqOeHP6HY3Rrp7zHrkLvvLyufq
         4YKtIX9+fDcRiCAKfOkz6LlWFxlJr9Mq0SgSh5ihV8KN0m2O18EeAPFxR8riEi+Popz0
         7gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAWZNKWNBnz2nm7fG3oJ2Ondshli1quuAhafNezlm2I=;
        b=XDBzR2+7IuZaN2lZLqxqoQmMIabIvvMNTWCN0zPZPG63YwyVCvRbtwA+gOinbzA2TS
         iysW5JW/pAeWCSA79ToKlp+180mXGv5iLkmgRHEgNo0uGalmY25L8zpuSRSYhmQWHh88
         FROsC+wNFFqHmfaU20yyP8ayVY2hTXgMLnEITDRt7kuV0Qv4Imp17ciaCZtaQPcS2Vwn
         Wp4hNbkIlq+yz4Zw5b+gR+NQFfAMKSuOxrUHURzpQjoQepfQMb/kJr2Iw+s8L+SITwiA
         GVDm6OmKZpOSm+HJBDxntGN7tS9s6ZHiuTe5Ck+tZc/0ALtQJDfrjTxqZIKpgX4F7wml
         0fdQ==
X-Gm-Message-State: AFqh2kqMRxk63ExK7LnvTYtZcNDH/KL+pDfSWQj3OF5b8c9yrQ7xHMkG
        re/GxcWqL0niHbZsy6O7rOuY9ArCm/qYKsF9/SXWPg==
X-Google-Smtp-Source: AMrXdXsZAyRHAzMydmJt0v6Zl159VWuKM4IasufLzc1VlCjkIdzuHw0AHwiN22tOlj83E3v3X9dDNJNrvuw/U/DjuBY=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr3916907ywc.132.1674581500991; Tue, 24
 Jan 2023 09:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20230124141541.8290-1-quic_devipriy@quicinc.com> <20230124141541.8290-8-quic_devipriy@quicinc.com>
In-Reply-To: <20230124141541.8290-8-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Jan 2023 19:11:00 +0200
Message-ID: <CAA8EJpoHqpo=QWHwO=LEbT-Mk4gr7F1X4ecL0Y+kbG8Ow6cGiQ@mail.gmail.com>
Subject: Re: [PATCH V1 7/8] arm64: dts: qcom: Add ipq9574 SoC and AL02 board support
To:     devi priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, shawnguo@kernel.org, arnd@arndb.de,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_srichara@quicinc.com,
        quic_gokulsri@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Jan 2023 at 16:17, devi priya <quic_devipriy@quicinc.com> wrote:
>
> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>
> Add initial device tree support for Qualcomm IPQ9574 SoC
> and AL02 board
>
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>


I suspect that the order of sign-offs is incorrect here. Your sign-off
should be the last one, as you are the person sending the patch.


-- 
With best wishes
Dmitry
