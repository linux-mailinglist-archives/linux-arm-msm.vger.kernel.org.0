Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AC01743B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 01:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgB2ALM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 19:11:12 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42470 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgB2ALM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 19:11:12 -0500
Received: by mail-lj1-f195.google.com with SMTP id d10so5235587ljl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soF+XNnQcRWH9WEz1Qgu4eyaAJkJ/vm8FJWGg8joEIc=;
        b=drg6vS1hx18eHnCXRrGQ5GLjEMSfmRY2PzYoDE87GSE95WIYLG7hgVQOgKgWgEMx7c
         LOHkgLrdw3gkZ3Hk/eKZvKgsDNviOJBFj0KDVjzmy4tqsn1cSTTTArhz9NFzVmXYdsTH
         OkA3PEYdCXfvsW81Rl0F3v88UAMpEPZ+txtnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soF+XNnQcRWH9WEz1Qgu4eyaAJkJ/vm8FJWGg8joEIc=;
        b=bk+JcjsLwD7hkH6CN9M8jMkdiTul30CBmYw5X2P7Ip5qQkO+7F3EKIcchoUzfTd9Se
         6sSLqclllg8vmaHw8B4Vm0PDncwIxebKj3NC4BhjC0ZZHtLwNQlsc6wh3Vqq32mbpbuO
         od1ngpakgB8CndzyPLF2ib4WlKuWcyfbkNPJwjbGuxO8Ei7gW6j0CQIDYxPjuXUYVtMa
         rAzvd1z+TrIp+3PPeRVm5yIx12MksDn9L71NYTrQ4Q8gA0bS6FmsfC+6jSG7FIJ4684d
         c1kiV9g8GYW2iYCzs94wUVyYXEwfdzkRULeHk5OGqBfQUflHrThZM3HVkgGnwPOigySi
         qdHQ==
X-Gm-Message-State: ANhLgQ3BHkGDPbFgHIAg0zvuj1rJiOBZmH4Kj/xJw0xYgwho+kXaCh3W
        u5TH7QLLcX5jsyGJOXeu7L+jElbgG10=
X-Google-Smtp-Source: ADFU+vtRvjnz2opOIvO98sIPzha82oPFtHODddAgTmhM/J4HBkgg/V2da54axVYfPad42uHQC43amw==
X-Received: by 2002:a2e:9a93:: with SMTP id p19mr4445491lji.177.1582935069508;
        Fri, 28 Feb 2020 16:11:09 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id z8sm6696292ljk.13.2020.02.28.16.11.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:11:08 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 143so5260241ljj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:11:07 -0800 (PST)
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr4350118ljg.3.1582935067385;
 Fri, 28 Feb 2020 16:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-8-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-8-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:30 -0800
X-Gmail-Original-Message-ID: <CAE=gft7=myM5gYLpuTA48BeUiwwN=Sk157LGAQ_nuz8fi=t0mg@mail.gmail.com>
Message-ID: <CAE=gft7=myM5gYLpuTA48BeUiwwN=Sk157LGAQ_nuz8fi=t0mg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sc7180: Add OSM L3 interconnect provider
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
> Add Operation State Manager (OSM) L3 interconnect provider on SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
