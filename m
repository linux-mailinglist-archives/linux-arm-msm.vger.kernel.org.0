Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190CB70FA0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 17:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbjEXP0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 11:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbjEXPZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 11:25:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E285F5;
        Wed, 24 May 2023 08:25:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C086263C54;
        Wed, 24 May 2023 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EE5C433D2;
        Wed, 24 May 2023 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684941931;
        bh=1n1TgJpn6zCcOlq4o6xSCc9Ij4UPzU8w84Q1fRsp1Jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YueoG3vygEy+hqpoQiMW35n4bw0sMCh8qAR0ifYYOwYM+LyyMTfaon4cnXT7wQ1hb
         qDpQTEolv9BpSyuYz8+DNRyamOZZ+gkHF5T4T1PxewbYZIxJlBDeXODHxFuWcn/XsC
         y5Cy55BlJ+c1HI6k/5mnnuIRKJJ4AuXhL1HXw3GTJ1Q9Lp1oq7rrHNP1P5L1GBkAVc
         UmhFABn6KtX+hMQ8K2oL9HSWCzT9oHpAlm0rcdhmvuh4mPWAdQhkV11Kv2N68cgOaC
         Esq4WUsiyQoIEksTFROAEOpv3OhyQqaRxf6O1mlm3xcgsog2rdml9o0FKt5EUW4s+q
         F9fjUEsLu181g==
Date:   Wed, 24 May 2023 16:25:25 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp-usb: fix bindings error
Message-ID: <20230524-sleep-grader-5744eb82e358@spud>
References: <20230521195200.11967-1-dmitry.baryshkov@linaro.org>
 <20230522-babble-impeach-efe7ed754a08@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rsHT/5SgqDl43nWb"
Content-Disposition: inline
In-Reply-To: <20230522-babble-impeach-efe7ed754a08@wendy>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--rsHT/5SgqDl43nWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Vinod,

On Mon, May 22, 2023 at 01:18:24PM +0100, Conor Dooley wrote:
> On Sun, May 21, 2023 at 10:52:00PM +0300, Dmitry Baryshkov wrote:
> > Merge two allOf clauses, which sneaked in in two different patches.
> >=20
> > /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: found duplicate key "allOf" wit=
h value "[]" (original value: "[]")
> > /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: [error] duplication of key "all=
Of" in mapping (key-duplicates)
> > /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-usb3-uni-phy.yaml:109:1: found duplicate key "allOf" wit=
h value "[]" (original value: "[]")
> > /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-usb3-uni-phy.yaml: ignoring, error parsing file
>=20
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> You may as well trim at least that from the file paths, if not more.
> That's w/e though,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Could you pick this up please to unbreak dt_binding_check in next?

Thanks,
Conor.

--rsHT/5SgqDl43nWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG4sZQAKCRB4tDGHoIJi
0ir/AQC91S4TuR61yXAGPV+1aFilDjZGIUJ8c1F6sTF3bknVtAD5Af5szWov6DBm
H2jkx3VYdQ6DLFp4bRnYqttUGmqsVwI=
=R1os
-----END PGP SIGNATURE-----

--rsHT/5SgqDl43nWb--
