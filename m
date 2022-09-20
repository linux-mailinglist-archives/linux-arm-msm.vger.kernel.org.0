Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659925BEA2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiITP12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiITP11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:27:27 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83C266117
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:27:25 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l12so3419660ljg.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8zIFK9Q1jJEQ4xwVOoH9zFIXhEFnzDoTOBCTZbUj4wQ=;
        b=W6vecheQBiXDJef24g/gY6jrzyKlfCEoqbFW+0stPdJTDL3fjrZFRs/T1tbZFdRCqo
         QbWW2oD7FN93E5H9bPWXQD8kpdNrHef9qYwx+ZWoBZw/3mq+BssIRXyCGkGg36aysJY8
         SqMqvi/ucmqaU0AZDl0drC1VlpfVBF0Ah54zrUEeiqmBnCnULimWkL44l2uKSRovIZP7
         Nx+gMZBk77N1uHH9Gz3mDFKA6J1fYEpubS8CDhF9VRp/7n0esj52ELIGo7q3enJnXLqt
         vITxzFOGyoFoOSLYhbXNrgdTa2Bhk1aNciHHvMX3EUkEeE5FfUiVxmpX/XZgnRMOU4q0
         QsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8zIFK9Q1jJEQ4xwVOoH9zFIXhEFnzDoTOBCTZbUj4wQ=;
        b=Q5XKvDud/DxqVrTeklzBFjY/YPxV8ajPfZsPORoTKgaQUdrXCPMF16aSClY1aCYP5W
         xF4UDSo0OLH7ikAP4T4+OIgiEPpE5wwKU73S82/hxyMK3XYL1yBH9IOELeVYKzNmGhqm
         9SX/w1Yj+hgvLU88FJ6vcPSXOsNH+esxR+anmDWeJMKT/UZo5dxNx85UOZkhET1jNWWt
         qsh3FKuJ/I4z94f5kEPPXO+ra4fSeUAX1Hpe1ArPrvjq0OtaYbbavDyYncyq2GuDTfrh
         7VPJ8LubsbjAWKVt/2QGHcIHkNS3Hg8PkDyGWUOcLHMkCeCsEDwO86RNlFiXrwq9wYMS
         j+Ag==
X-Gm-Message-State: ACrzQf2JRrwVgLRHmUhTTsMtBK/W374W/8EKUpLQeWDt5i+J3BMwZDvT
        w40KxDNXqogEcD6/GjRatWat5w==
X-Google-Smtp-Source: AMsMyM5iVKbLJLBy7lQhYAZb0NIVZgJde7kEmIUUdPuFRKx6SUN9n36NJKc/g4L+GUHFrKr5CkUCBQ==
X-Received: by 2002:a2e:8e78:0:b0:26b:fa73:914f with SMTP id t24-20020a2e8e78000000b0026bfa73914fmr7266006ljk.57.1663687644297;
        Tue, 20 Sep 2022 08:27:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d1-20020a056512368100b00494643db68bsm16351lfs.78.2022.09.20.08.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:27:23 -0700 (PDT)
Message-ID: <9ede64e5-0af4-2103-7a3f-4484d9bffb5e@linaro.org>
Date:   Tue, 20 Sep 2022 17:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: introduce sa8540p-ride dts
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20220920120802.14321-1-quic_ppareek@quicinc.com>
 <20220920120802.14321-4-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920120802.14321-4-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 14:08, Parikshit Pareek wrote:
> Create new dts file specific for Qdrive board based on sa8540p chipset.
> Introduce common dtsi file sa8295p-adp.dtsi, to be included for adp and
> Qdrive board.
> 
> This is quite similar to sa8295 ADP development board. Main differences
> are related to connectors, and interface cards, like USB external ports,
> ethernet-switch, and PCIe switch etc.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Reported-by: Shazad Hussain <quic_shazhuss@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
