Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8182F6375FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 11:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKXKNT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 05:13:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiKXKNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 05:13:18 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9072C976E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 02:13:16 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so4714713pjc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2dr7Cgu4oJVGxGU1Y/2qFukYAZmH/+X4Fm9CRZLrY8=;
        b=P9EOPeyXPx8GBJUYiq9uOyAn/qCWcWTGvL6Wha5DJLhTpCMmeXU8Qwr+VvfGYTryoM
         0tUJDO5CfhLJ3URozTuKhk7INuvCw7+W74GbRlWy9SKKytlYp1sb0F9FzanRATTnkLyI
         Yp53dXTE6HyC/L2c3UhFnhXXKUJiwP6/FINdzAf/0o9w+IoX9bJ90qSXgmlvZfhnPisN
         FT8feH4EmP3pVlGqPUb2mgQRozoam3WpwGfb/nF/hr/ChS15K5bu0nbnkazVjdyLWhi8
         Dv3WpK4QujOTOytec+yPzPzU14p2UnmmkE1JqnPzOVjjKDxWlvtvlKS79H2QlaSxb2b5
         yOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2dr7Cgu4oJVGxGU1Y/2qFukYAZmH/+X4Fm9CRZLrY8=;
        b=nTA4RuV+9U+BpuGIlgny5WpXQxGoygGpVBQvUHPOm1pSY7apr6GRp9WbJ+yR0G5RSo
         xyARvhO6Xbbd6cpI0mABP7Czpknq/KznjKtaA+7FBQ1aAVG0PEgOvY+L6eg4UnRQrn8B
         d2dkGfSI4q0AquK5azuwHR4P3rmEyBCE/IWJuHlNQ1+OH7GyLY4v7dNN755QTmJMvtg7
         KbaHLyqEFU3v3uVeyQ01rNKOmG6fSfGFDHIbmcqem9kXyI1wccvIN2nODaRI3Bx2h61p
         4Hg8oT47UuxV8smtB7NxYWte9fnYDW0duYYTOitTfQv7hix5tVm2TjQlQpduczhmoWoD
         OVjQ==
X-Gm-Message-State: ANoB5plzGdd16yzkFikWk0hhQ1yYmT5L9oSV3tLlaCpgcjpgXBxgT0If
        eyg4gwX4yJQaPv9v8LG8eVDq
X-Google-Smtp-Source: AA0mqf4t6fAJ8A/JX49OHFGtob0Y2bkzouwdtsvSrPv9mEsKtqsl4IbjvZwzfzqw9F0zT26bCyhhsw==
X-Received: by 2002:a17:90b:f04:b0:218:8ec2:a4e2 with SMTP id br4-20020a17090b0f0400b002188ec2a4e2mr27805083pjb.174.1669284796009;
        Thu, 24 Nov 2022 02:13:16 -0800 (PST)
Received: from thinkpad ([59.92.97.13])
        by smtp.gmail.com with ESMTPSA id pl18-20020a17090b269200b00218f830c63esm842600pjb.1.2022.11.24.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:13:14 -0800 (PST)
Date:   Thu, 24 Nov 2022 15:43:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org, quic_cang@quicinc.com,
        quic_asutoshd@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, dmitry.baryshkov@linaro.org,
        ahalaney@redhat.com, abel.vesa@linaro.org
Subject: Re: [PATCH v3 20/20] MAINTAINERS: Add myself as the maintainer for
 Qcom UFS driver
Message-ID: <20221124101309.GE5119@thinkpad>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
 <20221123074826.95369-21-manivannan.sadhasivam@linaro.org>
 <Y35nBIIRmu3w9C1C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y35nBIIRmu3w9C1C@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 23, 2022 at 06:31:32PM +0000, Eric Biggers wrote:
> On Wed, Nov 23, 2022 at 01:18:26PM +0530, Manivannan Sadhasivam wrote:
> > Qcom UFS driver has been left un-maintained till now. I'd like to step
> > up to maintain the driver and its binding.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cf0f18502372..149fd6daf52b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21097,6 +21097,14 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> >  F:	drivers/ufs/host/ufs-mediatek*
> >  
> > +UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER QUALCOMM HOOKS
> > +M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +L:	linux-arm-msm@vger.kernel.org
> > +L:	linux-scsi@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> > +F:	drivers/ufs/host/ufs-qcom.c
> 
> Thanks for volunteering to maintain this driver!
> 
> What about ufs-qcom.h and ufs-qcom-ice.c?  Those are part of this driver too.
> 
> The pattern drivers/ufs/host/ufs-qcom* would cover all these files.
> 

Sorry, forgot the wildcard! Will fix it in next revision.

Thanks,
Mani

> - Eric

-- 
மணிவண்ணன் சதாசிவம்
