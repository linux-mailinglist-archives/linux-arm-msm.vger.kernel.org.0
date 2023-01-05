Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA0465E88A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 11:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbjAEKDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 05:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbjAEKCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 05:02:32 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D34203C
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 02:00:52 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id k19so17246335pfg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 02:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S5vBFARuIRiK64V5wwqFkQ5kzYGu77jWfbY7LeM0ol8=;
        b=gaUFFXLBJ8PxpmBmW3TEwh1Bh7dvc7x8b51VrFeqk/UV1oRAv7DGYCii+Tp1w2gdb+
         moNaPe8ZyZfVPqr7joC6v/1kXLO2chLGNwGG09hcl8F934DBj2+0p5dxma32DpPJgSyV
         zLkTt9/SFjk+1aeTbq49pfAEdGpcpJqtqClgwD4NvQ4jFLsYiaZJrC2pj7pkFKUR+YOv
         u5zYlsaxIj1tgiUKpyRkzQZQkNdURyjqziPtbH1aZPRr9jyEHSXkB3pwCC1OpMQuNsJ8
         JWKZ2zsxIP2frDFCQ7iETLcUCuYFiTYEqi2rNk+C1leadvkM7j5dpar2s3ivKLuif4Px
         sd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5vBFARuIRiK64V5wwqFkQ5kzYGu77jWfbY7LeM0ol8=;
        b=ACZbQ+Kl1jQLfDoAKjLMxhIm+MzBTcyIvTC+lfQrnCP/yjvwB2hdhadx8iFrZsG8Gd
         nsROicY+mxl3OcLZ1NJn4AA0glUZHE/t/dgajbYA4kQOrBBAHcXt4WR2Stmn2Y1hTUT/
         aNkv2gh7V1XJ3vvlglOPCHNGggqjlS4rJsEtHwGYzKO6Dk/cbyCMbQp83Q6d2Cn4Flhq
         0apXGuOfS2kH13Le6UR950+18uyYOwkV+fSjY6oAFiB8T+VqAh4yLrouRXzesLfB0N4x
         e0SitSDpZfX4P84JTw0kQ7rqXQFcLOikrpg7kssSLg796+WRpJ/3VGx6DcqQP/eXnrwF
         IG3w==
X-Gm-Message-State: AFqh2krc4EWPp7B1VdM1wQdah7IbiaRCsAQELQPkHbfXEFarzC+mX9xt
        4zletGW5FCu1do3svLa5Z49Y
X-Google-Smtp-Source: AMrXdXuy76CFoqhJHzUdLoYbZsqoqgin0M+AYQcrcUafsVBfHmWvkfzOtigXyuToV0Hxsvl02rix2g==
X-Received: by 2002:a62:5801:0:b0:574:a541:574a with SMTP id m1-20020a625801000000b00574a541574amr48434720pfb.0.1672912851913;
        Thu, 05 Jan 2023 02:00:51 -0800 (PST)
Received: from thinkpad ([27.111.75.153])
        by smtp.gmail.com with ESMTPSA id a14-20020a62d40e000000b00581fddb7495sm11582395pfh.58.2023.01.05.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 02:00:50 -0800 (PST)
Date:   Thu, 5 Jan 2023 15:30:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     jejb@linux.ibm.com, andersson@kernel.org, vkoul@kernel.org,
        quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org
Subject: Re: [PATCH v5 00/23] ufs: qcom: Add HS-G4 support
Message-ID: <20230105100044.GA4463@thinkpad>
References: <20221222141001.54849-1-manivannan.sadhasivam@linaro.org>
 <yq17cy84gqc.fsf@ca-mkp.ca.oracle.com>
 <20230102084707.GA16638@thinkpad>
 <yq1r0w91zbw.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq1r0w91zbw.fsf@ca-mkp.ca.oracle.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 04, 2023 at 09:37:56PM -0500, Martin K. Petersen wrote:
> 
> Manivannan,
> 
> >> >   scsi: ufs: core: Add reinit_notify() callback
> >> >   scsi: ufs: core: Add support for reinitializing the UFS device
> >> 
> >> I would like to see some reviews of the proposed core changes.
> >> 
> >
> > Both patches are reviewed by Bart now.
> 
> Series applied to 6.3/scsi-staging, thanks!
> 

Thanks Martin! I presume that you have applied only the ufs patches as
mentioned in the cover letter. PHY patches are expected to go through PHY tree.

I cannot see the patches in 6.3/scsi-staging branch yet, so couldn't confirm.

Thanks,
Mani

> -- 
> Martin K. Petersen	Oracle Linux Engineering

-- 
மணிவண்ணன் சதாசிவம்
