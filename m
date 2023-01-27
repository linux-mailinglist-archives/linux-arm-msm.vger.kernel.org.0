Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20B0367E5AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbjA0MpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbjA0MpF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:45:05 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F61C3AB1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:45:03 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id k4so7919187eje.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX9M/CiZsZu3eRTMUNRiNUGMe4+cADFwlytwC/x09Xc=;
        b=os9EfhoUhlN0cwLkhc4UfN/DkmnANUL3h3F2KvJkZi3Q+w+c4pMtoSOwGpEUJ/54j4
         wNJB1EnnEa0YjAb0JxyfGLx6MpWhuNwUUAD1c56DamRDhTEFyJyp2Krk9fXNC/AeQlLx
         JCCoKFpHlvnoKyrbDY0NZbh7BN3g/fMLLdm0jx20utBEHhxMwxEgjCgVfgvDeanOwZYO
         gsNmpKoP4FmbPIPPvAH/h3yfglhCMNyBQlwCYOA0uObCNyw/lnEz7+tyYy3ejcTlb3nz
         FkNofJA3BqB+nYriT7fYRgV0Cm4VnOGnxiDB5IyqxX5PTPfOPh6xmYlnyJfLTFbquUhW
         v/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MX9M/CiZsZu3eRTMUNRiNUGMe4+cADFwlytwC/x09Xc=;
        b=Mb2dmC/X9q2bexX0g5aGk+iQa9xtPyaiB64hgtrGJ/cOsDpk2Xd8ma+hExHCvGYypA
         9SutuvB2d9REF8U0oLexLyFqvtmQgunpebuM2gSXbZ0RhrYkXQAmsO7eEQlbSNDpHWQt
         loz4hq5sZ9tzPRkuArKh8LL0Lw7N80+8GdeJEIvnRQBQh8suqRdCB2GyZeCocRzJArck
         A/ZNIHE+btOFp9PPaxPX0bS+9dtySnstUNdWnYvomFlBz7qqZkrsPBgnHOJtucECY7Nn
         P/ZD47UO2dUTbRq9m2Rg276J6trfllDKv/w5IBhfquwy0er59u+Xm7Ixs8MVRAVWlpfM
         7osg==
X-Gm-Message-State: AFqh2kqM5NN5Oaia8nfC1EDXk7rq3khyY3vlyyfzknC/3cxxrXxvBEbU
        SVWbEdlHLj+F8H+mZhOy0Ssgrw==
X-Google-Smtp-Source: AMrXdXvW7nFA3CS90qGLU3JsWJZakuYpNGeQO07VRLQjUODbUx6HmFg+u6V4G1MpvDApgx8+3FmrKA==
X-Received: by 2002:a17:906:c02:b0:83f:cbc0:1b30 with SMTP id s2-20020a1709060c0200b0083fcbc01b30mr40931496ejf.10.1674823501603;
        Fri, 27 Jan 2023 04:45:01 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id my20-20020a1709065a5400b00878465f059dsm2180031ejc.59.2023.01.27.04.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 04:45:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 27 Jan 2023 13:45:00 +0100
Message-Id: <CQ2ZDQKO11XZ.HA5CXLK5MTFB@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Loic Poulain" <loic.poulain@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
X-Mailer: aerc 0.14.0
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
 <e5ff49d4-45c7-8c4a-d624-d8f7cc9ce2cb@linaro.org>
 <CQ0I4ONEI6J4.3KWS1KBE7RTKD@otso>
 <3ae863df-3260-4863-d88f-da4d3f442174@linaro.org>
In-Reply-To: <3ae863df-3260-4863-d88f-da4d3f442174@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue Jan 24, 2023 at 4:25 PM CET, Bryan O'Donoghue wrote:
> On 24/01/2023 14:48, Luca Weiss wrote:
> > On Fri Jan 20, 2023 at 5:49 PM CET, Bryan O'Donoghue wrote:
> >> On 20/01/2023 13:13, Luca Weiss wrote:
> >>> +		camcc: clock-controller@ad00000 {
> >>> +			compatible =3D "qcom,sm6350-camcc";
> >>> +			reg =3D <0 0x0ad00000 0 0x16000>;
> >>> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> >>> +			#clock-cells =3D <1>;
> >>> +			#reset-cells =3D <1>;
> >>> +			#power-domain-cells =3D <1>;
> >>> +		};
> >>
> >> Should you include
> >>
> >> required-opps =3D <&rpmhpd_opp_low_svs>;
> >>
> >> ?
> >=20
> > I don't know, it works without. But doesn't this property not just
> > affect power-domains? I haven't passed any here.
> >=20
>
> Should you have a TITAN_TOP pd though ?

Can I reference <&camcc TITAN_TOP_GDSC> from itself? I know that having
it on is required to turn on at least some clocks (maybe all clocks).
But from what I understand how power domains are normally handled, the
driver core enables them before the driver is probed, so self
referencing wouldn't work.

And at least no other SoC upstream references TITAN_TOP_GDSC in camcc.

Regards
Luca

>
> ---
> bod

