Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031D62FA9AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 20:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393624AbhARTHu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 14:07:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:35694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390584AbhARLjw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 06:39:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1286C222BB;
        Mon, 18 Jan 2021 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610969951;
        bh=LsDiKpAXfFsvoIt/CkJHtJcTokFYsuXapYBygCW0Ys4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ruS/9hf12xaXkqkqoCYdNtNsYyVCdevm1OTWhIZng2TPa7jdYysPF/p1/mM07RoJI
         0X3Kja3uAy4VYucSeN8zPivGthZ2MzMqOe9lxILlncsItfBToMJL8Ei2mpDA8LCbgS
         Jrg377sa2d+MEmZh3RSTWwhOgW9rSMW8v2oc4k0NYxRqJJHsVZQa5km5G69TTkCwkn
         I/odljS3nKROcrnfU38/+nDJTS1qh5Clq4xxnZMha6/t7IFk2FBoJFNXuzK+hLdw2t
         Ou0ncyzFJsLjeezn/Aw7M6T35zaFVLeUvn//ySvadNsLBqYA61860LmBQNFf7WuqIF
         ZiBVSCzokXnpw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: qcom,dwc3: Add bindings for
 SM8150, SM8250, SM8350
In-Reply-To: <20210115174723.7424-5-jackp@codeaurora.org>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-5-jackp@codeaurora.org>
Date:   Mon, 18 Jan 2021 13:39:02 +0200
Message-ID: <87zh16v5ih.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Jack Pham <jackp@codeaurora.org> writes:
> Add compatible strings for the USB DWC3 controller on QCOM SM8150,
> SM8250 and SM8350 SoCs.
>
> Note the SM8150 & SM8250 compatibles are already being used in the
> dts but was missing from the documentation.
>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 2cf525d21e05..da47f43d6b04 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -17,6 +17,9 @@ properties:
>            - qcom,msm8998-dwc3
>            - qcom,sc7180-dwc3
>            - qcom,sdm845-dwc3
> +          - qcom,sm8150-dwc3
> +          - qcom,sm8250-dwc3
> +          - qcom,sm8350-dwc3

nicely done!

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAFc1YRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZxrw//fSf5M/ifV+IvyWh08Kp8BJ+dLMcZAZNu
kOAV4BxvEAwPCylflF/FudCWIzMlYDnlYEAQGKjas2gXqOaI3Cz/vewlBfF4wa/X
Xme7xWRedpKmKxpL71P0NrdQ3DzDwFdo1mCRbshh3m15MUrWpuDf7PtzBE1sIZg6
u804URsW2Q0k9NWLjYM/NhhqeRnaZwMFLlI6njmPF8yqqzkYi62/u8GxV2YXnJ14
oXCl/WQwRcklGMPrR/JCGmL4RFiWmVaMEovPjBCVvO4JielFIrRsRXkYHoOrAHWj
fOGTaN7TQII3J+toOK2OmRVeccXdUM54bdo7bC3Mb9TCHi916B0LIZLobMMAy4D0
Tz6prg4F5MCkZuyo5ePzW5ZnK9b8HstXd3A4mv2qk87eeJVndWraHzzW6GTnQj8K
h5l74ftKn3QpwwFXkB01N6qjzfBIoo5IeBTQUZXcQDve+gIxXX5iNWKeUMofqJaq
byrI5DHrWbAX2DI8df4lPUdZ13nPrJlEnny/FlOzsc/q2Ay32Hah9ZTaknna1k/y
Bs+zku8yF4Ghoc7m+Zjct0k4m8JIbRYXSpCD/kVsH2bbA40XbRfOTdsHUcBYfEhu
YLsMyQrOsL3PG02iwN/7mWgfdiwEFqrcLZFNqVLikFznokD3fZMYKxyn1IKVoLAd
wIJDcmVJZHg=
=uCXF
-----END PGP SIGNATURE-----
--=-=-=--
