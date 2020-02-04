Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB8C151487
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 04:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgBDDRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 22:17:41 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43898 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgBDDRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 22:17:41 -0500
Received: by mail-wr1-f65.google.com with SMTP id z9so8841836wrs.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 19:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zAILjWnGpR64ApE/VIc16t+QeMtOijCsh2+8KuWkxNM=;
        b=Ntq0vDAxIs6ev78entCJdSxSUuM0k0WAGpR2ZJzcYs03/Dp1l7PG7KeAsssfpi24nr
         1m1rww7xW+L8OEysYDJXFa1HG/+fK0QkXTvRDxjTjbW+5IDzEmZjbr9XL/zg5wZsNvaf
         Y36nZ90AotUDCaWWf6jgkHPA89lgppcxLHWUNHWGIshHY31rFveoL225WlzGdvonoxVX
         Ar+ZIVG2K7Lm9hxBgpHpLhU4rgbNSeNcGbyGoTu2CiXEq1Tg7jeVYkqIwBQgTI8wlJDH
         4LvwBrIxMMZKNOarI6SOUPHxZNry0odxUi4tJ5vqR8JPsX3L3A4rGe2Y0XGWBibJJzdk
         5XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zAILjWnGpR64ApE/VIc16t+QeMtOijCsh2+8KuWkxNM=;
        b=SUHEQYyvmsnHBS8FAf0snihejqtMwr3u1XUnwUTbFdq3s05fWsPBi4ju39T/l7bfeh
         O70KZPkvtnWlavONCT382n2KKICaowp3ZFitUXrt6LjhOzV3z4sX/ph31fe2ZTfI3359
         2L4/qeNpnVzoEnJmX9eHo31QjhgVbTGVPm31zmwA/FE09czPBmN6lLYUwOSHvisrqAAg
         SFBCw8c1BWAHMoS7z/Ccc4Os9jWHO9dZS6pvAwQiH239KuWPpgMa3PfmMAQ7K9PcnAyV
         ti9FZT125FzxqkVIQ6zqLSZ17JWL/4zBBOQtBEypx8PVtxH3FrLdpm63Xs6iQXgIYraP
         jXUQ==
X-Gm-Message-State: APjAAAVwgwuUQiCSgec0BxqaFo2An57nVc9D0V7yD5WNhpAxtTSZVnaT
        j+fKhxEMRjiTLQKQHP5u8aEP5w==
X-Google-Smtp-Source: APXvYqxAzH2Mr4YWUjg4UzrS6BI7zknPs9nKRaCBTGplTtPRA5N0czrnd+fmuMX7DOvPF4/YBKnfGA==
X-Received: by 2002:a5d:6451:: with SMTP id d17mr14714946wrw.255.1580786258746;
        Mon, 03 Feb 2020 19:17:38 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id y185sm1923831wmg.2.2020.02.03.19.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 19:17:38 -0800 (PST)
Subject: Re: [PATCH v4 1/2] dt-bindings: Documentation for qcom,eud
To:     Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, rnayak@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-2-git-send-email-akdwived@codeaurora.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <f06e6af6-5045-ce75-fcc6-e07890b3a29c@linaro.org>
Date:   Tue, 4 Feb 2020 03:17:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580445811-15948-2-git-send-email-akdwived@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/01/2020 04:43, Avaneesh Kumar Dwivedi wrote:
> Documentation for Embedded USB Debugger (EUD) device tree bindings.
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>   .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 43 ++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt

Forgot to mention, this file should be described in YAML.

./Documentation/devicetree/writing-schema.rst
./Documentation/devicetree/bindings/example-schema.yaml

---
bod
