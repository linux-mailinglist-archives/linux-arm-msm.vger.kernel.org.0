Return-Path: <linux-arm-msm+bounces-61458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FCADB459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3555A3A8AFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E6E1DC99C;
	Mon, 16 Jun 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYEVmbIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA127800
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085251; cv=none; b=uZMJnNWXABF0w4QACt2LE7t+Lf1pXPv+93n8rJOz/se15VwIu3hwbtTraCdrCIKv5pP1sxPrvs1OfTUllYKMNQdYedn4ia1C8MFr/VxvOwiOcbErhkhXEkNawYI3OVnflko4JjYf1oRSwGpncaHgcfEZgBNpVw064KviiJv2S4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085251; c=relaxed/simple;
	bh=G6laixy0j/Z7JFyHTHL5xFBgn3ATZk+uqITCI/JvyJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLMJS4yl0Av1Gk9LERjABXw3+UhZure+UUZQ+SIHlwtSbQ0h5NgPv8tsE85C2cC9pJz3VMkN8/FNhDRpUMHGTpidEaB6b+LEWPJnxJVU71QY2rjOM/n1Q4ADubWHdikfCob7gVYOgO3s3yOP8W6mbZMsn1uOdUnsvK1Vx5PvgE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYEVmbIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8kg8E003027
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QH0J2l9uHSJZCOh4wtepSQeUNDV1jSsRvpZ2JjBsrr4=; b=VYEVmbIZ0+zmr/Fg
	qyzL0WTi5VPJ6mE/AKED8OR6e34YXuJE8YHvMzIYwcA7CnpxAoOvb0kZ+FiFmWKU
	rZ1f6fYC37cd2ud5ymfNal1axe6c9IxbCTrEugnE1/MTGVh+jHLeN9W00GkCSpa5
	/4z/glSCLDIppIKgTOKF9aVCHg0M0Zk8x8ZXPW/+xofAQ6QKcm4RfIQM9rtaagta
	gmh6LXhq34RiA/pvZ5+XZ4+RVp3NnhucYPog5RM8p9GPk6GPsPiHNphZpfuYkgOD
	1n+xJ17iVaqaBp/aDey7QgKcu+YCrUlJlVhotpEwEKpPAzXc+s3E0uA7505X1vK5
	fB0wgA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2312n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:47:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabd295d12so75450796d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085246; x=1750690046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QH0J2l9uHSJZCOh4wtepSQeUNDV1jSsRvpZ2JjBsrr4=;
        b=O5fi33vqb7sefD7yCRy6Ig0sQE3egp7kUuRztM7Q9TDph8dggGzglBo1iBRd08tXL8
         xp7hjmUdHiBo2mvCf8yeVUULsrdAKIJsTNssCtgSLPLvzIasjkh6UATaPE+calZhgHSg
         vgKqKvWM4XtqNLaQ29I469bXweMegdeIrVvZ0x5b0Jsi9l7pEJagUAxuFYsviirFWrQq
         qrOec8bCkXBB+JyyeOUI6pO7nwoelbMStGVSfzzMVs7KkD26fTS9Q+TD8dq12TzQW1iK
         hk94LcIcoTe3H2nM0ylaD517W+/VxkOm++MKbN7D9H8iVAWlfk3sH/LVUh43SS7xzeyt
         xIoA==
X-Forwarded-Encrypted: i=1; AJvYcCWCI1nN7oN7PzLSrz6Nfkznkwm6Nd6tp8kQoloC1pQjgjVvxbq2MNieahgUstKiui9usbGhJfc6yYsznr9n@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VBcC/BM+7eRQ01sfYdnp9SEJ3D8oQKuAo8q73WG6dHHYrd1G
	yBZhs7gj6Er178zu2J44Balk/yzNFUhOjwtooLhvzOfkX1jFEmdtmD/Zto2nitdiBYzUlbu5kIb
	uBIdzQv8EgSGTUTVMK0yU8i+pDu+iYpXg5jp8eXqcmoNbnLR1nIW7g2FEWM9nogBt/qza
X-Gm-Gg: ASbGnctSlWdA/75mSLG/fhMxSuyV/GT7e5gF+60ZXQQcumyxafgc9xLTayb0UQnlQ9a
	MBkhBp0phfEGeTQ3YkTHT2eryQg7sfceNwe9nl0nMEHS8cRwmbbHpTbs/hUxrYRpkVR75Eu/nqi
	0vB9OYTO7rLQlTJ4u1Ow0QIrK4hi7edBRnuEHfzRaG+WyTsPFhIvenGiGeMFp2RKOWA65O/p9Ps
	P/4o9LUEVrMMYqCZAc6TN499kwkiGXBZJB9o1dSKfjMW3lRIYYuqUKP05lW+Zi3UYMNrc8Ojoay
	vmCt1yLgGAUkb/5wNUhLrvegRBdAZD8L5/G667ixs3k52zDJlHlw7kr+K6x/OGGwn8cIUmY6WUT
	l/xzc3xbXgHdKhRm0zcV5A9x4WlvU8Bb1EQhIVMS+6KrmZSdkFBt4VQqvT6sLoU9ARmKqzrqPTl
	E=
X-Received: by 2002:a05:6214:d4c:b0:6fa:c5f0:bf57 with SMTP id 6a1803df08f44-6fb4779a596mr144638466d6.38.1750085246132;
        Mon, 16 Jun 2025 07:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDmCUg9B33wXiiELGXGfTAxH1JwZagDN//DWPW0cKUjJcQEC/PvHUwjiRWcCCVoeUik+VHoA==
X-Received: by 2002:a05:6214:d4c:b0:6fa:c5f0:bf57 with SMTP id 6a1803df08f44-6fb4779a596mr144637946d6.38.1750085245559;
        Mon, 16 Jun 2025 07:47:25 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3318f19fsm15713611fa.83.2025.06.16.07.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:47:24 -0700 (PDT)
Message-ID: <260fd5a5-ee2d-4f19-9ef6-e4145dfb2bc8@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 17:47:23 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
 <2ab43ae7-12b6-4d41-9ffd-dbea70e2a662@quicinc.com>
 <njz3apifgcv2k3kzlmti5rjgqpl43v5yvjqpu6qhpe2kw3bzlu@pqvnrh6ff2um>
 <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wv5YvFLWjvZU3nlCpzHtCJAb1jo8JoEN
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68502e7f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wqPfgNt102ecysN_towA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MyBTYWx0ZWRfXwFvDPorUxPLF
 0ECmW/glwBaAYHENlx2LSMx8ZrWRavpj2/AISgvR+6wk3jsnSVsm5iuNOM2XlrzKf4XHiCeT6YT
 YSBCfWSB6xXvMcJauTfRMtAomwZ87Mw/7l6l8mIn2v6pmlSi2Dw4VbthUywdyWakIjafxNw4MSj
 /i7zhRDUTKE+PnHNlsdauhLxRvbDmWeymRIfXVIi27if8gU+6Od4hZPo2NUMv6/H/Rr7dtYBTHT
 Hj5uUw30vjDp/5Qj57w3lb6tQA3fitl6oMHndEGKrIgIfgyKTB3bblrx4PMdM6xdpmLuVp8tgFy
 ArBdHDzhgpNOjHYzl4Rfu4qOEabpA+/cmqeoI7s38Hs9fc1F+FfAx1lSsNlOmbkyiWyXcFiISBD
 ilXrPMi0D5DHSxgukSdtUhZgG18zheiQiyUh3lOHK+5erk0TxsIOM8E7VmZyZhIjzwKWaybb
X-Proofpoint-GUID: wv5YvFLWjvZU3nlCpzHtCJAb1jo8JoEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160093


On 16/06/2025 17:09, Yongxing Mou wrote:
 >
 >
 > On 2025/6/11 22:31, Dmitry Baryshkov wrote:
 >> On Wed, Jun 11, 2025 at 08:06:28PM +0800, Yongxing Mou wrote:
 >>>
 >>>
 >>> On 2025/6/9 23:44, Dmitry Baryshkov wrote:
 >>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
 >>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
 >>>>>
 >>>>> Add connector abstraction for the DP MST. Each MST encoder
 >>>>> is connected through a DRM bridge to a MST connector and each
 >>>>> MST connector has a DP panel abstraction attached to it.
 >>>>>
 >>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
 >>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
 >>>>> ---
 >>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 
++++++++++++++++++++++ ++++++++++++++
 >>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
 >>>>>    2 files changed, 518 insertions(+)
 >>>>
 >>>> It generally feels liks 80% of this patch is a generic code. Please
 >>>> extract generic DP MST connector and push it under drm/display. 
Other DP
 >>>> MST drivers should be able to use it.
 >>>>
 >>>>>
 >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c 
b/drivers/gpu/drm/ msm/dp/dp_mst_drm.c
 >>>>> index 
a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f4769b2153fc5153c4cb41 
100644
 >>>>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
 >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
 >>>>> @@ -25,8 +25,12 @@
 >>>>>     * OF THIS SOFTWARE.
 >>>>>     */
 >>>>> +#include <drm/drm_edid.h>
 >>>>> +#include <drm/drm_managed.h>
 >>>>>    #include "dp_mst_drm.h"
 >>>>> +#define MAX_DPCD_TRANSACTION_BYTES 16
 >>>>> +
 >>>>>    static struct drm_private_state 
*msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
 >>>>>    {
 >>>>>        struct msm_dp_mst_bridge_state *state;
 >>>>> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct 
drm_dp_mst_topology_mgr *mgr, int p
 >>>>>        return num_slots;
 >>>>>    }
 >>>>> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel 
*msm_dp_panel)
 >>>>> +{
 >>>>> +    struct msm_dp_link_info *link_info;
 >>>>> +
 >>>>> +    link_info = &msm_dp_panel->link_info;
 >>>>> +
 >>>>> +    return link_info->rate * link_info->num_lanes / 54000;
 >>>>> +}
 >>>>> +
 >>>>> +static int msm_dp_mst_compute_config(struct drm_atomic_state *state,
 >>>>> +                      struct msm_dp_mst *mst, struct 
drm_connector *connector,
 >>>>> +                      struct drm_display_mode *mode)
 >>>>> +{
 >>>>> +    int slots = 0, pbn;
 >>>>> +    struct msm_dp_mst_connector *mst_conn = 
to_msm_dp_mst_connector(connector);
 >>>>> +    int rc = 0;
 >>>>> +    struct drm_dp_mst_topology_state *mst_state;
 >>>>> +    int pbn_div;
 >>>>> +    struct msm_dp *dp_display = mst->msm_dp;
 >>>>> +    u32 bpp;
 >>>>> +
 >>>>> +    bpp = connector->display_info.bpc * 3;
 >>>>> +
 >>>>> +    pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
 >>>>
 >>>> Is this going to change if DSC is in place? Will it bring 
fractional BPP
 >>>> here?
 >>>>
 >>> Actually, in this patch series, MST not support DSC. So we just don't
 >>> consider this scenario.
 >>
 >> But you still can answer the question.
 >>
 >>
 >> [...]
 >>
 > 1.Emm, for my current understanding, if DSC is enabled, the BPP 
should change and recaculated.
 > Will it bring fractional BPP here?

That's what I am asking

 >  >>>I'm not entirely sure about this answer. I checked how other 
drivers call this function, and they all use bpp << 4, so can we assume 
that this way of calling it is valid?

It is valid. I'm trying to understand the implications and future changes.

 >>>>> +
 >>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display- 
 >connector->display_info, mode);
 >>>>> +}
 >>>>> +
 >>>>> +static struct drm_encoder *
 >>>>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, 
struct drm_atomic_state *state)
 >>>>
 >>>> Do we need this callback? Don't we have a fixed relationship between
 >>>> connectors and encoders?
 >>
 >> This was left unanswered.
 >>
 > Sorry, I didn't mean to skip any questions — I just planned to reply 
a bit later. Apologies for the confusion.
 > For this question, yes , we don't have the fixed relationship between 
them. Under the current codes, the Connector selects the available 
encoder and bridge in order from index 0 to 4 (up to max_streams) when 
the connector's status changes to 'connected'.

Why? Can we have 1:1 relationship as we do with other bridges?

 >>>>
 >>>>> +{
 >>>>> +    struct msm_dp_mst_connector *mst_conn = 
to_msm_dp_mst_connector(connector);
 >>>>> +    struct msm_dp *dp_display = mst_conn->msm_dp;
 >>>>> +    struct msm_dp_mst *mst = dp_display->msm_dp_mst;
 >>>>> +    struct drm_encoder *enc = NULL;
 >>>>> +    struct msm_dp_mst_bridge_state *bridge_state;
 >>>>> +    u32 i;
 >>>>> +    struct drm_connector_state *conn_state = 
drm_atomic_get_new_connector_state(state,
 >>>>> +                                            connector);
 >>>>> +
 >>>>
 >>
 >> [...]
 >>
 >>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 >>>>> +        if (WARN_ON(!old_conn_state->best_encoder)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        drm_bridge = 
drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
 >>>>
 >>>> This really looks like this should be a bridge's callback.
 >>
 >> And this one
 >>
 > Emm, the bridge does not implement atomic_check(). All MST-related 
checks (such as drm_dp_atomic_release_time_slots, 
drm_dp_mst_atomic_check, or others) are performed in the connector's 
atomic_check function. I believe this is because both num_slots and pbn 
are stored in the bridge, and we call this to get the drm_bridge..

So, please split them into connector and bridge checks, calling them 
from corresponding hooks. It might be easier to migrate completely to 
the bridge's atomic_check(). At least it will save us from this clumsy 
code getting the bridge for the connector.


 >>>>
 >>>>> +        if (WARN_ON(!drm_bridge)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
 >>>>> +
 >>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
 >>>>> +        if (IS_ERR(bridge_state)) {
 >>>>> +            rc = PTR_ERR(bridge_state);
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        slots = bridge_state->num_slots;
 >>>>> +        if (slots > 0) {
 >>>>> +            rc = drm_dp_atomic_release_time_slots(state,
 >>>>> +                                  &mst->mst_mgr,
 >>>>> +                                  mst_conn->mst_port);
 >>>>> +            if (rc) {
 >>>>> +                DRM_ERROR("failed releasing %d vcpi slots %d\n", 
slots, rc);
 >>>>> +                goto end;
 >>>>> +            }
 >>>>> +            vcpi_released = true;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (!new_conn_state->crtc) {
 >>>>> +            /* for cases where crtc is not disabled the slots 
are not
 >>>>> +             * freed by drm_dp_atomic_release_time_slots. this 
results
 >>>>> +             * in subsequent atomic_check failing since internal 
slots
 >>>>> +             * were freed but not the dp mst mgr's
 >>>>> +             */
 >>>>> +            bridge_state->num_slots = 0;
 >>>>> +            bridge_state->connector = NULL;
 >>>>> +            bridge_state->msm_dp_panel = NULL;
 >>>>> +
 >>>>> +            drm_dbg_dp(dp_display->drm_dev, "clear best encoder: 
%d\n", bridge->id);
 >>>>> +        }
 >>>>> +    }
 >>>>
 >>>> This looks like there are several functions fused together. Please
 >>>> unfuse those into small and neat code blocks.
 >>
 >> And this 😂
 >>
 > Got it.. this code only do one thing, check and try to release 
time_slots.. we can try to package it into small functions..

I still don't understand, why do we need to release time_slots here 
instead of using MST helpers.

 >>>>
 >>>>> +
 >>>>> +mode_set:
 >>>>> +    if (!new_conn_state->crtc)
 >>>>> +        goto end;
 >>>>> +
 >>>>> +    crtc_state = drm_atomic_get_new_crtc_state(state, 
new_conn_state->crtc);
 >>>>> +
 >>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state- 
 >active) {
 >>>>
 >>>> Use of crtc_state->active doesn't look correct.
 >>
 >>
 >> ...
 >>
 > Sorry, I'm still not quite sure where the issue is. Could you please 
help point it out? Thanks~~


Please refer to the documentation for drm_crtc_state::active. The 
drivers are not supposed to use this field in checks.

 >>>>
 >>>>> +        if (WARN_ON(!new_conn_state->best_encoder)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        drm_bridge = 
drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
 >>>>> +        if (WARN_ON(!drm_bridge)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
 >>>>> +
 >>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
 >>>>> +        if (IS_ERR(bridge_state)) {
 >>>>> +            rc = PTR_ERR(bridge_state);
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>
 >>>> Can all of this actually happen?
 >>
 >> ...
 >>
 > Actually not, I haven't encountered it yet. I'm not sure how to 
trigger it, but it might occur under race conditions? Or we just remove 
it untill some case it really happen..

No. You actually think whether this condition can happen, then keep it 
if it can (and drop it if it can not happen).

 >>>>
 >>>>> +
 >>>>> +        /*
 >>>>> +         * check if vcpi slots are trying to get allocated in 
same phase
 >>>>> +         * as deallocation. If so, go to end to avoid allocation.
 >>>>> +         */
 >>>>> +        if (vcpi_released) {
 >>>>> +            drm_dbg_dp(dp_display->drm_dev,
 >>>>> +                   "skipping allocation since vcpi was released 
in the same state\n");
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (WARN_ON(bridge_state->num_slots)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        slots = msm_dp_mst_compute_config(state, mst, connector, 
&crtc_state->mode);
 >>>>> +        if (slots < 0) {
 >>>>> +            rc = slots;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        bridge_state->num_slots = slots;
 >>>>> +    }
 >>>>> +
 >>>>> +end:
 >>>>> +    drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic 
check ret %d\n",
 >>>>> +           connector->base.id, rc);
 >>>>> +    return rc;
 >>>>> +}
 >>>>> +
 >>>>> +static void dp_mst_connector_destroy(struct drm_connector 
*connector)
 >>>>> +{
 >>>>> +    struct msm_dp_mst_connector *mst_conn = 
to_msm_dp_mst_connector(connector);
 >>>>> +
 >>>>> +    drm_connector_cleanup(connector);
 >>>>> +    drm_dp_mst_put_port_malloc(mst_conn->mst_port);
 >>>>> +}
 >>>>> +
 >>>>> +/* DRM MST callbacks */
 >>>>> +static const struct drm_connector_helper_funcs 
msm_dp_drm_mst_connector_helper_funcs = {
 >>>>> +    .get_modes =    msm_dp_mst_connector_get_modes,
 >>>>> +    .detect_ctx =   msm_dp_mst_connector_detect,
 >>>>> +    .mode_valid =   msm_dp_mst_connector_mode_valid,
 >>>>> +    .atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
 >>>>> +    .atomic_check = msm_dp_mst_connector_atomic_check,
 >>>>> +};
 >>>>> +
 >>>>> +static const struct drm_connector_funcs 
msm_dp_drm_mst_connector_funcs = {
 >>>>> +    .reset = drm_atomic_helper_connector_reset,
 >>>>> +    .destroy = dp_mst_connector_destroy,
 >>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
 >>>>> +    .atomic_duplicate_state = 
drm_atomic_helper_connector_duplicate_state,
 >>>>> +    .atomic_destroy_state = 
drm_atomic_helper_connector_destroy_state,
 >>>>> +};
 >>>>> +
 >>>>> +static struct drm_connector *
 >>>>> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 >>>>> +             struct drm_dp_mst_port *port, const char *pathprop)
 >>>>> +{
 >>>>> +    struct msm_dp_mst *dp_mst;
 >>>>> +    struct drm_device *dev;
 >>>>> +    struct msm_dp *dp_display;
 >>>>> +    struct msm_dp_mst_connector *mst_connector;
 >>>>> +    struct drm_connector *connector;
 >>>>> +    int rc, i;
 >>>>> +
 >>>>> +    dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
 >>>>> +
 >>>>> +    dp_display = dp_mst->msm_dp;
 >>>>> +    dev = dp_display->drm_dev;
 >>>>> +
 >>>>> +    mst_connector = devm_kzalloc(dev->dev, 
sizeof(*mst_connector), GFP_KERNEL);
 >>>>
 >>>> This shows that somebody doesn't understand the reason for drmm 
and the
 >>>> difference between devm and drmm and the lifetime of the objects. 
Do you
 >>>> see two issues in this line?
 >>>>
 >>>> Let me help you. Please use normal (non-managed) memory here. It 
is the
 >>>> only correct way to allocate memory for MST connectors.
 >>>>
 >>> Thanks for point it.. it will lead to mem leak.. so we need to use
 >>> kzalloc()...
 >>
 >> - Did you understand why devm is unsuitable here?
 >> - Why drmm is also unsutable?
 >> - What is the implication of using kzalloc() here?
 >>
 > For my understanding, memory allocated with devm_kzalloc is released 
when the device is removed, while memory allocated with drmm_kzalloc is 
released when the DRM device is unregistered. I believe this is because 
the allocation and release of connectors happen during hotplug events, 
which have a different lifecycle from other devices. If we use 
kzalloc(), we would need to manually free the memory.

Ack, thanks.

 >>>>> +
 >>>>> +    drm_modeset_lock_all(dev);
 >>>>> +
 >>>>> +    rc = drm_connector_dynamic_init(dev, &mst_connector->connector,
 >>>>> +                    &msm_dp_drm_mst_connector_funcs,
 >>>>> +                    DRM_MODE_CONNECTOR_DisplayPort, NULL);
 >>>>> +    if (rc) {
 >>>>> +        drm_modeset_unlock_all(dev);
 >>>>> +        return NULL;
 >>>>> +    }
 >>>>> +
 >>>>> +    mst_connector->dp_panel = msm_dp_display_get_panel(dp_display);
 >>>>> +    if (!mst_connector->dp_panel) {
 >>>>> +        DRM_ERROR("failed to get dp_panel for connector\n");
 >>>>> +        drm_modeset_unlock_all(dev);
 >>>>> +        return NULL;
 >>>>> +    }
 >>>>> +
 >>>>> +    mst_connector->dp_panel->connector = &mst_connector->connector;
 >>>>> +    mst_connector->msm_dp = dp_display;
 >>>>> +    connector = &mst_connector->connector;
 >>>>> +    drm_connector_helper_add(&mst_connector->connector, 
&msm_dp_drm_mst_connector_helper_funcs);
 >>>>> +
 >>>>> +    if (connector->funcs->reset)
 >>>>> +        connector->funcs->reset(connector);
 >>>>> +
 >>>>> +    /* add all encoders as possible encoders */
 >>>>> +    for (i = 0; i < dp_mst->max_streams; i++) {
 >>>>> +        rc = drm_connector_attach_encoder(&mst_connector->connector,
 >>>>> +                          dp_mst->mst_bridge[i].encoder);
 >>>>> +        if (rc) {
 >>>>> +            DRM_ERROR("failed to attach encoder to connector, 
%d\n", rc);
 >>>>> +            drm_modeset_unlock_all(dev);
 >>>>> +            return NULL;
 >>>>> +        }
 >>>>> +    }
 >>>>> +
 >>>>> +    mst_connector->mst_port = port;
 >>>>> +    drm_dp_mst_get_port_malloc(mst_connector->mst_port);
 >>>>> +
 >>>>> +    drm_object_attach_property(&mst_connector->connector.base,
 >>>>> +                   dev->mode_config.path_property, 0);
 >>>>> +    drm_object_attach_property(&mst_connector->connector.base,
 >>>>> +                   dev->mode_config.tile_property, 0);
 >>>>
 >>>> subconnector? Or do we report the subconnector only for the main DP
 >>>> port?
 >>
 >>
 >> ...
 >>
 > Sorry, I'm not quite sure what 'subconnector' means in this 
context... Could you please help explain it a bit more? From what I’ve 
seen in other drivers, these two properties are registered for each MST 
connector.
 > 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
drivers/gpu/drm/i915/display/intel_dp_mst.c?h=v6.16-rc2#n1618

I was thinking about the 
drm_connector_attach_dp_subconnector_property(), but it seems it's not 
used for MST connectors.

However, we should definitely be setting the path property, see 
drm_connector_set_path_property().


 >>>>
 >>>>> +
 >>>>> +    drm_modeset_unlock_all(dev);
 >>>>> +
 >


-- 
With best wishes
Dmitry

