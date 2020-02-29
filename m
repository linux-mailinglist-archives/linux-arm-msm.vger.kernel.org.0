Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8AB1743AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 01:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgB2ALA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 19:11:00 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42462 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB2ALA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 19:11:00 -0500
Received: by mail-lj1-f196.google.com with SMTP id d10so5235211ljl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBJm70vbCm0LCgNvDsCCsjTJ9PBmdad0nZhpwK5OW30=;
        b=BA1m1yb8EjVa87IwqexlqG9YD5+1FxdNi0fybLqKTY1lr+JdaGhoGz1NnCbYNIuD70
         C97Mla/aSciSFJD84HLwuF8SH2rrgCGGGpmX7Sr76vnrhQw91k88N2suNg/2Qy6dsSBH
         wanttyosuVCvZi1KMU6VIIXDAxBgXsyUJKUQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBJm70vbCm0LCgNvDsCCsjTJ9PBmdad0nZhpwK5OW30=;
        b=gHKVf5VB4As7quNdglg8MUc+KbTM8DTKHs3nUWSQMoPYlmXleGokgi/7rzbY/fK82t
         /oyDGIZcfjJAcW/3B9f40b6IZEi4adMIImUU2khwgGXcbDbeWc9+o+GPptAqdQAeXukv
         f1eq3Tr0OZhdmEJ4GccUzHNQrwkp1qRg9C3EUNUbuN7S4JVYN/2qpINpuq8dvOBehOnr
         /JcmnjS5DkMZDdMwWyPf42axnoT1r0a53e6GcvMLrPbT3VozrbBP/pndtoKZ50bgcqk7
         qTJLrMwMso6HsdJ5F2DClS2qHJMfiTtsM2q8FsM0frSb1azwO8bymTOGQKhZhycTWK4J
         RVwA==
X-Gm-Message-State: ANhLgQ2+lwZkkxt3JWMrVyFXTHU/4yUn4ctPeDMtCbkFD9GGIh7N627A
        gUOwdEXJgNMWsVi79JZQJK1o7zDzRNM=
X-Google-Smtp-Source: ADFU+vtlIFwE6BdiWoDdDl1wv1sF3auYf4RR+sm7Kn7/MJwNPdRH7F+UjgiFn1USUL4gJfL8U3n/BA==
X-Received: by 2002:a2e:a490:: with SMTP id h16mr4381418lji.115.1582935058078;
        Fri, 28 Feb 2020 16:10:58 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 19sm5815294lfp.86.2020.02.28.16.10.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:10:57 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id v6so3347077lfo.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:10:56 -0800 (PST)
X-Received: by 2002:a19:691e:: with SMTP id e30mr3855069lfc.104.1582935056422;
 Fri, 28 Feb 2020 16:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-6-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-6-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:20 -0800
X-Gmail-Original-Message-ID: <CAE=gft6bFOMaX_iCVogWjD2+8Hs3prBJi4GYA=KUPRK1M-ABgw@mail.gmail.com>
Message-ID: <CAE=gft6bFOMaX_iCVogWjD2+8Hs3prBJi4GYA=KUPRK1M-ABgw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] interconnect: qcom: Add OSM L3 support on SC7180
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 2:57 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add Operating State Manager (OSM) L3 interconnect provider support on
> SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
