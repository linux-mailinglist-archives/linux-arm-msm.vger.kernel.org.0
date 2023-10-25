Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFEF7D72C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 19:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbjJYR7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 13:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjJYR7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 13:59:50 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E82F182
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 10:59:49 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b2b1ae4c21so4126853b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698256788; x=1698861588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+X2BcGs+yr5ozuWWWHgMfFUYNfIzqQVUuDmFrK+H+k8=;
        b=N2ZfGEhkHwAxCnUSg5U6gOYoKiM9IYBJZgUvpug8JRt+N8fGqcWVKLgMRLHW1yZGkm
         yLrgmTZMH6CGru7H/nRWIdutHNUGrepmLtX8EF4dTL5kEsN6eJcFZ+uBwSYtCe15onYA
         cMq4GkT48ihaJof3WB9Mk+Wo4b37mmHzBWNMA2u+kk9msGo+BJq9UiEvicm7S+hY3D1r
         D1aav9omocOVPbNopaui2wyxPP1bkFCLYlBND80uGGuvQXpWsy6Fottc7aQbMJAdr2TS
         oReZrVl5+JKkXFdwotYeFI7nrbQNq9/UmCAxIwUMBV+g9wnKgLsZkV2qUev51+NRlWHd
         yFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698256788; x=1698861588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+X2BcGs+yr5ozuWWWHgMfFUYNfIzqQVUuDmFrK+H+k8=;
        b=S8jUvEVGYkv1LxEA441WfKfQ+ZEbamBLUE5u7t0QB7CjmVTwynmxgNk6IZbTmdkrUV
         DS7alOfS/CvG0B3TKVL124M1WGTiJ2VECKgjc/Sv0nmSvR748CHcJXQG0NroOAQc8dkE
         2oR9nBBRVtdOqA7nQdf+oAyA84T8zeU9jOnwjJW+aEIfUWi2UYREHHaLSeXh+2n9DkXw
         Z3DfVC/0Yz7BiIsdDUqsQ4+dwaYA0KDVDBFVCslc+O17TYPl/Q2Eaqs5tRmu6/PROdkD
         amtuF2p9IebIZE9YvK9wpgh3gOBAGHVJ+XUvEfzoTUKX3hbaeZtzcf6DBxmn5KODJFqB
         1fdg==
X-Gm-Message-State: AOJu0Yz7+ciE5vbiBUr3rZD3gI1VMFVK9wufyi31pGxmRVr+NzMUCI+6
        Nd54CkxoG+ag4ywKFICQiDU90KasfSdDAVs4YRFcvA==
X-Google-Smtp-Source: AGHT+IHt0K3a3YxmMMAXLMGE/SLHxoNsrcnDOTH2dLfGGsktR/apcQTUfBYmn31LK8udeC2DVR6+WlimdKhWd044Rt0=
X-Received: by 2002:a54:4090:0:b0:3a3:ed41:5ab with SMTP id
 i16-20020a544090000000b003a3ed4105abmr16867919oii.9.1698256788382; Wed, 25
 Oct 2023 10:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com> <1698253601-11957-3-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1698253601-11957-3-git-send-email-quic_mojha@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 20:59:37 +0300
Message-ID: <CAA8EJpoYTXwdrwEUnRLtpeFY=xC_wYdE_pW1W4kM=JkRmR=mNQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8350: Add TCSR halt register space
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 20:07, Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>
> Enable download mode for sm8350 which can help collect
> ramdump for this SoC.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>  - Improved commit text.
>
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
