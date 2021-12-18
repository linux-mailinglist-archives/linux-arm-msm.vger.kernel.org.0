Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E98479CAA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Dec 2021 21:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbhLRUw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Dec 2021 15:52:27 -0500
Received: from ixit.cz ([94.230.151.217]:42126 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232227AbhLRUw1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Dec 2021 15:52:27 -0500
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 4B7432243C;
        Sat, 18 Dec 2021 21:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1639860745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ns+kGQMsz1c6kz2fXI93jaD4tkUpgUypUxovZ3gfsTk=;
        b=IxEMC83PAvLUGvzlAGclql1gHvH/JLnwkflR4KA/2wzJ4G9sjcgzUrQbiz6hwQ4lBVcHH/
        lUWF1LyS5jG4Aa/J4txk0bRKeN3j3bkboGKg1djESqDbRoNDAWRGC2xuqOGdvm1MvW5b8J
        D/abx62Zc0dNOajk8HdnR5plvSoN3Sw=
Date:   Sat, 18 Dec 2021 21:52:19 +0100
From:   David Heidelberg <david@ixit.cz>
Subject: Re: SMP2P DT binding
To:     Alex Elder <elder@linaro.org>
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Message-Id: <7NWB4R.J78LDXTOZ9ED@ixit.cz>
In-Reply-To: <c7bd6c08-9f13-83f6-08d6-178215bc9f54@linaro.org>
References: <c7bd6c08-9f13-83f6-08d6-178215bc9f54@linaro.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello all!

Just sent finalized "dt-binding: soc: qcom: convert QCOM SMP2P binding 
to yaml".

One thing I'm little bit unsure is sub-nodes pattern matching. If it 
needs to be improved, I'm looking forward to reviews.
David

On Fri, Dec 10 2021 at 08:27:09 -0600, Alex Elder <elder@linaro.org> 
wrote:
> Bjorn, Andy, in October David Heidelberg included the following
> in a message about something related to IPA in a DTS file:
> 
> > On 10/21/26 11:34 AM, David Heidelberg wrote:
> . . .
> > P.S. I have some basic structure for qcom,smp2p.yaml, but to make it
> > right take some effort. If someone want to, I can send it as WIP or
> > just into private email.
> 
> Are you interested in this?
> 
> 					-Alex


