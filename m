Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27534121701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 19:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbfLPSdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 13:33:23 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41797 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730472AbfLPSJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 13:09:41 -0500
Received: by mail-pf1-f194.google.com with SMTP id s18so6011048pfd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 10:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=uTZ9jD6XcU5csDtmDm0A4lEi/ET7Er5jr9WSb1EMelk=;
        b=jyyXYbhQgJvFoH/gkE8wmpD3skyYKQ7NOFesPHXGsZrxJc9FUF39kXCisPYSVTzGH5
         XfprSHFhYdHkCCIcBitR0qWWWt/V9TEhaHrbqEckar9UuCp+Jsl7qVmxq8BZtEsNxyir
         KSiD+A7sa97Cd257ghc22sKZBvGAGw9UYoEQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=uTZ9jD6XcU5csDtmDm0A4lEi/ET7Er5jr9WSb1EMelk=;
        b=Yuro5+fa/cTaREUyInCiY25tA8denLFnV7O6x2Ho5zpezx9yyTKhu5v+a5UkG43+Kk
         vrGz7L/p44sIEikvTgQ9DwQ7ZtaRpt/rFbVGbFyGEkRJ/QFK89BNRXHKaJpaTJSsoysC
         th+qDbWn3+FNSbAYEy7uiaJRcqhcdFE/CTFK4FFDjZRK1NYD6Dy+qhUSQH5Rqf9U5Qn/
         eY1nLcGMsHOT3HaEuhAiIuQkeBwOVlCDusEhnt4v3POBl1H9KUvY4dn60uE/NvrAVCcm
         4Vg0c9XzW6gKzU0qjHJwFNKvJLh47jTipoEuzhD04YUnDyqX94ImLnCDwEKIhONj2q4T
         K/NQ==
X-Gm-Message-State: APjAAAVZqu/VUi47zOuMIV7ak9+E/wgcSdQW+Z8ag0tIQwwz0jAMwVwO
        Im9Ge3+MHU+7Pls+GFtgnerbOg==
X-Google-Smtp-Source: APXvYqwgYd4Qk+VgNW5yogq7vFaECby6SdTTUamWheo+l1m4itfak+lUZHj4qp1Cai9JxJJVFmcP4w==
X-Received: by 2002:a62:5202:: with SMTP id g2mr17177463pfb.43.1576519780253;
        Mon, 16 Dec 2019 10:09:40 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k23sm23348452pgg.7.2019.12.16.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 10:09:39 -0800 (PST)
Message-ID: <5df7c863.1c69fb81.91ce4.37b3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576474742-23409-3-git-send-email-sanm@codeaurora.org>
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org> <1576474742-23409-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 10:09:38 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2019-12-15 21:39:02)
> Add compatible for SC7180 in usb dwc3 bindings.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

