Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACDA7C04E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 21:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343606AbjJJTpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 15:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343562AbjJJTpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 15:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0948694
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696967079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EZfQkL4IWwhQ8xY3yigkIDilLMVJu2obBuH4/ldBDck=;
        b=Ny5z5ySmNXeUvra0G59k6x8WCHodo9uhYLwnkTEuUB+1edj0JQqb+N80N0iEWUGBRcTATZ
        sTHCIEpb8xB+wq7BDwwYpRiNuMAH3FtzWNBq3rAnym/6nWA359DUgMTeZS67ZnOD+d1HUv
        xzD3P/V8ayCmm3PudGk/GHW4ox+3LMs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-bO5dHewrPT-kWx1Qs-7wjQ-1; Tue, 10 Oct 2023 15:44:36 -0400
X-MC-Unique: bO5dHewrPT-kWx1Qs-7wjQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41983f5baccso70659961cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 12:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696967076; x=1697571876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZfQkL4IWwhQ8xY3yigkIDilLMVJu2obBuH4/ldBDck=;
        b=xKOpFhOZMvs4+9GUe+VDiSubFpER1LU0ga1K7Fvah7h7l+GNo9xR1VOnTLewZqNYsk
         BB+nX1CRs6s4j6eZiB8NbO3ga51hgLmrKXjVs6uPohp/SIGXUARhtlLoaQNUhAY+G/by
         7rrfQE3a1fP0VSUtUVwObD4b5H9lcBKB9Di7TL7TuzQy0WRVttO4wPQj1pfNJORRTwjS
         PQki2VCILc2gK4IhwJQnenRzsPDi94ORqjkvGxQupqI3pbD917WMVwBDmtNHW+Jcptju
         Q4xsRz7kGrdcyKO7QhDFfjnqNLrAN1y5CcbcVM3/ymR8dK9efOR3cwgRh7ge71lfqW6I
         KpIw==
X-Gm-Message-State: AOJu0Yz5/yhtuKEnUIuksgy3IjfnDxKldYO5gcXODkR0qeyElOOMh4Qx
        93NMTCF1OOBalubIptf/WmsEt15Jc+Alt7WnLbC5eM7o8S0pQdBS/pKX3XQW43/S7fsfG5k0JoX
        tm0gWefiMbhuJ95GFf0yLt1h6Gw==
X-Received: by 2002:a05:6214:451a:b0:65b:2b67:13c4 with SMTP id oo26-20020a056214451a00b0065b2b6713c4mr19366285qvb.61.1696967076352;
        Tue, 10 Oct 2023 12:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtVvyUJqsVfAztpy9YNYjWSO4sXIkpkPEA5qq+iNH3IdlP6z1BG6r1wxZvkbQYTlse5fZ81A==
X-Received: by 2002:a05:6214:451a:b0:65b:2b67:13c4 with SMTP id oo26-20020a056214451a00b0065b2b6713c4mr19366259qvb.61.1696967076072;
        Tue, 10 Oct 2023 12:44:36 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id u21-20020a0cb415000000b0065b0771f2edsm5078331qve.136.2023.10.10.12.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 12:44:35 -0700 (PDT)
Date:   Tue, 10 Oct 2023 14:44:33 -0500
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
Subject: Re: [PATCH v3 02/15] firmware: qcom: scm: add a missing forward
 declaration for struct device
Message-ID: <ldhnuua6jayqf4nflodpxoxz3u3t746c5egojnc4cw2uk744at@zrtaeeou7byv>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We reference struct device in the private scm header but we neither
> include linux/device.h nor forward declare it. Fix it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

