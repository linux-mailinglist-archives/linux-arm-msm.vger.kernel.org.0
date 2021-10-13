Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2B442CA43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238842AbhJMTpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:45:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhJMTpU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:45:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3754C61168;
        Wed, 13 Oct 2021 19:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634154197;
        bh=kxx6qSJDYHoxkFWZ4ccupRgAJMQ7LGk0GVSwe4h3qhM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qbeuLZlYo3zfRxiuIvRxcDpA4iQYJ066j0vHp79jE/OVg0DAlcVP+knLAYQIg0YPz
         ARi1Y/5q+cF134gZaYCjgjfEQ6oNZtMCL+VghMkgzVOHIXBhFiCEWvdRYJ3pGJI4Qv
         hyriSI5bOv93I5LXy3YWsTuuodUr+bvTqxszaPuKrogNl/0zsVFSLg9l1l+OR7+tJO
         hbOfaN7qOFNw0MgjC6eh3d0ctCIJ1UN/K8RlsKKWnvsjWQRIlOOkyswhvtF1UVqrIk
         x3v8FaW+Pv1/fGo2u92B56PkXaXJpTFVg+7pO+ceVPO6TyUOFTMP7JxAl/vpfZpO3A
         vtvEDuVgnWf5Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210917030434.19859-3-shawn.guo@linaro.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org> <20210917030434.19859-3-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: qcom,rpmcc: Document QCM2290 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 13 Oct 2021 12:43:16 -0700
Message-ID: <163415419608.936110.16002101106493067405@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-16 20:04:33)
> Add compatible for the RPM Clock Controller on the QCM2290 SoC.
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
