Return-Path: <linux-arm-msm+bounces-118612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xquDF4AnVGp5iwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60009746459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y642xpEL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HvIrmi/f";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27781300383E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF2E38D411;
	Sun, 12 Jul 2026 23:47:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF68138E8BA
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900020; cv=none; b=nbxpECjfsKZlrnKV+DP8ueSiT75PtBJ80wxdTUaAt9GaZwBssd/dEtZpqB//7ak6MgHSz8ga9aXwKPerwu4ZSD7RZhbm0loqImT0PG5U6LW4rVxw8ULOEhKtuQYCBoWYqOYRYUO1V+UeMglpLJPJQVSz6upOP141XooS0CFvJHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900020; c=relaxed/simple;
	bh=UieLWEj33ov1XfNXT36ZpVTtvjQmuzYu/T7PGe/T1wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvdwDtMaqNKGavsyjxtqlobryhYiJV+5RzZRxIFvT++fSld7xvN2kuajzNxKzeVlNmFFBl3Mwio1TDJMx/6eu6svpKo/CssQLGQMECS/sBMA4QkWEcQDhkD8CTQlHPO0mWlbTXoqCG9Dq8IPgwKNd/UJ5fhp4njNlMkeSA+Ges4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y642xpEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvIrmi/f; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNU3Fw3692611
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RjdX/OYhR2ICmK0eWyh8tZwbbnvsiGpI+rl6rDd/oLw=; b=Y642xpEL4pdWddGv
	zGFeBqXgXsenIJDE0EFh6g8RMdWpIn0oxKgKUGJtue7/QkRXUP3WERXTxXqaRCBo
	CdzdIw67PDR1aP24ZuiqAgqKHHaWfKZcz3j3pnT4DUp+ZmWDePzpHFKpQFsUhJaW
	lwNRGE/RCjyrUXxqyumjUfp+xokDlwrqHZCeMFn3BkhlibOUoQ+qGyO6joz0qMZl
	GNC6WAUYNf8MBMx5Fe42RdzGaF9IC8KGrHbIKOoljWNtex2c+HYF9ly87NuqrEoH
	MqNyXY47jLIMhQfZyVvVzx0K7ULmpx8b3WhVF+7QjoLfOcWg66/Ly9GVPByC0HEd
	30lJUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gkmgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso52375351cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900017; x=1784504817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjdX/OYhR2ICmK0eWyh8tZwbbnvsiGpI+rl6rDd/oLw=;
        b=HvIrmi/fVglefco9gOGRMPUU13IcUyGkoVUUsVOVmhvbz+UOqgDnFsS6ELGqYFDx8V
         ENLhVhTwt6aFJy+f8Pnf+dO2yz/gPw6vyUDclqqQM3z5TRe4G4dyPezZ+YsLRmqLLfhV
         VdsaSD9oijR/kb3kq5HYTPv6X+o81aAzJddAQQ2GLlqIHBpVcerW3VaNGzcOuwEBczf2
         0iHSB4FOUxK0FR1VshYrjzhy7CbsD3oc6Kne02sQGBpDuSBMRBcsAMcC6vU/dCmMg+tc
         80e3S/BlqwsKlclY3voaW9ve6R48sYLhOPXiI0hTagwBvD4GcMyqkTVDntjbSixRilGo
         Aiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900017; x=1784504817;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjdX/OYhR2ICmK0eWyh8tZwbbnvsiGpI+rl6rDd/oLw=;
        b=o5xlhTJdYi8jUEV1bUoOfy1DL5rsdKB5TDfZcYtVtLqIjJR1AUVddrBpIo0ZHR3t22
         bxdxv8XPKFaV0X+6vfPeikAi4qTn593jjHnFJ56s0RbSWGW8FFNQeVZf86OWsIdqZcGQ
         hmbX1tC/LIGcFDupZRNCHKc4keAFXDmsolYThsL2Qn/amT2bAeXpQIvHoVQowUFWSK6e
         OU7bx+fkbWKKZ5QcxStlwiiMvcOBH7T+NdhQtwn+jpRHY4je7Kpe2tOIToKRMoapiyyD
         nZbALUX3mWXpXnLV2mrafKlXs/S5L6q/sLdqvu4UQb69hDpFA7FpNoFZyM59RIvOaM0C
         m0uA==
X-Forwarded-Encrypted: i=1; AHgh+RrEnt0+2AwpGFm+WXHRa7Re2tgCfcW5WesHZiPmmpU2mVB6SfOjcBbvI5gTRmgpwG19CpofLQT8Ft8i9cxu@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHBXZLymCdoiHQQ77uzCJGomlcHghauuniTMsoSdXDd/FsrkZ
	gV442mXKTGShhi5WZ+wIZW2eSDvVgdP8bgM3r9JkFh9k14737+ivHYXo89kXrcl1asWlvrq3yZ/
	VyL0biKuJlyqGilbnj+3oeo836yrEnGFZJ5dqheey93GAQMEgmY37Sijle3FrOkfv23Jr
X-Gm-Gg: AfdE7cnYulEZ7NQC8+nK3j+lae+bvFzSuyT7q1ZiNOq69CQ2fZAi3jkHpx7nvtKOssU
	7srHUIqc2GzhWZg5qCrTtXb7iRqhlwf1V14w5+aajKuGAGPxHeRREumV08mTSZK59tLZ8mQdED5
	3f88XdqkuqIXiDH6EPHWlqv2uAFK5y8ygbsW0S+iT2aEpmwmptAdE0ZWNpP2k9zhuDbj365V9MC
	n5MZrmZJnxQVYeK+G8Kbkqb9+ce98dkWb8xtv8MLb3RJY9kX2BX6S8aqBdbLcLOn2P+Ce0YWC/O
	9eahKXQi2XJVWBPu989k79P04Ne3WyqWZbibqwj2VYdKTXyz+tj+R1B7ElNFTBl4zQl3nT6QU7T
	4bRE3YIzZ3iQF+x0roIRNOZurWdy5w3qeZTtx9nYaUFdin6XskJQmGYmFM+1wvOkqcLbLclD8oZ
	1Z7+UzNPk6sG1Aj2VcF5A0tKrB
X-Received: by 2002:a05:622a:4c0a:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-51cbf2bbab5mr70457161cf.64.1783900017110;
        Sun, 12 Jul 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-51cbf2bbab5mr70457001cf.64.1783900016742;
        Sun, 12 Jul 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2371357e87.71.2026.07.12.16.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:46:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rosen Penev <rosenp@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix parameter name in dpu_core_perf_adjusted_mode_clk kernel-doc
Date: Mon, 13 Jul 2026 02:46:41 +0300
Message-ID: <178389962792.1434604.9113106543180632630.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530201342.10538-1-rosenp@gmail.com>
References: <20260530201342.10538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a542772 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=L51XAS4xMaKD1odKDw0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: WrGfZLRwpI9bkyn1jRtmZoxwS7R68Zqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX834A4vfz3jCj
 XPGq4Hoan1wNdS2ajRDbQXcwXF1xNN/AWsfdvh5w3th94SoXevpU8my8agL8BpvcXZ4mebq7qXE
 KKJ5oBbbl6w9Qte2gcMHEwRW/TnBLfutz8ZxwHroJdIaChV42H6/Gl4bd1hePp1Dwp0fyDZ6DIc
 xf/Qunp+Oh1/SD1WssJCcPPKzFeIKu/bAfveStPSNOeFsPP6Ds85lXK8dqvZPAnd0IQcMfVas93
 fH5Qv4VZRRSLU9jFw/6jfn/nHX0j8bv4GA//JEIO8f9cT8Aeli0P9LJPu6iKzub3Cx0O83bpywq
 EHTd7kk7pahwrKTEFqrwc7v3kaLnTsis0g3w/EEPRh18mx3Zi27h0eRjQhS62IN6rlPEZ0JaIic
 1UtPRU8nXEk+IxXRCiGbAWwmoXWQWfgkxpo3LlC4ifF4n4QYzUEyg4zOWYDYFVGD9g+NXw5iQ2m
 nDsCG4twiBLuMuGD2eg==
X-Proofpoint-GUID: WrGfZLRwpI9bkyn1jRtmZoxwS7R68Zqs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX3kOxWV11oBXA
 w+ZvWyDdsnzjgvFzYbHN+APsLZEzfom//zHghY8cbUrfvDGm7o1oJojbK+EuYrw548w7EIZ3NFL
 LkgszseucCdpjIFXT4nUqU0OcNHHoGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120257
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:rosenp@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60009746459

On Sat, 30 May 2026 13:13:42 -0700, Rosen Penev wrote:
> The kernel-doc referred to @crtc_clk_rate but the actual parameter is @mode_clk_rate.

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: fix parameter name in dpu_core_perf_adjusted_mode_clk kernel-doc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/14ea7c582879

Best regards,
-- 
With best wishes
Dmitry



