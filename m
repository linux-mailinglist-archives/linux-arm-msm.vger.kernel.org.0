Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED07690F9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 18:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjBIRzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 12:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjBIRzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 12:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15501643F9
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 09:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675965268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iWmHhHrlFcrfX0liIBaTbm4WQumXe+aAPuhg0kV7U5w=;
        b=PjD3S/SEdaDxC7/KU/WYmSrfQ3VhfYx2DmZyJZgR1SUv08lEMC0BV3n8LnJg9KpuMhs7rW
        4oN2A+jqNgGSi4ZNPBzJ6fX3cJY3O+TpDOm7D8xRi2xGLdQddSANKbXWyLQfD+usKnvFQO
        5pPnPFTN0Kd2dA76yTemz8n2hfxGM9c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-oC3aYOAnN3O_CTb9vbgaTA-1; Thu, 09 Feb 2023 12:54:26 -0500
X-MC-Unique: oC3aYOAnN3O_CTb9vbgaTA-1
Received: by mail-qv1-f72.google.com with SMTP id lw11-20020a05621457cb00b005376b828c22so1650091qvb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 09:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWmHhHrlFcrfX0liIBaTbm4WQumXe+aAPuhg0kV7U5w=;
        b=XCVio/172wjPXznIE4zDYojbLi1cc4EnOBiSJFOGWHiJRT/7Feb6MErPCUJ8ndx3B2
         GfJSYdl9cOJn+C/VB+sEE+4EqS0kvXE/YWMuOs4q8/iqTJ47sivu2s6M1zZfTSeZhmfV
         REysSD+oH4iadtNG24vp/Tno80bQDfIFmFEh8PsQk41pXNa09wxy1vuKPeOq59tnQrXY
         Tr1aqlf3XGrvoiF3TPwcpfLx0K5e89bJMRz+a3tFU7DeA+o0ZN1HODKItlpiNpeGLVvN
         cCc/oPo9nMANX5cz10/qn1lqQuNmj8WCCjWMRfa9VbShLjAsDJECuIVDJBMpOiP6izsu
         EGzA==
X-Gm-Message-State: AO0yUKUFmC02+ZccoxqnNshqA40p2jqPBKQ7gxy9ePHfvmPG2My5zfpb
        Dk6Def/fE0m0DdCuB/cZdavhY2shgGFr3A7DK3NcPzbGeyOlbnsUGJuH5Y9H42kguRBAwaScKGU
        Dut+S5rjzWqJCvF7+LZvWod4Vmg==
X-Received: by 2002:a05:622a:15d6:b0:3b8:2602:9a35 with SMTP id d22-20020a05622a15d600b003b826029a35mr16919030qty.52.1675965266418;
        Thu, 09 Feb 2023 09:54:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/+rx+Cayi7SmGL5gCWRNZyS33BKhGJK4OJ/W0EcrerxiGF4DtqkTA46DnNUHBs/xStt+uzcg==
X-Received: by 2002:a05:622a:15d6:b0:3b8:2602:9a35 with SMTP id d22-20020a05622a15d600b003b826029a35mr16919012qty.52.1675965266216;
        Thu, 09 Feb 2023 09:54:26 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id a21-20020ac84355000000b003bb764fe4ffsm1740735qtn.3.2023.02.09.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:54:25 -0800 (PST)
Date:   Thu, 9 Feb 2023 12:54:25 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/3] soc: qcom: smem: update max processor count
Message-ID: <20230209175425.kevrdvjf5zno5edb@echanude>
References: <20230209095753.447347-1-brgl@bgdev.pl>
 <20230209095753.447347-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209095753.447347-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 09, 2023 at 10:57:51AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Update max processor count to reflect the number of co-processors on
> SA8775P SoCs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Chanudet <echanude@redhat.com>
Tested-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

