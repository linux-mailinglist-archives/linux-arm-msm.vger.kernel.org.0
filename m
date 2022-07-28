Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5C65835F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 02:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbiG1AUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 20:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbiG1AUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 20:20:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB29421E2B;
        Wed, 27 Jul 2022 17:20:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 674EF616F9;
        Thu, 28 Jul 2022 00:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6A6C433D6;
        Thu, 28 Jul 2022 00:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658967621;
        bh=XXheh9mqQDG3PaGTXFAtn6/QW0kvLQwVCz2hrunYYhM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tp6nvtlyMl7PUOOQe6aUhPfQ6VoiX/t0XQxIFemkOnC6ZsowTE3NGaO8WMv+526Ua
         oAk+Y1eQNEtRFd8hQoofQy2IDrCJmL42bsNc3gdi2QiSubW/Hj+9xxEmKiadu8GqD7
         1omO5Mjsgdh7IZtNQPxJqhnok1QNVui6L8qxp8QTsFJDUC54M+qjntHQEWGPwToMEi
         cnUukWDdUdNbwOYPa99kTtjBD4n9UMWO0VGSMpRYWUrm0pYLITQjHrYQhpR06vyfYJ
         IZld7mj02WoZb0JwNFdE2qOQ8vygEpehAM4izDe8/aphZPhWS8RwIqaCCpQXX1hzHW
         iu8U+YNK0Pb5A==
Date:   Thu, 28 Jul 2022 01:20:13 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Archit Taneja <architt@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] drm/msm/dsi regulator improvements
Message-ID: <YuHWPbMJpvzI4Q8F@sirena.org.uk>
References: <20220726173824.1166873-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QzwTGW35j9Lkz65d"
Content-Disposition: inline
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
X-Cookie: No motorized vehicles allowed.
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--QzwTGW35j9Lkz65d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 26, 2022 at 10:38:17AM -0700, Douglas Anderson wrote:

> * After that I have patches that add to the regulator API and then
>   show a usage of those in the DSI driver. I'd expect that the two
>   regulator patches could land in the regulator tree. The DSI patches
>   would need to wait until the new regulator changes are available.

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-load-bulk-api

for you to fetch changes up to 1de452a0edda26f1483d1d934f692eab13ba669a:

  regulator: core: Allow drivers to define their init data as const (2022-07-27 13:47:30 +0100)

----------------------------------------------------------------
regulator: Consumer load management improvements

The main goal of this series is to make a small dent in cleaning up
the way we deal with regulator loads. The idea is to add some extra
functionality to the regulator "bulk" API so that consumers can
specify the load using that.

----------------------------------------------------------------
Douglas Anderson (2):
      regulator: core: Allow specifying an initial load w/ the bulk API
      regulator: core: Allow drivers to define their init data as const

 drivers/regulator/core.c           | 20 ++++++++++++--------
 drivers/regulator/devres.c         | 28 ++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h | 16 ++++++++++++----
 3 files changed, 52 insertions(+), 12 deletions(-)

--QzwTGW35j9Lkz65d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLh1j0ACgkQJNaLcl1U
h9BPcQf9GPCWEomdabnhH7GCmgmAzwu/Nlx2FCFvYeXoCpuaINN3KbtkjSFWzHkk
kytEcl/slC5uu8bQ6MbnAIOQ2R2qKEPyiF9t7TL4y3HEE+9nYp4K40kJFq0Fa2c2
mNIKO8ZLShH3UvymPdF04WgerfKOCSlKuB6B1wAIGzhtsOUoQqMFdvyeJy/Lf4NW
8rTpcC8n9NZqDBN+B/sKxxxiENdwykMexZw2TQ1hhOo788tmSmelbvTRbWDgp5iT
F/LJL6A97+BAbmRcFeDYEfWQtwkzSsVtR+KbpTAXpYmfJGjQut/lCGSxKy59wYHz
Jgq5sucnh/e6WSb20C7HDpFRLDb2GA==
=zdxm
-----END PGP SIGNATURE-----

--QzwTGW35j9Lkz65d--
