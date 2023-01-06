Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BE965FD01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 09:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjAFIqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 03:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjAFIqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 03:46:23 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653AE59FAA
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 00:46:21 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so4555822pjg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 00:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7704TWGlOT9biW+iIZT64FatF6rRcnjwYUtQOdttF18=;
        b=Qzh6CyLZawj7lAuPdlzvPNtNUN5w5z5tt4rTHip/orgibj8P2fgzdrOvM+qknJF/f3
         1dpfPJj8KGJYSUup4DRVge6N3bG/E6bsrp6Jm2FxD0ATcpgFSXXFR4ta6dlm9RZhj8UV
         G6M26mTdsDNlJYfxPZ7pMMTk3E0BWIOMVD0V1n9R70Gl5pGbXqABi8eJDsNoggJAr8wt
         9iLuNqNeOeY4B68y24cYNLVGc1xBYoSrtH5j7n+juegwoRu2CeAgul6nHUNj9cDoE+Ka
         RmBc7EFIgoxjwxF2F+o7ArJ2pyMW1z3swKkwHlA/0Ee8NX1gBFGEjlR1KLzqjm1+0aMs
         HWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7704TWGlOT9biW+iIZT64FatF6rRcnjwYUtQOdttF18=;
        b=B90PYwGst6/xa3AG7cbkwvs9rnSS6U2zEAtdZpfGln8o5bfhHDW54nDSynQAoDoM4G
         ip3e8Mak/rRUOsKQaLBEKvIyupGf5q7yZRg/tYl3dXVJNYj6DvOZSZfKGSM0aTGzZtpR
         WeU0ofnRPih6LiCtBleNmJ92rYdzwy3IPlO2TExJkdDtUpkb8uVtT6o3uTLKPvIoAu2H
         ioF7Sj4rdOSGEbLAciCuq6VhnVyl4N4jCnhT0ifmMxggG0UjHzaH1cIfJS0SclLF6DZY
         0sO6AzJg2FkLoKqJh+IYVelnDVfl2yGQ+q9vTAdICtw5c3CjLPIh0jrs92LhQMj2/5Dg
         9syg==
X-Gm-Message-State: AFqh2krQkYeNmNQnnt7t7R77Q5N2F5V9WD5iOtwXu1rKHv2JreK/sj2q
        JCgmohzu06YAK2Q0Hb2XnG4O
X-Google-Smtp-Source: AMrXdXtW0CUE+lF0WbXsjMGFILtHeiuFcbzJuPhkma60sHYDBtu5vEHeOWpg/hkqjQQD8ZKvp+PrpQ==
X-Received: by 2002:a05:6a21:33a9:b0:af:8ff3:fc78 with SMTP id yy41-20020a056a2133a900b000af8ff3fc78mr76825245pzb.19.1672994780814;
        Fri, 06 Jan 2023 00:46:20 -0800 (PST)
Received: from thinkpad ([117.217.183.19])
        by smtp.gmail.com with ESMTPSA id h69-20020a638348000000b00473c36ea150sm483422pge.92.2023.01.06.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:46:19 -0800 (PST)
Date:   Fri, 6 Jan 2023 14:16:08 +0530
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
Message-ID: <20230106084608.GA5542@thinkpad>
References: <20221222141001.54849-1-manivannan.sadhasivam@linaro.org>
 <yq17cy84gqc.fsf@ca-mkp.ca.oracle.com>
 <20230102084707.GA16638@thinkpad>
 <yq1r0w91zbw.fsf@ca-mkp.ca.oracle.com>
 <20230105100044.GA4463@thinkpad>
 <yq1y1qgz7wu.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq1y1qgz7wu.fsf@ca-mkp.ca.oracle.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 05, 2023 at 10:02:56PM -0500, Martin K. Petersen wrote:
> 
> Manivannan,
> 
> > Thanks Martin! I presume that you have applied only the ufs patches as
> > mentioned in the cover letter. PHY patches are expected to go through
> > PHY tree.
> 
> Correct, I only took the SCSI patches.
> 
> > I cannot see the patches in 6.3/scsi-staging branch yet, so couldn't
> > confirm.
> 
> I did not push my tree to kernel.org as I discovered that one of the
> merges had pulled in a bunch of unrelated commits into staging. Will
> resolve this tomorrow.
> 

Okay. Thanks for confirming!

-Mani

> -- 
> Martin K. Petersen	Oracle Linux Engineering

-- 
மணிவண்ணன் சதாசிவம்
