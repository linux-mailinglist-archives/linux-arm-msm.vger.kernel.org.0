Return-Path: <linux-arm-msm+bounces-111540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JEY0FLyuJGpl+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 01:35:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C39964E822
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 01:35:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h4qDeUmS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dJy10yIA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111540-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111540-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43BFE30136AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 23:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6132F7F12;
	Sat,  6 Jun 2026 23:35:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1272DCF57
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 23:35:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780788920; cv=none; b=msD5sppcDtQOtZkG8jl+uhgmACQJoKu/Mk1RvpjJLmalGgR7Jr6x2eerci6IiuU45aLEbsRu0PeHCzDCeZ0zFhCpqwLc+qgML6W2BJoSU9SFK44TBv0YspvPxElr+lgcL3s8mBtQ/iMN7ZKBDf0ZjMx1fKwgx9LPrB2FWFRW6E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780788920; c=relaxed/simple;
	bh=LD0T3/sioq29qY2/lM/+GVyu/C5YSNdmGmxvv3tEzFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pp64SvyqDoAhPHC8FFXSKA5AXzS2xzNye8e5QtVqAKTOWzQ/M4qZymLYrRKy25T4jWhJafJzrlS7R0+yVVgJQnfYjTtBlloomXpli+N97L09d3yUQSRA3qj1Of9v+8DNl39LYThUJleOb6M07GYLu9W4cEt1Llx4n0ZllPk+uLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4qDeUmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJy10yIA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656NPKZ32796646
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 23:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXJNFsH8aL86MjkObeWsqWpUSltJWzxFedx2j+xmyvI=; b=h4qDeUmSqd9a3p3f
	aclEinjnodrcQ+/BXxEWU3g+oypXSYxEMKeRJR4Oh0/Z4hif997HWcGkiUQqfJwV
	joJ+P2+El0f1HAhgud9vEwcxz900VmsOnqLlAjdiF4xPb/MTWyZHhpL33/OgW6fe
	7lKkyk/ipiboRDKwOJ+4nRAGs9xoq4T0/erolFqYJo6lrKGeKLEE8Uxu5LCNxJHs
	sGJKMpSG0dUMsJ3GCtgHGnknfYCHavNwHid/qvdL+SaSJoe1iTGMWvszijz8e1ZZ
	jByk7T3XiFnuL4xSjeS1XWSJIo1ebM/BMo/j1f+E70Gbm9uaBr3rN0XOe78QAF7N
	aah99Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1abaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 23:35:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51771d41426so52958241cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 16:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780788918; x=1781393718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXJNFsH8aL86MjkObeWsqWpUSltJWzxFedx2j+xmyvI=;
        b=dJy10yIAnrIpcS4OE3NKONYfWkpvys2Ete0sm4lGa9elyumUAvX6YkGCe7z6LdZQf7
         bR5yBAXv6FkutfLYvoDZ1aNxM0h543zb0r/tY63yZk6q7GYcsx42Us58iDiQ6vy9t5et
         w9Mt9W0RJUeLTocjDTzaU5EdThrtK6Wz35gunReKrv35KSLK9xM0YBxfiv8tFdq33QQj
         br0lngYVHNBdhYGrJzU00hGMiB6TYjnenEiRtvAHrXWzPJGd5dgTsPGwSegPXpuI6OyX
         /Xa9Kwc88P5xT4CWZi+3FFOEv2xcOQv+AN6//BcYDuqMpKOlHtJIScg944kbKwXKb0/Z
         AHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780788918; x=1781393718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rXJNFsH8aL86MjkObeWsqWpUSltJWzxFedx2j+xmyvI=;
        b=P6S09rEroBBaBON9XtYgWYNTeTOP0gTJaL0yIgZZLypMQW8L+L6V1E3FIo8DKDFl8O
         FcDwWvSqxWll2NhHn0Rn5ILXeIdnkpZaUr8u0uoC8WO3j6Rk6QLNcYB2oS/BzYaWmtRY
         HJgqmv2sPHoTmSIo8C9ZNmlWoYHELQ9eFiHewScq9owaKs1mMymZdXCHqURN4ED/0XN1
         TUGHlnnykxw7QKXzDG8KyBG/WpKTu0iURf9R5lQFxakeWyftBxiQsMfARA+xWNdKSv2+
         Inw6HMtvphZWmGUKsrM3t3HwZ1R3V3a6U8xtLTuIczM+Nzci9Bg0jmjiRp5i7/x2OEMW
         GKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+h88ETekGHxMEBJ9VI3RpTffadrBY/LGJC4cmNge+tDggUY5cGs7wRFSCyT2HZHt89EeoqpoK6T73D0Qdv@vger.kernel.org
X-Gm-Message-State: AOJu0YzifX3OpRfdx/hv9kZsbGbkJAzqthdZDpgTCgsuXuD0acRnek7C
	yBZYsDFTxs4H0xB1vKTbMHDdQQVeeUO9Y1uItWFynZykCbiaEQF75h77F9KFJN2RjIrUGDxUHGd
	Ck8Mv17YDx+wsl29iRGLVSbMizc/DcZjeBfyp4E66gi1PiDKxb4ScbpYc1qhgjcZvVqIC
X-Gm-Gg: Acq92OE2RDfGhYF+bz+LtIo4k97O41BrsZmA3TmSn0eu+iI+ciduieS44n4QPMNb0Dd
	jq/t/um3s6ARFWR+7lCiwkGSiQ+SKS5QQOw+8r6qPPEF1Gi/3D8RZ85Sdfo9Fsgj1YERgPkXcUA
	5mPaioeqqYxe9gN8R+9sdK+mHD4jcwkHh3tNR7UKhx1fHwlrfOnaL2R+Ihe4gEo1kDjDo4xE/+b
	tbzdjV9r3kn+YW8vgSwFCqiWqwr1o0lj6t7fbPYK7AfRMnhApOfril71fZWRtrrekAjEv7yoKMW
	irRoWP8QFU/VQ1eUhYDECJRkCPr7jeJv811OeintLWOKQZclFvfahUX9Kp22pQj/wfaG9BPYLYA
	qgeZd2tMgsjSD6DVEib8LDDdIFi1my0lvDegc4ZU4Oxx/5knQ4g10baKnGmmOTuY6O7d7gNVTpY
	kjuV/fTJTGQuCULgb4DvzDXIQBDY3CtpE/5k+XZeru7jWrsw==
X-Received: by 2002:ac8:4809:0:b0:517:905d:dc78 with SMTP id d75a77b69052e-51795bbf697mr92468951cf.37.1780788917778;
        Sat, 06 Jun 2026 16:35:17 -0700 (PDT)
X-Received: by 2002:ac8:4809:0:b0:517:905d:dc78 with SMTP id d75a77b69052e-51795bbf697mr92468731cf.37.1780788917355;
        Sat, 06 Jun 2026 16:35:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be00dsm33444051fa.24.2026.06.06.16.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 16:35:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 0/2] drm/msm/dsi: support multiple DSC slices per packet
Date: Sun,  7 Jun 2026 02:35:11 +0300
Message-ID: <178078881776.3945820.15306822216752040775.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0MiBTYWx0ZWRfX9muHTM3Y578c
 4ol5eeSr2NannDgQGGlgIrKorIpdEAAEAFltDCr2HY8D48kgro7ltG0S4+YzEJ4CIWepAyj6X0o
 SZ/uwS3FbyqVx1g9L7IzZw+P2CFu0uF6iKngUfTQBP2WKwGwjZ+VcRGaL8pAJznGtUAsePJubrt
 6vWCUHLwQg77cAsQfYrIQubI3e2ioAQTZrEkeWJEH9JW+vgjpH/RWro0CcGitrZA7hjvMJHtEda
 78sfc6fPlH0HPJI2Pa1G1LzI/7sqzhnqnFhwlARCA8uWWfQsrnAcCSRxLWsotAHqIvd8ZYv1ndO
 4p7kA+Z1mD0Nnt6FVS2ImHGZ5AepDr34e9DJWlQ1zFr0ErNs5kra+vLzwdy8nKKfqN4bEd1ZQSe
 wHa/9l1I2idcSYX15CQ6UUPtKimRaR9iLUP/xi0qN41KOW0qs0MiLFA9rsga2TbtgjYjS25COAc
 NnMSVZKkNleGc7N0nZw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a24aeb6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=_DFlpnaH-P38sxYvpb0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TNZt8czDktK95N9iL5KRPqKUi89K_FYF
X-Proofpoint-GUID: TNZt8czDktK95N9iL5KRPqKUi89K_FYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060242
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,pm.me];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:akoskovich@pm.me,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jonathan@marek.ca,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111540-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C39964E822

On Wed, 18 Mar 2026 09:53:59 +0000, Alexander Koskovich wrote:
> This series adds support for sending multiple DSC slices in a single
> DSI packet, which is required by some panels such as the JDI LPM026M648C.
> 
> The MSM DRM change was originally authored by Jonathan Marek [1], changed to
> use an 'all slices in packet' flag which derives slice_per_pkt from slice_count
> instead of manually specifying the number of slices per packet.
> 
> [...]

Applied to drm-misc-next, thanks!

Alexander, it won't get into v7.2, sorry, but on the other hand you can submit
patch drivers using this flag with the change of everything landing in 7.3.

[1/2] drm/mipi-dsi: add flag for sending all DSC slices in one packet
      commit: ffa88de8ddb64067df49e4d9f253d09a9c247059
[2/2] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      commit: ce73a5db44e3d5f9c0c061f0868ae209b59605f1

Best regards,
-- 
With best wishes
Dmitry


