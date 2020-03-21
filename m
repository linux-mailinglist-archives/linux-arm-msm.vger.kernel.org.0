Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51EFD18DCAE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 01:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgCUApL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 20:45:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUApK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 20:45:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 310A12070A;
        Sat, 21 Mar 2020 00:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584751510;
        bh=ZMLgnV+eyyeScR0+zJf3uSwFgnfImO8Jb4ad1GB6YIs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o8bQrSRD1n2VOwPADTzU9dA1PSlQEazC0BjAr9ZTQ1sKJRdL8kOZoQsHkn6eIl/lD
         tNqKa0dELH5Ac58F1NEEr5+QHe1PLJzpiesO5MabqCVXvStmgivmCkDGkMyN+Sgh89
         bdmR3B5ODDcceBalt/i6OXyQc6pabbSpuTjef7Ic=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <83787def-4ea5-d38d-d745-ea30a914a05f@codeaurora.org>
References: <1584478412-7798-1-git-send-email-wcheng@codeaurora.org> <1584478412-7798-2-git-send-email-wcheng@codeaurora.org> <158474728076.125146.11401827374115414324@swboyd.mtv.corp.google.com> <83787def-4ea5-d38d-d745-ea30a914a05f@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc: Add USB3 PIPE clock and GDSC for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Fri, 20 Mar 2020 17:45:09 -0700
Message-ID: <158475150943.125146.7023938982989289695@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-03-20 17:25:37)
>=20
>=20
> On 3/20/2020 4:34 PM, Stephen Boyd wrote:
> > Quoting Wesley Cheng (2020-03-17 13:53:31)
> >> diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-=
bindings/clock/qcom,gcc-sm8150.h
> >> index 90d60ef..3e1a918 100644
> >> --- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
> >> +++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> >> @@ -240,4 +240,8 @@
> >>  #define GCC_USB30_SEC_BCR                                      27
> >>  #define GCC_USB_PHY_CFG_AHB2PHY_BCR                            28
> >> =20
> >> +/* GCC GDSCRs */
> >> +#define USB30_PRIM_GDSC                     4
> >> +#define USB30_SEC_GDSC                                         5
> >=20
> > BTW, should we expect more GDSCs at 0,1,2,3 here? Why wasn't that done
> > initially?
> >=20
>=20
> Hi Stephen,
>=20
> Yes, I assume there should be more GDSCs being introduced, and I have
> notified Taniya (our GCC POC) to upload the rest of the GDSC changes.  I
> decided to keep it with values 4 and 5 in order to be consistent with
> previous chipsets, but if you feel we should shuffle these values, then
> I am OK with that as well.
>=20

If there are more GDSCs to come and fill the earlier numbers I'm OK to
wait. Consistency between different SoCs is not important.
