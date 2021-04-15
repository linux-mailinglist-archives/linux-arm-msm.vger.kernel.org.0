Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3B036124D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 20:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbhDOSr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 14:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234086AbhDOSrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 14:47:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E02DC061574;
        Thu, 15 Apr 2021 11:47:32 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id w23so22583950ejb.9;
        Thu, 15 Apr 2021 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LrdoSJYCGsUzby8AM8h5Z60zNCJMBo4mVvqNbEb5PnM=;
        b=CkV/9ZT9dXWGZgQGNmAQpYglzxx9K3n7nS2+ouWZnjVg23jw6iLFIkTcLDbyDQNChD
         HF8nGcUrrwH7n1WzdhD3mcx7ZSGlplzO9BV/0mQS/XB5fLFgJrbfrFlAYgjXIU89KX2Z
         urqsB/Mguwnzwr3NBub/VkMe+j/vkg3avWc1uhGjHaWOC7oDlZFUC2NdBQdIl61Ex+tQ
         0RSeFZnYbaiDLYJhgtQondlPtYHMJtAO+eIsv41B/yIl9e1TOwr6dSmWb8Qo8KEEj1iC
         RUwlPyqwFMnVUmx4i9ygpZdj0V1/9N1JCmhC4YIZ/UOAYX8dVzbZt83aJFVONeiBXgoL
         d0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LrdoSJYCGsUzby8AM8h5Z60zNCJMBo4mVvqNbEb5PnM=;
        b=hyHtNfBysRu84hVrq3l1inCRcZSAjmkvzkHlTKBBfm8PX55B6SVIvyU8sIJOPDeEb3
         Co9U6av5wBb5Np9xR9bGB9iYTpZt/PxEZnokosKz4cJfQt25XkkQ3ytaUpo4i8+rW7ii
         OtcfFio+Lav9SvT2m6YuwqPaMYRc7QowJ6383/D6q2IOsoqC1egA/nqv2kQ+XVUm6FM1
         JURcncZVCjHNzUu72+sqPa0siXYshPw16QfeQ2O6WCej+El3cVzvwaBXOQCD2Uq1i3Ry
         7FFZBGepANKz1yFmPZkeDRQ1s3GTzyg6/tE/TC9JP/FC7y4QsEswfAfNfUG8JfdzJja9
         9P0w==
X-Gm-Message-State: AOAM530nnyUKw4H1h+SfPuluIL3v6TvpeCDIe4OZYwQGPsgvc8NytSU5
        BB7daMokT9DiHuyabtVLcENFEkrA5slN0A==
X-Google-Smtp-Source: ABdhPJxY3kzeEn/gIiCftqbZM+6kWU1MG4paQCrQM5NS9vS9ub+1MgOiKfDhpn4ddkcAIeBt7Ltyzg==
X-Received: by 2002:a17:906:3295:: with SMTP id 21mr4859039ejw.88.1618512451037;
        Thu, 15 Apr 2021 11:47:31 -0700 (PDT)
Received: from [192.168.1.101] (abac128.neoplus.adsl.tpnet.pl. [83.6.166.128])
        by smtp.gmail.com with ESMTPSA id g22sm1473536ejz.46.2021.04.15.11.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 11:47:30 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] nexus: Fix gpio-reserved-ranges 85-88
To:     Petr Vorel <petr.vorel@gmail.com>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
References: <20210415173957.28533-1-petr.vorel@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Message-ID: <c55fc341-244f-9f77-4ba6-06f4ab7cd07b@gmail.com>
Date:   Thu, 15 Apr 2021 20:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415173957.28533-1-petr.vorel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

the patch title should be:

arm64: dts: qcom: angler: <blurb>

or

arm64: dts: qcom: msm8994-angler:

But that's a nit, that could probably be fixed when applying. Otherwise, if the device now works:

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad
