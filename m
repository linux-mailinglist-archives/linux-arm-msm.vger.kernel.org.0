Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C8F172A7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 22:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbgB0VxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 16:53:22 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45853 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729661AbgB0VxV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 16:53:21 -0500
Received: by mail-lf1-f67.google.com with SMTP id z5so520939lfd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akb/fqWb9RAKIbbLYDDh8qkuoGYS5G+iOCImBrzoF9o=;
        b=TMG5VflR3I+CGPW+mSXF7fJBlkIgbvu1pHHgkcCLliyNx/65WX4EateAFJ+aYYIZTw
         c3laEpZS9R7qXtce7smYE4n1H0nZi18snVj03jIXMRsHgoFOyMPcwQBWb+g9rcCNCD28
         PdCGEoz3ivKvIuWNhKqTW1465oIKHlXJl+83w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akb/fqWb9RAKIbbLYDDh8qkuoGYS5G+iOCImBrzoF9o=;
        b=Ky7yS9rH8+AzdDKT+tRDf37VKXHqQgsLgBKnvCEnJqOS90ECxaGoefMO66AQlux008
         bl03xIqAMmxDchD7DTPJ4238urBuDLQD2Dj4uRdKX40k4/Mo82ii9R5bGMMQmGO1xwxP
         sbmG1QeyBz1Pd/X9iC7GtBRXL8W4CH7jRSXGovSNEM4beFOsz/7dwYq5gz2VfH22MeG+
         zEr0/I5TR1B327Y7e3uUM9jby0ikvJbLfTicfWg5dPOh/g/T0sVTtmc0geFag1JCc3Th
         l5iA9EQdr6aRGB8kM+AAoH5fYFEyWaHVwkuUbEfnpy0wtiT0s+FrdtXPe5TE0Lig1Kv4
         +Oww==
X-Gm-Message-State: ANhLgQ2c65W2vJavzyhyEpgImAxJ4ExhWxqNO3NuhgOzfbUoG8vlvDOO
        TVafGwRdVAXQkThTVKt27rM5k9yGWO4=
X-Google-Smtp-Source: ADFU+vtnWbQHcaXDtgam1h48391ZbcxZsCTf3KBCzJAkLL1ueR1BMWmZR3OffHgfjipYji94c9nATg==
X-Received: by 2002:a19:3f4f:: with SMTP id m76mr792811lfa.63.1582840399492;
        Thu, 27 Feb 2020 13:53:19 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id b17sm3452785lff.79.2020.02.27.13.53.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:53:18 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id e3so935670lja.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 13:53:18 -0800 (PST)
X-Received: by 2002:a05:651c:1a2:: with SMTP id c2mr734150ljn.79.1582840398185;
 Thu, 27 Feb 2020 13:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20200209183411.17195-1-sibis@codeaurora.org> <20200209183411.17195-6-sibis@codeaurora.org>
In-Reply-To: <20200209183411.17195-6-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 27 Feb 2020 13:52:41 -0800
X-Gmail-Original-Message-ID: <CAE=gft755hYH7ue=fv2jvofejoWHZaguji6D-M1qHup-3SJTwQ@mail.gmail.com>
Message-ID: <CAE=gft755hYH7ue=fv2jvofejoWHZaguji6D-M1qHup-3SJTwQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] interconnect: qcom: sdm845: Split qnodes into
 their respective NoCs
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
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-pm@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 9, 2020 at 10:35 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> From: David Dai <daidavid1@codeaurora.org>
>
> In order to better represent the hardware and its different Network-On-Chip
> devices, split the sdm845 provider driver into NoC specific providers.
> Remove duplicate functionality already provided by the icc rpmh and
> bcm voter drivers to calculate and commit bandwidth requests to hardware.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
