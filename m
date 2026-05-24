Return-Path: <linux-arm-msm+bounces-109498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMy1DADVEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:37:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F565C2015
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85F633038A5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627483911D5;
	Sun, 24 May 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxGRUePd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQmkNjTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC439183E
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618833; cv=none; b=H6yMAHRqArbsoTGisIUTBWV3n/+Yb9xg7hCWHzhXMqJPHSoY1R5g5TnWrRiji7gK1nYC2IIi8oJhVJG/zCTkzFxNvTgmJR42ivo8kU36YDm5FZiJWeFJHUbK5L76DD+fn17cgOULamJsftZyUW6ObVtmPXnh8PjyDuY19b7q6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618833; c=relaxed/simple;
	bh=UWF62YF1njzFgAwLsWekOdUgSvI5h2lxGM5sba8sWQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8LyxEEN9ePfb8SAaD7DJoTuvfmeP83VhD3VZ0+xB2/Jc1sP/TcULu4AW39KZVrq4JJ7UdkOBfbjh2z4T++B9MrmUnqU94jHIH/e1KYOf26t6/PpLKE+LpB0Gdy+lfjR+GUGOUQeLUMqs6cfgr/cdmtYEDqH6mhwZwCXhnr4lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxGRUePd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQmkNjTE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NNFCox3127655
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5QWn9vGsj8eMKf1y+Px+TGh2HowGm6WIdOaf1OPM5U=; b=MxGRUePdzd0Vj21A
	GojBMkQx1JlmsLcL6k6YSjZgAD6aVLtqA7eKaHqc2hIoU+yNGszDr/e1B+AeFi+F
	u3XKNKQyR5qfJdnvofxiaNlvVAFcten/29uD52ZmsPxEC5nVmDerKe3qEZu5tb3V
	xp53lDixzkRUeMrOUd9TvCw7A9tv+rRLPyJLiXALUnQOOM/3zwR81Eo9VRifRPfn
	tyJnN92tUJu92Uitdc0jIKsB1KdVRhRVaT+nAw6IasqqbLPzOuB7YnOQRwYORZHq
	3U5aVrpjvJIdA0wN6KllLd0pIM02uymPGRQ5XO6JAhmZiJG7R+YxrcnRxP+cu9MK
	GpF7+Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w2et6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751772dec6so17755818e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618829; x=1780223629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5QWn9vGsj8eMKf1y+Px+TGh2HowGm6WIdOaf1OPM5U=;
        b=GQmkNjTEInEDeZ7p0Q+jfLtk7Qy3wl6aZAg1XVzrU5KuNiMYUo5wYZN8LrfFTUUWcT
         W6u8W5BzG89KP+tR8Q8jOHZQZ2OKcbDOYbiiFH28aRvIxSLiJ7fPs0U3RWASOP2zBxGg
         caHVpfnG+C2fzGYvjjTKCXNfeSs1bZLhR4jCGcZQuPPNjbWxbpQ370AwcIDwfHCqO8gS
         GpLzxxQbDiI0Ns4GnDxfsIOEwOUeCuDCd7pTQbxVAPH1Gu8j2RB7VDGvYjQWmFl7Htea
         kzoQeiQ5XOeKwRxMXVU7LXIrFOI1ZkUtiuE8w6T3lApQShWRh+qexWU9rYihZnlViZKk
         UeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618829; x=1780223629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5QWn9vGsj8eMKf1y+Px+TGh2HowGm6WIdOaf1OPM5U=;
        b=LHlchGpDdTLIsTughLJi0Td/hR0UaBkuvS5PhFmq8P3VfOmHI+yq35OWhmkFSt6JQq
         nhGwpYsjBAkEaGZPuqa2rBiBbFn8fOwYqHiEosAoep5epOUsMO5d7dWNhVH6+5U/1QUI
         Kh0Sr0LRWWPpAwhyA+w+1ZHknMIzIfVYZEVydq0VD9NXI+1DAWAphTAgZpjz8AFI6X8V
         YDFJCyvwKUCHBMmL9CVuyeQtfPGwUMPEor0A0zZtfJrvc4wkV7kDLVuP+b7H/gX4VcOR
         aWZVrRNe6fjy7js5izOJTovZRkxKBUYhtp5JIsVPG6xNv/406AsL1fyeGQ4qsOshhrvI
         eirg==
X-Gm-Message-State: AOJu0YzwRE0ZItEA96VgYAt16nz0kcXLidC00HAH/LG+XiT3YrQ3WEXU
	fJMuc9eEeSO9N4TOJ3NPKIVLfdPfbBj53CMDbYlePy3pmLsSBhnqps5M7i7UF7JjoVYceGCfP8q
	isYYzbAfRfIV2WGqA7ilubsPF8vPho80TF2fmbOI4/uhN0UYRqI4g7/iqvcUB47ErGwEU
X-Gm-Gg: Acq92OExoGdXpeQbvTbL07xPoOu9uufKqmuvGR8/EadAQga80v7W6EIWGw7FRBlsMDd
	w4dSqyPyqSEyF73Y61wCsS7DbymBnuFd/auKzqABUq6GGGmVaGidDLRTuEx2lL8Z/mQGP1JLM0d
	U8notR+FVjarDZhM3OknOWF8xWS99u4tQPnfyaOThdiBgXi8gv/alKDf2tKu8clYFzuc6X35xb2
	FT6E4DyNZspCfBVVapoKqz7IM40uy8G6TLLpyhe27TJUC9ortb+iaQwqCndml+H5QoAFYNeOszo
	1b809VIRyIunXewe8e4jWtw7trCgzQyHXclXBrIygHnIPZjJpYMEaD1ehLAILr6pc5ij8yrpJuG
	f+kMLdUROXuW5jnSzAd0YFIgibDX/qpK0nqZCzQmObSt9b25GR6h/hkQ24B1Dy/j5fF2Rl3MGC4
	81PFmmRIIe8hq3jMgEGH3Yf24xwn1SjWsjhvk=
X-Received: by 2002:a05:6102:f93:b0:638:944a:49a3 with SMTP id ada2fe7eead31-67c7cee347amr5566650137.11.1779618829397;
        Sun, 24 May 2026 03:33:49 -0700 (PDT)
X-Received: by 2002:a05:6102:f93:b0:638:944a:49a3 with SMTP id ada2fe7eead31-67c7cee347amr5566644137.11.1779618828973;
        Sun, 24 May 2026 03:33:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:34 +0300
Subject: [PATCH v6 06/10] drm/msm/dp: drop event data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-6-cf3ab488dd7b@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6182;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UWF62YF1njzFgAwLsWekOdUgSvI5h2lxGM5sba8sWQ0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP92iDfdpDrcDYF4JAsZbS+8VsS8TZ5XUdyp
 1eo8+oTo6WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/QAKCRCLPIo+Aiko
 1SyxCACu7tMV+veq6oNBmCEE7nWglKG+gLAjLevEMXxN1MdKV5Z424wgHVirQBLcDa9uwDcJWPa
 uc5CZfB7OJnFTN9tp6COJHi7p45JHc85UPB9HyEV+fUckl/c6YKlBVeBqg8YZyZhH6RCdpQZqoP
 Kg//v/s5kikFOe+xU6Pm8ISWlHAVxKMWsGEyKrOx2pYp907V6eMzRWfsSAHMjjQaS1XO9fgSs5x
 1Kt20SxRvl8zifuGqQNn3gJQuMjmdDFZhMWulpNRUgbj6Nuk0Ts7B2+8j9ZJHNWQNsphTCTydf8
 1IXWXuajlSDFtc/5gCvNZPudtCP49qF4aLPqSACP39cDoP81
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a12d40e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eCmuknkWlvIkWwm66DUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfXwRuJ+LfGds6j
 2umGA1LJWNx/n6Uh9lA6LJfxZVLxv5mx7Eu4Z9qvKqFNPf3mUgrWFDIh9xRjOxg8DggB6OVJ4cR
 aw84LNLoJmolgoFl6GkRLb6w01o+vnpzACvQFcbL8Vbvalj/bUAK//gD72O0aAZVBESFernya7U
 vxiwaRra7teM8WaST65GQe1A1mGF3csJtJg97qYFjga7OJyUYh31L/K+s+fXGN4aO8KsQYM0gkN
 qHJ7OgnuSInbXAVyHUxtE9htZzLRmtbBed6uuSdf2FSujW5zYjHf7CYaYcE0VtcPYrTgAXqOFT5
 2+TXkEQoKh/9o9W8TKEeqacpl9gmenwcvfrkH4i9TrqtQWRzkJU44uALht0QtPHBeUEpGUfbAgX
 2Heb+g+szg7MTYoq9H/6wRWOgQKds2zHx1dTnyPpLzGqd/mQF0p6suezolW6VPY9AhewqhZDhAR
 /ed8hlfLkTJ4WM+5PEQ==
X-Proofpoint-ORIG-GUID: _jJpbjv_YiOrMwKFA8qF-TmaxPXbZPwt
X-Proofpoint-GUID: _jJpbjv_YiOrMwKFA8qF-TmaxPXbZPwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109498-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 89F565C2015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6b76bff7c8d0..df79a6e84415 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,7 +69,6 @@ enum {
 
 struct msm_dp_event {
 	u32 event_id;
-	u32 data;
 	u32 delay;
 };
 
@@ -219,7 +218,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 }
 
 static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
+			    u32 delay)
 {
 	unsigned long flag;
 	struct msm_dp_event *todo;
@@ -237,7 +236,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
 	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
-	todo->data = data;
 	todo->delay = delay;
 	wake_up(&msm_dp_priv->event_q);
 	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
@@ -577,7 +575,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	return rc;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	int ret;
@@ -603,7 +601,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -645,7 +643,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -707,7 +705,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 
@@ -725,7 +723,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1080,7 +1078,6 @@ static int hpd_event_thread(void *data)
 			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
-			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
 
 			/* clean up older event */
@@ -1106,13 +1103,13 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv);
 			break;
 		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv);
 			break;
 		default:
 			break;
@@ -1216,19 +1213,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 
 		ret = IRQ_HANDLED;
 	}
@@ -1653,7 +1650,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
@@ -1727,7 +1724,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1849,7 +1846,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 }

-- 
2.47.3


