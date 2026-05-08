Return-Path: <linux-arm-msm+bounces-106658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKQJISLI/WlSjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:25:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 052444F5B8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67FCA3016CE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEC23502A5;
	Fri,  8 May 2026 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihQ3tHab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hcsj4nKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9C26E165
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239519; cv=none; b=RBDN7mr8/GP7LOcfsw71aP5OKZ0TWz1XGF4ATWAmP5JxoAhG56KPIUO1gxj6AjPTNeH4VvPJZxSnCbyWY6LcN65vvYmlUMqouBOhXG/+luOMIR8uFqHQ1LWgJg/V+OB9ADBY3TZ6+7neKJL8zWfptQ6WaTZ0e76AM3wmXLcZct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239519; c=relaxed/simple;
	bh=Fcf3hqkt0KTZlZK4mZmmtbozkB3Wvph9spBKw0msN+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSNwr+f39RhsHa7wcDIvrD20wgP2ZU6bvg6GAOJWXMeJdjmLD6+WZx0JUaJI7/UNPMsOIdfju0g/S6rpf4owNn12hF1JO86pr1h2nyylzmijU2maaY9NVJtlsgMAak755/aOG7arDHnjcVgdMNZ+AYHZHFuEYMeACOHBH+yiynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihQ3tHab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hcsj4nKP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487vhPO2384116
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=anKM1JfvibSn5rk4PhrX9Oaj
	9NxgOSekZqCV80cWonA=; b=ihQ3tHabgvFAcviy+hT4fQbDWshYsKA2XeUpbz0y
	N74FrKbQVZcZasnni8sBpWL2lyytwPlgo/WkuL5C6JgKfRCSd6wTq0iJPQFq9iZk
	kkVh9307SfM7+oyjeMLH4TsqQ1Di20AGw8gsf30CS04gurj2DI51HO15XSGLRQGQ
	AaGSlRzbJvfcCl83PMj7EPRIslM6Mwbv6YZYtZI/hrgythiEiK6tp2TYFCwZ7L2p
	3jshbtXQ3UWQpiOy7eUb6+F79zImW5XRYOwfQd0rrQamKkvvn6EaJkqXunOB6NXv
	zV2sR21efkNzmVA3enF5HEQN9R6tyXDxJvt8IJozvH+f7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukume-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:25:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so42239981cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778239517; x=1778844317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=anKM1JfvibSn5rk4PhrX9Oaj9NxgOSekZqCV80cWonA=;
        b=Hcsj4nKPSl9ep5AlQvzl8NA8NQN0Tuoa20IAY4ayQmg8vCcoB80FcSXWXyblYzpKJ5
         diLEmIcQc7AZYOCXY/+xZPCkpqpqwMiT5IYrm0IMvrZVrncch3wGdBDzxrcN8lHNLWCp
         rKJ8WaHIiFo/upNgO2dmLkyYbl6Uet31IlqEl78Uk1a/Ef38etkAYiTjR5brNfanh5cm
         L5m1oBAvwjFBFge05RZYA9d+Pm+uDTNfh70fOiq+z9CCn+4YjINuym+uSQ9L/gwu1oOi
         QhA9zLbQXrr4cRM1zhPXZQgN0vw0f7dar30Lz5qrcNldLz5qX8D7vJWhTVG4rJS0K7/f
         753g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239517; x=1778844317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anKM1JfvibSn5rk4PhrX9Oaj9NxgOSekZqCV80cWonA=;
        b=n83buQxWVmLUh/dp3156Y2w/fgHnALccsm4BWqiCTg3C8dMUvPxQgf1GEzbTsv6Lbo
         UIjISbLFNRvYmM0GaIhJzuKPbgQp5lHUgoP7ko/y25s/4Ko/jqUkHY44jAiDEHIVKC5Y
         RUXXD9BLZQ8xKnSzxFsYEjSQ2gJ4fpvuZSRRgomK3iuZexx3LgL4sMfyEPN5w6PUOx3y
         yt/+ImxGX3GjGuZYDLpSa0z+en1suo9L5AZv86Ujg7IUydK2GvOPebWOPao3gFsbVql5
         Ca2Hj/fcnOEAlcTSfOJAITcR1hZqQBKpO8ovjB+0dDLKzfPxDSj2UGSprCazjYtLD1i/
         Gl5g==
X-Forwarded-Encrypted: i=1; AFNElJ+eZvcr5PsXA4Mal8SDe3kG+E2d+0Zf/7CmX4LqITYlUq3MgzP7oojn3AA+UUY/HgVQuGIXi07J5XvNDCWA@vger.kernel.org
X-Gm-Message-State: AOJu0YzgIoSWWf1W9BGR4Vm31J1Iht0PkQMizVQ3ZsmvgbugI2Uxh9uA
	7Y4TzxM9T8gmAhqaLbt50Z38COCn7v0xomv6/xnTIU4szj38SFUpvfz24chKIpkAmbMr9MBsmii
	u7lZVtexHh4Au1/ykpGwo2N+GgLu0Qq7+FQ6/FWvqBCGCg3bF5bEUMX1LPvGUL1Vjpp/i
X-Gm-Gg: AeBDietMxQHwthQZi8PzlLWM/AcyBIIr1AEqvjSCOB0FyJrNi1a79cSK2J23plPgzmM
	YzzBZLMPzwKt2sTA5dKU++RkY8zTnxjXzdSg4eRC83V3MHMLxvtlPF+BUtLnoh4E9UENWifmMRY
	mWu8jE+WPb5Ilg9sE1Ek42SsQhyYxTvCXiwkAWKrmIYGkLwbZiSVRRpeagFXsibLPgZgk1xmx8B
	GraIqc7iz9LymbyIZ4K4/Rucq4KqPXBIIb3G10GSzNsyTE4mPRTpjNN3gMStP0+JvdvngjiheHt
	0gGUR5ymNUlc2LXRuO6ju4U+H9xmfQIWh4ii3ZqDTEAyW3jLlJcT7WmGRKqDoFfpDOVZZ4bg6sT
	hk7utCMy/DoUNeTNT3Jg3XBQ0pgrMj+PgyBwH68dVagdQrYcxfMnl0M8OCTTjChsl6lI8oz5AiJ
	lrJXeugUHo4HIsGTZCSb0IKcMzd7UecpNWnrU=
X-Received: by 2002:a05:622a:1e87:b0:512:e813:7ce8 with SMTP id d75a77b69052e-514621c7db1mr173264921cf.54.1778239516905;
        Fri, 08 May 2026 04:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e87:b0:512:e813:7ce8 with SMTP id d75a77b69052e-514621c7db1mr173264301cf.54.1778239516297;
        Fri, 08 May 2026 04:25:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2cfsm447818e87.25.2026.05.08.04.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:25:15 -0700 (PDT)
Date: Fri, 8 May 2026 14:25:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 26/29] soc: qcom: ubwc: drop macrotile_mode from the
 database
Message-ID: <hrt5j3qjh4jyghnosjmhp7d277npx2oe2pqbqqogeene7mo2qf@jdsrkryutvjj>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-26-c19593d20c1d@oss.qualcomm.com>
 <2c43e6e3-979a-4413-9026-e6ef28acd3a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c43e6e3-979a-4413-9026-e6ef28acd3a7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3f-tlxsKirhIrxOGr36DXRya1GGGwHcM
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdc81d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8HL270eFVbbVbu2OkTsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOCBTYWx0ZWRfX46gLjJNBLSPg
 YNmjqhMdfdDpVbCVzsAAxGqDMHjgsYkFK29iKo1ZDbug90K88iK2OmAUUp5Y05yzlsZu515K+/5
 jjQcU4yZy2d/iH+IUxlTw5VIGpULieXq8VFC8inmqZqDDL90UPLKuVp6ibsj7GTHZR88Ptydig/
 FK4AMQwbdGgV7cleK4n72oYJaOkfLkGU5lidb1JPsTZqqEhhhxy7lREswkW6Bj0d5Cvhzlh9hEl
 lQ5a3q4vGmDFrTIBYfQQpN8ZBmSTZMM3wS9Y7J0UJcdgxYcCHCDACZO3OEj/ktraW34nE2nqBNi
 483k5Y9Sgif9n7QOPmoJ/OF0QuqcDP5XYEgdlLNMtZuJRfnCR50UZ3ZcLsPTzCb4BzLlBeGcXeb
 Zwja7rcBcjWz5b5YUItHLZhVK8Sc3fJSz9ao2oSnwnxHyt3BR0eNA0hNf3P4kuuwUayjsILl3qq
 e1H58lo95DWt9CwmZgQ==
X-Proofpoint-GUID: 3f-tlxsKirhIrxOGr36DXRya1GGGwHcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080118
X-Rspamd-Queue-Id: 052444F5B8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106658-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:01:12PM +0200, Konrad Dybcio wrote:
> On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> > All the users have been migrated to using qcom_ubwc_macrotile_mode()
> > instead of reading the raw value from the config structure. Drop the
> > field from struct qcom_ubwc_cfg_data and replace it with the calculated
> > value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
> > UBWC_3_1 (with macrotile mode).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  static const struct qcom_ubwc_cfg_data sc8180x_data = {
> > @@ -89,7 +84,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
> >  	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> >  			UBWC_SWIZZLE_ENABLE_LVL3,
> >  	.highest_bank_bit = 16,
> > -	.macrotile_mode = true,
> 
> 8180 should also be 3.1

Indeed.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

