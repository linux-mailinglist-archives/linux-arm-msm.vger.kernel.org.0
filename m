Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE197C8836
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 17:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjJMPCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 11:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjJMPCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 11:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1871095
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697209324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rceeu0VCieDlV0IrlDkPVP2q5+HsG2v/f7CK5R/WNaw=;
        b=GNsK/NEuyoycWLwqDwp4JeKqxZxU32HiASdB0Wgd0F9hbY2i29uFR0Ke3wwj6J2bcEgXxw
        XVmVCzegsVETgXllKXrrUhmYvk/4aPbb/E5I3hDn8oeiQCLg1hu1FWSdFi3twS2fwPKHbl
        h/P2zGsfw8haO0/Y6yyMsm3YyOpbjPw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-qKWPJfb7Oz-3-XIE6FkeOw-1; Fri, 13 Oct 2023 11:02:02 -0400
X-MC-Unique: qKWPJfb7Oz-3-XIE6FkeOw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7740c35073bso263623385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209322; x=1697814122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rceeu0VCieDlV0IrlDkPVP2q5+HsG2v/f7CK5R/WNaw=;
        b=NPhS0uuJfF71Lg+Jysw+Ffox4O3LGEKLpOCrpZg0xBbH8iHlGz7e1nU7u0EWQOVHSC
         l8/b8B6lLPuuSGUO6u2se7BZU3QmK7XgDSbXFLghaqaNeEum6HmbIPLRyl/jVmpzQqlb
         NqWL5QJQ8i/4LEo5oK829mIxN/sGXfBrESAgJVeuAtklw1ufqIH1qFTZMfeuQzEeXwyA
         /dxlJH0dXwWXrLbVh8JgM9C8WRLcOtPHbgOsPwA329T1NUb3taiVXIHkfz556xU9uRUO
         8kYtt4+oO+Yl+wlBIku2S5H2iGAUCQDaFYYr8KLLeSEXxd/bfLWcmWj3Jv4v07DgO5VZ
         ruVw==
X-Gm-Message-State: AOJu0YzU1Eip1m7QsW4w8PYwmjd8V0tRq2GchesZINWefN+lAh9fCApu
        MQPYR8Lj9cIUvCaUbvEkf2VESexvL+P1Rj2ypJG9tjsvfzVNfO3orLfeZwCKAlk1HKHTN93/+/F
        0uVqCbJmDHd2CthHhAWuPFtTdkA==
X-Received: by 2002:a05:622a:44b:b0:418:17f3:ccc0 with SMTP id o11-20020a05622a044b00b0041817f3ccc0mr35404183qtx.56.1697209322042;
        Fri, 13 Oct 2023 08:02:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHphW6kyjwXlo3xruqsPlCBj7jdExaUjCwBOnEuMwiuamZQ5i1GxIHDed5LrCyxmOv6ime41g==
X-Received: by 2002:a05:622a:44b:b0:418:17f3:ccc0 with SMTP id o11-20020a05622a044b00b0041817f3ccc0mr35404135qtx.56.1697209321559;
        Fri, 13 Oct 2023 08:02:01 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id x26-20020ac84d5a000000b0041520676966sm664565qtv.47.2023.10.13.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:02:00 -0700 (PDT)
Date:   Fri, 13 Oct 2023 10:01:58 -0500
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
Subject: Re: [PATCH v4 05/15] firmware: qcom: scm: enable the TZ mem allocator
Message-ID: <4ojnfvx3upmklxteisp7rgymfnkksqkq3s6ewg3fma5ywyd7cd@zqdr6ovehphh>
References: <20231013114843.63205-1-brgl@bgdev.pl>
 <20231013114843.63205-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013114843.63205-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 13, 2023 at 01:48:33PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Select the TrustZone memory allocator in Kconfig and create a pool of
> memory shareable with the TrustZone when probing the SCM driver.
> 
> This will allow a gradual conversion of all relevant SCM calls to using
> the dedicated allocator.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

