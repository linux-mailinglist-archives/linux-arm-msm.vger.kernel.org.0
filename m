Return-Path: <linux-arm-msm+bounces-94511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ7kD8LkoWm+wwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:38:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D71BC1A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 562AD316582B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0638F396D28;
	Fri, 27 Feb 2026 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCxHMObx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQZiBZiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F753803C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217423; cv=none; b=KSWLpNMAZoRPyTvS9+2TiQYxRBaraD23AlJIc3iuX8UDtchupjNVet+VKHD+NMpzejunyLqnnNHvZN3/CO/7i5n4koaAK12xQOwMQ4YlTkPB/Yu6obx/A3ApElgeM6MqaN2GN+ZYQuskIEQk2c9TEkY2v+KEaYQZziFG9RzINgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217423; c=relaxed/simple;
	bh=0vf2C9fVpmFXUgBb3ij4/FQRHZu47w7a3ZKZ+YzMMY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9tnVGZslJTdwCzm+a2ry5QV1CoRsr6JL37yKElqpH/lW4oz0nlb4XRFilqfGAHD5PGF4z3bhpmlOxxrv9Di6ZfJMwG9IJd/JZImv7MCUtrneYv78DaN6FYPmgd3oRWjjRC5CY/mYdtnuF0MkB5PnaAxdz+Fk+5nWln4xsm32Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCxHMObx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQZiBZiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Jk21476147
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z28n3bH/P4ishBBooloUI2Ybx7yvclEZDbQ1q5+4f/c=; b=OCxHMObxZtWbYTjh
	WNuj3gJvN+fBgV47v2Upv1XaXXG3r3pH1g2GToL3er4CEnpNRPeLpAcP0JoKpfox
	y46Y0Xkydh5anHMGmll4+tWKa6wTPeUOqOw1kTD6jwibfnro89a6ORe09FVAYx66
	63JUeLF15v5AaQqDtujoaMq38rKPE957Ttj7XS2jixwBUs2q/9p+ZzE9OCl394+R
	PcY8DVOLPt8U1xORt5w+Q1kv6DPireO13HSeGVUg3I/+MeV9LhU9pX0ZTmHlp+Zn
	gPQjVtalS/ZcqQb1sv8Y6Y0EJx69vtCbnUYW4ruqSg97Ct8XX9AAmjbVS257wYvW
	i3b3lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7ycta7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so2374839585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217419; x=1772822219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z28n3bH/P4ishBBooloUI2Ybx7yvclEZDbQ1q5+4f/c=;
        b=XQZiBZiLy0RMslEUPGYa2gwdEjJ2crwxa+MaVc70zq4GeUWUQnyrXK4reeU6DS44m8
         BoUzj+yyX/5zPox1WOjnDF0fOqQWpFShMhV7ToYl7iQOfC6QdsZ6IP852Qdu+1l20VLY
         UNAgeH2VE4l8+PUxQE31QLDGQ2FbWROAHJ1ebipvLz9E9d13P8EuZvSDu9/h6tWd+o42
         bC1eprOoZamtiB4sgnXw/1L04cBSUnDChS2b+QNqoxUADFG3Oe24ztZ3FLQLa9EX0U7K
         txpYoJPdOclKwpkHfeVmFxUnaIseAX/u4IFAtTyUQMwJUQz1UfQ9xjPgzga5fTbkzZ6J
         6onA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217419; x=1772822219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z28n3bH/P4ishBBooloUI2Ybx7yvclEZDbQ1q5+4f/c=;
        b=p9tb9MEKDp8qoNhEF+AjFN7AOVb//Buac6AgtQ2CdohhBSqBW1rFltMkw78POo1gXX
         d9oKWB5Ty3Oj1EUJNgMolVDTym3nHAR42nRHxkM0gbxlRiDrmk6b/G32L/xJm15pWWoS
         dzjoXc1NRTRzlCc7igE+kt5s7EuL2ISnAox5ZU/DII0jXkJGuNxNEConn/0cGKtCICiw
         +nkgCgZsnSKwXhdxDx3W1YmML8JvTEOATar0SBdenqTahSad8yhGK8BtxQG8ernJUin1
         rLAXFcr+RAtUgJSbspoRcmaQS5af2gUkFDeLd2yCGRmB13Fithjheb1UHm7md+d/ttze
         Cm7A==
X-Gm-Message-State: AOJu0Yw4eZXbC4qEHbMuK9BqzSU/SEySEtoG7HupJ+hHEpmTpmk3x6vf
	C+qERSbFODjJKeyP3nZQz3xoOUhzh+6dJSaHxNr5mIUxSjjhgwdYo6njzMbH1+Bjy0yx1xBlSYA
	iKPKAnb8/mQ1vUGUAKPbAYXojHNbDCWy0K81ibLNIC/wciAFOrGSTZ0j5FZ0G9Fm+h8ov
X-Gm-Gg: ATEYQzwkVBnMn3hocYeUQpm6b8z3EabGF/0ajYSFGmP6+61KAauJoqvXxqBet0t5nCC
	UW+oExtqkui5R3/QKwWtgwD1xTdRUnoyS8gpmBY6fiU3+iOK9ADVdKh4Gqy6KT9kCrYjF1qBEsJ
	dkBhGAppiiPJbiic6ysc745F8+j8LGuyaWjMzWMRCuyCpwaoiFuReRGZrN9fCDPfjUluODvaiUS
	cGz4zt6axFZrsmCTd7bbdcHh4vwAqFU+F/Uwxbq8wMDVDRxDAFF1y3+tkPflNdoIdbxN1bH+2rX
	phpTxCWD67KxNXHbSzF+XYyy3t4Rz9qUAQ9W6tjxqmx5np4gygeYLezvZfWjogiboyKOQMoGgvt
	53u3hZ2NRtiaSCxBu1qNNFbFY2d+Ry4QFIEAdEOsXRei7S2b9kQNALDj9LeqDvqeJiqVLqiEbZY
	iLMEVQmdtwbjCVktbKv1a7aeYp+8r9Ar6YeWY=
X-Received: by 2002:a05:620a:4008:b0:8c5:3045:854f with SMTP id af79cd13be357-8cbbf3e721emr918721885a.30.1772217419213;
        Fri, 27 Feb 2026 10:36:59 -0800 (PST)
X-Received: by 2002:a05:620a:4008:b0:8c5:3045:854f with SMTP id af79cd13be357-8cbbf3e721emr918717785a.30.1772217418624;
        Fri, 27 Feb 2026 10:36:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:36:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:44 +0200
Subject: [PATCH 5/7] drm/msm/dpu: drop vbif_idx from WB configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14870;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0vf2C9fVpmFXUgBb3ij4/FQRHZu47w7a3ZKZ+YzMMY8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ+Z2ACnJzJKGH2CekVQYUhBL/9FUkFtBbcA
 BOvmg2oTn+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPgAKCRCLPIo+Aiko
 1RdoB/9s1K6fKPB3ODkWvkJbSp6/8fS+SUpoxffEr6wbOm0TjuCiOUScsRpQmsFiZ6Cobt22oqV
 c3s2fHXhXl9VZqvFOPFFsE9lHArO20hMpaGmgkG9BDPs8YDVX8SODZLp/9e/qPosgfaLlLaaOgT
 JH4LM6K4IcX293CqM6U1/+ONbtZ0KkT96g60UGPrKeksF52nAYLYP6bScr6y2gt5dJXyH4TmEA6
 RfGsmIrpBL+yAlNtkcNG7XDqbd+u+YCYV26mBc6Hv3hmdKYlR0z8aBXfbCOvdDK2L6B5WTtn9YJ
 kJ8Iuu7WeqYefgbgB4Jrp3Z++klQfr1l4e+nGh3du6K6ELiG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6EZhLW6gFaxtz2JUiTC9z7gPqmCRsJze
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a1e44c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=elt7qAbBOBJlC7s2ZbsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6EZhLW6gFaxtz2JUiTC9z7gPqmCRsJze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXySnqoQVXGM0+
 ISzD/g1ROHg1kk7S84uZ9hSfvE0B3k7oWZxyskCi3Jm+KzKFGjfGDUD3C8GyvorWnUQAxvEhFT8
 4+94UgpICj/M4CplMmgEIfSoYtKOCUbdvCQgO3iLA1u4iYmj+fbvLSLGSBqaGQSlwPsF4iedaxa
 KK0b95X7WhX4iIKO2ruB15X/GG0HzjPvrPjKwH0AgzZdqjMGRsyQXQWI9eB+VY+6s5byQ5y1bgG
 9P9MVUPSOcbUcKstQKP5yI8IpYT2rf7hqifHCsDA0PMCgMAzdn+3Vp0UAEPGLUJnTAOC4179ftD
 qkiANPcf0DlqeDDnb1k0krLB4jro0LIZodzgernCV7pBMCXKxM9g/MXo6DA0ClD5qmhX9fBa2+p
 uE60SCoHReg+ouOKB+xfDrPOyRWSP3KMAKq+XOtJIyGUlJhl8LZdQ0tb4mhZElR62vt9ylLWAwj
 3YB/dyNiqK9C3M2OTwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94511-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 923D71BC1A6
X-Rspamd-Action: no action

All MDP / DPU implementations except for MSM8996 use VBIF_RT (or the
only VBIF) for WB2. Writeback on MSM8996 is not supported (nor planned
to be supported). In order to simplify the driver, drop the field form
the struct dpu_wb_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h     | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c        | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h             | 2 --
 21 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index b31cb6f16f33..db79f9382f8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -322,7 +322,6 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index b0c38b2e38c4..59caa2c2a87c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -364,7 +364,6 @@ static const struct dpu_wb_cfg sm8750_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index f6fd79a48537..5e24309b4674 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -371,7 +371,6 @@ static const struct dpu_wb_cfg glymur_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
index 02d2de6073f8..bf1940d9c9e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -362,7 +362,6 @@ static const struct dpu_wb_cfg kaanapali_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 9f43ce8bf31b..e61e14572aff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -280,7 +280,6 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 14611a344371..fb18de029e80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -286,7 +286,6 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 7b97e3b8630e..ffb89a03cfad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -246,7 +246,6 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 65fbd006720d..427ecd4cbf63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -158,7 +158,6 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 2160,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index c7833ca05eb4..64be51e30159 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -137,7 +137,6 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 2160,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 09ca22b93e68..c481e964fca0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -317,7 +317,6 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 3adc3350f05b..d6f7ee24ca93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -153,7 +153,6 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 7b58e438f597..dd891703e35f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -147,7 +147,6 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 1920,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index a3fea0ade688..9afdfdb3be6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -290,7 +290,6 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index ce38e93c0d7e..99b8a890fddc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -172,7 +172,6 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 9983a297b68a..d3f08d0d2d6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -303,7 +303,6 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index cb2513785f5f..f89e7e0df663 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -310,7 +310,6 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 384ed6e86fc2..c0b954001f3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -298,7 +298,6 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 6777eb75faec..e6a5d2eb57ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -298,7 +298,6 @@ static const struct dpu_wb_cfg sar2130p_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index b5e2d832666d..2958017eee56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -298,7 +298,6 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
-		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
 		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 6d28f2281c76..73021aaa8d3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -70,7 +70,8 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.height = phys_enc->cached_mode.vdisplay;
 	ot_params.is_wfd = !dpu_encoder_helper_get_cwb_mask(phys_enc);
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
-	ot_params.vbif_idx = hw_wb->caps->vbif_idx;
+	/* XXX: WB on MSM8996 should use VBIF_NRT */
+	ot_params.vbif_idx = VBIF_RT;
 	ot_params.rd = false;
 
 	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
@@ -108,7 +109,8 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 	hw_wb = phys_enc->hw_wb;
 
 	memset(&qos_params, 0, sizeof(qos_params));
-	qos_params.vbif_idx = hw_wb->caps->vbif_idx;
+	/* XXX: WB on MSM8996 should use VBIF_NRT */
+	qos_params.vbif_idx = VBIF_RT;
 	qos_params.xin_id = hw_wb->caps->xin_id;
 	qos_params.num = hw_wb->idx - WB_0;
 	qos_params.is_rt = dpu_encoder_helper_get_cwb_mask(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38280d776c72..8dbd5ab967ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -524,7 +524,6 @@ struct dpu_intf_cfg  {
 /**
  * struct dpu_wb_cfg - information of writeback blocks
  * @DPU_HW_BLK_INFO:    refer to the description above for DPU_HW_BLK_INFO
- * @vbif_idx:           vbif client index
  * @maxlinewidth:       max line width supported by writeback block
  * @xin_id:             bus client identifier
  * @intr_wb_done:       interrupt index for WB_DONE
@@ -535,7 +534,6 @@ struct dpu_intf_cfg  {
 struct dpu_wb_cfg {
 	DPU_HW_BLK_INFO;
 	unsigned long features;
-	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
 	unsigned int intr_wb_done;

-- 
2.47.3


