Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB4F56B2CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 08:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbiGHGdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 02:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237068AbiGHGdN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 02:33:13 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D8D24F11
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 23:33:12 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cp18-20020a17090afb9200b001ef79e8484aso848396pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H1rFqef4sJqptg9wHlXMkGLnOhStTJVvsg+RpqiXZhk=;
        b=jL0OXwDeT+1BLLHSd6unR57Dv5PwlNfa7iNaZQD2rw94eOeYM08Qqo1iWM+WwQynIT
         ccvZC1ZZe0k97NHcgxamAatBF+1h5zfI/O3AkZ6VRHfwdU4tdq4TSz2sFYHVcnmTUC8Q
         Q5kGajtSsJhMh1eycHPlDVZ1HKN0VErfulPmLtwxDqJq+dR0z0+nX7NSK2nFCG8hrXAW
         o4S7wtCQpJ1NnYmwlUFiTLxnvedE2uDefGtz2IUI3cTimcANvENK2X4UdmBLRIhxAfy7
         JKPR51kqUFwWhmGMVGhWgP2Eq9xCmYm5hHmrqhTwihyVAUDC6sjqgG7t2/8V3gOQAIvn
         g+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H1rFqef4sJqptg9wHlXMkGLnOhStTJVvsg+RpqiXZhk=;
        b=FlOvVa71Cr8ElTJm1plBSoglDgmIdWa4rVgGkIDb7cxTNTRA1f7oMggSRJW6kPAD3q
         VjCvLU5nl+bK1YyavwH15arleqKnK9CIbxhGxs8Fw6ofzLqA58r4nKj9eHvu1nN5YFXN
         s0jHBikUQoKQCuKODJu1XXNvPndKx/Sxgp+KLKfIpoxEdm0EUgsmvcD6YPfBBIAUkaLF
         Yhoh2Mwuu4qJ8rFABo0hJ+NU9m8uJdF0vSkWt9Vj8MdOzous/qWRKzioh6hPrQjKYpHT
         vYXxv8fAqx8Satj84fHWH+BHDyn+KOiA2w0WzurVaeFvXKRVFYLv/PhNdB/bOMvEtYpq
         pnoQ==
X-Gm-Message-State: AJIora9VEepeR5ljTlKJ+p2YqV0u/7ajbrkKyqW92DHjU0kotL9Mgkri
        Z3/xt8IwUDjHJljmCtrPQbvWCuruWydxQvxO
X-Google-Smtp-Source: AGRyM1vIiK1fNxbF/3rIjWdLVtB8pM6aA+cUUB9WXd9cJtjH5huqkn6sucKxoGt6HsKsrO5RetOsmQ==
X-Received: by 2002:a17:903:32c4:b0:16a:4227:cd68 with SMTP id i4-20020a17090332c400b0016a4227cd68mr1996000plr.173.1657261991495;
        Thu, 07 Jul 2022 23:33:11 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (n058152077182.netvigator.com. [58.152.77.182])
        by smtp.gmail.com with ESMTPSA id i11-20020a1709026acb00b001640aad2f71sm28936148plt.180.2022.07.07.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 23:33:11 -0700 (PDT)
Date:   Fri, 8 Jul 2022 14:33:07 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] interconnect: qcom: icc-rpm: Set bandwidth and
 clock for bucket values
Message-ID: <20220708063307.GB195591@leoy-ThinkPad-X240s>
References: <20220705072336.742703-1-leo.yan@linaro.org>
 <20220705072336.742703-6-leo.yan@linaro.org>
 <28bf991f-7b4c-0af1-2780-842500b01a0f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28bf991f-7b4c-0af1-2780-842500b01a0f@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 07, 2022 at 05:33:58PM +0300, Georgi Djakov wrote:

[...]

> > @@ -321,12 +365,11 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
> >   	provider = src->provider;
> >   	qp = to_qcom_provider(provider);
> > -	list_for_each_entry(n, &provider->nodes, node_list)
> > -		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
> > -				    &agg_avg, &agg_peak);
> > +	qcom_icc_bus_aggregate(provider, agg_avg, agg_peak, &max_agg_avg,
> > +			       &max_agg_peak);
> > -	sum_bw = icc_units_to_bps(agg_avg);
> > -	max_peak_bw = icc_units_to_bps(agg_peak);
> > +	sum_bw = icc_units_to_bps(max_agg_avg);
> > +	max_peak_bw = icc_units_to_bps(max_agg_peak);
> >   	ret = __qcom_icc_set(src, src_qn, sum_bw);
> >   	if (ret)
> > @@ -337,12 +380,23 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
> >   			return ret;
> >   	}
> > -	rate = max(sum_bw, max_peak_bw);
> 
> Looks like max_peak_bw is unused now?

Yes, will drop it in next spin.

Thanks for review.

Leo
