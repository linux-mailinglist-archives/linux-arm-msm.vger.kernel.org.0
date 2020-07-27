Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C3022FAE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 23:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgG0VCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 17:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgG0VCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 17:02:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B57BC0619D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 14:02:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so10645468pgb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CnrNkbaFG+mo4svSlEoBObsg4w60j22J8+PYU+PPvCU=;
        b=bRfFtHzX1zVRP2KIqcniBiHeMDlhjIOU9Yqml+WYD/0qj/30U1iKTD6aLjfxsmvsIh
         2DI827NOO8fp17l913ZXVV/i4xiHpwS3PnCguZtL1TWXK73R0bTtoAt0vUlmWNNQN0JA
         cevBggN1G9RolPdsvBl48M4oForqiVBJIFebodZDCHDhTWfzDtoT51+gOExhaipG578n
         Yy8QciRsWunDIqNKU2kIvh8RnsmKMFECTgK04U1Rl941Ysg4/Y82s7KH5j3lWGfMTB01
         5gsGBcJiRJVrXH99DyqKbmTPqenXApD/dl6iOvozpT5JMOvz6kImIUjVDJVyFy/0Q9QY
         CuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CnrNkbaFG+mo4svSlEoBObsg4w60j22J8+PYU+PPvCU=;
        b=rIYOcvxhaYXNvTg4YUorgCnvTkO4F4ZSDExveUpHLRsZuHZ9dQId7UtsAVJaneMsSG
         lYoTEGH+H5PYx0DGEai0KxIUMpsPzR+uDvjD7NrWHYUiLXbMfjxWWCEF1LgLHzqI7pYa
         VaozO2zY8QoXmM07OzXCgcnr9mOUQWlB15ku+4+OTF2cWxehzsh+sUew/IDl4VKI6fJ8
         wJTUH9D3X+ZcTEVENpononlIVu2HjhelDVkrR5o0mem2xBO+uxxZ9TCP5Inp6MbzbqTr
         f+z4zRhdSQyBCPF2u/6ACg+7sbq280Jht2+2GQkzYACpq6JwxGaSzu+fRTTijKZQviU9
         YKgA==
X-Gm-Message-State: AOAM532kDKu+AHs9ZonAACiHsGvWEpbSiLIrB/6eBSJ6racVbTZaAKGn
        hRAe4ycDnO3x99yj1ndU4MtcfA==
X-Google-Smtp-Source: ABdhPJwwmvQE1grbXpKyCQ9I9VejZ9WeQ4E0X7yonbSngdxc3zyray6+GR0huEYUc7zxd8h2CwTOFw==
X-Received: by 2002:a62:fcca:: with SMTP id e193mr22259656pfh.307.1595883727948;
        Mon, 27 Jul 2020 14:02:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b24sm14930840pgn.8.2020.07.27.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 14:02:07 -0700 (PDT)
Date:   Mon, 27 Jul 2020 13:58:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add iommus property to ETR
Message-ID: <20200727205834.GA202429@builder.lan>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <20200621072213.GG128451@builder.lan>
 <f40621b2b01f836a8a97686707599dd0@codeaurora.org>
 <e270acd3f7db076c043f1b982b1efea0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e270acd3f7db076c043f1b982b1efea0@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 23:56 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2020-06-21 13:39, Sai Prakash Ranjan wrote:
> > Hi Bjorn,
> > 
> > On 2020-06-21 12:52, Bjorn Andersson wrote:
> > > On Tue 09 Jun 06:30 PDT 2020, Sai Prakash Ranjan wrote:
> > > 
> > > > Define iommus property for Coresight ETR component in
> > > > SC7180 SoC with the SID and mask to enable SMMU
> > > > translation for this master.
> > > > 
> > > 
> > > We don't have &apps_smmu in linux-next, as we've yet to figure out how
> > > to disable the boot splash or support the stream mapping handover.
> > > 
> > > So I'm not able to apply this.
> > > 
> > 
> > This is for SC7180 which has apps_smmu not SM8150.
> > 
> 
> Please let me know if this needs further explanation.
> 

I must have commented on the wrong patch, sorry about that. The SM8150
patch in this series does not compile due to the lack of &apps_smmu.

I've picked the other 3 patches.

Thanks,
Bjorn
