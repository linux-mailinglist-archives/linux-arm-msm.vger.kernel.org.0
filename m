Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E00D517000
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 15:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbiEBNKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 09:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbiEBNKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 09:10:02 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4766219291
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 06:06:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id r8so15135018oib.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YpduY3LUujj9agt2pyGYTYUcOltpq+QJYgSduqrfP7U=;
        b=GV90JjF4D7CFDFpMIEVMlD+rNmMAkAKeJwY/3MeT+jIh15ZtQsFlSqF5wddudZNkWc
         9kolMChs2vjLRYPHYp/aV6Hlpu5E74JJuZoVvrn0VwIEyVwaR6maMvZyBJ9w3IJMtU0F
         YcnzHjtir5Wlt6tZttOiyM/fEZ+wrsYEXsuW7I5S3pbWOMA4DWg5tnqjTC/t3eOMNs6U
         uhGa5aeDiMN79Zwujw9ofbp23NpfxJFfr8GHXk3bJpL9rNKmOGjTG5c5CAMdd2B5tivi
         HLSvfp0IAZuUNSI9UMuaVbeDYcPcUpP0nVMYyPNv+bjr5H/MEXs1Hbz25qwArp3voUdW
         oW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YpduY3LUujj9agt2pyGYTYUcOltpq+QJYgSduqrfP7U=;
        b=a65Zb+OqFqbXWpInVPa5SvSopduYlBGro1gVlkwqoiJKWRPS+8SbAPG+8Ics/mCNze
         52zkhN1KW02muJE4rHgXJOG357tMlRqzKxo6/2qaB9Q2opSBX2b+PFabld3A++QMzhtu
         9ovziawPS9+TPCiLQYp/dlwL83t2CpwODl5xv23rwJz1Bxuybgl6FEk+AlsShm2uL1SN
         VYZbyO8iNkiHB6UKJS6HRmVSzFE+HY5sPYFvgxy0kA9t8hJH9RHSvcN6+9DjSMrx4X1i
         mQ+j6PzGZIVMoTZ/gxSqBIx5k3odn5J+R/PgvWWrqS+hkeG4N4HfKYYI2ga0vH3DkdKt
         Lobw==
X-Gm-Message-State: AOAM533lVXDlWt+tc65+GLBC5TfGSVQ5YTp3n10kVw0QTXLbhas+/xBr
        zeJHbGqeSt+fDjaIcYRQ6zQqhN14kXQgeHiL
X-Google-Smtp-Source: ABdhPJy6gYlkrEw3HdhYgJS+i0PI5/yd6+OPCsHSn/J3tWNjwTbyMiQZ+NvTBxbS58riCDUPJjLlbg==
X-Received: by 2002:a05:6808:2097:b0:326:c73:10c6 with SMTP id s23-20020a056808209700b003260c7310c6mr1321633oiw.182.1651496792671;
        Mon, 02 May 2022 06:06:32 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i13-20020a54408d000000b00325cda1ffb9sm2282403oii.56.2022.05.02.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 06:06:31 -0700 (PDT)
Date:   Mon, 2 May 2022 06:08:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] regulator: dt-bindings: qcom,rpmh: update
 maintainers
Message-ID: <Ym/XwheROw9Y1JGx@ripper>
References: <20220426105501.73200-1-krzysztof.kozlowski@linaro.org>
 <20220426105501.73200-2-krzysztof.kozlowski@linaro.org>
 <YmlIDn1aHSrcoeoJ@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmlIDn1aHSrcoeoJ@sirena.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 27 Apr 06:41 PDT 2022, Mark Brown wrote:

> On Tue, Apr 26, 2022 at 12:54:59PM +0200, Krzysztof Kozlowski wrote:
> 
> >  maintainers:
> > -  - David Collins <collinsd@codeaurora.org>
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Bjorn, are you OK with this?

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
