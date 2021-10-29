Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6869143FD3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 15:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhJ2NQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 09:16:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhJ2NQq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 09:16:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEDA661167;
        Fri, 29 Oct 2021 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635513258;
        bh=P1ON3/62L0Dv3I0JOEX4dWv6/iBLDiTdyLMkn72flOE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=Z4fNmufrUQYNBmCrjdme6gGW2Xge2pyny+vN2reRjsWoNza44nM3RQ6+hS/PX5DEY
         scP+rqH8lgWcJyUrZJSEFsuqjQmnCjiFRwG9nIDIxsp75FSd8w2TWJs3yHMAK3lZ0K
         eYJQB2rmKAtw8vH2GoaczSKOEaeNDnF8NP8gw5zvMTFMW2RhIM8U2jQ/wOeOuvElAO
         RcDxnAccPUuIqvwcdCAoMac2dv1WPLvei+QVgl07Wmewf0P2RfsGUPxLYkhf9AXZkH
         NBk7h0YEkNbxUlSG0HDoom8igk35aQR00aOFAr819AIbeCKjrJEcW5ZyJuiLdMN9UC
         qfz0e7QKgy/lQ==
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com>
 <CAHp75Vfq7ZkXytuAFhGOMGuH7_AsXcYf9O=p30e4OUx+a4jMgw@mail.gmail.com>
 <87fsskqvvc.fsf@kernel.org>
 <CAHp75VdHpHMp7X=8WcVbSUaT3pfxo-ZOTQ0BwdQqD09bJ2ddKg@mail.gmail.com>
 <877ddwqaas.fsf@kernel.org>
 <CAHp75VcwbVh7K=UMgiJ1QpaeB_f_==K4Ewzjt5OwYcOAXqiyUw@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 28.0.60
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH 2/3] platform: surface: Add surface xbl
Date:   Fri, 29 Oct 2021 16:12:08 +0300
In-reply-to: <CAHp75VcwbVh7K=UMgiJ1QpaeB_f_==K4Ewzjt5OwYcOAXqiyUw@mail.gmail.com>
Message-ID: <875ytgt1lm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>> >> > Capital L will be better to read and understand the
>> >> > abbreviation. Actually usually we do something like this:
>> >> >
>> >> > Extensible Boot Loader (EBL)
>> >>
>> >> nah, this is silly Andy. It's just capitalized as eXtensible Boot
>> >> Loader, very much akin to eXtensible Host Controller Interface.
>> >
>> > My point here is to have a full name followed by the abbreviation. and
>> > n(O)t in (F)ancy st(Y)le.
>>
>> too bad my patch removing acronyms from the kernel got rejects :-p
>>
>> Seriously, this is pretty pointless. You're vouching for something that
>> will just cause confusion. Every piece of internal documentation refers
>> to xbl and you want this to be renamed to ebl because it looks nicer for
>> you. Thanks, but no thanks.
>
> Maybe I was too unclear. I'm not pushing for EBL, I'm pushing for the form os
>
> "Foo bAr BullSh*t (FABS)" vs. "(F)oo b(a)r (B)ull(s)h*t".
>
> If you have x there to be capitalized, do it like "eXtensible Boot
> Loader (XBL)". Is it too hard?

Take a breather Andy, you need it. Winter sure is coming

>> >> >  +static const struct attribute_group inputs_attr_group = {
>> >> >  +       .attrs = inputs_attrs,
>> >> >  +};
>> >> >  +
>> >> >  +static u8 surface_xbl_readb(void __iomem *base, u32 offset)
>> >> >  +{
>> >> >  +       return readb(base + offset);
>> >> >  +}
>> >> >  +
>> >> >  +static u16 surface_xbl_readw(void __iomem *base, u32 offset)
>> >> >  +{
>> >> >  +       return readw(base + offset);
>> >> >  +}
>> >> >
>> >> > Either use corresponding io accessors in-line, or make first parameter
>> >> > to be sirface_xbl pointer. Otherwise these helpers useless.
>> >>
>> >> I agree with passing surface_xbl point as first parameter, but calling
>> >> the accessors pointless is a bit much. At a minimum, they make it easier
>> >> to ftrace the entire driver by simply ftracing surface_xbl_*
>> >
>> > My point is that the above seems half-baked. It's pointless to have a
>> > func(a,b) { return readl(a + b); }. It doesn't add value.
>>
>> sure it does. echo surface_xbl_* > ftrace_filter_function (or whatever
>> the filename was) it reason enough IMHO. Not to mention that these
>> little accessors will likely be optimized by the compiler.
>
> readl() will appear in the traces, no? But yeah I also was thinking
> about the weakness in your argument that the compiler can silently
> inline them anyway.

In non-debug builds, when tracers are enabled a thunk will be added for
runtime patching ;-) (IIRC)

-- 
balbi
