Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CB458A4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 04:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbiHECPe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 22:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbiHECPb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 22:15:31 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3A6E0C9;
        Thu,  4 Aug 2022 19:15:30 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t2so1451336ply.2;
        Thu, 04 Aug 2022 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=c1hElks0EiMPqEj2Pxzet0gd4GBC1sIlq2K90tOv6P8=;
        b=S2UshQ0EqqI16RU+oVisaaT0G2aRtg4cUJ7NrGmuTwh5yfSUqpaPzCz3Ycntlwy12b
         iTq/SgsqK1J/GZQUAzpk7vMBa1hgEZHv/wUq+cm5HI1hmfcamIxx+j/2iBNzMyfB/g1l
         GMR1d/udXWgQV3IRffyIY23+S9JypxTPIcWmo0S0sakgGjsNwKV3gSvx+mP6qISxkpp6
         anBeg+tF2kHT4030INR9EElFJSHh7JdRmP5xGFt573VttQ+mad0H94Hbrd0V9OkbkYrA
         fwK5dlmyqkInpT7uIiO4DRPLOZOdQ7rOUESJdfl1iu3C8mTj6C8TmQVnHi+WhSxpPsrY
         gAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=c1hElks0EiMPqEj2Pxzet0gd4GBC1sIlq2K90tOv6P8=;
        b=k6KTlXGi5EIKBBeFFf/3ArTK1LQuZkHUxA5dMyQugrBJwhN8WjrKfEKbQq0Dr1u+HV
         7bXZVMBUgKwwvcVpN53/6HAzUOQnq+iOzvwYweBkXfd1Qq8LCvygmRqSDRPEf4P9MSax
         rrwwvhwKOkf8510oPPBQqn0JiK0zjgZI3NZszE6bloBTQhXmLye1TsrJ4EhkaNGsgaZk
         G7Lm6lK6xVWzMysN/KA7ojys8rhBKGi2BLTxjXIHCaHbHATlQ1KJFSkrqXb9+wos9qs6
         7cNbNIAj6nKUOin5S9cUMHu4dTBs3zMoUkf4MPvu/FFoSZec79s5KcWoZfWUi5OBEFuF
         /hBg==
X-Gm-Message-State: ACgBeo3qTOu5/sHO8DRaCgMDR4WiliA2U+iSwufEqxJQtGcZRJkwvVvO
        KaTg/3S2M8SiwNz0Wf/64x4=
X-Google-Smtp-Source: AA6agR77ZHGZ+uxxpgNccpYoYp2kC5VbtTjWiRxAsLO9g70ROMk1CG91pYyGdCg3c0KLZc022PYBFw==
X-Received: by 2002:a17:90b:3947:b0:1f5:104:f8cd with SMTP id oe7-20020a17090b394700b001f50104f8cdmr13304151pjb.26.1659665729890;
        Thu, 04 Aug 2022 19:15:29 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-7.three.co.id. [180.214.232.7])
        by smtp.gmail.com with ESMTPSA id j11-20020a17090a2a8b00b001ef8ea89a33sm4430792pjd.2.2022.08.04.19.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 19:15:29 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id DBC291047E5; Fri,  5 Aug 2022 09:15:24 +0700 (WIB)
Date:   Fri, 5 Aug 2022 09:15:24 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Message-ID: <Yux9PO0x+9aAVNj6@debian.me>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <YuuC0NISKFVIhUD1@debian.me>
 <3dd4b206-8771-972b-7f4d-4935c5fbea3e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dd4b206-8771-972b-7f4d-4935c5fbea3e@quicinc.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 04, 2022 at 02:48:58PM -0700, Elliot Berman wrote:
> > 
> > Hi,
> > 
> > I can't apply this series on top of mainline or linux-next. On what tree
> > (and what commit) this series is based on? I'd like to do htmldocs test.
> > 
> 
> The series should apply cleanly on commit 4a57a8400075 ("vf/remap: return
> the amount of bytes actually deduplicated") from Linus's tree.
> 

Applied, thanks.

Next time, don't forget to specify --base when using git-format-patch.

-- 
An old man doll... just what I always wanted! - Clara
