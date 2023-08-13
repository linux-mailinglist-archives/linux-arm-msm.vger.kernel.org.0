Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51D477A481
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Aug 2023 03:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjHMBOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Aug 2023 21:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHMBOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Aug 2023 21:14:55 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7F9127;
        Sat, 12 Aug 2023 18:14:58 -0700 (PDT)
Received: from [192.168.2.249] (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F222866071B8;
        Sun, 13 Aug 2023 02:14:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1691889295;
        bh=bPp/hkEoDS0ZxAQiv7IPH0ePMv+YAdVNwR7xflkKTfA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=Uz8KDonPc/gBgbinrFzsCdc6rgNcwCbXiIogKVRXysqJJtxOGqNEF2OUOR+rVnrXd
         VwOSU59ZkqE9I2R9CNOpO28dhmbVc2RZcZcaxEONC0OAH+wxz6POH8Rza1irhAgWQX
         3jNxUqWp9qemwwuadE6DSax0voEzK6ad/MwWNwyqoUmdMClJ0GuN+GntG6o/Y2+G20
         US0ec6J00OLr7/jjIhU8IlmjV5yvwReELAfpnaFBKL055tF1xHd83m+Q1gCsxqJfu1
         GvuSjjhWUWtbQvALG3p1XUa66zNV9izcGryYx+W8Bq2+CW9UGz0xQnSZk7uepiAzPw
         5WLxzXW8kcnpw==
Message-ID: <325014e7-cb8d-54e0-eead-7727c8ec2f07@collabora.com>
Date:   Sun, 13 Aug 2023 04:14:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 5/7] drm/virtio: Remove an unnecessary NULL value
Content-Language: en-US
To:     Ruan Jinjie <ruanjinjie@huawei.com>, Felix.Kuehling@amd.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        harry.wentland@amd.com, sunpeng.li@amd.com,
        Rodrigo.Siqueira@amd.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
        gurchetansingh@chromium.org, olvaffe@gmail.com,
        paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
        haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
        george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
        jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
        aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com,
        jiasheng@iscas.ac.cn, noralf@tronnes.org,
        jose.exposito89@gmail.com, javierm@redhat.com,
        mairacanal@riseup.net, davidgow@google.com,
        arthurgrillo@riseup.net, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
 <20230809034445.434902-6-ruanjinjie@huawei.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230809034445.434902-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/9/23 06:44, Ruan Jinjie wrote:
> The NULL initialization of the pointer assigned by kzalloc() first is
> not necessary, because if the kzalloc() failed, the pointer will be
> assigned NULL, otherwise it works as usual. so remove it.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
> index 3c00135ead45..82563dbec2ab 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -274,7 +274,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>  					 struct virtio_gpu_fence *fence,
>  					 u32 ring_idx)
>  {
> -	struct virtio_gpu_fence_event *e = NULL;
> +	struct virtio_gpu_fence_event *e;
>  	int ret;
>  
>  	e = kzalloc(sizeof(*e), GFP_KERNEL);

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

