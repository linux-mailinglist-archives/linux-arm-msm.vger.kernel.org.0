Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973A0736CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 20:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfGXSnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 14:43:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38843 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfGXSnn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 14:43:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id y15so21380209pfn.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 11:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qiU1TfBT/KK66R/TOLH5DkaauwA1Q2lRA1rBib8JZqo=;
        b=Ek1BINi7A7AhMjbtrG2l3eWV3rDIsxSJ7uaNLpNZrH2IMmmO2Uekvun1GK8CJiTCnh
         Me3Czt/+vvR8/SoH2HVlIjRTO9TQr7BXiZ50k3jrYhmh7kAcDk+icjL8VDghTfdY9Epc
         WUdyNQ+SFJbCJtDFJeHM/eM/DKweUy7/JWgZ/MfBEKZynUUg4NOB2TqrI+jSWjeOb4qt
         mxieuG0DTD3pcFUQV5GrEhwopopk4Io70FPuxsT8CbWMidQdjfk7iENHqYW8kfgtyZJk
         o9LOgtEfvLEAYGK1thWzXEY7mxJiVcE+WSU7prQV09eZyRX8QNEuuMa2oIM/YaVFN79m
         qQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qiU1TfBT/KK66R/TOLH5DkaauwA1Q2lRA1rBib8JZqo=;
        b=RrYYRDWoEPE+pxBb6hiuRKdS1O4rr8Y/J7ISilTD4rhweHqsq6HwqQwufQGa+9i+gS
         1TBVoYiEU8Ql/6LkVEpzYH4s1LNyzGRIkKghhbYjEzISnhxKwRaR8QZW9UdztmeeCZzu
         SVse+q20q5nATmfl5FubOaul53x9/IOfun3dI2ZyMJ7JgQTtCzBrpLraPLGNG3yfH/4j
         ngbtEkB0voCEmfUQlVwafORswk2OnpaugpZFduSGDnr6lydATMp7n03gVBMasLNVTOR3
         PXWN0krveI1DKY4Yj0MlLLexRI3JqQlx/V46eEQdXTz5RA9YYW1pQRGracmHJJVSQ9rM
         iJHQ==
X-Gm-Message-State: APjAAAV1X3dlEiB6G3bKnYj7ootltfrjeW9Zi2sToa84C7eAOldnlStD
        Ctwpocudx7HmdjO1a6ekPsq9YA==
X-Google-Smtp-Source: APXvYqwZ1wGRNPflbmAAPHX2GTDlZb9Q2mKbFReCTbmwBkJ7MwJlzjjPqV2xROXE1gpvPpzze7UpKw==
X-Received: by 2002:a17:90a:20a2:: with SMTP id f31mr88160029pjg.90.1563993822260;
        Wed, 24 Jul 2019 11:43:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p68sm58404643pfb.80.2019.07.24.11.43.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:43:41 -0700 (PDT)
Date:   Wed, 24 Jul 2019 11:45:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Node ordering, address
 cleanups
Message-ID: <20190724184507.GN7234@tuxbook-pro>
References: <20190722165823.21539-1-jeffrey.l.hugo@gmail.com>
 <2165bbd3-aa60-bec0-4ee7-dfb7dc1dd1ad@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2165bbd3-aa60-bec0-4ee7-dfb7dc1dd1ad@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 24 Jul 04:16 PDT 2019, Marc Gonzalez wrote:

> On 22/07/2019 18:58, Jeffrey Hugo wrote:
> 
> > DT nodes should be ordered by address, then node name, and finally label.
> > The msm8998 dtsi does not follow this, so clean it up by reordering the
> > nodes.  While we are at it, extend the addresses to be fully 32-bits wide
> > so that ordering is easy to determine when adding new nodes.  Also, two
> > or so nodes had the wrong address value in their node name (did not match
> > the reg property), so fix those up as well.
> > 
> > Hopefully going forward, things can be maintained so that a cleanup like
> > this is not needed.
> > 
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi | 254 +++++++++++++-------------
> >  1 file changed, 127 insertions(+), 127 deletions(-)
> 
> LGTM.
> 
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> Rob, Mark: when there are multiple reg properties, why is the convention
> to use the *first* address in the node's name, rather than the lowest
> address?
> 

Per the ePAPR (section 2.2.1 Node Names of v1.1):

"The unit-address must match the first address specified in the reg
property of the node".

Regards,
Bjorn

> e.g.
> 
> 		spmi_bus: spmi@800f000 {
> 			compatible = "qcom,spmi-pmic-arb";
> 			reg =	<0x0800f000 0x1000>,
> 				<0x08400000 0x1000000>,
> 				<0x09400000 0x1000000>,
> 				<0x0a400000 0x220000>,
> 				<0x0800a000 0x3000>;
> 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> 
> "spmi@800f000" instead of "spmi@800a000"
> 
> Especially, since the reg props could be in any order here, given the
> lookup by name.
> 
> Regards.
