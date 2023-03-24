Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F776C7F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 15:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbjCXOMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 10:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjCXOMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 10:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22391B56D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679667125;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7x5FMYKL/oVJz3tQGcZN2b2gCBkkTlGcuo/IBwXiCnI=;
        b=MuFpyd8EnJGfijTFkvgxU/40MtU34YmSWeVcu6H9SRn9cZyHhYarJphnPnnKdLKBKcP4I7
        L1oTChwfhJnTYTooHd6P89VbFQbDkb2vFDSr9SoGbiXQdYzvmiS64Mi/MOdeGRji9z4fkp
        ge87A59qrczWKWLn033KcCfPdLDpATM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-7WA211GdPjqSBmgh4uap1Q-1; Fri, 24 Mar 2023 10:12:04 -0400
X-MC-Unique: 7WA211GdPjqSBmgh4uap1Q-1
Received: by mail-yb1-f199.google.com with SMTP id g187-20020a2520c4000000b00b74680a7904so1875819ybg.15
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679667123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7x5FMYKL/oVJz3tQGcZN2b2gCBkkTlGcuo/IBwXiCnI=;
        b=GxLtgwQztSeGsIfNfdrNva96gjKQFPd0L57xYqYmVBrMiQUa1hZOxzSIo35MeHOy1I
         5GWWIEYtHGnVxzgircLYMWj5TsD2uNXujvEFP6EeQeRmVD+wFWSISyLvTsy5Uel/KpdT
         5455AWQKDEFC+KdHEpHkKOLH+TNyk590a3buog7UVC4R4PgBkX3x4clTzTOWYxBsFydD
         D2OvWlzzZREekhpOtKS6xmbvVlLQ7nkDTr8MP/xZ5SW06SYTrBY3S3rO+Bzqr+6lJefT
         64PIYb20y2smkbaPIGWQyJwdCq6oCBneu/uC9oUGrTdPfDMCgpf2v0rtHkOGpJ4x6cbj
         uCHA==
X-Gm-Message-State: AAQBX9f/dD0LE+PufPFB40Dmkha3c8nknI+iQeKIV6UYdOOmqeQf7JoS
        /zN1FwwJzRhrC7vKqj64eUVpNGtQ7d+VabbmE+ZT3bJCl02UI9jln5b7Qr71E1Xylgo3LfCyp6+
        ZQz90vgsD/350PIzYky+VjSqDig==
X-Received: by 2002:a0d:fd07:0:b0:545:91ae:f5a0 with SMTP id n7-20020a0dfd07000000b0054591aef5a0mr2126569ywf.51.1679667122937;
        Fri, 24 Mar 2023 07:12:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFISBweozfrJLRN2PDUoOSUv4156/1ipJP+0MX48z7EDbluxllafDZdgbK5QXw4zG3brhe3w==
X-Received: by 2002:a0d:fd07:0:b0:545:91ae:f5a0 with SMTP id n7-20020a0dfd07000000b0054591aef5a0mr2126537ywf.51.1679667122553;
        Fri, 24 Mar 2023 07:12:02 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id a67-20020a811a46000000b00545a0818482sm421695ywa.18.2023.03.24.07.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 07:12:02 -0700 (PDT)
Date:   Fri, 24 Mar 2023 09:12:00 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS
Message-ID: <20230324141200.he2rpj4x6tdtre27@halaney-x13s>
References: <CGME20230323220529eucas1p12e5e1bbe2a31fe775cd9e6244f9282ce@eucas1p1.samsung.com>
 <20230323220518.3247530-1-m.szyprowski@samsung.com>
 <CAD=FV=WfREMuL6Z-aseAWPKXqpkutPofrWGy4ySH-WgbTHC-fg@mail.gmail.com>
 <a45c4b18-0fbe-1e75-9b47-6c26217c97e3@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a45c4b18-0fbe-1e75-9b47-6c26217c97e3@samsung.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 12:18:53PM +0100, Marek Szyprowski wrote:
> Hi,
> 
> On 23.03.2023 23:08, Doug Anderson wrote:
> > On Thu, Mar 23, 2023 at 3:05 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> Restore synchronous probing for 'qcom,pm8150-rpmh-regulators' because
> >> otherwise the UFSHC device is not properly initialized on QRB5165-RB5
> >> board.
> >>
> >> Fixes: ed6962cc3e05 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for drivers between 4.14 and 4.19")
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   drivers/regulator/qcom-rpmh-regulator.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > I don't object to this patch landing temporarily, but can you provide
> > any more details, please? On Qualcomm Chromebooks I'm not seeing any
> > issues with RPMH regulators probing asynchronously, so I can only
> > assume that there's a bug in the UFSHC driver that's being tickled.
> 
> You are right. I've analyzed this case further and it turned out that it 
> was my fault. In short - 'rootwait' kernel cmdline parameter was missing 
> and root was specified as '/dev/sda7'.
> 
> UFSHC driver properly retried probing after it cannot get its 
> regulators, but it happened at the same time when kernel tried to mount 
> rootfs. I was confused that this is really a regulator issue, because 
> the mentioned /dev/sda* devices were properly reported as available in 
> the system in the root mounting failure message, but adding the 
> 'rootwait' cmdline parameter fixed this problem. It would be safe to 
> revert this change. I'm really sorry for the false report and the noise.
> 

It looks like this got applied, but reading your above message makes it
seem like this patch is not necessary. Did I understand that correctly?

If so we should see if Mark can drop / revert it?

Thanks,
Andrew

