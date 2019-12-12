Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687FA11D806
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 21:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbfLLUqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 15:46:01 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:33241 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730834AbfLLUqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 15:46:01 -0500
Received: by mail-io1-f68.google.com with SMTP id s25so101281iob.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 12:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyPUkZySLXKgf9TnxUpOyot3YnU8ObDh2XPQK80y2jU=;
        b=LS9R9Sdxzil058X/36VJo8VobbVEGkMn+8e2lKrWNnX0ZwWoWWS/RVEY4XZV1UBYT5
         wPneNbx3H0ThwSxxHuzE+CeXB4Od8e+v5XHcwZOFHzMuh+umqL0iCvZHsV2vWs5kP5cj
         NyU3dRkDVH2rpW4CFkJYN0i8HAff/8TX8yXnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyPUkZySLXKgf9TnxUpOyot3YnU8ObDh2XPQK80y2jU=;
        b=FGQwqNCTAlnyjZ8lul2+Z2nHROk45kpc970/eEJdh6OLcgAspi6z+vezwnCimJzQYA
         5QgBBpUtzWX8qQCwWQab2kmaW6z+aT0LudXjAQLcNDGKyRLhUnviC0eHjLrf958uWAKX
         rvXkOrd4DCy8fLtkxLtKHdjohbwZsGcmKzR5SnQCBewl82Y0WQnu+RG/yRFDZ5RVnbP0
         WM/4YoZt1a3T+Lcwx1SPj1ZK5vnOnkbNBTh3GEY7YjiWoUCRhVZQHE6UAF1txSoCUxOb
         8iOoq89d6SPEs0yprpSj/FTLEj10ljknUQMtQRojdxBomUdI01TKyvyjHssnd0WsPFFE
         ZT5A==
X-Gm-Message-State: APjAAAUGAkELl3kmZc4tnlPc3eRTA3dX4f7FI7XtbhU/Q+OgGimOFmul
        +wmsAXfjqkgPCfpyQ6eZIqKUIiu6W0E=
X-Google-Smtp-Source: APXvYqxITkrwdtnT7oZovHq+VOFJT98P+fVq4hsOoPk/HFATJdj1Ih7qlpPYGus//eBVLxVAIW84kA==
X-Received: by 2002:a05:6638:151:: with SMTP id y17mr9466127jao.124.1576183560070;
        Thu, 12 Dec 2019 12:46:00 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id q62sm2040969ili.55.2019.12.12.12.45.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 12:45:59 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id s2so42455iog.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 12:45:59 -0800 (PST)
X-Received: by 2002:a5e:940f:: with SMTP id q15mr4341569ioj.218.1576183558931;
 Thu, 12 Dec 2019 12:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20191212115443.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
In-Reply-To: <20191212115443.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Dec 2019 12:45:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XD2GKPc5qeMakvW8Ej9-y7n0Hi2qAie-gUM=DJOSv6sw@mail.gmail.com>
Message-ID: <CAD=FV=XD2GKPc5qeMakvW8Ej9-y7n0Hi2qAie-gUM=DJOSv6sw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix order of nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rajeshwari <rkambl@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 11:55 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> +               pdc: interrupt-controller@b220000 {
> +                       compatible = "qcom,sc7180-pdc", "qcom,pdc";
> +                       reg = <0 0xb220000 0 0x30000>;

nit: when applying, maybe Bjorn / Andy could change 0xb220000 to
0x0b220000 to match the convention elsewhere in this file.  That's not
a new problem introduced in your patch, but it seems like it could be
part of the same patch and it feels like a waste to re-send just for
that.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
