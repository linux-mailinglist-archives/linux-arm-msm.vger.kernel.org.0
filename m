Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45DE756526F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 12:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiGDKd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 06:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233898AbiGDKdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 06:33:50 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB12EE32
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656930825; x=1688466825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-description:in-reply-to;
  bh=7D6VXfCbymGOLQobeavPWYIeK6hpDpNNjUEezAOuew8=;
  b=SaROHGcy6Hltx5tau1pRNST98TZXdI/hXgIEB89K68lOHk6B5wNuE03d
   ipnlvpz9/PGRZTcHNQpcGv3eTSvqVGQnYWVD0BrH1Tc0HLkuAbngod7th
   P2d801suG+W8y4o01xC27ONNKHJDXTbDzokXJmCqAXN9cqCee07qy0iiq
   Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Jul 2022 03:33:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 03:33:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Jul 2022 03:33:44 -0700
Received: from hu-ppareek-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Jul 2022 03:33:42 -0700
Date:   Mon, 4 Jul 2022 16:03:38 +0530
From:   Parikshit Pareek <quic_ppareek@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3] soc: qcom: Fix the id of SA8540P SoC
Message-ID: <20220704103338.GB19120@hu-ppareek-blr.qualcomm.com>
References: <20220513175849.4335-1-quic_ppareek@quicinc.com>
 <YrfPTRDFvwQSIMaO@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Description: Re: [PATCH v3] soc: qcom: Fix the id of SA8540P SoC
Content-Disposition: inline
In-Reply-To: <YrfPTRDFvwQSIMaO@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 25, 2022 at 10:15:25PM -0500, Bjorn Andersson wrote:
> On Fri 13 May 12:58 CDT 2022, Parikshit Pareek wrote:
> 
> > Change the id of SA8540P to its correct value, i.e., 461.
> > 
> > Fixes: 76ee15ae1b13 ("soc: qcom: socinfo: Add some more PMICs and SoCs")
> > Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> > Reviewed-by: Eric Chanudet <echanude@redhat.com>
> > Tested-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  drivers/soc/qcom/socinfo.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> > index cee579a267a6..c37d7724c7d0 100644
> > --- a/drivers/soc/qcom/socinfo.c
> > +++ b/drivers/soc/qcom/socinfo.c
> > @@ -328,7 +328,7 @@ static const struct soc_id soc_id[] = {
> >  	{ 455, "QRB5165" },
> >  	{ 457, "SM8450" },
> >  	{ 459, "SM7225" },
> > -	{ 460, "SA8540P" },
> > +	{ 461, "SA8540P" },
> 
> I don't have any objections to this addition.
> 
> But I have a board with soc_id of 460, so can you please correct the
> entry for that instead of removing it?
Sure, the entry 460 should be introduced for "SA8295P". Thanks for intimation, and sorry for late response.
> 
> Thanks,
> Bjorn
> 
> >  	{ 480, "SM8450" },
> >  	{ 482, "SM8450" },
> >  	{ 487, "SC7280" },
> > -- 
> > 2.17.1
> > 
Regards,
Parikshit Pareek
