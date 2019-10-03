Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D815C9EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 14:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfJCMwW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 08:52:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35882 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729086AbfJCMwW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 08:52:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id y19so2798571wrd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Eds4WlKNrSquM0FM6dtReZhXBU6tEApFNM4AAkDONtU=;
        b=uhaA79/wTDQRJkGDfiqBzI5XyjkUmklCrjoS8TobGc4hXYPoRoNUAdn1DXDVjc9TcF
         pldCe3JghlMjVZYFcmYZB0Dk/IlF1TbFoJSM0tiAiKd3SSK4CjnWL2dJ61epJ8tHVPk8
         NnBBDCgK8eGDxi0h1JIGOXDkmh1W8IBedQbSclnfe32vu2C7qBbQ7JsA1GdT6HIgwcCT
         x6lx/jlQhKyY9+7pj5iWXPCp31g13S5LS4Bs3dklE17QYVwg6BOwMrQihm8Tquz7avGl
         qOgncHx1wgqO4ugywE+++VQhG3NeRcBOYdu6Wucq1HpsqCjv+gFcKolIvOAxGvs3IOUY
         6+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Eds4WlKNrSquM0FM6dtReZhXBU6tEApFNM4AAkDONtU=;
        b=hGt/nFDdEUrh4wqlTJAZZqicIEXLelOI328pCLln5YFsRV5drabSNVZSGUH872xSaP
         vgxDZVhxqMipO9vKMdSWLVryddHI2Bp5OuVsK1YE596cY2TCGeJCigi2QUdFOwiVsuKl
         hZdTZxh4wnt2oHw7WRBfVAAqmMXM3KFokBBw8MyrPbt5OybotW5Ql/21qjvx386CQbIh
         RnIBkG1saUIwXkeoi4k6jODGx4XGA16jkbm5EO9dh99/DS5lh2cPrOnqwt2bhXZLRGz/
         QFixBmMpuqrHOt1+81ko9W6iCWAEZ+Oa6W0ul/mZ8P/RfmV3WM8SjIklXPn0nJN4hdEH
         q3tw==
X-Gm-Message-State: APjAAAXMwvTg/mmVQV6hbd6cVv8VKbOcMaQBD6ycLUKIpD5ogJ9z6hDa
        CBxZYhikVkBRakLVNY6i8r0ncQ==
X-Google-Smtp-Source: APXvYqwEre7pf/Cd0XQRb8u08WuYNMTQh6T72bFTG6v17hgfbrAgZKqP8W8p/T/1gYowk6OonhX2Gw==
X-Received: by 2002:adf:ea12:: with SMTP id q18mr7494629wrm.323.1570107139009;
        Thu, 03 Oct 2019 05:52:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z125sm4282266wme.37.2019.10.03.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:52:18 -0700 (PDT)
Date:   Thu, 3 Oct 2019 13:52:16 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, saiprakash.ranjan@codeaurora.org,
        jeffrey.l.hugo@gmail.com, mark.rutland@arm.com,
        rnayak@codeaurora.org, alexander.shishkin@linux.intel.com,
        linux-arm-msm@vger.kernel.org, marc.w.gonzalez@free.fr,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, agross@kernel.org, sibis@codeaurora.org,
        leo.yan@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
Message-ID: <20191003125216.f5sjl6yhhb2t7uqq@holly.lan>
References: <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
 <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
 <5b8835905a704fb813714694a792df54@codeaurora.org>
 <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
 <20191003102023.qk6ik5vmatheaofs@holly.lan>
 <57349bda-0e86-5fe0-3be0-55b12748c346@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57349bda-0e86-5fe0-3be0-55b12748c346@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 03, 2019 at 11:52:36AM +0100, Suzuki K Poulose wrote:
> On 10/03/2019 11:20 AM, Daniel Thompson wrote:
> > On Wed, Oct 02, 2019 at 09:03:59AM -0600, Mathieu Poirier wrote:
> > > On Tue, 1 Oct 2019 at 12:05, Sai Prakash Ranjan
> > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > > 
> > > > On 2019-10-01 11:01, Jeffrey Hugo wrote:
> > > > > On Tue, Oct 1, 2019 at 11:52 AM Sai Prakash Ranjan
> > > > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > > > > 
> > > > > > 
> > > > > > Haan then likely it's the firmware issue.
> > > > > > We should probably disable coresight in soc dtsi and enable only for
> > > > > > MTP. For now you can add a status=disabled for all coresight nodes in
> > > > > > msm8998.dtsi and I will send the patch doing the same in a day or
> > > > > > two(sorry I am travelling currently).
> > > > > 
> > > > > This sounds sane to me (and is what I did while bisecting the issue).
> > > > > When you do create the patch, feel free to add the following tags as
> > > > > you see fit.
> > > > > 
> > > > > Reported-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > > Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > 
> > > > Thanks Jeffrey, I will add them.
> > > > Hope Mathieu and Suzuki are OK with this.
> > > 
> > > The problem here is that a debug and production device are using the
> > > same device tree, i.e msm8998.dtsi.  Disabling coresight devices in
> > > the DTS file will allow the laptop to boot but completely disabled
> > > coresight blocks on the MTP board.  Leaving things as is breaks the
> > > laptop but allows coresight to be used on the MTP board.  One of three
> > > things can happen:
> > > 
> > > 1) Nothing gets done and production board can't boot without DTS modifications.
> > > 2) Disable tags are added to the DTS file and the debug board can't
> > > use coresight without modifications.
> > > 2) The handling of the debug power domain is done properly on the
> > > MSM8998 rather than relying on the bootloader to enable it.
> > > 3) The DTS file is split or reorganised to account for debug/production devices.
> > 
> > msm8998.dtsi is a SoC include file. Can't whatever default it adopts be
> > reversed in the board include files such as msm8998-mtp.dtsi or
> > msm8998-clamshell.dtsi ?
> 
> Or like Mathieu said, all the Coresight specific nodes could be moved in
> to say, msm8998-coresight.dtsi and could be included into the platforms
> where it actually works.

Sure, that works too.

Maybe it depends in you view the mtp as including the feature or as the
laptops as taking it away ;-) .

Treating it as a feature a board can disable also works nicely on systems
where the board include file should be setting secure-status a board
(although that's probably not the case for these boards since the
firmware is proprietary).


Daniel.
