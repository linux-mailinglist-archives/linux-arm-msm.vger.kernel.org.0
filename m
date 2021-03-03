Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4B832C22A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389713AbhCCVqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:46:09 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:34212 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344651AbhCCQsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 11:48:35 -0500
Date:   Wed, 03 Mar 2021 16:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1614789844;
        bh=OdYHwTp+YRXmKuf0MVTsBd1HnuwxsWcX+mel7KK+tZw=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Z043HNH+2dYfvzSIDvaosf+iny75wfxI8z5yMfu4N1LXTpGbcRl7ujuII5YUFNmzI
         SivZIncHckAmIw1k1MY0zoY+1d4hU/lmOcdgKjTcOJ7ESS4klNddF68vj3oYFaRkk8
         4tw1sxsLdOU8RTHqnV3eg6ltimU8n8FOpyXZ7Rys=
To:     "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "angelogioacchino.delregno@somainline.org" 
        <angelogioacchino.delregno@somainline.org>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: qcom: pm8994: Add RESIN node
Message-ID: <-8dygFkqlPLCYtnwUWBLrCubmjkNhno40CBzzZ2tmlWdpJC1Ihmoe1dpMSvsgoBQ58Idh2v_rBHNEQLIwpTRtpndQm_8nSarmkXlZo975CU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In-Reply-To: <20210228130831.203765-8-konrad.dybcio@somainline.org>

I've sent a similar patch[1] a while ago, although I didn't disable resin b=
y default:
https://lore.kernel.org/lkml/BmEPgqFMiMXOzn9xFz6KSPtOZdWoeJ8zUpGXI_p7U9FBBS=
gbG2IP6AkuvbWWzy7MVuBkrhOas158Vd9klSLFmrbSRGEpQGouiAFpsf03Ag=3D@protonmail.=
com/

Yassine
