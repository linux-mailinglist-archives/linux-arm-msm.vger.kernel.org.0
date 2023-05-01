Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC69D6F3333
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbjEAPxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbjEAPx2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:53:28 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891BFD3
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 08:53:25 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so15587585e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682956404; x=1685548404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Bga0vZzC4L79FRxacqWbNseyFQGyNhclCbouCWknrM=;
        b=fpJnPgcYxYiQ/yfJhzB6Sq6JHqsnCSHwcIGGmhoZfV2sjnc6h79lMbN4gTGk/aOel/
         QXHH6FyUYIC4kkA1UKubZeAtJtGVIJW0nDgeACM/MBpocwRzXP5EtW5VKKatICS3qrXn
         crDtbwW6TN0M94tGgQmMvjtTwgaGIw4/1VNPHKoZ3ULSKAC61WuhOZBptkWcrtIwvP0W
         kzplxPnCI+oNunia3FGUFtbgQoeJRbFJgjfs1KI48gUqjsXhDsSk8nsw0nEYH/gMkIWQ
         SkY8naSYyYcjafh79r8KPdiQG+kNT5aYlzWfmvDt6zwZNR8aOeAkixy2j+UOzLYaAv5u
         4viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682956404; x=1685548404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Bga0vZzC4L79FRxacqWbNseyFQGyNhclCbouCWknrM=;
        b=evRkNMqA6VuF+oklOIacQyMU1r9CeYSrpu9oxNMOGz+Gsl2PTBCqBKcLKku6JUtTpQ
         Ch1UuETxS/ArjAPa8BRIkUjzW1iOpNAwkW4IJSiDzGD1kvtCgSmDKYb1+2a7RsUNe1Hl
         sZRv6WVjztnDNIS2nlU58cuPDnRNQ3DZLGhfxFrrHe09Sxy3/qjat3h04FiyG4XrH3Of
         lPM8HcNQVUxsa98nyb3/n4Qrvfsfi5Uzs759mIlXfCSGKnEYiIL6Q6Q5L2ZdBpjcsSAC
         JArRAKubgjKUDOO0HUwM/wNOSED4RehaUk8kM0Qagz5ol87P34WCFt8nS8CQpg7yftRn
         kbXg==
X-Gm-Message-State: AC+VfDyRZvlRL/uhcMj6UJ9YaaqVeevJnwEdb/rNLOBW2eV7ZzOqPAW2
        dvWcKCbdxX6gHshx42Z4Y55SvQ==
X-Google-Smtp-Source: ACHHUZ4gZnNpSd7p8hok7HgSNi5vQ5xGkT/iONnUHoH0gTPsUFM3kLFCdLTUT0kiBscWZR6PHvdS7A==
X-Received: by 2002:a7b:ce8b:0:b0:3f1:6faa:d94c with SMTP id q11-20020a7bce8b000000b003f16faad94cmr10465153wmj.16.1682956404065;
        Mon, 01 May 2023 08:53:24 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x24-20020a1c7c18000000b003f183127434sm32899129wmc.30.2023.05.01.08.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 08:53:23 -0700 (PDT)
Message-ID: <bf5b4a43-192d-f1f7-253d-c60b884fe344@linaro.org>
Date:   Mon, 1 May 2023 16:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <ZE_Y5BvxiimB9mu8@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZE_Y5BvxiimB9mu8@Gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 16:21, Jianhua Lu wrote:
> This port node should be moved out to the block of pm8150b_typec rather than
> usb-c-connector. Otherwise,
> 
> [   10.998897] OF: graph: no port node found in /soc@0/spmi@c440000/pmic@2/typec@1500


Ports/endpoints should go in the connector.

Documentation/devicetree/bindings/connector/usb-connector.yaml

grep usb-c-connector arch/arm* -r

This dtsi should be updated

arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi != 
Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml

---
bod
