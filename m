Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244B975106F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 20:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjGLSZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 14:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjGLSZN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 14:25:13 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911001FDE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 11:25:11 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso55729325e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689186310; x=1691778310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3sbg1EWek1f7W/2sEFdDkon2yGXDKs3LeHwQc8htLNA=;
        b=u8aDDgJFfGEOW7j1I1qdOkKlFoZchHnPUIS3J/GLni+iE4cR2YOajIuM2YRggaMC3h
         6uA+XGjpRU7QP6aouW5YmWbpBuZCQF2ldrWfpqO9Ew1w/LIuKxq8F3GbV8Zhrxs8nXl4
         giEnU1DfTzop+e0rFO03HZXrtvwLkWdAb2RuY4XOjw9vNqoIBdtxuEXU0BnULXqYmP4U
         Oimb1G3d+Q5baKbh7pd9aifjI0pwed+KjiSigPr72D7tN9UKyMpziFYkT7jOYjjjDz1B
         fOiCtrbqpGCNKsRFD3/fhrpcZT3vvQhLrW171/TOrO0takiyd7/CC5iHf5HZW5CSYtrf
         PADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186310; x=1691778310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sbg1EWek1f7W/2sEFdDkon2yGXDKs3LeHwQc8htLNA=;
        b=PY06jL/OR6mA+oogiWaywU6cNRfZ2I+LsNJsKw8S2qEqbsxGlbASlntkq/Ohst9gM/
         wFmNma8WGX4I+KfpTJqNNy8N7zmYC+4QtwnEaqGCIMWXeRmfweA3h1f+HSvGZkAEzQ0S
         P7UohVIEZj17VMxG2dMOg/d09/fIK1llTdMd7Vi+9hOrVkjHkxGWnoQbFNZlDISx7eSP
         OY7Oe9x1hLadcYDwehqUJoFcKddB7YvhA8ptlgoFLdDloI1lmSylOwZB7zlWojtMtsLD
         cWubOQOcQ0Xd9W9iVnCWilRcFj5+F70Iq7JUUlTwb8m67LQf45hiBQD/WIFlwEOr4gs2
         NjGA==
X-Gm-Message-State: ABy/qLa8kma0XT3g+U4jthQepjtLXkrLBn93Y2YnrKLyA3tpVuAkVj6P
        Mh1md64TzxmNdHELvMlvlO5zG+UBZt928o57RgIv5w==
X-Google-Smtp-Source: APBJJlHn5AONiwSv5nuU8XvbEPnAsG7pZFEtpPxaReRewRtCSYUfxoBuL8tsflJhEhaBeE2wBZwKV+fpBuDDMvHrooQ=
X-Received: by 2002:a5d:4603:0:b0:315:ad1a:5abc with SMTP id
 t3-20020a5d4603000000b00315ad1a5abcmr2917667wrq.5.1689186310079; Wed, 12 Jul
 2023 11:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689148711.git.quic_schowdhu@quicinc.com> <f3ab03c1afadd72ad166d2e421844cfca072f90e.1689148711.git.quic_schowdhu@quicinc.com>
In-Reply-To: <f3ab03c1afadd72ad166d2e421844cfca072f90e.1689148711.git.quic_schowdhu@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 12 Jul 2023 23:54:58 +0530
Message-ID: <CAH=2NtwYbhd6kS7dSYBXJsgW0pcMz8PxgX_BCmFcAiAVYNUzvg@mail.gmail.com>
Subject: Re: [PATCH V1 3/3] MAINTAINERS: Add the header file entry for
 Embedded USB debugger(EUD)
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jul 2023 at 13:58, Souradeep Chowdhury
<quic_schowdhu@quicinc.com> wrote:
>
> Add the entry for Embedded USB Debugger(EUD) header file which contains
> interface definitions for the EUD notifier chain.
>
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8ecc..6d395cc6f45c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17288,6 +17288,7 @@ L:      linux-arm-msm@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/ABI/testing/sysfs-driver-eud
>  F:     Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +F:     drivers/usb/misc/qcom_eud_notifier.h
>  F:     drivers/usb/misc/qcom_eud.c

You can simplify it to 'drivers/usb/misc/qcom_eud*' instead, for
avoiding repeatedly changing this when new files are added in future.

Thanks,
Bhupesh
