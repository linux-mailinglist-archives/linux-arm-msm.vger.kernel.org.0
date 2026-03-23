Return-Path: <linux-arm-msm+bounces-99367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBWLAB9/wWknTgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:57:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1C2FAB32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF3C632444BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844EE3CC9F2;
	Mon, 23 Mar 2026 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY34ygo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbN/6UOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BE3C65F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287759; cv=none; b=s+HXtHJO6JApXDADuj7dRPAeSz6afZQ1GAoh6P3pbN3Xft7ypo/43mz7uskog9kDZ4FhrUPUoBrLkvMzw8B8kzSxZd8cMLqnFRVlmcEgNQif1obbUKHqftmBIc0MZ5xb7hO1FydOeoHcdpuPld2P9AqHeD4cN3n2CsiTvQds7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287759; c=relaxed/simple;
	bh=KCXWhXnyHjf9ja5KBbiO+pF8qm2foi+AAOpFIQnddSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfWPacKVN7r/MyZySzQaGPh/3m7cN7KZMC+UEt8dILSBuvLCtUkyKIS+4Gg9fwRarZYNyr3CFdEMJBSgAxBAbQ7JhPZvl/PhUDTEWONEz1xuF1rR5mzoGOqK+E4BogIfL+fXgDf9PSm3DUlA1RzwyFQbnz25Rd0UvRq0TFfy8lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY34ygo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbN/6UOG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGSm22488903
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pq+HuNQwTqCN+5rhLbtTlQld
	tHfnqWRK8RkRZUljdc0=; b=iY34ygo8EkOxlNegdFpGheXXNyS9VmXO4q7MTT5k
	00T02AQyevCOW5SYbIK1UtjY0qdxcNlbEQRQvK0HDsIIZHYVYFCd8hOva7pjJQR5
	kCvncTQqHoBO6zEgz61zJim1GgX2mH1Y98g3aANB6PYDinc50Gk5s4bzz5Cb9vd5
	W2J5MQ1862ekHkPNqiMvOoJ2s/KJqXUFa6E6txNKVyBaO6AFmww8qy6WL6/ongYf
	hzoxtDShycMAtrjoz/MWRhNFUXwbUYIr5YktgQbrPbgRRvrMHAUsL9dP1iwkyn+u
	bxFLf+xVg0A4/aS9ycs373gtrwcAbtqKm/kdAzgHyNjUWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364js13q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:42:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso20805541cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774287757; x=1774892557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq+HuNQwTqCN+5rhLbtTlQldtHfnqWRK8RkRZUljdc0=;
        b=QbN/6UOGeYbe60NY9hEAQmdhjNh+LdIgvcVqlGbV+nRqBTotL8AzB3tuC3KRfQqSea
         c5MnJtxqDuAhRqztKBRtblUT7ku21kvdLGJ1r/kJ223uiWVSpxoSAQXLs+zdkjItDtA1
         8AzBipKHmPGaMy/Wi7RgqVEcsRv05dH6dPwLIxuZjekfoptXBiWXxEF1z83OSh8CFpG3
         qfgL7tVYVFwBkhbvR16Jcb4d1pUbHYDPr4Gw5jR/cqT26W5mUUEkPFSQbY+j8BzssmFU
         wPrz6axNia/5PnGMgRRxELTv15Et2L8a28/Ao0qsVcYGs/H5yBhHG2tU0Z+j2WAWG9zo
         60QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774287757; x=1774892557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq+HuNQwTqCN+5rhLbtTlQldtHfnqWRK8RkRZUljdc0=;
        b=h8BxWXXvZbSBsCv0rqg7ZcBx2pn/blaZoOdzVLC1tNOXj5DbrLjBETNTWoN4TJVhlH
         f1RlAvhnq4TA6XARgyNFiBSvW4PJk+PJqCJu670iJqawS4DKBAb1D/4cG+vrSfPXOa8A
         WZNQ20BzUC0LY/i1GTww1wW/2xPexTc/noHD6YhZWYNANuHo2IjJArjyxd1WfOhqsv3M
         g64L+EFw0A/LBaPjJWJVicfqoxz9TVIlQAZYtwfwtWGCntRGqOL5FAr+E9562LCKJefV
         7V6w6NoAn2mVF6/OY8sgxe9fpIa1okUhTUACz8dWvK2c2VghSPkGAhjg0YI6pPIwNsr9
         19kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXo6zEE7zbxErPsMgy6cD0SJJywz1MFgbGBZcIxDfqxP501mQno+zApQacFHPzm5Ct2LUbBJwNERJBggpe@vger.kernel.org
X-Gm-Message-State: AOJu0YxvuRjX3HTj3DPXOVwFS999MMfTJBYfsFWmrKnL0lsSahS0bv8U
	FwmU0GI+ZNjD6ojcmny84KMTvyP/qkvs2lHTt5xPspB7P/JN2qK3j9bDutgjgsn0j8/uAmlCCYt
	YuPbYTA8OCm6PpDEUUAP6iXX/XFdx3fN3rGg6zdiNRFL2BNs76rM07ag8QLwTnHao/eVA
X-Gm-Gg: ATEYQzzVpXPIv2DszLPcUOe0mQUvQa0qEs4zvJABW9wU3TwUANfa9doGB5pGlIJQUMd
	KJgBLfvhziX0BN1HNUMRY0Z07wgk2yrODBIuFU/NG1CUX+1K2l9Jv9TdkB17nnPE1CNr3+ri6iv
	5e9Wq8/GFwChMpUubQgH4Cy1wPcVl2QtexQmAF1UJ6QSVw9Boi6DXOeXG0bWqKbt6pd/u6BPfFn
	UejSSWVwhSK0bEv3g+94XyAl4aQjfDRTeMnfoX6gscIuNsC2aIXxwD67sWdS6CQ3PKVvQcuKESF
	c+lO1n7mzVA4iFkUwUqHhWTVgWMcwX776eD9k9KqBCT2pYd6Szh6nVBu7vorUk1hImKVXzxWFKQ
	CzdmXQ0Q6UnO59hDtNASJt1/k9d+k3tyK6wsJfo5uEwhB9vjEiRzB1t281no6ayfUS8j+A/Kh0/
	CwknxgVYJWFJnRyI3iKkL2UU4objfIxh8XtRo=
X-Received: by 2002:a05:622a:1a91:b0:50b:551d:ca7a with SMTP id d75a77b69052e-50b551def56mr94757591cf.52.1774287756497;
        Mon, 23 Mar 2026 10:42:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1a91:b0:50b:551d:ca7a with SMTP id d75a77b69052e-50b551def56mr94756921cf.52.1774287755909;
        Mon, 23 Mar 2026 10:42:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f93fsm2715435e87.21.2026.03.23.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:42:33 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:42:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Add missing aperture_lock init
Message-ID: <wzmg7blv4xuvdiewbnupiswualoqo37yq2qekbfj45wuek6a7a@s37pe4q2sbis>
References: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: vj4mxTY7LMiIhI1qm3fBHw35xQvPp6PQ
X-Proofpoint-ORIG-GUID: vj4mxTY7LMiIhI1qm3fBHw35xQvPp6PQ
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c17b8d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzMCBTYWx0ZWRfXz1eUyZoQuxKw
 XkjVci+ZNJQFe+hq8RudEBq79dRzUsgyea89x5W2kNTjJRA11Liuyhvm/4J6x8KEvI9W3OWInaB
 WLR0+a+luaPHE6YgXL9k4PF2RNDeAhq2ACu33dpm4RBUxGzWOlYUe9WZi1l75feBYyNf+JIeIk9
 ubgtQSr8IZs0c9RCQnkhlHFEcS2KiRAUOyRvs4aDrcstXw5NXplPD+0XSMaLc512FDTdo/IulQB
 +A2/GnuAAT0yIRKjvWIjjRRzwB1E9rNhSGTcF6UfCu5og7c3CZCdQLSjUIwcBfu9NG7NNxfkTub
 hGzaE0AM/6j6p3MHsLZTWU35+OnrR1Dx3yl5eFrlQpf2Pl0/DzJyw09k7qJ7qkO48Ev3UGk0Nd7
 PZ02p9AXOhsMcsVBARukDBzYkdTV9vBkH50OdEkUwnq/vr8RIga6G0rfsnXNvgWg6UF8vPR/KFu
 ecXug4JfIFGxp2N96EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230130
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99367-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67B1C2FAB32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:16:02AM -0700, Rob Clark wrote:
> Looks like this was somehow missed when introducing gen8 support.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

