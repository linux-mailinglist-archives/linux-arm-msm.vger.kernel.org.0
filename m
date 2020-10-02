Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBEE281D94
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 23:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgJBVWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 17:22:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBVWv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 17:22:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25F5E206C9;
        Fri,  2 Oct 2020 21:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601673771;
        bh=IcJ1rDHM6bTzhYMuUHElpqWyvlYFI8mYvdUFY0t0uIs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tZB1WbZU/mRsNNYv0inJMdzOlH8xoKix9QXeRsLdfxgYB1SrkwAmXNIr0tu81CbV1
         v3QUDM+KIjNUS8dw+YN33845j5qSoCfJzgpwcuvWuy46pGltSghfuXA6edBjN8SLiV
         gezex88GG1362ccXx6rL/LIqfTMuP5bHtk3z/ybA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d9f8255a6996596e4fb9dc6404da160d7a4af77f.1601333246.git.gurus@codeaurora.org>
References: <cover.1601333246.git.gurus@codeaurora.org> <d9f8255a6996596e4fb9dc6404da160d7a4af77f.1601333246.git.gurus@codeaurora.org>
Subject: Re: [RESEND PATCH v1 1/2] bindings: pm8941-misc: Add support for VBUS detection
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 02 Oct 2020 14:22:49 -0700
Message-ID: <160167376992.310579.1594629547444861122@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Guru Das Srinagesh (2020-09-28 15:49:08)
> From: Anirudh Ghayal <aghayal@codeaurora.org>
>=20
> VBUS can be detected via a dedicated PMIC pin. Enable compatible string
> that adds support for reporting the VBUS status.
>=20
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt | 2 +-

Can this be converted to YAML?

>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.tx=
t b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> index 35383adb..91a49af 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> @@ -8,7 +8,7 @@ PROPERTIES
>  - compatible:
>      Usage: required
>      Value type: <string>
> -    Definition: Should contain "qcom,pm8941-misc";
> +    Definition: Should contain "qcom,pm8941-misc" or "qcom,pmd-vbus-det";
> =20
>  - reg:
>      Usage: required
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
