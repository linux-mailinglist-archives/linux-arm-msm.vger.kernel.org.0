Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A82C69F682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 15:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjBVOXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 09:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjBVOXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 09:23:45 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB22F3;
        Wed, 22 Feb 2023 06:23:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 621CCCE1DC1;
        Wed, 22 Feb 2023 14:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EE1C433EF;
        Wed, 22 Feb 2023 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677075820;
        bh=FUcKUmojOe5y+lIgn9m2LvFqGYduztP2VvpOJeF5ytA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YMnzBRw94hattP81LW4L+GjsK2NbXMJJv3vP/vbhlZ8iYb0Csx2NN6KRzIWJR+bhP
         F5Cwh+Dgo54VXfuK/cyO+r0yLTwj1ClsNEB33dwt8NLtduHqaSrRHjjm3/7/QIbh9j
         3YTRnefEBHo4KjQjOALp7vOmJfLXsmIF8SEaZCCRRYlCdvjYA9So/sxwnPHGR7RwNm
         wz1D4x/8s7yZ5ZrgZW/4/xw45ahomZYIY/RPdmKRM/JgqDAI5kFMCyNQQg8L+lmh2g
         JCMe11el24VewuIfxMpXNKlwfXWBqx8HcdOk9RuH6I5X8ZftrYb8TkM7i3QSgtG0Lv
         CEiboOalQjXOA==
Date:   Wed, 22 Feb 2023 06:27:07 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Message-ID: <20230222142707.43embhopp7ijx5us@ripper>
References: <20230219045318.564342-1-andersson@kernel.org>
 <e62613b331da617d53515998a2c967d1.sboyd@kernel.org>
 <4aee9ad3-fe3b-7be3-ce71-df2365dd3482@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aee9ad3-fe3b-7be3-ce71-df2365dd3482@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 22, 2023 at 09:35:31AM +0100, Krzysztof Kozlowski wrote:
> On 21/02/2023 20:50, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2023-02-18 20:53:18)
> >> clk_disable_unused() is altered, to not consider clocks which comes from
> >> a provider with sync_state defined. This makes it possible for
> >> individual clock drivers to invoke this process once all clients has
> >> been probed, avoiding the need for booting many systems with
> >> clk_ignore_unused.
> >> This is then enabled for SDM845 and SC8280XP clock controllers.
> > 
> > This needs to be reverted. I'm not going to pull this until then.
> > 
> >>
> >> Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
> >> clock controller, SM8550 TCSR and display clock controller, SM6350 clock
> >> controller, nd MSM8996 CBF and APCS clock controllers is introduced..
> >>
> > [...]
> >>
> >> Bjorn Andersson (5):
> >>       Merge tag '1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com' into clk-for-6.3
> >>       Merge branch '20230104093450.3150578-2-abel.vesa@linaro.org' into clk-for-6.3
> >>       clk: qcom: Remove need for clk_ignore_unused on sc8280xp
> >>       Merge branch '20230103-topic-sm8550-upstream-dispcc-v3-1-8a03d348c572@linaro.org' into clk-for-6.3
> >>       Merge branch '20230112204446.30236-2-quic_molvera@quicinc.com' into HEAD
> > 
> > When you make merges, please describe what they're for and put that in
> > the commit text. Also, reword things like 'into HEAD'.
> 
> I think these are all merges of patchsets (eg. b4 shazam --merge
> <patchset_id>), thus it's the same as applying.
> 

No, these are when I pick binding patches with include files on a
separate topic branch, for merging into the clk and dts branches.

So it's manual, and I can certainly improve these.

Regards,
Bjorn

> Best regards,
> Krzysztof
> 
