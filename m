Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E007B66A9E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 08:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjANHOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Jan 2023 02:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjANHOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Jan 2023 02:14:10 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E14BBB3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 23:12:29 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id c6so25580861pls.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 23:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zg2WmO9wf8RImBuJiJx191XjcOzWFAmiLeDlAR4VkfU=;
        b=kB9czAtkBXfTqqM7RoBhUsx5UEq8inQBjOq6os5tM27gT9kdLGBDg/OQgYLXeaDHX/
         BehFBLv8uG5TNyzgENDDvr3XYgc+tOcUVbL/bBEzIT9f5lmoB6nu+rUsXfiUZBKJpvQu
         ykm0yLIa9bUp0+hcaVFqF3HB+pG9HIoQi1H1OKd7GQSawE7wiWVE8mYrTQfiXFCmiglW
         Jvpl060jO49w1CnzM64AkISsROmUuEvQ6vPjqh8x/Y/l9fXQ+ULncx3DZuT8r7bpG3YD
         oH+H6sMy2r3GcVf3cdj4MATaOMs7j/n+TFKQCXnhE6SSOOPf/j9ED7nnE+RngEKhwxM7
         ZSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zg2WmO9wf8RImBuJiJx191XjcOzWFAmiLeDlAR4VkfU=;
        b=YVHlU4M2/c/XPB68yNz/HXGvCUX9y0t3HqaOZf22HPAE95hIBp5QLSK0wf1qNQo57g
         +/0pnLAzSXvYmWc/5sjaQEMJy1UBJAXpkWDVzaK7XDRMug14SEHxxmsBGFOODasI7gWE
         Aouk3RXxJQbxqMjMTtVWGG9T0Axq3GNRhz8qDCDlVx94i/KxHCzyXt7RXH7xUdizxe4a
         d15N048KR8O1ZEftUyRy7gYinYdu/x8B1E+xSj9ltgUD90wp9WzM6b5rjDxoeFYM1/QY
         /52GovlGRDVeavFzWdHeqpIvEpzmHVf8xDs5T/oIzg8UmkHOLxd/CWppJvLAqmSDIJF7
         bmug==
X-Gm-Message-State: AFqh2krUAtneaPb3WyUpbzCew5IWr/bOxiEKHUrslQkClbSjaMxMzDSO
        miKDKRjvaq8053taqWwhtmeI
X-Google-Smtp-Source: AMrXdXu2EJNJuu1cUHWCPG+IKKHRvZ+JDIgSwxXpk6XJ02epnw30+ybEWzgcMfsFoW0ZKqJ4ESHzAQ==
X-Received: by 2002:a17:902:e5c5:b0:189:c57c:9a19 with SMTP id u5-20020a170902e5c500b00189c57c9a19mr112067881plf.58.1673680348900;
        Fri, 13 Jan 2023 23:12:28 -0800 (PST)
Received: from thinkpad ([220.158.159.156])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709027e0e00b00193132018ecsm14896832plm.170.2023.01.13.23.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 23:12:27 -0800 (PST)
Date:   Sat, 14 Jan 2023 12:42:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony.luck@intel.com,
        quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org
Subject: Re: [PATCH v5 00/17] Qcom: LLCC/EDAC: Fix base address used for LLCC
 banks
Message-ID: <20230114071222.GB6992@thinkpad>
References: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
 <Y6wcFjqpBUoxAkdk@zn.tnic>
 <20221228164711.GB256211@thinkpad>
 <Y6yDI43UZYfGDuOm@zn.tnic>
 <20230102173045.GB16638@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230102173045.GB16638@thinkpad>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 02, 2023 at 11:00:45PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 28, 2022 at 06:55:47PM +0100, Borislav Petkov wrote:
> > On Wed, Dec 28, 2022 at 10:17:11PM +0530, Manivannan Sadhasivam wrote:
> > > Well, some maintainers prefer to pick the independent patches through their
> > > tree. That's why I moved those patches to the start of the series.
> > 
> > Once some maintainers experience a crazy dependency hell between trees,
> > they would find routing it all through a single tree a lot easier the
> > next time.
> > 
> > > If you are fine with all patches going through qcom tree, I do not
> > > have any issue :)
> > 
> > I'm reviewing.
> > 
> 
> Ok! I'll wait for your reviews on the rest of the EDAC patches before doing the
> respin.
> 

Ping!

Thanks,
Mani

> Thanks,
> Mani
> 
> > -- 
> > Regards/Gruss,
> >     Boris.
> > 
> > https://people.kernel.org/tglx/notes-about-netiquette
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
