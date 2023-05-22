Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D8170BDBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 14:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbjEVMWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 08:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbjEVMWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 08:22:23 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B051FE0;
        Mon, 22 May 2023 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684757984; x=1716293984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yIjhWDjFMYCl5gznTdFSFGbvICLuiF8BR7thR9CRBN0=;
  b=1eEkHIqcvq82OxPQluoNYvu5qTLP7WwUcXvyzCsjlONuKzckCEMIxkM1
   1Ytjo8wlJyFMGOpSwvrMXzPRVjuH1R0IdmSGWvh5DwumzXlxihnkrzKfc
   erJzDm27TiPvO1a1nbxH3VCEyI1wq1HDqqjcqHtxjilRf+jQ+U3UfukHA
   5nATayRVEBV29dqut0mj9ciAKwYFITWmZKNqy25chPXaD2xFeL/4WX46i
   GWio/guBsJAG5f6fj36TNW351LRZkmzLwwjYfo1vRa01cR2uGAkqSQ6pq
   7KzqbZT3rwNKhpvGWfYdzSVO28htNcofa0qzYZ6nN6rVh2o55vaBMcfbJ
   w==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="asc'?scan'208";a="214312328"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 05:18:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 05:18:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 05:18:46 -0700
Date:   Mon, 22 May 2023 13:18:24 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp-usb: fix bindings error
Message-ID: <20230522-babble-impeach-efe7ed754a08@wendy>
References: <20230521195200.11967-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Fr1CTYsJQoNe4MTw"
Content-Disposition: inline
In-Reply-To: <20230521195200.11967-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Fr1CTYsJQoNe4MTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2023 at 10:52:00PM +0300, Dmitry Baryshkov wrote:
> Merge two allOf clauses, which sneaked in in two different patches.
>=20
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/q=
com,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: found duplicate key "allOf" with =
value "[]" (original value: "[]")
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/q=
com,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: [error] duplication of key "allOf=
" in mapping (key-duplicates)
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/q=
com,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: found duplicate key "allOf" with =
value "[]" (original value: "[]")
> /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy/q=
com,sc8280xp-qmp-usb3-uni-phy.yaml: ignoring, error parsing file

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
You may as well trim at least that from the file paths, if not more.
That's w/e though,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Fr1CTYsJQoNe4MTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGtdkAAKCRB4tDGHoIJi
0vy9AQCrMGAUlup6Rz/frrw36p2hRsHwRpCxU53tvu9+2mfi8gEAuC6gDr6AvqqE
ckJ+nFBCcsUhyAjrfD95zhiK26Bz5gc=
=OY8I
-----END PGP SIGNATURE-----

--Fr1CTYsJQoNe4MTw--
