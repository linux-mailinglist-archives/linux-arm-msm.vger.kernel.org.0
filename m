Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89FC259FB72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 15:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbiHXNew (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 09:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233768AbiHXNew (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 09:34:52 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E13FC00
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 06:34:51 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id h24so20793324wrb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qO5tLUyEF/KGTEau/vX2lN6KFAvbRXPFG+IKJ10xeYU=;
        b=u5UyHt3a4tIXq9odT1ZTOHo5lVLE1bNgqPxEFFQwrV8jeRBDZLzjMYOBUlmqhymAfb
         5HaSXeesInaPogY5H5Uz1KtxN8UZ9PoJdQTKsJafKP+/1JPzUAxDg8Wyr4M0LBOHp1m4
         o1bYuIy/2YujFbUZXOabO8E5899bxV5RIQ3/+mmtDYXZ2/THMch46jtpoOKvv3d1qqWA
         LM7pOKVgEWkfnMQGotI8JBQ/Q0aBBYkqE5b5H1H6opZYGi8lZ3MmINLX8VARA108sTmP
         +CwVin+QsqaBz1+eM0gPVBaKn+1eOmy053hzrobuEMN3JFN914gXYSnsJ01C0fo6SuAE
         TmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qO5tLUyEF/KGTEau/vX2lN6KFAvbRXPFG+IKJ10xeYU=;
        b=UrwupLC/wZG7PwuKizafRXAs4t+oq7Faw0PlsuK8bGhBWAZAMu+VKkgJV9WmjxTo1H
         N3uy81M+t+b6PlUJFOg0y0kJCXEjgo6OJaxwUxKa2LUJWIyBoz/FMRFTSjMz61fOjHoX
         83NaDz5XxlTOgfOUM9x5YAeruBQKK02HgUzcwX4/Rg0U92RKjTSsDVYUOvckk94rFIcg
         AKzIEY/UvBQHk6dQE0X8AwFkdJe5b+1kUSd828spGcNZIYjuEs9P7CP+yyMNbRKLzfKz
         jPCKGOMmdGxP/yJqXQtXlYpnsyHmwfy6XkGSoX/dAYuCQSmV0gMvOHNLMRG9rjAict3g
         /ghg==
X-Gm-Message-State: ACgBeo1+qvW+roesWQ3ylepvWJCba1j64/HQ2BX0lhGHvBIeRohl0G+d
        ZvTKenv/zQEg1khdfjCMuIJiHD/gnIBu+g==
X-Google-Smtp-Source: AA6agR4O9nJztlqZORviDKxgA7/5Je3ZNXPoBXWSMI/lCk+efiU8T8yENSSMb0Rx1Yza6H0yDKvZqQ==
X-Received: by 2002:a5d:548c:0:b0:225:4f70:a7cc with SMTP id h12-20020a5d548c000000b002254f70a7ccmr10276983wrv.50.1661348089823;
        Wed, 24 Aug 2022 06:34:49 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003a32297598csm1922339wml.43.2022.08.24.06.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:34:49 -0700 (PDT)
Message-ID: <23b50db5-e0e3-700f-40b5-3efb25735dfc@linaro.org>
Date:   Wed, 24 Aug 2022 14:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Using CCI_I2C Driver for OV9282 on Qualcomm RB5 Vision Kit
Content-Language: en-US
To:     "halil.karabacak" <halil.karabacak@boun.edu.tr>
Cc:     Linux arm msm <linux-arm-msm@vger.kernel.org>
References: <e4bf306f4c275655f3fbe577f48fb616@boun.edu.tr>
 <916574e1-ed62-cf92-a0ba-e7baf1a3f85c@linaro.org>
 <1ecd2058040c8e087ab1e0c34d3aac2d@boun.edu.tr>
 <69bdc9d7b5556575bf38cc6adc100e4a@boun.edu.tr>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <69bdc9d7b5556575bf38cc6adc100e4a@boun.edu.tr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/08/2022 12:08, halil.karabacak wrote:
> After some trials and errors, I achieved something but, are these 
> resolutions in the attached file correct? And I could read nothing from 
> the camera right now.
> Regards,
> Halil

They don't look right.

Are you trying with the imx577 or the ov9282 ?
