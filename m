Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B1D7A9E0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 21:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjIUTyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 15:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjIUTxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 15:53:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263D148ABB
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 12:03:50 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so167956566b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695323026; x=1695927826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5cABMrQhshDaG6TwwFpOJKeN2scA9eV13qN+CKmNlM=;
        b=na29L49ZkBEE5QEVakI5QyVCOlRC36SL7Uz5EVyTxumGk3RYd2tVS3JGcvxKKr1+hb
         ipxcYC0eXJ17086zyvjnw5+70gP7kCPpMcj4HTh3+Taimzo3d2A5R5EMt1Ek4ZfDkLId
         uo6tSPs6YpajrF9+bHnO0tA9dM3twoZqumXZMgo7tN9CHXSlJX+0p0P8r4Ngqc3L2Hs6
         HDtniyUPiCiPbRX2RcSnGVjAUONO69kqGPMGyU8lAYwpCKHlz2waW1fIGySu6OwrZ4YQ
         hS/LwD/tqQknE/ZrUvLwyJ1YRLZhQ3enB5Dcrv8WgT/x8aGg3IvQKwnB0MdApBzqB+4n
         08UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695323026; x=1695927826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5cABMrQhshDaG6TwwFpOJKeN2scA9eV13qN+CKmNlM=;
        b=pinuiFWPpf/blWWc2o6ndgMy88yMZ/bxUsCdbGZYTU24h7alBcuEmC+526FwYMjV53
         JhIs7Ug0pdAuFzV5URBKPy/38+b0pRvr9ok+2EVv8Ab+ae27k/pewGtLvjnjCCcVOeym
         L9pGgNbCThO3vBkdnWg8UJ2SdeYQAj1gjI7fS7H10fwOxPidY0gsXLwg6TeHjNA0fdu4
         YGc78Coi30PNEnLtugskKqYFiCuwbl8tMNhwxKGXC+YhTv3p2TRd6m7zCTAWi89EvOnH
         HCc6mC4Iqy8W2DPzJI8gtSfjF/7YrR5ZN3oss/ZGqMWId6TTKXM/OoYdFp29H225DgEN
         veXA==
X-Gm-Message-State: AOJu0Yzp5Kba+hHBwb1rIa1TLZJpeo42FOAQ0WUQOiNYSiiTZJO+Ief5
        ol2V0jVjrcJQxl9ct4WCHA02XXMSrA/QarvLCzTpB3oa
X-Google-Smtp-Source: AGHT+IEXffqDRZSSy+zk6moFm3fhLBE9Wb8UTl/d1dV/OHqhzTh/LfTnV2sRR811+3juzKUhRf6Zkw==
X-Received: by 2002:a17:906:844b:b0:99c:ad52:b00 with SMTP id e11-20020a170906844b00b0099cad520b00mr3861431ejy.6.1695279998107;
        Thu, 21 Sep 2023 00:06:38 -0700 (PDT)
Received: from [172.20.15.189] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dx26-20020a170906a85a00b0099bcd1fa5b0sm573534ejb.192.2023.09.21.00.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:06:37 -0700 (PDT)
Message-ID: <0349897d-8802-b4c9-c867-20d139baf952@linaro.org>
Date:   Thu, 21 Sep 2023 09:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/3] dt-bindings: reserved-memory: rmtfs: Allow guard
 pages
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230920-rmtfs-mem-guard-pages-v3-0-305b37219b78@quicinc.com>
 <20230920-rmtfs-mem-guard-pages-v3-1-305b37219b78@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230920-rmtfs-mem-guard-pages-v3-1-305b37219b78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_PASS,
        T_SPF_HELO_TEMPERROR,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/21/23 04:37, Bjorn Andersson wrote:
> On some Qualcomm platforms the firwmare, or hardware, does not
> gracefully handle memory protection of the rmtfs memory region when
> placed adjacent to other protected region. Some DeviceTree authors have
> worked around this issue by explicitly reserving the space around the
> region, but this prevents such author to use rely on the OS to place the
> region, through the use of "size" (instead of a fixed location).
> 
> Introduce a flag to indicate that guard pages need be carved at the
> beginning and end of the memory region. The user shall account for the
> two 4k blocks in the defined size.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml   | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> index bab982f00485..2d7be508c5a0 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> @@ -26,6 +26,17 @@ properties:
>       description: >
>         identifier of the client to use this region for buffers
>   
> +  qcom,use-guard-pages:
> +    type: boolean
> +    description: >
> +      Indicates that the firmware, or hardware, does not gracefully handle
> +      memory protection of this region when placed adjacent to other protected
> +      memory regions, and that padding around the used portion of the memory
> +      region is necessary.
> +
> +      When this is set, the first and last 4kB should be left unused, and the
> +      effective size of the region will thereby shrink with 8kB.
kiB

Konrad
