Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22ADA6F4238
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 13:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbjEBLDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 07:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbjEBLDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 07:03:12 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB9E3C19
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 04:03:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so21622715e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025389; x=1685617389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omwbtXCmGprdVyfpDAWlNQpT0MHCGGQZh74UI0S4H0s=;
        b=A/XF1ZlGoYFgyErtfy81ofhnigJwr8K1zvzSZ3axHXBmrOu7BsuQxXmM94AuYXGuE6
         ZF2MnjZ6R8d2F67omucqxoJ4Sbz1AuH+kRXvIPjyz8wSJVU+ZTwyGoVcpbOuZ8juaynz
         p4qT/IIQrTMZJ1HU2mO9hczi5cxVKeKduu9OXb2tX5CptyIe12BOgBmcLAXKlXoSflb1
         5AwSLkidXnfBe2NehdIabDM37yt0nztNC9hGujNogXpXxXXMxyYP8hlzroclpCxgPJbQ
         qIr0crM7KhkN3dlWI5zJRHwf3jvX2MuOPbmcADmS15qL6ny2+LM7JdHzko8jKeL/QgKl
         JBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025389; x=1685617389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omwbtXCmGprdVyfpDAWlNQpT0MHCGGQZh74UI0S4H0s=;
        b=Zn2ufG/P+wShqzXC7u4OkPSBbk227WqQUL9ev39Ylt+Y3AIdn5i/wQ+DemweDj9hjO
         1uj/4/yKrs1SGUXQuHoKQJ8bPymS82MKU7uAVNnS/BSFUGZzWInUN/8FNG0WFq1+BnBc
         jjP7tWBNgFvfZUeUjzpnt62VinpX0M95nkJbYonaFpmcygSrloOtSpaSXV25zxlG7PXa
         RwHGJnygh3UKseUNghbmLrrwdokT+Iz4xL79oOABbQ+sKsMS3kPY2J9KZXoNaxBuNSFh
         F5zTpAcR316W1oeZ680sk5BavWjJUdCxHassNX1699kFnj+Cp5+0P3xKNJ0D7I2FGTDk
         hHwQ==
X-Gm-Message-State: AC+VfDwrh4rPPG8Lunr9F14hircTLg1qCB0F2EPcMH1o2XnukBm7h7Cq
        vAnhy5BZglJLNDDm48eGNnjFcw==
X-Google-Smtp-Source: ACHHUZ7vDA6JxBmpj6Dic9Kq/hsRXtlWDtuyjDyKndSK/YCoOWRQ/quxBjO2e1CsWb5c6jAcX0b7jw==
X-Received: by 2002:a05:600c:2248:b0:3f2:5a60:a042 with SMTP id a8-20020a05600c224800b003f25a60a042mr11383968wmm.4.1683025389137;
        Tue, 02 May 2023 04:03:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c028e00b003f18b942338sm34858707wmk.3.2023.05.02.04.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:03:08 -0700 (PDT)
Message-ID: <b4bfe2f6-7ea3-fca5-9dc6-12270b3bbc42@linaro.org>
Date:   Tue, 2 May 2023 12:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 12:00, Konrad Dybcio wrote:
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				pm8150b_role_switch_out: endpoint {
> Similarly to the QMPPHY, the port definition can be moved to
> the common node in the SoC DTSI

But then the connector would have to be defined in the SoC dtsi and not 
all derivatives of SoC can be assumed to have a usb-c-connector.

grep "usb-c-connector" arch/arm64/boot/dts/qcom/*

---
bod
