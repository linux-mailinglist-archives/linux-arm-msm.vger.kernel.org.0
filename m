Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024FB7B2582
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 20:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjI1SsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 14:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbjI1SsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 14:48:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DE1BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 11:48:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3248ac76acbso773342f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695926890; x=1696531690; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n8RPDuko3qlkz+UgK/tpbIH2DJ3LBHkN68qFBLWLsdI=;
        b=g91zwaHCQWa5wnfENvpWAUFkh1oxEpmGWgViMbhSq8FSGShnU/XOs0hSRUPKzez/iU
         cVgwH/bzzlNN08OqWVVNNbXAtbvoBBXFNJavetvvDnl7p6pVTeMBh8kNa5DRsH5HzOKw
         RaiUsBLK5l7hHYejpzBRk3sX/uRmP7YcRMMeFYYsUhExSabyuksQeSDa/caIAmrYZU2j
         ep6OiuHAV1QUfh0/xi013KNW49eujrVoId953IpJGFCt3Ui2rQaPPKn+ibjewExGnvko
         nz+sivZEniozRHEMwSe9aemkWuMrzPMgzyBrnof74DATusPMInRvbQOOvSdqHef084fW
         gd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695926890; x=1696531690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8RPDuko3qlkz+UgK/tpbIH2DJ3LBHkN68qFBLWLsdI=;
        b=fUd7DZ9Eb7WNguEqea0cK5bGG8a6lAOJONj8JURtoxPdLPKsipISUaNCASbW8La4vB
         qiOFXAKlehg+fenfEypuQ04A3VuV3jjwsjy4PKr0EeypEbbSkmsAUTtoWB/crnZDKfCs
         6xzGa6nmul6lwD8HaMVlyaA8hFkYd/38UtBSjTy6OH+4DjHcowoqaAryAfo+5Jo8fQd2
         fHcrNKg9unQPjB3oIXOskP5HbHFxeNEjf1oECQeUWVXXjCurcxjZ81WFBosPBjHpbhvK
         SXtAYrrpwg6JPJqajeLKg3mgKofKar2JMOtYvy0yuRELo9vMRMBcQ31Hdnxsayh1bIAS
         KQrA==
X-Gm-Message-State: AOJu0YxEOA3u+HmWp1+/cSlspuOSoPRWpDf7QNzahOvKHnL3CucPA6MD
        t2wx+QlExOAomUQ8ZOirvSZz7YgUAAjM6pD1W8jTn+I=
X-Google-Smtp-Source: AGHT+IF2pQVUw8uuszCxhnmXNiHNk7mS/oqdhuHaOnsXDcrhk36stF7X6v13OulEJZwgo2Bj6k5R3A==
X-Received: by 2002:a5d:538f:0:b0:319:735c:73e1 with SMTP id d15-20020a5d538f000000b00319735c73e1mr2238282wrv.4.1695926889705;
        Thu, 28 Sep 2023 11:48:09 -0700 (PDT)
Received: from thinkpad (ip1f11e5ef.dynamic.kabel-deutschland.de. [31.17.229.239])
        by smtp.gmail.com with ESMTPSA id sd6-20020a170906ce2600b00997e99a662bsm11205205ejb.20.2023.09.28.11.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 11:48:09 -0700 (PDT)
Date:   Thu, 28 Sep 2023 20:48:08 +0200
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     lpieralisi@kernel.org, kw@linux.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, bhelgaas@google.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org
Subject: Re: [PATCH v3 2/3] PCI: qcom-ep: Make use of PCIE_SPEED2MBS_ENC()
 macro for encoding link speed
Message-ID: <20230928184808.GA12574@thinkpad>
References: <20230927154603.172049-2-manivannan.sadhasivam@linaro.org>
 <20230927175542.GA455424@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230927175542.GA455424@bhelgaas>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 27, 2023 at 12:55:42PM -0500, Bjorn Helgaas wrote:
> On Wed, Sep 27, 2023 at 05:46:02PM +0200, Manivannan Sadhasivam wrote:
> > Instead of hardcoding the link speed in MBps, let's make use of the
> > existing PCIE_SPEED2MBS_ENC() macro that does the encoding of the
> > link speed for us. Also, let's Wrap it with QCOM_PCIE_LINK_SPEED_TO_BW()
> > macro to do the conversion to ICC speed.
> 
> In subject, /Make use of/Use/ would make better use of the subject
> line.  Lots of "uses" there :)
> 
> Above, s/let's//, and also s/make use of/use/.
> 

Ok, I will reword accordingly.

> > +#define QCOM_PCIE_LINK_SPEED_TO_BW(speed) \
> > +		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_link_speed[speed]))
> 
> It's a shame to have to duplicate this macro in pcie-qcom.c and in
> pcie-qcom-ep.c, especially since there's nothing qcom-specific in it.
> 
> Would a macro like this fit in interconnect.h?
> 

Unfortunately, no. This macro is neither interconnect specific nor PCI, but a
kind of both used by the driver. So it makes sense to keep it in the driver
itself for now.

If we happen to create a common header for host and ep drivers in the future, it
can be moved to that.

> > -	ret = icc_set_bw(pcie_ep->icc_mem, 0, MBps_to_icc(PCIE_GEN1_BW_MBPS));
> > +	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
> 
> "1" is not very informative here.  Maybe PCIE_SPEED_2_5GT?  (I didn't
> completely verify that this is equivalent.)
> 

No. PCIE_SPEED_2_5GT is defined as 0x14 in pci.h. And I do not want to add a
macro for just "1" here.

- Mani

> Bjorn

-- 
மணிவண்ணன் சதாசிவம்
