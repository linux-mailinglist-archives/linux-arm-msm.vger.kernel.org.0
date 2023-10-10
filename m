Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2415A7C4387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 00:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjJJWNC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 18:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjJJWNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 18:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E548F
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696975936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VxGOsMb6ryGnf8nRVtqUgdAtUsuDGvs7hUXEJUtIxPg=;
        b=BTWUVJXfuCIHGKWR4Hg6roE+eDV5QcBmQGp70hMauzAQIfoPfguCrqRzW7d/9U/dCxj3yZ
        CtooHeLGLKI7VQpPpOEmlmks2cxqDarcZrKEP1khcieVYyy9g+nTDm6m4CKuNwG+02TfX4
        RRxhqIyHKzBWzlMApAcNE0OgGJsLn38=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-WHR91XwzNNubiALQpSPyZw-1; Tue, 10 Oct 2023 18:12:15 -0400
X-MC-Unique: WHR91XwzNNubiALQpSPyZw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77574c4394aso705427285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696975934; x=1697580734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxGOsMb6ryGnf8nRVtqUgdAtUsuDGvs7hUXEJUtIxPg=;
        b=oSJpOncg7jOmZtaG0PSvchCQEbjCrLTy56G38MGGcd+Gkp3ETcZK55/DlAVZS/zD/C
         ovZHI7BO/AKSVYUgopjxpVpzWZA0rQulH23H0l6OcT9XSuQHpWGUzjinK2JYyT+Bw2sa
         nOeKOerSe7b0moORjODZ6HErXJbD8IH6m4dlGQVqhrWLv0z7jzLwULf3VYOjy/nU3Xjp
         LDlmX9BMk+20aVLFs78XVJpqGrDXydsmHpt51BqxzYr/rinBTm+NNop0hNrNVT8RlQMg
         /mhTpSsdIEDcOwgOoSxDq+b8iv6awNxysrWg4kGIkf7BEiVcBvjGdPyojALf9ZcbHc//
         BReA==
X-Gm-Message-State: AOJu0YxEfXF4OSKsq3Fwr0MEqqIDnoWtvzeL7UB70D28PEkCo9VN80bl
        3kL8osVB6qplWTpbOWzOccUClxqps206TWYclcZMA+oljv50CeuhGmKaFPR7ftnk3gUDMpbYFt/
        NZTiTTk6QEdAoqBeYV8fQPocT9lWSvohvMw==
X-Received: by 2002:a05:620a:e01:b0:773:c0d7:4ecc with SMTP id y1-20020a05620a0e0100b00773c0d74eccmr16106790qkm.12.1696975934392;
        Tue, 10 Oct 2023 15:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx3Q0pFOTvEqLEF5LA5/OC1U4CBtpte95Fz5l0s7Hjqf6VQUS4hY/JZn6yPYgclE8vUDU7sQ==
X-Received: by 2002:a05:620a:e01:b0:773:c0d7:4ecc with SMTP id y1-20020a05620a0e0100b00773c0d74eccmr16106775qkm.12.1696975934135;
        Tue, 10 Oct 2023 15:12:14 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id g6-20020ae9e106000000b00770f2a690a8sm4638297qkm.53.2023.10.10.15.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:12:13 -0700 (PDT)
Date:   Tue, 10 Oct 2023 17:12:00 -0500
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
Subject: Re: [PATCH v3 06/15] firmware: qcom: scm: smc: switch to using the
 SCM allocator
Message-ID: <fzf4cpcir4zvb7cbxeqjkvtkyt3gnbbgabp756xadr3ujn3ppx@ukgztdbzdfea>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-7-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:18PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We need to allocate, map and pass a buffer to the trustzone if we have
> more than 4 arguments for a given SCM calls. Let's use the new TrustZone
> allocator for that memory and shrink the code in process.
> 
> As this code lives in a different compilation unit than the rest of the
> SCM code, we need to provide a helper in the form of
> qcom_scm_get_tzmem_pool() that allows the SMC low-level routines to
> access the SCM memory pool.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

