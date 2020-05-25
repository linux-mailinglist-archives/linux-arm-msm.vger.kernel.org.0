Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893DC1E0B6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 12:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389505AbgEYKJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 06:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389363AbgEYKJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 06:09:25 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05288C05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 03:09:24 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 205so3891086qkg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mmSKZLegHlAcDBUlIzHam8wKkEWO4T7rBCLsE3QaNq4=;
        b=jeszRHgxD7Oxhg6M7LbMxHAWGne9QEOsMhqXeIa+AATrHr61QLFVPIEHqxDgsoiDrh
         J31TBEqNAJp3c9WRAsqbtOuY/hIE+hapOkmbvyNO32ZSfptpXlI0We9gyNk0qy/mBTSK
         T6Gc8w8TMPptcUbJb/Lm9DSm0YT+M9jDzAk2URz/cr1AAKqeEbreOZWIAkZUCE3PhHId
         b534L+xbxh2vIxaogC1ghZcXCzxx7bApbqHnaeQsFAs/4v9ln/ukM4SHPKx4xxDEkjog
         4ydyOt/5Rx2RcDPLLCbaB/hBpONY8FHI/VU3q5mrdCT1QP+lkn6JsS1JD9gcbPY+mPIk
         OJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mmSKZLegHlAcDBUlIzHam8wKkEWO4T7rBCLsE3QaNq4=;
        b=WV8lUsVq8fo4dko/emqPpr3Vqgbd5HUZJvesT1rcZu5pIH90pv82LChIawFgDGzLzL
         jHUfdOaXYIDZnJx140wwneg7ARYPrlOvTysxPzCWp1FNiuRQdjUj31a8oaFryhYh5Hap
         5DgzEc8IstXKrUrMV9t1vvNqss64DDpMir/jsPNOivsAQxuZYuq7LrEib7BDl5Edn60b
         sJdCPsOZfoKCznW/+fw5NWHVMCdojzUTLwC/51iIBWOh5+8W3+756kyyIQY3BwP43s52
         XF4uHzIdcRqMFP3H7WyFZjiWy6DXKrUOfG0LmQnDpMyqJM5PxLaBO9azFKkkJDqx1OGm
         3nkg==
X-Gm-Message-State: AOAM532kiS+IaRJlHIAA4oB48+jYhLBVObasDE0UvACNHuyBlFIQgD+d
        MwW52qnCmjKA1XCBMUMyWCDZ00mmo9s=
X-Google-Smtp-Source: ABdhPJxb3OvPieEdva8jtks4EbjSxctQTZww+YeaGRp3mJtL1NrniFckZt3WEvrli9/NlJmowthvIA==
X-Received: by 2002:ae9:f442:: with SMTP id z2mr24828736qkl.116.1590401364127;
        Mon, 25 May 2020 03:09:24 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id e16sm4429488qtc.71.2020.05.25.03.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 03:09:23 -0700 (PDT)
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: add apps_smmu node
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-3-jonathan@marek.ca>
 <42f39eeb2af9c82a551a417c62ea21d7@codeaurora.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <0f58e2fd-ef55-cf38-d403-4782662aa89e@marek.ca>
Date:   Mon, 25 May 2020 06:09:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <42f39eeb2af9c82a551a417c62ea21d7@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 5/25/20 5:42 AM, Sai Prakash Ranjan wrote:
> Hi Jonathan,
> 
> On 2020-05-24 08:08, Jonathan Marek wrote:
>> Add the apps_smmu node for sm8250. Note that adding the iommus field for
>> UFS is required because initializing the iommu removes the bypass mapping
>> that created by the bootloader.
>>
> 
> This statement doesn't seem right, you can just say since the bypass is 
> disabled
> by default now, we need to add this property to enable translation and 
> avoid global faults.
> 

If I use this patch [1] then the UFS iommu property isn't needed. In 
downstream, the identity (bypass?) stream mapping is inherited from the 
bootloader, and UFS is used without any iommu property. Setting 
ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n doesn't make it work on its own 
(without the UFS iommu property), so there's more to it than just 
"bypass is disabled by default now".

https://patchwork.kernel.org/patch/11310757/

>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 107 +++++++++++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 2f99c350c287..43c5e48c15e2 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -323,6 +323,8 @@ ufs_mem_hc: ufshc@1d84000 {
>>
>>              power-domains = <&gcc UFS_PHY_GDSC>;
>>
>> +            iommus = <&apps_smmu 0x0e0 0>, <&apps_smmu 0x4e0 0>;
>> +
>>              clock-names =
>>                  "core_clk",
>>                  "bus_aggr_clk",
>> @@ -428,6 +430,111 @@ tlmm: pinctrl@f100000 {
>>              wakeup-parent = <&pdc>;
>>          };
>>
>> +        apps_smmu: iommu@15000000 {
>> +            compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
> 
> This should be qcom,sm8250-smmu-500 and also you need to update the 
> arm-smmu
> binding with this compatible in a separate patch.
> 
> -Sai
> 
