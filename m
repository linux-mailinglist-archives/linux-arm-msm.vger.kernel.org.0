Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51886C5876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 22:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjCVVIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 17:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjCVVII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 17:08:08 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C92244B8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 14:08:03 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id o14so9117545ioa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679519282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NMs74zzuCtt5E+o+ysqW2tmIIs5ug4dARg5jHam9G0=;
        b=NEfTegf9MNjv8z9211rRLvibighkYaTUQZyTA/djbicnxJjPEp4Y0VAgeIOGnJs+Kz
         hlY0eEYwAQoEN6oD/a8WDhIFcdW9OaQ9TQd31udqQDfaIKgvbQGpAuHXCe9gmQo9xL4n
         6wUNapeMfW/A2S79JUY9v32wx5296n6JJOjSdGjIp+nl1WfOO+uFbryqRtQ3DL79BLEA
         Q9aB94r++4EXz6K4IeS4JN9SzTkhSEbF9o95BAE4wx3hIFVkmMwJ8NQUR8SyJ+nn0VFc
         757uWDuSsbArvxnfMoYZwucnObeP4lxcvHCkC46KNtEY2KvXeIb+/1sR7qATHE4hLSle
         7+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679519282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NMs74zzuCtt5E+o+ysqW2tmIIs5ug4dARg5jHam9G0=;
        b=vwrHQpgRoCFOp6wf4taxFLAKqrWKDmuSvp5bPE3uEH+eYUJRTjhkEeV7XUQlCuxqBN
         7wVhyuQqW4lhpG7djmXMxgO+VKTUeHHMMTZi9wFdJcmC3DHXub6hF0WCl34jePj3Z0I4
         zzZGpA9tVr2fVu4XmP3Zm9noroUBm8+CJjUpPQTsahiCCNkghvyI7FtJIFoHnifAKsP1
         YJz0KYWLrzc2yC13bze+hJuV1Qg0/BlL/2qIaomaBomh9uZxrAXrh6ljvtqDBYk5EO9h
         KWT1ti2N0ktCtj5PztEkAP1wYw5HfQdYcDqCfgsBdvftKbxg2iO4scgXz7X9bh6jNO4/
         ODBw==
X-Gm-Message-State: AO0yUKVBPZsva6MoaqL30Pyx3cKdPG5YXUaYRfFoQRVWzqnnHIdJxedT
        BEWt24ylV+5cRDP1fwQSZzZVjA==
X-Google-Smtp-Source: AK7set+Mlgw7Cv/VyLzttEDRzn0iS5chZBzcFn7OZZmh3jRipNXqRvrMTGaTZagW7DoKr31cM7L2mQ==
X-Received: by 2002:a5e:8b01:0:b0:74c:a578:e3a0 with SMTP id g1-20020a5e8b01000000b0074ca578e3a0mr5306285iok.5.1679519282604;
        Wed, 22 Mar 2023 14:08:02 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id g8-20020a5edf48000000b00758917bc309sm919372ioq.31.2023.03.22.14.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:08:02 -0700 (PDT)
Message-ID: <a0e5f9e3-403d-3334-9f7c-9d649d794a96@linaro.org>
Date:   Wed, 22 Mar 2023 16:08:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net-next] net: ipa: add IPA v5.0 to ipa_version_string()
Content-Language: en-US
To:     Simon Horman <simon.horman@corigine.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, caleb.connolly@linaro.org, mka@chromium.org,
        evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230322144742.2203947-1-elder@linaro.org>
 <ZBtrfLOh3EKBKW+F@corigine.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <ZBtrfLOh3EKBKW+F@corigine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/22/23 3:56 PM, Simon Horman wrote:
> Should IPA_VERSION_5_1 and IPA_VERSION_5_5 also be added?

They could, since their symbols are defined.

We expect to support both of those versions pretty
soon, and we'll certainly add them to this function
then.  For now, unless someone thinks it's important
to add this now, I'd rather keep it this way.

					-Alex
