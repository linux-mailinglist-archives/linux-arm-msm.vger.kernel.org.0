Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E3B3B0D4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 20:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhFVTAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 15:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhFVTAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 15:00:22 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B00DC061574;
        Tue, 22 Jun 2021 11:58:06 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id j10so6702354wms.1;
        Tue, 22 Jun 2021 11:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=4/UaZ4hT0bkbNSscdwvTTqvjmbSe+HOnKFdPoV+8EMw=;
        b=avqLyriaouHDJ66tnNqyFZ15DJ8uisdPJJN9BQnBiuHQk3Sc12sts82OvwObblb9ig
         sGhV0+LcqkJhriUSpdm7AOHUABaEwV3xNvC8yOqiDm+1kTyRnC7Dpkye9sqjVcajLx4S
         Xor5oNszNi3uVBZMOaHUQ6mDXVuhqp8pUHwK9QrbBukbLokHrwzlIgp7ClgfomcGXomJ
         0TbMqDDrzorhKx1tDd6pPRdFlT23qNtMB85MYoqZCcxISmZmJpuGU9Q/95YIyDA+/AFh
         doHQfisAGIyqDv/peUFuC3CtsUbbTFFGx+n3J/0BUGZLeEbzoS8mMfM63tIRMwadYNJe
         IYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=4/UaZ4hT0bkbNSscdwvTTqvjmbSe+HOnKFdPoV+8EMw=;
        b=I6lVD5BQ6HnstI1nvur1q1Ktg8zkAHjZXNBoEMQ/mIcs56rsq+Im9ri99UqpS8lmPd
         0BnAW5BfTw0prgZL2tbjzfj019CiuaiqZh8ht+F0Y4/InnovBlnZ1BqZfWGFRQwVOvUK
         lcOLThRLFJ7TIkg6mCWzqHhzPmdwBM4UcXHk1gf9ntxs4Cwyqr6G7KCSo48LxdZkSuu8
         FWRJ5V7pIlOXujDXxi4Lqhsacn3bytd2cbSI5eok2bzOcBGN6ithaLhZngK/lStR9Riw
         Jq6sFEba0NE9qdlscjak7KV7mUgrRValm0/1odLPZEU1CzOskD2VB1WPcMyFItNuKeyN
         WEMw==
X-Gm-Message-State: AOAM530fBHET94yTUkUHxH8FFfA6SnWnyCMEb3zT+wBUDBqHFnW0zuUA
        CYCCVfAFfHfmKoZlvaqEpuw=
X-Google-Smtp-Source: ABdhPJzMVRjgRdMpM6gcaw6Q8SBD/Ei/Dd1NpvIV7irHAPFD8Fvb/LlkjhwDpgrk6CeMsi7C1SkZUw==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr6125062wmj.72.1624388285068;
        Tue, 22 Jun 2021 11:58:05 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id b18sm288658wrx.45.2021.06.22.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 11:58:04 -0700 (PDT)
Date:   Tue, 22 Jun 2021 20:58:01 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: msm8994-angler: Disable
 cont_splash_mem
Message-ID: <YNIyua0NC6lQLzCd@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210622185023.14597-1-petr.vorel@gmail.com>
 <e89c7fd4-95a9-1047-64d1-32d0bcd2d6ce@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89c7fd4-95a9-1047-64d1-32d0bcd2d6ce@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

> I'm terribly sorry for not asking for this before, but could you please add a comment above
> the /delete-node/ explaining the weird firmware situation? It hasn't happened before to any
> board to my knowledge..
I thought explaining in the commit message would be enough, but sure comment
does not harm => I'll send v4.

> Sorry once again!
np. Thanks for all your comments.

> Konrad

Kind regards,
Petr
