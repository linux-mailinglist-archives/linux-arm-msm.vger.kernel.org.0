Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB68E755C4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 09:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjGQHBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 03:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjGQHBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 03:01:12 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF28110DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 00:01:06 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b8a8154f9cso25137235ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689577266; x=1692169266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dnn7QKCQGSlCvywk2ed41hs0SRX9LNjIeijhgdhg8zg=;
        b=pJgEx4BY4W9ZlFai5SfQ1dW6+DaWAjiTqgpj/mh1GkImHdHJi/H8cK3PKX8I3RmOGw
         jF38+dWkb3LweFSMSQFkE1rkehB8W6MPL/Kc+RcuZrMalIGkPMo9OZIirr0qBE+AAPpW
         8rXBpuix7tafpVaixw0xOXhQCTHfeTLJTgzdqZ0tP6an2RaFMGZVCS7z1j/qVgh9LXb1
         TGTIfLXnnBd42Ypd/kdC0Ua+2XBKV9E2w3a/4+BDMfEcwaW8OcBk56nqjXC0zy9/QxKQ
         qPiJpLtqw8HpSa3plvMGh61VmCFc0/orzdzGhj57r7Fx8V5VViqsFsvJdqB4SlprQpiE
         M5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689577266; x=1692169266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnn7QKCQGSlCvywk2ed41hs0SRX9LNjIeijhgdhg8zg=;
        b=MW5rBRzQsD2E56+7rLpxIn8wUK6yA8msl6Hs04DgSTZYeXy5og1zZpiQ2KmHwsrKVN
         0IaBojvCsBl9MUekgMkF+sDXsZ1SblDxJcs0E34xx7iNU2kG0DBnsS5/gUCQJ/qqHz/U
         J4F0oExY+31AMrXlqzp7zJCOh/38GQE0oEu1ncDkERneChAI4rBftcUr7PPl6gkZSAh6
         mUhSn3Sw5prGny7Ln9qnFG2mPapAQegxwJf658JXL0rAHz+PL59Z7aOZvNQMzOrWCtnL
         q9vY2BSjShSop5IR6UJEs4leGakdGS/8fdelmJ59KuOoijn2EPMUhhU620vksD/qC+iL
         oH3g==
X-Gm-Message-State: ABy/qLakoJuKNMEQzmUFWbOJiLA3yPMQbxTeRFJWbS+/t7IKvwMVvjZZ
        AzBvy7LlrzGSX3OpTJHfpLJ5
X-Google-Smtp-Source: APBJJlHnABq/pNbNaeznIxxtVpLxbuOiG5QbSWFScjnaPmJ/Wt03e5xXE+vFVW4nuopkpVeBYrzfYw==
X-Received: by 2002:a17:902:c454:b0:1b8:6245:1235 with SMTP id m20-20020a170902c45400b001b862451235mr7987314plm.13.1689577266173;
        Mon, 17 Jul 2023 00:01:06 -0700 (PDT)
Received: from thinkpad ([117.193.215.209])
        by smtp.gmail.com with ESMTPSA id jh2-20020a170903328200b001b7feed285csm11963900plb.36.2023.07.17.00.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 00:01:05 -0700 (PDT)
Date:   Mon, 17 Jul 2023 12:30:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_asutoshd@quicinc.com,
        quic_cang@quicinc.com, quic_nitirawa@quicinc.com,
        quic_narepall@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_richardp@quicinc.com, quic_nguyenb@quicinc.com,
        quic_ziqichen@quicinc.com, bmasney@redhat.com,
        krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH 02/14] dt-bindings: opp: Increase maxItems for opp-hz
 property
Message-ID: <20230717070056.GB7062@thinkpad>
References: <20230712103213.101770-1-manivannan.sadhasivam@linaro.org>
 <20230712103213.101770-3-manivannan.sadhasivam@linaro.org>
 <20230714161733.GA3938393-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714161733.GA3938393-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 14, 2023 at 10:17:33AM -0600, Rob Herring wrote:
> On Wed, Jul 12, 2023 at 04:01:57PM +0530, Manivannan Sadhasivam wrote:
> > Current limit of 16 will be exhausted by platforms specifying the frequency
> > for 9 clocks using opp-hz, like Qcom SDM845 SoC: 9 * 2 (64 bits) = 18
> 
> Are you sure about that? opp-hz is defined as uint64-matrix, so 16 
> 64-bit entries should already be allowed. It doesn't matter how the .dts 
> is encoded (it used to though).
> 

Yes, 16 64bit entries are allowed, but SDM845 will add 18 entries (due to 9
clocks) and hence this patch.

Did I miss anything?

- Mani

> > 
> > So let's increase the limit to 32 which should be enough for most platforms
> > (hopefully).
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/opp/opp-v2-base.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> > index 47e6f36b7637..e2f8f7af3cf4 100644
> > --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> > +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> > @@ -56,7 +56,7 @@ patternProperties:
> >            need to be configured and that is left for the implementation
> >            specific binding.
> >          minItems: 1
> > -        maxItems: 16
> > +        maxItems: 32
> >          items:
> >            maxItems: 1
> >  
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
