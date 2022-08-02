Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB100588270
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 21:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiHBTWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 15:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiHBTWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 15:22:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573691A3A4;
        Tue,  2 Aug 2022 12:22:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E64AB61499;
        Tue,  2 Aug 2022 19:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA53C433C1;
        Tue,  2 Aug 2022 19:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659468120;
        bh=AMeTd/TH+wz4B0prFnYbMYgIJcy1MGrGgMYHOMgkaC0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sSa7cHGEJ59dMNNcV7ayzvpzxjcf6bZnXD7z6h+IKboTQWWcVu+hThb9PI77PB1yX
         yI5wMfxs3HToyfrDs2hDZIqjf/bkvTr0tZwQQDtGO1YfTrJl31ZY7zNGTyye9EhovK
         YyoPiGhIJtMWdajqts/5VEhfrB3mlMnrvnAx97lAQwN05d/zpq98xfrFaAdpXPHf/X
         GMsjsb/BDFQCl0I/Fe07pRcv0jw29f5ithXZUuTSh/Ya+ULimANB0kYn8vLDD8rHLc
         S6D/6AUPLo46TCDfi+UtMqu0iAqQwaIAaIh1E9bXh+FDQqp5Aq2Pse3lXNRrPYdocT
         y/bo4HsuQGd0g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220801033723.707019-1-bjorn.andersson@linaro.org>
References: <20220801033723.707019-1-bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v5.20
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Nikita Travkin <nikita@trvn.ru>,
        Jonathan Marek <jonathan@marek.ca>,
        Robert Foss <robert.foss@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Li kunyu <kunyu@nfschina.com>,
        Ren Zhijie <renzhijie2@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org
Date:   Tue, 02 Aug 2022 12:21:58 -0700
User-Agent: alot/0.10
Message-Id: <20220802192200.3DA53C433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-07-31 20:37:23)
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a=
56:
>=20
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-5.20
>=20
> for you to fetch changes up to 5e1e12d2992006a4e950ebf2e2a1f0ebaabd969f:
>=20
>   clk: qcom: gcc-msm8994: use parent_hws for gpll0/4 (2022-07-18 21:40:36=
 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
