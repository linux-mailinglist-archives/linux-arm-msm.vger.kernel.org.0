Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E7A770A79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 23:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjHDVHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 17:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjHDVHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 17:07:35 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18571525B
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 14:06:55 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3178dd771ceso2213564f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1691183212; x=1691788012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mW+IUGJZLGAyo+vrP4rtHzBvssxHTXINctEBco4YkA=;
        b=wdhID+tT+S3ToorhCUUuSYwuY40lnKF8wME5h7Xf8JwPlJRSjMkvoW8TTWPq5tim97
         jQcJyg6dK5F97DOZsrnc5IWVdTqi0WLDjNyhtsPl2u4F5327vsltf/2R41zSkk+qyfsa
         zFIR+h29GNk38aLeLJM5Ak7KZsVFeYNqWhlpG4KawpXkG8fcZwGWxjdq0BnChvMOZBCO
         PcrUEkLUXH+zw25rjmL/Fyy2iFmpFo4nf3YlXMqza/C7ISUog348BLXG7xNarNGybSYO
         s2ul8N+JkJpJgyo9J5+ZVfQ6PwUwS/Lv5a0+oX26TIai2pPZ/fpycaJN3OPFSyEuhwy6
         xWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691183212; x=1691788012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mW+IUGJZLGAyo+vrP4rtHzBvssxHTXINctEBco4YkA=;
        b=AXEdJJZdPFytTcvwnVvzLpzvYQgtyWgx6n6T4pyruTDJhq38WNxXk4KNc59GtRhvjk
         4sPBtkXwpEamWZDNQ9COalqPzcgJrtVKZxS4gYqZCsItqoe6rk9ZQzVZEgKjcIqZXL6u
         Wd0voALkLRXoDLjBuKve42dneUb5mgIAqAnxnm9R8hRdGo1nV3pCQfl21egk0DheIGV+
         lzWNVoSIwgJVdtg6VbMQCm7sAtVtk+epnvi9Abp2w9wIw3SLqGb3PQsM0q3tJn8LOKxh
         tCda2qBroTny2rW1xeBiuTXUsX08YxQCqFqHk27nr/Q7ovdZBHlFBztasn2ZHuGuptZW
         J/ng==
X-Gm-Message-State: AOJu0YyGsQRC1zYweOh/6aQF7Xy6V+T3QHvYjoCqaTBia5C1zhLmdKGC
        ELG2/FzdmJBx+X+WwNL9qS0xSQ==
X-Google-Smtp-Source: AGHT+IE66er6x0W5J2S88GVvx6ltqiUKNwqw/V6MpF6v9N58vORvOgudZCfaTcZCD/6AzkP+Kkp4ew==
X-Received: by 2002:a5d:4d49:0:b0:317:6681:e42a with SMTP id a9-20020a5d4d49000000b003176681e42amr2079576wru.9.1691183210900;
        Fri, 04 Aug 2023 14:06:50 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q10-20020a7bce8a000000b003fe2120ad0bsm7591936wmj.41.2023.08.04.14.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 14:06:50 -0700 (PDT)
Message-ID: <9abd328b-e702-b6f7-7740-8cbaf3a0b866@nexus-software.ie>
Date:   Fri, 4 Aug 2023 22:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] media: platform: venus: Add optional LLCC path
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
 <20230731-topic-8280_venus-v1-4-8c8bbe1983a5@linaro.org>
 <78d2fd56-804d-827b-d074-b139cf62a498@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <78d2fd56-804d-827b-d074-b139cf62a498@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/08/2023 22:04, Bryan O'Donoghue wrote:
> you can get for llc_path == NULL

[sic] You can test.

---
bod
