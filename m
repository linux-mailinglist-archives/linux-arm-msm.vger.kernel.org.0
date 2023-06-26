Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2840573EEBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 00:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjFZWpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 18:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFZWpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 18:45:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53755131
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 15:45:47 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso27295281fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 15:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687819545; x=1690411545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5bCPFlR0nu3jWbwFkLqvSTjglnwST8IppmOFOBlz+8=;
        b=qJaoDjzNpYqpEsQQchoys5kprXHinuZsVAbE7N7V/tlJf7exDUN9nXheqBQ3Wt5HZX
         qLHbwWjeDphPHrkLxuJCXCOraN0phIUtTIJrqMu9VRDQgCyVDC2y5RcQIkkpKXEZT9cO
         l0HDCIfP2hsnDGXj5vf5/7hYBcWcDPddrEoOo1m7AYUN2dDi2/8vJ4EwmK85Anpy+Bja
         ivq+Z4hE8BVoQxwlFibrDQKyAl6Giwh2hdpyOyaQQR1HzirVjHQa6kA2Ar+GUOeFHGUN
         cqQy3iqzLN/7Diix2rDuE3D9eGh6d5dWByWnv3Fwl04aCtuzNi0U7gMUVulLL6tw1yJ/
         4b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687819545; x=1690411545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5bCPFlR0nu3jWbwFkLqvSTjglnwST8IppmOFOBlz+8=;
        b=I36dfBgOM70ZkyQZA3Dx0ePXCvBTfvj/A3AwKDoj660/hn0Scll5W5D8AucrS7iNXU
         +9t+qQyY3MeonhjhmBuQONXT5XiUboVBZ6iDYq/jZKehybvr5x6KLPCMz9jnDmDAbGVp
         ClO0rciwMaAC+56+1ISQTNHDozN/QQRSMZfp4SxH4lSF6/loIZCWDHfUHYu/drZ7CvJI
         DIWoIcV87mDH4w+u8RjLAuFjhxvUlIjLe2uctEgtKizpv1LKitUsdk80LXlS2d01JZEe
         w/n4J4XbYmd2X1OwhyweLtlhHFVs0wh0DcKM6+ASwqkDom4B6SNrBBMkJXvpDrELDDZC
         xKzQ==
X-Gm-Message-State: AC+VfDwEcdYunRSolNg/tyHDlB82zJfKIRjAFG9lBh3KRtemlvx1xFXH
        zIxmO5Ret7QYsD+d4lVg5viG6g==
X-Google-Smtp-Source: ACHHUZ4MkezrTg7Z9UArmCvbs17mEfFgUWI0FF/DGZkDKPVqQnLigk+6CZEVrjsFa5tbSdDqhTREeg==
X-Received: by 2002:a2e:9107:0:b0:2b5:9b3b:f7ea with SMTP id m7-20020a2e9107000000b002b59b3bf7eamr6470282ljg.41.1687819545471;
        Mon, 26 Jun 2023 15:45:45 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id b6-20020a2e9886000000b002b69f44646bsm938501ljj.17.2023.06.26.15.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 15:45:45 -0700 (PDT)
Message-ID: <ab41462a-330f-263d-718f-e449e9ca8c5c@linaro.org>
Date:   Tue, 27 Jun 2023 00:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: Fix "status" value
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230626220957.3945972-1-robh@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230626220957.3945972-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27.06.2023 00:09, Rob Herring wrote:
> The defined value for "status" is "disabled", not "disable".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index cfbc4fc1eba9..c6914db7dc6d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -779,5 +779,5 @@ &wifi {
>  
>  &crypto {
>  	/* FIXME: qce_start triggers an SError */
> -	status = "disable";
> +	status = "disabled";
>  };
