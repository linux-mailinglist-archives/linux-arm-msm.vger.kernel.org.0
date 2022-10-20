Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38B86065E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 18:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiJTQdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 12:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiJTQdr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 12:33:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3601C25CC
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666283625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+PN9Zmo6gmcoTAvY3Ztc9ZICuuK1P6MwzJ+pG+ZS7pk=;
        b=DG+Nvo7StrcPp+qo/WcbzO1hDPbdVoCnNvVm0a4cvjTKYgJhN65Z9GngUZY6qI/0FyGlsh
        Hxw0H3eA7eyHXY86DzbnXK4+OB5gmOZFEbkF0CZmTnYmpo4wYwZ/npeJc3/FALg2o1dLZ0
        Tfbs3IDQBnwkv8IC0eCcJWQ7zQ4SUSk=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-f6_H-Cu0N4-_kLf7jM3Pqg-1; Thu, 20 Oct 2022 12:33:44 -0400
X-MC-Unique: f6_H-Cu0N4-_kLf7jM3Pqg-1
Received: by mail-io1-f72.google.com with SMTP id 5-20020a5d9c05000000b006a44709a638so17127201ioe.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 09:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PN9Zmo6gmcoTAvY3Ztc9ZICuuK1P6MwzJ+pG+ZS7pk=;
        b=kvYmAQUsfVVjIvo9peTxi8hwKaqm2AeUtlnkrrkpA8a9QLtYI75/cl7mpLAFd5m8KC
         UmsmUGLroZ2u/gZ4bLCzdf0gnYf6QuK6sCYkCcvZolk+xMTR0Twfma/BbHnt1ROyHFDZ
         sWqjhsgVZLqccdrKEBvzARIQ+Vd16g8S25FU8sYbUXfDuGHYIgHDHAkipjWEwCB0H+DW
         VSumKCzTLyiVbY4Zv01pngLZy49ACB4fXKD1L4a2VhhSpD6IDEs+g62p0g4UTJUdfRhH
         NSOT30LbjqCcwhWdAkWjJ4V8fo4iL7bbSRxIyBAM1LIeereR+X3y+HX9ySJYX1lZ4d1t
         CKPA==
X-Gm-Message-State: ACrzQf1pAUKN/eR8lHxJunDr8t9pfPkLE0SUrje+DCsD0WiXRv+7SG3c
        UYZ4r3mH7f0yVaW7s5otMXS6J5Q5nWiCeNdIivqBHsnSDHWi5lGEd4PPgdmDjjauchQh+dQCn39
        MGUacjUJ5H4CpG7yU8n33zPh/eg==
X-Received: by 2002:a05:6e02:1546:b0:2fd:1a72:8825 with SMTP id j6-20020a056e02154600b002fd1a728825mr10907263ilu.83.1666283623522;
        Thu, 20 Oct 2022 09:33:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7XHdv+alEzff5ONYljf0u9Vv1MKFPW6k4p9y5USRUJuL/pvytZkuf5ZoBiDEPgV8q09Ix6lw==
X-Received: by 2002:a05:6e02:1546:b0:2fd:1a72:8825 with SMTP id j6-20020a056e02154600b002fd1a728825mr10907245ilu.83.1666283623274;
        Thu, 20 Oct 2022 09:33:43 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id c4-20020a92cf44000000b002ff36cb0a62sm883868ilr.27.2022.10.20.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:33:42 -0700 (PDT)
Date:   Thu, 20 Oct 2022 12:33:40 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: qcom: Document additional
 sa8540p device
Message-ID: <Y1F4ZMAhHWRd9c3m@x1>
References: <20221020073036.16656-1-quic_ppareek@quicinc.com>
 <20221020073036.16656-2-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020073036.16656-2-quic_ppareek@quicinc.com>
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

On Thu, Oct 20, 2022 at 01:00:35PM +0530, Parikshit Pareek wrote:
> Add the qdrive3 ride device to the valid device compatibles found on the
> sa8540p platform.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

