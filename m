Return-Path: <linux-arm-msm+bounces-109499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OORVMw7VEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:38:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468C5C201C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 273B3303AF26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003C139184B;
	Sun, 24 May 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRTO5095";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7MEiPUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD043911C0
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618834; cv=none; b=MWjoAQk8uQY9c2pUp3nnhuQlHZkSLdBTTFQJgo8ILh8YHGsfIlsbig4vqyvKLD2D2mDKIve56f0zy6QA4iOh0MvNLhT/1UuLQyYadfB3uLvejcv+hDy7XZoOE2YmTjD7aFPp4tggSWeid8f2DhJKWVYZjM1abXCydYcKDWzuWaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618834; c=relaxed/simple;
	bh=+GaGtvCVi/jXs8Gnl6qiTts4wOcrwLXV7mGMw9P2xyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYlwlI5rG6AUbEyGxNyNgAgmcp4LgRYwQiWtU5Xg407UQNAiUHMt9bWXX0lFeMM68pVU+KWG5ciazSw4Y7FP/66RAGvURGoA5pff6jcrxXf8rrLhte225RI/A0TUXst1j4d2YLOjWe+a7BgwoXlisKl4jtUG++KO0Q9giRKwVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRTO5095; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7MEiPUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NH0ra23647690
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l8o6cIS01j0pOwxkyeeRqH0JHndoNuqGw7yx7pJcTtI=; b=eRTO5095bF0iAnpM
	bWvKPvKLmFlRlAaIbQAKnfEb0o/PL6NH41Z/A/qNx62Zp541S49MY3e+QB2026M7
	Sc4t7n0zoacI6CIZGzwpf8vcCUFPtYDG0tbTBn9a2b0r2iJIAHMcU2ZWnccF9Ru7
	HGNS0XmHPGBB8RpmSkQOzEtiwbrDLwD/8dnh5MIScQmaRnUxXFndz+fBXiKyr6kP
	9K0Tl8oIGya5WK6vBb6VlBT74Zsa5WzKog/q5CUz7zBFp3G5EXAFyt1xSX2jZUcm
	TgSopM9Earypu2386ZfSDnR7LD6RpMWWeZio2kb+a8ecU/XD6KV2xIFvOcd+jqcu
	+rtSyQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t341h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751772dec6so17755802e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618828; x=1780223628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8o6cIS01j0pOwxkyeeRqH0JHndoNuqGw7yx7pJcTtI=;
        b=b7MEiPUIwIegY6hooGfEdWOXcUx9W3QbTtpDVWZRCrzkvmrYt2QU2PfdJWIib1exVt
         WorjGbcGgUqC1/1uvhBp1ZRmRab5+6UDBrEWNoHDxf6Pd8KCoPPE5MpqFqJNS6zn99dO
         wqu38Etusi+8DjZN7RyaiJiH6xIOpj58Or7pZG8RZ1xO+69UbCjsdAaPxthnyk7+GlTl
         RE9hkzWNJh5UYAjVoUmo9TXC3nLAA60biDU8nzNk++yGjjxCpQcwatSybs8NLIopr0/7
         Oa9iqKAbHGHGUrWNZfJwFqkTGCuprSEh2HgrkZ214VTbGXNtsasfTvr2O7jn7/BB2/He
         TNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618828; x=1780223628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8o6cIS01j0pOwxkyeeRqH0JHndoNuqGw7yx7pJcTtI=;
        b=aLq+KOuPIP0PGuRv6Y08k8DGl0uUWszYGyBliNwdtcYOD0dHHpj623y1rLgCzY0x1d
         50YeOsx4YE7W1d+gYj3cWOrc6dwrGqR4Ubhx6bDYMh4S56GISjn0zU+Nvczo+2gzWGbd
         yoX5DWhNO6mV1CFuFLZp0L4r6VDCJnMhFiBxbe2zCI4CEhb3q7ujCWtmApc0s/6ALAfj
         EovOTjc6sUw/wH4ae66AN+B6+r2hXlQmyjsPqCB+ld2D+13MOEiLRXxaP5XllZs6I2hg
         mmwaYtEmgBawAZOpyu2l3+6CUXQ1crtGLOJ5fuhPwcNshQ8Z/9TVASrJPFPbRAJApWO7
         YofQ==
X-Gm-Message-State: AOJu0YxSsjnEsMn/dQW4VyFPPFrXhL+LFES7wzhxMy2ayEY37SA7MVkz
	Vw1xSk+MfMCDZ3Yz7qGIzrWsJaYMAt5zHnMVXVkqjAWqtMzU3KB2Y7SjvsV8c9T8DC7k1+3w3Dv
	VZYTi8tiDIi9tQmifdLB1Ku6HBlu+kafmuNKnbUDg/4dxbXWVHiXdNsGZ2STn22MjsB7c
X-Gm-Gg: Acq92OH7TGifYrsKvqUCclH3rBKfYHECdDn0uFkKCDOJD3YqMXt1qEzwgnfFB+buXgz
	aNpOv8i9Jmx1Bl/76BcQYOlT/NYoyuGEhTbF/F68CKBAsz7at5ev5bH/X39kmaubBO+B4rTLic+
	3r9aJrBBa/rAfiKblx34+sLbIkYDjsgTFV63OcUqyfloY/OjKSeCFvkDTT5TfCPjHrVLmjb6Iyg
	hY8UMoyW/v9EzoRhBJT22vtrq6mDyfecsuNPTzp38ID/nixL/zKz7XLxXhwLbHOlHXmekoiFz11
	+hG1cTwF6FsUkvurbG0hlWpvI0No44mcf4pzQOzBOu7j0WwMsyTLtFk3nDJmrrakY9xAmyhvGUP
	qpQFCXkxl+UxSpLsglV5cSX7tHZBwmPpyEYHwyg57jdAkYwKJNI9Vi8FbW4sHEABxUigZycLVNc
	HQhVZ/xLbEu3a3CZ9ye07ZcKc2OLzAKnb4dMw=
X-Received: by 2002:a05:6122:3102:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-5865ee6c055mr5365400e0c.3.1779618827827;
        Sun, 24 May 2026 03:33:47 -0700 (PDT)
X-Received: by 2002:a05:6122:3102:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-5865ee6c055mr5365392e0c.3.1779618827398;
        Sun, 24 May 2026 03:33:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:33 +0300
Subject: [PATCH v6 05/10] drm/msm/dp: Drop EV_USER_NOTIFICATION
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-5-cf3ab488dd7b@oss.qualcomm.com>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4470;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7YL2ddERO+WKYrbTK+cxw/v4FUdiddSRzjsP3v7dOZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP8GADJovtb7rXvgjO2Y/Y256UfXFTz5vVkj
 Y27da5YrWqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/AAKCRCLPIo+Aiko
 1WZjCACZl57V2MEbFbABu1TZ94QulG4M1cMv+VkqWhuzs7MQFLmzy166Yi+2PPo/Y5mQyyW7jmw
 SaaqWdfaqBDp3uI3JzpbYeWxH0J6ZAiXkQGJCfVKlKriHN5DJ3t32lYBEZmbLYy2sSwS+fAyOT6
 Ki45bFDNvsTv4CNxJ/pAHoN0yeR9rmVbFztEPGTT1nWgS31TngmP49SAtj2A03OU6q1+rZ4Vqx0
 sR9AaFNVgqyVkG8ellSQqmLVdEQY6A4X7LogzvFtRdBTOFxhGNnQ02VmbbcPK1B3wRDeu4yR2nB
 EUAhewevR+3uDLNdC6uC11jQi3HEmIgFL8CBSOm9IqJb0mVq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Yurn2FBgrLGzvX15AJLOKu4BiaV9O2SE
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a12d40c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=gW5k9mFOS1cgrKxYKbgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: Yurn2FBgrLGzvX15AJLOKu4BiaV9O2SE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX/LnP1C6ZpWiP
 218TlyQom6pLuAbq19A28AkUuCjVvan0CdlbxvtPCKvypfFAjvf/vIE6KfmqtACglIQk+rJew7Y
 ONPIGgnS3WPktXDRDURy1Uj28LQuGqcfabGRNPQQmZiHVXYvqzh1CPYKahwufvqf9vN5uVv2v+L
 A138hE2+WT+KG8hGoEFTtBSoxnmgiRclNqiS35FrLNE9ob2s78dAXZjAtl39uI9DhRY5NMcQ7GM
 x6QDj57ahqLUnaavuvMD2N2LCBThEBznq6fWlAiSXgpNfLcf6sBFp+H65iQI8zVraoRcXJjlMHr
 g1gLrYzKXXdb2JLKSbahIvluQCnOTvYYZjDxCFR6affj5H5unZkv0/f4HfKzMv0+z1uojm9TTvn
 4Q3vgOJxB5y4ddW4TUSJrb7kgkgH2LR7L4qmuK4dz00U3etc+U/s58hA9sA8TuYAtBQRq2j2ZFZ
 /Rs9OefHvjC8gUz5Y/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109499-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3468C5C201C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 036b4a5cece5..6b76bff7c8d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -344,17 +343,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -378,7 +366,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
@@ -438,7 +430,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -507,7 +499,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -528,7 +520,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1122,10 +1114,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 991a3ca1e6bd..528c9a40477f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.47.3


