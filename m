Return-Path: <linux-arm-msm+bounces-4246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58C80D354
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3881E281ADE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCCA48CF0;
	Mon, 11 Dec 2023 17:11:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 535 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Dec 2023 09:11:41 PST
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21FDB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:11:41 -0800 (PST)
Received: from [192.168.36.128] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl [178.235.179.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 71EBA200B9;
	Mon, 11 Dec 2023 18:02:38 +0100 (CET)
Message-ID: <31fe9930-ea18-458e-8e13-4987f4ddf9f2@somainline.org>
Date: Mon, 11 Dec 2023 18:02:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm/dp: call dp_display_get_next_bridge() during probe
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
References: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7.11.2023 01:43, Dmitry Baryshkov wrote:
> The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
> next bridge is not (yet) available. However returning -EPROBE_DEFER from
> msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
> component_bind, which can easily result in -EPROBE_DEFR loops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # sc8180x-primus

Konrad

