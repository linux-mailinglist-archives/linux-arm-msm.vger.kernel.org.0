Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8FCE8CB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 17:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390053AbfJ2Q3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 12:29:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45589 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390174AbfJ2Q3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 12:29:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1so9919084pgj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=4+t5n913OXHitBtsyBvsQKQao+y+MGjMu+bJHGLBjZU=;
        b=NJIIrX2VGTd8KVyiMbh9FNyJT+PRYeqwiWnBzN/7KtEovz+rbt74souj4Yl3475+X2
         y1ZBT0rue+H6T3c2laYKlpuGiJxSAjHkOuBK/7i679q+Q/ETKY+Qk9ipT5wYsi8yAilN
         sxvqvtqdW70L9hwfgffwO/8icsamxdqfNVnHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=4+t5n913OXHitBtsyBvsQKQao+y+MGjMu+bJHGLBjZU=;
        b=rl54AZWCMCUUx2w+WMVaSM0Jo3fdSSwkLBLV8gvSarz+vm+oyNFlIKUCC/ZMSnRecL
         q62uDlJlTiXymUOKs6DrGfap1fcRrY5W3vuqDxhQXeYgEEPb8SkFgroren6fhyR4bBC5
         T7msa3XP7UtbKXjrSIRv5PKJQJ7eJHZ7VOP/PUPUevmHVSao3+22vBIYtWbLa4IC3jQ4
         FINfNlUh7SXtlXv6Lw+MKeNI0Vxh1qRD17K+YkC7ppR5WoBdbzpxpaw9Mhgl+RWszfOW
         Olv9Czk13eSjQrDi/s94pxQEHQiEDyI7avKO3kpPOPs44cdTawZq9lDYMCRkVTT9ktom
         OJ5g==
X-Gm-Message-State: APjAAAVHmqn3ktTXsj1xjgDvh/WuauH7WjK7NeLQgBFdSf8MQWLbl7uP
        yiAxlZq8Hf2MtdlmP8TppQt/Dw==
X-Google-Smtp-Source: APXvYqzHUIlTleuShH2sJpzD9w7h5lKq1L7bggbEXdXYd12/vBBs466jaOTyncdUSDYatWHo/eEOwg==
X-Received: by 2002:a17:90a:ab0e:: with SMTP id m14mr7766178pjq.78.1572366572897;
        Tue, 29 Oct 2019 09:29:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v25sm13929998pfn.78.2019.10.29.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:29:31 -0700 (PDT)
Message-ID: <5db868eb.1c69fb81.f60d0.d87b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1571921328-13898-3-git-send-email-sanm@codeaurora.org>
References: <1571921328-13898-1-git-send-email-sanm@codeaurora.org> <1571921328-13898-3-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>, agross@kernel.org,
        balbi@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 29 Oct 2019 09:29:30 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2019-10-24 05:48:48)
> Add compatible for SC7180 SOC in device tree bindings
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Docume=
ntation/devicetree/bindings/usb/qcom,dwc3.txt
> index cb695aa..c27c58d 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -6,6 +6,7 @@ Required properties:
>                         "qcom,msm8996-dwc3" for msm8996 SOC.
>                         "qcom,msm8998-dwc3" for msm8998 SOC.
>                         "qcom,sdm845-dwc3" for sdm845 SOC.
> +                       "qcom,sc7180-dwc3" for sc7180 SOC.

Can this be sorted? And can this binding be converted to yaml?

