Return-Path: <linux-arm-msm+bounces-102403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLXoK8Yk12kiLAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 06:02:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A14373C621B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 06:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 756073008D32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 04:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690FF1DE8BF;
	Thu,  9 Apr 2026 04:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGhthPCS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTfukRZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944FE18EFD1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 04:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775707329; cv=none; b=Ublgjv1+lau61JNEu2s4/kkYM4ujijnKuAtwxAte2q9js+btz4Vw9pnZPYL1FL1oKUgIM8G/TLAg15KJz5wBWBIsAsIRHwmvlXo6OHWuPuz0mwRxKHAeBVrEL94DBqb8EGUhDd/hTywwT+DvUXat9/9KCQF2zyFQNV2p5PX2xxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775707329; c=relaxed/simple;
	bh=bvmMFbWj6ClBg8Ys4HS9Fqq/upaYmnp0G2M4fFfuLBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsTe7Snij0sNYBGMKrD5A2JJQ3DnhjpFqy5GN+gFuBR0iu0mzBdL55oSogtrKb6zDyVsqDVr7WteInw0S9JtHeBgD6uuWqksDcflQYUEx4GIWoFzwixsVUWHxbZGoSvlHjsJd4KKb3L4HoPKnzvE0UkfzEEZny5tVsgQaEaYzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGhthPCS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTfukRZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L24sN3715439
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 04:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnuyyB+5NDkjvl9qZxcYCWASOiqmS2rT122z4ePoI8g=; b=cGhthPCSw8ij1zbn
	g+HsVWD/7UhoG36QNHY16J0tUvHP9XLO+jeuixIGH3PLCYZsD3d4T+lJO2Crf0PB
	7DiErHyjr+SVfgZKe+dSkCGEWZgWqDIVzUKHPjLkhQd+1OuoeNU1G44i8fzdPcXG
	t07yML2Utvj/1nOByCiNrFZmPFz+bVICxNTK39oUR9gSa/MDU5XVrqa9jHQ8wQoE
	07C96RsPCHF9PwKurTwTAUCCBINpDyNQ8QEH9RyOJ6OhCXai73v0KFPGjRvtxbEt
	+QWRBXKAskWsksa5VLgG4pKLNQw+ZcCxZsTlzVKt6djBvoReE9YarmvfSZYkRNcx
	SGxjhw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74a754-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:02:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242b9359aso4762325ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 21:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775707326; x=1776312126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnuyyB+5NDkjvl9qZxcYCWASOiqmS2rT122z4ePoI8g=;
        b=TTfukRZ205U6zpbPFmh+NPES+X6lMNn/j68DznSw0Nx/nAi3t1bSQe0ZJ5yJksPqFu
         sC/zi3t457DaopGq8sw+XzY/AEDenxHMhkQPD7GTGOd36u2aSqdFKK00pJjrFl1xclgp
         0fkJV7CyY+CYsyBBThUoIQ3khHsgD8Cw/wczYo1BKNrMK6mEtjMHhvOIPsjiZYHkw4be
         d9wRDiPaMNLBIhbQg7iuk/TxgemGMz4R2q1QXT2xeorvVmpwtA1mPVQoTWca/JPgh8FP
         wCcJa+zn/C/Ny4QCfufulLnbCYm0MrJj3dlQBjdOWchFaRvHyXW7bnGCL7K1+is/ESrZ
         EpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775707326; x=1776312126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnuyyB+5NDkjvl9qZxcYCWASOiqmS2rT122z4ePoI8g=;
        b=hrH5DCgs2VoJryYbGWpRAPG/MXsEBGOPJBBK+3QZa+mNudlVWIhW4NFj9DwYkiIeOG
         VKnIZo7vBPP/3BhFlid+md6/qRx/NbkUA+V+KhCHHzHta0K94PSbd3BYsqN2nZdy0BEN
         kWW9VbQFeNNdO6XtaR8VsAk61qeXxo1x5lmKn1IuuqEK+DMwq2kqQ9L1yngN5RW+OWVS
         ha8dqcXGbaLea+BoGIt0k1YZXorSvuZA1VdjL5vWBOahUmgosQosuWdkP4RyfFFdJfEL
         twJ462rJcFtYx6MznT/tZ860hmCH3APaqr3Kq4YrshTJaMNU04/ozArnlRLWsyXdeekf
         i+bg==
X-Forwarded-Encrypted: i=1; AJvYcCWqKoL5ui6VhtyPJU/kP8CrQ2UgpPTAcVHh/0TwYYwZtXbSbjDbBVW2OnxsLo0DpK0IwtOqZHI0NqgVYWg2@vger.kernel.org
X-Gm-Message-State: AOJu0YyqvnTTsqGAWqfeJX9ES64ZWDqyDBEqHu0LmJ8/zR5LfiwT1dmL
	VfUv2ntfyTPFvKTkX599vhEGLrk3GBt0T5lxuEX3Xpk/DBB5XITI9GoBVGLEmqt5noxOHiuQbRy
	e7UYffe2NQrPICMZf59yFqQd6iYpcRjkwHB3OlGUdaQbDa/IKQamCh5Gwq9JInQnX3XtD
X-Gm-Gg: AeBDietRLlE0b/unlGBIuoea9Xzr9Y8aQgYn+SYIEh8FXqavVQ+rdQTbmC04NRP/MwF
	Tp+boCPpJsFzQcXScpA96kgGERNHkHQNRojB4d/oSS/sllXu4SBLaXAC8Hp4X7wKdipuiUYyTUo
	/+sxO3m9Xm0bNtS9EsT7m4wqp6B3ugoJ5q30tYiGT/kq8SRzX1KMP+MtbhZzFyHex2zh0PY04Rl
	1xebRRbcBAVcXp++CxCjKMDI00FKjXJA+6q+Gg91TEAx5JJhD7NeiWHZWnWAH0qyWO6Gra0Uv9I
	pto1hQOVDtfZVQtR8QLfUffC1mj2og12K9NHeGGdhSEZ7cumIJEOLb7XuF1ksikv73rtunucgEr
	BqxXilwYMJF2M94KL6h3ESCQvcH7jZU++0GMa79ZhFe0cBwBzboq+jhC86Hh5cC+rwd5MGWyChW
	UvSf7xeLD4RHOdqnyiMg==
X-Received: by 2002:a17:902:9888:b0:2b2:5124:d068 with SMTP id d9443c01a7336-2b2c7308a1cmr15374595ad.10.1775707325757;
        Wed, 08 Apr 2026 21:02:05 -0700 (PDT)
X-Received: by 2002:a17:902:9888:b0:2b2:5124:d068 with SMTP id d9443c01a7336-2b2c7308a1cmr15373505ad.10.1775707324395;
        Wed, 08 Apr 2026 21:02:04 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2c09cdcd2sm29978475ad.29.2026.04.08.21.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 21:02:03 -0700 (PDT)
Message-ID: <399e29a0-1c52-4e81-9393-3642d50e1e69@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 12:01:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/38] drm/msm/dp: add connector abstraction for DP MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
 <x72v67fsgmekfeebasggtiaofwlxw6ikqch4lxkrryior3yxxk@xiiw75bnj37p>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <x72v67fsgmekfeebasggtiaofwlxw6ikqch4lxkrryior3yxxk@xiiw75bnj37p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d724be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7jCAB-3gvQ6QjorLAh0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cRaG8JIiX-V-wzoMFF6yIGQNEJCOXnJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzMyBTYWx0ZWRfX7/Hjn4siHE/U
 qQqgn+0B20i3PDiUHdjQjODwMm2j1ljttFuEt4YRuo6YgpdyrmJE9cx4ClHt/+bfikQaKluj2Ax
 txmW0bvPtCThVnxJxyx2n87vBfFhrfSv0zobehNzPa6TjfIZ3K3+iAWmeLmxOQPAA21HDF4ktNq
 m/psnMDWhenI6aVkgXsLxMrn0yxctRMHn0MrJQPs+SL2fqETLR5rn8ffRJLghlYGRBgxywWni9L
 wihgzu6gn02DddnMN+vaEOOBO1Vs6QubsU0taiOPUcQ9FtochTWa9LSeG2mvZSx2FrJsNiXY9ZJ
 w8RzxppGNlaakO+ntFYArNvp8DvOyGFnRF18eB+8mivHmWP6FQ3yM+54G06w9gO40jyLlKqsThn
 U71gD8K6hhAqncsqO1haNgvWJql0rV9pVQ7wPi7/O1wEiWJHSmGtywVJzeKMaCL+GcClRfuVtor
 b59kDX5JvgQ/ETxm7FA==
X-Proofpoint-GUID: cRaG8JIiX-V-wzoMFF6yIGQNEJCOXnJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102403-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A14373C621B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 2:31 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:16PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add connector abstraction for the DP MST. Each MST encoder
>> is connected through a DRM bridge to a MST connector and each
>> MST connector has a DP panel abstraction attached to it.
> 
> What's the functionality split between the connector and bridge? Please
> explain it here. Do we really need a bridge if we have a non-trivial
> connector implementation?
> 
MST connector only for MST API calls/detect/get_modes/get encoder, and 
the bridge handles display enable/disable, hotplug, mode set....
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 391 +++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>   2 files changed, 393 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> index 73de29136801ef5f45e0b2d09280fe113021b68c..b4f640134af544c77ab262d2cbe0b67e1e2e1b3a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> @@ -25,6 +25,8 @@
>>    * OF THIS SOFTWARE.
>>    */
>>   
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_managed.h>
>>   #include "dp_mst_drm.h"
>>   
>>   #define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
>> @@ -525,7 +527,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
>>   
>>   	dev = dp_display->drm_dev;
>>   	bridge->display = dp_display;
>> -	bridge->base.funcs = &msm_dp_mst_bridge_ops;
>>   	bridge->base.encoder = encoder;
>>   	bridge->base.type = dp_display->connector_type;
>>   	bridge->base.ops = DRM_BRIDGE_OP_MODES;
>> @@ -554,3 +555,391 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
>>   end:
>>   	return rc;
>>   }
>> +
>> +static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
>> +								struct msm_dp_mst_bridge *bridge)
>> +{
>> +	struct drm_device *dev = bridge->base.dev;
>> +	struct drm_private_state *obj_state = drm_atomic_get_private_obj_state(st, &bridge->obj);
>> +
>> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>> +
>> +	return to_msm_dp_mst_bridge_state_priv(obj_state);
>> +}
>> +
>> +/* DP MST Connector OPs */
>> +static int
>> +msm_dp_mst_connector_detect(struct drm_connector *connector,
>> +			    struct drm_modeset_acquire_ctx *ctx,
>> +			    bool force)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
>> +	struct msm_dp *dp_display = mst_conn->msm_dp;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>> +	enum drm_connector_status status = connector_status_disconnected;
>> +
>> +	if (drm_connector_is_unregistered(&mst_conn->connector))
>> +		return status;
> 
> Can detect be called for unregistered connector?
> 
Got it, will remove this.
>> +
>> +	if (dp_display->link_ready && dp_display->mst_active)
>> +		status = drm_dp_mst_detect_port(connector,
>> +						ctx, &mst->mst_mgr, mst_conn->mst_port);
> 
> I think this should be wrapped in the pm_runtime calls.
> 
>> +
>> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);
> 
> Do we need this?
> 
Will delete this log.
>> +
>> +	return status;
>> +}
>> +
>> +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
>> +	struct msm_dp *dp_display = mst_conn->msm_dp;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>> +	const struct drm_edid *drm_edid;
>> +
>> +	if (drm_connector_is_unregistered(&mst_conn->connector))
>> +		return drm_edid_connector_update(connector, NULL);
> 
> Is there a need for this? I don't see a check in nouveau code.
> 
Okay.. i see in intel's code..
https://elixir.bootlin.com/linux/v6.19.11/source/drivers/gpu/drm/i915/display/intel_dp_mst.c#L1390
do we need to remove this ?
>> +
>> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +
>> +	return drm_edid_connector_add_modes(connector);
>> +}
>> +
>> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
>> +							    const struct drm_display_mode *mode)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn;
>> +	struct msm_dp *dp_display;
>> +	struct drm_dp_mst_port *mst_port;
>> +	struct msm_dp_panel *dp_panel;
>> +	struct msm_dp_mst *mst;
>> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
>> +	u16 full_pbn, required_pbn;
>> +	int i, active_enc_cnt = 0;
>> +
>> +	if (drm_connector_is_unregistered(connector))
>> +		return 0;
>> +
>> +	mst_conn = to_msm_dp_mst_connector(connector);
>> +	dp_display = mst_conn->msm_dp;
>> +	mst = dp_display->msm_dp_mst;
>> +	mst_port = mst_conn->mst_port;
>> +	dp_panel = mst_conn->dp_panel;
>> +
>> +	if (!dp_panel || !mst_port)
>> +		return MODE_ERROR;
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		mst_bridge_state = to_msm_dp_mst_bridge_state(mst->mst_bridge[i]);
>> +		if (mst_bridge_state->connector &&
>> +		    mst_bridge_state->connector != connector)
>> +			active_enc_cnt++;
>> +	}
>> +
>> +	if (active_enc_cnt < DP_STREAM_MAX)
>> +		full_pbn = mst_port->full_pbn;
>> +	else {
>> +		DRM_ERROR("all MST streams are active\n");
>> +		return MODE_BAD;
> 
> And if the stream becomes unused, who will call the mode_valid? This
> callback should validate if the mode can be enabled at all, not taking
> care about other MST streams, connectors, etc. If the user overcommits,
> e.g. by selecting 4 8K modes, then atomic_check() will fail, but it
> still should be possible to disable all other connectors and get the max
> mode supported here.
> 
Got it.. will delete this.
>> +	}
>> +
>> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> 
> You should not be using connector's BPC here. It can be lowered to fit
> the mode. It should be (6 * 3) << 4
> 
Got it.
>> +
>> +	if (required_pbn > full_pbn) {
> 
> 
>> +		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported. pbn %d vs %d\n",
>> +			   mode->name, required_pbn, full_pbn);
>> +		return MODE_BAD;
> 
> MODE_CLOCK_HIGH
> 
>> +	}
>> +
>> +	return msm_dp_display_mode_valid(dp_display, &dp_panel->connector->display_info, mode);
>> +}
>> +
>> +static struct drm_encoder *
>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
>> +	struct msm_dp *dp_display = mst_conn->msm_dp;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>> +	struct drm_encoder *enc = NULL;
>> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
>> +	u32 i;
>> +	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
>> +										    connector);
>> +
>> +	if (conn_state && conn_state->best_encoder)
>> +		return conn_state->best_encoder;
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
>> +		if (IS_ERR(mst_bridge_state))
>> +			goto end;
>> +
>> +		if (mst_bridge_state->connector == connector) {
>> +			enc = mst->mst_bridge[i]->encoder;
>> +			goto end;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
>> +
>> +		if (!mst_bridge_state->connector) {
>> +			mst_bridge_state->connector = connector;
>> +			mst_bridge_state->msm_dp_panel = mst_conn->dp_panel;
>> +			enc = mst->mst_bridge[i]->encoder;
>> +			break;
>> +		}
>> +	}
>> +
>> +end:
>> +	if (enc)
>> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder:%d\n",
>> +			   connector->base.id, i);
>> +	else
>> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder failed\n",
>> +			   connector->base.id);
>> +
>> +	return enc;
>> +}
>> +
>> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
>> +					     struct drm_atomic_state *state)
>> +{
>> +	int rc = 0, slots;
>> +	struct drm_connector_state *old_conn_state;
>> +	struct drm_connector_state *new_conn_state;
>> +	struct drm_crtc *old_crtc;
>> +	struct drm_crtc_state *crtc_state;
>> +	struct msm_dp_mst_bridge *bridge;
>> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
>> +	struct drm_bridge *drm_bridge;
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
>> +	struct msm_dp *dp_display = mst_conn->msm_dp;
>> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>> +	struct drm_dp_mst_atomic_payload *payload;
>> +	struct drm_dp_mst_topology_state *mst_state;
>> +
>> +	if (!state)
>> +		return rc;
>> +
>> +	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
>> +	if (!new_conn_state)
>> +		return rc;
>> +
>> +	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
>> +	if (!old_conn_state)
>> +		goto end;
>> +
>> +	old_crtc = old_conn_state->crtc;
>> +	if (!old_crtc)
>> +		goto end;
>> +
>> +	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
>> +
>> +	/* attempt to release vcpi slots on a modeset change for crtc state */
>> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> +		if (WARN_ON(!old_conn_state->best_encoder)) {
>> +			rc = -EINVAL;
>> +			goto end;
>> +		}
>> +
>> +		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
> 
> Why do we have it here rather than in bridge's atomic_check?
> 
Got it, will move to bridge's atomic_check.
>> +		if (WARN_ON(!drm_bridge)) {
>> +			rc = -EINVAL;
>> +			goto end;
>> +		}
>> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
>> +
>> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, bridge);
>> +
>> +		mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
>> +	
>> +		payload = drm_atomic_get_mst_payload_state(mst_state, mst_conn->mst_port);
>> +
>> +		slots = payload->time_slots;
>> +		if (slots > 0) {
>> +			rc = drm_dp_atomic_release_time_slots(state,
>> +							      &mst->mst_mgr,
>> +							      mst_conn->mst_port);
>> +			if (rc) {
>> +				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
>> +				goto end;
>> +			}
>> +		}
>> +
>> +		if (!new_conn_state->crtc) {
>> +			/* for cases where crtc is not disabled the slots are not
>> +			 * freed by drm_dp_atomic_release_time_slots. this results
>> +			 * in subsequent atomic_check failing since internal slots
>> +			 * were freed but not the DP MST mgr's
>> +			 */
>> +			mst_bridge_state->num_slots = 0;
>> +			mst_bridge_state->connector = NULL;
>> +			mst_bridge_state->msm_dp_panel = NULL;
>> +
>> +			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
>> +		}
>> +	}
>> +
>> +end:
>> +	drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic check ret %d\n",
>> +		   connector->base.id, rc);
>> +	return rc;
>> +}
>> +
>> +static void dp_mst_connector_destroy(struct drm_connector *connector)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
>> +
>> +	drm_connector_cleanup(connector);
>> +	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
>> +	kfree(mst_conn);
>> +}
>> +
>> +/* DRM MST callbacks */
>> +static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
>> +	.get_modes =    msm_dp_mst_connector_get_modes,
>> +	.detect_ctx =   msm_dp_mst_connector_detect,
>> +	.mode_valid =   msm_dp_mst_connector_mode_valid,
>> +	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
>> +	.atomic_check = msm_dp_mst_connector_atomic_check,
>> +};
>> +
>> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
>> +	.reset = drm_atomic_helper_connector_reset,
>> +	.destroy = dp_mst_connector_destroy,
>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static struct drm_connector *
>> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>> +			 struct drm_dp_mst_port *port, const char *pathprop)
>> +{
>> +	struct msm_dp_mst *dp_mst;
>> +	struct drm_device *dev;
>> +	struct msm_dp *dp_display;
>> +	struct msm_dp_mst_connector *mst_conn;
>> +	struct drm_connector *connector;
>> +	int rc, i;
>> +
>> +	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
>> +
>> +	dp_display = dp_mst->msm_dp;
>> +	dev = dp_display->drm_dev;
>> +
>> +	mst_conn = kzalloc(sizeof(*mst_conn), GFP_KERNEL);
>> +
>> +	if (!mst_conn)
>> +		return NULL;
>> +
>> +	drm_modeset_lock_all(dev);
>> +
>> +	connector = &mst_conn->connector;
>> +	rc = drm_connector_dynamic_init(dev, connector,
>> +					&msm_dp_drm_mst_connector_funcs,
>> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
>> +	if (rc) {
>> +		kfree(mst_conn);
>> +		drm_modeset_unlock_all(dev);
>> +		return NULL;
>> +	}
>> +
>> +	mst_conn->dp_panel = msm_dp_display_get_panel(dp_display);
>> +	if (!mst_conn->dp_panel) {
>> +		DRM_ERROR("failed to get dp_panel for connector\n");
>> +		kfree(mst_conn);
>> +		drm_modeset_unlock_all(dev);
>> +		return NULL;
>> +	}
>> +
>> +	mst_conn->dp_panel->connector = connector;
>> +	mst_conn->msm_dp = dp_display;
>> +
>> +	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
>> +
>> +	if (connector->funcs->reset)
>> +		connector->funcs->reset(connector);
>> +
>> +	/* add all encoders as possible encoders */
>> +	for (i = 0; i < dp_mst->max_streams; i++) {
>> +		rc = drm_connector_attach_encoder(connector, dp_mst->mst_bridge[i]->encoder);
>> +
>> +		if (rc) {
>> +			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
>> +			kfree(mst_conn);
>> +			drm_modeset_unlock_all(dev);
>> +			return NULL;
>> +		}
>> +	}
>> +
>> +	mst_conn->mst_port = port;
>> +	drm_dp_mst_get_port_malloc(mst_conn->mst_port);
>> +
>> +	drm_object_attach_property(&connector->base,
>> +				   dev->mode_config.path_property, 0);
> 
> Where do we set the property then?
> 
Will add it.
>> +	drm_object_attach_property(&connector->base,
>> +				   dev->mode_config.tile_property, 0);
>> +
>> +	drm_modeset_unlock_all(dev);
>> +
>> +	drm_dbg_dp(dp_display->drm_dev, "add MST connector id:%d\n", connector->base.id);
>> +
>> +	return connector;
>> +}
>> +
>> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
>> +	.add_connector = msm_dp_mst_add_connector,
> 
> No .poll_hpd_irq ?
> 
I checked that poll_hpd_irq is only used for certain specific scenarios, 
so it can be added later when it is actually needed.
>> +};
>> +
>> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
>> +{
>> +	struct drm_device *dev;
>> +	int conn_base_id = 0;
>> +	int ret;
>> +	struct msm_dp_mst *msm_dp_mst;
>> +
>> +	if (!dp_display) {
>> +		DRM_ERROR("invalid params\n");
>> +		return 0;
>> +	}
> 
> Can't we just trust the driver?
> 
Got it.
>> +
>> +	dev = dp_display->drm_dev;
>> +
>> +	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
>> +	if (!msm_dp_mst)
>> +		return -ENOMEM;
>> +
>> +	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
>> +	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
>> +	conn_base_id = dp_display->connector->base.id;
>> +	msm_dp_mst->msm_dp = dp_display;
>> +	msm_dp_mst->max_streams = max_streams;
>> +
>> +	for (int i = 0; i < DP_STREAM_MAX; i++) {
>> +		msm_dp_mst->mst_bridge[i] = devm_drm_bridge_alloc(dev->dev,
>> +						struct msm_dp_mst_bridge, base,
>> +						&msm_dp_mst_bridge_ops);
> 
> This should have been a part of the previous patch.
> 
Got it.
>> +	}
>> +
>> +	msm_dp_mst->dp_aux = drm_aux;
>> +
>> +	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
>> +					   drm_aux,
>> +					   MAX_DPCD_TRANSACTION_BYTES,
>> +					   max_streams,
>> +					   conn_base_id);
>> +	if (ret) {
>> +		DRM_ERROR("DP DRM MST topology manager init failed\n");
>> +		return ret;
>> +	}
>> +
>> +	dp_display->msm_dp_mst = msm_dp_mst;
>> +
>> +	mutex_init(&msm_dp_mst->mst_lock);
>> +
>> +	drm_dbg_dp(dp_display->drm_dev, "DP DRM MST topology manager init completed\n");
> 
> Why do we need so many debug messages? They make the log overspammed and
> hard to follow.
> 
Got it.
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> index d75731ca2e5870377026e8ad1057bdcc5f0d4c78..1484fabd92ad0075eac5369aac8ca462acbd3eda 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> @@ -70,6 +70,7 @@ struct msm_dp_mst {
>>   	struct drm_dp_mst_topology_mgr mst_mgr;
>>   	struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
>>   	struct msm_dp *msm_dp;
>> +	struct drm_dp_aux *dp_aux;
>>   	u32 max_streams;
>>   	struct mutex mst_lock;
>>   };
>> @@ -83,4 +84,6 @@ struct msm_dp_mst_connector {
>>   
>>   int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>>   
>> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>> +
>>   #endif /* _DP_MST_DRM_H_ */
>>
>> -- 
>> 2.34.1
>>
> 


