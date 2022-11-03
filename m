Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146FC617C5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 13:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiKCMSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 08:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiKCMSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 08:18:40 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552E125D1
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 05:18:39 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p21so1730901plr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygNaIetYDLkI+evDCg3dhQCdfjyfTMAjhVLdsT971NY=;
        b=mKz/1aczMZ67kTZ72O3gcxFhmzopOSkKcpsO+Zp+R7ACs0+SVrXT34MSkh0JnSvUJN
         pRes/DTOnYOA8IDbUkq/gJQLe1wzu6wqXPbIEf8Z5j2U4Oussq9WhGVLvmbqCQl7KWko
         rB5FUMv/+nw/R55JC15gAsLd1ax+R+4DY+WziYtSTAeHYUiYbXjgJoSXwD13wiftzrB7
         1p5mIBQCHHzjZq7Jvp8h6WCuOTgBx33PKq9wiCsAH7lleXn9pxW4jZE6H3Z69RiVsGEN
         yy1Kvp/t9VIWZrElYKgL3xf/ahnl3wOZnhXoyqhT6B7i1YydkW/foSQxDOO5P8fLGW3h
         uG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygNaIetYDLkI+evDCg3dhQCdfjyfTMAjhVLdsT971NY=;
        b=0mNhkoOwMHYxs85atSqwbw6AAhh9EOEE8EqZSO1ueCEAeosBnYIHQOFLDmtix/00pC
         L85eXnubpihN3Gln7eP14ZEXlb8LO7Igg6lvri74kYuH8OBWo7fHj1G/1BCqkGW7QJs+
         DmNEk8WqKlJBbjsb6DkTI0lKYruScV0vRrFG/GvfGeOXwoiyc4nXow4xAYms/aUubkUk
         CL8PNMWVz+xaMATDRBW2aYkmXuI0m9EdJfbwbmVa26dic0huJ9Uf+kEP9vTkldbISGd7
         pG3GfLVofEOvQUytYKAZIlpwegI0JkDIR1YpFGYGbv86hjiJl58WpM4SJXKVji5F+DQj
         xzNQ==
X-Gm-Message-State: ACrzQf299CEeOiTv8NoEuQFdju2ZnqzsDZZVFu+KNz8O4bPkp4ZTPrWc
        czLDLgXrBYmwWwGTqK4dn4I6
X-Google-Smtp-Source: AMsMyM7l5kGXg75re2lQpzMr+ympZfelYvdDLHbZqWdB90Zy+RAplKpykYidN+wfIs5fosIq4Kwf2Q==
X-Received: by 2002:a17:902:cec8:b0:186:8553:79c8 with SMTP id d8-20020a170902cec800b00186855379c8mr29444683plg.160.1667477918804;
        Thu, 03 Nov 2022 05:18:38 -0700 (PDT)
Received: from thinkpad ([59.92.102.81])
        by smtp.gmail.com with ESMTPSA id w189-20020a6282c6000000b0056c04dee930sm614950pfd.120.2022.11.03.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 05:18:37 -0700 (PDT)
Date:   Thu, 3 Nov 2022 17:48:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 14/15] scsi: ufs: ufs-qcom: Add support for finding HS
 gear on new UFS versions
Message-ID: <20221103121830.GC8434@thinkpad>
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
 <20221029141633.295650-15-manivannan.sadhasivam@linaro.org>
 <cf8dcf53-f131-68f4-c6aa-d41e02ac6d5c@linaro.org>
 <20221031145647.GC10515@thinkpad>
 <d11609d5-963a-de41-86f9-7451f460b6fa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d11609d5-963a-de41-86f9-7451f460b6fa@linaro.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 02, 2022 at 04:05:34PM -0400, Krzysztof Kozlowski wrote:
> On 31/10/2022 10:56, Manivannan Sadhasivam wrote:
> >>>   		if (hs_gear > UFS_HS_G2)
> >>>   			return UFS_HS_G2;
> >>> +	} else if (host->hw_ver.major > 0x3) {
> >>> +		/*
> >>> +		 * Starting from UFS controller v4, Qcom supports dual gear mode (i.e., the
> >>> +		 * controller/PHY can be configured to run in two gear speeds). But that
> >>> +		 * requires an agreement between the UFS controller and the device. Below
> >>> +		 * code tries to find the max gear of both and decides which gear to use.
> >>> +		 *
> >>> +		 * First get the max gear supported by the UFS device if available.
> >>> +		 * If the property is not defined in devicetree, then use the default gear.
> >>> +		 */
> >>> +		ret = of_property_read_u32(dev->of_node, "max-gear", &max_gear);
> >>> +		if (ret)
> >>> +			goto err_out;
> >>
> >> Can we detect the UFS device's max gear somehow? If not, the 'max-gear'
> >> property name doesn't sound good. Maybe calling it 'device-gear' would be
> >> better.
> >>
> > 
> > UFS device probing depends on PHY init sequence. So technically we cannot know
> > the max gear of the device without using an init sequence, but this information
> > is static and should be known to a board manufacturer. That's why I decided to
> > use this property. Another option is to use a fixed init sequence for probing
> > the device and do a re-init after knowing it's max gear but that is not
> > recommended.
> > 
> 
> Why it is not recommended? By whom? You init on some default low gear
> (support for some is mandated by UFS spec) and then allow faster gears
> while you know the capabilities.
> 

This approach is what used in Qcom downstream. I learned that when they tried
submitting to mailing list, it got rejected. So I came up with this approach.

Thanks,
Mani

> > We need "max" keyword because this property specifies the maximum gear at which
> > the device could operate and not necessarily the gear at which it operates.
> > Maybe, "max-device-gear" would make it clear.
> 
> 
> Best regards,
> Krzysztof
> 

-- 
மணிவண்ணன் சதாசிவம்
