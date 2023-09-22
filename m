Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E917ABAF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 23:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjIVVSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 17:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjIVVSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 17:18:49 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6FDFB
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 14:18:43 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-321530de76eso2512763f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 14:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695417522; x=1696022322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEdi9qDFyw1m665DHEA3QLEW4AqOxPcKWW4ONR8eOkk=;
        b=AFhvGdFnxGAM2R244DL4yJ+bv1MvZSf+QDrt4nzNkE0RZQI9NcVm0X6L27C4HG3S9M
         c3RCk8Ox+0ZXJaJb/Lckpio/kkei5YU4kgT+DYBew0s6EAx35l6/WiBJx5/pm19YRYV7
         CvwywsgmHPBj0zaT6L4QMDzCGX3H44mgo3wfwHZgFDV0rQtizwzs2wFkZ3eUJdFFthna
         gy5M3sVDpRwIb0IBfEvXhJv71siDpPJIDVH6Te24BEgnw31wRZw9bilSu0c7J5nUMbvr
         I7zGAHbdDROjTKsRhGHpm9DhStOFggUjFluiWVfs/q1rs0ZdIA13TunouV4bQsLcnlfM
         ZZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695417522; x=1696022322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEdi9qDFyw1m665DHEA3QLEW4AqOxPcKWW4ONR8eOkk=;
        b=wgx99EAcJRTmivD1wCRGouCe9ouV4lVe6AAyk7Y0D8ys3mQJOx1ZMD3bCOXH72xv1v
         9Hqby1sjKJRktxB9PPisBY9tAAqNddXPIqEZ2jTgQMwDyeM/hjhdtRlLohzFBFuLVNVN
         +cPMsJCiGR5zK/c0dCvdlu/ihrfqDG4UUNs4qOWpbNJGorFVHoLeaKHgDc7ssGDb6v4a
         h4oFY8dJUhVLRIjOcr6TGzIepcfECt935gZus0ye1V3TLYZuwcOZgfH98YH2VEsAqbGW
         r+/DCiv8+v3ExUxLnYlJ4J50Tx2ZTUX9dYXaqQTcnF7PPh+adj2ymiyIGMig6QV8bt0X
         ZOGg==
X-Gm-Message-State: AOJu0Yx6b1U6Cw5BfRFVZG378qesevpMgPioNVz9BdtLC6tG3dIwmOKd
        NxbAjkpx4ZETVTgiRn5mkvifrQ==
X-Google-Smtp-Source: AGHT+IHekmObQTv534BOIvE3hAqUfgY5KuhvVKHzxJ8Cyq64hSzQKhTBB8dRZUsZ36XiI0zS8WXfXg==
X-Received: by 2002:a5d:6701:0:b0:314:1416:3be3 with SMTP id o1-20020a5d6701000000b0031414163be3mr622806wru.70.1695417522041;
        Fri, 22 Sep 2023 14:18:42 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d46c7000000b0031fbbe347e1sm5359934wrs.65.2023.09.22.14.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 14:18:41 -0700 (PDT)
Message-ID: <b7a715aa-eb74-4909-8dae-88d063bee28b@linaro.org>
Date:   Fri, 22 Sep 2023 22:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: apq8016-sbc-d3-camera: Use more
 generic node names
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230922-apq8016-sbc-camera-dtso-v1-0-ce9451895ca1@gerhold.net>
 <20230922-apq8016-sbc-camera-dtso-v1-1-ce9451895ca1@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230922-apq8016-sbc-camera-dtso-v1-1-ce9451895ca1@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2023 16:11, Stephan Gerhold wrote:
> Add "regulator" to the node names of the fixed regulators, and drop the
> "_rear" part of the camera node name since it is not part of the class
> of the device (which is simply "camera").
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

>   &cci_i2c0 {
> -	camera_rear@3b {
> +	camera@3b {
>   		compatible = "ovti,ov5640";
>   		reg = <0x3b>;

You could consider a follow-up patch here along the lines of

orientation = <2>

to indicate the camera is External.

This shows up with a pretty name in libcamera based applications then.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

