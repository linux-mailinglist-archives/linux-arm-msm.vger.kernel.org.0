Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE3B58FB2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 13:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbiHKLUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 07:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbiHKLUk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 07:20:40 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E77DD50
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 04:20:38 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t22so17425824pjy.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 04:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=u6elEvtkgatUwtnESJJKM95epGfhjgSWF6jAcnT9ZmQ=;
        b=zCeTC9Qk6YtrncbxP867FmhE0JvuJ+J5tsywHyMOr995OFng+nTmV7UsvrwgfS/EgA
         IV3FHMdxTGcPxe5Xtu42ZE7P9S4qkkUkox4zpEx//ym1cSAV6NNs220Jhk2DewBpLwyY
         6w/TIrDhyLY01D8bXHUa/uCJVQheyhLQIxVw5Jxs7gUR6z6QqBEqJBXEu0g0N6khGKmH
         4NlnKr/t7UjnIHh4Z/6rNFrkVX+xTHVVaBEt/2Mj5+R/7kWVQU6oAETiZ82HTrPyMwgw
         /RgWLc4+V3xhecLFzD7R9ltShCInEFj8FcHz8PMQ9l/AxqH6MmQAZeSlJbtnBX0z/ryc
         WXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=u6elEvtkgatUwtnESJJKM95epGfhjgSWF6jAcnT9ZmQ=;
        b=lmUO9OcDNccxW059A2EZ3O/FG6J3ryhyRX2bywaBCjaFtqpT6+Wf6AmsA/H2xBO8vA
         ub8Ym8CtPhhOa0zde/KFXeHL70kXjOttXoJf4VND2GdsRJdqDJ0ISBs5tOAbn5JENcDZ
         LqR+Uz2F0MsUorMvNWi9yxsYunQ8MDkj/7Odsvyo3oKo2+YcXjiGZIlNSTFIziWBzZTX
         wkPihe7ALDKBYolxeLdNTtoNuVi/7DNtH6E/YshIhaLCVIkgE6hNezAXXHkEvbEsHP5z
         rTkT03BVKHQr6asEJfxV/B69pVQnbfNWR+IKq5X4dTqYLKLDBCWB/BIRtwhOD4K9iJ2p
         yYVg==
X-Gm-Message-State: ACgBeo2jxCzRCUDgRELc4JrqrFq0MxkLTm/BHeoXjTztTYsOKPkgcIA2
        8Qvyk9IcJewE/2pnpb9K+AqW
X-Google-Smtp-Source: AA6agR6AyXO9Lr2YhZLJ66w/x5GWppUjfm7EoSN0EM2wGmVftF6kmQyRZ7heALd6pIdi0l7ff5epTQ==
X-Received: by 2002:a17:902:b481:b0:170:a33d:7bde with SMTP id y1-20020a170902b48100b00170a33d7bdemr19323675plr.6.1660216837517;
        Thu, 11 Aug 2022 04:20:37 -0700 (PDT)
Received: from workstation ([59.92.103.103])
        by smtp.gmail.com with ESMTPSA id n184-20020a6227c1000000b0052c87380aebsm3800101pfn.1.2022.08.11.04.20.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 04:20:37 -0700 (PDT)
Date:   Thu, 11 Aug 2022 16:50:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     bjorn.andersson@linaro.org, ckadabi@quicinc.com,
        vnkgutta@quicinc.com, mchehab@kernel.org, james.morse@arm.com,
        rric@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        Channagoud Kadabi <ckadabi@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: Re: [PATCH 0/2] Fix crash when using Qcom LLCC/EDAC drivers
Message-ID: <20220811112032.GB29799@workstation>
References: <20220811100924.79505-1-manivannan.sadhasivam@linaro.org>
 <YvTehUOIqJGqXgXY@zn.tnic>
 <YvTfqg0q/8kIMY91@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvTfqg0q/8kIMY91@zn.tnic>
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

On Thu, Aug 11, 2022 at 12:53:30PM +0200, Borislav Petkov wrote:
> On Thu, Aug 11, 2022 at 12:48:37PM +0200, Borislav Petkov wrote:
> > On Thu, Aug 11, 2022 at 03:39:22PM +0530, Manivannan Sadhasivam wrote:
> > > Hello,
> > > 
> > > This series fixes the crash seen on the Qualcomm SM8450 chipset with the
> > > LLCC/EDAC drivers. The problem was due to the Qcom EDAC driver using the
> > > fixed LLCC register offsets for detecting the LLCC errors.
> > 
> > I see you've CCed the QCOM maintainers using different email addresses:
> > 
> > $ ./scripts/get_maintainer.pl -f drivers/edac/qcom_edac.c
> > Channagoud Kadabi <ckadabi@codeaurora.org> (maintainer:EDAC-QCOM)
> > Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org> (maintainer:EDAC-QCOM)
> > 
> > Does MAINTAINERS need updating?
> 
> No, it doesn't. The email addresses you used, bounce:
> 
> Delivery has failed to these recipients or groups:
> 
> vnkgutta@quicinc.com<mailto:vnkgutta@quicinc.com>
> The email address you entered couldn't be found. Please check the recipient's email address and try to resend the message. If the problem continues,
> +please contact your email admin.
> 
> 
> ckadabi@quicinc.com<mailto:ckadabi@quicinc.com>
> The email address you entered couldn't be found. Please check the recipient's email address and try to resend the message. If the problem continues,
> +please contact your email admin.
> 
> In the future, when you wonder who to Cc and how,
> 
> scripts/get_maintainer.pl
> 
> is your friend.
> 

I know get_maintainer.pl :) But the problem is, Qualcomm recently
switched their email domain from codeaurora.org to quicinc.com. So even
if I use the maintainers codeaurora domain now, they will bounce.

For that reason, I used their quicinc domain addresses. But since they
are bouncing, it looks like the maintainers left Qualcomm :/

Thanks,
Mani

> HTH.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
