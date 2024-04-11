Return-Path: <linux-arm-msm+bounces-17222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688D8A1311
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 13:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E222831FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FA61487C3;
	Thu, 11 Apr 2024 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tskvtUXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7A1474C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712835243; cv=none; b=YKChh0qM1mJRoLJyDKknI+lfxi/fQAIRblK4qri4WfnZO+L9U3dYC0aSmpWhPHAfLHAgPTYxy7LT2seue6LwJd6XZlZe5/DkpDla2oda5+c0kFnOTemmfWsf/qyw9rtOioScl9GDwu/MVdrbEC+tCgwdafR6d+bv1vv4SDqScLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712835243; c=relaxed/simple;
	bh=Y+88OsSv3XgE3Uuu3RxfOIXpJMYy7dEQrqh1SIaJyY8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HzOfhGn2N7dD0skhjVo+vC63IJT3ullaUpGuuqh/VLPaItoPjn1/NXgivPimq25gMniMXST96qwb51+CFuSAN9wdZYaxlH5X9JC9OBzfO1FAEe/KqYDOui5H6xtTSAEsI/CrTusCfIl9k+1Hor+ZbTq+AOPIF2+T2lDAvXloSFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tskvtUXE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a521fd786beso68331266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712835240; x=1713440040; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epOc+KLscHkys2dcVLrGJ4JNiyjInB/35e6bFJPpR2k=;
        b=tskvtUXEsrzHPBOV5bGhTj+Z83ArUqU8BBv0RqiMrZfy9mLGAXLkV01iORwnilLMm7
         9cmWkty5CuIlu2WYP6h/vT6mPFl07HSjSd1vAm8cSPT7Lq2ODak7OsEhgJji9b+9BXVJ
         87LsTasjr3tmnbb6Hfzk2BAZwOIeSId0nc47P+W8piADY0CG/uhGajb0O3lc6OsWcmED
         /kiW7OHX9JQ67z5DGC14MrkrI0Ca+NRJztbdfspwtpAKJdtcnaPBmoDamwim82652x7t
         bfcJXgqbKneEBMRbgYgmF1ivlSw93AotY2Q7kK3afeywFDBW6O6rmPfGzs9Bm7Jplxia
         WlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712835240; x=1713440040;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epOc+KLscHkys2dcVLrGJ4JNiyjInB/35e6bFJPpR2k=;
        b=jLlnln57q6wSaZDuh59KP09kdsH3PbN3s91zrZ6gGFHZvOntoI5QM69INF2f/zLBti
         rHbWihdxcVvIjEsvGTDS/krRu5lxRO87drHS9LXIv3ux82vLc0FWJJAIO8sLCWw/uD6J
         0tTZis0q3IQMy9qimmvoTn1Y6BmhGS/x6QjD+C7DR/8Ok/SbCoDz9dzbsEWcgt/5/UiA
         D/6a7a7WdXJ2LPVVe3TnMixPPrK1wHKchM+6mU06i8Vs7BX2rcqoYM3o/a3XCEJ0JxOq
         LjKD2LUe03FGkEmfjF7R875O24B8l24KLlatVW3nfuQr4oZ6zV196MtnvzS8SJaU/tuG
         QZQQ==
X-Gm-Message-State: AOJu0Yy2yUpHv9OamaBlojI/QiIkppYEuOgB6DQnhmPLEXbxYw3xIYL1
	GUOE0YS7vqjErKGwrFKButVot822xZ/2DQDfwhrpFD2iEYv/vRNsdNCg/YraqFw=
X-Google-Smtp-Source: AGHT+IFi4++h6RwrGMN8PN/wk/sEG/2YXD4tmv81B83xFu3Y14Jup9QUbnqiGg3W7nCppXCv+oh7Yg==
X-Received: by 2002:a17:906:c103:b0:a52:2441:99c with SMTP id do3-20020a170906c10300b00a522441099cmr1040746ejc.69.1712835239851;
        Thu, 11 Apr 2024 04:33:59 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709067c9100b00a4a396ba54asm665875ejo.93.2024.04.11.04.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 04:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Apr 2024 13:33:59 +0200
Message-Id: <D0H9F200BT16.2HWU1I45AS1S7@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] clk: qcom: dispcc-sm6350: fix DisplayPort clocks
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@somainline.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.17.0
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
 <20240408-dispcc-dp-clocks-v1-2-f9e44902c28d@linaro.org>
In-Reply-To: <20240408-dispcc-dp-clocks-v1-2-f9e44902c28d@linaro.org>

On Mon Apr 8, 2024 at 1:47 PM CEST, Dmitry Baryshkov wrote:
> On SM6350 DisplayPort link clocks use frequency tables inherited from
> the vendor kernel, it is not applicable in the upstream kernel. Drop
> frequency tables and use clk_byte2_ops for those clocks.
>
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for =
SM6350")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Appears to fix this non-critical error when enabling DisplayPort.

  msm-dp-display ae90000.displayport-controller: _opp_config_clk_single: fa=
iled to set clock rate: -22

And DisplayPort (over USB-C) continues to work as expected, thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

For completeness, I wrote something about this also on #linux-msm IRC on
March 22nd.

> Hi, I'm trying to get displayport to work on sm6350 but hitting a
> weird issue regarding link clk frequency. For the requested link
> rate=3D540000 in dp_ctrl_enable_mainlink_clocks we call
> dev_pm_opp_set_rate with target_freq=3D540000000 (clk name:
> disp_cc_mdss_dp_link_clk) but the clk_round_rate there makes this into
> freq=3D810000 and subsequently qmp_dp_link_clk_determine_rate fails
> because that's not a valid frequency, only for example 810000000.
> Without any debug statements the visible error in kernel log is:
> "msm-dp-display ae90000.displayport-controller:
> _opp_config_clk_single: failed to set clock rate: -22"
>
> So somewhere there seems to be confusion between how many zeroes
> should be where.. But not sure how this is working on other SoCs, I
> don't see anything much different for my SoC
>
> Kernel base is 6.8.1 fwiw
>
> clk_round_rate behavior feels correct as
> ftbl_disp_cc_mdss_dp_link_clk_src lists the frequencies as
> 162000/270000/540000/810000 so it rounds it to the highest available
> frequency of the clock

Regards
Luca


> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-s=
m6350.c
> index 839435362010..e4b7464c4d0e 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -221,26 +221,17 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_s=
rc =3D {
>  	},
>  };
> =20
> -static const struct freq_tbl ftbl_disp_cc_mdss_dp_link_clk_src[] =3D {
> -	F(162000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(270000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(540000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	F(810000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> -	{ }
> -};
> -
>  static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src =3D {
>  	.cmd_rcgr =3D 0x10f8,
>  	.mnd_width =3D 0,
>  	.hid_width =3D 5,
>  	.parent_map =3D disp_cc_parent_map_0,
> -	.freq_tbl =3D ftbl_disp_cc_mdss_dp_link_clk_src,
>  	.clkr.hw.init =3D &(struct clk_init_data){
>  		.name =3D "disp_cc_mdss_dp_link_clk_src",
>  		.parent_data =3D disp_cc_parent_data_0,
>  		.num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> -		.ops =3D &clk_rcg2_ops,
> +		.ops =3D &clk_byte2_ops,
>  	},
>  };
> =20


