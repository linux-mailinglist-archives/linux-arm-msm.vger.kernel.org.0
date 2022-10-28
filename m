Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2712E610C33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 10:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiJ1I3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 04:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiJ1I3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 04:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DDB1C4EC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666945727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eYvTqJzZRhXZcmDQGfvWqV+LWUYCoBA0yMtYA0vrjX8=;
        b=P68kXAtvq2/tWZTT6A0J6Wze2SwIJp/7peGKBhIuBCWcKceuffhVFQG29WLpPd691VQQsx
        YuJ5874Ekn9clah2M/kLbp/GvGxKPxxVC9Vi8Du/XBpisvo0Ht8Zec/vfpkVlOKr25R5yc
        blLk0NtcJKBWOlwJJLE+h7RH4gIyy8c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-gVqVSJtZNwO7bsuVuwY71A-1; Fri, 28 Oct 2022 04:28:42 -0400
X-MC-Unique: gVqVSJtZNwO7bsuVuwY71A-1
Received: by mail-qk1-f197.google.com with SMTP id bk21-20020a05620a1a1500b006be9f844c59so3141001qkb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 01:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYvTqJzZRhXZcmDQGfvWqV+LWUYCoBA0yMtYA0vrjX8=;
        b=X9Rhu3ZbP+z7+NrISE+gSh3Q1bPVPBLXzuygSHX5N1aUOK4UMDpax8RfWyos5D53O3
         h7FA4Az6GMcGX5cCPamJ8fIIx7Mv9IJMBzVoQxmHzq0uoumDIijSMF6fsmVixoKKDkki
         WXXaB6tRyaKeNd/FRnhZt8OoxXC0KM6YL+2Zd/nZl8ZmeFh2qD43XvQq6wguivLc1hT6
         llgPvrKanRDfQm1nV5PcZxC0G0uXBjTOZoxrV6p2gAzv7yoISr16s7l5ShGL8V6mELpd
         +zVVcvdcZY23Ii3N79lAMV5ps39UHVBv+r3rlRq595qQWC4jzj4hHCZOI7rXnPHAVz1D
         WcAg==
X-Gm-Message-State: ACrzQf3LJIkPAwwEy0YHN0SrU9xj5yYe66cqFP0HcYAcWx+HmNMfLLu6
        C79Q8680RigJUepENljbD8aVwdzcvgV1TxdihDS1QQehkecPDpMVuZZ12NszDENbqv04nWFCBXn
        NtxhJHk/rQiEn0f5pC2KcDQwvKA==
X-Received: by 2002:a05:620a:51c6:b0:6f9:feea:3a53 with SMTP id cx6-20020a05620a51c600b006f9feea3a53mr4128060qkb.425.1666945722082;
        Fri, 28 Oct 2022 01:28:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lPZseY0YX+Knkpt2FrP+30Epj8TvUR5e8NY8W69ZnO6N8AkrenE+W50V8u4lMSiNkZpmDgQ==
X-Received: by 2002:a05:620a:51c6:b0:6f9:feea:3a53 with SMTP id cx6-20020a05620a51c600b006f9feea3a53mr4128051qkb.425.1666945721891;
        Fri, 28 Oct 2022 01:28:41 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id s4-20020ac85284000000b0039c7b9522ecsm2088432qtn.35.2022.10.28.01.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 01:28:41 -0700 (PDT)
Date:   Fri, 28 Oct 2022 04:28:40 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     konrad.dybcio@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: add SA8540P ride(Qdrive-3)
Message-ID: <Y1uSuBNhAL/YMEVc@x1>
References: <20221020073036.16656-1-quic_ppareek@quicinc.com>
 <20221020073036.16656-3-quic_ppareek@quicinc.com>
 <7a62dd552c02e2b83fabaf9ff55a7c6c@somainline.org>
 <20221028075059.GA15101@hu-ppareek-blr.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028075059.GA15101@hu-ppareek-blr.qualcomm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 28, 2022 at 01:20:59PM +0530, Parikshit Pareek wrote:
> > > +		vreg_l3c: ldo3 {
> > > +			regulator-name = "vreg_l3c";
> > > +			regulator-min-microvolt = <1200000>;
> > > +			regulator-max-microvolt = <1200000>;
> > > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > > +			regulator-allow-set-load;
> > Not sure if setting load is desired after recent rpmh regulator changes.
>
> May I know the exact patch being refered here?

Hi Parikshit,

You now need to specify a regulator-allowed-modes. Here's some links
with more information:

https://lore.kernel.org/all/20220907204924.173030-1-ahalaney@redhat.com/
https://lore.kernel.org/all/20220824142229.RFT.v2.2.I6f77860e5cd98bf5c67208fa9edda4a08847c304@changeid/

Brian

