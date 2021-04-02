Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75297352E7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 19:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbhDBReq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 13:34:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235299AbhDBReq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 13:34:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52A8E6113E;
        Fri,  2 Apr 2021 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617384885;
        bh=wMX4jU/oK8U7TlZYc9a3oh7NxXgMtjC7IUIKYogQpOs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aT2KE5BTHeOTKmbkFmq7P2d5SWsHO9el6gfoi0xRGUHzqbnF07tWlHUTrzj5dWbxM
         1f13qa9HDrUSJLi6xZ5YZbpHEln1A7nQZ4ruSsXe7rN5S8HtKAzHaDhQUT6Qaxp6cl
         Ded55YDbu6SfeyQ1KSoyMsvnohEyHjKo9F4GJYNB8j7WS0TZWPp4h8nkKQ8NK/sky0
         Ni8byNK3ArmGTN82lSDFWI2r4r0WToRthhzmjxkywhkk2t+vayGGFXfYmXwe6zsWch
         ud3MPPbWcfNBrbQGLBLDGIU0INnufiHS43J8zREi861UpJFdM1yU/6ejQ8Q3PPQKV5
         GUHYPkd4ABodQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c92f7a04-f010-4c63-4b39-482a5581317a@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org> <20210325111144.2852594-14-dmitry.baryshkov@linaro.org> <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org> <c92f7a04-f010-4c63-4b39-482a5581317a@linaro.org>
Subject: Re: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported clock sources
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 02 Apr 2021 10:34:43 -0700
Message-ID: <161738488399.2260335.10137992073962455023@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-01 18:49:37)
> On 02/04/2021 04:23, Taniya Das wrote:
> > Hi Dmitry,
> >=20
> > On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> >> video_pll0_out_even/_odd are not supported neither in the upstream nor
> >> in the downstream kernels, so drop those clock sources.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> =C2=A0 drivers/clk/qcom/videocc-sdm845.c | 8 +-------
> >> =C2=A0 1 file changed, 1 insertion(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/videocc-sdm845.c=20
> >> b/drivers/clk/qcom/videocc-sdm845.c
> >> index 5d6a7724a194..7153f044504f 100644
> >> --- a/drivers/clk/qcom/videocc-sdm845.c
> >> +++ b/drivers/clk/qcom/videocc-sdm845.c
> >> @@ -21,24 +21,18 @@
> >> =C2=A0 enum {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P_BI_TCXO,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P_CORE_BI_PLL_TEST_SE,
> >> -=C2=A0=C2=A0=C2=A0 P_VIDEO_PLL0_OUT_EVEN,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P_VIDEO_PLL0_OUT_MAIN,
> >> -=C2=A0=C2=A0=C2=A0 P_VIDEO_PLL0_OUT_ODD,
> >> =C2=A0 };
> >> =C2=A0 static const struct parent_map video_cc_parent_map_0[] =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { P_BI_TCXO, 0 },
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { P_VIDEO_PLL0_OUT_MAIN, 1 },
> >> -=C2=A0=C2=A0=C2=A0 { P_VIDEO_PLL0_OUT_EVEN, 2 },
> >> -=C2=A0=C2=A0=C2=A0 { P_VIDEO_PLL0_OUT_ODD, 3 },
> >=20
> > These are supported from the design, please do not remove them. It is=20
> > just that in SW currently it is not being used.
> > But SW can decide to use them as they want. As said earlier these are=20
> > defined in the HW plans and thus do not want them to be updated manuall=
y=20
> > to create a mismatch.
>=20
> The problem arises during conversion of these drivers to use parent_data =

> instead of parent_names. You see, video_pll0_odd/_even are clocks which=20
> should be referenced using .hw (and thus defined inside the videocc=20
> driver) as we do for "video_pll0" parent. However there are no clk_hw=20
> entities defined for those clocks. For now I'd just use the { .name =3D=20
> video_pll0_out_odd" } entry for those clocks, however I still think this =

> is not correct.
>=20

Yes we shouldn't be adding .name anymore. Can we add the
video_pll0_out_{even,odd} clks? Or if they're not used then can we
remove them from the parent_data and leave some sort of comment
indicating that they may be there?

> >=20
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { P_CORE_BI_PLL_TEST_SE, 4 },
> >> =C2=A0 };
> >> =C2=A0 static const char * const video_cc_parent_names_0[] =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "bi_tcxo",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "video_pll0",
> >> -=C2=A0=C2=A0=C2=A0 "video_pll0_out_even",
> >> -=C2=A0=C2=A0=C2=A0 "video_pll0_out_odd",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "core_bi_pll_test_se",

Looks like in this case it would be OK because the array would be length
2 instead of length 5.

> >> =C2=A0 };
