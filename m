Return-Path: <linux-arm-msm+bounces-75404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E0BA6AF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 10:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA8863A5867
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC23192B90;
	Sun, 28 Sep 2025 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d25S158d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6192BE7D0
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047902; cv=none; b=EXCJW9f5QpSwqtTShYm+rxKLLJCGRUS96gfy0Wcat0uBbzRkLdt1QtMYTZLPOJUlkXvjD2aowjX18mHsQDX5AOWSaXoouSKXMF74ygvArQSiN+yVix9H/sClNApZFmcxFaTGUEJzW4CIAV75C7DPetne/C3gGvuqTktQprQG5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047902; c=relaxed/simple;
	bh=R1Bpa6Fvy73+xL3P7L887ElbwPPq4/fFwLVlkuQV7Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWimCTCPD+1DngXaZCEcBhSzBooU9J+wfhT5ijJGcL93qblLb37OjlwO1ufqMXUhrGxqEpBlEOysEHklxmP2e6MEg6JUS1LudmPr+sIYwtay8S/6D1ZB6CVwNxzk1sD/FpgWDT6FFiKPMxGZdkEmwl0vwB6mGUJW4UzzSEDq0QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d25S158d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5D1Or019049
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=; b=d25S158dbMUwLxBm
	R785Dd80o16MVQY7oYklF1CygQd2zDKI/89YN/PSnPdDxigAtHQ7Uu7x6WndWr6Y
	kbnXr2nNoIbbRQ6W7paF+hgHR7FHm2rmGqCQaJp85xHd/e3KdwdjVacZRZUMs6TR
	xF+52srTpnRuniTacA7SjovxmMP63S1tgIu+2A340QmTOjSCL2A8gWvBGHq+2Hrm
	sUva607nq+00q+upnoxqpvnyGZi+/9p+wb66S20GXn+euiMH2ra9MNcA25Gen5P/
	RfUwB7JBbgmRIa0li9JMoKJbjPlfc++6gn/ZNtP1XW6g8UU1WXnKpFTwTWtKDi22
	nbWfSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:24:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d6a41b5b66so86514821cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047899; x=1759652699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=;
        b=jwFzt5WRmMKgQ+fzmY4krfegDmGei8StW3qsDzsFYr8UdHO6mJL0d4QigKHQy9Ttq4
         5Qg+951U6humHnBxwrE2pnm+/2dWO06jqM1CZ7hR32uJKMbaypMyQViU6IbHvcxP9Yon
         krM3nuMdWxhG0LMsoIkyro66a2vEqheMqoCHqW0g1grY4B7n+scZW2gkKL6a2yq9Hbct
         EFUsCbYxsEtM8aiV51AK+svIk1UC7/DltGUyvFzZQh55kDoaV2YsSbwqeIK/0z/q/cet
         jov+Upt1dtQYxuQfbYzGvObMJLjxfvG0TwcMF+ymZmgw78S6/A+hOkpBciNVj6S3D0JI
         idRA==
X-Forwarded-Encrypted: i=1; AJvYcCV4maGR/daOXv1+Vsf8SDWed/b2qloLRTHxAuRGARmBgvNVsYUdFZOFgncWeAvVbz9yJgYbrNbsYAz6jP8b@vger.kernel.org
X-Gm-Message-State: AOJu0YzYb8zGymdHwhGHttmPTQHVTOGp3oj5fQzpFASWfkG6ZmQ2nhxe
	JFzYvth84sE3jd6pzZ/rdWXf94pzj+KggHiBykpQsmV/6H5WfCJq+i/08ZzyUKW+e7nkcTRLqS3
	/XOO6cLIdlf/QGcPC5+Y5JfK5KS5e+b1Bjimg4eAdM/OgRo8KX4aAAVV3H5rr/8HeeA9F
X-Gm-Gg: ASbGncsMsdP2fB/Rxdvdv5doyjZAP12hrMs4HLTwTT4oI44UJ4zRHrNaNlD9/aSgy0G
	OKIPWJMsGm/GhShW+9YLG9O6/RG28FpIsZq1zmG7nFhhHmI+sG2+VmPhGKECaNLLMQpayYjZmyD
	Zb4vnhiB/hHQXtIudddi36w7LegGKJHWVYTK/qalayTJLvgKfbCgHd1+/AT8ov47JrWq8omGn++
	o1d6qgm8uw6+1JToaQwG1z/8lTyNRTPpTywtBcsFlyHNyOS0XaJ1MFQvbshPNuCCKfOqc2c+2sB
	SY9flf6S8FMMNFPHihXAb3POQk+HNm82762K4uIssq05dcdmixL9XNKQ1s6JbI9WJoRGxJ+05sV
	Ky0kJ6hyLJ4vYY96J1q3zuZzYIt1g0FBb74uQM7XNifYFtTZxvacD
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id d75a77b69052e-4ddd5ada161mr94504261cf.72.1759047898439;
        Sun, 28 Sep 2025 01:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT1kPr+SGAov5dmZPG5ScdAxxwbVTr7us/Vb/QdaIyPAfJXzB+Vh1Hhl5wl5GH8A9R5uXnVw==
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id d75a77b69052e-4ddd5ada161mr94504081cf.72.1759047897951;
        Sun, 28 Sep 2025 01:24:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:46 +0300
Subject: [PATCH v2 1/9] drm/display: hdmi-state-helpers: warn on
 unsupported InfoFrame types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1Bpa6Fvy73+xL3P7L887ElbwPPq4/fFwLVlkuQV7Qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTlnZoYPxDU4Z3gTveisyzt0XXcXxDuN/YH
 mhxi8pIdgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1UePB/9divEoptM9vQNCxc18kAVQN3qANEu3nhMR3r4BSfaNzPAgUOW2mNme52A/q2gPVBSnzf9
 ebr/ZjBmks2wcDwW2G2cOA8QHgDbJNdyGZxYRZb10FWI9lZPabLiArqIAFpeeVWK5qKPILTipmO
 3Yg9yyurABK8qpLUIxoUTtfJYwP42ZT33yO2Qy/cSCznvwZNq72XvTwYh09swLDXM0wv+7kRUUY
 z7Gb5CR8PPJKhkq7Vv/X3+HA/zwAvqplPHATfkcNdqltowoMh71+IS5wuGYtpTqaQsZp1deBanC
 xEmQoHpcBTmRcZ1XwWEMUFPeTHNgFqBQHTbf0WXLyu1mQUou
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fk2hJZRKCGagfNxxf24qCN4aQPGlwAPG
X-Proofpoint-ORIG-GUID: fk2hJZRKCGagfNxxf24qCN4aQPGlwAPG
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0db cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9qaGXxVFTICEpRVd4z0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXyHsQnH6rhi87
 xHIqrX+BVDYxg38cn254uJQY7AJ63zJ5mrUNZg3Ed/NOrxO56rj9/fFyqexXda5wIeE/qT2zkka
 lEOqtdP400x3l9/DetuHaPBmnGMPbuQ2nVg653YJA8iu1YwazcSBGaQvDua9LG20RiICju4dmGk
 xzYofYIGQ2obL1Dq3j3J8TImuOHfNv1P6ZwAOY5xs5Mn1of5s6ceFwloQnUvPgbyIGZ0GSWTd0e
 +q9t2YQH7398EqjGGc7lJdKP0dRMlCzBdUlx5/xMJghEYAtaxm8LKI150eoJguAjPm0ZYrXY3/c
 x0/saIOgaSgygETwiQo67fsAmTGjYbYeOVnKgJfVFWjIeYhz1knQinuCnT3212/wdZagKO4ai98
 U+l76fStVgpVnS2fLuCCoTXPyHFYPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

In preparation to tightening driver control over generated InfoFrames,
make sure to warn the user if the driver rejects the InfoFrames on the
grounds of it being unsupported.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..e85a6cf6e67232528861521bb21251bfdce6f8b9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -920,6 +920,9 @@ static int clear_infoframe(struct drm_connector *connector,
 	int ret;
 
 	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      old_frame->data.any.type);
 	if (ret)
 		return ret;
 
@@ -947,6 +950,9 @@ static int write_device_infoframe(struct drm_connector *connector,
 		return len;
 
 	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      frame->any.type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;

-- 
2.47.3


