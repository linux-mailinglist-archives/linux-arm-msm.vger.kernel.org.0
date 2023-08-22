Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2A4784B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 22:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjHVUsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 16:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjHVUsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 16:48:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D53ECED;
        Tue, 22 Aug 2023 13:48:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A758161E98;
        Tue, 22 Aug 2023 20:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15EDC433C8;
        Tue, 22 Aug 2023 20:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692737310;
        bh=aILIsWQMwP6Mj5nyxK3OtqseZMs0COchyqoscurzKhQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dsS3OKL7mrRgbNc88hSFt6uzeGpHLpTKARKF0Ygmqy7yD6bu+Ug7nml6VPDuTpfCM
         br4CprQs6Ifs3RrJjHCWsEOhyIRB0nSVmzz4gBRtf0NXiqbnizB4a41QiSuBEdShM7
         OJd1cpV9RAChClt6ck2eipk4GLRX9kCCHw4+h3q8Q6HNbs0HQhWHLrW9aVd76IxUq0
         inbkWghGCwJj3nPnVUhlV7xIpbzvHNhChiQWlUULBZBiOH9olRETtQB1iNLg+IOa8y
         hkXGEU5sss9v4V9KK1QDVYK66sXGTMmfEfqSdqgftcW4L/+g0HK0tdLf8XBnWoHjml
         TZtVdSqlMF8xQ==
Message-ID: <ee3587e81b8c982ca6b186c4786b4cd9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230822200837.2734347-1-andersson@kernel.org>
References: <20230822200837.2734347-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.6
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Otto =?utf-8?q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Robert Marko <robert.marko@sartura.hr>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Patrick Whewell <patrick.whewell@sightlineapplications.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <quic_tdas@quicinc.com>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Tue, 22 Aug 2023 13:48:27 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2023-08-22 13:08:34)
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.6
>=20
> for you to fetch changes up to e1cd74b6dccb98ca09e4612ff29c7658db7a487b:
>=20
>   clk: qcom: smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC (2023-08-1=
7 20:09:11 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
