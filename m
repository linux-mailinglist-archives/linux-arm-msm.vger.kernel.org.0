Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC5560499D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 16:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiJSOqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 10:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiJSOqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 10:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C2614C536
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666189966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5YibLNy+OciDPg1RqQtPWy91evf3zRYGT05L7hMD1SE=;
        b=XMmjW232vNZUtQ2gdCcRA7a4fdA4jMFXg+t/h+AfkKcoKRsNvgFJdH0xM1E9lbf05u+0kj
        lVc+Ub0QZAIT21zxeKsg3octwXrIjsO4/MLx/KxXMFGrM7m2ahWRwMMgOv3yKEC6jq+1KB
        MqU06aJs6/NXWAmNVMYwpM90XvLia3c=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-izSuhuhfOiS8XL63dN-qLA-1; Wed, 19 Oct 2022 10:32:45 -0400
X-MC-Unique: izSuhuhfOiS8XL63dN-qLA-1
Received: by mail-il1-f197.google.com with SMTP id h10-20020a056e021d8a00b002f99580de6cso16287469ila.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YibLNy+OciDPg1RqQtPWy91evf3zRYGT05L7hMD1SE=;
        b=2VR6MBEAfj6nrr47T/vCVfgH45Whp4CaqgzfOvm9BgbPmc82WJsjsIicn7byzvbY38
         sz05InLAC9JkZ+3ba6NSCwB0QHL7ve1iyW4VWiOjJk9yzm/Lt0aE7TQz+lu6n2/e6BwH
         2wydQiBejCYhIM0Smyooqkx6mLhtptIiUX1zjhbHjDflbnijVYvP2quPDGK5aI+q+4zJ
         3K5bw7BDd2+ksYPiyngz98PeX6y/ENbtEx/nWINUCY7cXWQzXNc7hkTH1M2wg0VzGNDu
         SzFGPeQ8zSFiSZ/PDq2OBoURS2RoVIsg+b98g45C8+JZonZ+xzDaV0QpHhliGTZE2ePm
         dM6w==
X-Gm-Message-State: ACrzQf39Wq+2cVcUlYaCuPnIoM+77gVj0pPaAWOozUewPqQ6EdFc9uxt
        1Azzci5XyjqrjFMdJkDTsA6mZ8ZExgg9obU8iqGinW5kqqNrBaq1rEa+tgi3uuMn9QVzJAzojVA
        2Jllw0RCJ/eE0r2ZQxdAq4ykJfQ==
X-Received: by 2002:a02:54c1:0:b0:363:453e:2ccb with SMTP id t184-20020a0254c1000000b00363453e2ccbmr6451898jaa.228.1666189964203;
        Wed, 19 Oct 2022 07:32:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/HkVuS6wNDB9egoiQiNu3qMpbMyAK3j1AnEKd9qXTPxLsvFR1yo6X9O/te7EZm3+VoF9IlA==
X-Received: by 2002:a02:54c1:0:b0:363:453e:2ccb with SMTP id t184-20020a0254c1000000b00363453e2ccbmr6451869jaa.228.1666189963941;
        Wed, 19 Oct 2022 07:32:43 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id f20-20020a02a114000000b00363961f0f2dsm2140039jag.115.2022.10.19.07.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:32:43 -0700 (PDT)
Date:   Wed, 19 Oct 2022 10:32:41 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: qcom: Add basic interconnect support
Message-ID: <Y1AKiTkLa23idaf2@x1>
References: <20221017112449.2146-1-johan+linaro@kernel.org>
 <20221017112449.2146-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017112449.2146-3-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 17, 2022 at 01:24:49PM +0200, Johan Hovold wrote:
> +	/*
> +	 * Some Qualcomm platforms require interconnect bandwidth constraints
> +	 * to be set before enabling interconnect clocks.
> +	 *
> +	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
> +	 * for the pcie-mem path.
> +	 */
> +	ret = icc_set_bw(pcie->icc_mem, 0, MBps_to_icc(250));

[snip]

> +	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
> +	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
> +
> +	switch (speed) {
> +	case 1:
> +		bw = MBps_to_icc(250);
> +		break;
> +	case 2:
> +		bw = MBps_to_icc(500);
> +		break;
> +	default:
> +	case 3:
> +		bw = MBps_to_icc(985);
> +		break;
> +	}

Just curious: These platforms have a 4 lane PCIe bus. Why use 985
instead of 1000 for the maximum?

Brian

