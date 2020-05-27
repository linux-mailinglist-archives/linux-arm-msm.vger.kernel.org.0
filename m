Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDA01E3611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 05:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387395AbgE0DBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 23:01:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DBX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 23:01:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28A24207D3;
        Wed, 27 May 2020 03:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590548483;
        bh=GSNjuoOW/ENlsqZ0R0tBcdV66uLbsAGduBVnNd+Rd6Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WyExzEfJLBFJaKzzsUCoEWQliD48T2Kq4t7Ujx9osNkp6ayKBsp6sqW0BqaPWS85S
         I3/XGw5ADWCc5ME3JVVu/4OtHWWYzuJq5UDSFJhudY/QEecntIobEbZpQTORBg2+Iq
         /97gggFSnoyAzJuplyrGOD58kXlvHgeyc8SgVeFY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200501205728.152048-2-konradybcio@gmail.com>
References: <20200501205728.152048-1-konradybcio@gmail.com> <20200501205728.152048-2-konradybcio@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: clock: rpmcc: Document MSM8936 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Tue, 26 May 2020 20:01:22 -0700
Message-ID: <159054848237.88029.4027832676445702512@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-05-01 13:57:27)
> From: Vincent Knecht <vincent.knecht@mailoo.org>
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Applied to clk-next
