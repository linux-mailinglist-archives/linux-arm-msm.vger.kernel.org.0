Return-Path: <linux-arm-msm+bounces-107393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMZVKJ6hBGqbMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA75536BE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A659300B1EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1924A48C413;
	Wed, 13 May 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIA/4OT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jbr75xck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1CE37CD55
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688275; cv=none; b=jl90gDClj1Z0SU+TmgeNduvQjZHnHDoC/oAYWY5efl2CuTWf4OR88zT3mjR2zoYVuzfkg7kT/DGrTvlTb+HBja4T/adLMD9LddV6YyIIDyW08drFs5cO+MqeIxckLnFUhSttbx6vY8rm8OwVElv8JCiemtAq+UM7XAD26H983Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688275; c=relaxed/simple;
	bh=Qs2XBTiDF4twxkVNoOGxN5tYYeZY06mhA83jeys26ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN7YSdRsLLEoJ1pCsg2R66Jugl+HK41hrbSsD4vC/eG6XjtX2oJ7YEexi4zjn42oUmn7VkkxSWRbnJSnU0et07Pf/EJzdM4B69i6YPYVt62k+cjP/Q4JoRgIBJZi5UtwDL7SDd5BUhgsJyDYOnW/eqqkyaedLuSNRwKhtxqs0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIA/4OT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jbr75xck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DArn2w1393027
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=426A2DuhNdkQc7V8AlGZ+Pjx
	ceFjb7fIq81pu4rC7/Q=; b=EIA/4OT24XFRCjs3p7Qj2Vvb/8+QiOVo0Itjb/2e
	Jcze7I7JCbKmGDxF0k54RWGmwYCTr9Ys1kjca5hwUu5oGnmjw68gzS18cFEPXAiR
	xLkazyuRqI5YsIwDdUtlOUT6a+7d/7rgoQVDtOS2NpvQJDImnPNHXVX/MZqbAltV
	qoFqBt4HkNaRXaJh00TrXzoD5j8tn9YPhI+L3jJFqqt2aOv9E04wPpNSCuKs0YSL
	TpxsBASgEn2Mi2TqIUfE1j9syie3jrnODB6syzqc9QfZXexdeg116+5XRd1Ln1dE
	MO0Q0T7gLfJXwI2Ln7E8wNJ0nESC4VHDyA/tVYdbQdsdxA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262gwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:04:33 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dcde7bf859so12975065a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778688272; x=1779293072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=426A2DuhNdkQc7V8AlGZ+PjxceFjb7fIq81pu4rC7/Q=;
        b=Jbr75xckv9BHO4KrN4Vj8csBbHrA5CLuJ9hlniAMtNvE6gIgN23nb9REOKrg6S7xSS
         n6ENt/cMfz7ksDvCMGHOsRXFJW20JLdypszyrC5QmAEIErx9+zStQ5dCIKmHyOwwfsJd
         WY3mli1lFGkj+FUx/XH/MHJCf96NGjgVSWs4oiR8iRfAtZNM9bTF2lUiQ301UY5Ekkr2
         KXQOMAKChFvxZvaQEZsHttf422Y/qk17x+LSJlHQcM46GBMELkLchstf6tnW7sTNCbgA
         UCll3AlUA6O/M8tRs+hHx/gdMMDzhlxpx1rhDy+8Qjv5xqMCFJ7ukRP6WMUGvgO2/R77
         59zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688272; x=1779293072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=426A2DuhNdkQc7V8AlGZ+PjxceFjb7fIq81pu4rC7/Q=;
        b=lI2KrYDqlG+3RiKWhQShlcROFWiKpPMAm4GRv0oqqUJgxWuQv8knejD5KGRDfTGeDn
         aBKUxXPzgeghKbHoF+0+WP8rNYZspS1ajmTHPanhZ87ruIF+0tlB/tUPAhO3rHgBur9J
         lQJxNJzW9EOsApdH4sOwSeSUytmqFHYKFzlZdkB9sDAsjmmCAwZzApeKAUhGgcRhuKyI
         Cbd6RlIPmhE3sZnhg4q4C54JNpGHfuGBZIWK4jgm6AASMGLp95NJ8b5aagbY812nRZUZ
         srNf17UliUrKVM1cTRtW6g6LznvR/NUMHfwOqtcE748CvzfkJ3o3Q1rXH57xbCWXb3Ek
         YLmA==
X-Forwarded-Encrypted: i=1; AFNElJ/E+WE+HmGKIV24zuJmRFWbHe0MTJleUsqIk6dRZilExwxLrCk8K1XWQKgmcorwRzbptONnvvcr757zkMFA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyze06i7WVmKsa6NOFigF6c5HX+uh166UyqYfNqpWwxd7yQFwz9
	aqi88rLjPhdHR1icgt/roBJXOog3m+Xn1BelPgBHnR+GV5osvjseNAlBeo6kISS4mE0iasPSBbj
	fKHMZ655JR5kjLYd6b2a5uvy8eaFFHJi9Scd3/BQWVX9FevTZpa2zPlvcmuolG86YZF4wwz4MAD
	uR
X-Gm-Gg: Acq92OHloZeQoaTHGn/X1k6SPWVCHlbjCEHpCrUpTAZV/3mFbCz8RU5vRYtckrzJR+s
	hm3ynkCVl0UtNBkHEsaojTtotzj8VefiIbh5dvWNHqucMuuXMTWletF+D2whL3SQ8P7ERS14EHQ
	hzefbcdjDrVUd3Ij+rM/idWDiQsPd98EbsExLl3Lw3CTW9h1aJ7lxZDHOWXtObi+8Ukf63a5xHg
	MYj8mPognsB/tZnxy4qvYIdp4xIhvVLRARm/lIqbqNts+4jcjAozAYJKkzh97XIeY9HXL6Bg1WV
	DS5rbKV05Ik3PmKt8vINn46YIDvX0LkIT/2Y7vSq9/6nnX13a7HnW24xpr+5aOzxXb7M9M8bRsM
	s++bZRUX7j9v8KF8JESqg6ZDFh11Coqi5cA9ArYC90pjcok9NWmdfiq+GKDh5LLcgNE1oe6slIw
	FcompaiaotF77z0vLWUSkGlBQle7ABzRKl/Ik=
X-Received: by 2002:a05:6830:6f48:b0:7dc:da80:42be with SMTP id 46e09a7af769-7e3dc9498d1mr2121372a34.21.1778688271948;
        Wed, 13 May 2026 09:04:31 -0700 (PDT)
X-Received: by 2002:a05:6830:6f48:b0:7dc:da80:42be with SMTP id 46e09a7af769-7e3dc9498d1mr2121312a34.21.1778688271406;
        Wed, 13 May 2026 09:04:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d32dsm4099654e87.30.2026.05.13.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:04:30 -0700 (PDT)
Date: Wed, 13 May 2026 19:04:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
Message-ID: <5hsqbivg6iq3fft7ixidkkravgb6wehbcp4qevbpi3sudq6nfw@bazvoeqnkvas>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <fb377b11-c54c-4bd9-bf12-cf19d6484c66@oss.qualcomm.com>
 <35e1cba8-a850-4b6f-ab1d-754504545748@linaro.org>
 <1a86dac6-5ea8-47a2-aff7-062cc4b2f776@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a86dac6-5ea8-47a2-aff7-062cc4b2f776@linaro.org>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04a111 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=WYDAuKHM9Uzkw3jpnV0A:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MyBTYWx0ZWRfXwxLMHm1r7JIB
 YdkPpw4QyiOH6GHVKyThOOxnjLYPkuKVRJie3ggP6lwrESvN/ush7j5tq8KqbccmwiG4AKLb1ds
 nGw5fhZq91pLfLXAUbFO7YFssheVaA4ZyuGfvMhLn57/+4QDq/+q3p2Ph9MQICE3UZ6JA6HOGcX
 9kZHgN+5LHSbzejLZuIz4xJriAGOaf+zL4jWAslxaS8cVa6E59Q96lvFWSSJ6iNgL+HCwSxurR5
 yg5jb07cUj54ss2jpUPMYgOpN2JefgNgjpP2WUWCFTT5G6alvmR8jBpz1RiOCoEG+bK9A5Hcga3
 npAQkJ0TWsz2xjH+GMF9yWvlWpxnu1cc5VoBctbup+NhXs9huSqj9w2K5gja29HTvWaIpkLSRGp
 +CV91gFSUv2KLeXj9slqUQr4NuozJ7TunyN5rCMKrhSqIBePuUUtBkeUHmK/eU30zSYjKE085bI
 UZbE/GTSE4VzBN3CIjw==
X-Proofpoint-ORIG-GUID: lfG8jZBhlGldV9WPkyeNz7vQcG063tqH
X-Proofpoint-GUID: lfG8jZBhlGldV9WPkyeNz7vQcG063tqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130163
X-Rspamd-Queue-Id: 3DA75536BE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107393-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 06:02:19PM +0200, Neil Armstrong wrote:
> On 5/13/26 14:11, Neil Armstrong wrote:
> > Hi,
> > 
> > On 5/13/26 10:50, Wangao Wang wrote:
> > > I did testing on Purwa and found that the decoded raw data only has one frame, and there is also an alignment issue. Screenshots are in the attachment.
> > > I used the command you provided to generate the HDR H.265 stream, and tested with the same v4l2-ctrl command. Is there anything in the testing details that I might have missed?
> > 
> > Thanks for testing.
> > 
> > The screenshot you sent would imply the UV plane offset has an aligment
> > and is not directly after the Y plane as expected.
> > 
> > Let me check on my side, because I was able to successfully import
> > and display via GL, Vulkan and DRM on SM8550 and SM8650.
> 
> v4l2-ctl doesn't properly handle the events, could you try dumping with gstreamer instead ?
> 
> gst-launch-1.0 -v -m filesrc location=Big_Buck_Bunny_1080_10s_30MB_main10.h265 ! h265parse !  v4l2h265dec ! filesink location=out.yuv
> 
> The dump I have is good, the UV plane is right after the Y plane.
> 
> and also try to pass fluster:
> fluster download -c h.265
> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
> 
> You should have 9/11 main10 streams passing.

Or it might be an error (or miscommunication) specific to Purwa.


-- 
With best wishes
Dmitry

