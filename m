Return-Path: <linux-arm-msm+bounces-106355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PTTNMmO/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:08:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 464624E8EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC72D3077DD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B517C3F23BE;
	Thu,  7 May 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNB1LCzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtARs64W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1A23F20EF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158995; cv=none; b=gfX0eCJkQc3QdTFFJk1oKiyKI2tkZoSnn7Fxkr7WG5mxIzoX0+PF6FPRD3CsLgfz7t7q3yf8IVINZCc0WywuMsWRzYLOB694Ndh7DulrLKnSjKWKexUCXMTBoccxjmi13rWvDpJsz3Gq4ZihtsEp6MMJWXJqV+i54z1FIojvNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158995; c=relaxed/simple;
	bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQJ+LF08z+2VycOzGBzzKan4PEsfMa07UZKAfJgvICg5nK2gBUhX5eOFf86P/SB+f0/LpHXcK1vihmqgZmpOcVWCmBlJq/On+rmCr8ZzI3zpALMafVpUS+iYbI1NXmc2l1sHYNADsRc1SOdEtYHrXjs04RHYDHP9PJNwYac7IOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNB1LCzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtARs64W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5VER1971617
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=; b=CNB1LCzSwOaKUMqW
	NuVAsiSTWgDFOpjphs/iTMewl09ugzqTVyUcWEnw7xBvF1z+mCuCXYX40KQ4DLJI
	U7KCVEFc3yCffY5gXGRyqiJDo03XnO7660Gqn8PfKg32pLDMX7OFlbm5p5qtgpCN
	hEFDk68rkp0JV4hYj4dhFKugs21hqHoOEXtTW/WvCqrR4evS7jB1z9uJuG0JPb4g
	lMunFZWShQAZQt2sXoAorcr5mz5Y/IevtZ2SFueTKuKfBPBW1PgP2UQCvkgmNf+R
	Ry7evAlORgU06+mnrHa+YL3Hg11RL0uKXENcBpJDF1dhlLGpkmHGuHdLpbCNn0aX
	JdtbXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej86a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babc42244aso15041045ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778158993; x=1778763793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=VtARs64WePeTl+VjwuMSFMSrWK54GS7LaeG6IUbI3kOSRTrhF7Alq2zTNUzM0hL+9V
         BY5wGLyGfv1CSdd8R/L8uNV1h6SD0Q5KR6trKTX7wEsZrG07+DwWwQ9QxncBwAmEs7vu
         wHcWZPvYbjQIx2kr9xvy0Wy4YJRoB3i3K4ejTXPk0HLjRNOFxwusRSvRrmAjpsaBpmTg
         KAfkEUJQ6i5fl+D4aNnMUnLuEAsb2K8bhSuVskCYUij6tzwuFFiUXM9ZcIg+EK9ptnxW
         9gymma6EtAj2pGMPxICY3iYu8vXDsmpnDq8xvawoptvXTzX/K4rQWhBxyowuLuhnqnhM
         ghbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158993; x=1778763793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=KcLeD9kGy2C9Kr0dSjtC0MmElNCMfu0DZ2TnbjmOf/yslD9fi5AHbuMe59M8GZ3EG3
         CML3hRJjwuluUpk4EqSOfYGYES6wMUp4Uu7Vq0nG5MnvryBEyKiMKUVthldLpZYC9eik
         +DljK7MIr872ZDIlK/8EwCxKI3I1tdFVp0gwMQF9NNcRgRHls2eFJrd+ke9nGOTPsbKe
         hc77PvwK2CQ7Q16qLcVnYNgkkAmhGMAmkSE5PbAxpJ6KfbMmpeMtoUzK3trRWTd8G+5t
         PL+um0BEhtz3M/g/NV4ZgvqfHIvCU28hQr/XKlEUnuHwke7DkDo8FxEyx/qhVV74YIOu
         YYMw==
X-Gm-Message-State: AOJu0Yx/NcNIscI6nP0bX+vYRIBR+49KQReZZalBNBCD5H1k3VnSM3rz
	sm5/aKgdHF+qDOMj8pXTyohh9fmuElRXEygAj2knsxJfhmGvx1YspV11aL11y3mo6VWCLVmYDFs
	jXFaVw6VTBR9LIuL93/pA0jo1Xl1Qen3Pk0mB1VKWZ0iOLzCyrYQQMPVbIHNTeb/WDR22
X-Gm-Gg: AeBDievI5GFvWemIzybdYFB0dSJhs9y9r95r5EqXFw0F97gGBnkeDbwjW5+CTC0xZxQ
	yhULxyU5PH7fI3v/UKfyLvwBBkPIBpOn/+6ofjzg6y+NG5NFkIvCPgQCrFwMhZZnnGXNCxCzI2r
	yhg9Ov5Anh0UDN8Rt7QlyEFII6HtAqtENDfGrbupSh06HXfJLZ3lXErn4pILvQrJAkLqQpLOpbt
	vbzeNJ1WcU19Y8MhAso+6JZHRF7sMPEa6hPn/COF1Nxe34zy+AFB0zmhXM+7F4IkX1YHR3LCHbi
	s5QqF6lWKz0tcqFKIklkXr9FpWCizsNCRgyT85vA1lnqvoHhhsfnjh0bBUeA6vg0rJcYMAqeJ0W
	j41QxP7nLpxpzuPtrR0hjPiFlIqPD8wP4ry1G3lfgSAdS7gDQXFadneKT2ygFSj4RqDzHJ9w9Rc
	y9rRcboHU/08r30umUgybN4uz0Feu7DFMsXt/UhuV9E1+zpw==
X-Received: by 2002:a17:902:b585:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2ba7a323e95mr58398665ad.39.1778158992654;
        Thu, 07 May 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a17:902:b585:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2ba7a323e95mr58398055ad.39.1778158992064;
        Thu, 07 May 2026 06:03:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:02:58 +0300
Subject: [PATCH v4 02/29] soc: qcom: ubwc: define UBWC 3.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-2-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2EYco2h9cEnAxnfbeYL8OmlrpKoaezSZZYQ
 M1+0MKnP8OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhAAKCRCLPIo+Aiko
 1cGOB/0a01YO+OhyeKDba/Mk5dawJ0/xsqEaxlKqEVt7oSTAVlAyxCd1r4SS/Ho2BPiOU/dvZs9
 6CkDY4NRK6YNqsShekmPuNnzcBpyA1zGh9pNq/cTnOyu8oQDEExBEuBqaCpqQ8M2qlUjvw019hy
 YiuGs0SLGhYwMKoF4tsHYNP8kpfDpfOwjEPJ+CSVwfBFIx7KM2hwfQjKb4t0CPCZPJy0wab3cLb
 6571OMLfaI5iOI34b6rglUpLOmEygigjKCAXgDh+Q1o3a9u9IfIZxK/ek4Hj9CTU5HO6Zau6tC+
 5X2jDy7+Ln38yc6lmkcL4EC4P8F31swGe1MNTKRqTNmR3D6T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX8CvGaDWR70Yb
 tAOo2PlPCkL5XzK0THAcrBIRRh8N8iYhnDqXosg2FMv+swaXGQK/MhtInODIbOzT30M7ipwO+5T
 vE/YUwmkXDFuTAZzFN38/zsH2OhzyB89DYijVt0CfR9GTPyZgG9uMD1nkAM/tCeRr1L1wCvQV2Y
 DgmTy88EXYlgjEoVH5HRjNblZUVbWLfDK9q5on7LMbTUvaSnIjakNHvnZ023K2DUnZlTHaNXqZN
 HRCELE5aQlU+XqJ6GSfIiuqqraBKd8P+e2tZzcoFqw7hVqgL5Jtih/GQi9SvR2mjpNDyBOQig8X
 O21iKFii5U7fLIblR7To4uXit+ZpGW82YznYQ9rKhQlIKa6cjT/8R1j8a6PbvPpJNPJXr7q4dVt
 GFUxqh51zMjTzGyIi3aiS6RmASIY0YkBgDNURaIR4hNqHjlNGT9vcdH0cme8gbCo3aIjGkaN3JH
 9M37zgT0Ipmt1nUBdYA==
X-Proofpoint-GUID: cvrwR2c_ZK2CMtdfZnky3N2fHLmPgvBT
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc8d91 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=o8D1m1ilSIXDguKSM1sA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: cvrwR2c_ZK2CMtdfZnky3N2fHLmPgvBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 464624E8EBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106355-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Follow the comment for the macrotile_mode and introduce separate
revision for UBWC 3.0 + 8-channel macrotiling mode. It is not used by
the database (since the drivers are not yet changed to handle it yet).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f5d0e2341261..319caed88775 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -50,6 +50,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_1_0 0x10000000
 #define UBWC_2_0 0x20000000
 #define UBWC_3_0 0x30000000
+#define UBWC_3_1 0x30010000 /* UBWC 3.0 + Macrotile mode */
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000

-- 
2.47.3


