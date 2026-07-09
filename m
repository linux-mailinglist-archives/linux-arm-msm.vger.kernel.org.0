Return-Path: <linux-arm-msm+bounces-117965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7raDHBCWT2r5kAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:37:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD387310F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:37:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cKYzmWXx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E7r1xzxc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A42113045ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB65B846F;
	Thu,  9 Jul 2026 12:32:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1654229B0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600323; cv=none; b=OgxCSV+lANeyoxkDLTrZEKpSizrhoTWbWo6IIeKV9XxON6mBley1Hf4h5gkZoV1QdvTgUa/Ta3uYjiQ/EsA0WwSspX+kHIObcLckApFKHZhuBP8i/BotaYmtNXIe/VQFnXWf10vQTFRb8ut81QLGmH1wjYHkUz8SThFPNSxqA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600323; c=relaxed/simple;
	bh=vJw5TSrlrMKhWHz9vW8Jsnz80Thr5f3XAMuCUI87DYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nazf54tivS6siJLWIuJcf9KhQphU21nxmOw/Wj2PN+2eYV5fBbkj+tV4hetgU8Ssi4Yajtu4/LXuaen+py/cRGEOgfXciQLEN5HoPki+i6dm5ZM85/P9mWFggB0aEM61lbQKQikb/B6baH5aJjGmsV6eJL95I17FK9z/PuULkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKYzmWXx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7r1xzxc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNIa51525633
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wju7AjZRirQ1hGswC0rgHkeQ
	ovYtydkybyUplA7dM40=; b=cKYzmWXxYRs+KSY9M09iFK+d57gcjBHbMEN36oth
	4i0xia1hm9t0z2yn106sNWEwclVHSWqIQhe5yOi9+WwpZgWzxiY8kiqgf0IwFBUB
	InowDIRKRuPVshgClW1uCA0nxdTWXAoUDrCN/LcfVsOe+J18TWE1Jm3NbdYDnqtg
	4k69SNd+Om/Kfi/wQbSEBmHCXrGOArk3wkuXIMf2ZN+DiVr83eeqFpyNcBelROot
	bTjOfzmq9HCCCcMOktyp2/EeQw6EL4T57/yxbYBCDbNyc+Y0xbo++1PwvDhD1gHc
	pcscAF1E2CM+UQUFtIvO5Cr95lal0DrZr4o5HRrOr1zLnQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u3um7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:32:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-967973f71fcso390830241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600321; x=1784205121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wju7AjZRirQ1hGswC0rgHkeQovYtydkybyUplA7dM40=;
        b=E7r1xzxcrzyBZ/zqW7IX55tj0+LdYsD8kyo+Xaau/E7u+518Ygh+S8J4/WliQBbjE8
         ZR+lCdbnayfk+b4b5xCYef9Z1w++FQJ9hMm7/gsbvZ2IjXc5Vhnf1i3XSlImpRpN/2bw
         CeSHJpBiOesICQtzRrINqj1zqcwUaRDNXG7GXhhkvB8Du3ALG1bM3wKVMlDEQZOg/f3b
         FxgHyuMABq4/8NVUbe9d0NoacAX0Jvcz8VB0WYYnpAgB4pP8d0Wybz4mEdUQqFDtfZRT
         8iZd4SMjkQvjqD8AAwryhElPM8wnU9lkWIht99IxKQTJS3vn5EpVw4hB3morR1R3eSkG
         BnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600321; x=1784205121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wju7AjZRirQ1hGswC0rgHkeQovYtydkybyUplA7dM40=;
        b=e3kjbl68+mPZlYmWjBCJhu1lH4alPUjjaARm8HUA23HldW/f7X1dE3vMM2sdpTElkI
         YYGT9iVhbC6cLT8UvbRnyAobLm2VHRY7QLEohqmdYL+WJiuV1eyBJX5UWyNxQxgKDe4C
         IN6BUGZU0fHv8YNXsg3kCf26JbAKZJKsUeRDn7rUIHBTQaq/SMnkRlh5b9xzr2Ms6fHo
         pKVbfhAujWpoRKf/fDN8f3P9iKumptrdoKJuL5jCHGlR6JPe2nkd4uzl+6kfKU+PmtlE
         bJi274jXC/NZoZ5PokK0JwvzYSm5+Mum3V+BNDjxCqEqQIyxnSIvebTciLcfJ/PKLmHL
         OFYg==
X-Forwarded-Encrypted: i=1; AHgh+RojHULy3yPcxRoO6xdWf8g7hpIyXGfZQkq6IGOdFSy/U3blAxMT5nIb4KXakqhLQpB9urM/VKxTEnQhfnZS@vger.kernel.org
X-Gm-Message-State: AOJu0YyURAL8xB8aZ/Wu9KHFyA4nS12RjtcgpCsAaWX0/0YhSgZ4AoRr
	6QfMT/F5Z2ufC1O4ICSurgSaZOBrwAbMt0XK8bnrtrcS6RZ9PtWM+kwFp71/Bpalqfi2aXH5HZp
	VC42g95C1EuzkENBmdf6kNeRRaj/vlV6MLwIaYHUc1sjSMlY9Hkf5jd3CE5YGm67T6Spd
X-Gm-Gg: AfdE7ck/KFRKxjxVFmEguFTU7QdJK3MzTDEFuUaW4EB+BV35lBjX+BfpueG6rihTZrf
	wW4adOfLJjvL1kY1oD+3Bm51V2ISwkTo749LDGKLewMqIfIFI123TlUjScYwSLWujNzTqNeLeSF
	Yd816uUOF2CkMJzDoPlWoLy3+bGArjaV8G7bPbtpKn4L3zfpRSpOZkhkl9v44OmRwF4tnXe4eJO
	YWcheWsX5yYdFb79qnTBST1pi5ZLdr0rceIycw2AU/5gIsPEpINSjfUCwUmfiu/D7Xz3Y30FYtI
	etJgLpboTzFAPv9PQjvgu5k3turSs1T3wjsSNIp9bfw5qavibsEaiP82qQGBT5mhhwDMziwfJwi
	CgQybTaroPrWnettcmxqt9dkUwiSnW9xw8g6WOzkrjH/VCK59Fj2C7un72vrlsT68bmDcMv1FNJ
	yVQ7NnuKomkoJocZldo02d7fp9
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4231636137.1.1783600320465;
        Thu, 09 Jul 2026 05:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4231606137.1.1783600319944;
        Thu, 09 Jul 2026 05:31:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b0190a61b1sm268547e87.33.2026.07.09.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:31:58 -0700 (PDT)
Date: Thu, 9 Jul 2026 15:31:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, abhinav.kumar@linux.dev,
        freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
        linux-arm-msm@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run
Subject: Re: [PATCH 24/60] drm/msm/mdp4: Convert to atomic_create_state
Message-ID: <pkezqzojiizonlrb3rx7wnhbnztgs6aaaikou2bmooayigu7kg@mp2z6y3i2yts>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
 <20260709-drm-no-more-plane-reset-v1-24-302d986fe5f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-24-302d986fe5f0@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXwYt/onQOqx/a
 VVEAVG83lRU4cJ0VlKObR3rzop9wUFjuKk19cjK0s2pQA99DbwtwwKVUQHATo2RbpjIo0ZfBgKm
 iBAVKfHwLWT3yRei6LdSFktoG59dq7U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXzPzyIJnrdyWr
 klXdGiYk7BnaY1Itn8eWmRXsgC9MfNWwtReY5UI29C3ADBp4zrqaAA5T96TKPtJallK97FwKcBw
 GUo5Ntv4kflGSlYHar879SZW4VkaAmswg7lTdrHc3Md4+mG0i0fEpSt3U5uEp804Yz44ZLLxuC2
 67dQVHLCazsenVMKuKrz/3ngjABbvAy4XNJxTgVdZlJUqqBQwqcDWa7IENPtTL3Sh654u6xTmxC
 V5eTqfMvMDXp7cRupzcLRS40CnCgcS0STipLew2oEnuDmIIUuykIrsPfrDTFD4SocN7vr7RcJE+
 wuWLvG/qDdrOTlG2iDnaCdOOJBxAYdVC1/bp+Y45mCLk19VVd8px8H8aMBjOFFwKQycUEZM0SWy
 mMeawyKaFZuUJbrDC5gfNyATxGWwpjOdTgYm/koGLVY++tV8p+yfLoFSg/ZlZKCtA8joo04nb11
 2Q1wg/R2wXlu/tZvNVw==
X-Proofpoint-GUID: yZSSqUn2VrtRKZd7Ld57jyg4636bpvq-
X-Proofpoint-ORIG-GUID: yZSSqUn2VrtRKZd7Ld57jyg4636bpvq-
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f94c1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=AEZmeeoAxQoAE610vZ4A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,linux.dev,vger.kernel.org,kernel.org,somainline.org,oss.qualcomm.com,poorly.run];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:abhinav.kumar@linux.dev,m:freedreno@lists.freedesktop.org,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCD387310F8

On Thu, Jul 09, 2026 at 01:50:50PM +0200, Maxime Ripard wrote:
> The plane only initializes a pristine state in its reset hook
> using drm_atomic_helper_plane_reset(), which is equivalent to what
> atomic_create_state expects. Convert to it.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Ack to merge it through drm-misc
-- 
With best wishes
Dmitry

