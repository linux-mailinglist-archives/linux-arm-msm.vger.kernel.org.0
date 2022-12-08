Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CDA6466E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 03:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiLHCX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 21:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLHCXg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 21:23:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA826934D9;
        Wed,  7 Dec 2022 18:23:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B8F461D43;
        Thu,  8 Dec 2022 02:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9410C433D6;
        Thu,  8 Dec 2022 02:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670466209;
        bh=ctNvEkMwUgwEJ9SlshFrR+/sf9kEHQBdQRj2f79tMZ0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LLbQ5C03QVMTeUy19/862Rs8zTCftgNiCG2tor2i/i42zXU+l2xfudtXtOe23gfAw
         XTKDRmwv1YaCiKjaq2F3lI31z9gA5hRh7fquPsrrCNlhvOPvA1ZtNreikJRMG35y2l
         p2NPA71JbalZgYNOmaeYCYjFfAmS3SxeAne8LIo2DqEwb1ZdMAquOToDFiPQLBlCsy
         oUY7zHP9aevkWmzWmDQ2w6BmncVgKWOryEViG++17kllt08+1jetSk2xcXJ/MZTtQz
         QFb20MGrKlVRPdakShU4mxAlce7eqZ/zIJTBSz34pbNU06B8ZzpFSNJV+GQ9+L808V
         BOtHa6Kozxm5A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221207204626.3253372-1-andersson@kernel.org>
References: <20221207204626.3253372-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for 6.2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lin@vger.kernel.org, Meng-Bo <linmengbo0689@protonmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Robert Marko <robert.marko@sartura.hr>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Wed, 07 Dec 2022 18:23:27 -0800
User-Agent: alot/0.10
Message-Id: <20221208022329.C9410C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-12-07 12:46:26)
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.2
>=20
> for you to fetch changes up to 2931aa6758da9f871b4bd7ee52a4be2f9d24e6ce:
>=20
>   clk: qcom: rpmh: add support for SM6350 rpmh IPA clock (2022-12-06 12:3=
0:20 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
