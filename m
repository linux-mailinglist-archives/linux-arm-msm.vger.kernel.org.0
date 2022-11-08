Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0439621004
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbiKHMNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiKHMNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:13:32 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E53A2BF0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:13:31 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z14so20668451wrn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DGiJKi8pt0ZkT5jSHZTDlrGpOtMcV9yLgx2y0k/nDck=;
        b=eZbAFAG7tV9SrubtV1Sb5rt20OKHNSQ5FBKNjxQ3NQ82LPeB+LMia2ntK9WgGzO1At
         XanCQwoY22GlggaP6pBbf2duU5kbSiz8gvJ620vNPcMICuITTlKBSPq7Vg6dqmiK4Ml4
         x4JoH+bRYVIviCngHdTAYQtvCmGDs3eMchF70KX4ldXECkTAcOz7pvtLgx2fLzKoNRlO
         eb/kNwuyRwqwVGH502+0mB+66XW1BcEXnlxCved8cHtds8cULsdcHE8D4b2Fr66XhBLD
         hu3cTZJ6RA2a/ecvLvBYC+bwUar3dXq/4+1iPLUMoL2YtxiXOWbwJrUgopph/kmhV2m9
         IZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGiJKi8pt0ZkT5jSHZTDlrGpOtMcV9yLgx2y0k/nDck=;
        b=4ToeUb/pbY2u1c7mKA98sRMoXeIyv31/O9grDGndfDLAJ+zQ4qD3YCvBjkoRwkAR10
         N5Tz5kDbJKvhvSMiBxjw3NeGMWXybkCI8L7vuzQzy/p6qc+djOMcLlFNFQuJFrqNVtUR
         kU4lMZ+I6SIjpV5w7yGd6baf5ELjyXh2JW8RUuCGAztlSzHe6ZcIGCPy7D1P3t13ckuT
         qxmCQetxVAmuzj9b+rOAyhtTlwE7zsy/03C6VAuhIsuuufxeaW1ubj9ckF9IHcItmmup
         8beZ/TbVeEya7lq8EoWyL1lsC0oLV8r2X3rDB/FOwWPSqkeneDEiWgCaZuqN1qfqoeFB
         mMKg==
X-Gm-Message-State: ACrzQf121c4YHOcCaQkDfMByoY/nCRdlBIx+PDH9XDMam+PLnTW4M/K/
        BrvzFhzKPEfPN1WxSQmSFIpLDg==
X-Google-Smtp-Source: AMsMyM6BCuHdTFPBnmlr1H1nFvlmu7PDIJEeHt8iJqYIVd7G/mMR6kXS+TkC7wobyF1ZWJNOnrWlRA==
X-Received: by 2002:a5d:680a:0:b0:236:b797:5d80 with SMTP id w10-20020a5d680a000000b00236b7975d80mr33748170wru.403.1667909609888;
        Tue, 08 Nov 2022 04:13:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7474:d539:20c5:d55e? ([2a01:e0a:982:cbb0:7474:d539:20c5:d55e])
        by smtp.gmail.com with ESMTPSA id q2-20020a7bce82000000b003cf7292c553sm10991140wmj.13.2022.11.08.04.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:13:29 -0800 (PST)
Message-ID: <4c31425b-34b5-01ec-a2cf-d8269448766f@linaro.org>
Date:   Tue, 8 Nov 2022 13:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 4/5] dt-bindings: soc: qcom: convert non-smd RPM
 bindings to dt-schema
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v3-4-e5e045644971@linaro.org>
 <20221106034823.quftsxs7zpvb73tv@builder.lan>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <20221106034823.quftsxs7zpvb73tv@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 06/11/2022 04:48, Bjorn Andersson wrote:
> On Fri, Oct 21, 2022 at 05:27:56PM +0200, Neil Armstrong wrote:
> [..]
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
>> new file mode 100644
>> index 000000000000..6531c8805894
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
>> @@ -0,0 +1,101 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,ipc-rpm.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Resource Power Manager (RPM) over IPC
> 
> It's true that there's something executing elsewhere in the SoC
> acting upon the request written to the RPM memory region.
> 
> But for me the phrasing "over IPC" applies much more to the SMD/GLINK
> variant than to this. So I would prefer to just name this
> "qcom,rpm.yaml" and omit the "over IPC" phrasing.
> 
> 
> Binding looks good to me.

Thanks I'll post a v4 with these changes,
Rob, Lee, can I keep your current review tags with only the renaming and removal of " over IPC" in title ?

> 
> Thanks,
> Bjorn

Thanks,
Neil
