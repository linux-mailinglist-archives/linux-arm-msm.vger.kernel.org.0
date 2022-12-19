Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974A3650D1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 15:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiLSORN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 09:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbiLSOQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 09:16:57 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA20F006
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:16:56 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 7so1201351pga.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pmG1DDF56ql+Ucxx3uSq2o6KcC6synBvsSirmgprw08=;
        b=ww2Xt40CtM/Cgggxge8rHWfegh3LaMAIwjxeYZ8lKDnSydvkS4DVgNo/vS1gT2Miyx
         bQVltg7B0H+V6d12QbKrtWjS6R6/g7NUI41qys/9+iUljpTILqwD7XLzkt8dCXx7KjX7
         C2Kd6QOBd2EheFXuCkdEHtGuWA54G/2sM4OITLXBlD35Mctx6X9yGGPmhsYCLMaWusZz
         NEFfI+p4viFX2l48AU8ymkIBXv1gXFZyWmtMD4ggN+AYfauDUdSjwAHXz5ZZOZhyouoH
         T8K0p1kuyhbumC5juYPROTziHvdPngpdutocFdXMfgoMDdBta4u1BPyDpxPRwVNZponk
         DkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmG1DDF56ql+Ucxx3uSq2o6KcC6synBvsSirmgprw08=;
        b=P2Lu91A1PGJHoOkO2Kw1hHjI7cuZYW8uadfwU6DN8BlnYI91DIWQXsxSeCzacetyp+
         EXH9lZvVRIn8xMTfKTz4JGuCmqXZm3Kx4O2+2E/85QhSR/zuP7ifnitp2lkpfdugotjn
         K3S9tg5UrBokAcOlPsphlGQ318syhcTl+XHumHLyaKeJ6Y/NyLLgsdhX+mt0WPufaEnR
         jPx9l8jINDE3PHC0uir2gYnV9tRUgwjiw0muXHTJUthA+3yE1yWL7FL0oraCeH1+A+X5
         wV0+2WSItXrL9pyv9ymPEUbBca/GThoPMXIQNE2cdbxoWaoHpgWumZBGK+JUXckgn0/a
         l4ow==
X-Gm-Message-State: ANoB5pmxho80xcGwiEpbysXti1n2Gk1o3lE/qXF2vXnrt2F+5+tuKO7u
        bfI7dSW/qnDE779TR4NuqG1n
X-Google-Smtp-Source: AA0mqf5qwV+9J8LnONtnhS87nFvjDDrYZtHEZhALKTrBybGMxxtxzmYPR6tjK2XoOD+mdzhByqE7Dw==
X-Received: by 2002:aa7:978a:0:b0:576:e4c7:97bf with SMTP id o10-20020aa7978a000000b00576e4c797bfmr44100187pfp.15.1671459411844;
        Mon, 19 Dec 2022 06:16:51 -0800 (PST)
Received: from thinkpad ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id n8-20020aa79848000000b00575f348aa3esm6660329pfq.122.2022.12.19.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 06:16:50 -0800 (PST)
Date:   Mon, 19 Dec 2022 19:46:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        bp@alien8.de, tony.luck@intel.com, quic_saipraka@quicinc.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com
Subject: Re: [PATCH v2 00/13] Qcom: LLCC/EDAC: Fix base address used for LLCC
 banks
Message-ID: <20221219141643.GB126558@thinkpad>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
 <20221212192340.evgtbpzmw7hcdolb@halaney-x13s>
 <20221213052802.GB4862@thinkpad>
 <ec64e3a0-085d-7830-fd4e-6969c1c9bbdf@linaro.org>
 <20221213175738.GI4862@thinkpad>
 <195a55f1-76e7-3f00-da1f-4ae84f7943c0@linaro.org>
 <20221219135046.GA126558@thinkpad>
 <1df13a83-1926-05b5-f7c7-388ef431a2fa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1df13a83-1926-05b5-f7c7-388ef431a2fa@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 19, 2022 at 03:11:36PM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2022 14:50, Manivannan Sadhasivam wrote:
> > 
> >>> Also, the id table is
> >>> an overkill since there is only one driver that is making use of it. And
> >>> moreover, there is no definite ID to use.
> >>
> >> Every driver with a single device support has usually ID table and it's
> >> not a problem...
> >>
> > 
> > Are you referring to OF/ACPI ID table? Or something else?
> 
> No, I refer to the driver ID table (I2C, platform whatever the driver is).
> 

Yeah, that's what I wanted to avoid here. The ID table makes sense if you have
a bus like I2C or a separate subsystem but here LLCC is an individual driver.
So creating a separate ID table is an overkill IMO.

Thanks,
Mani

> Best regards,
> Krzysztof
> 

-- 
மணிவண்ணன் சதாசிவம்
