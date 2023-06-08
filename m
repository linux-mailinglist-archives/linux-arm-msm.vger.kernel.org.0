Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B52F727E8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 13:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbjFHLOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 07:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbjFHLOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 07:14:14 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A1D1BD3
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 04:14:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6d3f83d0cso4040085e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686222850; x=1688814850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y++8eb57xKQGjRxPQt0BHBMYouZ1Xv40QTV3/gF3FiQ=;
        b=esU7Vh/MUaKl3oy5Ki0cEC9fkOn2Oocdcw9MXRFD9yAUSPTazhIw/9+VE5DaSap8V9
         28/kghfeYMato8IDNpc1eOamE5JHi/X0oR0t6GTQB+BJvoT7JBMHHQIaHIn+BLTbMzub
         wc9nyVl70H/VuEJXmhnEoQOZT21bygy6zt+6D/TB7r755HJeAFkoI1DFNGz1Myv0wh+Y
         1DT6xLn5nDVsjHJEgbwMUULNzcBJCToBs9LVKeRxHz2iU+ne+TufpQXlr3hgq3C3Xky7
         Zwt7gIBDFqiqwkDg0hcZ4WpqFhg4E1fwzZwCm2E6C47Qhy2wkz0+zzN6Tr9nAs/bLYjZ
         0GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686222850; x=1688814850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y++8eb57xKQGjRxPQt0BHBMYouZ1Xv40QTV3/gF3FiQ=;
        b=kZkTsLQYZxg0EsU+0D2QL1LQwPimdYNn/AE29HvgfPpsI8ADSMjGQL8z4y7jH9/VOb
         AwRwmlMI/qmMwnJx26m7QoGvRXxuSFbmzmK4Gs3awyU1FCIHyazpGx9vB6CTDNXx9ng4
         dMetsn0do37t/TtYOHOH0mspmNqhhfKLPzz6B55jHfXUCxweOPP6HSaEHrGlfPEBFc+t
         NNenowhnzrAE0tgHvqOjM4osvPLpqgyAFGc0wzwece18fhctMl461up/iYGRjCKCoxl9
         FxSaG3A93i0ORp2Q9ydbUW7ZjtoociyQZYLk+GlJY9/reR/+mMhKNOUWKkQF8qv9zk4o
         Jy9g==
X-Gm-Message-State: AC+VfDw6qs+zf/eTvPpxG+7y/LRaOrnekf+65XQwCkqIc3yORr5yWDCt
        x8B5aFE1Bg1PdrGnyCjzFUpLEA==
X-Google-Smtp-Source: ACHHUZ4cjdXO5JTxcfyxQqFPmsPBxjeh8SXKmJh6VYrhNwxY63eQEPyo/CpgsMtF0fbFji57EFKWNw==
X-Received: by 2002:a7b:c38d:0:b0:3f4:16bc:bd19 with SMTP id s13-20020a7bc38d000000b003f416bcbd19mr1287567wmj.23.1686222849841;
        Thu, 08 Jun 2023 04:14:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c28d100b003f727764b10sm1696661wmd.4.2023.06.08.04.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 04:14:08 -0700 (PDT)
Date:   Thu, 8 Jun 2023 14:14:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <0a28b64f-e403-46a8-81c9-d1665e8d6948@kadam.mountain>
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
 <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
 <b7762fab-ba49-3929-281d-ca57280e31fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7762fab-ba49-3929-281d-ca57280e31fc@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 08, 2023 at 02:26:14AM +0300, Dmitry Baryshkov wrote:
> On 07/06/2023 17:42, Dan Carpenter wrote:
> > On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
> > > > @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> > > >   	 * frequency divided by the no. of rows (lines) in the LCDpanel.
> > > >   	 */
> > > >   	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> > > > -	if (vsync_hz <= 0) {
> > > > -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> > > > +	if (!vsync_hz) {
> > > > +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
> > > >   				 vsync_hz);
> > > 
> > > Nit: no need to print the value here, you know it's zero.  Could be
> > > clarified to just "no vsync clock".
> > > 
> > 
> > Yeah.  That's obviously not useful.  Sorry, I will resend.
> 
> I'll fix while applying. Seems easier.

Thanks!

regards,
dan carpenter

