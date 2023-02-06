Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C560A68C420
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 18:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjBFRB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 12:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjBFRBw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 12:01:52 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD912B2B1;
        Mon,  6 Feb 2023 09:01:18 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id d21-20020a056830005500b0068bd2e0b25bso3371037otp.1;
        Mon, 06 Feb 2023 09:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftsYnNwfAHRlDnIU3/2K9ANJVoP0nQzARnX/oV/Q5nE=;
        b=z0/AsGqGuRk8r0b2Nxqs+9h5dajiWR/C/YHxGOJcM32p/RBSyhmeNeI1ii/FLFXpx8
         IobJORO4HzFlYCxPy1JQo/OJRD2XMQkNUD29icMQBtmiZBasd01NpgtxTNMg39asebIt
         GdpKP5cFPLaw2elp/W0MKFGeH9J9o+3JMC3GP4hVlZI91ovACxAE504R68XHoq+Tmgxp
         IbVIRZnAq5HpxFrzs5Uu/+ImBPiiY4ntc5f4s4gmFEH81KW7MIbjYU4ovr8i6I1btz1h
         S9J/+wgL5eeajSEoaBzcD2zp5Vf7yJ1u+epLwfVGq78fL/8L4S+rCC4jmVZcXHWn4Hs4
         oriw==
X-Gm-Message-State: AO0yUKXltncS/lBAl8a+LO4gwHLIxlnpxAeVoGTVqdaK6KW67N6/3bqG
        3N3D+WzHp3UcaCBXT6o0qA==
X-Google-Smtp-Source: AK7set8IlglwpH0WJv/MQ+9QnqEUE0o4e/FYzaxxqKBSSV+ySvVKlkQIAgWzXHjyv36wLGYY/XWAVQ==
X-Received: by 2002:a9d:2af:0:b0:68b:d7cb:dd62 with SMTP id 44-20020a9d02af000000b0068bd7cbdd62mr160379otl.10.1675702877032;
        Mon, 06 Feb 2023 09:01:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a4-20020a9d74c4000000b0068be372babfsm5231719otl.47.2023.02.06.09.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 09:01:16 -0800 (PST)
Received: (nullmailer pid 226818 invoked by uid 1000);
        Mon, 06 Feb 2023 17:01:14 -0000
Date:   Mon, 6 Feb 2023 11:01:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/8] dt-bindings: display/msm/gmu: add Adreno 660 support
Message-ID: <167570287416.226763.12601295284493714271.robh@kernel.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206002735.2736935-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 06 Feb 2023 02:27:30 +0200, Dmitry Baryshkov wrote:
> Add Adreno A660 to the A635 clause to define all version-specific
> properties. There is no need to add it to the top-level clause, since
> top-level compatible uses pattern to define compatible strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

