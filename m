Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C436901EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 09:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjBIIMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 03:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjBIIMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 03:12:19 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EF738015
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 00:12:17 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9003E5C356;
        Thu,  9 Feb 2023 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675930336;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HeOa4z+Tzl85CEC3GiUqPtdYNg6Sjc1LHcp1U07fYwM=;
        b=eKdNPB3Gy+CypuiLdpq27HAkJ8jqdU6ukRnby7CwWoZHLLm6nHylHt2VYhCSSofKRrh/ds
        ZNKhkP58/TQMzz4xfQFP+ssygFYtPsVMwVIq+mn2kma0ccpaSx3n6CfzQ4Of90RtmmtoUK
        1V8yV/KzQye/idF2mVCSA1y+ebw6oQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675930336;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HeOa4z+Tzl85CEC3GiUqPtdYNg6Sjc1LHcp1U07fYwM=;
        b=JmlbBkUtPS4BkBdoCezvr/TLSN/YfhgYlSKy9IWSPNzldToDTJsW+QWUrbcneGtsqBxL5V
        ZJJvZnzHphdR2QAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BAB413A1F;
        Thu,  9 Feb 2023 08:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id r4EOFeCq5GMhDAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Thu, 09 Feb 2023 08:12:16 +0000
Date:   Thu, 9 Feb 2023 09:12:14 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: msm8994-angler: removed clash with
 smem_region
Message-ID: <Y+Sq3sEfSYYcm1C+@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20230131200414.24373-1-pvorel@suse.cz>
 <20230131200414.24373-3-pvorel@suse.cz>
 <20230208234717.gums2uqipzzbkhwn@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208234717.gums2uqipzzbkhwn@ripper>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Tue, Jan 31, 2023 at 09:04:14PM +0100, Petr Vorel wrote:
> > This fixes memory overlap error:
> > [    0.000000] reserved@6300000 (0x0000000006300000--0x0000000007000000) overlaps with smem_region@6a00000 (0x0000000006a00000--0x0000000006c00000)

> > smem_region is the same as in downstream (qcom,smem) [1], therefore
> > split reserved memory into two sections on either side of smem_region.

> > Not adding labels as it's not expected to be used.

> > [1] https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-mr1/arch/arm/boot/dts/qcom/msm8994.dtsi#948

> > Fixes: 380cd3a34b7f ("arm64: dts: msm8994-angler: fix the memory map")

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi          | 5 -----
> >  arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 4 ++--
> >  arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 5 +++++
> >  3 files changed, 7 insertions(+), 7 deletions(-)

> > diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > index cdd796040703..a100b05abf56 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > @@ -60,11 +60,6 @@ reserved@5000000 {
> >  			reg = <0x0 0x05000000 0x0 0x1a00000>;
> >  			no-map;
> >  		};
> > -
> > -		reserved@6c00000 {
> > -			reg = <0x0 0x06c00000 0x0 0x400000>;
> > -			no-map;
> > -		};

> I've not picked up the change that introduces this, and it seems that
> there's some request for changes on that thread.

> Please try to sync up with Jamie to get the patch updated, or let me
> know how you would like me to proceed.

You merged v2 [1] as cd451939fdda ("arm64: dts: msm8994-angler: removed clash
with smem_region"), therefore my patchset is applicable the current
qcom/for-next. Can you please merge it? Or am I missing something?

Kind regards,
Petr

[1] https://lore.kernel.org/linux-arm-msm/167591660371.1230100.18259207897974955566.b4-ty@kernel.org/

> Thanks,
> Bjorn

> >  	};
> >  };

> > diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > index 59b9ed78cf0c..29e79ae0849d 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > @@ -41,8 +41,8 @@ tzapp_mem: tzapp@4800000 {
> >  			no-map;
> >  		};

> > -		removed_region: reserved@6300000 {
> > -			reg = <0 0x06300000 0 0xD00000>;
> > +		reserved@6300000 {
> > +			reg = <0 0x06300000 0 0x700000>;
> >  			no-map;
> >  		};
> >  	};
> > diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > index 9ff9d35496d2..24c3fced8df7 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> > @@ -228,6 +228,11 @@ adsp_mem: memory@c9400000 {
> >  			reg = <0 0xc9400000 0 0x3f00000>;
> >  			no-map;
> >  		};
> > +
> > +		reserved@6c00000 {
> > +			reg = <0 0x06c00000 0 0x400000>;
> > +			no-map;
> > +		};
> >  	};

> >  	smd {
> > -- 
> > 2.39.1

