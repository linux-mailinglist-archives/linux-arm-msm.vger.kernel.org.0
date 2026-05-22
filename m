Return-Path: <linux-arm-msm+bounces-109284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMdkHehCEGrpVQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:50:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1465B33CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE52F3012322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1388D3E9C06;
	Fri, 22 May 2026 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkkSHchZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hd+P62Cy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198363E5A20
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450598; cv=none; b=CpHIlRctV6tDp86Rx9bFXKfmTBUY6t0qxxBlSkAkYSODayP1YOzL0V4V/j74BG7Gb2wE31mQyakARnCp1O40O3rMNLHtmE1GzsrBtfBcNmGZiZ77uS1wv+OtYLSkB78XsC4bmNnL+f/xEmz366qSMvOdmE9zmylvKg1lMoovl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450598; c=relaxed/simple;
	bh=/9BMG0ZY43lZ2cmPAJLxqwxwRSTiju7yBLHNmkRvPhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUFTREoqJSWOFtJkXFUwjzVDeiE8x2qg+gAwXXk9k3dScEDnhQPGQhIqW3oIUOEMG7Gmn6Ce5qrwtHPlAXpt9jbJHuNC8BM5zCwCN5pfcSF2mfxi2+rghdrDuUeJZ74Yhga7kafhqBhj6S12BIlfKRQck7kIb7Y7mwex10kWM+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkkSHchZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hd+P62Cy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9AGLh1816083
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGLayqoA/lyQQ1EcFZcThAEASM/G/Sr+5X1wUf0ZVkQ=; b=HkkSHchZHkjUvBPb
	Na2DqDIgnFk6ag54FRNJbQoEru6shIn7/YZzXS7t1Ti/NTrtXZ8kceFyMmyNRVT/
	/EjqPdNMDhqVMEKHQSLOUUB+Ch6Q7nmLTev0SUc6iq2sw/u6gpikGbSU0auJeBX3
	67HK1AXZJSsMizVgVhP5AbQ84PhXKFTCIbr99wS5t5oq/g3PTCObsM/3WrSDOnLo
	orD26QHc2q6CYHPMC7Fn0ffbdrbMb4ozTdcwc/hIhcsV73/Kru7auTuPy36Z45Sl
	wQvIUehu7d7M6QMQE4vkBOJRtsxLXWIjV4xL/kQreTnQIBeofdSHr7UKtlNlmrRN
	Z82DrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1sts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:49:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faec938fcso17751011cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779450593; x=1780055393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGLayqoA/lyQQ1EcFZcThAEASM/G/Sr+5X1wUf0ZVkQ=;
        b=Hd+P62CyH3IJfQcKGEGhn7qeAa/Ol1fDs5u+LzPEZW68dqNgmNYcTw4uQNccbEPiR3
         G+HaIyZFy2IA51CxFmCXf44151Dx7hMUvwKWCDnVlwL231oCtuyVHqoI9l6O/0xbdcZP
         uzn+MZp2GKyOjtyEnHMTX6ZNL/m13CEdYD4CWpuLxFBZzm80RzH2xUCHMAoanN5ZMpcI
         t1hgR5WwAn3MQ0hl/CJNkTvfsijnVpS21AtLPMtGUx7O+ZmlThBmdyL5Y7yQwdvr0lXh
         rIeKXoisWRkN4tCPJ0tZpSsqGKJ3xy93s260Ql31hAZ3N53/k8cWxXZOUiXuQar8FbPg
         AuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779450593; x=1780055393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGLayqoA/lyQQ1EcFZcThAEASM/G/Sr+5X1wUf0ZVkQ=;
        b=ig6V94h91Hr9/uNfjQ9e6R9Pwltk3jWbJQ13nA+iN9HkA3xE7UY84WH5m7hOQ0inz/
         MYIno+K23PHFdMoP6dMVxphZadvvOE1M3ytML2m80/U0c0C5UnqGXOzxFebWeJ8ulVOg
         SQJcGQgnapxuvREYGk8CXX47OAD7C3MzOjdEJKckDX3Wx44akq8AuUfW0IJPvAEtt/mm
         hR6Oj0uvV+CSWtOXsfxQJSa5OQQUzX9bY2nI1VV4GM8znyZY1cv6VIOc2xUTgXnn5EsN
         O6g5k42nzipNrsJ821RAtpOynqf5NRR9uumPqCFHNu92Q8pocZD4c0F8DIj1yiylFnMD
         SLSA==
X-Gm-Message-State: AOJu0YzdF45yhG08lGjp1Tq4BXvENNE26aGrECvQNdK/A5ctZVgTX3BC
	fmPvMlsESp72fJhew7uzrtXVgd2ICwqzyA8ApRS2UVBqGYVqTxF8Qu0MvmmHuWrhRlkMNChFe4j
	iGRDHuNJhpm797LmsnitQo3ZnHMOqbekRqHiY5Y1yXI3P8rnW3lYPnS3Ns0XNTY5gYWsO
X-Gm-Gg: Acq92OHdTpzo4uRNZCB5z7S4WssYdP/aySPvGxEHU29Sa9+Vl92Szlcee9GxnmCUUK0
	1iM0CNfQkGy/iuEgM3kfr8bjQp15NQs6NrYeXyEHyiuG6QXuk6bh6FxaVVyWD6H6/A3pMEl8J7d
	hFDWsov9jIGp1SwIC190yJHYlzYrE6tt0Luxwc/PQEGng5B7+r9klwEV5NluO04/6Nx2btH5n5i
	h6Lby3oKaJU9HI8+bShqbmDhp+nj713Jg74+mnuoikrq6B+zBzwfjhW7ooIKcp3hZrerxSEo2tO
	uQ8X5eOwyyjFsuW9ARBs0htjUBrzRrWOBNWMI7nTyEzM6Q8kzOHRdzdssikE/TwXwoeUYh/XhVR
	a4mQvqj7qiheBu9GN3JsvK6earh215Z6V34qJnGjpFM+SXQ==
X-Received: by 2002:a05:622a:8d02:b0:50b:2875:5782 with SMTP id d75a77b69052e-516d43a2865mr28083131cf.6.1779450593440;
        Fri, 22 May 2026 04:49:53 -0700 (PDT)
X-Received: by 2002:a05:622a:8d02:b0:50b:2875:5782 with SMTP id d75a77b69052e-516d43a2865mr28082941cf.6.1779450592979;
        Fri, 22 May 2026 04:49:52 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca616sm46577566b.30.2026.05.22.04.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:49:52 -0700 (PDT)
Message-ID: <93327e80-c4fa-464c-90d2-26a7b08b2ea9@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:49:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/msm/dp: clear EDID on display unplug
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-10-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-10-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i3WQwLsQ7jQydf8jc-JyIpO6Sw4yJWxN
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a1042e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_8rHRARLNTRLG0PNjecA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNyBTYWx0ZWRfX4ZVHUF/CiPFm
 ZqMb9W9FzR0jjGJVirYkpSBJcE9j7yQiOuFngZEQ5uvWXBip/pGg3SvHCqjPAs7KV22t0jz1NaE
 3xDsW03/IQX7uFu5nR/3F92L+IWlqbZlDGsMJFWH02B12gLYe66Sf3ZkijZXTw3rbvlEdFcsR8F
 FEkve3SQFa1/KeH2By6kDdjdzdww1BTYQTSKIBZU13pK/nUJw1rD4crWb1XWJy/RAu5z5THCvUs
 JLG4gHbnw6KGthXJK6+SrzTEtKUZiRiMRbz1nNSp/BAZobfYA5uOs8BsN57/m93k9B/1yoHBXiM
 zIBRG0kVwqIE9nLNG9Cc/fhN6vEftoBo77ISbSXLuqnZCLFNkQ9L1stYAnglniix3WRGku5SMYR
 6BAdF+M85SzhgSozl7+1TZvjh4asXS79YBnjZHAo9UZ2lXjVJmb5OeiaZtYJlPGQvt1E591DDpM
 T/8wxcAgKUrQsWPB79g==
X-Proofpoint-GUID: i3WQwLsQ7jQydf8jc-JyIpO6Sw4yJWxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB1465B33CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> Currently the driver only updates the EDID when it detects a connected
> monitor, which results in the connector still listing outdated modes
> even after the display is unplugged. Set connector's EDID to NULL on
> unplug to clear the list of modes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 8 ++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 0a38957ea901..5c6a24ec140d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -447,6 +447,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
>  		return 0;
>  	}
>  
> +	/* Don't forget modes for eDP */
> +	if (!dp->msm_dp_display.is_edp)
> +		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);

Is there a change some ""funny"" panels decide to output a new EDID blob
after a "proper"/custom reset sequence (e.g. to remove limitations
presented to the DPTX at the UEFI display init stage?)

Konrad

