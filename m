Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D998532A130
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1835221AbhCBEuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442336AbhCBCM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 21:12:27 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAE9C0610CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 18:05:32 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id i18so16590182ilq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 18:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uOM9WB8dO/tnG3Pffr/aYUfTt7JQpPSulGrjonUVNVw=;
        b=Hfc1e6s+zSFLtwLDB3hycUh5gd/4/+8ej1MI/l3oy+OCQuymlpGHsWB7OFFiI4AGXn
         gV6tYubDAELgJUEJ9GQX8pVRg2X109igrBH6KFWcCziXmI8SwHioYhtck318nsU9KRhx
         ylz1A9dz+sD/9jC4y2KWrd+eev6yi0Q+4EKBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uOM9WB8dO/tnG3Pffr/aYUfTt7JQpPSulGrjonUVNVw=;
        b=a0ONxczv4EXeR5n296WKNB7a3U0nxxlXHz5gSf2AFQ3JLCEbmfgbThWlC2xqx4L6PP
         TTiJc3fXRgw5U1ZEcUzRM8nrFHuCmNa7sQFx8UNtkNPWRsvOpoOT7DtppRXo7Sz8F6C2
         a1S7jvgN+lSEv0bzn/Tq3IyGlLSpvB2KXdOK/BWsjMmflp1k33hoO1DYxfhfEWK2l3XX
         +w3Xk0oGA9Rqt9qYNMieu64emQTUuwZ80I19/kO0yXW7e4kHUGHXBp7Y1+tr7eqS1E6T
         DWiitIPOQt8B/zdk6S2lQuesQ5OXDpMNiCqFnERBxf+KXRrD0EEGMUAIG0qm6diEWRav
         S7gw==
X-Gm-Message-State: AOAM533EPOXNQ20wNNC0Y0p8nWwQtZ6FNwvJACWrhdm4mimd6YCM+zuv
        JGRaAfyIkTb4PF83RqA/5ouy9A==
X-Google-Smtp-Source: ABdhPJwO/2zdoTUqjJvZi7CtBcfPzA67gqjGozaHKlINWplLpzzsoCrbVYOBrIXfbotHoj9pc6c2EQ==
X-Received: by 2002:a05:6e02:1049:: with SMTP id p9mr15832931ilj.125.1614650731520;
        Mon, 01 Mar 2021 18:05:31 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id k10sm4965414iop.42.2021.03.01.18.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 18:05:30 -0800 (PST)
Subject: Re: [PATCH v1 7/7] dt-bindings: net: qcom-ipa: Document
 qcom,msm8998-ipa compatible
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
 <20210211175015.200772-8-angelogioacchino.delregno@somainline.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <981faa38-e839-09e3-4e6d-7eaa6e2a8549@ieee.org>
Date:   Mon, 1 Mar 2021 20:05:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211175015.200772-8-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/11/21 11:50 AM, AngeloGioacchino Del Regno wrote:
> MSM8998 support has been added: document the new compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

With the previous patch in place, this becomes almost
automatic.

But I don't want to claim support for a platform
until things actually *work*.  I don't just mean
we can compile and load (and load firmware), I
want to be able to say we can actually carry LTE
data over IPA before we advertise the compatible
string here.

Maybe I'm being picky, but that's my preference.
It adds some motivation for getting the user space
tools squared away.

Thank you again very much for your patches.

					-Alex
> ---
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index b063c6c1077a..9dacd224b606 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -46,6 +46,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - "qcom,msm8998-ipa"
>                - "qcom,sdm845-ipa"
>                - "qcom,sc7180-ipa"
>  
> 

