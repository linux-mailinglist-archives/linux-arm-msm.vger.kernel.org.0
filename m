Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64953D4169
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfJKNfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:35:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44072 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJKNfK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:35:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 79A7060EA5; Fri, 11 Oct 2019 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800909;
        bh=3JtiwsXLgH7sfDwmfscttrAvHhcHaIlyNhxJjY3Fb1k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DtBJLjLkXqSDeNiNEnke8Rh1+AsHfRF0at6TS9/d24c4V1n83vB3ESx3z+9Bc7pb5
         e4vLJnEL2mMaXkiDGtlDXGcaa6/PufTRtE55cRjP98sEzZE8KBcNBYfUVfHXqrv6HW
         HedMgUE6nQsrPLc39rSAJp4K2ajhy2Uu0XB9QWVs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 44A3160F3A;
        Fri, 11 Oct 2019 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800908;
        bh=3JtiwsXLgH7sfDwmfscttrAvHhcHaIlyNhxJjY3Fb1k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QAjjvtKVeVfBJWmHFF/xshN/8M6ToDEV6Zm73SNEjmzvdSPI1qT5UUtshQdlqp/AC
         Ux0CN3e3DAGIKG+vJJcS/0hV614HlwylAuA8OdSJcrwmqkVgweloQZubUNvccqYdp4
         WrIBdJI10tYWtyRr11fBUnqeLIMvmEqTeBGeg4Mk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Oct 2019 19:05:08 +0530
From:   Govind Singh <govinds@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH_v3 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
In-Reply-To: <20190906203131.936A22070C@mail.kernel.org>
References: <20190823131401.4011-1-govinds@codeaurora.org>
 <20190823131401.4011-2-govinds@codeaurora.org>
 <CAL_JsqLpVDJBh5qZwudncB8sggb85f3efqs1z9EA+zbVPWX++g@mail.gmail.com>
 <20190906203131.936A22070C@mail.kernel.org>
Message-ID: <0bf4caf58a0663fea75f12838249c572@codeaurora.org>
X-Sender: govinds@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-07 02:01, Stephen Boyd wrote:
> Quoting Rob Herring (2019-08-27 05:27:19)
>> On Fri, Aug 23, 2019 at 8:14 AM Govind Singh <govinds@codeaurora.org> 
>> wrote:
>> >
>> > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
>> >
>> > Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> > ---
>> >  .../bindings/clock/qcom,q6sstopcc.yaml        | 47 +++++++++++++++++++
>> >  1 file changed, 47 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> > new file mode 100644
>> > index 000000000000..39621e2e2f4e
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> > @@ -0,0 +1,47 @@
>> > +# SPDX-License-Identifier: BSD-2-Clause
>> 
>> Dual license please.
>> 
> 
> Yes, please fix the binding.

fixed in v4.

Thanks,
Govind
