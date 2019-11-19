Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A35102B75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 19:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfKSSFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 13:05:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:33160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbfKSSFF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 13:05:05 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01B4D21D7F;
        Tue, 19 Nov 2019 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574186705;
        bh=uKTAzFD1mKs+XTRCyqONykLe/ffZgYw8vLohuqeZlGs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vDYo9fHI8GWXyEtRT+bkWLWmPmg4iaUjmRHWcwVORt1w0WiCfrut9AApibr277xTa
         wuloefH0EqdfXZrvEJ4QT22efnCknRxQ8RYEsiITGTpGrq3DEjf8UfihRf7bStwrIL
         REp4jFDlG6/9TkK40bbiqVBaQLA9ZH1aSnNMJoXI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1574074063-9222-1-git-send-email-kalyan_t@codeaurora.org>
References: <1574074063-9222-1-git-send-email-kalyan_t@codeaurora.org>
Subject: Re: [PATCH v1] msm:disp:dpu1: add support for display for SC7180 target
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
To:     Kalyan Thota <kalyan_t@codeaurora.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:05:03 -0800
Message-Id: <20191119180505.01B4D21D7F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kalyan Thota (2019-11-18 02:47:43)
> Add display hw catalog changes for SC7180 target.
>=20
> Changes in v1:
>=20
> 1) Configure register offsets and capabilities for the
> display hw blocks.
>=20
> This patch has dependency on the below series
>=20
> https://patchwork.kernel.org/patch/11243111/
>=20
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
> Signed-off-by: Raviteja Tamatam <travitej@codeaurora.org>

Your signoff chain looks wrong. Probably should have some
Co-developed-by tags here, and then your SoB should be last.

