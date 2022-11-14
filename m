Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00536274E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 04:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbiKNDRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Nov 2022 22:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235644AbiKNDRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Nov 2022 22:17:04 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDD5BE2A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Nov 2022 19:17:03 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id l2so8889210pld.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Nov 2022 19:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=arl5DPKy7ubpsRwNKHJrZ2xSjvtK9FsvSBfMFAAwi5E=;
        b=hcstPjpr6RxzTkFOHx6blSWxyeQNpfzvlfr3yFhMxcskbqck08zZIJxQGwQj/1LX6f
         E5dlzD+zfByDJyS0szqT/RXVaOLE0FHwm//ZphJOIBGrH/Mi1NRxlAqZ3Y8SyBNBmokp
         K9nkQjpfTQniIcfNqkhlz1/GWlQNPmS0PG70jDuLhTYoyod2GoPF8B0UPUp/unmPKaXN
         XrJE69s83aEJQnAOnhUr2+2DOY+w899Pe3MOX6toDDINqVyxjGj1v6lKik3NyHTFfqrX
         D4JTwD1Gwhrviy6Dkk5rchW18LboUyzZT865GK8jHZx6z380xs+UmpV5FcBL5AbdeU5x
         Y4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arl5DPKy7ubpsRwNKHJrZ2xSjvtK9FsvSBfMFAAwi5E=;
        b=1SWx9hXUAZOAFEbHYvuKK+dMDtAazLLLBcFDioHDe9CV6b+CK3EXZmCTGE/8J6jcLX
         JML5NyWEwSjRoZJM/hHwtLIBgKvifdX0khqXP+gIr57YuTaQOZAgMUcorN638Clt0p8B
         e83nImdElJg1XeZGY6qRX2tg20sUgPqxl5HR7IWpQuzHvjDzGEjwVJ4EStwQlKJTG7hr
         yW979Gx4PcWmNmn+T0lOr7mTtmwmFPK2PEH5RbK15Jzpm9qcmkTNqbgJhBfutEsjP9qf
         GcI8jvBWBGAngNZKA0XWjur9WtOuNUN/hwdiqTcQbu9hGqf/EBDzQnLNhIk0ppyVX5H5
         5U6w==
X-Gm-Message-State: ANoB5pmH/gP4VkFO9MgC7/VNC9VuLOViGCNnicenKOLxMT46j1S3Y1qf
        J+J8jKqKgohbpAmfjs/BdRSyjw==
X-Google-Smtp-Source: AA0mqf7UcJdYf59h0jPLowDqt7YG8RjzpRGZ/TP3MKw3KQnpPKB6peGXnBDlpgfnDVm2nQtIqoNmeQ==
X-Received: by 2002:a17:90b:394d:b0:213:caaf:411 with SMTP id oe13-20020a17090b394d00b00213caaf0411mr12396509pjb.74.1668395822640;
        Sun, 13 Nov 2022 19:17:02 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id j9-20020a170903024900b00188b63f0782sm3844440plh.288.2022.11.13.19.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 19:17:00 -0800 (PST)
Date:   Mon, 14 Nov 2022 08:46:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org, johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 3/3] cpufreq: qcom-hw: Add CPU clock provider support
Message-ID: <20221114031658.pnbf7uiqqgiq3uk7@vireshk-i7>
References: <20221108154037.111794-1-manivannan.sadhasivam@linaro.org>
 <20221108154037.111794-4-manivannan.sadhasivam@linaro.org>
 <20221108155717.srlnabls5ze2resx@bogus>
 <20221109074908.GC4651@thinkpad>
 <20221109110831.lngwmwyjqp4qj73r@bogus>
 <20221109123526.GA29805@thinkpad>
 <20221109164719.d7kowdu7wskyzjsc@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109164719.d7kowdu7wskyzjsc@bogus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-11-22, 16:47, Sudeep Holla wrote:
> Is the cpufreq_get() API expected
> to return something close to what was set or is it expected to return the
> real set h/w value if and when possible.

The real frequency the hardware is running at.

-- 
viresh
