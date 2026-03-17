Return-Path: <linux-arm-msm+bounces-98254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJYMIR2XuWkJKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:02:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBA2B0827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B67D0305CABF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6E377579;
	Tue, 17 Mar 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzbvPn3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym1WA4oM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFA21C173
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768875; cv=none; b=VAEYpnkz88jKOpiLZoLsC3Aj/BnqjrKJoHygEE8vFnloF9yKSW5xlmWN/Pyi82ocHoIt4dEEzLsJQD0k6d4MVhBS2tbu/0GlYsb9RZMdeW5Jm/x/xPo+zgp4728k7vKPnylxg1xr6DpBEuNYhkGQjT3OpODZK2Npds3ua9+CcnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768875; c=relaxed/simple;
	bh=WXlUzAjLLB9IO4rQSVq2VOKDZryCft677ROd7l9OrU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnHBvGj2+wJBF6hryg66kjDehv8GkfP3GyFWQu26aRELLVCW4WmdRmXmpit/JV6w05F4K7grT7KAwlZrZ1GgbDqUb05HD6NtxHJZrr5sXTYM4wZ9QSBmYDvCbZbZzg9HlAzgko81rlY9B4nVOEpnIeppJtPXquVjaVenkFN6QTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzbvPn3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym1WA4oM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HGfSfO1413589
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBJS1aektFIiTStuP3Gqvt8L
	WcVUItuSxfVJ8xAl4rM=; b=KzbvPn3/ULMvxghGUSNC42releSto922lkjjXdd5
	BQEz28XIQtB1Mcp9YFuhHggTfiKtzJcpHj/ivMMYWGvHSnLqq0LauXaW+Dmr+P8z
	pv0RdJpg6tmHQd41yeSCa91ddqoXcEaM5so/LwceYCZ6TiPENYhuAdN6YgBqVnGx
	9QFq7w+62GGtQSestY0jWCAvJlNw3OfDPszhVZXLWeyQPPGApHfTsKbRBbnSn1kP
	9Lzk2kpCveVF3Z7fcVQRsQc28UOTOze8cbLx2fGI1+S7KscQxc5eih/Wgn8Ejc2J
	B1kSdJV1p+G5mFANCURh03UszbpANfXNoqCbIGknA/n0FA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapug7dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:34:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so53389181cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773768872; x=1774373672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBJS1aektFIiTStuP3Gqvt8LWcVUItuSxfVJ8xAl4rM=;
        b=Ym1WA4oM65DViqpGzYUxc0X7J7sP7PhAzjyXQsIGgAHSSsOjpU+V1FTG8Y0x0yyOmA
         qWO4fa2GgdtzYQyiPoTRg2CddP+jBcicNaEas+oAromAufpMfbJ+GfX40bLGnaJ3fdnb
         WGkbHaKDmy3G0KVm3VMLCq3oJjbNSA6i/zVpKVXG0AvJqH6OxIw5Vn59xr4nI9/IcI6U
         DNB/ru0AdPiFtBz97IFRd4zbTOHO94YbV2lwa/crNiwkz31ZeWSHzkbqfLtMDZS6oSgV
         riwzOJX3UBs1ITGsbYs5cqCQkPeETvxFHDH86FqF9MZLEL1PeSIAdxgaYk0YreHnyR2Q
         VvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768872; x=1774373672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBJS1aektFIiTStuP3Gqvt8LWcVUItuSxfVJ8xAl4rM=;
        b=Sq+3DI5lLzu60gu+XEPKRsbJM5zVVFxk9GcHWRtJ/9hpDAO/A6mEmuFbauFwT5h/Ch
         JTmt1j7Q+7xu8P/HV9xYCmXN8TWbREheyuEJ535pt5kr09UySbQIl6d78M/4Y7fI7hse
         q1ZiqvZnTuqxOmf+cvcuTMYPC82YvaE2C27rS7wVLFdukyF4AW+20A8jjbzNCH/UEXHS
         J5FsJ35sM+FkJA0aDiNkgx+fl0p9MQRk2ZgVxLVv9ndehgRgGQW0qyMZ8hZbmMVW0WvR
         qyXmYMMeCGKgv+9GhTEZMEYPe27Vz9cuBWItQ01zUTt58H03EsgYuMsYFPXAEKIgqmH+
         jvEw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LoQ1b6+7svMkFXKPm4N4amMaFqnx7nmS4a2D+j51ppok6o2PNsVv9b+05aUz37aScnRS+b485FJlUZAd@vger.kernel.org
X-Gm-Message-State: AOJu0YwcU6FpjrcyxEfu6S0kvgpI94wRr5RmURYjvCbR0s/TQU98UTQP
	kuWUQplnqGXBGFXI7EwhAOnhnkEOOTNXb6F7rGkWmE8Tj8y9/CKDbkdLmbP22pGlIN04axSOf4o
	rF48J9SsTSBMt+nOQmfd0dAKpWQgbG1ax22EgOkEbiUq7qQ5dHjBcbHzDLQ26QhjRDkbw
X-Gm-Gg: ATEYQzykAtBdHPnqb/LJl40fNSyHoaFUoELsTAiogZpXNKT/WhDV9PkPRXmyQ5jKPXA
	F9XCNI9Nv+qHy6ASBSklr4pVLjzL49j+8WZJNSuJDDqvUwN8gbSGDaXiija7G7KVHYcPPU1L3gL
	HW6oa2hH+0HyAFDfOMVT2PnADp37EA4h6bxzfj4Qc8ThkVO0rPvdauiOY50XHZ5ojRT0SumzGcd
	GIOjLtkhtWgKGXWbMzD74kpH+YLdwb8eA+uzvdHKAJJCaDwhH8sVUnfPO4TXrDNxKt0qCg4qm+H
	XHLLiHGKcyXEW+SP/QZBydicTl53rqYUsLycV/qEzqHvhAIgy0BlbgDUPn+eVoEmaaufX4DvPoE
	GV0mSN6ZpqosA5pqnq56EqlyNX+Qg38iUqx9/8LoSyTq0Iqk+6QE4bgitTH1ZE2tBHSezJRL6LO
	JCcbOq0230SPj3Tvyn0BzYJLbvYtGy9QdofB4=
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cfad2eab27mr54298285a.55.1773768872265;
        Tue, 17 Mar 2026 10:34:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cfad2eab27mr54293185a.55.1773768871770;
        Tue, 17 Mar 2026 10:34:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c743b1sm11354e87.58.2026.03.17.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:34:30 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:34:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH] drm/msm/dpu: don't try using 2 LMs if only one DSC is
 available
Message-ID: <i2ev64yvef3la7codj7hfscuv7ag2d7p5lplfqav6ktkm3d3vo@x5hnmpggevip>
References: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
 <df44b8d4-98fa-4a9e-9c24-b408f406b124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df44b8d4-98fa-4a9e-9c24-b408f406b124@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69b990a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LbxHV1oPoWewQDzF:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xNf9USuDAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ZoEw9hnT7ZuqxarybVIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NCBTYWx0ZWRfX8xqoNqqjAe9S
 qzMmBWsSz7ZESlAlTOZEj1v8d8M8InLrdOa6osgNs+IBqC7L4390OamyjV4xC840pz+cZaTUWBO
 hCTus5+2bbxr1Qre8yOaRyXI1Wz5jYzxCsze89Ss9rvc5Vu/i8y2Pez5Q+6l4WOWvph906asj03
 XZCTiPDvcV9EiBobPWFmGHshgYw38nS1Hmc++098KeBYdaXVKzvYbMbPLXDquEwG2VNby7n9luu
 BC9k8X6jUpxR+LACwdy4qGHxnQi3mFeMHIhD1KrbXGWOt4l0terDvAy0ppeev8zaz6kdwX+TO2W
 zcxU+39tLXMM4hNkDDqaEywbtg6bFGAhCvjxbaeGsr0XSXxI7+N3KQHsl5A/06wuCKWTQdq1iQ3
 Vt/QkNUez0PTfhuQfOC4l+CgGU8oqCZ3Y3yl/EFtu7o+hJh9GqgRfmVHtk2QzMx4a6QcoR2KfIO
 PdCevp4htdTkDMlXJWQ==
X-Proofpoint-GUID: MDl5HECgaE9vKz8o_Yf669UQSex6srsP
X-Proofpoint-ORIG-GUID: MDl5HECgaE9vKz8o_Yf669UQSex6srsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98254-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,fairphone.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9ABBA2B0827
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:48:59PM +0100, Konrad Dybcio wrote:
> On 3/17/26 4:30 PM, Dmitry Baryshkov wrote:
> > Current topology code will try using 2 LMs with just one DSC, which
> > breaks cases like SC7280 / Fairphone5.
> 
> (why/how?)

See https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41

Using 2 LM/2PP + 3D + 1DSC is a separate topology. I'm checking what
would be required to fix it. For now this is the easiest fix to forbid
using it (it wasn't supported beforehand anyway and got enabled by the
encoder / CRTC refactoring).

> 
> Konrad
> 
> >  Forbid using 2 LMs split in such
> > a case.
> > 
> > Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> > Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> > Closes: https://lore.kernel.org/r/DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com/
> > Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 6bf7c46379ae..96b67ea3fb4c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> >  		topology.num_lm = 2;
> >  	else if (topology.num_dsc == 2)
> >  		topology.num_lm = 2;
> > -	else if (dpu_kms->catalog->caps->has_3d_merge)
> > +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> > +		 topology.num_dsc == 0)
> >  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> >  	else
> >  		topology.num_lm = 1;
> > 
> > ---
> > base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> > change-id: 20260317-fix-3d-dsc-4b073977ea19
> > 
> > Best regards,

-- 
With best wishes
Dmitry

