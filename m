Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6381832267A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbhBWHj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbhBWHjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:39:12 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83139C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:38:32 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id o38so11846890pgm.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Uq7G+VtpoQoqq71TCIjSx9Y9sX/Ug87Got6NSD0YuxI=;
        b=LzwLVnx8KjWDAsLm4xqzxKT3Poi8GdKTRa8S+7YQDV5NNCntisjIVrgX6BgeAwYOvB
         5sm/YEGemxySQ7cyoLtaQ5DrH1ZccFbgA5PfIVT25r4t/xwlmnlW3oDpuemuESHguTaE
         63nqwq4qbmRFrDpvuR39eGD8vFVZknZGt3IEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Uq7G+VtpoQoqq71TCIjSx9Y9sX/Ug87Got6NSD0YuxI=;
        b=GTHgk6UFyhOhB+QTf60lsJM22TCZoOYw7zPDkFlX/ZhGe+otAIJqRYJ1+C6cfeUeLi
         agcKuxBEYBv5UFqTvO3aLDjy4NNrByudT0SlGj/IVa9kGmGd9yYsKz9vPp2boCcPfJw3
         TVedjzHtHb/Apj+3lS8D62jJmHecr5x5t3UDyPyAyXj/kz86mGsOYnf87fO0+42ow6vc
         vz2iflIoxUdySgFbVZdSUMohaXIU/6TqE0gUu2JlyAmxhJKu4Smk7ixWPo2OF9raZgSW
         0Jj7cztBEuRdPmMV8MtwzBzG7p2558Pe3ZZrhIuuZ6CwSAHhH75jAGY7Nd3b4aJlFiDp
         g1PA==
X-Gm-Message-State: AOAM530O72efRWbX/l41xQlhZ4o8K9e4cDb0UH5XHQsE3DihlXBl3ukL
        bSJ9zKc+SiT+dRU7h+QYsc+5CSKVG77B5g==
X-Google-Smtp-Source: ABdhPJwLqtN8OE/Z3RkI+XzDBNdrUeDNeIBS+X4//zAsKSvkh8WqXsnQw460Q50eoopo+QLxJYvdhg==
X-Received: by 2002:a63:181e:: with SMTP id y30mr22526423pgl.324.1614065911870;
        Mon, 22 Feb 2021 23:38:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id e15sm9520691pfl.59.2021.02.22.23.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:38:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-5-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-5-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 04/13] dt-bindings: qcom,pdc: Add compatible for sc7280
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:38:30 -0800
Message-ID: <161406591008.1254594.15135311472143997847@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:41)
> Add the compatible string for sc7180 SoC from Qualcomm
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
