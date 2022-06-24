Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F613558C6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 02:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiFXAtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 20:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiFXAtR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 20:49:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABB13AA42;
        Thu, 23 Jun 2022 17:49:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9E99B8254F;
        Fri, 24 Jun 2022 00:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD78C3411D;
        Fri, 24 Jun 2022 00:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656031754;
        bh=0qCwaq5D4b5O4uYLnizdNCcctcwschOc7iUhpOYaWXU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Are6Plg4wm7dDQ++jHVXmfENbxBErviPpx1JGaIBwLr0oiX8S0dZEAcwSTi4//xxJ
         B8D4SUg/2F2MyW0RFWFssaCLFqpvoNAkSxoXSWnSpP9MMngZIJTMIsuCVZV2DLfDh6
         B1ZJH8NO31a4DI3q752Qelzxh/6cW9cfhZkqMRITnILwB3gKztSzqM89+9QJK6E20u
         BJVTH+nOWT7mpyUebKALg+d7gc1x94Jt1/yyWSFudI1qbz5VtfKM7gYZUyzMHPOBRl
         oo+801YQWtKI7tcKOoLLnDL0ftFvGSs2t5o89GRmFLQKWtDq7g5dOdVBaDRd6b9s3t
         Yqy/gRSvy3ajQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <62b50863.1c69fb81.be104.158e@mx.google.com>
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org> <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com> <20220624003714.918ACC3411D@smtp.kernel.org> <62b50863.1c69fb81.be104.158e@mx.google.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Christian Marangi <ansuelsmth@gmail.com>
Date:   Thu, 23 Jun 2022 17:49:12 -0700
User-Agent: alot/0.10
Message-Id: <20220624004914.5AD78C3411D@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Christian Marangi (2022-06-23 17:42:05)
> On Thu, Jun 23, 2022 at 05:37:12PM -0700, Stephen Boyd wrote:
> >=20
> > Also I'd appreciate clk patches be sent to my kernel.org email instead
> > of chromium to help my filters.
>=20
> Sorry for the OT but as you mention... there are many series for ipq806x
> all reviewed. Wonder if they can be picked or should I RESEND them?
>=20
> Some of them are blocking me from sending other fixes as the current
> dtsi have wrong definition that would cause kernel panic (if things are
> correctly implemented on the driver side)
>=20

Bjorn has agreed to pick up qcom clk patches and send them off as a pull
request to clk maintainers (i.e. me). Please don't RESEND patches unless
requested. When that happens I have to mark the old series as
"superseded" and then look at the resends. Then I review code slower and
everyone is sad.
