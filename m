Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F476E9A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 19:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjDTRU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 13:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjDTRU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 13:20:58 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14DA1B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:20:52 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-555e170df98so50850217b3.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682011252; x=1684603252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASlcFMe+UBtl/yEkw/ihBI+w8rG6+336g8ZGmASVmQA=;
        b=bz2XTEgWzAklAu+Ppd4TwshTEbAoIb+xGEi9yLdgPBbB61G3uUjEz556qpX0RTk1m5
         KZmc0vzYZ7Rt4lKay4Fbs7zJBg5pyc+4p2owPyRVKuTBEFeZA4IXOnpcNq1wDoV0CqnC
         lvjZHaMqdBnZklufb2NT24KaNd6zI73Rpa3TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011252; x=1684603252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASlcFMe+UBtl/yEkw/ihBI+w8rG6+336g8ZGmASVmQA=;
        b=jvmRpywPFnjhznPNGsPnJVWJPA+M+PRKPHPUZWKZT1ehj014pJiYohh1lx3U3vlGiK
         AINbdjayXwlcEe/vRuiZUAvMmcrLzVWh3JU/jM0owvEcKozYlVOhAg6sfWxcOiAVMGWB
         eatGeFzdxjGXf+5lGG+Ep5rsTFtofZD8x2EMxGZzMyGu4eBoEuVOv+eND+IvM/84Nra0
         rbIBz5gKIatilucPTQMV+0LEObgTiKG0CZDEfiivXgc8n7MJQsr1Xbu8WljSnQQA5Itk
         aFNbgDJ6IMDHjHwX7fR3Vc6y5GvgI399elwdyGsRY37YZAunrlYWkIstN3RUmGhTrhbZ
         RHDQ==
X-Gm-Message-State: AAQBX9fZ1oDLDnIbamLepdLUstlf+L0T5rYtKNsjH7D9Ws8aUVKw89zg
        X287QFCAOOifQ+3tuI2K4xyfPUuGK8iBUY/6ZLQ=
X-Google-Smtp-Source: AKy350YJXsIxAtyzN7bOFDfjImIrTEIkCCc9tlmgEayGitG4zz4sQr9Gu9GVyLXShyNLaJKGy4TFwg==
X-Received: by 2002:a0d:e601:0:b0:54f:8171:38db with SMTP id p1-20020a0de601000000b0054f817138dbmr1430879ywe.32.1682011251991;
        Thu, 20 Apr 2023 10:20:51 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id w13-20020a81a20d000000b0054fae5ed408sm446749ywg.45.2023.04.20.10.20.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:20:51 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id l5so2696957ybe.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:20:51 -0700 (PDT)
X-Received: by 2002:a25:c807:0:b0:b95:2315:a2c4 with SMTP id
 y7-20020a25c807000000b00b952315a2c4mr1169128ybf.0.1682011250803; Thu, 20 Apr
 2023 10:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <1681996394-13099-1-git-send-email-quic_vnivarth@quicinc.com> <1681996394-13099-4-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1681996394-13099-4-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 20 Apr 2023 10:20:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxbLsaxJc7YKH+beaPFTxq7x_jS_oQQ+KHXXQ=LgX3ag@mail.gmail.com>
Message-ID: <CAD=FV=XxbLsaxJc7YKH+beaPFTxq7x_jS_oQQ+KHXXQ=LgX3ag@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sc7280: Add stream-id of qspi to iommus
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
        mka@chromium.org, swboyd@chromium.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 20, 2023 at 6:13=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> As part of DMA mode support to qspi driver.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v2 -> v3:
> - modified commit message
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
