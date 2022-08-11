Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED01758FBB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 13:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbiHKL5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 07:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbiHKL5Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 07:57:16 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAE69674B
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 04:57:15 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gj1so17517680pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=1PjdQiIv1kMsJkwFJMue4HRjmUNUZJ9LU6vCJsWYrUU=;
        b=KU5q7OXMByi0n6kinxUo7WG4OyyXjQ68+HYKFQiLpLY83Q/SB6XyETN35FvaSWTKRy
         T92Uh0WCytiioADd1sUB3/dXdAMjcfRPehHQWGYsse2fODcflVrx/rnpDhCbVKmY0Bi2
         DyJdOFZHFuHNqzktyVeHf6Vf6RI1EPu5UthikeQ4o8TM/Jz23/sXHdC2SCHhLZ0YWE9Z
         VAng1v+/b8P9V6MrdpnOeLWGOW+b9WHXxjmxoOKjSffTre0nnRY2wvxiZk9MUz5vKiuZ
         d4C4qXyzoqP3SPVsPGSOI5HfkMp6qDErzPhBtlHg5Z3PNSn3a/B4VN5+42xkVYuMsn1n
         3C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=1PjdQiIv1kMsJkwFJMue4HRjmUNUZJ9LU6vCJsWYrUU=;
        b=yziNN60UxnhQU0VkoIkdh9MBX3zfOyxK+vgG8JdtqxnfPWDhMOXT8tqbLgrKBUziy5
         MKQ5NBr5McPeQsKLRZ+Fk1WUdzM3V1pXnMojR2+8vTZ8Fh2MBNUXqCXYV29wWZCGE69C
         6nShA1E3tSse/lQW3cx9J1cRTLgSlpP4hrgKpT5BYfHx04R0dWLfzS+W4fp8CHbvKQwL
         bAGaKw1bw+dWRcJ6qBrHUPuLNNpPfQk7f0o9YGHnwNlbFbvaK6iLOv6JiD/8+2H7fuhk
         p7EHwleLCa5ND5nHtaw8nQsrQHkiMaK7rpCFpqpjsa9CREpVNYkollTfrAs5AK4QiF8X
         YdHA==
X-Gm-Message-State: ACgBeo3LxzQDgvQdKQrgXVMRPw3Hmbd6Q9qFUGBBjbXcmejGj2jlkrhW
        BpyaX9xnqyAUnx60FGWnWDgt
X-Google-Smtp-Source: AA6agR5gsam2Zx07NhcqQ8mrnHK0T8ZQKpGEl+RI0VMVLtLQpwRMwMyBFLPHonHLMR5FwQJCRUobLw==
X-Received: by 2002:a17:903:2d1:b0:171:3773:b95 with SMTP id s17-20020a17090302d100b0017137730b95mr6719088plk.173.1660219035283;
        Thu, 11 Aug 2022 04:57:15 -0700 (PDT)
Received: from workstation ([59.92.103.103])
        by smtp.gmail.com with ESMTPSA id w2-20020a62c702000000b0052f0a404fa7sm3975871pfg.146.2022.08.11.04.57.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 04:57:14 -0700 (PDT)
Date:   Thu, 11 Aug 2022 17:27:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     bjorn.andersson@linaro.org, mchehab@kernel.org,
        james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix crash when using Qcom LLCC/EDAC drivers
Message-ID: <20220811115711.GD29799@workstation>
References: <20220811100924.79505-1-manivannan.sadhasivam@linaro.org>
 <YvTehUOIqJGqXgXY@zn.tnic>
 <YvTfqg0q/8kIMY91@zn.tnic>
 <20220811112032.GB29799@workstation>
 <YvTo8tE3DaHifrSp@zn.tnic>
 <20220811115334.GC29799@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811115334.GC29799@workstation>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clipped the bouncing email addresses...

On Thu, Aug 11, 2022 at 05:23:34PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Aug 11, 2022 at 01:33:06PM +0200, Borislav Petkov wrote:
> > On Thu, Aug 11, 2022 at 04:50:32PM +0530, Manivannan Sadhasivam wrote:
> > > I know get_maintainer.pl :) But the problem is, Qualcomm recently
> > > switched their email domain from codeaurora.org to quicinc.com.
> > 
> > Great:
> > 
> > $ git grep codeaurora.org MAINTAINERS | wc -l
> > 5
> > 
> 
> Yep! Most of the active developers have already changed their domains in
> MAINTAINERS file. But the left ones are either not actively maintained
> (yeah bad) or the maintainers have left Qualcomm.
> 
> > ;-\
> > 
> > > So even if I use the maintainers codeaurora domain now, they will
> > > bounce.
> > 
> > Hmm, so the mails I sent with codeaurora on Cc didn't bounce back - I
> > got only the quicinc bounces. That doesn't mean that codeaurora actually
> > gets delivered...
> > 
> 
> Not sure why. It was supposed to bounce. But could be that Qualcomm IT
> decided to not bounce anymore since they have got enough complaints from
> developers ;)
> 

Okay, seems to be bouncing for me:

The response from the remote server was:
585 5.1.1 <ckadabi@codeaurora.org>: Recipient address rejected: undeliverable address: No such user here.
585 5.1.1 <vnkgutta@codeaurora.org>: Recipient address rejected: undeliverable address: No such user here.

Thanks,
Mani

> > > For that reason, I used their quicinc domain addresses. But since they
> > > are bouncing, it looks like the maintainers left Qualcomm :/
> > 
> > Hmm, is there some way to get in touch with those folks?
> > 
> 
> I don't think so. I checked in the internal Qualcomm database and
> confirmed that I couldn't find the maintainers names there.
> 
> > Or whoever is taking over those drivers?
> > 
> 
> LLCC is maintained by Bjorn (CCed) since it falls under soc/qcom. But I'm
> not sure about EDAC. I think we should mark it as not maintainted until we
> find a volunteer.
> 
> Bjorn, thoughts?
> 
> Thanks,
> Mani
> 
> > Thx.
> > 
> > -- 
> > Regards/Gruss,
> >     Boris.
> > 
> > https://people.kernel.org/tglx/notes-about-netiquette
