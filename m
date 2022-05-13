Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA09E526A73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 21:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383730AbiEMTgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 15:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383699AbiEMTgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 15:36:44 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8322AC9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 12:36:42 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id v11so8525057pff.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MVy7iZsksoOMOAm3NNokxlKH1OgviSGLirV/jH2bp6g=;
        b=oT5OvAp1Zz7AUlM0aKl+8ZIvs1C599gkbilzsnIpz1AO0oVZtegSofmqZGgF3owSwx
         e8aeEmF7v4n8qZXGa+DBCVXRNsxBwn4zoGlpEV6qhQ787uUrQWaSqVnM7yebGfhktUlW
         vTbi4mb7fLQDubyl82mTHh+SczIl1wnGaEF44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MVy7iZsksoOMOAm3NNokxlKH1OgviSGLirV/jH2bp6g=;
        b=zP2sXt4EziQtGitfF5OtpU9uxk7Ur7s50JE73bqXiDVddeCCU9JDRNe4zm7x1rPmks
         I5RAnS+toR1KZZANlVxll6SyiJPYBD75N2xErsWs3ifYXJ1ZQW0YwE8+7jwzavnEjTUH
         vqy3haD5aL7Zfqd6R88wnLlCT96byWOGn4Oys9W+PYkob2Kh5DEhf435T9Vf3Qm+26dh
         ZX2QPJ89QwlsVXbOCN3D68/oj1VUzH/E+IKCj12Ca41gs6flh26E+ghYUisn8yg26UCw
         rfwsXrlVa9+yW7O81zfn0Q+4PsyyFscnaEDc82pc2Vhrs5E8yl4ocfYgmrcSj9n2qAUU
         316Q==
X-Gm-Message-State: AOAM532pEpjFXuyGLEUTIVnAPXsX0Xcaj7Mh9ZlJyvhenz0MqKS54hBW
        WikF2q+Kwn3b9J3EIpdVpvP1yQ==
X-Google-Smtp-Source: ABdhPJxGphb+a3j/4IMs2jeADD8wkkmOnIgagtQf5njkuMbaHesyMm7dlmo28dn15Im4KjxHYXi02A==
X-Received: by 2002:a63:605:0:b0:3db:a8bc:fb71 with SMTP id 5-20020a630605000000b003dba8bcfb71mr2548020pgg.125.1652470601682;
        Fri, 13 May 2022 12:36:41 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:bc87:9632:bcce:8e17])
        by smtp.gmail.com with UTF8SMTPSA id l17-20020a629111000000b0050dc7628186sm2181056pfe.96.2022.05.13.12.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 12:36:41 -0700 (PDT)
Date:   Fri, 13 May 2022 12:36:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: Add / fix sc7280 board
 bindings
Message-ID: <Yn6zR5k5EwP+qFBr@google.com>
References: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220513095722.v2.3.I1318c1ae2ce55ade1d092fc21df846360b15c560@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220513095722.v2.3.I1318c1ae2ce55ade1d092fc21df846360b15c560@changeid>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 13, 2022 at 09:59:19AM -0700, Douglas Anderson wrote:
> This copy-pastes compatibles from sc7280-based boards from the device
> trees to the yaml file. It also fixes the CRD/IDP bindings which had
> gotten stale.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
