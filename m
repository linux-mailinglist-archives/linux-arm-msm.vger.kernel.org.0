Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38145F1C58
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 15:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiJANgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 09:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJANgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 09:36:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF20F61DB2
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 06:35:57 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id q14so3995560lfo.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=CG8R/L4pPWym3ANx8yZmnov0YG/TUNdQM5EA24rS0E4=;
        b=N9J0yu8iM/3JtfDrLUqQ7eLX+G46XOkk9eo7UzHX5O/dCngza/nNFP6sKRwKRegMck
         m+zUfXZ1UWd5SQPtZCLuUxS+cnJshjHAenZsqrdRkoE+DM60rl+XEPSi4WSMddAGtzmi
         YAH8a87oMDq8yZwcVCt87/7+G6EqZ0HaZFCyY0utpKzvKwtg7YiezDQSSSQ69nNUPlyU
         18Cq7UWSYds2OkpFofvAfX9fFTnAaU+Al36tPqeZbyPOZIChMytX/DHDTeb/bo6n+dXl
         hi4WbxCUNmgsCtGiSfupJqBuxN5nUwF0Z3sn1SB5mD3yRhI3H7OjR9qv4Lt/2Zfehsm8
         NMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=CG8R/L4pPWym3ANx8yZmnov0YG/TUNdQM5EA24rS0E4=;
        b=7BCLzG9PNmgjh7ZYm2iq8xEmKuw7erTAyticdoYkdvVB4PyS8DbgnHbBgWG/pQISRv
         /2v46/uNz1ImosbTgDg1IwXnffDn7a40gr+ZZZvRuTtN1eUpD6F+CfYr8IpaWPMlw4ud
         IubCnjSHv7Axw9yiObLq4saALCne5MRRxdCsmpX/QHuIKWFN9YIdGjY7gl2bJ6xGQ9U5
         0fmcLVqbQQETPBvaaOLR6gXGiFRz3AEqXCEW6A364gfi7bMOX+OPY2zBBRD9ThWNEu50
         3YdTj74PSYvEe523EwKT98s2V8q7wVaIKohSe3BeLtuyz/k2LcMa6IYk36WvzOate/7G
         ENwA==
X-Gm-Message-State: ACrzQf1cNApJLnrMx2fq/Ueil/w/hMZBHxg4NVuY5wkm47+f+8ZTSEqH
        CY3WEwjg6/UnPicHI44F6XDZhQ==
X-Google-Smtp-Source: AMsMyM6tNn6Klrg0MZ813hnxa860FCdvafuOX5sG75uoogp4vuSYjUvohonmolvNEZP3W0ujEByI9g==
X-Received: by 2002:a05:6512:31d1:b0:499:fa38:3d7b with SMTP id j17-20020a05651231d100b00499fa383d7bmr4763301lfe.544.1664631356000;
        Sat, 01 Oct 2022 06:35:56 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.124])
        by smtp.gmail.com with ESMTPSA id q9-20020a0565123a8900b004994c190581sm761096lfu.123.2022.10.01.06.35.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Oct 2022 06:35:55 -0700 (PDT)
Date:   Fri, 30 Sep 2022 11:29:17 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Doug Anderson <dianders@chromium.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>
CC:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5Bv5=5D_drm/msm/disp/dpu1=3A_add_suppo?= =?US-ASCII?Q?rt_for_dspp_sub_block_flush_in_sc7280?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com> <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Message-ID: <59745151-7A97-4640-A8A2-5D06ABE1FBF4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_24_48,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29 September 2022 19:13:20 GMT+03:00, Doug Anderson <dianders@chromium=
=2Eorg> wrote:
>Hi,
>
>On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc=2Ecom>=
 wrote:
>>
>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
>> allows individual sub blocks to be flushed in coordination with
>> master flush control=2E
>>
>> Representation: master_flush && (PCC_flush | IGC_flush =2E=2E etc )
>>
>> This change adds necessary support for the above design=2E
>>
>> Changes in v1:
>> - Few nits (Doug, Dmitry)
>> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>>
>> Changes in v2:
>> - Move the address offset to flush macro (Dmitry)
>> - Seperate ops for the sub block flush (Dmitry)
>>
>> Changes in v3:
>> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>>
>> Changes in v4:
>> - Use shorter version for unsigned int (Stephen)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec       |  2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Ec |  5 +++-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh |  4 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec     | 35 ++++++++++++++++=
++++++++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh     | 10 ++++++--
>>  5 files changed, 50 insertions(+), 6 deletions(-)
>
>Breadcrumbs: though this is tagged in the subject as v5 I think the
>newest version is actually "resend v4" [1] which just fixes the
>Signed-off-by=2E

Not to mention that v5 misses the S-o-B tag=2E

>
>[1] https://lore=2Ekernel=2Eorg/r/1663825463-6715-1-git-send-email-quic_k=
alyant@quicinc=2Ecom

--=20
With best wishes
Dmitry
