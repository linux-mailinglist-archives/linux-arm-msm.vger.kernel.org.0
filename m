Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1783EC4628
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 05:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfJBD1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 23:27:02 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39940 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfJBD1B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 23:27:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id l3so17778921wru.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 20:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VEfYGW85vvrUCv+N5lPqOwc+RKtCHXFSlrSHy+YwRoU=;
        b=pnGG1LDQHpZjMbVDsicZiOG9LArvVM0h47Axu09LW+mK2hs3FN30BJpRl/fOVtM0Me
         oj6tYkr0ZZ6c08grW4lTSTyKbPmztQ6jbxQdl5dYo6WFbBV7O1LfmtAMTgMyR6+bqAUl
         LKL0OR5j3aIRPSzvWrH/DxbI5Ff52DOtmsgMWhaDaCeipmiWLAbyZGmauC49/qInmejA
         snONJLK0pLzK+lWpfcuPxF1Pd1JScN7Qn7G81PKzHLyh9wrHpg8D/82Liuzts6sPNMwF
         nM1i+kMd8p8FdKJkbX6XmDzjS5JDzpQxfLhbcLzfs+FZjueY4qZzYCA2eGvqX9xr99bH
         inSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VEfYGW85vvrUCv+N5lPqOwc+RKtCHXFSlrSHy+YwRoU=;
        b=eSFwBE2fiHvBQVgG7TDTDfS5TaQK2xquMkQ4uxFOvQhRzRCojj0uUic2IdZbSaTlDa
         RyUbvuFhxvMXYBDXufJjdtWpjxkIpR/ccoV4/YjeD+gFqFj/OIz2a9hOYZx2EJQZs21J
         XqvQwUXRHdXazHgZ3NNTF2F7j6rbph7T9uED52vC7IGXza4totVu6SkAna102qyiVgcU
         Jfa29xkBpUVCSWdIhGlBcsNhBgNRwGJ/g2tA+lrymB8pmqKUAHNzLEsk7PcXhSc8vSlB
         8ZZlUURYINCRdL4dZAtEnqSMHKD8hw3ycL8RPFwIxXfyvYLEAnepfnyy3r8uVB8QLwQx
         MeVA==
X-Gm-Message-State: APjAAAWXCJytseSL5papydvtSmLIjT8aiTDsOD0lIiQzCaDe5+pbt8lh
        4XzjfnoRifC/vnIXrreF9wjgaA==
X-Google-Smtp-Source: APXvYqyRaZXuvgJC5Gz1EURygqkxdaXs77Wn8KpRjv1avcf/0PcJHWUT/fPjY+we4Row0l1gRAhOPg==
X-Received: by 2002:adf:ec44:: with SMTP id w4mr673560wrn.251.1569986818756;
        Tue, 01 Oct 2019 20:26:58 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5419:a8ee:d7ec:ad97? ([2a01:e34:ed2f:f020:5419:a8ee:d7ec:ad97])
        by smtp.googlemail.com with ESMTPSA id z189sm7923468wmc.25.2019.10.01.20.26.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 20:26:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens-v1: Add support for MSM8956
 and MSM8976
To:     Amit Kucheria <amit.kucheria@linaro.org>, kholk11@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191001085707.8424-1-kholk11@gmail.com>
 <20191001085707.8424-2-kholk11@gmail.com>
 <CAP245DXyPraU_cL6PezSLL8sHP7-JQ6J-qtjqfV6eOxmhOb9pg@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f1881a4a-f8d4-ec64-972f-cbef506bef0c@linaro.org>
Date:   Wed, 2 Oct 2019 05:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAP245DXyPraU_cL6PezSLL8sHP7-JQ6J-qtjqfV6eOxmhOb9pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/10/2019 01:00, Amit Kucheria wrote:
> On Tue, Oct 1, 2019 at 2:27 PM <kholk11@gmail.com> wrote:
>>
>> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>>
>> Add support for reading calibrated value from thermistors in
>> MSM8956, MSM8976 and their APQ variants.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
>> ---

[ ... ]

>> -/* v1.x: qcs404,405 */
>> +static int calibrate_8976(struct tsens_priv *priv)
>> +{
>> +       int base0 = 0, base1 = 0, i;
>> +       u32 p1[11], p2[11];
>> +       int mode = 0, tmp = 0;
>> +       u32 *qfprom_cdata;
>> +
>> +       qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
>> +       if (IS_ERR(qfprom_cdata))
> 
> kfree(qfprom_data) here

(Assuming s/qfprom_data/qfprom_cdata/)

Where the allocation happen?

[ ... ]

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

