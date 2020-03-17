Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE63D18890F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 16:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgCQPWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 11:22:06 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38041 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgCQPWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 11:22:06 -0400
Received: by mail-ed1-f67.google.com with SMTP id h5so27047653edn.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FN6nZxGnOaw3deJgrYU1nB+eySU41aqfgMOvG0B3T1g=;
        b=CXjlKsP5/eG3tZJGw8EPbB69nbC3nO4ZZQfYtvvX5o2sdeR2vVbOAPJd8ufv4NCETI
         02I170hMx6kVh1sjzn69urnNbgExvQeSlkitbDxdyl/uvNwpdojqNN32J5e8ycULPU4L
         s1HVoS9+wzcMbmrKjBXEtZ2cHoqkq7dRot6Mf/ehXoxd28r12XO9VcMG2gMJCDc5tw1h
         gBLJlU/Ptq2it9/Xlo5utCg0XqxXmvkPr+n+vcJg1ARiA9tCg2Mex3p5UBXkQb8pCrgt
         BLAzadrLVthZNCuciVdMd848fwy0bpmh3KryGSNikiM31ny7IGOyUM1ebjPETz6xnQ9d
         IK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FN6nZxGnOaw3deJgrYU1nB+eySU41aqfgMOvG0B3T1g=;
        b=f44rqw73WqCVsaWXNKgcKMMmJsL7fMJcOKoeggUdKSVoL0PgtmWrc72vNXm5tUCGRN
         +Oind3YpkfVV9UBPWV/R2XRKa8Z6ZQ//mfV1dMVdnUUlUA8kHjIqQZXvz8inK5bXO/fr
         rszpREA+il/ga8w5p9432pVwLyUNuUdCLco+RRabUyin+lT2J6cea8MCCpKCZU1j16Dz
         n66H4SrFuCwLdcbN5QNXFWf2XRQyaRS4SEJfJeQj5FJqOI0nYBXCUtnTWn2Bbs+HDCQm
         g+9RoZUuCZziynrHfhaE17X3jEPSVESlvWrwEUenOtaG+WZJIGT3F7zJc/JbTQaN3m9F
         XBuw==
X-Gm-Message-State: ANhLgQ1jfcFQByFNxxjwRZIqHItUF4XkICeoH6lbaKvJHQXEkxWM2Zf7
        IzjmiAgfbAyMmmwK74wpfh7gSQ==
X-Google-Smtp-Source: ADFU+vsI46bucXrS6vRC98i/tyZ5FW2KRCRZlYWtRXZUfYzkhSt7l9XxjzONQxNkkNmWOvcZUFuTfA==
X-Received: by 2002:a05:6402:180e:: with SMTP id g14mr6060137edy.66.1584458524977;
        Tue, 17 Mar 2020 08:22:04 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id bc23sm227198edb.31.2020.03.17.08.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 08:22:04 -0700 (PDT)
Subject: Re: [PATCH 7/7] usb: dwc3: qcom: Enable gpio-usb-conn based
 role-switching
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jackp@codeaurora.org,
        robh@kernel.org, Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
 <20200311191501.8165-8-bryan.odonoghue@linaro.org>
 <20200317063101.GA2778164@ripper>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ec573486-155d-c6f9-7645-496e85721a69@linaro.org>
Date:   Tue, 17 Mar 2020 15:22:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317063101.GA2778164@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/03/2020 06:31, Bjorn Andersson wrote:
> I don't yet have a sane suggestion on how to redesign the dependency
> between the two drivers in order to avoid this, but it's at least not
> possible to access the child's state data from dwc3_qcom_probe().

yep, this should be modeled as the dwc3 registering with the parent 
role-switch, like gpio-usb-conn does with dwc3.

I have an idea for a patch, I'll v2 this.
