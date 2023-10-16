Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FA47CAE4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 17:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbjJPPzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 11:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbjJPPzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 11:55:16 -0400
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C4AAD
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 08:55:13 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 341E31C07B1;
        Mon, 16 Oct 2023 17:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from abscue (dslb-088-078-201-093.088.078.pools.vodafone-ip.de [88.78.201.93])
        by srv01.abscue.de (Postfix) with ESMTPSA id 974DE1C07B0;
        Mon, 16 Oct 2023 17:55:08 +0200 (CEST)
Date:   Mon, 16 Oct 2023 17:55:03 +0200
From:   Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] ASoC: qcom: q6core: expose ADSP core firmware version
Message-ID: <ZS1c14Z+NUmlyvFx@abscue>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-2-otto.pflueger@abscue.de>
 <6ff78ead-fe41-496f-afdc-a83eee27f652@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ff78ead-fe41-496f-afdc-a83eee27f652@sirena.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 16, 2023 at 01:47:28PM +0100, Mark Brown wrote:
> On Sat, Oct 14, 2023 at 07:26:22PM +0200, Otto Pflüger wrote:
> 
> > +		for (i = 0; i < g_core->svc_version->num_services; i++) {
> > +			struct avcs_svc_info *info;
> > +
> > +			info = &g_core->svc_version->svc_api_info[i];
> > +			if (info->service_id != APR_SVC_ADSP_CORE)
> > +				continue;
> > +
> > +			switch (info->version) {
> > +			case AVCS_CMDRSP_Q6_ID_2_6:
> > +				core->adsp_version = Q6_ADSP_VERSION_2_6;
> > +				break;
> > +			case AVCS_CMDRSP_Q6_ID_2_7:
> > +				core->adsp_version = Q6_ADSP_VERSION_2_7;
> > +				break;
> > +			case AVCS_CMDRSP_Q6_ID_2_8:
> > +				core->adsp_version = Q6_ADSP_VERSION_2_8;
> > +				break;
> > +			}
> 
> This doesn't handle unknown versions at all.

The adsp_version is initialized to Q6_ADSP_VERSION_UNKNOWN in
q6core_probe, so it should stay unknown if it doesn't match any of
these values. I don't see any big problems here, but I agree that some
additional handling such as a warning message could be useful.
