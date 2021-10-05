Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2965422E65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 18:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236606AbhJEQws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 12:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236330AbhJEQwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 12:52:40 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364C9C061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 09:50:50 -0700 (PDT)
Received: from [192.168.31.208] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 361721F564;
        Tue,  5 Oct 2021 18:50:46 +0200 (CEST)
Message-ID: <15b74129-111f-a43e-ad10-36722fe86e2e@somainline.org>
Date:   Tue, 5 Oct 2021 18:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-6-marijn.suijten@somainline.org>
 <20211005091947.7msztp5l554c7cy4@maple.lan>
 <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
 <20211005103843.heufyonycnudxnzd@maple.lan>
 <20211005105312.kqiyzoqtzzjxayhg@maple.lan>
 <20211005114435.phyq2jsbdyroa6kn@SoMainline.org>
 <20211005140349.kefi26yev3gy3zhv@maple.lan>
 <20211005152326.5k5cb53ajqnactrg@SoMainline.org>
 <20211005162453.ozckxhm47jcarsza@maple.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211005162453.ozckxhm47jcarsza@maple.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[snipping to not have the entire thread here]
> I've no objections to seeing the DT updated. However I don't really see
> what benefit we get from breaking existing DTs in order to do so.
>
> "Cleaning up annoying legacy" is seldom a good reason to break existing
> DTs since, if we could break DTs whenever we choose, there would never
> be any annoying legacy to worry about. When conflicting properties
> result in uninterpretable DTs then a break may be justified but that is
> not the case here.
>
>
> Daniel.

The only true user of wled as of right now is Xperia Tone platform, 
which does not yet

have display support upstream, so unless one classifies lighting up an 
otherwise black display

a dealbreaker, I think it'd be fine to bend the rules this time.


Konrad

