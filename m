Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5628523170F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 03:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgG2BJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 21:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:39590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbgG2BJO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 21:09:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C762B2078E;
        Wed, 29 Jul 2020 01:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595984953;
        bh=APvgnHEnCx9cVV1bX5o5XJ7lMUoU4LmVT5mjbqHahw8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2uXTA4OoBJfISTMt2EVeaqZ4ewkBuLublJt+AZfHUa3wx42UHueirkXuaEocbxtpc
         2ttAl0+FOzt6hWaLlaDOlWrY41TyzxdvoQ9/jONHa0Sv2AA15z+1w4sWd6nzZfbVOi
         Hg2bBN8+z/ALOGN9LEn5G1y2r3iDs0dDNnnznI2Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6bb66f529eaab58b3a75eea3386233cbca27f818.1595612650.git.gurus@codeaurora.org>
References: <f22bb151d836f924b09cf80ffd6e58eb286be5d6.1595612650.git.gurus@codeaurora.org> <6bb66f529eaab58b3a75eea3386233cbca27f818.1595612650.git.gurus@codeaurora.org>
Subject: Re: [RESEND PATCH v1 2/2] thermal: qcom-spmi-temp-alarm: Don't suppress negative temp
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Veera Vegivada <vvegivad@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Tue, 28 Jul 2020 18:09:12 -0700
Message-ID: <159598495264.1360974.13987140780290180679@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Guru Das Srinagesh (2020-07-24 10:46:11)
> From: Veera Vegivada <vvegivad@codeaurora.org>
>=20
> Currently driver is suppressing the negative temperature
> readings from the vadc. Consumers of the thermal zones need
> to read the negative temperature too. Don't suppress the
> readings.
>=20
> Signed-off-by: Veera Vegivada <vvegivad@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---

Probably needs a fixes tag. And why not make it first in the series?

>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
