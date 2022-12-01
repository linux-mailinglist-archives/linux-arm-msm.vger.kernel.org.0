Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025CE63F817
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 20:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiLATXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 14:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiLATXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 14:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B97FC6E75
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 11:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669922540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KRzayttSwSsJ/jtFl/tZsSkDN66+m4h4qNmmW/rZF+w=;
        b=fiUXmj7I1Eyn2kbqzMrbBuj0irPhxuhNI4BUrhFQAJgWg6GD4hgjq6gfwUyKjsrcJFnSaY
        SE74awGkjoIwuHRWLHq4hKxfO27GIFUrIIye7flQg4r9h8BEL8ParjmL7j71yYf+Vr+NoO
        kV5YlCxbmHTekaR1j0+SkhP+PEgypKk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-0YgWx_ZuMT6wB93sFMIjYg-1; Thu, 01 Dec 2022 14:22:19 -0500
X-MC-Unique: 0YgWx_ZuMT6wB93sFMIjYg-1
Received: by mail-ot1-f70.google.com with SMTP id v17-20020a9d7d11000000b0066c33c3e0easo1222453otn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 11:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRzayttSwSsJ/jtFl/tZsSkDN66+m4h4qNmmW/rZF+w=;
        b=5czifoFhqkqiOsH+o8mI3t8lNwVyo3StrP1uj3KVQTq3OW2mG0/0FSEcXn91XrtUJi
         mXT1/126IB+WNFO4JAwMLEGXBSbYGtzlQH8LDgsfjW4FTnZQzzuA274jP18UeJWfS4lw
         +oWLw49IDDQLZJ+P+qGbu4+9nZuoPHZCi3SpNP79PJhVoSppXabJxDB9rRfiSgpfiGfd
         Ao9gHfDV05N6hqVhNseLPcwGhWcxI+uuLSPjQCm1suPk2XpCEeC0hBRsY6vKUPYtnoGz
         73VD11Bkw+TUMCl+10OQeDcu0TBWNRETZd8tq8XjaUANMS7kMoawMIs+rS+K4Nwk6Ua7
         WUUw==
X-Gm-Message-State: ANoB5pnFRboQrfjcxhPQDuuBavuCIJX431tqMuXEzWKxmRbawKG0Last
        O7YSh0s/WWwTlM8vf+Ypi6EnhkXMOP8a+BcNDFvb+Rq7/olSyMQIqf2fnzZoFXzQEbWr0pGa2S+
        qcKxBqcla4nW4zPeafK+wYX9nRg==
X-Received: by 2002:a05:6808:143:b0:345:8913:17ae with SMTP id h3-20020a056808014300b00345891317aemr23854533oie.155.1669922538579;
        Thu, 01 Dec 2022 11:22:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wn23egEUl8THpuxVHkoTqQX/Vsfjgq1k8BvNPqZn/l+WC1hbIWW2UmvH5OWeWYf3hN7BYhg==
X-Received: by 2002:a05:6808:143:b0:345:8913:17ae with SMTP id h3-20020a056808014300b00345891317aemr23854525oie.155.1669922538390;
        Thu, 01 Dec 2022 11:22:18 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id h19-20020a9d6f93000000b006619f38a686sm2415522otq.56.2022.12.01.11.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:22:17 -0800 (PST)
Date:   Thu, 1 Dec 2022 13:22:15 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: add SA8540P ride(Qdrive-3)
Message-ID: <20221201192215.fi3ekvkntruevxtd@halaney-x13s>
References: <20221118025158.16902-1-quic_ppareek@quicinc.com>
 <20221118025158.16902-3-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118025158.16902-3-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 18, 2022 at 08:21:58AM +0530, Parikshit Pareek wrote:
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
> Tested-by: Eric Chanudet <echanude@redhat.com>
> Reviewed-by: Eric Chanudet <echanude@redhat.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Tested-by: Andrew Halaney <ahalaney@redhat.com>

