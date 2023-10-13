Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAB67C8845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 17:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbjJMPEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 11:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbjJMPEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 11:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F6CC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697209446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fanr2UVL+2nniIjAFaTEYZESUnPsIrFphLfF6ehOj0I=;
        b=DK9mFlm6/rHdddgJMgcFb+rd7Icu40shkj9IV4CHRHfEDd+y4JrG+ZJSd82LYNjqS/gPlb
        P4a5Yrw+Czfltcoq27satJj1EgFPt0+l06SjVqm1TwV7UtjmOElMHaRBUwr7cEu2mYwA/X
        JU5SrHuTDa9x4173HR+5yp2cNx1nWX8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-SZUam5m7NPGxuZ0dYc7i8w-1; Fri, 13 Oct 2023 11:04:05 -0400
X-MC-Unique: SZUam5m7NPGxuZ0dYc7i8w-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d120c28afso22145366d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 08:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209443; x=1697814243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fanr2UVL+2nniIjAFaTEYZESUnPsIrFphLfF6ehOj0I=;
        b=NR2bwlelue64JC/f50MqinGwPKhByeS5m6fPJu3iKUNidKHGNSUF71UBa0uecHgXhJ
         ZCDFlbvGea8lNzGcTGnsieFvMF6vEXACjPbsfkJDWqdyfjYxZ3FPzrmIhkuW8wljkCsv
         FeJRZRVbwvyfg95iFdkQnfCJ59ZKYti2y8mlf0neEY2fWvrSjdyXB0MtX28BYu6fnbI2
         8loxx//oJhs1QmkO2Hjo/3+mBIIy9JKoqu+rvilzbSv0YkS66O5RyA4v3ERSyZ390C8E
         bNZrjHan/S62U4BhztymAENNaeLbxEbNqWmZXOOILjW+EkLWtDhSFHkoWoZPJJGI6Cb+
         6y9g==
X-Gm-Message-State: AOJu0Yy9ehdqTqUAXsqwbpTUrZu6qffSqqgwHvdXFdJifoMRLb0Pkw4C
        S39YPwyyfy626xZP5JKvTC8Xu3XQPyD79PWDPod85vIswaRAW8UH0BB8+oh/ydqaQnbbzpC/t9R
        CCR3UY5vmlRCgezpH5ZSC/nlP7hbSNaAA2A==
X-Received: by 2002:a0c:ea2c:0:b0:656:51b9:990e with SMTP id t12-20020a0cea2c000000b0065651b9990emr26082256qvp.57.1697209443233;
        Fri, 13 Oct 2023 08:04:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrk96WeM7PEfTiXqFn+XI1KMhVsRiXg6a34mYtKQ92DjlhZ/wrrzpdhvKPOXfvZbnSnt+L+w==
X-Received: by 2002:a0c:ea2c:0:b0:656:51b9:990e with SMTP id t12-20020a0cea2c000000b0065651b9990emr26082228qvp.57.1697209442773;
        Fri, 13 Oct 2023 08:04:02 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id a24-20020a0ca998000000b006616fbcc077sm732483qvb.129.2023.10.13.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:04:02 -0700 (PDT)
Date:   Fri, 13 Oct 2023 10:04:00 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 12/15] firmware: qcom: scm: add support for SHM bridge
 operations
Message-ID: <jcsd2xrj44ekh34ptl3gluzyikjqlauje7qdfohinju73twui7@fuglljx55uz7>
References: <20231013114843.63205-1-brgl@bgdev.pl>
 <20231013114843.63205-13-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013114843.63205-13-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 13, 2023 at 01:48:40PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add low-level primitives for enabling SHM bridge support as well as
> creating and destroying SHM bridge pools to qcom-scm.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Code wise this looks good to me, firmware interface wise I can't
properly review, so:

Acked-by: Andrew Halaney <ahalaney@redhat.com>

