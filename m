Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28AD47E5F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 16:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244332AbhLWPqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 10:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349085AbhLWPoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 10:44:08 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B0CC0698D0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 07:44:05 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id i9so1257534oih.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1fwwSdyPDmJrjBqvgfhWwK5/B7Z6WVD41tKc+tzuI9Y=;
        b=dfU8NCEFlprLJHJEnCF6GvLWjBULr43g9OU81r0AUa9LnF5soLHnnoLtxdr8XONYSH
         C/RYV2mnCnBOKX8CGIb8QuE7kZx6jLyD1YV1fLS2L7aFzCwbD69oB0U7aIgcbXNpP46I
         +ReOE0AdcG8IMWnbJoVE0QUaHbaG65dY5qafFidaGCrazhXNSQXMYzbkBeDevFlbxlMV
         I6Vg4tviMMWeEtxI36zdQYyr3mRxOOLd8Pvjzq+DJojdMdV6ZRxczrDmxcP4gA2TtvFF
         RwfstC2ObrYklB59q0m2SSrlZsecOtXx93uleV3cIvJJBeosm+c2kG3epevi6hfc69SJ
         US8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1fwwSdyPDmJrjBqvgfhWwK5/B7Z6WVD41tKc+tzuI9Y=;
        b=BrQy6PvCaJ+brnFuuAykvyAywwXeCqg+bQG13vi11+yW1LHmv41UMw0Y1uvDtnqkI1
         X/Ngc0p8+yFBE/cVvlQo9Vjxxg2vEmTZO2pyUQSZxTWIvmzhLl0WfRskkdIjs8BTbHq6
         VoGPloLJopE5OF0+LY9xYAYFc4xRdDGHYsBKC/N2vJbFfo9HQH6BCRF+m2jDz2VHjtkd
         fZVgO2gR+qIr1WsQA/7WpJ7lmfTnh6RT5tixMtoYvXh597PNpl6m2+0gM/e0h0O1V4Af
         G+ghQXKk50J8L/3CsoQNyGEZjpNUFUZCsE6NlRUfXWay+EEoLzOmKDjEnyeJyVx+K0GB
         eCSw==
X-Gm-Message-State: AOAM5322VcttRBIuss/7427oUqQohDXfANOPLzBHpSI2W2YbLrT34YIn
        v15Sj3NA6S8a6BrfbSFDFF66xA==
X-Google-Smtp-Source: ABdhPJxpfqDKnPz1DYcgUZ1ElZ07nh0if0gtDDDecukFbgK146Ktyx9xjHphpVLEvAsxxRcKVDyH5w==
X-Received: by 2002:a05:6808:aa5:: with SMTP id r5mr2081321oij.119.1640274244080;
        Thu, 23 Dec 2021 07:44:04 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm1055762oil.6.2021.12.23.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 07:44:03 -0800 (PST)
Date:   Thu, 23 Dec 2021 07:45:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@linaro.org, olof@lixom.net,
        quic_vamslank@quicinc.com, robh+dt@kernel.org,
        sboyd@codeaurora.org, soc@kernel.org
Subject: Re: [PATCH v3 0/3] Add devicetree support for SDX65 Modem and MTP
Message-ID: <YcSZh8racQsDiF5O@ripper>
References: <163960723735.3062250.7838330411965052999.b4-ty@linaro.org>
 <20211223144407.GA6503@standask-GA-A55M-S2HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223144407.GA6503@standask-GA-A55M-S2HP>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Dec 06:44 PST 2021, Stanislav Jakubek wrote:

> Hi Bjorn, it seems to me like a patch similar to Patch 1/3 was applied
> some time ago, see 61339f368d59d25e22401731f89de44e3215508b, and applying
> this patch has caused the compatible to be documented twice.
> 

I'm confused to why git allowed me to merge patch 1 without complaining,
but that obviously shouldn't have been merged twice. Thanks for
reporting this!

Let's clean that up, would you be interested in submitting a patch for
it?

Regards,
Bjorn
