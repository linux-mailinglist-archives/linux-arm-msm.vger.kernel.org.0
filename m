Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A4E74547A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 06:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjGCERL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 00:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjGCERK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 00:17:10 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECFB193
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 21:17:05 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2883804a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 21:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688357825; x=1690949825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OxVYH9Wks9suyBw2nLMYDF06Gci/zPGti3eMnFSLVs=;
        b=c6cJkNCyqOSuE5I5vUG7MTMI2ZdQ75OX+6GU+FY58Mv7Rgb4OeOWKjMuKo9OqgPVP4
         RHDrIhD8tnkuIkwz4mR+aNhJT6qGShL+KqWIvmXG0GNtqTD7LpLkytb9r2Mke38P5V9d
         aRtxQqmS1JsQyznjpEWKSqBqKEYTu2pqtYDjpDMsVDpybTwLsfWIS5IVdJCqparAU6dS
         drQYEZfzJQxBG0QNPkrKlzHJ2Ig9iaQHjMzEZYSqTdFMsFTYj/qWHdA7Q3WtpdEDi+k3
         /HpitRIMbRI7Uuty3LznXwW0cf4X4hs6wsVRh5n1/I48HgFuYi9hj8vH0T8Cgy/wBEHO
         6cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688357825; x=1690949825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OxVYH9Wks9suyBw2nLMYDF06Gci/zPGti3eMnFSLVs=;
        b=M8UXepqIfjOg4QQzEhuCBlLJXsKBmqa/tL+YpfNEM/1C0G2JSObqBcLeQZdBBE5FZx
         zYxmaJO4u2HtddiviECuYKEOlJHYnEZLrWYhoRgql/7FCOGjzhRxmPFFYznHtuz20UgI
         G2oQVVEAvUJQUroAlS93LCyBvgx72+jOxSGB7j27tWpeuHiUJPSMqVZoO6qIlZjFkwQR
         iC3jwT+09GH6+PMwaTOFOOXS5Q/gwPcXJondVe6jXAtsoCodNPnlxRQ8jMtr7SqC0ckD
         wRdMeOQN7zaHHt4psdJ0WZoqPPeU1MidkwUwFAczRyvkp9LxwASOyaakmAUjmSeZzDKt
         DzSA==
X-Gm-Message-State: ABy/qLZ5K348dP0m5vC19sJ12O8mA273x4ZAxcLy1YFBFSDY9+WpQUab
        /+SmylX3VFanNGiYzvsg6p8WzQ==
X-Google-Smtp-Source: APBJJlFPljXi9LeaSXf7WDj270rKAuCdCoLQCocwupCs5wIshILvwoHTbQO17j0ePv6VXjlHEot66A==
X-Received: by 2002:a17:90a:ff08:b0:263:44dd:f85 with SMTP id ce8-20020a17090aff0800b0026344dd0f85mr9643580pjb.24.1688357824931;
        Sun, 02 Jul 2023 21:17:04 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id z19-20020a17090ad79300b002631f3d36a1sm9287904pju.36.2023.07.02.21.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:17:03 -0700 (PDT)
Date:   Mon, 3 Jul 2023 09:47:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v12 01/10] cpufreq: blacklist MSM8998 in
 cpufreq-dt-platdev
Message-ID: <20230703041701.ntv2f2h7z2welmvn@vireshk-i7>
References: <20230217-topic-cpr3h-v12-0-1a4d050e1e67@linaro.org>
 <20230217-topic-cpr3h-v12-1-1a4d050e1e67@linaro.org>
 <20230628155656.GA542106-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628155656.GA542106-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-06-23, 09:56, Rob Herring wrote:
> On Wed, Jun 28, 2023 at 04:00:40PM +0200, Konrad Dybcio wrote:
> > From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > 
> > Add the MSM8998 to the blacklist since the CPU scaling is handled
> 
> s/blacklist/denylist/ or s/blacklist/blocklist/

They are already named allowlist and blocklist.

> > @@ -143,6 +143,7 @@ static const struct of_device_id blocklist[] __initconst = {

-- 
viresh
