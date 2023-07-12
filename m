Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6770574FF56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 08:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjGLGb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 02:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjGLGbW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 02:31:22 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1ADE1FC1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 23:30:36 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-314172bac25so6498218f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 23:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689143415; x=1691735415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uxEaWwLWc+hET0h2ug0P32dKE47X3QWgDKWE9FH9+fo=;
        b=UGg8jCMk6ynJOyfH4RBv2S99OtAXpP9hX/3eQQHJgFiMMsIAwm9P/FfdSEvEUs/Rc5
         OjfHXG/bb3KqBmOC5rbHTZDSPC2fo/g+kj9jOgZGUYR3hFfQFJ9k0PjONKxmgnnEKfJI
         TH0fCjHCB79ifCpnE6TSvQfctd1TPpfVPyA+xI1seFBPAUGPNu5Kbdp22cA2tb8sSTqm
         UT0Um28/Fm0VRPalVWmfNVKioQhY0y6/Dxlhg1aGRZodK7BtsUfHrxA/77o3qCAjeIFL
         88UF9mN8TjXah8wD8GqOpY0EAfMs8JDe7vAEl72Ex7U+Pyd68uWGFuPk78gUm4efLuNZ
         9PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689143415; x=1691735415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxEaWwLWc+hET0h2ug0P32dKE47X3QWgDKWE9FH9+fo=;
        b=kv2iXkmgShWEjtZZUlZWyaYKRRO5frrUYQ6PxChelg/S4GEucvyPccii3FFYqOu+hi
         rgNXKM5mB7hRBPzgWzE66ie51G+iBVvC7DD5FXPIh3fpupdmS8RkLbUL5+OYTjyIHuIM
         fOMTXnhlkq3I32cboJ2e6QDKHtTsnvsNLMos+x2OY8R9YOGB+VbrFzRuhW8uHGZvpy/A
         Ytev1+MsK+QrgMDPobzUR/c4yr+QqVTpE+Qitb/BrUOm9tLZMhM6/kzfPXtaYu3Lia97
         55xslyHZ1zaYBKZ5WY0VAYyEcT80/ADm2r2MtDKuwd5v4NGGuEHGPdudWW8dL7MaCkTZ
         RAvQ==
X-Gm-Message-State: ABy/qLbvMUWvEMq2a9Z50A3buIBlyChFIu7K2Dzi4hbKiobiEyRFiwjh
        jr4NDxEkfuA5iztXPWxiWSx4NQ==
X-Google-Smtp-Source: APBJJlHGmnVc3EpBQwXKiOhdyq/llV8bMmbe8E+i7Qo5aLAq8hkemnOpVTPP7cuECqjzs2xq6j9Nqw==
X-Received: by 2002:a5d:590f:0:b0:313:e971:53af with SMTP id v15-20020a5d590f000000b00313e97153afmr15585202wrd.32.1689143415239;
        Tue, 11 Jul 2023 23:30:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020adfe812000000b00314417f5272sm4085101wrm.64.2023.07.11.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 23:30:12 -0700 (PDT)
Date:   Wed, 12 Jul 2023 09:30:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in
 encode/decode
Message-ID: <9af2a1c9-a59a-4f7e-a195-82cf5cbd68c9@kadam.mountain>
References: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
 <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 11, 2023 at 11:33:25AM -0600, Jeffrey Hugo wrote:
> On 7/11/2023 2:20 AM, Dan Carpenter wrote:
> > Fixed in v4: Send the correct [PATCH 1/5] patch.
> > 
> > Fixed in v3: Redo messed up threading
> > 
> > Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
> > the >= in encode and decode to >.
> > 
> > regards,
> > dan carpenter
> 
> Did you intentionally drop tags from previous versions?

Sorry, I kept messing up the resends.

> 
> For 1-3, 5
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Looks like 3,5 are reviewed by Pranjal and also good. I see 5 is also
> reviewed by Dafna.  Expect those to be merged.  1,2 need a review from
> Pranjal, but I expect all is good and will be merged.
> 
> I did not see feedback on my question for 4.  Would like your feedback
> before queuing that one up.
> 

Sorry, again.  Yeah.  I think you're right.  Could we queue the rest and
I will resend 4 separately?  I know it's a headache.  If not it's fine,
I can resend them all.

regards,
dan carpenter

