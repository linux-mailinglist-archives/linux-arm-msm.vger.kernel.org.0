Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747177D49D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 10:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbjJXISU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 04:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbjJXISP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 04:18:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C0A120
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698135493; x=1729671493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7QVOr2l9IkqK5fhUb2FEMJd3ZS09lqWiYLaA5pxdWyc=;
  b=GAnf26rY5EbowqeoSLo7eieNQGj96TMgBsT6QmqN9SAIlmVSVOcYO3dK
   bPM2cKHANFumWepK4+0iQHNe+hsZARpW+3FQPl2CSnLuXhvR/dDUciIA8
   NabD1sXc18xMy/6PQSSlSp9YPOcPdgr7FmDPJorq/bW4ClmZ6h9yvyOLB
   cyCoLhTx9A0u4CCP9xnA8GZEk1gqUYxglRGpUdAnO/Ixtv8YOBrWuiXGL
   1uzTIOIuOHDcN+j9oXfkK4RuihA+JNKID6bzVFBV7SNuR9LSOQaR01jD8
   Jmqamfk7O53/eGz2oIFV9C76AH/WhBu+k+WIlbLKowbhrGxwCPJi4yAxE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5633951"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="5633951"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="824216812"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="824216812"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:18:11 -0700
Date:   Tue, 24 Oct 2023 10:17:48 +0200
From:   Kamil Konieczny <kamil.konieczny@linux.intel.com>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [igt-dev] [PATCH igt 1/2] tools/msm_dp_compliance: Small arg
 parsing cleanup
Message-ID: <20231024081748.qewo6ta34cxqpcrh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211208192216.743364-1-robdclark@gmail.com>
 <20211208192216.743364-2-robdclark@gmail.com>
 <08cbf1e8-89c7-c0cd-2928-589e624710b1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08cbf1e8-89c7-c0cd-2928-589e624710b1@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

please add here description, for example what options
you added and why.

On 2023-10-19 at 03:40:04 -0700, Abhinav Kumar wrote:
> Reviving this:
> 
> On 12/8/2021 11:22 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Nit: shouldnt the patch prefix be "PATCH i-g-t" ?
> 
> We will test this out next week and land this.
> 
> > ---
> >   tools/msm_dp_compliance.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> > index 5e491c89..a15a8dd9 100644
> > --- a/tools/msm_dp_compliance.c
> > +++ b/tools/msm_dp_compliance.c
> > @@ -629,7 +629,9 @@ static const char optstr[] = "hi";
> >   static void __attribute__((noreturn)) usage(char *name, char opt)
> >   {
> >   	igt_info("usage: %s [-hi]\n", name);
> > -	igt_info("\t-i\tdump info\n");
> > +	igt_info("\t-h, --help           - print this usage message");
> > +	igt_info("\t--help-description   - print test description");
------------------------------------------------ ^^^^
This is a tool, not a test, so imho s/test/tool/

Regards,
Kamil

> > +	igt_info("\t-i, --info           - dump info\n");
> >   	igt_info("\tDefault is to respond to Qd980 tests\n");
> >   	exit((opt != 'h') ? -1 : 0);
> >   }
> > @@ -709,6 +711,7 @@ int main(int argc, char **argv)
> >   	struct option long_opts[] = {
> >   		{"help-description", 0, 0, HELP_DESCRIPTION},
> >   		{"help", 0, 0, 'h'},
> > +		{"info", 0, 0, 'i'},
> >   	};
> >   	enter_exec_path(argv);
