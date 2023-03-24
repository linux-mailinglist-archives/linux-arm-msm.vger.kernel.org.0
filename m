Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B416C7C5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 11:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCXKQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 06:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjCXKQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 06:16:56 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35D6136CA;
        Fri, 24 Mar 2023 03:16:53 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id w4so1373571plg.9;
        Fri, 24 Mar 2023 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679653013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cziNVzlXnH/lQ5/2+kk4lE5zj/E0WdazVGv7S5DQupA=;
        b=gTEL50fHUNYCxyR9k0EUrOvJ2iQIIrNX9VfBcWP3z4ptBVNbW5Nd9A86DS0Vb3dttt
         ewdQvub3VD1E6ncz+SHjbR/s8R2qUsjLwNgvNmn1JtngdW9XXXIcUCHoQ9CGBw+AtS+H
         fM1rnPkKB5dEDEDJcvMgLtcJ/nQFTFMlFYO8OF0XHR9eC8/P2IA+mVTEGjFctetHVuzt
         S9zn9acZDNxucgjfKSXkDLYH+kESmUQ02extsU+kzVfd+0Cf7Yggrrf9kLVKbyLN7YTE
         LgkVsPPXXkpk2qgQ/LSqEvyEHg7U0q6G+AC330vFT6fLD37s58lT5v69Qt7Tja6Y2FET
         wb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679653013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cziNVzlXnH/lQ5/2+kk4lE5zj/E0WdazVGv7S5DQupA=;
        b=2hY1S0X9Ui3Ds9OzxQ6E4HzAdb74xJU5Hr7zNpwyN2AIO2zMbAkv4tkUvvnzq60MpU
         Mk+XluudfxBclCvn62vn10P7IdbIePv0whm0BqlO7wIM9xnrpjHpzPrADRNhVu1dTICc
         YebMBvsSwUZRv5ihRK1jdzuzC+JDZjTwXYsn76Fh7cVPSwnv6f/wc1yGKPRS+QnRwb/Y
         YZh2kGWvySSyv7ED1hPyIq1kVhzV/ia68hb+vCvRekikiSbAVhnKa7g2Qgj2FaJ5HKZv
         GrI+uvdwFh2471f3PKNan+0N80cDhoFmig59SSNbzBWRoA75fOp2+Gw+Y3RVwGMQW7VC
         DC/Q==
X-Gm-Message-State: AO0yUKWLbO0nQGBg4plM8uMJplHC7hvi3/gb2WHATVHMWp2fnTaQEZng
        qpbcve8bDsdQS3Qaxu17ENbhIgfEq8d+Ww==
X-Google-Smtp-Source: AK7set9lTERL34FBRNIipit8w0qwmE6L0+mhtwG5LjWIAuHRB7gMRSprRagWnvLHUtpKuQUYtMLfrg==
X-Received: by 2002:a05:6a20:8ee2:b0:d7:47e8:59bd with SMTP id m34-20020a056a208ee200b000d747e859bdmr2012753pzk.60.1679653013059;
        Fri, 24 Mar 2023 03:16:53 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id d2-20020a639742000000b00502e7115cbdsm10413239pgo.51.2023.03.24.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 03:16:52 -0700 (PDT)
Date:   Fri, 24 Mar 2023 18:16:44 +0800
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
Message-ID: <ZB14jJNUhHGBl7Az@Gentoo>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo>
 <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
 <ZBzyK0ILtUDr986r@Gentoo>
 <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
 <ZBz5OvauxQ2PWcHu@Gentoo>
 <40503ba8-7a38-0d1d-1d59-82101a0ce92e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40503ba8-7a38-0d1d-1d59-82101a0ce92e@linaro.org>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 02:37:15AM +0000, Bryan O'Donoghue wrote:
> On 24/03/2023 01:13, Jianhua Lu wrote:
> >> Can you show the printout of *(pmic_typec->base + TYPEC_SM_STATUS_REG) ?
> 
> [   17.108819] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
> qcom_pmic_typec_port_set_vbus misc 0x000000cb
> 
> [   17.118659] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
> qcom_pmic_typec_port_set_vbus sm_status 0x000000b9
> 
> SM_STAT == 0xb9 => 10111001
When I connect my device to a usb hub with external power supply, it show

[ 1495.622026] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
get_cc: misc 0x000000c9 cc1 0x00000002 Rd cc2 0x00000000 Open attached 1 cc=cc2
[ 1495.622383] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
get_cc: misc 0x000000c9 cc1 0x00000002 Rd cc2 0x00000000 Open attached 1 cc=cc2
[ 1495.824637] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_set_vbus sm_stat output 0x000000b9
[ 1495.824667] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_set_vbus misc 0x000000c9
[ 1495.824685] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_set_vbus sm_status 0x000000b9
[ 1495.824739] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
set_cc: currsrc=1 Rp-1.5-180uA mode EN_SRC_ONLY debounce 1 attached 1 cc=cc2
[ 1495.829001] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: Debounce cc complete

I think my device's pm8150b is connected to charger pump but this charger
driver hasn't been implement, so can't detect pm8150b_vbus.
> 
> In other words, my hardware gives a clear indication of the appropriate 
> transition.
> 
> Would appreciate if you could apply the above "patch"
> 
> That said I _am_ included to believe you and to do something about it, I 
> will downgrade to a warning instead of returning on error in failure to 
> transition to VSafeVX
Your patch is correct. Making it warning let other devices' type-c work normally.
I agree with your idea.
> 
> Yeah though I'd appreciate seeing the output of the above patch to see 
> if there's something we are missing.
> 
> Thanks for your review/time/input
> 
> ---
> bod
