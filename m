Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C29346AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 22:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhCWVCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbhCWVCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 17:02:23 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A96EC061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 14:02:23 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id m7so12995776pgj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=0nmdLKTQUU2U2MlvkwteXMP5AIq4bw0Xz/4Qd0uYKt4=;
        b=lWuQcN3sK9Ca9FEj5KeA4qv6DqeYqUD11pu0cCKxPc6Eaoj5OyTu+43rBNtwonazoa
         wTK251fZxSM+LfcEGxYIBj0jOpyeMZbTbdbUC4uH1BGj6pVeOTb+GSva15KnPeFN2k97
         VRqSeNt/1nM5ZgTa37IkDyfwn+g7cucu5xpg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=0nmdLKTQUU2U2MlvkwteXMP5AIq4bw0Xz/4Qd0uYKt4=;
        b=mH/QlRx1EFPQG4UCu5abaivsaEP9DjgTOaYrTxZiDTfW1cKfItH5iExZT95OSS9vh7
         c1+l8bPDMEh/QTYo4U/fGQobypFNBYXqcR/VUoeQg2Cl31W4ZBqknMYD8pgD1VEEaTVS
         NmkYZtoB/t8mZaWDh+E/Aia1OuDd4ZDTq5MZhBbgCp3vfV5rD8L/HABH/AdmUpxsfGSh
         W5wNIFiNH/YdeN+3EE4veNctE0zmeRykIe3v4wmVFCK2NyALyzEBd/XPcy8VUUkI3XlI
         huiVA9WfTT7qp3sZWUX/DU6p0MqXZnrn1R8ZUfD3opAjedKS7cIUwHOtiZPnQTSammI1
         akSA==
X-Gm-Message-State: AOAM531KEaTFf34scEpdpSyQ38Ed6aaxcPLxIn20Xyi7U9mL0OD8xmMJ
        PHrWgsJirS+ZEAhpxIGHpklStxi/ukNLJQ==
X-Google-Smtp-Source: ABdhPJymVqgWCHhY+IXyAkrmtX70mjVttdAPK3H+B3EXnXCLpFLS4kYrDMHtxJRkN04PoUGhyOQ2pQ==
X-Received: by 2002:a17:902:e549:b029:e6:6b3a:49f7 with SMTP id n9-20020a170902e549b02900e66b3a49f7mr171266plf.52.1616533342892;
        Tue, 23 Mar 2021 14:02:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id c2sm109388pfb.121.2021.03.23.14.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:02:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615978901-4202-3-git-send-email-sanm@codeaurora.org>
References: <1615978901-4202-1-git-send-email-sanm@codeaurora.org> <1615978901-4202-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for SC7280
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Date:   Tue, 23 Mar 2021 14:02:21 -0700
Message-ID: <161653334107.3012082.10885367970914434263@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-03-17 04:01:40)
> Add the compatible string for sc7280 SoC from Qualcomm
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
