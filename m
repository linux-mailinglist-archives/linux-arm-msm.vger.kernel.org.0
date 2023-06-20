Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C574F736AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbjFTLSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjFTLSn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:18:43 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F46C4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:18:42 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-57023c9be80so47956787b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687259921; x=1689851921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pur1jXE5W/6rmxi5j9JRnl95BFEuYCNLXHO4SrVb4YQ=;
        b=CSlXRn6qVy4MRXyXRov0FIfB9Qauu/skSw27CZfaB0TXq4hLHKKmy6eopFcx0WOoYQ
         coQXBsL4D62rXCZwNeO26+YxOeQlX1juWy83sEZ+fjXPuw11zlwvaiuK807W56lAClPa
         BXzcK1OWca9//RREtR7g4t+LOgvslPNIOG9O+TfPi4N1wX0a6epomLcBMgfaF3Gt7TuZ
         HZc25N2VOddqzQfloabHVREWe3azkM6lZvSc2Sfxs1+YK4lUrspbo1pYdTBn2i+22wmB
         hek1hcdKaGDlRQDY2srmMRO13sDmznodWZbKdehw0a6s8/OyYSBMr3RCs5qPy+8kMovg
         9j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687259921; x=1689851921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pur1jXE5W/6rmxi5j9JRnl95BFEuYCNLXHO4SrVb4YQ=;
        b=ZvAo6In4i2cfS9VPQq9SmXNOYG2UplGI5pXx/sEqgT1TfrnhHPvAnmIGyA5lOAgbnn
         ondOLdiaNU+OrCmjlOP3BmcGOTj38aHPA+vUCPzsJU05ZQ754ikskzys0ZFLAi3C/2NU
         wbU3etb+AQMzSfPV0prp9iriQTVPs78+Hcz/fcqSSXOh/bUqJHLO111QBaGkoKws9eJT
         pG4MXZHWRMrWgZGrAmWqPdqYS65RVTFhvQEMdlANifXlVOtCO7q0YbhiRcNqpxBa73MH
         atFESRs8vJBT+xCIxj4+NsbYT1vljsBUA/vPCf8pDZ3YgHB4tqPE3Uw8LSiXHwgwG8At
         2zYg==
X-Gm-Message-State: AC+VfDzjLf5rIvfV3jit+MyqhccqYjU80TdmO1mmIm3Dq/tj0lWr3qNb
        M685oTh5wLXVTnXgPDRGMiwd+Gh1xQcjHcbNt9w05Q==
X-Google-Smtp-Source: ACHHUZ4du7Ti9OxiHAAEVUiPO8uQCjpSE8B12g+KVIwq1GBX5WwJBOVHI07GaNYWPpVD6Oc6fhjEXfFGC9sdmpVcVtc=
X-Received: by 2002:a25:868b:0:b0:bf5:3c03:25f3 with SMTP id
 z11-20020a25868b000000b00bf53c0325f3mr3233248ybk.63.1687259921617; Tue, 20
 Jun 2023 04:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-7-dmitry.baryshkov@linaro.org> <bc192a59-f8a1-2786-670c-cd56737dfdba@linaro.org>
In-Reply-To: <bc192a59-f8a1-2786-670c-cd56737dfdba@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 20 Jun 2023 14:18:30 +0300
Message-ID: <CAA8EJpo6KVnQO-K8ftyaSe+xyN6-RC_QNXfx5v890=S10jExNQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2023 13:55, Konrad Dybcio wrote:
> On 20.06.2023 02:08, Dmitry Baryshkov wrote:
>> Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
>> full-featured catalog data.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Check below.
>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 52 ++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
>>   3 files changed, 27 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 773e641eab28..78a7e3ea27a4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -19,11 +19,11 @@
>>
>>   /**
>>    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>> - * @kms:  pointer to the dpu_kms
>> + * @perf_cfg: performance configuration
>>    * @crtc: pointer to a crtc
>>    * Return: returns aggregated BW for all planes in crtc.
>>    */
>> -static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>> +static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
>>              struct drm_crtc *crtc)
>>   {
>>      struct drm_plane *plane;
>> @@ -39,7 +39,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>>              crtc_plane_bw += pstate->plane_fetch_bw;
>>      }
>>
>> -    bw_factor = kms->catalog->perf->bw_inefficiency_factor;
>> +    bw_factor = perf_cfg->bw_inefficiency_factor;
> It's set to 120 for all SoCs.. and it sounds very much like some kind of a
> hack.
>
> The 105 on the other inefficiency factor is easy to spot:
>
> (1024/1000)^2 = 1.048576 =~= 1.05 = 105%
>
> It comes from a MiB-MB-MHz conversion that Qcom splattered all over
> downstream as due to ancient tragical design decisions in msmbus
> (which leak to the downstream interconnect a bit):

This doesn't describe, why msm8226 and msm8974 had qcom,mdss-clk-factor
of 5/4. And 8084 got 1.05 as usual. I can only suppose that MDSS 1.0
(8974 v1) and 1.1 (8226) had some internal inefficiency / issues.

Also, this 1.05 is a clock inefficiency, so it should not be related
to msm bus client code.

>
> The logic needs to get some input that corresponds to a clock rate
> of a bus clock (19.2, 200, 300 Mhz etc.) but the APIs expect a Kbps
> value. So at one point they invented a MHZ_TO_MBPS macro which did this
> conversion the other way around and probably had to account for it.
>
> I think they tried to make it make more sense, but it ended up being
> even more spaghetti :/
>
> Not yet sure how it's done on RPMh icc, but with SMD RPM, passing e.g.
>
> opp-peak-kBps = <(200 * 8 * 1000)>; # 200 MHz * 8-wide * KHz-to-MHz
>
> results in a "correct" end rate.
>
> Konrad
>>      if (bw_factor) {
>>              crtc_plane_bw *= bw_factor;
>>              do_div(crtc_plane_bw, 100);


--
With best wishes
Dmitry
