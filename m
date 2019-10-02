Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E89C4A68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 11:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfJBJTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 05:19:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39163 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBJTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 05:19:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id y3so16345077ljj.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2019 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tVSJ2jAoznxGAzqn26lJBhesiJu1w5Ef6wI0S81yyRk=;
        b=jKs7U8eJtyt8NgsziFv8n2P7AhTSuJcFBcqGRBUvcExepU97UzP2Wvw7Cb67pKcmnd
         KrB5pD0N3yZpRTOabIqWJ59k0YqmLz+DRox2nZCVpm1vwJAQsYmZpmLCEvGFaaJAYrKl
         G0RtV55/jXfVn76PY68EBdfTk6WDW91nE19pDZprwiv9nFzWug679df5IYQUaHyKB7w6
         e+PgM7Ph2Z9FaxLvcgcq1oL0eq6ZRG41y0SIqtLLgAZpq7k2IPhnGQxoEASQmXISRmWG
         hSYjSKUUGdUXc8uTxCWeINcTOm2Qex/G0MPRc3yDg+tHudN7F/36D4PpQxeOt08vOxj7
         SjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tVSJ2jAoznxGAzqn26lJBhesiJu1w5Ef6wI0S81yyRk=;
        b=FfINq6hGu8cVgBQXVILqACk9VDMpTa6Jce93zaSRh0hG5lGZhQLPDRt0K1olVN3uK9
         CD8V9u9gCjhoc2nL/ecAkwQpcEewsOmFUYATgCeiKsg2+I1uA9SnYAsLBvYVluFGrRDs
         49sQm0cUe1obxfb7PaEvACCbmzgQQKZ5QcIAiM5S0Z5NgshKYrkbkq5Vn/XSt3a/7lym
         LHu69LGofHpAYk5undltZS+fUk/QDbYuRRCDbMx+VhSWMwT8Ofr+Lv4hvQTmP7aXN+WU
         Pi74MmgfLux/loQJm8xQgbDcQjGwB0DhwZKEY/MofnsI5ub1uBmtsHWCR7ekwQNru1Y/
         1/Zg==
X-Gm-Message-State: APjAAAWl98tlCQXMj82OIWF7MgAiTwelRkAGKUq0/up26E5FjZ8RrpJS
        3tdlu61lZJ4dkkeeDyvYNP4xNg==
X-Google-Smtp-Source: APXvYqymQBg7OLC919RMbl4ByhwTyA3wxtAD9d6h05l4XMtE9CFbi0q3M5PidVl3u9R56raNCFXmdg==
X-Received: by 2002:a2e:86c7:: with SMTP id n7mr1645273ljj.227.1570007993519;
        Wed, 02 Oct 2019 02:19:53 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id n2sm4593350ljj.30.2019.10.02.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:19:52 -0700 (PDT)
Date:   Wed, 2 Oct 2019 11:19:50 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sibi Sankar <sibis@codeaurora.org>, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
Message-ID: <20191002091950.GA9393@centauri>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 30, 2019 at 04:20:15PM -0600, Jeffrey Hugo wrote:
> Amit, the merged version of the below change causes a boot failure
> (nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
> enough, it seems to be resolved if I remove the cpu-idle-states
> property from one of the cpu nodes.
> 
> I see no issues with the msm8998 MTP.

Hello Jeffrey, Amit,

If the PSCI idle states work properly on the msm8998 devboard (MTP),
but causes crashes on msm8998 laptops, the only logical change is
that the PSCI firmware is different between the two devices.


Kind regards,
Niklas
