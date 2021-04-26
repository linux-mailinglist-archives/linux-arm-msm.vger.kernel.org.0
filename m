Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F4636BB22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 23:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbhDZVYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 17:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbhDZVYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 17:24:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C4BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:23:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 12so90184612lfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zgRKapaab2HZqCi9lAHTJV9Uu/bjuLvqkNzFbBHac9E=;
        b=t6HqA6FPJKw/XEBtb9FgSum555Vo6Ia1Zc71r9SSuirThXVhyFAxgK9aVVoTAe59WM
         LHR0VOeTjfCvnjWswaIGBCMdjQ6C+Fwdfqt1w+CT+fD2UMySUpFByXAYHGh/ImbwOe4o
         xi8tb0DlwfnfSVqMXqgGlP01GvxlkpFFAVoUzhujic9NYfQv2O4TgM16aTf/NUInHXRL
         mJaET9Scg/cvTLW2lFofzoQMoXF1IyM5wYVs7vmlIUmrkHmfGDHr4oVVvIfP5WhgNB+z
         hCFfdwsAXMYWw41E3mJEw9MTMMokkv6UFnfsO/Bbi0U87+V91XWsC9ueA/MAtsED6w5p
         Ipsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zgRKapaab2HZqCi9lAHTJV9Uu/bjuLvqkNzFbBHac9E=;
        b=i40vFhsNyV25AojxbEkzrgFtS+kf0cN5WN86obcDXI3R3O908CWqRkGBLAguOZ7600
         1iJB0exNom4WxWYhBHKHQTXZcI0Rs6dhaQPuzZb55iua5bV+dSIpesWSn1r80+OkErpX
         t5/U6HDsIEmkMKI0zfScOuUlqm5bkZPKzAZx1a3Hm0S2K6L8Jyr1Yg6mJchdlDaV6vem
         4RfbO9LedcH+5oDynWqRMTWfHMJpOvjSnrXr6tp/s0H9K35WhY/bWOWdMdXkKERAdnsq
         Lo1DCzDBGMqUDBqQYaWP3XlHYbinP8UXCUc43/SdnvuewL1THCuSpAB/G1aXG49lZYwd
         NVWg==
X-Gm-Message-State: AOAM530NxNkK/Q1OgxwFGyKQJZXf3OAj0JbRy0AXYRZa84tUu7HYrU/8
        iYu+Xf3sL3E5ktMuBmz2EIciVw==
X-Google-Smtp-Source: ABdhPJz5yjDNXpqSfyocPiVip01AYQEe48158FCvEtqVJGapbnaYNsx1JxOuq8NhLhCfcqyCQc+8TA==
X-Received: by 2002:a19:ca06:: with SMTP id a6mr14143674lfg.224.1619472206203;
        Mon, 26 Apr 2021 14:23:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s7sm126097ljg.31.2021.04.26.14.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 14:23:25 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/msm: make msm_disp_state transient data struct
To:     abhinavk@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org
References: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
 <20210425160800.1201337-3-dmitry.baryshkov@linaro.org>
 <30ed3860d33681e7904005265892f689@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a88fbf4c-aaa1-a144-dd08-0dd4890818bb@linaro.org>
Date:   Tue, 27 Apr 2021 00:23:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <30ed3860d33681e7904005265892f689@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2021 23:50, abhinavk@codeaurora.org wrote:
> On 2021-04-25 09:08, Dmitry Baryshkov wrote:
>> Instead of allocating snapshotting structure at the driver probe time
>> and later handling concurrent access, actual state, etc, make
>> msm_disp_state transient struct. Allocate one when snapshotting happens
>> and free it after coredump data is read by userspace.
> 
> the purpose of the mutex is that when there are two coredumps being 
> triggered
> by two consecutive errors, we want to make sure that till one coredump 
> is completely
> read and/or processed, we do not allow triggering of another one as we 
> want to capture
> the accurate hardware/software state.
> 
> So moving disp_state out of kms might be okay and just allocated it when 
> actually capturing the state
> but we will need the mutex and some sort of pending flag in my opinion.

I'll return the mutex to the kms struct, so that we won't start another 
snapshot untill previous one is complete.

Concerning the pending flag, I think it is also handled by the coredump 
code: dev_coredumpm() will not create another device if there is one 
already associated with the device being dumped. I should probably 
mention this in the commit message.

If you agree with this, I'll send v2 then (also adding plls dumping).

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 87 ++++---------------
>>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 13 +--
>>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  5 +-
>>  drivers/gpu/drm/msm/msm_kms.h                 |  5 +-
>>  4 files changed, 28 insertions(+), 82 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> index 70fd5a1fe13e..371358893716 100644
>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> @@ -7,8 +7,7 @@
>>
>>  #include "msm_disp_snapshot.h"
>>
>> -#ifdef CONFIG_DEV_COREDUMP
>> -static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
>> +static ssize_t __maybe_unused disp_devcoredump_read(char *buffer,
>> loff_t offset,
>>          size_t count, void *data, size_t datalen)
>>  {
>>      struct drm_print_iterator iter;
>> @@ -29,24 +28,21 @@ static ssize_t disp_devcoredump_read(char *buffer,
>> loff_t offset,
>>      return count - iter.remain;
>>  }
>>
>> -static void disp_devcoredump_free(void *data)
>> +static void _msm_disp_snapshot_work(struct kthread_work *work)
>>  {
>> +    struct msm_kms *msm_kms = container_of(work, struct msm_kms, 
>> dump_work);
>> +    struct drm_device *drm_dev = msm_kms->dev;
>>      struct msm_disp_state *disp_state;
>> +    struct drm_printer p;
>>
>> -    disp_state = data;
>> -
>> -    msm_disp_state_free(disp_state);
>> -
>> -    disp_state->coredump_pending = false;
>> -}
>> -#endif /* CONFIG_DEV_COREDUMP */
>> +    disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
>> +    if (!disp_state)
>> +        return;
>>
>> -static void _msm_disp_snapshot_work(struct kthread_work *work)
>> -{
>> -    struct msm_disp_state *disp_state = container_of(work, struct
>> msm_disp_state, dump_work);
>> -    struct drm_printer p;
>> +    disp_state->dev = drm_dev->dev;
>> +    disp_state->drm_dev = drm_dev;
>>
>> -    mutex_lock(&disp_state->mutex);
>> +    INIT_LIST_HEAD(&disp_state->blocks);
>>
>>      msm_disp_snapshot_capture_state(disp_state);
>>
>> @@ -55,26 +51,15 @@ static void _msm_disp_snapshot_work(struct
>> kthread_work *work)
>>          msm_disp_state_print(disp_state, &p);
>>      }
>>
>> -    /*
>> -     * if devcoredump is not defined free the state immediately
>> -     * otherwise it will be freed in the free handler.
>> -     */
>> -#ifdef CONFIG_DEV_COREDUMP
>> +    /* If COREDUMP is disabled, the stub will call the free function. */
> This is a good cleanup, I just checked that the free() is called even if 
> the config is not enabled
>>      dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0, 
>> GFP_KERNEL,
>> -            disp_devcoredump_read, disp_devcoredump_free);
>> -    disp_state->coredump_pending = true;
>> -#else
>> -    msm_disp_state_free(disp_state);
>> -#endif
>> -
>> -    mutex_unlock(&disp_state->mutex);
>> +            disp_devcoredump_read, msm_disp_state_free);
>>  }
>>
>>  void msm_disp_snapshot_state(struct drm_device *drm_dev)
>>  {
>>      struct msm_drm_private *priv;
>>      struct msm_kms *kms;
>> -    struct msm_disp_state *disp_state;
>>
>>      if (!drm_dev) {
>>          DRM_ERROR("invalid params\n");
>> @@ -83,30 +68,13 @@ void msm_disp_snapshot_state(struct drm_device 
>> *drm_dev)
>>
>>      priv = drm_dev->dev_private;
>>      kms = priv->kms;
>> -    disp_state = kms->disp_state;
>> -
>> -    if (!disp_state) {
>> -        DRM_ERROR("invalid params\n");
>> -        return;
>> -    }
>> -
>> -    /*
>> -     * if there is a coredump pending return immediately till dump
>> -     * if read by userspace or timeout happens
>> -     */
>> -    if (disp_state->coredump_pending) {
>> -        DRM_DEBUG("coredump is pending read\n");
>> -        return;
>> -    }
>>
>> -    kthread_queue_work(disp_state->dump_worker,
>> -            &disp_state->dump_work);
>> +    kthread_queue_work(kms->dump_worker, &kms->dump_work);
>>  }
>>
>>  int msm_disp_snapshot_init(struct drm_device *drm_dev)
>>  {
>>      struct msm_drm_private *priv;
>> -    struct msm_disp_state *disp_state;
>>      struct msm_kms *kms;
>>
>>      if (!drm_dev) {
>> @@ -117,22 +85,11 @@ int msm_disp_snapshot_init(struct drm_device 
>> *drm_dev)
>>      priv = drm_dev->dev_private;
>>      kms = priv->kms;
>>
>> -    disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct
>> msm_disp_state), GFP_KERNEL);
>> -
>> -    mutex_init(&disp_state->mutex);
>> -
>> -    disp_state->dev = drm_dev->dev;
>> -    disp_state->drm_dev = drm_dev;
>> -
>> -    INIT_LIST_HEAD(&disp_state->blocks);
>> -
>> -    disp_state->dump_worker = kthread_create_worker(0, "%s", 
>> "disp_snapshot");
>> -    if (IS_ERR(disp_state->dump_worker))
>> +    kms->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
>> +    if (IS_ERR(kms->dump_worker))
>>          DRM_ERROR("failed to create disp state task\n");
>>
>> -    kthread_init_work(&disp_state->dump_work, _msm_disp_snapshot_work);
>> -
>> -    kms->disp_state = disp_state;
>> +    kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
>>
>>      return 0;
>>  }
>> @@ -141,7 +98,6 @@ void msm_disp_snapshot_destroy(struct drm_device 
>> *drm_dev)
>>  {
>>      struct msm_kms *kms;
>>      struct msm_drm_private *priv;
>> -    struct msm_disp_state *disp_state;
>>
>>      if (!drm_dev) {
>>          DRM_ERROR("invalid params\n");
>> @@ -150,12 +106,7 @@ void msm_disp_snapshot_destroy(struct drm_device 
>> *drm_dev)
>>
>>      priv = drm_dev->dev_private;
>>      kms = priv->kms;
>> -    disp_state = kms->disp_state;
>> -
>> -    if (disp_state->dump_worker)
>> -        kthread_destroy_worker(disp_state->dump_worker);
>> -
>> -    list_del(&disp_state->blocks);
>>
>> -    mutex_destroy(&disp_state->mutex);
>> +    if (kms->dump_worker)
>> +        kthread_destroy_worker(kms->dump_worker);
>>  }
>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> index 32f52799a1ba..c6174a366095 100644
>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> @@ -41,26 +41,17 @@
>>   * struct msm_disp_state - structure to store current dpu state
>>   * @dev: device pointer
>>   * @drm_dev: drm device pointer
>> - * @mutex: mutex to serialize access to serialze dumps, debugfs access
>> - * @coredump_pending: coredump is pending read from userspace
>>   * @atomic_state: atomic state duplicated at the time of the error
>> - * @dump_worker: kworker thread which runs the dump work
>> - * @dump_work: kwork which dumps the registers and drm state
>>   * @timestamp: timestamp at which the coredump was captured
>>   */
>>  struct msm_disp_state {
>>      struct device *dev;
>>      struct drm_device *drm_dev;
>> -    struct mutex mutex;
>> -
>> -    bool coredump_pending;
>>
>>      struct list_head blocks;
>>
>>      struct drm_atomic_state *atomic_state;
>>
>> -    struct kthread_worker *dump_worker;
>> -    struct kthread_work dump_work;
>>      ktime_t timestamp;
>>  };
>>
>> @@ -123,11 +114,11 @@ void msm_disp_snapshot_capture_state(struct
>> msm_disp_state *disp_state);
>>
>>  /**
>>   * msm_disp_state_free - free the memory after the coredump has been 
>> read
>> - * @disp_state:        handle to struct msm_disp_state
>> + * @data:        handle to struct msm_disp_state
>>
>>   * Returns: none
>>   */
>> -void msm_disp_state_free(struct msm_disp_state *disp_state);
>> +void msm_disp_state_free(void *data);
>>
>>  /**
>>   * msm_disp_snapshot_add_block - add a hardware block with its 
>> register dump
>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> index ca6632550337..cabe15190ec1 100644
>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> @@ -142,8 +142,9 @@ void msm_disp_snapshot_capture_state(struct
>> msm_disp_state *disp_state)
>>      msm_disp_capture_atomic_state(disp_state);
>>  }
>>
>> -void msm_disp_state_free(struct msm_disp_state *disp_state)
>> +void msm_disp_state_free(void *data)
>>  {
>> +    struct msm_disp_state *disp_state = data;
>>      struct msm_disp_state_block *block, *tmp;
>>
>>      if (disp_state->atomic_state) {
>> @@ -156,6 +157,8 @@ void msm_disp_state_free(struct msm_disp_state 
>> *disp_state)
>>          kfree(block->state);
>>          kfree(block);
>>      }
>> +
>> +    kfree(disp_state);
>>  }
>>
>>  void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, 
>> u32 len,
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
>> b/drivers/gpu/drm/msm/msm_kms.h
>> index 146dcab123f4..529b9dacf7ca 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -156,8 +156,9 @@ struct msm_kms {
>>      /* mapper-id used to request GEM buffer mapped for scanout: */
>>      struct msm_gem_address_space *aspace;
>>
>> -    /* handle to disp snapshot state */
>> -    struct msm_disp_state *disp_state;
>> +    /* disp snapshot support */
>> +    struct kthread_worker *dump_worker;
>> +    struct kthread_work dump_work;
>>
>>      /*
>>       * For async commit, where ->flush_commit() and later happens


-- 
With best wishes
Dmitry
