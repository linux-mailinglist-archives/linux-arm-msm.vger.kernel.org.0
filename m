Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168A533680F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbhCJXsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbhCJXsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:48:00 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A29CC061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:48:00 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id q25so36576421lfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kRvHS9o5dMLT6f5yfgrvrgY38oLudE/U5A4iFNm6Au8=;
        b=iNrRn08C6u6wm9/NWOjycwj9HSvpAmM5+og002MFmZagOZwJW/7mrsRDnTGETT1tW6
         ofpe9swHZzRRGPwfWFG/pgGOlBDYcFDnyxi9fHhJ3SS6ghK+w/ham9nZWPqLc18RH4lD
         tRWZSiEut1qDfamOLDJam2Rn2B+gIUwvVOtq1zGIPnSpYgTYNYlN6e6Yxz7eMGVqRnro
         Ox2Sof2CKCiSwyXXXiEWIzRseCm6nB/7WoEi4mIGNqG1w8Wi2/HBAPf5Ym7+GCX5VY+n
         aIL7DuV6/sbDWbA4uUhog1FBJXkWHaVbpursDstZGbIUdX1ov+MH3m4vmrXgmTYqJqD3
         O1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kRvHS9o5dMLT6f5yfgrvrgY38oLudE/U5A4iFNm6Au8=;
        b=oQeUJJWFtIUJApUPWP+J2tms1FDHBixraXEN5uQZoPjbJctEZKBDr8XjwTxD78vSOX
         nqChJCWuo4cFzmpJ7z61AqjcD1cGz/LBnzL5gQGaEpbOzTJiv8YGjwOg/eWtt5/maXrd
         4KN2KJJWFIt04cg29wPPFcjxVbKB8QrBb6MsXBC++7KR6p7o6rYOO5aBPrnaO65L3JXR
         2cKVCWOyB7G6aa55ao8cSAp3DCtmiMVS/PB/ALGshEV2Qt/QIHuaXU6erTTJVUikJInw
         9GIRzUsnF3Sp1/Wh/LNUNiC42IdTkiH0GfsFlbDyJ3vrdPX1SMcFSnYj7zGVInfuUe3Z
         VD1g==
X-Gm-Message-State: AOAM531mq3ZHlCOnGHa/womwg+EVQ+fQX0wkJOgke9w8hLpkigCHcNnz
        gluMKZKOFQWHMjjwsHpbGdgByPMvbkvI1qp2U4rFgA==
X-Google-Smtp-Source: ABdhPJz0squ0Ye3e/PiQIDYAcOJXAgc8W4xsitrsSru2AMgkDx47v8y6PLZPozsGXf40w2FsskuwPuAGjhSxg9qCrgc=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr571356lfs.586.1615420079060;
 Wed, 10 Mar 2021 15:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20210308164845.3210393-1-vkoul@kernel.org>
In-Reply-To: <20210308164845.3210393-1-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:47:48 +0100
Message-ID: <CACRpkdbOY_ZuL4YwkQy1dCDn_USEDy1+F1EUooNTtkXDU0zBDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and friends
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 8, 2021 at 5:48 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
> PMR735B GPIO support to the Qualcomm PMIC GPIO binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Both patches applied!

Thanks Vinod,
Linus Walleij
