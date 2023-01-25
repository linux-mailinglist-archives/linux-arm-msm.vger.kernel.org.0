Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB6467BED0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236093AbjAYVkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbjAYVks (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:40:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4E82DE62;
        Wed, 25 Jan 2023 13:40:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09BAD61637;
        Wed, 25 Jan 2023 21:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFF5C433D2;
        Wed, 25 Jan 2023 21:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674682841;
        bh=gDCW1/Hl7XsD9vIqky3GshiwH+qq1NzcuweB8xKmzWI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zjyovy11oCza1qPiSljc7EXPqohcgi753+HpGRHI89ClycN+trpK0HKZYiI4SDatV
         G0aMPjZvp7M9+DwuTIfy7ujQyb6lYPiag5xaOC+51XIhM9KQ4NPt35JAz5BtVmIMca
         2+/2k2nJM0SHui7hOyi9a5v4PE0f8VlVQgh/UqnhNEj4PUUyE7/acQTnEvHRzKUxr9
         kzX0AGg+szwBKtqdD2ibEtMh3OSQNMMVv3xj738ds9lz0DEHm2rTu8E5N+8ffFP0JQ
         CckVRmvbuv/77jeNXKgVIq3oLRsKbr1JmxtQBqDzz4CRkKMGsNUCexYbyfMLNSeZer
         chDj5IjmD4XoA==
Message-ID: <b4dd052421f926b60728f1578e4922e0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3a355075-cc29-957a-678b-2a05aed25587@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org> <20230120061417.2623751-5-dmitry.baryshkov@linaro.org> <078c5a8254ac006b65fc5fa81dfbc515.sboyd@kernel.org> <3a355075-cc29-957a-678b-2a05aed25587@linaro.org>
Subject: Re: [PATCH v3 4/8] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:40:39 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-20 14:53:21)
> On 21/01/2023 00:11, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2023-01-19 22:14:13)
> >> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cb=
f-8996.c
> >> index 9cde0e660228..b049b4f7b270 100644
> >> --- a/drivers/clk/qcom/clk-cbf-8996.c
> >> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> >> @@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_re=
gmap_config =3D {
> >>          .val_format_endian      =3D REGMAP_ENDIAN_LITTLE,
> >>   };
> >>  =20
> >> +#ifdef CONFIG_INTERCONNECT
> >=20
> > Can you move this driver to drivers/interconnect/ ?
>=20
> Only the interconnect part? At some point I considered dropping the=20

Yes only the interconnect part. Use auxiliary bus.

> whole CBF mux support and moving the whole driver to=20
> drivers/interconnect, but I could not find a good way to use alpha-pll=20
> from the interconnect driver. Would you recommend one?

I don't think you need to use alpha-pll code from the interconnect
driver, do you?
