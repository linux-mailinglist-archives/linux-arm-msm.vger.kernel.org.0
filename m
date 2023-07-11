Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5654574FB0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 00:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjGKWjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 18:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjGKWjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 18:39:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB81FE60
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 15:39:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fba74870abso9535066e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689115147; x=1691707147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0bn8rwIJ27GiGioGfo1byioWdbBdTl+i2BZlsOSFxk=;
        b=oqe+r0GguKOzk9SdLcGLtkzAWK44wdBNDH850OzjfBTeEpjFuuYb8nyigVZJEODyuG
         jsODqFEJUULdQqDaccq3k64GF9UhAfg7dytLCdno62UL/WL7wwk8xZ7ok4EmVDOTNM5C
         pb/6u96oyjNiBXEX0ACoyB9s3JwvUqn5xnj6KWUX5LgkH9zN+Wo7Z2ZwkDp04lrOlwGQ
         +hftQPg2hw8oGmIuyQoem2ashypkl2uNPX5XhORGEpuh/Es8r10wVN3ecwKzZt0TCPMa
         QItYuwHbSV2rrv4+UMQ3mZEvzPdYgCYzpfB/+WOUGJ8KXZdPFg5hgjSr+xhmel5EtfUP
         IFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689115147; x=1691707147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0bn8rwIJ27GiGioGfo1byioWdbBdTl+i2BZlsOSFxk=;
        b=dn4Rwr9mDNXS1NVU4tEPl03n4z937dAuD80A0FcTm4gQrqfqQL+VU5iYLPv9j9YWVr
         LwoCxaKbK6geLW4Grj0q5FdVk9v6rEnDUW2UYJy+smPYwHf9qWtLCedgbpBvr94ZvpSK
         jHtnEbxOVn/vHEHGEm/n7XeMBGF37O5s7jAmvx+DZjSIBibCe5VICdXv1TdvfveVbC8g
         5XRbe421CBFsCF++bxHRVO789Q6ZWraqyJnoPmyp5gmajY7+f6lIxj8VdQq8OIVFHPZx
         DmzqNgc0nk2piEUZSu5+Tuj9WUdJprpzHe3vN5GA37hbEaPwL7rFs+7mXCMqJTodbm88
         zweQ==
X-Gm-Message-State: ABy/qLYxW2h88a5rPKCSMgeVtGpSqKYC7NFraN1tD5QUjxtv0PZo5Nj6
        /dZ90BY0fBm3mvbsr5w2y2QbcQuJBv04Je6MwW0=
X-Google-Smtp-Source: APBJJlGKbiNBJNdCieqpqx2ESCXbMqLf0EQvxyZdBv07b1AeCFWbrat1ZnIw+t6HvTanUHdGD13aDw==
X-Received: by 2002:a19:e054:0:b0:4f8:7055:6f7e with SMTP id g20-20020a19e054000000b004f870556f7emr13511852lfj.44.1689115147257;
        Tue, 11 Jul 2023 15:39:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x14-20020a19f60e000000b004fbae60b970sm468143lfe.68.2023.07.11.15.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 15:39:06 -0700 (PDT)
Message-ID: <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
Date:   Wed, 12 Jul 2023 01:39:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2023 00:36, Konrad Dybcio wrote:
> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> [...]
> 
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				redriver_phy_con_ss: endpoint {
>> +					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>> +					data-lanes = <0 1 2 3>;
> That's USB+DP lines combined, or how does it work? I'm confused :/

4 generic purpose SS lanes, which can be purposed for USB or for DP.

> 
> Konrad
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				redriver_usb_con_sbu: endpoint {
>> +					remote-endpoint = <&pm8150b_typec_sbu_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &mdss {
>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>   };
>>   
>>   &usb_1_qmpphy_typec_mux_in {
>> -	remote-endpoint = <&pm8150b_typec_mux_out>;
>> +	remote-endpoint = <&redriver_phy_con_ss>;
>>   };
>>   
>>   &usb_2 {
>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>   			port@1 {
>>   				reg = <1>;
>>   				pm8150b_typec_mux_out: endpoint {
>> -					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>> +					remote-endpoint = <&redriver_usb_con_ss>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				pm8150b_typec_sbu_out: endpoint {
>> +					remote-endpoint = <&redriver_usb_con_sbu>;
>>   				};
>>   			};
>>   		};

-- 
With best wishes
Dmitry

