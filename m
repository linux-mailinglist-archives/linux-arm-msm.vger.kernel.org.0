Return-Path: <linux-arm-msm+bounces-109503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJHRJE3UEmqr4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295B5C1F42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE54C300A58F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3986839183B;
	Sun, 24 May 2026 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6J9Lfg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlU2m/Ix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E7391E60
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618841; cv=none; b=IqtXO0TSqFK4Dic0ulitZQvB2ealjI3rXQ457SiN9Vn9auTGQuvHludyYsAMSOrUe0/MeQuiObnuEEIARMwArbqVhYdIE+drM/VvvfLkpjCOzGd0snT1EYkqsU6cEzoez8pEE21SqiUkeMDEOH3NsSG/4yV58q81A1fmrhnZJ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618841; c=relaxed/simple;
	bh=mGqmteM+m4hLI5Gvz9eQdzWvrlFnUpxrfaJFRPfDGQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxaoJTal1msYD+x7p4aIGHSXmdZGVB7s1BF0ls5LXLA0JfyrQ3mVXSjRg9u9VaknRj7/d3I6uYHuSfTv5GZNBXHOXqjBgVHVlSjKBVtNevl6rG1hK+FKpgdjLMvWiOc8twtJndiZGmnfMoU7bxtKSATHSa0KEpLV/sIXhiZ6rzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6J9Lfg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlU2m/Ix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NHJ3Sj3580205
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVckI6rGuC7U14wE7wUxK06VoWfdQ0drTPZ1Rf+ykCc=; b=a6J9Lfg6epSPS2YA
	sxt7DnvJz3Xw0+U8r+kexsDc7509fFT4FLdRz1Cvnw/PD5HXTv0WL0G+IfmEkPf5
	jJmwNppFZ2Cn/zyRD69WziEVEWasvE0jIBQFasjuRB5g5xpDUVLtpN0qjPbtMGo3
	weEDFFeAhtNACGEytSIQUI+/FYeoJpsvAKUJQWNHb/c1oM7+FcFLgilFe3FxhZBR
	SGoVlcONPte+TcsfYKE1/KnHAmw1US+Qht4Cu7N+h2uA2PKSKeqXrlGOfMUNnZh6
	DO5HJPWx7O6OJG93MbVbmQ/JyCUFxDdgVSY18oPnKKvet/F/Egi5ZjY3n22NSGlG
	ci6ycA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50ftupu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56fab6d9242so19952249e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618836; x=1780223636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVckI6rGuC7U14wE7wUxK06VoWfdQ0drTPZ1Rf+ykCc=;
        b=KlU2m/IxcALpsEOaGXfspI/5CLStr/+gV35yuwYZx6FcOKPMTchnsTVIPeb4JbLY3i
         N9nYBqfGlxVV+hE4w5JbWvmSFz/DzIimie53PxNkitBtc7BtviArFHr0sElECM/yqXTD
         4KER3m+ykVmc6hB3Cbtr12GqfS0rfJD4X9a96L3OeyL+KH1izkqtUpPeNH1b1hbbWg5F
         eVP5q1goQf5AZ09Ei0r8VjjtRo4lIQq3gm3KJ9HvkezRX940SQn64moh1PnK4jutz7t/
         KZj7ZTAQfMauzVgz2craePQb1sZ7GHKxG3mwx2oyvi5iyTVcIZWC8OA7uKgZffZwh/zR
         xFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618836; x=1780223636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VVckI6rGuC7U14wE7wUxK06VoWfdQ0drTPZ1Rf+ykCc=;
        b=pkirzDvHZe4t1wYGS4znlVOgG6k+vNa8rYRm2fgYv30LmmGLDYSAIwUZT852O04bv3
         YKFkHaUqHWsmlAew8M24zsgYC4Wc/WJ0Rz5kTE5Mow+5nJNEqFm5R7muJ7okFo0dEYVJ
         RyXmzWTKvKOEa7BGSB5mtIvffOIvn7X+jXQtiQSI+IHP64wYALiPmrwimTBgaE8KLQNa
         W5w7eTgiBjrRmG0gyeU2XZbDH/G6F8RVvHx7T9bEI8GWjXhN6iYxhPp2GabVV3rYIAGx
         B75fE821L+oTLMesgSEcJH+CbEUCfTOLJDnqswhqJoEIwpHDshZn/T4RQGhapZtHhiyr
         7Odw==
X-Gm-Message-State: AOJu0Yz6kmLirAIflLmU6rWcNVGWftMxgmMKSOKqA9Tw6cQnTU32DthE
	c+81iu52LUUxPDNZjXW0YCBCx9r/Fm9YfREPWo+TevV/DgAL8GwoOnVjYLwKcOvT0QLsWelLHT9
	UjADdAG3WpSQnzxBRV3AV5bq0kPAJK1PQyA7w2YwHrF8U65pbZK2J//3Rvpmlg0Qit+ZN
X-Gm-Gg: Acq92OHUVicxSu1ljUgfqt3O59Z5854Dz6wOxWl3YzuVPFRakZqmZWNsEr0uqsMd5Nz
	3VTUw4JVw1TKhvEnsTDe2frv/3k5dvV7Cq2FVC3baTYIXRog15Bxs8xUhWti7qR4nAac44hIEay
	axP6im1Ydy7rlL6P26W8+sDwEm+1Gj4ZsZBv1QXi0PPb4T4pR/Q5uWNaLQbTk3HxQ61WM9Uyzcd
	nk/sYS56f4SbZ4pWAEDJ3vFe5paUo/4gq3uJaVw+D7cpaWQq2IcsQ7QMR/ZTTTSGJXNNKIem//s
	0XGjky2pZLIvu1eNx1Xl9U7ofZZ/6qAqUxcdH4mvmTPuAuB3ILA8NEoHHBymOf35uqH5n4RBWNs
	9j7eZkwSObAPUCpvTOUBqwB5VR94hKZEXfd4RkjVqHYft9wS4dAFerNEYKRs3YweX4zxfNmRHjY
	pUzzQHMK49Kn4oGx6xKBkPaD6Ne6jkmQNYo/MJav8cV3NcgA==
X-Received: by 2002:a05:6122:4896:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5866347ff44mr6103383e0c.9.1779618835898;
        Sun, 24 May 2026 03:33:55 -0700 (PDT)
X-Received: by 2002:a05:6122:4896:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5866347ff44mr6103372e0c.9.1779618835536;
        Sun, 24 May 2026 03:33:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:38 +0300
Subject: [PATCH v6 10/10] drm/msm/dp: clear EDID on display unplug
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-10-cf3ab488dd7b@oss.qualcomm.com>
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
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mGqmteM+m4hLI5Gvz9eQdzWvrlFnUpxrfaJFRPfDGQg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP9ak9oVvpCmWFPCObKin3NC2NbwoC3Y5mtg
 6N6KGWWN12JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/QAKCRCLPIo+Aiko
 1RM9CACMTtdXkwt6OJzCTlqYe1RL+OTe5uRHjgpBQmycP+rPLqWqYtsTTSK4B8OY77OuubDBgqr
 a0d+IV5yrsalCLmrldKu3wjux/l30cgyRTlsVm6PCOF3jvoLrybo6O9wrqgdOWXTJMG33xswszw
 Eyh7xoBqU+4eE2hpo5Pot7+WsjRS8csEk/peIuXH38g8f74BDEedB9Jua10U7YmB6vx21eAlC+k
 Gw96GUN6sm3wNEJI7gNnPGh7ccSBt/U+PGYaKefw7vDTmIsBaeV8aKFav6fHZ7S5QeuM+5mK70D
 p3cx341tChRRYCRYBGNSdrJiOlQFIet+OKXxjd/7N99LCCJL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX/58gF8z0ylYB
 JODwLNrtXsXg1hWUXYuqekY1gQz9mhYUfG/zVJ028xoOGb9A30gnnNX7suNNoDIWhcSlFHuM7so
 ZSgwmjslo2Xftdeu/z2iAyi73j0D9bSrrdrlLFLR7K3XwCFzdBhphYeQN+aelBlDOxm/3bi9vpK
 t5L2p8ZH8wtx5s81kpRKWLRaSdJIs1IuFdYMkZZWXm5aTzXLjUI6hZYB5Ikeqx2dNjYppQZisFC
 U7qRXf8sIC1T4Kcb9RlahnkNj0mik2AaC8o9aDxgpfXFjjN8yhmaTUo5MIovA2LZ2vfWqtsGXiK
 +j+gjcKYzE6lxWmP/JPXmBOkvQ/GQ/1VUabV0lc2xJCd84mk2C1vNifUVzQIZeR4uom82HMnxT5
 ak7jj2ohUTZawwlo6UU2UZaWSA0FyUzsoIL4j22P2Yhx6VZ6mxNmec56WuNKxD/TlOVII1RyJh5
 4hP5IgjzPdM04fIeIYQ==
X-Proofpoint-ORIG-GUID: o66eDIj5NSYa3t6ShgrxY_BajKo4CpQK
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a12d414 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=NIqqIfc2bYnrFRhDr3kA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: o66eDIj5NSYa3t6ShgrxY_BajKo4CpQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109503-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9295B5C1F42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the driver only updates the EDID when it detects a connected
monitor, which results in the connector still listing outdated modes
even after the display is unplugged. Set connector's EDID to NULL on
unplug to clear the list of modes.

Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 8 ++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h   | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5fa745b486f5..6800c628adb4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -451,6 +451,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (!dp->plugged)
 		return 0;
 
+	/* Don't forget modes for eDP */
+	if (!dp->msm_dp_display.is_edp)
+		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
+
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 891211b23202..6bb021820d7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -293,6 +293,14 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	return rc;
 }
 
+void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
+			    struct drm_connector *connector)
+{
+	drm_edid_connector_update(connector, NULL);
+	drm_edid_free(msm_dp_panel->drm_edid);
+	msm_dp_panel->drm_edid = NULL;
+}
+
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 177c1328fd99..9173e90a5053 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -49,6 +49,8 @@ int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
+void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
+			    struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
 int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,

-- 
2.47.3


