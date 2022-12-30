Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A95E65968F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 10:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiL3JM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 04:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiL3JMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 04:12:54 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA78192AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 01:12:52 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m6so20602434lfj.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 01:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U8m08wd2vDX8ay+lo65k2BbC5GMWrcKUp9ctsSVUIqs=;
        b=s7pMjuIQWKB4M+Qnch9uGyog9Va5JvOv1kgRUeKdRjfoHEmvfcknx/2UfRSwdMDGUX
         MrRfu8gptKD7+lacqMrIGQW29LABOBEpEyX7yC4tmrQ0wnYHqno+zSl1jHx/Z2kXJn1/
         0LVghMFx+Qvlq5ZuGjYlR+SMvPDnm/tzMATlzoJ5LGmh6XcM15yyu8au+7dnNOX1MoQH
         /YiuMn5OlrIGiQV0C104cMUOTW9A6EIBhojoEW1kFFFvXz7T8euAxFr0yyBnf5viUebV
         DChwn+lBDtyrjhyURSoggd5vbDmZR6r0DJxkZF3eUdT85t+ktHSPd5ZYROSUaCGV3acK
         yxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8m08wd2vDX8ay+lo65k2BbC5GMWrcKUp9ctsSVUIqs=;
        b=idxW86i44WL40zWsM25Gh96A6DwMs6XXR9Xwpj/Wq1BaKFkOvdo/T9Jn0bLsxtz8QU
         vhIm5A2Oe6T4gQlO7n+X78JJ+I2y/uDwIza77bnl2uHsn5iJ7nbuQrNgVEGayOsLywi3
         eIsMo1F2CvgyQR3gbg319mdxxeY+6HLBhgTPwlyBxYtGk66ew20YJZ2R+VZ9PoHcf2Y3
         4qyQS8yTrX3cuLzd+COSkdhS2UpJsQNE4ObrurHIwxOzx/EWJyvkD7HPXqAeLH1XCzDD
         97Eb2xZy17PoC6FAmdVnS+FQNBJZ6QK2Ql02JUWas7nOcBhFw1NmsL31wYNFq7iOHLFz
         Edzg==
X-Gm-Message-State: AFqh2kogzr8myDeqy/Oz7UsJUZ4FO8874YuQE5HEc0+lkgIjLMEFGF+F
        Z+g2MZ1IRa4b1mPchI8BxA9bUA==
X-Google-Smtp-Source: AMrXdXs9oq+R0PbV1NHmE5MAQN80YkxJP/ew/rTsagiQaX9yzC/vjPqitxm4OOz4jLi31y45Spuvxw==
X-Received: by 2002:ac2:5dfa:0:b0:4b5:41fa:69d8 with SMTP id z26-20020ac25dfa000000b004b541fa69d8mr9169080lfq.16.1672391570694;
        Fri, 30 Dec 2022 01:12:50 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b0049fff3f645esm3379965lfo.70.2022.12.30.01.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 01:12:50 -0800 (PST)
Message-ID: <61cb9bab-aefb-cd45-acb0-ef846a411d76@linaro.org>
Date:   Fri, 30 Dec 2022 10:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm6115: Add missing reg-names
 property for UFS
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
 <20221209-dt-binding-ufs-v2-1-dc7a04699579@fairphone.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221209-dt-binding-ufs-v2-1-dc7a04699579@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.12.2022 08:42, Luca Weiss wrote:
> The UFS driver expects the second reg to be named "ice" otherwise the
> Inline Crypto Engine won't get enabled.
> 
> Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=01b6041454e8bc4f5feb76e6bcdc83a48cea21f2

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 572bf04adf90..85673d562723 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -704,6 +704,7 @@ opp-202000000 {
>  		ufs_mem_hc: ufs@4804000 {
>  			compatible = "qcom,sm6115-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>  			reg = <0x04804000 0x3000>, <0x04810000 0x8000>;
> +			reg-names = "std", "ice";
>  			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>  			phys = <&ufs_mem_phy_lanes>;
>  			phy-names = "ufsphy";
> 
