Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEF211BFAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 23:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfLKWNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 17:13:51 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36937 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfLKWNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 17:13:49 -0500
Received: by mail-il1-f194.google.com with SMTP id t9so244058iln.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 14:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WK0R3vgtayVNUB5s3/ppzS6WIJXfYbPpsi6siOolE4=;
        b=d5WomvyX4tnC/dQgAK832nGB1Kl75yZmGi7AihNVzJoCrM+aW4Ie3qCVKGeOPc5KJm
         snJvRR06tTFUg6q/r4CpZg+XqLsV0mSiWfTAT+ctzmceBh1B3nzgA92CF4cf6SHIA3h8
         ov94DUQkYXaaarV15MIN98KM6+XFZCUv+7GaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WK0R3vgtayVNUB5s3/ppzS6WIJXfYbPpsi6siOolE4=;
        b=YQiMHC5XO60sn41MKnkyWvHW09d/bDLtWsaqSBO4Ktt2Gqv5eqV8gBzn+zrOFi365n
         31R2rbPswnlLexOAuHXtwOmmnX/ABNVgfEBS1NSoGlbpLu5I4P7i292gpmtSMoy2p101
         wBMNCLpM2iBrB/scio8LRQKI9mtLIMLY9Ma+8GrrsNCa1vWXtX7EDMqLIEi0FjDa/B5l
         QBpjHYIsuz26Z3DU6l/rH/QDR2ThwpFgficmTehIIW5/zUP9ZXwx9He2z6yaArvkC52H
         WhNKhPNVkRzWRR2gweuID1VsdN5d+iv5fuYlZVXC2ggfj0nnHhTaS9HUrosCt7SOuSwj
         RG0w==
X-Gm-Message-State: APjAAAWcjY9kI1VP+GDyHT0ssF/2Y4acFF8VKPNK7ek1G0u4BTN23vl6
        RBukmlgKSklpZ7XFtls/UCm8lLcW+Os=
X-Google-Smtp-Source: APXvYqzjZJRqsJgrTz+8sZMYWcjH7Bgv3td9w4VwXal9ajpqzVoQVpdl2gttHEEsO4vrtbN+G5uQLg==
X-Received: by 2002:a92:980f:: with SMTP id l15mr5243712ili.152.1576102428971;
        Wed, 11 Dec 2019 14:13:48 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id x10sm793214ioh.11.2019.12.11.14.13.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 14:13:47 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id s25so543749iob.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 14:13:47 -0800 (PST)
X-Received: by 2002:a6b:5503:: with SMTP id j3mr425338iob.142.1576102426904;
 Wed, 11 Dec 2019 14:13:46 -0800 (PST)
MIME-Version: 1.0
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org> <1574940787-1004-4-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1574940787-1004-4-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 14:13:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XWsN72pvtHubq2UOgvm6oPs2s+RA61ct5XPGsBDbA13w@mail.gmail.com>
Message-ID: <CAD=FV=XWsN72pvtHubq2UOgvm6oPs2s+RA61ct5XPGsBDbA13w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 3:33 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add compatible for SC7180 in usb dwc3 bindings.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
