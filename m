Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E9558F3B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 23:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbiHJVDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 17:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbiHJVDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 17:03:15 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B375B7A525
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 14:03:10 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id j5so13444537oih.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 14:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=3O5723dkVhZLUhIPrwxrZWvj7oA/jyzk8I9qZDVTL9s=;
        b=simohxoQtu2o0mF7GAUapceEMdlBm/ZteU9ZEx1NCu74LCmKyLKxoiEYpx/mK8QSNI
         EMKhW02fYgjONjMXNZHNZVRp5FX31HDo0tpKvQxfGvoW01JbiTu/262P6/rd+tJphdd3
         /cqpzHDJfbR6Y6y8eZsOwDux343ZpzZpdDoKyWYzxoRbuJyVfV/FxNb3pbZbmSmpGEYB
         EjrjqyJQiLTDo6s1+9Vg18S+rPywF85VpldKkNfYg7372QUXdSn5+eYdSGl9QmhL8om3
         8pgo3jS0He0cm01F+TW6MHfcb6LlcOzfFv9bx8qefd/yWa2l5Cd50qloMM+zg7Ro9cm9
         lXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=3O5723dkVhZLUhIPrwxrZWvj7oA/jyzk8I9qZDVTL9s=;
        b=CATWD/XjRcZXg5DhJKFI+M2ufiWdqaJj8/qGPD63r66ypyE7AYJhSnEfXpOwlIS4lu
         g6D8WUB90/QanId8JS30TSyF2FmrapRHREKpwKf5OIeGH0QmhZUlTeItSK40T6fozqMv
         HjmbVK5okmLYXt7KGsxiKC6HQFWVPtePF5O1BTMs5FJUtR3qakvflTwsjiV+MgAE7XP/
         3J8Ez+vXDjpBVdzsIML08ZMs1hDM4JAjz15S5dKwoaU/wlR0ckcToFCRmLvPJpvSeoMH
         UorV0uH6xfOgkOXL8CJq4l2YqHoZeg3tJBKsl4zffhYpGgOOev+TFuxYW93UOQUdYAgC
         3amw==
X-Gm-Message-State: ACgBeo1HNj9490HB+L11romOCUtrgKenkaVMPXne91k3Gdhrpiporgbl
        RMN42q01gb6Jq42n3h+onFQSxg==
X-Google-Smtp-Source: AA6agR6gFO6aPJuT1MXGa56aIiXlTPvkZsdZGG3diWvM7M/mpkZcJ4iVm/xVXebRJA5pXxJ3uaFbyw==
X-Received: by 2002:aca:ad0c:0:b0:342:f3e2:32a9 with SMTP id w12-20020acaad0c000000b00342f3e232a9mr2220993oie.261.1660165390059;
        Wed, 10 Aug 2022 14:03:10 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w10-20020a056871060a00b0010bf07976c9sm3951726oan.41.2022.08.10.14.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 14:03:09 -0700 (PDT)
Date:   Wed, 10 Aug 2022 14:05:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: firmware: convert Qualcomm SCM binding
 to the yaml
Message-ID: <YvQdqsOutzYs+Ulb@ripper>
References: <20220708090431.30437-1-david@ixit.cz>
 <20220711225705.GA422079-robh@kernel.org>
 <b228bc62-c307-0662-3a6e-e3408c328178@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b228bc62-c307-0662-3a6e-e3408c328178@ixit.cz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 22 Jul 14:34 PDT 2022, David Heidelberg wrote:

> On 12/07/2022 00:57, Rob Herring wrote:
> > On Fri, Jul 08, 2022 at 11:04:31AM +0200, David Heidelberg wrote:
> > > Convert Qualcomm SCM firmware binding to the yaml format.
> > > 
> > > This commit also:
> > >   - adds qcom,scm-mdm9607 into list which has only core clock
> > >   - adds qcom,scm-sm6125, qcom,scm-ipq6018
> > >   - #reset-cells, because the property is already used
> > > 
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > --
> > Should be '---' in order to be removed automatically when applying.
> typo, sorry.

No worries, I fixed it up as I applied the patch.

Thanks for fixing up yet another binding David!

Regards,
Bjorn

> > 
> > > v5:
> > >   - add qcom,scm-sdx65 from new commit to txt binding
> > >   - add freshly merged qcom,scm-sc8280xp
> > >   - add interconnects
> > >   - add accidentally removed # from #include directive
> > >   - move mdm9607 to 3 clocks (thx @Guru)
> > >   - fix compatible string in example
> > > v4:
> > >   - added clocks minItems and maxItems
> > >   - removed quotes from $id and $schema
> > >   - adjusted description of TCSR HW block
> > > v3:
> > >   - add preceding patches for ARM and arm64 adding missing compatible strings
> > >   - extended with missing compatible strings
> > >   - added two additional maintainers, see https://lkml.org/lkml/2022/6/23/1969
> > > v2:
> > >   - changed maintainer to Bjorn
> > >   - document #reset-cells
> > > 
> > >   .../devicetree/bindings/firmware/qcom,scm.txt |  61 --------
> > >   .../bindings/firmware/qcom,scm.yaml           | 147 ++++++++++++++++++
> > >   2 files changed, 147 insertions(+), 61 deletions(-)
> > >   delete mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt
> > >   create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > Doesn't apply for me, so I'm assuming this will go via QCom tree.
> if you want to merge it, I can rebase it against your tree?
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> -- 
> David Heidelberg
> Consultant Software Engineer
> 
> Matrix: @okias:matrix.org
> 
