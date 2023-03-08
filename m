Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17166B069E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 13:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjCHMHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 07:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjCHMHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 07:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0C45C11E
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 04:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678277183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fPaX9pdabP6JQosCXDJl3Igxu4+FbhmhgJXUTxNfUvs=;
        b=ey1xDOTLvHU/5OinXjd+fWpjFNfy1LT2yYKYwwsQLX6yHPx9sHMX8khRaAc0xFEbXmNHOu
        Iilh6X1hImus/6ZtTwmvQemNIBMCh1ffpOEyX9FsHpKiaxN92ESWKONl44SteZMJ7MvDqj
        9waXRwG2XSrRjYJHZF6MkPcOepqycto=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-8a3OA0vtNvmZYZy0gCz9Pw-1; Wed, 08 Mar 2023 07:06:22 -0500
X-MC-Unique: 8a3OA0vtNvmZYZy0gCz9Pw-1
Received: by mail-il1-f197.google.com with SMTP id q8-20020a92ca48000000b00320ed437f04so4303932ilo.19
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 04:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678277181;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPaX9pdabP6JQosCXDJl3Igxu4+FbhmhgJXUTxNfUvs=;
        b=lRyDd/vnsYbc4CRAjHdYLu61kZ2rw78aj+v46TZMey30AztgdABjF+OLpQ2vT52Eqp
         DgT9Lgni2ncJD4Pv5XxhLXgnrDWE6Cy0x92vE98qBZKksoI2nfX6OMHDgQYRwZQagnFw
         vkWWiTwmsUtkloWtrRnCyJSlGZaqVEG7147U4qcjEsFXqL6INBmvkcRAuKCz7UOOFzEf
         9VSn2dodjzzFQmvesMI+3NLopKVoV3O9qWn3rylUwFqUdhI1CYTaretq77hoHq+HFfF+
         rqMpFtG2JUry5FwHHQW6nXAui8BBEquC8NUiJ5puMM21MdZvvWiQVxJzeXbeCfMEw7Et
         NcpA==
X-Gm-Message-State: AO0yUKVN94JBNZGPSMFjcyrHYTTd3KR2w6+r5pWepVCW9HjaZiyrIBm5
        RAtmtPsOTCPV1rjb/C7RTDG9h3JGS/HGwY5cn+8kO/OwlqBIr208XEbqqqg2llu4sSsJ/bR/kUE
        6ycEBerJuHN042VKjzohceNZNIQ==
X-Received: by 2002:a05:6e02:1987:b0:316:b0b2:c2f2 with SMTP id g7-20020a056e02198700b00316b0b2c2f2mr16913176ilf.3.1678277181566;
        Wed, 08 Mar 2023 04:06:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9uY+GlPLXK8LkX+GE1LtB5w/LJF1oVXckLfL3zNH8Xsv3v09degyuUCbAT1+n+cqB1ZJ1vCw==
X-Received: by 2002:a05:6e02:1987:b0:316:b0b2:c2f2 with SMTP id g7-20020a056e02198700b00316b0b2c2f2mr16913166ilf.3.1678277181374;
        Wed, 08 Mar 2023 04:06:21 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id u5-20020a02c045000000b003b1d7fbf810sm4971683jam.148.2023.03.08.04.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 04:06:20 -0800 (PST)
Date:   Wed, 8 Mar 2023 07:06:19 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, quic_shazhuss@quicinc.com, agross@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8540p-ride: correct name of
 remoteproc_nsp0 firmware
Message-ID: <ZAh6O9TbX/pnOnxp@x1>
References: <20230307232340.2370476-1-bmasney@redhat.com>
 <1a915c33-ef32-852c-a856-10c8d35be151@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a915c33-ef32-852c-a856-10c8d35be151@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 08, 2023 at 12:02:04PM +0100, Krzysztof Kozlowski wrote:
> On 08/03/2023 00:23, Brian Masney wrote:
> > The cdsp.mbn firmware that's referenced in sa8540p-ride.dts is actually
> > named cdsp0.mbn in the deliverables from Qualcomm. Let's go ahead and
> > correct the name to match what's in Qualcomm's deliverable.
> 
> I don't think vendor deliverables matter. linux-firmware is here more
> important. The file will be cdsp.mbn in the firmware, won't it?

cdsp0.mbn and cdsp1.mbn for the sa8540p are not in linux-firmware and I
far as I know there's no plan for someone to submit those since QC would
need to approve that. I can ask though since the DTS for these two bits
has been submitted upstream.

Brian

