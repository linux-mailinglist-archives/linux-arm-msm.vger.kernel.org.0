Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F9D1584D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 22:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBJVfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 16:35:24 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35205 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgBJVfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 16:35:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so3356931plt.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 13:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pgc2HVuzTlOApbzWYuf2GztwyECo8PvV+6g1YsZKtqs=;
        b=FcoSNlc8G46a88gf7LS2JXGZXa8BZmfldccNMAMTh3HMkmZOR4Y8ND7XRhLaQj5h0I
         WZqK/wAnvKP6Y48qAfNScuBN+HWy/nLxY+XY+oabNXOWTfDqZ7Xevxd5K+s+7wr5es1C
         U41MhQ+QE9oECxJt6BnWNJNQEvJlsFTjNqClM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pgc2HVuzTlOApbzWYuf2GztwyECo8PvV+6g1YsZKtqs=;
        b=JAzKugQbnfGKFahJoTFdL6IHi7bb4Odzh5zbpozO/it+2z4St1ETE6iXO3o2P3eNKd
         sTA+e4EpZ4IXZdlnvt7DCB3nF+QtxfmcwoC3AH8Bm9DI4mE2f86Hcy2902qxMZY2B9o3
         hqwDMU8D6FnT8EWlJl2VNcAZK8mDy8jDxBHvfuDZEVOrvwVD4pPTuvHgMPIZe3P+r2nI
         Hc8yIkl+004tiTslHX7YP9rrMD5k1XtBzQ27LzyPiFsXHQ4PjTHXDVh9qKN6AnvkI+1h
         evQ6vS81B6AmSHG8ufmuLDgzjeK3Xi65CiWF9BBla1ZORCuX2axc6s47YZStESc5VUSR
         5RGA==
X-Gm-Message-State: APjAAAWXJedZbPGtVC3YOK6sTReBD/NdNs5QXNQ+NENYaUxysltX7py3
        Y1FGTDWxMky+k9npoLrrK5mB3Q==
X-Google-Smtp-Source: APXvYqzWAJ6Ldly+R57YNfK4lMRkzu3aoVy8A/bfws1EkVQVTJVWLD4vAGFwyFhESIze/ueYbw7EZw==
X-Received: by 2002:a17:902:6184:: with SMTP id u4mr15038014plj.198.1581370523419;
        Mon, 10 Feb 2020 13:35:23 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id p18sm622130pjo.3.2020.02.10.13.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 13:35:22 -0800 (PST)
Date:   Mon, 10 Feb 2020 13:35:21 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Add QMP V3 USB3 PHY support for SC7180
Message-ID: <20200210213521.GD18972@google.com>
References: <1578486581-7540-1-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578486581-7540-1-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

this series has outstanding comments, do you plan to respin it soon?

Thanks

Matthias

On Wed, Jan 08, 2020 at 05:59:38PM +0530, Sandeep Maheswaram wrote:
> Add QMP V3 USB3 PHY entries for SC7180 in phy driver and
> device tree bindings.
> 
> changes in v2:
> *Remove global phy reset in QMP phy.
> *Convert QMP phy bindings to yaml.
> 
> Sandeep Maheswaram (3):
>   phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
>   arm64: dts: qcom: sc7180: Remove global phy reset in QMP phy
>   dt-bindings: phy: qcom,qmp: Convert QMP phy bindings to yaml
> 
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 201 ++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 227 ---------------------
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   5 +-
>  drivers/phy/qualcomm/phy-qcom-qmp.c                |  38 ++++
>  4 files changed, 241 insertions(+), 230 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
