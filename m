Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE627AA429
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 00:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjIUWCF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 18:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjIUWBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 18:01:53 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E573BE35
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 11:18:01 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40472c3faadso13849455e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 11:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695320279; x=1695925079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7gFQeovCOqyG+Vt42B/k9KqcPKnAtH77aTFoPbh9E0=;
        b=LcDXklsnvQKK9OShLmv5Eq+mI0QJJDzVsZEAvjQf8h73Q/Co/l0uEvX4vQlxFXzbxT
         xl05J6dyLn11Y8K2pGlN3pFl+Zq1HhqR2gBhnJnyUlXqg67izQZE6hEkazIqxC/NLSh/
         5Y2bu8fEZzd8Ggp1K9gqrZulUiDv46MHD3EPmscXCCy2Al3M3yiorhrplp3U14hJ0VfG
         GWiGlLhqE2ISTYtsTpo4Lccuhf4qZekEcMuOLPTj2md8PKDt8E+Fc7QaA3UNCg8wiodB
         qaS2DvV3K6b2IcESoEDSu2SZcBa9tDDDFV32a1n8u2U+sWgMHJoS4DgVGIf8Xc1vylsA
         nNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695320279; x=1695925079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7gFQeovCOqyG+Vt42B/k9KqcPKnAtH77aTFoPbh9E0=;
        b=f6ulyItHyg9detpfBZ73JYCB3nOCNc13qWu3vyRcUQ9FivvJ+Ky4R7lLfxDe7ZkgCv
         VHMn5BHssmk6pP1j/4nVz3RjtloJJ3to6STO16GfiyPWggnWeXbm+okr7W1Lo/sVzYcN
         9Be9YOV9tJ+BQW6hMjDCph1NWknqT6g1khQH2eBDxRc3PqHNRZqTFIinsflbek72ztJh
         7hjSFrZvEgrOQsbWNGcjddQmSd80n0RhjiCiNqD4cWmUtfoBXbCyvpsnRMeW311TAapk
         6x7+GRfTY8GrMtVUbBEb1znTiEdAFF0cIQdFj7/iaC2xl+sDHSvYWNfd/7bID9ea222Y
         swRg==
X-Gm-Message-State: AOJu0YzI484qNa1iMpyBK/mzK8mtldTTAqZkNbhL+yOepLoeqoY7q2vv
        ISzmX2pdXAGqjBCmQgAhp8RF1/TyUHOr3hyldLxng3bY
X-Google-Smtp-Source: AGHT+IHjIQkVJQybbyYx/PL2aE6OMJIhMwgKGQdYG4h1ptw97QpAlXlx1ORnozqq/yIgm5Zhfz1miQ==
X-Received: by 2002:a17:906:704d:b0:9a1:c42e:5e5e with SMTP id r13-20020a170906704d00b009a1c42e5e5emr3859123ejj.42.1695281319261;
        Thu, 21 Sep 2023 00:28:39 -0700 (PDT)
Received: from [172.20.15.189] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id a24-20020a170906245800b0098963eb0c3dsm616369ejb.26.2023.09.21.00.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:28:38 -0700 (PDT)
Message-ID: <2ec21b71-bfdc-885f-827a-eca7b70f2728@linaro.org>
Date:   Thu, 21 Sep 2023 09:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/3] soc: qcom: rmtfs: Support discarding guard pages
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230920-rmtfs-mem-guard-pages-v3-0-305b37219b78@quicinc.com>
 <20230920-rmtfs-mem-guard-pages-v3-2-305b37219b78@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230920-rmtfs-mem-guard-pages-v3-2-305b37219b78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/21/23 04:37, Bjorn Andersson wrote:
> In some configurations, the exact placement of the rmtfs shared memory
> region isn't so strict. The DeviceTree author can then choose to use the
> "size" property and rely on the OS for placement (in combination with
> "alloc-ranges", if desired).
> 
> But on some platforms the rmtfs memory region may not be allocated
> adjacent to regions allocated by other clients. Add support for
> discarding the first and last 4k block in the region, if
> qcom,use-guard-pages is specified in DeviceTree.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
I don't want to block this anymore, but I guess I should ask
the question whether it would be valuable to add a common
reserved-memory property for e.g. low-padding and high-padding

Have we seen cases of that outside rmtfs?

Konrad
