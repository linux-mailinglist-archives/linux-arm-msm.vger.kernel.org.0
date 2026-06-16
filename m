Return-Path: <linux-arm-msm+bounces-113354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wSxtChEbMWrDbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:44:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518C68DA86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:44:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q6nsevqV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="GKO80TD/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BC73300463A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9623F4218A3;
	Tue, 16 Jun 2026 09:44:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB313D8138
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603083; cv=none; b=nbMqwVj+xSYQPz9P5EuufL9yg4Xslie2OdgChEMvhamG4EhovclviSyUGsJSx5QVe69VB3A4dV6Ce/1bOQINs4sWI/A6FY9a/bKYhYXnlvNCPsRIZkTECkQhoDe9H6qc5FnYj14Ki560swWwtoiz1wAD00jb7pTLDgS+7OmXlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603083; c=relaxed/simple;
	bh=tHtysmFIvzUPQMJ+//1G9lNe9X8sUbNdd7G7t/YS7KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVPL1WHDLrBZwLgbpy4rMxeHl3b6f1DTZh9E2Bm2jkVrNmw01tDzKAg2Vh/G+5Jpd+XVtn6wP6fbZhV8LEHUXcGQaan5Xb+xNfliVWakYjoQoy69roxBKZMKGfQJVRg9BcL+gc4ClS97hsGT2hT28sn1l+fNZQCHWjr3JVberDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6nsevqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKO80TD/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64NVN2239910
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ts+qkX0CT/TNnoWo6imVaA144yQNGuUf5VYhOjXuCiU=; b=Q6nsevqVbhjF+QP8
	Zj24Owc8CMZmLnEnqXXutEvBGVA8odT/jIFrz+WzLJ+pSOso6i3dvCK6YfgHTiEA
	3i2IKolcGfg/EBOcr7ffhpUzkG/SIbLYPKHp36iDnDXo5mVvyuCPxsZuzwc/kA9y
	UI2g4Kfy6yPKkZIKVakoOpFjIgO7CCxjAF4uigw1qwaDhI7LJHLt52BaneavxjwB
	gdm63KK5SaujRmAZ9fw9Y7CWom+og6a6JaT3Vk26qGxVJIy8gPRCrUZOFJz+IUBq
	m/ZHjxWw4JKMHL2084cGf8+zRIJfodSA0QRaL5Eqt1K5YJ02O8Ld9Fe3fpdzCn7P
	9zWfdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7s4fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:44:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84247fed609so2388022b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781603081; x=1782207881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts+qkX0CT/TNnoWo6imVaA144yQNGuUf5VYhOjXuCiU=;
        b=GKO80TD/zfwebpfpqAnJXcrYFPy4xOLM7pQ04tRBKqqkiFM9h4AXtQZOYuqIL58e6i
         hz0Ot1nnu+1XXvujE8Q3qHXPQWHoN0ock1wYCHQfwmxd9D834431HQ617NJ2n59IK635
         IL3a1jCeMD7YHrQwStmvLV03TXqeaAGW7N5U/fnxrZD36IoRljP4LqHL0PCFLgmI9xyD
         5w9YwfS7nLfbcQhJePOx7PsYd/mD52deaRztybxKxDRJGArsMMx0DK+XPIPr7aMW6JZE
         8tek2JPYN36PEq59TbunGZII0QwDXiIRXY+1MbDYGsdJmx25wtjXMkuieHe4UKduX7R2
         WgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603081; x=1782207881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts+qkX0CT/TNnoWo6imVaA144yQNGuUf5VYhOjXuCiU=;
        b=iU9VghHzhKGoOdmPWFbbx6sPO9ONTJiWGf1RNGjLl2/It4BUwteeU7wLHxzPVsqBWH
         UaYs4ai3KZUwGASCSif0NTiR5VoFibviBbIJk7p8nu/hGMvbcr25tvNY432KW4rgpl29
         WsyZOxD4Yks6eaaLr5j2B0eZsvmNR7HfOajaSWWO8+DdHn//G9qSo7X/9m76Sa2TG81j
         ogbBJ46RMpTyvqRzZRmRAbRXpyyDEAJj1L6GRZ7IutEcZyVwZfygX1woKEbgGt5BF3Dl
         wnlTpNtAICCCtU2q8I+6LBVTiT/KmqW4znalpc5c6o5jytsjc5ukqPWIQpmwFBbDyZ9t
         Gd/g==
X-Forwarded-Encrypted: i=1; AFNElJ8gvoOkODZyGm9Bgfz03D76R8qkywiUKjaRcMs9ZWSVXSc6OK1hBCZGwa/YlLe8pUEOanwP7ZlmmmEaNxpo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7R9ZVmD+SQ6JE1T8n2qa+G8YTa01ECpOZujo0KyvxDfxMvEk
	AW9cRFymu8UmrQnwobNqcMMfDHiJPh8xw06UO9H8d2ON6pejjMZq4tsMmo9dVUBw+cUaATywUtv
	IrueJbBi4opgjxDW/vqe4I8ziNCN0AXRRWeXFMYNWR0ZL+et2LxBPFFX5TPIRDkr7GoAE
X-Gm-Gg: Acq92OEc1CsFbNHm0h2+J1FAkW53Z7lDICuN3c1yQ2CG1F+FP8HfKjOWZzbnaBpjxzX
	NjgaxCq6uh6M83hd2mAzEZN4CfDdVth/11ddetLPhz4Eumr91r9vUQivyMq1CY9wK/itGL08qi6
	olmhiTMGLb1cu0QgsYPJf9FYso8WPjqHjxT4M/nqYkRrMyAO4D9h8voAa+OgcuSXuKaBeosV9hz
	rCvYNKgOC+f92cyPfbKbRroe/1my/SP1a14jQNUrNKWRhtCcHs8n01awceUvAXEAfyMYD6jymHL
	zyBlOyaSyJ9oqmdbWnPORRpGMUDPiw9L5HGwqO4mdMkuCvvSmwMcZT+YYws58kGalioi0HWZni+
	jT0a8DKsAco2ZfPWCFj+kuzu+SxYLFrOS8FmzQKNgYyftgQWcomvwLLey5dTblaPf8nyoPlPRqN
	Tu3i9yu+KRtyvXPjRa
X-Received: by 2002:a05:6a00:3a29:b0:842:5b63:6118 with SMTP id d2e1a72fcca58-8434cd0b6e4mr17240752b3a.3.1781603080742;
        Tue, 16 Jun 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a29:b0:842:5b63:6118 with SMTP id d2e1a72fcca58-8434cd0b6e4mr17240725b3a.3.1781603080221;
        Tue, 16 Jun 2026 02:44:40 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accae18sm13133819b3a.17.2026.06.16.02.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:44:39 -0700 (PDT)
Message-ID: <521918c4-fea2-4fc3-bfc6-ab2abc275ec0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 17:44:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/39] drm/msm/dp: add an API to initialize MST on sink
 side
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-29-b20518dea8de@oss.qualcomm.com>
 <32jtwnkusxultvsgvnalrvccfkcyk7744yf4d42pqm7wudysvt@l4pnrzfxh2f4>
 <1fe8d286-7182-49ed-b6fc-dfa3766f851a@oss.qualcomm.com>
 <kr6obgjfl3c6ggbzkb54pyb4zevcmjvhlq4xho2yej6kynj6t3@36kxpiliyt2u>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <kr6obgjfl3c6ggbzkb54pyb4zevcmjvhlq4xho2yej6kynj6t3@36kxpiliyt2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OCBTYWx0ZWRfX1qCdxcFqYqs0
 uOHgDsuO7yAtpb/azYmaX8YtqnbNd9TykBQOxvVA5tFsaFUx/dB5V702l/Ki0tAnS/9vR2vfN6y
 BrTe7PNvAi1PYk/IGQLGxmBnWVpUDcwVcAdjHgLXg+8tm9cG72s1fFxdp4fwEUusgDN2HnTuM4r
 sdE5axbQRpeGo0VQwV0pheCK41C3OYZUo2Wk+CEhBe/D/TgSUA0pZw+ZOT941OfHjRknX7g++dj
 qNC4hdV01rDHsmUR7yzASzBuhlYFDeGLMUbjJ9AhuptsZ3FPrT6VEIOk+Xz26oZFZF2Cvc9yOrH
 RUQV9pqOt4N67oQyvq6sf10jH4BFtbRCFjWSOSfLk9ufFZBqs6CA0uLUwTo0mIBl48ty8A9vYch
 pV1FA7CEMxQ+3UNVgaY/MDJ1fW3gpriJIeap6NFTJE+Q1ALxDP76WgIyFC8MoXS+SJyGAaEwBdj
 4hfwbtKFLXzEqqm1SKg==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a311b09 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iQs2M_KxR2iUDnadKT8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: m-E-Pm_y094Qs3DasSXWRM8dInYNjzsP
X-Proofpoint-GUID: m-E-Pm_y094Qs3DasSXWRM8dInYNjzsP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OCBTYWx0ZWRfX3IUd6/FBy6pR
 kT4oBUfW9YeMeefG6IDrON9k2u+q8Xa4qZF2s8YX6CIhl4ybagbsivvKAtAI9WxQZ6tOipOJnkE
 osG+yGJUq9hRX8CxaJ0yve4v/lnbAvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2518C68DA86



On 6/16/2026 8:45 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 05:02:27PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 8:15 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:34:04PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> If the DP controller is capable of supporting multiple streams
>>>> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
>>>> DPCD register to enable MST mode.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 57 ++++++++++++++++++++++++++++++++-----
>>>>    1 file changed, 50 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 8ae690ce2b9f..abf26951819a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -14,6 +14,7 @@
>>>>    #include <linux/string_choices.h>
>>>>    #include <drm/display/drm_dp_aux_bus.h>
>>>>    #include <drm/display/drm_hdmi_audio_helper.h>
>>>> +#include <drm/display/drm_dp_mst_helper.h>
>>>>    #include <drm/drm_edid.h>
>>>>    #include "msm_drv.h"
>>>> @@ -270,6 +271,40 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>>>>    	return lttpr_count;
>>>>    }
>>>> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>>>> +{
>>>> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
>>>> +	u8 old_mstm_ctrl;
>>>> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
>>>> +	int ret;
>>>> +
>>>> +	/* clear sink MST state */
>>>> +	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
>>>> +
>>>> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
>>>> +	if (ret < 0) {
>>>> +		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/* add extra delay if MST old state is on*/
>>>> +	if (old_mstm_ctrl) {
>>>> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
>>>> +			   clear_mstm_ctrl_timeout_us);
>>>> +		usleep_range(clear_mstm_ctrl_timeout_us,
>>>> +			     clear_mstm_ctrl_timeout_us + 1000);
>>>
>>> For 100 ms you should be using msleep() instead. But where is that
>>> timeout coming from?
>>>
>> Will switch to msleep(100).
>>
>> The 100 ms is an empirical workaround carried over from downstream — some
>> sinks don't exit MST immediately after writing DP_MSTM_CTRL = 0, and
>> re-enabling MST too quickly broke topology probe.
> 
> Comment.
> 
Got it.
>> It's not a DP spec
>> requirement, and other drivers (drm_dp_mst core, i915, amdgpu, nouveau)
>> don't have an equivalent delay.
> 
> Why?
> 
This comes from the downstream implementation and was added due to 
issues observed with some dongles, which reportedly required a ~100 ms 
delay. However, it’s unclear whether such a long delay is actually 
necessary (e.g. if a shorter delay would be sufficient).
Alternatively, we could follow nouveau and avoid adding the delay for 
now, and only introduce it if it turns out to be required.
>>
>>>> +	}
>>>> +
>>>> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
>>>> +				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
>>>
>>> Isn't it too early to enable MST? (I don't remember this part of the
>>> standard).
>>>
>> No, this follows the DP 1.4a MST spec. DP_MSTM_CTRL must be set before
>> topology discovery. Topology discovery uses AUX sideband messages, which
>> don’t require link training.
>> So we enable MST first, then discover topology, and only do link training
>> and payload allocation later in atomic_enable().
> 
> Ack, thanks.
> 
> 


