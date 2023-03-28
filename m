Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92BDF6CBBFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 12:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjC1KJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 06:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjC1KJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 06:09:32 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A53165B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 03:09:07 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id le6so11131859plb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679998146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qdiH4uJXKiZibZCOKNAKbnqmd2m39BxVhETzc5/WQ9k=;
        b=M0fzpt0TkMZYNK5mqRmm7+EGijPad9P8Oa7qaj5Q7xAm2KL/3ArMz0rnM3BOAsA4SJ
         ApCyo1+kSKfiNY8WcPwI1/szaD0OzZQiIyuD7vrsXEmT0TYyidAdCA8PzQOuyeP9M4/e
         yJtww08/a8T+qx5AY0svAmDH+NJus0kgUcoZnB8GoYOfkQFh0eAPgse4mOT5yV7/ul5C
         jiHYUqA/3n2Rd5yO9HL/7+nI6xZhrtswS27roeq76cETFj9pfFN1ML7WPzML50vD9BKp
         Efo+M07O5xCR+ryfevfD5T94Od0ChwezUPeITrZJHwjIBUEZDrPA1oDYex8oOR/GUGvy
         6+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679998146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdiH4uJXKiZibZCOKNAKbnqmd2m39BxVhETzc5/WQ9k=;
        b=tf/9No5HlBLC2fz3Exx3p4AiRA+OdrpRss/xMMddpwwIaKH5IZytvme/XYV9x/nbWA
         8AgIOX0kierAKM5EQ++65ShmaU7JlMLzlsjdufSptMXuZoXNP9NpfXq983LzaEVCP6A5
         uhtHLWSKvOdSnHXFiBP+EW5SFRYBA4eWIYEtFFjtnDGuJG2+KEk23jRNCnVLeEm9iobM
         gXiiBS4dC9XeZGSnt07CWd1JvCVp3RSsGvGmXdaFpTKgi3r8654ijONcaeRRfOf1IA0Y
         rAj5n+ygek8vdjGklznNBr0EFxxZ3zNXq4FSYgx8OAmbP76M5mQOev9qePvxVx+ljnkJ
         4LEw==
X-Gm-Message-State: AAQBX9fvWvWYyh043QWu3xEOk2f/BvngJ9gkbt6+9hYTbLLJCXqjaVAo
        QWg9wFM4MS4rt3EEDSf3I1kj
X-Google-Smtp-Source: AKy350aNqLtCBzV719N/JZW8YHQv0B4xdDr6OfWFAgMMsJtArmxwm5sWe37Z05tdLAtoereKrKsmDQ==
X-Received: by 2002:a17:902:d503:b0:19e:3922:b7d8 with SMTP id b3-20020a170902d50300b0019e3922b7d8mr16817637plg.12.1679998145907;
        Tue, 28 Mar 2023 03:09:05 -0700 (PDT)
Received: from thinkpad ([117.202.191.80])
        by smtp.gmail.com with ESMTPSA id jh17-20020a170903329100b0019a96a6543esm20755454plb.184.2023.03.28.03.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 03:09:05 -0700 (PDT)
Date:   Tue, 28 Mar 2023 15:38:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] usb: dwc3: qcom: Fix null ptr access during
 runtime_suspend()
Message-ID: <20230328100859.GE5695@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <20230325165217.31069-4-manivannan.sadhasivam@linaro.org>
 <ZCKyFEc087xoypdo@hovoldconsulting.com>
 <20230328094718.GB5695@thinkpad>
 <ZCK4uZCrbVZ/HfRq@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCK4uZCrbVZ/HfRq@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 28, 2023 at 11:51:53AM +0200, Johan Hovold wrote:
> On Tue, Mar 28, 2023 at 03:17:18PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Mar 28, 2023 at 11:23:32AM +0200, Johan Hovold wrote:
> > > On Sat, Mar 25, 2023 at 10:22:15PM +0530, Manivannan Sadhasivam wrote:
> 
> > > >  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> > > >  {
> > > > +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> > > >  	u32 val;
> > > >  	int i, ret;
> > > >  
> > > > -	if (qcom->is_suspended)
> > > > +	if (qcom->is_suspended || !dwc)
> > > >  		return 0;
> > > 
> > > I think we should try to keep the layering violations confined to the
> > > helper functions. So how about amending dwc3_qcom_is_host() and check
> > > for NULL before dereferencing the xhci pointer?
> > > 
> > > If the dwc3 driver hasn't probed yet, we're clearly not in host mode
> > > either...
> > 
> > Well, that's what I initially did but then I reverted to this approach as
> > returning true/false from dwc3_qcom_is_host() based on the pointer availability
> > doesn't sound right.
> > 
> > For example, if we return true then it implies that the driver is in host mode
> > which is logically wrong (before dwc3 probe) even though there is no impact.
> 
> No, you should return false of course as we are *not* in host mode as I
> mentioned above.
> 

Yes, but I interpreted it as "we are in device mode" in that case. But looking
at it again, I think it just conveys that the controller is not in host mode
only.

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
