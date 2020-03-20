Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3355818DC17
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 00:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCTXem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 19:34:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTXem (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 19:34:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99E0220714;
        Fri, 20 Mar 2020 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584747281;
        bh=KlD7C3t6BH2O4UP6R7njnCijifLTsjKPiRnTBJC0TUU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MMMQSZ5DQwc/CSJKvWD0WRLuljCe26Uu3SstV6VvWn1SCRmvrB585TSDTCrF10Die
         a9AvfjMhSR9mAxhfQ5S7TT6FpOk5gjZPifXyzMY+rrYoJIJ6YfTSGCvp/jBORQ92Dq
         6huMW/cEIDLEgsaG96mQe/0o/ApsRQ/Rf0RA/zwU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584478412-7798-2-git-send-email-wcheng@codeaurora.org>
References: <1584478412-7798-1-git-send-email-wcheng@codeaurora.org> <1584478412-7798-2-git-send-email-wcheng@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc: Add USB3 PIPE clock and GDSC for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Fri, 20 Mar 2020 16:34:40 -0700
Message-ID: <158474728076.125146.11401827374115414324@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-03-17 13:53:31)
> diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bin=
dings/clock/qcom,gcc-sm8150.h
> index 90d60ef..3e1a918 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> @@ -240,4 +240,8 @@
>  #define GCC_USB30_SEC_BCR                                      27
>  #define GCC_USB_PHY_CFG_AHB2PHY_BCR                            28
> =20
> +/* GCC GDSCRs */
> +#define USB30_PRIM_GDSC                     4
> +#define USB30_SEC_GDSC                                         5

BTW, should we expect more GDSCs at 0,1,2,3 here? Why wasn't that done
initially?
