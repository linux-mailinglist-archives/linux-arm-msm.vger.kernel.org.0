Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9D135476A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 22:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240584AbhDEUP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 16:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235370AbhDEUP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 16:15:28 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA21C061756;
        Mon,  5 Apr 2021 13:15:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r22so1343748edq.9;
        Mon, 05 Apr 2021 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=fQ2s4W7r9chKOhnYE/CqB2tCGA5ys6r+UFVfdVRFK2U=;
        b=Avb8jAbDDSH32P/fisjb1Uv4YixdK8vvrkeuP1yRppo9CH5oyMD8i1ssS3v94qq3fV
         B69fO5MyeRaq0u+ef8ef8jf7ZAs7o3afUINJSr5BWO9TkIMI1ID5VpQkvrjmP0ronlmP
         4gEhQR94h/SfHw9h/6s5fgQemcyfPQnOtKq2MMlMupKOjCwNqZ/utO44A2oN2u1ziTMu
         yVfOfQWino2jiMRg1aO6VYXAOBq5Dh2k8iU5VGd76T8BnCiAa/ykhfdGP1QbPkiV56Ad
         P32SxDtSO1ZrHalbG1WkOyE+LHyD88fjwtxcCH5425MCn5IeH181PJmouYYSCH8JtxQc
         1bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=fQ2s4W7r9chKOhnYE/CqB2tCGA5ys6r+UFVfdVRFK2U=;
        b=M05afqEs1mZEQKxSog9EX/3ogA2YLE80G3nMsuQHeawntRvCE+Ht5YPp/u0rF15TZ3
         VOMEyyY6C0fpD0RcEvih1r25txsHWeBTP9/cZroZIYiEK6ueYaMu8r9lSlSm+B9dWbcQ
         WkmZugkRVcSJLxfGkppH99Rd/FfdfrF2ykFreI2xQ8uUwfij/RXO1eVspMKkm3nXDip4
         Gcv2u7Q6/J15BpC+Q7DCGD8nb/V2XrkAX4hGWsoHwI+ocZH5TfHT85jG6XeaExaXXRIQ
         cu3NPVTlsM0oERptWFbVF+fM6vxKQtQh5LnxbwPGHKS/+FaK04VHTMLW6Ne9WZZXP6+l
         PN4w==
X-Gm-Message-State: AOAM532SdKWi8cdaPd7alkfDICJUYU2rjUS8VYow0JqwfOTzR86lSbuo
        4bVLLyfa+jvlVtz0WjvPWf0=
X-Google-Smtp-Source: ABdhPJzeWO3thyBxka/HUlwzUcxS2cN8yHiBCHQUTRVU122VvcqeQC7L9/1hwM56w0BhX1aEak+nTw==
X-Received: by 2002:a05:6402:74b:: with SMTP id p11mr4656046edy.40.1617653719895;
        Mon, 05 Apr 2021 13:15:19 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id x9sm12042906edv.22.2021.04.05.13.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 13:15:19 -0700 (PDT)
Date:   Mon, 5 Apr 2021 22:15:17 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YGtv1YsUdB/lSgs0@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <CAPybu_2_iCHO37PfQhu8+6WrSb_VMXgGzkiAhw7+B-wLOd7GRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_2_iCHO37PfQhu8+6WrSb_VMXgGzkiAhw7+B-wLOd7GRQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ricardo,

> Hi Petr

> On Mon, Apr 5, 2021 at 10:03 PM Petr Vorel <petr.vorel@gmail.com> wrote:

> > Reserve pins 0-3 and 85-88 as these aren't meant to be accessible
> > from the application CPUs. Fix similar to 9134586715e3.

> > Fixes: 3edfb7bd76bd ("gpiolib: Show correct direction from the beginning")

> Why the Fixes?

> Is the behaviour different if that patch is not applied?

Yes, the issue was not presented before 3edfb7bd76bd. It's similar to fix
9134586715e3 (msm8998-mtp had also problems after this commit). Feel free to
remove "Fixes: 3edfb7bd76bd" if you're convinced it's incorrect, but please at
least mention it in the commit message, similar to 3edfb7bd76bd).

Kind regards,
Petr
