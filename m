Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEA02CD0AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 09:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgLCIBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 03:01:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:43392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728786AbgLCIBI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 03:01:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606982428;
        bh=kfkeqlUyVw+jzcR1Ql+3AOPoXyKIsKn01IamWujdAxU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fQyEyZNCVfkjZB4e1P7kbx7ajItzPCuSfTaPhLCtWdNQLYRlA5Qkzo/Xiw66AHgmN
         mPMFvHzOZvkP3DhUBuKhcQzdNMh/KuLSwgFP0bj3uvgoGADNCAym1H9KhYXrCwaAm/
         RM08NSCFLrVcqVLUR8h4lsbaWolJ2t1hO+4FpM1qEeLm+73r8iHY0pfmUc1MojMiKY
         1iw5T66eIH1rOSbnQ2xprt0SLJUtpgfEmyNZIISpOi8nw7ejWcoIEVRRVGzj3DHIWJ
         PK2zPY4+lmgMxWJnHMukojYbxRzY78KeSsJSKHqEBTzwqwnzTP0CQNTQ5U7vXBAce1
         DED9IKrblwSuQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1603187810-30481-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1603187810-30481-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v2 1/3] spmi: Add driver shutdown support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        srv_heupstream@mediatek.com,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 03 Dec 2020 00:00:26 -0800
Message-ID: <160698242613.3428466.7587415157083415046@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Hsin-Hsiung Wang (2020-10-20 02:56:48)
> Add new shutdown() method.  Use it in the standard driver model style.
>=20
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---

Applied to spmi-next. The line endings are all confused still though.
