Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284C664B828
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 16:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235463AbiLMPNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 10:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235726AbiLMPNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 10:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8F155A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670944381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cai/kPU6Om0Z3mVznNAip1TeRWzCftfKM6SJg/6GxNA=;
        b=UCOYJlFoH8S0L7zO+HVu9KmOSSE/+lPBOosJ96eaS1s2/3TVT35zm7FGpjLZxDvGlUV1ij
        VvLYT6BPsJgSa4fKLso+7Jam5BoXw8Q7eQ+Se5ctdstXDJ15iFK4ZJ5ibeRtSPZ9PeScdK
        742Df42orflv48B/X5cWF7Xw9J6aZgQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-FTwvLP_XP4qGzF4Mi7jolg-1; Tue, 13 Dec 2022 10:13:00 -0500
X-MC-Unique: FTwvLP_XP4qGzF4Mi7jolg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-360b9418f64so169743057b3.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 07:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cai/kPU6Om0Z3mVznNAip1TeRWzCftfKM6SJg/6GxNA=;
        b=PQAbhxGDdkcKNa/sD5it2lqc5IXbx2VPlWG1zPa5YeiKKAnEbPhZw0WoMAYP6M9rlT
         uJM34wsAp5fg0cU39zXd9BDvZnkL8Eza7enAOk8lZ95k0nay4dpBQEcgC0bldCmy7hxp
         MPwlNzPJODH62sTK5GqWEHD3JirIEo71lcnzh8lHZVuEPVhVZnlNSWhTZ8zoohQza7IT
         1K8AIXcI/AbbYj1jl5Z9LhGjd8dQMOE7abq9TgOtt+phoIOavbiMvNUv8Wi/cdTPUb4f
         7gMNQZQh6dnt/vSf/xktju//OW1hoeMZF6WGxpRVdjWeVEQvpdF+4lKPWKdk27cn4Pm0
         I1Nw==
X-Gm-Message-State: ANoB5pl9VOLwXjdO60/JpRFWMJNDy45lAxYFnv25jH1MkhnPYDAPU0jV
        sYdtvRyYJHEPCYt0jAnJZpWrMuLGUzgD5dQE9Z78yfBJ4gdBniQt5jRvkB8h5uWDSvBkSf8Ec4K
        O1qSTl9D3P1zyEkYTqsw6OPeEfw==
X-Received: by 2002:a05:7500:5282:b0:eb:1a6a:f948 with SMTP id x2-20020a057500528200b000eb1a6af948mr873502gaa.64.1670944379841;
        Tue, 13 Dec 2022 07:12:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5NzRdu025y2d4748W73kp+EyLMKIiqfTuukd8+EaVyn+tsGlN9uJXSm8luhzEZD8YdS96gmQ==
X-Received: by 2002:a05:7500:5282:b0:eb:1a6a:f948 with SMTP id x2-20020a057500528200b000eb1a6af948mr873472gaa.64.1670944379479;
        Tue, 13 Dec 2022 07:12:59 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id bm18-20020a05620a199200b006ff8c632259sm5657149qkb.42.2022.12.13.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 07:12:58 -0800 (PST)
Date:   Tue, 13 Dec 2022 10:12:57 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc8280xp: rename i2c5 to i2c21
Message-ID: <Y5iWeTk2zOp9rInx@x1>
References: <20221212182314.1902632-1-bmasney@redhat.com>
 <20221212182314.1902632-2-bmasney@redhat.com>
 <Y5iSDehp72mQPc+h@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5iSDehp72mQPc+h@hovoldconsulting.com>
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

On Tue, Dec 13, 2022 at 03:54:05PM +0100, Johan Hovold wrote:
> Note that the node is labelled qup2_i2c5 and not qup_i2c5.
> 
> That is, the QUP nodes are labelled using two indices, and specifically
> 
> 	qup2_i2c5
> 
> would be another name for
> 
> 	qup_i2c21
> 
> if we'd been using such a flat naming scheme (there are 8 engines per
> QUP).
> 
> So there's nothing wrong with how these nodes are currently named, but
> mixing the two scheme as you are suggesting would not be correct.

Hi Johan,

What would I use for the name in the aliases section? Right now I have:

    aliases {
        i2c18 = &qup2_i2c18;
    }

So qup2_i2c18 becomes qup2_i2c2. Would I use the flat naming scheme for
the alias like so?

    aliases {
        i2c18 = &qup2_i2c2;
    }

Brian

