Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FCB728145
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 15:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbjFHNXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 09:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbjFHNXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 09:23:23 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31102210C
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 06:23:22 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b0314f057cso3098255ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686230601; x=1688822601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wau+p0HsmtAJRLShZyk5WQg318Isz9/APu5fsTTkY0w=;
        b=rBz6KwlmflQIOUsPIApccKlhxwLinWxGFNQEvZpvJBU+LSjcRosLyBk6YxAQTIQCct
         slsXTUmAEa6e0rFzLCvlQzSn2wlW4zd+BTelwsOUV2FWzZjk+r/Jg+tknsAy/exbNfWQ
         0MlYf3Btq1raQwsfIeBOo/U2Yl5j2OXDvnNLP6rpE9+mQZVepxIV51e134XxN4/NmiS1
         03r/mtzt0K0dVAj/kRfaeDJFgBYcSdg9RVJ0SiA68LtNM7U3/Gi/b2kyA4+9sj5pn6Vv
         cJSMBJi1DdNhhs5ZfoHwlcOajTkNxXPeMowcXuT+/nD8QdgwyiUdPz+gpeM9mIdKqdDz
         qpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686230601; x=1688822601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wau+p0HsmtAJRLShZyk5WQg318Isz9/APu5fsTTkY0w=;
        b=b+NhZFpxUvrQgkNPa5Gfdmd2yMB3NxLQ7JG6gIiAyZFTk7XUOyJ6ubPBaqPLiRB3TT
         2ERYj72TSd8ruufWN4RZSI1E3ynSHi14U0pk+6czX+l+btMqjcVUbQrZ7ruo5oe0yYYM
         9bcNuyjgoP0VbzQRSIghQqZWkxpE9R0dhUqESBnn3I0z7PJvvHeDCaosMnrLFq01R9x9
         dUjZoT8No88scQSYG4TcmbuBj7g1dufoG4S6WJY2I7oplyli+aUl2YaV4lOo2KMDoF2g
         XB2dyiTirVsnCiYkhPeHxzVO3Cki7Q/eBUDLJEe7e4oI2aUK9qJJC851+MqIlMioIu05
         bjVA==
X-Gm-Message-State: AC+VfDx8bx79amc0HxioJn5osqqbPL6mdy11mbvUBlJrp7kPAq9psenn
        RqX7tj0aymHgu4kjV1kANGU7LuvQ1Joco6p7DQ==
X-Google-Smtp-Source: ACHHUZ4PEEh/+Pmi2v9V95MUSR46bzBOgkffXZUXrtr7W62aCh/OJHi+tDBbl4JJ6IaN5ihDvzTGbA==
X-Received: by 2002:a17:902:bcc6:b0:1a1:a800:96a7 with SMTP id o6-20020a170902bcc600b001a1a80096a7mr4546138pls.8.1686230601626;
        Thu, 08 Jun 2023 06:23:21 -0700 (PDT)
Received: from thinkpad ([117.202.186.138])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902778800b001ac2c3e436asm1417933pll.186.2023.06.08.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:23:21 -0700 (PDT)
Date:   Thu, 8 Jun 2023 18:53:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Li Jun <jun.li@nxp.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: Re: [PATCH 2/2] USB: dwc3: fix use-after-free on core driver unbind
Message-ID: <20230608132313.GG5672@thinkpad>
References: <20230607100540.31045-1-johan+linaro@kernel.org>
 <20230607100540.31045-3-johan+linaro@kernel.org>
 <20230608130246.GF5672@thinkpad>
 <ZIHTBw3pMNjieVyj@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIHTBw3pMNjieVyj@hovoldconsulting.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 08, 2023 at 03:09:27PM +0200, Johan Hovold wrote:
> On Thu, Jun 08, 2023 at 06:32:46PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Jun 07, 2023 at 12:05:40PM +0200, Johan Hovold wrote:
> > > Some dwc3 glue drivers are currently accessing the driver data of the
> > > child core device directly, which is clearly a bad idea as the child may
> > > not have probed yet or may have been unbound from its driver.
> > > 
> > > As a workaround until the glue drivers have been fixed, clear the driver
> > > data pointer before allowing the glue parent device to runtime suspend
> > > to prevent its driver from accessing data that has been freed during
> > > unbind.
> 
> > > @@ -1929,6 +1929,11 @@ static int dwc3_remove(struct platform_device *pdev)
> > >  	pm_runtime_disable(&pdev->dev);
> > >  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > >  	pm_runtime_put_noidle(&pdev->dev);
> > > +	/*
> > > +	 * HACK: Clear the driver data, which is currently accessed by parent
> > > +	 * glue drivers, before allowing the parent to suspend.
> > > +	 */
> > > +	platform_set_drvdata(pdev, NULL);
> > 
> > This is required because you have seen the glue driver going to runtime suspend
> > once the below pm_runtime_set_suspended() is completed?
> 
> This is based on analysis of the code. The parent (glue) can not suspend
> while the child (core) is in the active state, but once we set the
> suspended state that could happen.
> 

I could see that the driver core is setting drvdata to NULL during
device_unbind_cleanup(), so not sure if this scenario could be met otherwise it
will be redundant.

- Mani


> > >  
> > >  	dwc3_free_event_buffers(dwc);
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்
