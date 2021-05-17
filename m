Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C94382596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 09:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbhEQHpz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 03:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233981AbhEQHpz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 03:45:55 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8729C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 00:44:31 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so2373303pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BmyAPSBcp6ivS+9TyqBZQ5yA7tqjZtxesKthFj4GpYo=;
        b=fThrLv2rhCxxqmIjSMdgh/cOn73EdSvryUF20qwoY1sCFMWPdbzBA88IdpP7aqyHz3
         x6Vfqwz7nTLm4umkVavf441onvNcieQ59TWwVZSUpF5stY4tVMcKhQmo5FaEDuvQyVCf
         VbWaDVBaJH7h+subdoTVCNVWfWIKqeo09wIfBafVPTpceJ9D2Q481oBOd+rBh/TVdxI7
         1ZciWZfDl0p/vqF93kZe7mUEWx+zacAbU/3nTPI2AOYxw555K0tb3NDYjTnNZnSSxQMT
         iEw/5acIxKl1iqsNGbRF6GdWqZwfuv7kilDvVhqALEX8CKsNpxWyFw0f6rHMxL0MqKw6
         UVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BmyAPSBcp6ivS+9TyqBZQ5yA7tqjZtxesKthFj4GpYo=;
        b=o4oJPGu8b7Lb/canrBfp9BJ1uYJ0eSCitZyYlX13znp5VCJvDOqRAUN0U8eqb7NOFs
         PFq97TkxHHaSWyx7zD4JC6wvr52mYE+D91feZxXRec/cqCPCRbpZy72rgKAh3bRaT+4J
         H+1kQKHQ8hFh3cghEL/kSVLpA1I5RR/wLmYdwNtG14DHh6N7toSwY9M4Nfgy/n09mLxd
         HXqcQKpFwgKdvXR3J9eNrssN5kbwHllYa5zGNQ1XNLyP/aysH3x+KWwzz5bmvsmJbfKm
         sIBr7LUdd4JzR+kDBL2sFuZEItlj5KRNI++0pp8YfTF79w6OEwGjXmyosv9gjzrj4tfw
         tAEQ==
X-Gm-Message-State: AOAM533/M3KKFsnFXHI58WhF5OX5TbIgmJuplTt5uTdmnRGbYEhn3Y50
        YHPUA+5TY55WzlDzt/mnYM3ZD41unu7WMJsrtdYGNQ==
X-Google-Smtp-Source: ABdhPJwfiACmjdJjC8jSp5TMgFmy4sv+ftZZjA4x0n9mAGTcS+mHFvCm1uJKojvtzO7DRMliRGgduTB4arKi3xkLRPQ=
X-Received: by 2002:a17:90a:c096:: with SMTP id o22mr26037655pjs.231.1621237471208;
 Mon, 17 May 2021 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210513175518.6023-1-jonathan@marek.ca>
In-Reply-To: <20210513175518.6023-1-jonathan@marek.ca>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 17 May 2021 09:52:55 +0200
Message-ID: <CAMZdPi9-gS8sWLY1En+-LZX0YsdOPUeWuiXCH6LSOih5MP7pUA@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: add sm8250 compatible
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:QUALCOMM I2C CCI DRIVER" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 May 2021 at 19:55, Jonathan Marek <jonathan@marek.ca> wrote:
>
> SM8250 CCI is the same as SDM845, add an equivalent compatible for SM8250.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
