Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745B37DA158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 21:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjJ0TcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 15:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjJ0TcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 15:32:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31401AC;
        Fri, 27 Oct 2023 12:32:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDECC433C8;
        Fri, 27 Oct 2023 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698435135;
        bh=fuguKJFE9lKtUWRw70P5TBucVFe6hqfcM6H/II3Mo/U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MV82OZB3QCcVVKUElTSqoORgwwRJ6uCW3atikncbLA/Aj7i9JubfgWVds3TLsjBMA
         DQswiqdTzdz2TjFSAIzNQnKZNbufJOrcdeGFiO91EoYZ6eJ9v9DlAPFTZLbxIhDg/o
         Ee98yFqPzIzdjjFjx+/VxjqjSQAqxb8WD46XKewI/98TvT32NCNHkCgc1gHRjQH/0W
         jJ4hVgwcwnXUnCFU1082cLYzM9IsO3wvQITaSeIvtLuJk7tkBT+GlftW8Tx3aH5lKi
         PqVXxxIjzcI7vhXwz8dTGY9D04FpEnfrIyxWzH8cne9qqm3ORClAxjkml7L7rTrYPg
         0+sLorSisag7A==
Message-ID: <7e0177324fe451aa9fc7c68511533aaf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231027151105.1317488-1-andersson@kernel.org>
References: <20231027151105.1317488-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 27 Oct 2023 12:32:13 -0700
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

Quoting Bjorn Andersson (2023-10-27 08:11:04)
>=20
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>=20
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.7
>=20
> for you to fetch changes up to e0e6373d653b7707bf042ecf1538884597c5d0da:
>=20
>   clk: qcom: apss-ipq6018: add the GPLL0 clock also as clock provider (20=
23-10-21 12:59:13 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
