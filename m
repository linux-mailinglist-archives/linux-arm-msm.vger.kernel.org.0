Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F61174371
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 00:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgB1Xm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 18:42:28 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41277 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgB1Xm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 18:42:28 -0500
Received: by mail-lj1-f193.google.com with SMTP id u26so5046021ljd.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 15:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iId8/Patumvx4bfeqRK0XfOfMMBiyM4YKPgGmeoe3Ic=;
        b=jR9hz1HnsFYdmlGMnV8RJw+1wYnmwgmp5F4eYV/HQJq0IT8X9BmWqLirtywy1i2QP4
         PENcGt2urlSOb7+1q2awxksqIf8X5fPoDXtpW+LGhA4OHuAGV/S+OJrrdNiN25PDwSId
         oBmLzMgzt4wjcsLTuSyUutMgMmEgIhzVmQS2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iId8/Patumvx4bfeqRK0XfOfMMBiyM4YKPgGmeoe3Ic=;
        b=Lv1TftvY+/C+mXaaWXJOHl1ZvGDFKU/q3TzpitVUkrUoPqGeK14EFmmpe4XdFR/kkV
         gySlkWqH/ZQAIZiQCHV/SPUPSSimLmMj2dF/yNqdKMiy8GLMYVxyTvgEiOR6o5PA6EYs
         /DWh1ZmJK6L8GmRF33C0uPlfV2u3x3lixjnoGO3Sya/qXiQ70SKZTRiVLKqt+72Wp0Dw
         4E5x9u7cVvF8Em8IZgkUKE9gbaobjo+IIAhTRw7rRH+byiY/u7mNE33NK1O8w8w8ebss
         jn2U6FGqRZ3p+jyP0P43GR9HfqlePsKcTJfAuUYs9SCM7HPjuBnC6wUg8r2M26UCCZs/
         arxQ==
X-Gm-Message-State: ANhLgQ1xEJKHrki00J2LOLBHy3Ug2lD25X1wFQE8t6VFvBvxoj2TUCiC
        5omM4gqBRgs4ALx9dgsOYFKCiqEmSIw=
X-Google-Smtp-Source: ADFU+vsyhPj8jYyh34BFgCKVAszCKb+kGwlzk1XYlyu4S4GIWeB9+Zqh5UV478iQ6Y3yEf25/Xx3hw==
X-Received: by 2002:a2e:9143:: with SMTP id q3mr4118911ljg.199.1582933345703;
        Fri, 28 Feb 2020 15:42:25 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id m24sm8104230ljb.81.2020.02.28.15.42.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 15:42:24 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id v6so3312753lfo.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 15:42:23 -0800 (PST)
X-Received: by 2002:ac2:5226:: with SMTP id i6mr3661642lfl.99.1582933343335;
 Fri, 28 Feb 2020 15:42:23 -0800 (PST)
MIME-Version: 1.0
References: <1581316605-29202-1-git-send-email-sanm@codeaurora.org>
 <1581316605-29202-2-git-send-email-sanm@codeaurora.org> <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
In-Reply-To: <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 15:41:47 -0800
X-Gmail-Original-Message-ID: <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
Message-ID: <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sandeep, are you going to spin this series?
-Evan
