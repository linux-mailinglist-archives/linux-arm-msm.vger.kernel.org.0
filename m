Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C625E578DD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 00:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbiGRW7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbiGRW7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:21 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0157B2F023
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:19 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-10d6cdf829aso254579fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6atdeqpTRf7cZa4d1Yxh7El3bgSgulLjp9cE9nTB/k=;
        b=Oc5g9E9Gk2r//WXCJSsGlwAOzYgPZtK7bresUOwH0y7JFnsEGTgAeOt9SsU2Cd2ZM3
         iIXFA+o2o7fmNaMlDZN7iunlZX+x+gNCJaskwYT7U5sOoA/r09t21yPe32Vqgid8EGjW
         lq7OTxhlR+BxJ1LuYWfLmL9Un7Od6G1z3KCIl5dXn2WV2w7ds7cEa3jY8SWthhH3Zmwj
         YAR7MynirecsqB9jFlKhTUwcBEozRyTb+ayKQ4o5A5uHIg39HxizVo60iZxFobg71zi8
         M/bSnY48libiu24k9Xh+9ILSVz1VrGgFV0tQy44BGoa2/HCBILdjs1K+NY96jSMYbEMa
         ammg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6atdeqpTRf7cZa4d1Yxh7El3bgSgulLjp9cE9nTB/k=;
        b=p/3WXj7C2DD8MqFhiIcQSUCtcxY/M9dbNxjC2IF72PKtHrTHNadeapsJ8VYhZvtqMT
         FSvKvp6EyRDB6Rfnoku9A0u74QqLRMmLjC3z2xlvPcqV5Bl1+A0RIgMb29IVoWbTNuKX
         A8Nl8tEa7LgRF6+i+wnyen7hrzejGR4Sk22HiYomLBDdjRXpIvBy3upWFpX76drgA3qo
         e9bWgnUoQtDK38YiRyy+CMMA6G+bS6UPEN9cPLobhZ8naLivwOLNL1MtXIeI5PyJmdhK
         H0BA73/AiBSWQDsbPHP+6jaFfypP+V899OQcJzuLl4Qz4SuAQ4dFT9t18VCsCmRIrsAw
         +iaQ==
X-Gm-Message-State: AJIora//RJUQzwq7Zyxyo2o/De5QCalVcBtTt/V/NYLshvSPXPXBqaCU
        E6Ltabm/2c/zXQtQYwIrMjLaeg==
X-Google-Smtp-Source: AGRyM1sfJepEUtV5EKxK3HZRsn0bP2byz3ZrkhPJc0Q3+R5eEMyHY7Lhelx0fG4PlG7En9RXi30Tlg==
X-Received: by 2002:a05:6870:c8a9:b0:f2:87f0:6707 with SMTP id er41-20020a056870c8a900b000f287f06707mr17930502oab.97.1658185158330;
        Mon, 18 Jul 2022 15:59:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, cgel.zte@gmail.com
Cc:     linux-kernel@vger.kernel.org, zealci@zte.com.cn,
        ran.jianping@zte.com.cn, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom: using pm_runtime_resume_and_get to simplify the code
Date:   Mon, 18 Jul 2022 17:59:03 -0500
Message-Id: <165817634385.1905814.12595339089376725198.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220428064545.3850057-1-ran.jianping@zte.com.cn>
References: <20220428064545.3850057-1-ran.jianping@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Apr 2022 06:45:45 +0000, cgel.zte@gmail.com wrote:
> From: ran jianping <ran.jianping@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: using pm_runtime_resume_and_get to simplify the code
      commit: f2ac69165dd78fb905187736e65b25151377ed89

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
