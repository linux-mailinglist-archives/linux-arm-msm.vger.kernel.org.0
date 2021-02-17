Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930BC31DEE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 19:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbhBQSLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 13:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhBQSLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 13:11:48 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49768C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 10:11:08 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id d3so10205269qtr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 10:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kp4C7XkUvCKkyitZt4af77Yjtt5rxtynt/7/UUrqttM=;
        b=nWcCk8KtzOPRqRHRUrSWpGb507dYh0DntRmO/OKj0eEmS0h3E5g/bGVFgzEc+45cDM
         MEbpJL6cB+23N+JX9+urTWpY9AEibOipxoT2vn7PfKipnJgFERAArVtTYF2xw4cf5d3i
         am0xiG+SrEvhqBJ1+JYzIxGqz4bcFy9bHAsvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kp4C7XkUvCKkyitZt4af77Yjtt5rxtynt/7/UUrqttM=;
        b=bzdBbviSmTdfT0whz0DE3cDKKPbV8j8HZPacgak4mwjlU2WtyzVTXwMnp5G4RsGNeo
         wBBum3zGVNWQCK0PNTCqnIQNnB1KXvTBR5hg51rkn1rrbitAxlazxf05jECIuLJ1Edk/
         kteINkbqtTGUO8tF+32VYHKDzqYKHvTBDIvsbrTNVx35OWkv/IrHEBS5OT+lrV5lm3p1
         s/h8Mx5qBlnva462Q0OL4XmnQW4fXQzzFoBZX3X7hAFS2Rgrk6vTHotb3Ex00H+O6uIE
         xXtvUJ/jfjT43iKvETrzY7+CIHoOXJJ9uO5bZ8VAGqcTVpCvyVsiqxr+XfeM9pxCkyZS
         PzZQ==
X-Gm-Message-State: AOAM532AecRplCTJgLALN1x2eovsoMtSDDPTyKSNPURY6rjnWOdp/igk
        q6gNfyCKL90SIX2GNXKNN66opzQN8YLlCQ==
X-Google-Smtp-Source: ABdhPJwZbgmDTj3w9rImOA9zfaTkNhGwfJLNoNAsbG5AQzge5V/3aBYN8GUJgP4w8auEiMlguoZbFw==
X-Received: by 2002:ac8:528f:: with SMTP id s15mr457716qtn.355.1613585467375;
        Wed, 17 Feb 2021 10:11:07 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id k8sm2076691qkk.81.2021.02.17.10.11.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Feb 2021 10:11:06 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id u3so172237ybk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 10:11:06 -0800 (PST)
X-Received: by 2002:a25:4fc3:: with SMTP id d186mr774185ybb.343.1613585466302;
 Wed, 17 Feb 2021 10:11:06 -0800 (PST)
MIME-Version: 1.0
References: <1613582792-5225-1-git-send-email-rbokka@codeaurora.org>
In-Reply-To: <1613582792-5225-1-git-send-email-rbokka@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Feb 2021 10:10:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vcijx0CCSnJuDM1evGqaa42Sf4BURyVeHt0RnLX+ai8g@mail.gmail.com>
Message-ID: <CAD=FV=Vcijx0CCSnJuDM1evGqaa42Sf4BURyVeHt0RnLX+ai8g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180:: modified qfprom CORR size as
 per RAW size
To:     Ravi Kumar Bokka <rbokka@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 17, 2021 at 9:27 AM Ravi Kumar Bokka <rbokka@codeaurora.org> wrote:
>
> modified QFPROM controller CORRECTED region size as per RAW region size
>
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
