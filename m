Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAFB6C80BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 16:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjCXPJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 11:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjCXPJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 11:09:38 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6CAB476;
        Fri, 24 Mar 2023 08:09:37 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso5975392pjf.0;
        Fri, 24 Mar 2023 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5i2HJ5gQdpf3meIzhPtG5gcbljUi9sT3i45KJjgXMv4=;
        b=m3KvAoqWB+vwLpR6xfgLBQNzEepRFUa0DIUzrsC2qgMYgvP8dU3674kU+nHYb1EmLX
         KKNNOPYOIe3ULHrgBVwb7UsUFycbVYTC8/+VVl9pz6ti/VSv+nACk8g79GXRM/uQESz5
         FKadgrMmMYNwzoG67LLunxF4ifHX2d2jnVZrFPfZx3V1W7yAPDnHHp1VLt9zNNe5q4Mr
         EsV1ELBZfn5HcpSy/CkKKmCkJ/BJ+QOHo8EZh2j6w23SlhQhGXxTW5ULI16HGSeC5g2M
         AvfCWJ7eV1niNeoowMyHXsNxcKHim6f8SCQcJyk8yPJ/ma4Pb4Ey2TKc6Qm3ivL6DQ6O
         x+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i2HJ5gQdpf3meIzhPtG5gcbljUi9sT3i45KJjgXMv4=;
        b=ToKOzhku51vbUgAuXhjwU6NTse2QPg9MOFBJhz/GJVK0j0aXnxjSYMnZ4OFpuZHqm0
         y6sKgiGamdMlQMxEhtosiz08YBm3FHRjB4BFIcwwv+yDnhro3y+8+3ZJqszGUZLYUBBh
         7ARPmLVHqKAWYXeGv49tvPj8FlgFDF1QS5TNEjX1Ol0TKU/RzeFWqFxJlA+9CIFOXaTv
         rgExTcw7WVZOObBtsjrV56713PY2No0bU3OnEFZJS3dPrkrIjBYWjiJNxJN9ijvGtrax
         wkZAxrURtrxTIyl9G0QDqlXVdg605hm4S7XkRmCd1LpsPcXRMZDj2Wnlw1Pc9Il48HhW
         3crw==
X-Gm-Message-State: AAQBX9dGQLysNfMAd9jxhV8wtZPZ50KsQAeRnSsRZOT2la/6fHTh+rIp
        cZD/vQvq3ZkPy8+iTEDORvI=
X-Google-Smtp-Source: AKy350Zt7RqUG0LqiuhDlzZm0dTtNhX4P9zCvM711mtiljVmDqi8ynj5aMTkWm+uvep/exuX71e/nQ==
X-Received: by 2002:a17:902:ceca:b0:1a1:7b8d:6719 with SMTP id d10-20020a170902ceca00b001a17b8d6719mr2929803plg.27.1679670576938;
        Fri, 24 Mar 2023 08:09:36 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902c1cd00b0019aa8149cc9sm14336048plc.35.2023.03.24.08.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:09:36 -0700 (PDT)
Date:   Fri, 24 Mar 2023 23:09:27 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Message-ID: <ZB29J/7LI4PREmn6@Gentoo>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo>
 <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
 <ZBzyK0ILtUDr986r@Gentoo>
 <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
 <ZBz5OvauxQ2PWcHu@Gentoo>
 <40503ba8-7a38-0d1d-1d59-82101a0ce92e@linaro.org>
 <ZB14jJNUhHGBl7Az@Gentoo>
 <6bd08120-115e-5429-63da-32f8df52bc7f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bd08120-115e-5429-63da-32f8df52bc7f@linaro.org>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 01:25:14PM +0000, Bryan O'Donoghue wrote:
> On 24/03/2023 10:16, Jianhua Lu wrote:
> 
> so that is correct and expected i.e. VSAFE5V it shouldn't matter to the 
> type-c port controller *where* VBUS comes from only that it is within range.
> 
> Could you run again with an unpowered device and post the printout?
Here is output when plugin usb-c device without power supply:

[   45.714005] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: vbus vsafe5v fail
[   45.714024] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_set_vbus sm_stat output 0x00000099
[   45.714043] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_set_vbus misc 0x000000c9
[   45.714060] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500:
qcom_pmic_typec_set_vbus sm_status 0x00000099
[   45.714185] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500:
set_cc: currsrc=1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=cc2
[   45.719505] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc complete
> 
I get schematics of same vendor's similar device, it shows usb vbus is
connected to charger pump. It can be the main reason that can't detect vbus, but
I don't know why type-c can work normally.
> ---
> bod
