Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A372562115
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235344AbiF3RSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiF3RSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:18:24 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7DA13F3E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:18:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id k15so5677688lfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=h6a1dWXChTwCKwnW/kNd1JMMGxhKCAfODxl0ifUihRY=;
        b=yfS9EQ2f30wjZUo7Mmyex+du61oijkfvbfouHHFq7LGnTU01gHm0lXJwJs4rqk6hp3
         YrCSg3eXuvUnvtgMFcKtSKl6fnLVRof+YoZEJ/ftdo7q1NDXtXEQDb7awy30FV9wr4nG
         +61MbaP7BkTcZMOaDaCn0mTw+RosCRlUhn/DtO/j4Oolpx0KSI9esJAt9wspCIGDHa+4
         OBtz4dDEIOWWl5/EZ2vPCRLEIegpbEtz5cChBXRZSy6wu2g27NqtWA0F3X+TT0oR14Gk
         WPXVR7vL7LPd7+qRrQzjxB0/TstzVp5W1DFrpWr7wX8U1BrqkNP+9QeD3T6XBNx5bO23
         b23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=h6a1dWXChTwCKwnW/kNd1JMMGxhKCAfODxl0ifUihRY=;
        b=jqot5AfBk3lBtzjgsyZVtMwTO3xydFPa9M56/j1ZT0LwMjS1Ez31EqYvxTLTsKkEGr
         tIgrNTHf5ft6yZyMfJ6cjn7/3ZCb69UYWubA5gKOjbtoEl9vpkLn2PvY1gDs2qMnWbvB
         mEcc53M6SGPmML6k9tyiYsg0/2PVsN1N1kOAR+k41EgoAGX0K95kB4YDz9Rn1HWhyL9X
         jsBg2LmZkOeRGkuiwd1QrHYDA5tdqwQd1QUNgjq9N/lWd7PaGAkkZwl7gtw6gx+lkRXe
         SA9c3BiWS6wb/tSvGKvwmADtu82EiyVDrXzczGTxOxH0BgpwR+NTiokLgmy5RicxZbm4
         nX2w==
X-Gm-Message-State: AJIora/qVvndPwFAHt7PClVgBN2zaZTBzKJbvdxS4UV5bNqZu3eaIiOB
        ZgC76M8jzGd0pdDFxzSJIcp61g==
X-Google-Smtp-Source: AGRyM1s8R8bDIioUiYfE/tW3QennF5sAfDl/cwAX8X6a6afK/dqg3TKlgCkCUM1zaXwFsLBpgZdffQ==
X-Received: by 2002:a05:6512:22cd:b0:47f:6e84:f51c with SMTP id g13-20020a05651222cd00b0047f6e84f51cmr6067710lfu.175.1656609500594;
        Thu, 30 Jun 2022 10:18:20 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id v10-20020a2ea60a000000b0025bf92bd024sm348973ljp.102.2022.06.30.10.18.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:18:20 -0700 (PDT)
Date:   Thu, 30 Jun 2022 20:18:02 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
CC:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_7/7=5D_dt-bindings=3A_msm=3A_dsi=3A_Ad?= =?US-ASCII?Q?d_missing_qcom=2Cdsi-phy-regulator-ldo-mode?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org> <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
Message-ID: <1FDC4CED-AFE7-4D68-9D48-58751DBBF4F6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30 June 2022 15:08:45 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY=2E
>When converting from =2Etxt to =2Eyaml we missed this one=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>


>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml          |=
 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>index 9ecd513d93661=2E=2E3551e166db966 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>@@ -40,6 +40,9 @@ properties:
>       - description: dsi phy register set
>       - description: dsi phy regulator register set
>=20
>+  qcom,dsi-phy-regulator-ldo-mode:
>+    description: Boolean value indicating if the LDO mode PHY regulator =
is wanted=2E
>+
>   reg-names:
>     items:
>       - const: dsi_pll

--=20
With best wishes
Dmitry
