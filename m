Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C974C9C13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 12:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbfJCKU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 06:20:28 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:37621 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCKU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 06:20:28 -0400
Received: by mail-wm1-f50.google.com with SMTP id f22so1845470wmc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RgYfjLnuHCVaLlaLQE6xBvCVpBRhiKlsW8AM1IaRwoc=;
        b=liP+tQrbcQ/PhyPV3IF4Q4ag8vLwWVnhHzZ1wWzHuXbSQMFyZgGMd44HgAxDKUVy/N
         imtKR55T4uy0tMLy4sN8UDHsfIWZ9/hQEBG+0UEUsK+Kehwjk0R5d3JP5sALQDr3YEuG
         QMZQfTH2SRzyU+YmN3kCaoe9wwBqRsQv6suN8EZWUrwSyoWOWnp8c0WuswIGQvtzyg7/
         0980nAGHmjcNBOj7kWVo/ASWlTP5ejFboQ6W6HAfMvTtp2ZX1+Y8eEhWubQij3R0zeeS
         y9zAm3OZu3kqMPWwOrpxMb1wXPWn+VdiiDt/FgOVGnTW1+yBYyxPDD66tvTnHJLDIHki
         bZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RgYfjLnuHCVaLlaLQE6xBvCVpBRhiKlsW8AM1IaRwoc=;
        b=rqxoKu270AidG1mN4teSoR08q8HgP3GlWHMUNUOx8Z7fHIt0HK/qDmFQeDAJNXHf1Q
         FICwNFmrG7dyKVjU9AC87zK97gkNZ4fh1zhfhu07lmlFyp84+hQS3DxwSQoY9P40A5xZ
         E+ikd3EggM0CBal3uwGsqjSe/aYS+ec0mcMkIt89NrWBKGbRA/zC6QBFVKRC/SgrwuAR
         ZKNjwI2utRFERC2/khcSGFQtc1judT5vCyG/apbJfCa3hts7/5cFxJ9keDpcM0SpqOEU
         Qx3fB2A7DxBwwKkUb5cqSrFhEQagn8W7hdShbVNroBGwdDUfovgMSUThHWCg7Spj97yC
         WmeQ==
X-Gm-Message-State: APjAAAXRRQhB0dErguxNg0mI7S7T6f9E3iQzi45U9BrqhQe7gomlVYrA
        RtV7OT/baF/5HML0bRPw/CPowA==
X-Google-Smtp-Source: APXvYqz9uAbe9izQ7OolQ95hH+VT7Ttpkz4AlYdVQ8HuQZZ4ro9WQ+Cs3l/7PY9Qt6+VrATHsnpcYQ==
X-Received: by 2002:a1c:80ca:: with SMTP id b193mr5852137wmd.171.1570098026639;
        Thu, 03 Oct 2019 03:20:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n17sm2102552wrp.37.2019.10.03.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 03:20:25 -0700 (PDT)
Date:   Thu, 3 Oct 2019 11:20:23 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
Message-ID: <20191003102023.qk6ik5vmatheaofs@holly.lan>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
 <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
 <5b8835905a704fb813714694a792df54@codeaurora.org>
 <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 02, 2019 at 09:03:59AM -0600, Mathieu Poirier wrote:
> On Tue, 1 Oct 2019 at 12:05, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
> >
> > On 2019-10-01 11:01, Jeffrey Hugo wrote:
> > > On Tue, Oct 1, 2019 at 11:52 AM Sai Prakash Ranjan
> > > <saiprakash.ranjan@codeaurora.org> wrote:
> > >>
> > >>
> > >> Haan then likely it's the firmware issue.
> > >> We should probably disable coresight in soc dtsi and enable only for
> > >> MTP. For now you can add a status=disabled for all coresight nodes in
> > >> msm8998.dtsi and I will send the patch doing the same in a day or
> > >> two(sorry I am travelling currently).
> > >
> > > This sounds sane to me (and is what I did while bisecting the issue).
> > > When you do create the patch, feel free to add the following tags as
> > > you see fit.
> > >
> > > Reported-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >
> > Thanks Jeffrey, I will add them.
> > Hope Mathieu and Suzuki are OK with this.
> 
> The problem here is that a debug and production device are using the
> same device tree, i.e msm8998.dtsi.  Disabling coresight devices in
> the DTS file will allow the laptop to boot but completely disabled
> coresight blocks on the MTP board.  Leaving things as is breaks the
> laptop but allows coresight to be used on the MTP board.  One of three
> things can happen:
> 
> 1) Nothing gets done and production board can't boot without DTS modifications.
> 2) Disable tags are added to the DTS file and the debug board can't
> use coresight without modifications.
> 2) The handling of the debug power domain is done properly on the
> MSM8998 rather than relying on the bootloader to enable it.
> 3) The DTS file is split or reorganised to account for debug/production devices.

msm8998.dtsi is a SoC include file. Can't whatever default it adopts be
reversed in the board include files such as msm8998-mtp.dtsi or
msm8998-clamshell.dtsi ?


Daniel.
