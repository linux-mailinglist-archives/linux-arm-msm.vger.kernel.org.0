Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58E96740A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 10:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjF1IGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 04:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjF1H6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 03:58:52 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D023A92
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 00:57:39 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-313e34ab99fso4632718f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687939057; x=1690531057;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGESXMqxdx0Zv+bAFNoo8XDOiS0wv8ydMIUjJi5DqTY=;
        b=h0DFVhtcsMb9bY7hglBiR5DOxhSENhAqzjQG9wOQyXZJV04D5m1bONPCfEgXoeCqEw
         7FmaDJ3OHf/QCprXrqB68+Uv90/3gYOBFiwvkHADYvheogYxtCrfRw2SbNuJyEqEumtm
         9HY6rEWj7mLhaw7W5J7K3fE4z2VShaNrlppdu8DYQlHK8cIPP+VRQx9FUNKfW4J4hczC
         BpDZUacCh2CkIwXWH1euHLjYNapfTOEZ6WawvG5vXqe1e3jkgGXwKXXO5szrCxlC44ml
         a8uJl7zSn/d85ufsiIL8wuOL5jd9PxspIQ1tRrVQUZw4Uc5zhq7DFCFZpxc77s2Dmry0
         Ll1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687939057; x=1690531057;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGESXMqxdx0Zv+bAFNoo8XDOiS0wv8ydMIUjJi5DqTY=;
        b=JL+h9cIf2EL4k/95kTHEnibHO6W7PZD7x8kyOBhIW03f9atgseGWMI0rLJurBPcwjn
         +TvIYttP5TskNS5e6dvumjJhiSvAYRSXcK5KVqytAdjoOF35aUe2oTmyQFT4htfPqRWV
         i1fEA+k1FxlqDsiSGtCyyq2idSjAcrGeUNmPrx5HxkMQuFFw35sf6HnLB6pgWu6UIZpB
         0OCCc7zSX93YsgtQlsgkRhYyYTOO6qPd76uVysSmmHiUIqXz97Vf8TkzF9Ug/JUL1Gkz
         GZwl4R6pcgjUGRA7335ZY9EFUfuMPnEVSZ+iJ4F84muhxGCdxSk0Qw+qC6rFQLj7szN8
         oS3Q==
X-Gm-Message-State: AC+VfDwus6+GkXs6S64BLST53uzzsc4SVXTGTEf81vxot1ekdS+A08Mq
        OX6DSMGPL5c3MsdmVucq5vj8qknSOYsC4DkLeYVp+g==
X-Google-Smtp-Source: ACHHUZ7gMB9TdATmziELOylooF5UzD9PmwT9Be5LPd834t2aGs/kkjckH0xBz/KPhpyVg2PoFJtO9Q==
X-Received: by 2002:a17:907:3f88:b0:992:566b:7d57 with SMTP id hr8-20020a1709073f8800b00992566b7d57mr2009072ejc.61.1687934997372;
        Tue, 27 Jun 2023 23:49:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id lc1-20020a170906f90100b00988e953a586sm5401785ejb.61.2023.06.27.23.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 23:49:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 28 Jun 2023 08:49:56 +0200
Message-Id: <CTO30OAFFNFB.18YWUN5KFZVTA@otso>
Cc:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Abel Vesa" <abel.vesa@linaro.org>,
        "Manivannan Sadhasivam" <mani@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        "Alim Akhtar" <alim.akhtar@samsung.com>,
        "Avri Altman" <avri.altman@wdc.com>,
        "Bart Van Assche" <bvanassche@acm.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] scsi: dt-bindings: ufs: qcom: Fix warning for
 sdm845 by adding reg-names
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.15.1
References: <20230623113009.2512206-1-abel.vesa@linaro.org>
 <20230623113009.2512206-6-abel.vesa@linaro.org>
 <cd84b8c6-fac7-ecef-26be-792a1b04a102@linaro.org>
 <CTK1AI4TVYRZ.F77OZB62YYC0@otso> <20230623211746.GA1128583-robh@kernel.org>
 <CTMDIQGOYMKD.1BP88GSB03U54@otso>
 <d3970163-b8e8-9665-3761-8942c28adaa8@linaro.org>
 <CTMFNWKMSCJP.DBPZEW25594L@otso> <20230627151842.GB1918927-robh@kernel.org>
In-Reply-To: <20230627151842.GB1918927-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue Jun 27, 2023 at 5:18 PM CEST, Rob Herring wrote:
> On Mon, Jun 26, 2023 at 10:19:09AM +0200, Luca Weiss wrote:
> > On Mon Jun 26, 2023 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
> > > On 26/06/2023 08:38, Luca Weiss wrote:
> > > >>>> but I guess no resends and it can be superseded.
> > > >>>
> > > >>> Right, the patches got reviews but was never applied... I really =
need to
> > > >>> find a strategy to keep track of sent patches until they're appli=
ed with
> > > >>> my work mailbox, it's not the first time that a patch has gotten
> > > >>> forgotten.
> > > >>
> > > >> There was an error reported on the above series. Why would it be=
=20
> > > >> applied?
> > > >=20
> > > > The error report at [0] complains about reg-names but I'm quite sur=
e
> > > > that patch 2/3 resolves this error. Does your bot only apply one pa=
tch
> > > > at a time and run the check or apply all of them and then run it? I=
t's
> > > > been a while but I'm fairly sure I ran all of the checks before sen=
ding
> > > > since I also documented some other patches in the cover letter ther=
e.
> > >
> > > You did it in cover letter, not in the patch, so there is no dependen=
cy
> > > for bots recorded.
> >=20
> > I'm not aware how to put extra comments into a patch in a series with
> > b4, at least last time I checked I don't think it was possible? But I
> > also thought the cover letter was exactly there for giving some
> > background of the series and documenting any dependencies on other
> > patches.
>
> I just put a '---' line and comments after that in the commit messages.=
=20
> That works fine unless your git branch is going upstream directly (i.e.=
=20
> via a pull request). Even when I apply my own patches, I get them from=20
> lore and apply so the comments are dropped.

Ah, didn't know this was possible/supported. In the past with git
send-email directly I'd edit the patch file and add some text under the
"---" manually but wasn't aware you can put it directly in the commit
message. But I guess if it produces the same output either way it makes
sense.

I won't have a problem with pull requests since I'm just a normal patch
submitter ;)

Thanks for the advice!

Regards
Luca

>
> Rob

