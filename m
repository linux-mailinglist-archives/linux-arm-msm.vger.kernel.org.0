Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7243D7BF3EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 09:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442431AbjJJHS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 03:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442392AbjJJHSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 03:18:54 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B1099
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 00:18:52 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6c4bf619b57so3668012a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696922332; x=1697527132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G/H5Uei00H5lnTHEn39KuoKlWik04qglxKYmFTTrMss=;
        b=MnZQdouaSRORyJtri6lXNvd7NfMyakrmfKCrRLoc6TSMR0ruZDOCEHtQWoo7wbYHQX
         zd8W45AmlJYqcV31TnikVcYjhOfzEFl1AIxY402t6fWvH93+x7LcwG7Z7YGQOYpt14oH
         +Wfumsanj9MCExKdsTcoBmQL4t5o6jpbm9VaFthsxt+awkIJzDNW0cSgSy+nB2BsP4uu
         ca8MNnH6PbrXGYDYZyGQJ4Aq4ZpMrgnRtZbqYDU+TkRRWW2KaeFexzIgAdQBC91j9zMX
         d6pr2wW/HAjIGNA3Qpg0hbG90Pu7gtd9xKNclRd6CJJi0mvnaJD9UgVWkaIw+1a51Rh0
         Fj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696922332; x=1697527132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/H5Uei00H5lnTHEn39KuoKlWik04qglxKYmFTTrMss=;
        b=u+89+hezOayCxIsMe/FR2FttynDzO+e33+oAIxLlceuakGnMUUhDmGViffzSurquUU
         jP4y85N5lrBhjxSJrHJTvboUpAO3yYRoO7sCgAE/L4YyrbV7EqRNvnWmGKVtRVlwKzJs
         +BMXI3LKk57h2DbevZeqh2lhr2MXYj5U+3eA3W9wt3QxPRsocJel+D/a93IeICllW+Ed
         /oaJsuizlwRjo2MeoOGi72c1T4y9ZP0fxXenb6CQUL2y3P34pbdeTbAc5moyrh5PsDrV
         dsKniC8AWJkIAQMUjliAQE/CB556RM4hmKIM3IKNHrSRqGtq9KZfg5SPaiw6vH/SLk1a
         4WXw==
X-Gm-Message-State: AOJu0YzOB7OCxbL62ie4yJSBFYc9vZEHGOaL4EdS0SnyncAUzHR10Kyc
        +mvD49EA4ZNK9P6eauBDthBBlw==
X-Google-Smtp-Source: AGHT+IEhtrUxtRbN5WCWnsRVjWHE6wtGl+5FwvrFdGZ4NUX7o6bt2nhr7wRDu6eYB6DJGAyPXsmzfA==
X-Received: by 2002:a05:6358:7e07:b0:134:e301:2c21 with SMTP id o7-20020a0563587e0700b00134e3012c21mr17984444rwm.15.1696922331617;
        Tue, 10 Oct 2023 00:18:51 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id a9-20020aa78649000000b006900cb919b8sm7442509pfo.53.2023.10.10.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:18:50 -0700 (PDT)
Date:   Tue, 10 Oct 2023 12:48:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        konrad.dybcio@linaro.org
Cc:     Robert Marko <robimarko@gmail.com>, ilia.lin@kernel.org,
        vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, agross@kernel.org, andersson@kernel.org,
        rafael@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: opp: opp-v2-kryo-cpu: Document named
 opp-microvolt property
Message-ID: <20231010071848.x4v3272poag4od4d@vireshk-i7>
References: <20230930102218.229613-1-robimarko@gmail.com>
 <20230930102218.229613-2-robimarko@gmail.com>
 <CAA8EJpoTsHhAVT3b84BC7Brvh=AUOUYSB_Z+_R-9OQ-u9BpH8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoTsHhAVT3b84BC7Brvh=AUOUYSB_Z+_R-9OQ-u9BpH8A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-10-23, 22:07, Dmitry Baryshkov wrote:
> I suppose that simple 'true' schema should be enough since this is
> already mostly described in opp/opp-v2-base.yaml

Dmitry, Konrad,

Can you guys review the other patches in the series, since you are
also actively working on this driver ?

-- 
viresh
