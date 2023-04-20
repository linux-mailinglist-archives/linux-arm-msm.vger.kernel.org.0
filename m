Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79696E9B4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 20:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjDTSJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 14:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjDTSJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 14:09:39 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708972715
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:09:38 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id m14so2905579ybk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682014176; x=1684606176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FVvbbOx6CVUuVacoumj0fiPSi4Hh5DrvtofkdN8frA=;
        b=d9t+448v7r0nK35uVYabqIOxq3NDMTyiYbZk/zxjsDYVCQv5Edm/p1y2Q5LteFy6W9
         /Y8iVnO/sWxEqkYc5StxD6HCwiHRxmtJMGy56FjCWmr0AxJwr3xAuXyiiptu+wlvylMj
         2fRepeCcMnyWMON0vh/dfzftaBLMaei/7mjx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682014176; x=1684606176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FVvbbOx6CVUuVacoumj0fiPSi4Hh5DrvtofkdN8frA=;
        b=HnODn3sq7ufR4y0ClEZhKRPFzMuC54Z01WOh5gNp+IpbGtmVD7Cz6M4Pp8o2lAAgBv
         vtxWlmrrH0nU86IjeK58W+b7vBSeCB77Yokilq2l68IcGCjON+CbyN/s25134MmDgRyp
         9c7QPlK+cG+fiq/W91sKiSYuS0cT9j00L0Vy9savUZtYayS32OU71tbu9I1kSFeb8vcH
         +2cjTMw3j5MmLH/ORBPaLHxkdE6gvp/Y4nxaWRpbPFD24DYJXHqPNvLWhvWoCa4T5DnH
         /hP5tIHv5YscHOJfHly/Y8036KSjbyKlmCZZhzVAL9EAdds3vdqeRD8mXa5K58ZPTHTK
         BPAg==
X-Gm-Message-State: AAQBX9ec3SxbmOB9UeiHyb9RrhMmMw3omwy/TsY3F987g94adZcwpasG
        3vUeBU1Aem8erXl3Vc34sGGUk0zD0qV/GUoziUw=
X-Google-Smtp-Source: AKy350beCdgdcT+F4ap7KU11D8OuC1sSMbEFSdwMeJDbofKUE88LDvaxUEoaHdBbURhAg7FlM9jidA==
X-Received: by 2002:a25:2d28:0:b0:b8f:32aa:1d50 with SMTP id t40-20020a252d28000000b00b8f32aa1d50mr2201206ybt.55.1682014176264;
        Thu, 20 Apr 2023 11:09:36 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id c134-20020a814e8c000000b00555abba6ff7sm466330ywb.113.2023.04.20.11.09.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 11:09:35 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id k39so2825705ybj.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 11:09:34 -0700 (PDT)
X-Received: by 2002:a25:d895:0:b0:b98:6352:be20 with SMTP id
 p143-20020a25d895000000b00b986352be20mr750560ybg.0.1682014173924; Thu, 20 Apr
 2023 11:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <1681996394-13099-1-git-send-email-quic_vnivarth@quicinc.com> <1681996394-13099-6-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1681996394-13099-6-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 20 Apr 2023 11:09:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkSQUSkY0UsU=s=PhXYRCrh-0TWM4K7FRfymTtL+MbcQ@mail.gmail.com>
Message-ID: <CAD=FV=UkSQUSkY0UsU=s=PhXYRCrh-0TWM4K7FRfymTtL+MbcQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] spi: spi-qcom-qspi: Add DMA mode support
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
> @@ -528,6 +760,7 @@ static int qcom_qspi_probe(struct platform_device *pd=
ev)
>         master->prepare_message =3D qcom_qspi_prepare_message;
>         master->transfer_one =3D qcom_qspi_transfer_one;
>         master->handle_err =3D qcom_qspi_handle_err;
> +       master->can_dma =3D qcom_qspi_can_dma;

One extra comment: it might be worth adding something like this (untested):

if (of_property_read_bool(np, "iommus"))
  master->can_dma =3D qcom_qspi_can_dma;

That will have the dual benefit of making old device trees work (which
we're supposed to to if possible) and also making it easier to land
these changes. Without something like that then I think transfers will
fail for anyone who pulls in the SPI tree but not the Qualcomm DT
tree.
