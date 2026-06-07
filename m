Return-Path: <linux-arm-msm+bounces-111593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ykNNNwrQJWr9MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:09:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A1C65173A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:09:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MnlCSvn+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYZ916bi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F7F7300539D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F17A30DD1D;
	Sun,  7 Jun 2026 20:09:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FD1714AA
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:09:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862983; cv=none; b=mvMUCEQ+sYDKdURqBwnEeBKpf93vFDYmHob+vt8ylLkYW2J8cinAlePCg4pQ+IgK4KFFzICQj4/fM76n+to67M8SBTii9ULQiGOoonI5NMllrhSDkKFGOYHGrnt/ua+luhHH9zbetvJqShwSAF5b1Y61CGOK7iAZQGvSJdys10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862983; c=relaxed/simple;
	bh=qMsCTphcyfJwG2keofCj3xV6GtspNvWMVyaSFJHMNso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKNwjaUvlNyu8SEnLlcUZOy6bcpUolqJUlNtsOgMWaQuYm2Z33Wo7GeTsL7qji1wRLqg3QSTNc+jGpqTt0X0QTxkULFbY6Tz/zdzWEGp65MTaveVwI2qS4T3HxJyc1BBb4bhu5wJohvRqLlnE30qA8zt4GyPUSoypFmrTgDhVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnlCSvn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYZ916bi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JQHF51383817
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rxbhsmoBjvBJEbNFkKWklg1d
	0CARO7dnLafDF3eTTBU=; b=MnlCSvn+F+ACoVL5qhGNGP13DFXizdxPn/SZhohn
	sqKX1abNvBa6FeBf1Z4kf0bnTDupeDMEZ27c8lYEP5hZ/j901dj2l8pdIhLsM+3H
	pGKpGzyQ2dza9EknoNkWlaUoIDuUqF2M7wOpJjFKxBNPbiGUJNQ4cdE961xG/f0n
	Smbige5Z66iR0YRUBBvDIhceHCI6nXMkzSunQySIw2a9c/H9tc9Yc6QxGWyijB8M
	NLqSOy7vhhmRRUSrGZtXLD/TVi02J50Dvr+rl6o/vckIYLfc5P7ches7Q48fUUwZ
	A46RdUcSzb2hNGJhmuWl4FbjbY0oKls/Q/JBiVvMNRjw3g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ckh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:09:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd441619aso1499393137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862980; x=1781467780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxbhsmoBjvBJEbNFkKWklg1d0CARO7dnLafDF3eTTBU=;
        b=iYZ916bi9PgG+Ki9dAZjU/Jj23/Hcm79pBsPleGStAmpQS+Q6x3Acq6DzHUFyCEdlQ
         xRJEbPLbcg0NfmbpVZhKqpc0pN9lugJv/R4BsJiy1sG7D/10SJDXJmeRSQF/YqKCqTa+
         yTlmdahV58QcC1O1po/gRaFLyuAS+39Esk02OeppPl7Bj9E1QOCQ8a4DXmQA6A53uT53
         U47bsKXxwQlp1qmwrbYh7SgFKlprj1nRnvGspiF3ZyNiimcmngrs7sRjwMmbomHepV2p
         wog+yEjAyxSHL0CU4X4d5dxcKQLh1guPA7p1xL4spNZLj1qyHddPyqIW0r3Y7hw7BzQr
         AFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862980; x=1781467780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxbhsmoBjvBJEbNFkKWklg1d0CARO7dnLafDF3eTTBU=;
        b=c/dAt53hUBwbpA6kMPyowIPc0KkY6dfShhg1PS0+YCjQPkcxj8ChIFksxxRAR4s8sv
         BqElb/gic+PrbYK6ZyWCo55TIFl1zgb9cBLlHMQY5ZOhhKKQTBDA4BZx/VfHEMh8HDjg
         ezpbLzIQZkDsdBmYcYfLHe/EN+zqkHXKMCZRC/z8w9EmLd2hi40bXSEPG850Z7eyTamv
         NlCU635qe+vqFUG4Dj2eEx3Pm6PDSh4lj7mp02xFyx+lIdeQ/X4d5892UuhzJsxByX+y
         3e4VP/q72YT80xSuU6dK3mwcqxzJnVRFEytIlCxH1A5XIAbSZHu6kCmUK0TE33bynu1w
         VROw==
X-Forwarded-Encrypted: i=1; AFNElJ9Gb6j0/OfmzkEYSm900QaVmCgEyZhwoikBL6jY/3xRCd/8UI8ZfB3i+pqNDI28p0jk2U8r5AQ2l572DPdy@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLQwtLOymevViuHNJtbIs1DsjtwsFU0p3zZjUQv8lQfAQHvBH
	dOWLmhur1f88hzHynRcMVurdgez1qfSIeWsjJGX+x62EKvvP0E563nzc9lXVXCx+ej5PSvpIr32
	bdcXTQnA7d9+41LM5F1183uux54E8c0wsq28Gz2Ys4NHu2Q/CytHSqy2CGNI/m3q5K+kl
X-Gm-Gg: Acq92OE/DxxdmLohpiVUKqszojCwKxFgiNpuwYmbVO3XoIeize2cFtgcOqA2XNcnTUo
	g4cd7Oji0qNlJ7cH1I9U+GxziKSmbjZin3Y505T+Y5fKnW8kmnoGN/0j9FJbQb+HfgyJCbW4yLR
	GbBsFNhxkiyyq1hPB1bdrglojNu0RkDUzTOIv/HAvjlssp7Aa327qVOd/ujSet5PzWODO30sZLr
	JR+Y+u5WEgh8QmppoPj798U+Memw32zGJ9SQQZuKdH4v41dR4nKm9kKCzcc/PO/VNsmM2gmN9cM
	394uSG9r63vlRHcmjJsqV8WAlds3v2uXhqHbjp4jy5LcdMI66XnP2QMVt8wBMEc7tMF9bcx7Teh
	EGo8ClX0AP7POhMx6hYH72KVOgCUd4g/IluglvobtvFjFbqorSnon8lNI4GhSNrHnsVPUfJRui9
	wJCqH9509wp48IS14giU3emCj+fadGHpqvOLkCBvS+oPO4Ug==
X-Received: by 2002:a05:6102:c91:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-6fefa60c024mr5156259137.19.1780862980421;
        Sun, 07 Jun 2026 13:09:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-6fefa60c024mr5156250137.19.1780862979976;
        Sun, 07 Jun 2026 13:09:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990438sm3240683e87.67.2026.06.07.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:09:38 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:09:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Subject: Re: [PATCH v3 1/2] media: qcom: iris: fix runtime PM reference leaks
Message-ID: <m32djjrl6mviti4xnasvza2g2sqbvfb2gw4326vph364xpozah@wprdx45lfn2n>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
 <20260604090059.46355-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604090059.46355-2-dennylin0707@gmail.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25d005 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=lv37cNiT7hznduzCfj8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfX2zQmGC/w/srU
 eLGtyEuBMqx3EXzXh+aTJXfgtcyCXgBy9YpJKS+L8kzg9cahHvnY+Ko0Leye1kFvVAwWnsr/dB7
 EOSBedD613BfL9E+AelH1RnXtizJFKAjrJoN3FTtGxFJXeJiat25C/o9lcCKYG4SwnMx913xQeP
 kqsqHKUOWxCAsUqhhyG69NxPTtXdWhFRdgddKp9VV+x3k9vd7i10FSaS8Fxs/YptbF6m8iW+5hs
 KF+iwvw2x8sVywRFEXs+7/oiIfkBJoUQZbvvlAdEhF0fxbJp7zjuI5Rwv6MAkqSAoKaqspBVJXh
 vi6EdAgtVkO+Fm7O7pLsrQUzPqFPWxpr0DRt2qRvme8duM+4XkfiLKIPYHz6REhrDCkzZMKq49/
 N+T9HV/KCzgLpYlpPkeIaNYVRQNJ5CdGLlZYoyFweLVMZOiPP49ISc/ojcY5CUMWk3dKOL2M3jb
 MVsKZOGPCSHBXIY9BzQ==
X-Proofpoint-GUID: ylGILXVCIAUMG0cWBvMxFFVP-xe1dmxo
X-Proofpoint-ORIG-GUID: ylGILXVCIAUMG0cWBvMxFFVP-xe1dmxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111593-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,wprdx45lfn2n:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55A1C65173A

On Thu, Jun 04, 2026 at 09:00:58AM +0000, Hungyu Lin wrote:
> Use pm_runtime_resume_and_get() in iris_enable_power_domains()
> to avoid leaking a runtime PM usage count on failure.
> 
> Also ensure pm_runtime_put_sync() is always called in
> iris_disable_power_domains(), even when iris_opp_set_rate()
> fails, so runtime PM references remain balanced.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Please take a look at Sashiko comments and fix those issues.

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

