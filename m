Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD1E1C548D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 13:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEELkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 07:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728727AbgEELkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 07:40:55 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD141C061A10
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 04:40:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k1so2357160wrx.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zw8AGAHFXGrv2iacmWJVrfWvZyG12y22YZaRvl3DEfA=;
        b=PbRweIMky5ZkEGXsQqcS5VVBKvjdLKoF8NN6LUtUo0feNkVWNzQuUOP5PfSeNqV7gT
         kbvVbm8O+vdW5duJm/STuZRMkIMNbwmfX2jKC+yDQzEuoQJ4BUC2IG98/RQmxlTJeo2r
         fPHppnLpZ6vuzLtSAqWylv3JHkvCuRMmQfevQDwjFf0AZTVy+9HXcYDhNTx2ujb8G6r5
         H6Im1v94r3puCJFVDfWkYbQHn1SwK9bZzaTWZgun5/zYcI1qw/fPeQmHFuOlRAI7VMQ2
         sD0JBD/IaldKNgfmuS1Qzbo5inQpZakELaG9LsLWYPKN9Eaa6uA4QTbwIEF1HSmA5wUG
         tQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zw8AGAHFXGrv2iacmWJVrfWvZyG12y22YZaRvl3DEfA=;
        b=H9fVthI03H5TtbcxfJLrLtYVA3dq/eFvKCYnO6YKuP2iEivfejMQWITjWdMOAJ98Fq
         JWYJGs0jInsQcyzZJ9Tt+ksp64vnk/A1NAUaH3V85G9b7RL7ESQrBjlhPaO4QaP1kIRS
         1ABj/8z0VmdmXDk6eKafqtoq8ZeO46rXFj0N0eoy1sZq7+c1DzT7uUDlHcLFIolzX9iq
         qLgKyJJ35IpLi+cOkNf+aQaX4f/2Lp11TsPO19Th8BSROdvNVut/UjCVfeUnDSNk57tw
         x89PUK9Qp6YpGN7UI19pSoQio8FZhvGzDnjqTIT5WUU4fZZrWPFdu1P5zQvPnaUkU2SH
         pN6w==
X-Gm-Message-State: AGi0PuZJ8O6Cy0loQT+91tFUecbroBmTkvWAPcHDi08bNk4FoVVAvrU+
        TISwb2de6hyeWsZq+ITmD6hu8Q==
X-Google-Smtp-Source: APiQypI0HqhUGc3uoEMdVOIh5K+2MJBbCn7ght4cbnf28YDmBZyywJZ1Sw8z06C+sb1meRqW7pVeXg==
X-Received: by 2002:a5d:4092:: with SMTP id o18mr3239554wrp.227.1588678853373;
        Tue, 05 May 2020 04:40:53 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
        by smtp.googlemail.com with ESMTPSA id e2sm2729863wrv.89.2020.05.05.04.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 04:40:52 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add support for venus on msm8939
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200501203505.144362-1-konradybcio@gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <1bd1e0ea-0be3-340c-9c2a-0e7a03017cc4@linaro.org>
Date:   Tue, 5 May 2020 14:40:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501203505.144362-1-konradybcio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

Thanks for the patches!

Could you describe hear what is the status of the new added SoC. Is
Venus driver tested on this new platform or that will happen at some
later point in time.

Also, in both patches the description is missing, please add something.

On 5/1/20 11:35 PM, Konrad Dybcio wrote:
> Konrad Dybcio (2):
>   media: venus: Add support for MSM8939
>   dt-bindings: media: Document MSM8939 Venus
> 
>  .../bindings/media/qcom,msm8939-venus.yaml    | 119 ++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.c      |  33 +++++
>  2 files changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
> 

-- 
regards,
Stan
