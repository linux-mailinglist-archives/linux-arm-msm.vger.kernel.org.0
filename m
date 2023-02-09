Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0CD6913BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 23:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjBIWtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 17:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbjBIWtQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 17:49:16 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEFB34C39
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 14:49:14 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id q4so4275036ybu.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 14:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pUqNSlGZp2G1uk72QvMP5WQEMdZZq38Hr1IYdmnxGyM=;
        b=BGzJYAEvtJdfi7Ppgd0ar/PHG88ngT61aPoFAnhq1dHVaRv6A8riryWfMq7DGlegj9
         TEhg+c82DlHcUa5IBH5J1MfMKMnq/BoBC+nUBIIsK40FQwNEzQ0jGBuvgQHtoGPFLI0r
         t/D7NkFH/yFsnx2kfJzfkFYZKlUMflfSe7EESerwcebDu2vIafEojDVWAoIOAarrehXb
         bxf9uqA8TQBSOGKnaep2nYWBTbLiVxwqVEuYMhobIRnkk5FWOt5W5mBDPPqFCtEQcX2h
         E31tdCa4g4OfSspj/11YT90vmPo7gCsMmzaJVspwi3wHHpuAVheOPhWsRBCYLIvVhvuS
         1mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUqNSlGZp2G1uk72QvMP5WQEMdZZq38Hr1IYdmnxGyM=;
        b=B/b9OGv+csSFIbSLB+b8trsJqooMhfTn6tn9tIYuiN9X07FgGej/QwRM6uGL712cbz
         Oh9VBS0QAkL1vAQE7WKheihoXKDByAb9q1bbrpG1l3uUYao6nYzZFmvGBLhFZoKmoKuy
         MgpuE+bhyiGDdH0v9GgFRjisGpEDx33GZlsbU1HYGSZzMssX2cbBF7Kv60EfY40476KF
         Ivg9VhyRLnPq7EA+bzX3KVt3Hy7+yZBD34bK7O2yfpV1BD9l3T3mHpY1ROPrz/dH6JDS
         FpPFYKp72GZkpLEUEyDSr9oUtG1F55PzLXkPavQXpfOMvL4ZsKEeQf380PqYfLftbX0d
         oQ7g==
X-Gm-Message-State: AO0yUKVnKl7x0wrPnJBZE20Vxo4vKS7l11f/oLG0IhpkkwFM5FhgPMk7
        BiSk/inXRVX+VSTy3ex3Gq5Pxhobb161kTP6+6eXMw==
X-Google-Smtp-Source: AK7set9YkasVgZpbScghZmn6XGLN6IIDP7d9JQM5S//GjGt2Qcr+UMuENSTUA4qVCFmjRsxrN4oXXTahpIbadOBSk9o=
X-Received: by 2002:a25:747:0:b0:885:47a5:7b7 with SMTP id 68-20020a250747000000b0088547a507b7mr1236412ybh.153.1675982953178;
 Thu, 09 Feb 2023 14:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-2-quic_jesszhan@quicinc.com> <4d11cb36-96eb-36ac-e86e-7a0947e4bdcf@linaro.org>
 <92e4a669-1312-63ba-21ef-db73d38be3c7@quicinc.com>
In-Reply-To: <92e4a669-1312-63ba-21ef-db73d38be3c7@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 10 Feb 2023 00:49:02 +0200
Message-ID: <CAA8EJpqxwrDxZr8vAr-Dj3xhawEM7PXb5pdd9X-eKYbW4v0pwg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Feb 2023 at 00:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 2/9/2023 10:51 AM, Dmitry Baryshkov wrote:
> > On 09/02/2023 20:44, Jessica Zhang wrote:
> >> Currently, DPU will enable TE during prepare_commit(). However, this
> >> will cause issues when trying to read/write to register in
> >> get_autorefresh_config(), because the core clock rates aren't set at
> >> that time.
> >>
> >> This used to work because phys_enc->hw_pp is only initialized in mode
> >> set [1], so the first prepare_commit() will return before any register
> >> read/write as hw_pp would be NULL.
> >>
> >> However, when we try to implement support for INTF TE, we will run into
> >> the clock issue described above as hw_intf will *not* be NULL on the
> >> first prepare_commit(). This is because the initialization of
> >> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
> >>
> >> To avoid this issue, let's enable TE during prepare_for_kickoff()
> >> instead as the core clock rates are guaranteed to be set then.
> >>
> >> Depends on: "Implement tearcheck support on INTF block" [3]
> >>
> >> [1]
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> >> [2]
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> >> [3] https://patchwork.freedesktop.org/series/112332/
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
> >>   1 file changed, 43 insertions(+), 35 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> index cb05036f2916..561406d92a1a 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> @@ -583,39 +583,6 @@ static void dpu_encoder_phys_cmd_destroy(struct
> >> dpu_encoder_phys *phys_enc)
> >>       kfree(cmd_enc);
> >>   }
> >> -static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> >> -        struct dpu_encoder_phys *phys_enc)
> >> -{
> >> -    struct dpu_encoder_phys_cmd *cmd_enc =
> >> -            to_dpu_encoder_phys_cmd(phys_enc);
> >> -    int ret;
> >> -
> >> -    if (!phys_enc->hw_pp) {
> >> -        DPU_ERROR("invalid encoder\n");
> >> -        return;
> >> -    }
> >> -    DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n",
> >> DRMID(phys_enc->parent),
> >> -              phys_enc->hw_pp->idx - PINGPONG_0,
> >> -              atomic_read(&phys_enc->pending_kickoff_cnt));
> >> -
> >> -    /*
> >> -     * Mark kickoff request as outstanding. If there are more than one,
> >> -     * outstanding, then we have to wait for the previous one to
> >> complete
> >> -     */
> >> -    ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> >> -    if (ret) {
> >> -        /* force pending_kickoff_cnt 0 to discard failed kickoff */
> >> -        atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> >> -        DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> >> -              DRMID(phys_enc->parent), ret,
> >> -              phys_enc->hw_pp->idx - PINGPONG_0);
> >> -    }
> >> -
> >> -    DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> >> -            phys_enc->hw_pp->idx - PINGPONG_0,
> >> -            atomic_read(&phys_enc->pending_kickoff_cnt));
> >> -}
> >> -
> >>   static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
> >>           struct dpu_encoder_phys *phys_enc)
> >>   {
> >> @@ -641,8 +608,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
> >>       return false;
> >>   }
> >> -static void dpu_encoder_phys_cmd_prepare_commit(
> >> -        struct dpu_encoder_phys *phys_enc)
> >> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys
> >> *phys_enc)
> >>   {
> >>       struct dpu_encoder_phys_cmd *cmd_enc =
> >>           to_dpu_encoder_phys_cmd(phys_enc);
> >> @@ -700,6 +666,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
> >>                "disabled autorefresh\n");
> >>   }
> >> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> >> +        struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +    struct dpu_encoder_phys_cmd *cmd_enc =
> >> +            to_dpu_encoder_phys_cmd(phys_enc);
> >> +    int ret;
> >> +
> >> +    if (!phys_enc->hw_pp) {
> >> +        DPU_ERROR("invalid encoder\n");
> >> +        return;
> >> +    }
> >> +
> >> +
> >> +    DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n",
> >> DRMID(phys_enc->parent),
> >> +              phys_enc->hw_pp->idx - PINGPONG_0,
> >> +              atomic_read(&phys_enc->pending_kickoff_cnt));
> >> +
> >> +    /*
> >> +     * Mark kickoff request as outstanding. If there are more than one,
> >> +     * outstanding, then we have to wait for the previous one to
> >> complete
> >> +     */
> >> +    ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> >> +    if (ret) {
> >> +        /* force pending_kickoff_cnt 0 to discard failed kickoff */
> >> +        atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> >> +        DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> >> +              DRMID(phys_enc->parent), ret,
> >> +              phys_enc->hw_pp->idx - PINGPONG_0);
> >> +    }
> >> +
> >> +    dpu_encoder_phys_cmd_enable_te(phys_enc);
> >> +
> >> +    DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> >> +            phys_enc->hw_pp->idx - PINGPONG_0,
> >> +            atomic_read(&phys_enc->pending_kickoff_cnt));
> >> +}
> >
> > Quoting v1:
> >
> > Could you please move the function back to the place, so that we can see
> > the actual difference?
>
> Hi Dmitry,
>
> Sorry if I missed your reply to my reply in V1, but as stated in the V1
> patch: the reason the diff looks like this is because
> prepare_for_kickoff() is defined above where the prepare_commit() and
> is_ongoing_pptx() were originally defined. So I had to move both
> function definitions to above the prepare_for_kickoff() function for the
> patch to compile.

You can add a function prototype in front of
dpu_encoder_phys_cmd_prepare_for_kickoff().

>
> That being said, I'm open to any suggestions for making this patch more
> legible.
>
> >
> >> +
> >> +static void dpu_encoder_phys_cmd_prepare_commit(
> >> +        struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +}
> >
> > This is not necessary and can be dropped. There is a safety check in
> > dpu_encoder_prepare_commit().
>
> Acked.
>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +
> >>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
> >>           struct dpu_encoder_phys *phys_enc)
> >>   {
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
