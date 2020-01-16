Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D82013DFB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 17:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgAPQMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 11:12:49 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40743 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgAPQMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 11:12:49 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so19734981wrn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2020 08:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7fZAqN5KEgVxTr2KkYgc9fx+mk0Wbd58jdx1uS30Xdw=;
        b=liY6CfcsfJL0P+wQagP5QniA+PPHRFMuMlCgyhDtqDYGxfkCvZCkcOqg1n36N5Wgrr
         ZSh8yY85zSzJbZ5PUL4sTo16zuHvJT8AqY/sS94KwmCCyio9gjEOiTcmOFKcBevZFben
         pMWo9YynKHp2sFp6EyCt69voSUiHc29y8mIkpGkfj9BatYM7lOSA6SMVKgmRALhztOF6
         8qzjmVMYX9ieCTJd9tQDf3V1Qdp1mFf/JDMyyFZIhVZnbuo0f1QMet24SQd+UuyXEubd
         Ro5+0fBhApwCgtjYfvmAN5oJ27q4knEOmc95dyTlP5eXvF6RXcBfsL3yWhyyJiDVDazr
         hwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7fZAqN5KEgVxTr2KkYgc9fx+mk0Wbd58jdx1uS30Xdw=;
        b=hiUE8UUt1L/1XTTlABql5aOHsMI3G5mgXjGAvfty7NxdjnKrNgyOdrcmh4E6x4i8Lo
         cNNBCL+uz6fvkTawRjEp+utCxZZxBGyE7hlqwoLdSZ04d0Ba10wNEiQuCgGd6mWDIhQg
         DnfBqfcw0OfFDskf75eFC9IDf2clAuyExLY74Z5FzvyDJ3Ycb1CdBhIV5hKCF4kKFWgk
         arwHjT1mmFIx3HVFBfNK38kRbJTx704Vv685gJjmnMhk/ejJ0CJZpOdsriaHurM+b5+T
         7/ALfw85+66cwc6iPVNwyFTHBhMrWPUmHXFcMwK1KGrTo3M8UDMycyh+k97izxyv8Few
         roig==
X-Gm-Message-State: APjAAAWDlQ5c1mgk+KJxD9qwH/CNSg09LXYjPi1JOxYMT1Wrn4LgSAPT
        aF0gSR9lNZIX9aINBoaPmOSmng==
X-Google-Smtp-Source: APXvYqxFXSVeTd6MII7M/k64oozzeRVBxDES1fjiCAVexMJ+HosvhmzTmZcaJg0TeW4ijQ3Shn1kPg==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr4333353wrm.80.1579191167260;
        Thu, 16 Jan 2020 08:12:47 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id s19sm5244564wmj.33.2020.01.16.08.12.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 08:12:46 -0800 (PST)
Subject: Re: [PATCH v5] dt-bindings: nvmem: add binding for QTI SPMI SDAM
To:     Shyam Kumar Thella <sthella@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1578985692-20309-1-git-send-email-sthella@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <74686c1a-6e23-7658-5d81-c1641556e4b9@linaro.org>
Date:   Thu, 16 Jan 2020 16:12:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1578985692-20309-1-git-send-email-sthella@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14/01/2020 07:08, Shyam Kumar Thella wrote:
> QTI SDAM allows PMIC peripherals to access the shared memory that is
> available on QTI PMICs. Add documentation for it.
> 
> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>

Applied Thanks,

--srini
