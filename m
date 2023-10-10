Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A0E7BFE70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 15:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjJJNwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 09:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbjJJNwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 09:52:40 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17609173A
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 06:43:03 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7c7262d5eso5248567b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945382; x=1697550182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=WRFEmVFsknlCGJv2ck7WavA3XMp6eliKBgx+Lq2kq3w8M2mUcxcETJNKOGDauQX2XX
         +xWmDcjoYlq/3cNWgC7l0YB+pDWuCTSnhDzffnroS0HJ/pf59/Ns+kOe/WgpP1944CYp
         os8SH02WNTT93fqghJz4apm6Il4IQbWIMNAhmMQkOm7O+okL6oZ572ydkNxyIuu48GRq
         4yHYM9uWawQraJyEizwGE/RJC3ZtQk2pv/IM2QFBPynt6qJsTHyPRHslk0nJQ/1P/IhM
         a7M6ZcvaZN+OlYLOeJKcPDDMP1hzoErv2yNdNWcqwpeGPmRwU4Sd2D+EWGAo5IbDpi4U
         I82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945382; x=1697550182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=fym7c3Qj2afsAXTQpz2HgAye61VDUobAVaANceqkHqFKiC2j89EW/xt5v/k3FdQD4A
         3MPC6agx0+BBvqGit+2UzHPTInZXwfZBHrX+Gtz0vp2r605a/JhhNXZjh71ioOhwSm+M
         6UrXX4qbmd2XNPv7FWRpMBojjSyf5LdGhPWUgktwmgVnSjHK00ASNmr3OCt8O3UQ6L0a
         kApLNjn+lSiRMclLL+J3nv/e0RZ0V22kTItuL0dY58sBil6P2dZIgjR5ZbBQcLz/ZClt
         XAN7+hS0Rp4Fgt8P4daqs3hSSKUdRCI+/Yk89ssxpBqFUvJsKn6hTtHG4D7hCAmRaKFV
         QNyg==
X-Gm-Message-State: AOJu0Yyec5vYXxnG+hdG/jBTnKXmMTfksvchFUwTfm/UsUtSWxxLUXfq
        ij3+1sJn4HIuijIdUPcmgn80qYzjSOAitluyX8KIOsCbILYuVm5np1Q=
X-Google-Smtp-Source: AGHT+IF3/Oc+ZMdiZnISZs3ojNA1/qjGKd9ter8xI5PkhihVk+K7E1PuGuRajQjSiV73X4edO0mK80JDDKm5xBon1GA=
X-Received: by 2002:a05:690c:4813:b0:5a5:65e:b847 with SMTP id
 hc19-20020a05690c481300b005a5065eb847mr15101159ywb.34.1696945382211; Tue, 10
 Oct 2023 06:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-16-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-16-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:42:51 +0200
Message-ID: <CACRpkdaP09Df=i4dtrKFtZmhN1EVX7OqxddRjHXMggPt4T3W8g@mail.gmail.com>
Subject: Re: [PATCH 15/20] pinctrl: qcom: spmi-gpio: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
