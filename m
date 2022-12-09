Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863AE647B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 02:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiLIBZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 20:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiLIBY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 20:24:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50103801E8;
        Thu,  8 Dec 2022 17:24:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0470EB826C2;
        Fri,  9 Dec 2022 01:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5618C433EF;
        Fri,  9 Dec 2022 01:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670549082;
        bh=ZahSRWF+P64NKZkMoxAI9bLc4UhlnFxzHegIxBZujaI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hRhWd/uAwVT3tOL+7/y4VE1ByUUSY5hu5xvyuUY+8vG4mH9W00LNnH1+JALsDBA2G
         U2yaEEh3Nk4y/8RFgyPBXojV7riKWsOeWctFVbnddaP/68jXEiqlcKIJCGZQ2vma2N
         RJQuYNsXKwZt3BEpnCSAYxGtQg8ioFv68R/lucRD3EUUNrFt9CyxVRKnPUFtWLyMME
         T5BAu6+dEsq7ep2NKcYOHDP3zSZx7GCpTUcnhU8MTDnbX6gyiBotU4vXa4Wd+ZatoE
         NQNSEXzF5RTCyu5KNWb4z2kk7iVUVwo42ZWuOv3lZVqjDubxrwGx6s0ZJlEVbr6RCA
         Rs3et8mgl01bw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221208141912.47262-3-dmitry.baryshkov@linaro.org>
References: <20221208141912.47262-1-dmitry.baryshkov@linaro.org> <20221208141912.47262-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sm6375: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 08 Dec 2022 17:24:40 -0800
User-Agent: alot/0.10
Message-Id: <20221209012442.A5618C433EF@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-08 06:19:12)
> Change several parent_data entries with only .hw entries to parent_hws
> instead.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
