Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6DE78FF8D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 16:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243508AbjIAO5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 10:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350088AbjIAO5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 10:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DBA10D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693580169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qe/MwpMHYNafFC+5TmrxwtfbdYEx0carSbG7f8NMKRs=;
        b=eUbAj6zJn/hlG/IfvxkA0I5NC/Ehc3t0yFceAj0d+2y5diNNceRIZ9plwUw2OzA0zfVdry
        ewA+VpusddHsRwqdicAqUKeRzrbHgu6yDMOhpZAdkbjEc9QqTK1PnCSA1CiHKFBQdsIbb8
        /j7k+e1IPb8PM3r8GrXZ6MaEy+W5Rjs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-kMoltwh0OGCXtvyZZbhlyw-1; Fri, 01 Sep 2023 10:56:08 -0400
X-MC-Unique: kMoltwh0OGCXtvyZZbhlyw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-64cb143d3b5so21603036d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 07:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693580168; x=1694184968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe/MwpMHYNafFC+5TmrxwtfbdYEx0carSbG7f8NMKRs=;
        b=ZUymbTqVGcJsW7CU2cb+6hMi8Ub8K3W8qGpGSW4e9lAWvbIXL0K2DgGh9bwgk9vfr/
         hq18k0TbB4P2h/cCi2N/Wue1lMZGom4hcAxC4FENMec7Yu1MKUOlA1PeAfFqdrELCIFC
         GaAcQ5upvawv6Nb18hM1NfOPY+8rZSk+AOL1Pso8WRrMYDAz8NjGeJ0udhsr1bQVnXhp
         ytOciNkl9CxpmaYy7espDAo5CU76rYIonCO3EF8zpcf+iCMEyKxwQqSmdex0h5RZb4xt
         5U9eufmQ6JsVu4FxB6EZ/GWCMbownPrnOkfnOBr7sXaIUtn66xt5k201x7Pa8tncfZBo
         JhOw==
X-Gm-Message-State: AOJu0YwktFWp5bpk71+6+BMRNX2DaeVvupNASae5T6DpMdapyoK5MIXW
        Fw/IQr7p9i660TADPWLkP466KX0yAehPAUjLXb10eGQGX0CjQ8bs1pVhuMcLQOsW7nAmEmhS/no
        zf4xph9XkWbR8XdayvKSFv7317w==
X-Received: by 2002:a05:6214:8e9:b0:64f:802b:7e07 with SMTP id dr9-20020a05621408e900b0064f802b7e07mr2635419qvb.55.1693580167842;
        Fri, 01 Sep 2023 07:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ3n3tqbAoVK0w2zo4+AmmYnWe5wemVA5ID/TosFzjP+ELrCFhfa6IqepolB0g6Qx5gP00zg==
X-Received: by 2002:a05:6214:8e9:b0:64f:802b:7e07 with SMTP id dr9-20020a05621408e900b0064f802b7e07mr2635407qvb.55.1693580167552;
        Fri, 01 Sep 2023 07:56:07 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::49])
        by smtp.gmail.com with ESMTPSA id pc17-20020a056214489100b00631ecb1052esm1275941qvb.74.2023.09.01.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 07:56:07 -0700 (PDT)
Date:   Fri, 1 Sep 2023 09:56:05 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Nitin Rawat <quic_nitirawa@quicinc.com>
Cc:     mani@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V6 0/6] scsi: ufs: qcom: Align programming sequence as
 per HW spec
Message-ID: <or3ak3pzz6eozhvvjsjh52vrylehlhvrqrg3ey6slhjtx2mj5g@6vho7zpyeady>
References: <20230901114336.31339-1-quic_nitirawa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901114336.31339-1-quic_nitirawa@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 01, 2023 at 05:13:30PM +0530, Nitin Rawat wrote:
> This patch aligns programming sequence as per Qualcomm UFS
> hardware specification.

reading this series, it is difficult for me to understand as a user of
the driver if this should have any noticeable effect.

Some of the patches mention that there is no functional change, some
only say align with the HPG but change programming sequence, frequency,
etc if I understand correctly on a quick glance.

I think being a bit verbose in some of the patches with respect to
explaining the effect of the patch (or lack of a noticeable effect)
would be a beneficial improvement to this series if there's another
version.

I agree that aligning with the HPG instead of doing some undefined
sequence is a good idea, I'm just reading some of the changes and
thinking "I have no idea if this is going to fix something (no Fixes:
tag but it almost sounds like one), will this improve something, or will this
just change the programming sequence to a known and recommended
sequence?".

Thanks for the patches,
Andrew

