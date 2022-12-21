Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C2C652C31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 06:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiLUFAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 00:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiLUFAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 00:00:06 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592557662
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 21:00:02 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id w20so7840232ply.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 21:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwfLQJbKmNJPm9ldJpkY347kvrmmfpxylI1je6aEUEE=;
        b=U63Cxfw9d3z2W/3ihXqmhM9V+87+GXttdUvAVF0LHbfI++qllMC2tmxrtbFbxg3Xl9
         FN4ne2Ood0xEzOSTDjhRvOhbidnft2xw3jJ6Ll2Ti3UYgOyu4pYsWbJ//6YdLwdiAKQ5
         T7MjUOHhoNRXnm7CTvTGbGzg/NydRJv5/F0JADLzINuZ3Ls+4CD7Pk4+jTWcLUL9Du0L
         DJtpdKHSxGt6ainp1GlsrndS9wjhbF0WeN9YxIGqD2XOOyUHCbdGVS5RG6e9xnzoaXd+
         i5INdRphOupZ6kMc2Ek4mDrRzqsawl/i4q0FsQY+hxLDqDfPh+XkdOqZEIQaHOIeuHjk
         W70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwfLQJbKmNJPm9ldJpkY347kvrmmfpxylI1je6aEUEE=;
        b=Vq4CPBWSrREWbEgN6eoF6fNO9WVRTfzcdPXZLLlKPuG3HOpdBw6f/1Hnl2oqQc8Bcy
         +lwKLv9wQuw1nnlqQhunXJrOA5UXZJKUQsNTBvSNiiZzL6BUzP6mDmi7JZ5WNNBBeO7y
         rADWBtf4eEd2KAFcKNz1NmRCVxa6dagtTHiD5b4bY4kicXxfyWj6h+fCJsgGNs6n8mDr
         Imyv9qv0Tfzp66/06WoSsFSjwRofqc1a+GkNtW1ds5oI7bf7DziMg///bLyfaxxqOcZ+
         eCx5NIJ7vFV7PhhFAgAPdcisaLjJ8XvsaUPSDEXHCI/hEbqTX93W+BNmjg9N8esy+cUc
         Jf8Q==
X-Gm-Message-State: AFqh2ko0y2QRIOIOHGAsalPMgXnlzNOC+g32jriB7PlycxICPhPb2NrF
        IG7ob1J5Xoid+29iw5UxJbbJoavpr+98RJuK
X-Google-Smtp-Source: AMrXdXuPMj4jYDtGtz6CTbYb/wf3GWo+PSpopRGEDxjngcztcxAIh7SEKJyKIlot/v0Z1taLINyqrQ==
X-Received: by 2002:a05:6a20:7d95:b0:b0:1051:30a0 with SMTP id v21-20020a056a207d9500b000b0105130a0mr1318183pzj.51.1671598801857;
        Tue, 20 Dec 2022 21:00:01 -0800 (PST)
Received: from localhost ([122.172.82.107])
        by smtp.gmail.com with ESMTPSA id fv17-20020a17090b0e9100b002086ac07041sm400674pjb.44.2022.12.20.21.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 21:00:01 -0800 (PST)
Date:   Wed, 21 Dec 2022 10:29:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: qcom-hw: Fix reading "reg" with
 address/size-cells != 2
Message-ID: <20221221045958.3iqvuprfpemximfa@vireshk-i7>
References: <20221220133910.240389-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220133910.240389-1-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-12-22, 14:39, Konrad Dybcio wrote:
> Commit 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during
> probe") assumed that every reg variable is 4*u32 wide (as most new qcom
> SoCs set #address- and #size-cells to <2>. That is not the case for all of
> them though. Check the cells values dynamically to ensure the proper
> region of the DTB is being read.
> 
> Fixes: 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v2:
> - remove the comment about 'i' reuse
> - call of_node_put() on exit

Applied. Thanks.

-- 
viresh
