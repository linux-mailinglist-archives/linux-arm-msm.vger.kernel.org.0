Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62447C04E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343611AbjJJTqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 15:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343602AbjJJTqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 15:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB11AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 12:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696967131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nUuQl/nIQ+SkLo+mr8xfO0O0dG6CGuGsIcyWiV82E1c=;
        b=DB0D9bIV3pKOcn9cNWf65u36t9Fi6aHkb0Lx7muEp70OLtDPkrEGqGkWpK9bpXqUaMrmFi
        DTAQg6dzLwUkhF/1+ZNqum3XAFwKnN0TXw5DzOPKvcMBHnRxp1cUR/2VEyn2zEDBxBPscu
        Hghkx5c+7Kf2OUsviPa7wlkJCdk9xKs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-Y1E5teGPNzuXd-4JbUvjDQ-1; Tue, 10 Oct 2023 15:45:21 -0400
X-MC-Unique: Y1E5teGPNzuXd-4JbUvjDQ-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-49dd739f8beso2963734e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 12:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696967120; x=1697571920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUuQl/nIQ+SkLo+mr8xfO0O0dG6CGuGsIcyWiV82E1c=;
        b=oxluhPIEB+8mJKbz5YG/AWrehoC1/tD4LYoWnRKFPIOdaDr60KJ5qc5kaTvIFZG4kv
         3RV+DUr+FtMgLp0SaaarIDIKJXLiJtC8Nr0ykxtjnmeAoRwq3zybj0KMk7/HB/0TYOkf
         Hk2xo06eGJKy2L1gd5Ml4elwmoiUV79tzN4oIfp8YpsExdaDbZWbyi2/o+yR55B2tohY
         TLjm9FG5jR78errQLbCIelYFTxwxOefAQO3aEWYQgQ9CSOk1mxuBk01C3LuiTAWVSh05
         WIUSyRh1XQsl8cDYBJtK0ZYdDpeFgSHQG1MIghdMkyyx3aYoXgwOdjk04LkYlTwCvTQo
         1DZQ==
X-Gm-Message-State: AOJu0Yy2v0lB2cwNE09mq60E5/aSWMv3FhJ7A+dKYZw+6nC4dtZmMDlZ
        jl+9eiVefCfLQ7jCYm2l5uWcCZ6hzSwieT7H7c/HaU9OkCCCr2MEtZv+zwf7wIlh1KeicSlwMW/
        YgGRiSvOXdVTu4Qmp9RqPxkOdqA==
X-Received: by 2002:a1f:c9c1:0:b0:49d:94a3:dd5 with SMTP id z184-20020a1fc9c1000000b0049d94a30dd5mr16360404vkf.9.1696967120503;
        Tue, 10 Oct 2023 12:45:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4A2kxEFXcO6bmqDcCgKQNe8y9jBtfbioJZyYMx71IMKn+3kAIQJSAuRQks5T3q6L8fgiQVQ==
X-Received: by 2002:a1f:c9c1:0:b0:49d:94a3:dd5 with SMTP id z184-20020a1fc9c1000000b0049d94a30dd5mr16360388vkf.9.1696967120259;
        Tue, 10 Oct 2023 12:45:20 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id b7-20020ac812c7000000b00417fa0cd77esm4737917qtj.80.2023.10.10.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 12:45:19 -0700 (PDT)
Date:   Tue, 10 Oct 2023 14:45:17 -0500
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
Subject: Re: [PATCH v3 03/15] firmware: qcom: scm: remove unneeded 'extern'
 specifiers
Message-ID: <guwypykdpixdlipfddam6uxrwbagp2dcjfnyecfvo7ykwqchm5@fkagjo7lmac3>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:15PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 'extern' specifiers do nothing for function declarations. Remove them
> from the private qcom-scm header.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

