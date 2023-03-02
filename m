Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DA76A8B7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 23:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCBWGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 17:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjCBWGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 17:06:46 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409E265AA
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 14:06:45 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id e11so249235ioe.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 14:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hKjpuFR3iRCin5nJ/ge/tzKffSShcSbKBCteHpDjHE=;
        b=GSCeTBnMjs9tFbJX0yGU+tkNmVzaplxgAMtHWPe5SvzBNTTr7DsJTz/dOGE5ui8z6B
         QVcknIh0zPyFxVtrvmclYewhA/yL9UIrsMDwT8NnEqg5HNAfz4t00il+6dgPTzseQlTi
         Hnezqhrtd0D8IHt45NUGWDwF0+OBY8tu002C8p2F3hkDgC3GZQJln9T2Kq9MkV3ruWYD
         YIDXk+X6ZB1mNicEvCCjAJuVoony3N3hat51vf6o0VWwlFxY+Fyd5GQdp1KexbRkaBqW
         02jlisy0xIsDFr6zWMGicbiwqGsp4WSr+GPoh0CruFUopm/2W4oQXz8gTMz5vH9KsY07
         znyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hKjpuFR3iRCin5nJ/ge/tzKffSShcSbKBCteHpDjHE=;
        b=cG9IXGwTsjxD8uS+e9/kxphdTxAGkJWZm+uAX2l6N2HrxNBJjzqlvWzCJWHDGoLonb
         97+I+Cuagoixab+H03GSf3FVHsJuX0OOnd4/eNt5vusKgsz0LU6e7/cpdUF4r+5bG6z+
         yCde0mvgjZ8+F7itDzMTR1kUrpGmxMVrxH9Igd3MN6drZZen7VXGbYim2MtntcvjGPZ9
         k62FEGBW/QQ+1ne7yjfeype6LOP+7FulpLdG/jTbxJVhOLyHQGcEr6j2lnHRjlRLqmaz
         swIEV3bOTrRhpaDcM14Gs61ym/kUsitwD5TBTpLANRviQrExvZWI8LwUcWHpeKXqVH7Y
         ttQg==
X-Gm-Message-State: AO0yUKX9f7k8NUeTF41y7OQOIok7qW+KRpk0iVF1QCFRzw11zYIs7P9z
        kEfpe6J1/vDVgREo8Qf58hZkfeJxb6hgz9zw
X-Google-Smtp-Source: AK7set+mTm4NPHyROYJg48O0RxzUHoTIPQZgUVA9bEcd/SQWBLPAHOa77XgKIhyauj8Zm3UJDl6w5g==
X-Received: by 2002:a17:902:e542:b0:19c:b7a9:d4a4 with SMTP id n2-20020a170902e54200b0019cb7a9d4a4mr14082873plf.37.1677794258858;
        Thu, 02 Mar 2023 13:57:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f233:886c:8482:e0ce])
        by smtp.gmail.com with ESMTPSA id kn13-20020a170903078d00b00189e7cb8b89sm151118plb.127.2023.03.02.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:57:38 -0800 (PST)
Date:   Thu, 2 Mar 2023 14:57:35 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, corbet@lwn.net,
        quic_visr@quicinc.com
Subject: Re: [PATCH v5 0/2] Update section header name check
Message-ID: <20230302215735.GA1401708@p14s>
References: <20230223150559.2429562-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223150559.2429562-1-quic_mohs@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 23, 2023 at 08:35:57PM +0530, Mohammad Rafi Shaik wrote:
> Update section header name check and corresponding documentation.
> Changes since v4:
>     -- Rephrase commit message.

Asked for clarifications on V4 that were never given to me.  This patchset will
not move forward until those have been resolved.

> Changes since v3:
>     -- Rephrase commit message.
> Changes since v2:
>     -- Update the commit message with example.
>     -- Update the documentation text appropriately.
> Changes since v1:
>     -- Update the commit message.
>     -- Use strstarts instead of strstr.
>     -- Update documentation file.
> 
> Srinivasa Rao Mandadapu (2):
>   remoteproc: elf_loader: Update resource table name check
>   docs: remoteproc: Update section header name requirement
> 
>  Documentation/staging/remoteproc.rst       | 5 ++++-
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> -- 
> 2.25.1
> 
