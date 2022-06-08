Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D722354379A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 17:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244439AbiFHPjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 11:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244467AbiFHPju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 11:39:50 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83294121CFD
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 08:39:48 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h19so27675959edj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u1KDk/axUVp21+cddhdnk3LSPy6qbxF3WGn2a8z1Emg=;
        b=FUuw+7ZM3/XXnrhhGij7vnuxOiK6TrpBZ/GHgI9xei+CGe2dYATAna7tls+lZ7pfii
         WvErUgiHuJq5JqU6UfFNSbQJ9Bvw15qeVyFlvEyQb9ydHtbTdswChqeIRvs1iXQqQHd5
         ZXX4rFy8gGNKqDKSUdebNORdv8iYOQNYzcUHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u1KDk/axUVp21+cddhdnk3LSPy6qbxF3WGn2a8z1Emg=;
        b=Fo3RVTiv6rkm5o7IVPYjEin9etPclhBHvDrTMxPwjHWCXogHbRvBr/1GnNdcIxSeub
         LKQVuK1cH3xItmRfxs7qc/xxhhMPlV+3xFW/d1+OlduYCQjzYEJRUyFFO5W0p4h3gnWQ
         11UCQ+R4hmxtviKxENUy5FXk0I7/Z81hL6Qcz/GWYlWoqXYX4Q2rb01R2pVguhcLijuJ
         mh8qhfuK82YyytX1xT6LdVGtfnTeeD8IGKQe7ONv3NgAiNmccP9sXAuLGKYldV3mmgVi
         9edNhCD1eETRMVJc3nh452P0fbY3Lm3RodXclhl9kq88zAor4dBgFld6MPYbZwVsHguu
         /w/g==
X-Gm-Message-State: AOAM531trLUvx37oFPMJ70lZsiImKNZXCb3XGMctPkZWx+QjTxaaAKsV
        baUjwOPKgkBGTp5ZfugEHuLfN8VwvHQ282RzqWY=
X-Google-Smtp-Source: ABdhPJwD9QEfHyDshgG621AD3spQ5uNLtvwJ4Tdb+HtpEWVdxpuUNpBgriS/15fn+gtVmSKyoFjflw==
X-Received: by 2002:a05:6402:254e:b0:431:35df:5e38 with SMTP id l14-20020a056402254e00b0043135df5e38mr25261837edb.385.1654702786734;
        Wed, 08 Jun 2022 08:39:46 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id ck11-20020a0564021c0b00b0042de3d661d2sm12638463edb.1.2022.06.08.08.39.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 08:39:46 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id h5so28939639wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 08:39:46 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr17795611wrt.422.1654702785594; Wed, 08
 Jun 2022 08:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <1654627965-1461-1-git-send-email-quic_vnivarth@quicinc.com> <1654627965-1461-3-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1654627965-1461-3-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jun 2022 08:39:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1oD60yRvoZohG07Pd62ki32DCGuCrG0R6bPXM=NpY=A@mail.gmail.com>
Message-ID: <CAD=FV=U1oD60yRvoZohG07Pd62ki32DCGuCrG0R6bPXM=NpY=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] tty: serial: qcom-geni-serial: Implement start_rx callback
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com, Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 7, 2022 at 11:53 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> In suspend sequence stop_rx will be performed only if implementation for
> start_rx callback is present.
>
> Set qcom_geni_serial_start_rx as callback for start_rx so that stop_rx is
> performed.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 1 +
>  1 file changed, 1 insertion(+)

I think you also want a Fixes tag here, right? ...because if only the
first patch is taken then it can actually regress Qualcomm devices.
Thus:

Fixes: c9d2325cdb92 ("serial: core: Do stop_rx in suspend path for
console if console_suspend is disabled")

Reviewed-by: Douglas Anderson <dianders@chromium.org>
