Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0B036D45
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 09:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFFHZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 03:25:17 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34140 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbfFFHZR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 03:25:17 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so572274plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HPvBPBVMaGSa/zB6ZJwA0LCVSOOo7DC2+M4V383+koE=;
        b=YqYjs36xGAcQq6oProJyN99xewoE3Gp9dUzg5pvrKQgZWcmXMPyycjleWh6eJ0I3VM
         6YwbWdPuIHoaW1cljaZDCqzRhri6ADFOnZ78uroxzrdwpZ4ut0oxPb2Ylw1SVnIiYJFn
         7SMYhRQz/85vXnJoLBwwz26mrOxvHO0XG3T+MdCiRVQrvDOa+k5ZuS/Q8U/liWv0L1cz
         iKeSua4sUqK326obz9Up6o2HwCqRiRAnxHJv/KP+keyali2BbIOOaVj5y9X3q/Usz6Au
         aywDLpB6RcMyoBnUuKDfQi2y97cztibqZ9MXXPcXf8xiFfxfE58l+VGxG9J8IbbPT/sd
         8LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HPvBPBVMaGSa/zB6ZJwA0LCVSOOo7DC2+M4V383+koE=;
        b=lyFKsPpi2C1SfwRcm/9N4EjQ0zoWHKVUJm8R9GVD8d4kxchZyt8DA+26Z+Ddna0Ur7
         mAZddfo7iNrIVmY/NLnAM7d0PCdPcEA30th2RlN4FHHRkS+gI94QzgkwMJiq4IVuG7ty
         0kE/hMEL5RCeB3/avZyuZzeD6QuMqICgYaafN4riUItDbjR2JNToJcQYi8lhVsuDIpYy
         EkqEioD/D9UX/bIZhXTZ7AbxAZosSQIRfIXJcDck8/JhRLgfMBjqpZclaJYs2/qO9JyV
         ll1Io0BbzLPAxjhUEBZprRlljAswe0DruBHgcDpWk5fjvKegiDlgpEK4nSw5CMii4S7p
         ACWA==
X-Gm-Message-State: APjAAAXgTN1L3y2c0J/aMPJGmK/mj+wt+azBtXHUi63PGQEJaQlRYNON
        diEHLjmm8F+ZjHawkygH7ecXvg==
X-Google-Smtp-Source: APXvYqzfbpVJA69MZdz+/1GgtiWjtGcWwvPJtbzUDJzAbhae7fYlJ98zQNMenG1LomSBTtQg1H8vvw==
X-Received: by 2002:a17:902:d70a:: with SMTP id w10mr41023406ply.251.1559805916729;
        Thu, 06 Jun 2019 00:25:16 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a25sm1053735pfo.112.2019.06.06.00.25.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 00:25:16 -0700 (PDT)
Date:   Thu, 6 Jun 2019 00:26:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org, david.brown@linaro.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Lenovo Miix 630
Message-ID: <20190606072601.GT22737@tuxbook-pro>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160616.10017-1-jeffrey.l.hugo@gmail.com>
 <20190606055034.GA4797@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606055034.GA4797@dell>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Jun 22:50 PDT 2019, Lee Jones wrote:

> On Tue, 23 Apr 2019, Jeffrey Hugo wrote:
> 
> > This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> > functionality includes USB (host), microSD-card, keyboard, and trackpad.
> > 
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 278 ++++++++++++++++++
> >  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 ++
> 
> What's happening with this patch?
> 

The thermal-zones are wrong, but I'm okay with an incremental patch for
that...

> It's been on the list a while now.  I'm waiting for it to be accepted,
> since there are patches I wish to submit which are based on it.
> 
> Who is responsible for merging these?
> 

...so I've just been waiting for a conclusion on the HID patch before I
could pick this up.

Regards,
Bjorn
