Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F20188B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 17:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgCQQvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 12:51:19 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42510 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgCQQvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 12:51:15 -0400
Received: by mail-ua1-f65.google.com with SMTP id v16so7172886ual.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+4aJa7IpjGZCPI3Fh6cthpiIv4IQ9AsMliiqsg2mts=;
        b=YkGBAuYA3wpjmbt2VnCUIMI0xJVISAM2HQ+4vpw4N5qYFuYvkK/XDLG95zf96seDTj
         JLTzADnRCAjLkajykdhv5TBY+UyCAAt4Fg0/W1SluewltWU9Q42ysjJuhoOH4sDheabF
         gAhRDlrX3PZyU1wGBAo+zTG5FaY2a1pPsQWXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+4aJa7IpjGZCPI3Fh6cthpiIv4IQ9AsMliiqsg2mts=;
        b=iKdMapPeDedjBibeRJ7pboFQF9XQg6Kvt0D0nfxvgEIYV2qtXLEuCkGR6FW227EFOK
         LiHj8k055SgIAT3mc8/BvttQWo8DT9TiC/7A7KzqxcownCWhdMfqFRazVJxm/nHrEHr7
         0sMk2DmsLTFHpQZXmWc4JttAqRc4iZ9IQ2ZGY8VUc8Xtq8s/Ex88nWz2brvyaYVWZywI
         l9e+cvokr/zYqydKDA6scOuYxibRKpXaR4KblRVdo2eDRoENvvJR5sxxclGingLV82zl
         KElN7cxQo3J3b8T0YKuo0o2/KDmxWbmAQYGDmy+4jDUoVGZOVHw7B/Cqmdb8uFEmo4eV
         HfeQ==
X-Gm-Message-State: ANhLgQ3tf3CDV7EiNt60ZV1EyTT4rpMMvBk1DXJo7OU9L4zwnqhPlb1/
        RpE8RQ3xEIsGrUUafzcbVhIM+eHBC7s=
X-Google-Smtp-Source: ADFU+vuENUxtUg8dOvVwMindZI5oIl1bbqTNiUupTc9jQXMAPvYRneIbl6JxeSCSbz9huLzCP2Qdxw==
X-Received: by 2002:a9f:2848:: with SMTP id c66mr4129566uac.70.1584463872983;
        Tue, 17 Mar 2020 09:51:12 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id d8sm1697611uan.13.2020.03.17.09.51.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 09:51:12 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id g25so4763947vkl.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 09:51:12 -0700 (PDT)
X-Received: by 2002:a1f:2305:: with SMTP id j5mr155171vkj.40.1584463871622;
 Tue, 17 Mar 2020 09:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Mar 2020 09:50:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLZ4RQQuji=1kKE5EnqrpY0M=U_G8XigAWAaZ8mxc=eg@mail.gmail.com>
Message-ID: <CAD=FV=VLZ4RQQuji=1kKE5EnqrpY0M=U_G8XigAWAaZ8mxc=eg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Changed polling-delay in
 Thermal-zones node
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, Sandeep Maheswaram <sanm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 17, 2020 at 12:42 AM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Changed polling-delay and polling-delay-passive to zero as per
> the requirement.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 100 +++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)

It probably wouldn't hurt to mention in the commit message that this
is because the thermal sensor interrupts are all hooked up and thus
the polling is not a useful thing to do.  ...but other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
