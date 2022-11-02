Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E690616CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiKBSlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiKBSld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F9E1FCD3
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667414432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z6U2QWI3L7CELeN2uR9v9BKzosx2j/rMnyai3sfNG/I=;
        b=KSNktb3wfCikjCKeeorYJzoUZiB3AKH17tneXG3+VRNga3E4kWx63aky53MTWK2IPWqJpI
        FkiGpFnYz2UIvH2lu/aszRB6rP8hpxzGJzbFKitscjjAp6aOrOLavMm0jfvjcsYCbFqUb7
        mjk+GyyGkbU7FzepV/Ztvxy45hvVjM0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-aQA0pXXgNUy-lEfn8673Zg-1; Wed, 02 Nov 2022 14:40:29 -0400
X-MC-Unique: aQA0pXXgNUy-lEfn8673Zg-1
Received: by mail-qt1-f199.google.com with SMTP id b20-20020ac844d4000000b003a542f9de3dso2456759qto.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6U2QWI3L7CELeN2uR9v9BKzosx2j/rMnyai3sfNG/I=;
        b=L0gFhGL7nNPpPNy8t1yPcfKFkvrwmFfXzJef6fyz1O01a7roxfR/HGcXZNtEkn6bBv
         wnCuPRdApLSP1kAWoTzsDKpI7H7Xy+R15Hx4O+Oa7iVY+86lUbI0Wb8rwvhgJXY5psJ5
         6QNtfYXGV7oxsVaq/MWCocHzqFMRoCqsz/AQMJp9KBm9EAqRVovYss7IQIhm+4Wk2syq
         h4ch/AQr5KngN/9kmSsa25FsbSgEdVTIU/ZfZ0JPkp7xfWg0v7QnZx+vPHJuEyzkjHBv
         cQZBEL1QWumVRClOss6ZrcKQZg85QffXFZd5/UH0u3Nr9jVeEJKblf9J1P07XiCkH1oU
         4z0Q==
X-Gm-Message-State: ACrzQf2yqAukHKj5NNIqZNieJw6oi6LelqRX5dhtnhiCPH0nPAoBPgPx
        +f/a3xgzgI9lzv+spPQicWggeKfMRwZLmnF7eq0qp20Bb5wHlkN0CmbCvmJG0+NiPglsXiwYC63
        jGNVVaFyHLr1Nt5/uMI1+hTuFXw==
X-Received: by 2002:a05:620a:2984:b0:6fa:6636:d4e5 with SMTP id r4-20020a05620a298400b006fa6636d4e5mr2471921qkp.622.1667414429134;
        Wed, 02 Nov 2022 11:40:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5T4ytHu3K/k7aIWWR9fQduopTkBaK9CqkhKpSxE2oFDFcMEEUfWbOKCZP3zXChPWrTaqbUlg==
X-Received: by 2002:a05:620a:2984:b0:6fa:6636:d4e5 with SMTP id r4-20020a05620a298400b006fa6636d4e5mr2471904qkp.622.1667414428917;
        Wed, 02 Nov 2022 11:40:28 -0700 (PDT)
Received: from localhost (pool-100-0-210-47.bstnma.fios.verizon.net. [100.0.210.47])
        by smtp.gmail.com with ESMTPSA id bm2-20020a05620a198200b006cfc7f9eea0sm8930499qkb.122.2022.11.02.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:40:28 -0700 (PDT)
Date:   Wed, 2 Nov 2022 14:40:27 -0400
From:   Eric Chanudet <echanude@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: add SA8540P ride(Qdrive-3)
Message-ID: <20221102184027.236affysihqnivh5@echanude>
References: <20221102103552.29388-1-quic_ppareek@quicinc.com>
 <20221102103552.29388-3-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102103552.29388-3-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 02, 2022 at 04:05:52PM +0530, Parikshit Pareek wrote:
> Introduce the Qualcomm SA8540P ride automotive platform, also known as
> Qdrive-3 development board.
> 
> This initial contribution supports SMP, CPUFreq, cluster idle, UFS, RPMh
> regulators, debug UART, PMICs, remoteprocs and USB.
> 
> The SA8540P ride contains four PM8450 PMICs. A separate DTSI file has
> been created for PMIC, so that it can be used for future SA8540P based
> boards.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Tested-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>

Using the default defconfig on next-20221102, preventing
qcom_q6v5_pas.ko to load avoids the board crash observed in v5, as
found during v6 review by Brian.

Tested-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

