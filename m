Return-Path: <linux-arm-msm+bounces-100503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP+1HzEUx2mWSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:35:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBD34C58D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD61630D81F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772AE39281D;
	Fri, 27 Mar 2026 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6iB1hCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBwWPjD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E78393DD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654149; cv=none; b=dmyHiu7QHHTfOXtWH2BcBG+JUZjhrl+EDdS/2QbFqgLmAzR1GFdzlxSdRAi3hcnTLO7dPDLwGkQRBIqqnxQrWJ6T5I795r8Glf0CcqiOVJLgfKXV0tADAH6PPwZzcMEg0P6beIOAoL1tiLJOhy+ZIdAynhCXAZtzZ/bB+FRcOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654149; c=relaxed/simple;
	bh=LyKW9a4ahjfp9UqYl+c9Z+AjjY5xRtESGt5zAt7he4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFw/0GTmt7jlYEAv48H1/ibBRBoIzsuxUpFXgB0MXtx2dZOJ0FOMZUYDeFqrSDEpoBWE8HcYcR/j5WP9/ACPIKjFWlzbL7Zw4ACopJueDxw58jdkTlRRL1j+RYmgKENzTu3y6uk54EmITiQPsaBRJYFikszxdTaWqJgDeJZibH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6iB1hCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBwWPjD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN46se2860733
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=; b=o6iB1hCFdxQu864u
	EnsTH2k7MIpwhD47J21IwY0zXdMoq5KXeYGKm81JD5mTa8kr1RfNMzFYn+kReusI
	3TbS1gYnw0kMv8qi/+nnKYOjyb8ViO2aFA0umpfoyUPukbqcNYI/B/uSLKQHdJ9a
	7XWAv/zUg2H4uEB6+NWx6lFwsCdoitVx9nukiB2bhECWbOH1MlpqpJWWvjd0kZqs
	tKgux72qS2TqVqRXENJq1K0eUpoXaAzRSuqYNCy8Hb2j8WVJS6BJwfqwv0xTPvME
	cgCNou7rK/GwwLDbUeKzTY2ppo7xPla1GEfZAu36sYJ1fYsEK2aEU/dSs1kBQKYS
	IY2tcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s8f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:29:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso73970751cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654146; x=1775258946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=;
        b=DBwWPjD7Llbcyix6yhHkpOhj/ruFGttihJjT6rwaFVRZ5iuIi6LQDoMUWAADJfXWLB
         nW88Dcw6VD5WcIzmjiK3ZwXNkJOtyH25Y7IS7UQBbL9+1QhWnkcxmzxTuD1OfiEl7/qS
         A9LrjdmzwM4RlNGehRkBQYPe8wlYLPh+GvT3RCdqZyrZREA9bp/ZTkTEOlpI5P/WHlef
         rUkhoeqqTaUm0TJF3ASsKDB5Gcuff7WtlRtLFZg8qzDZqdwm5CewMJ1rv4EcWUFgQXDK
         7h8TBGSnv1AaaDc5LRcplpw/7CAhmy/6qnz51PWB+ZKG7HwPF2Ti7ERcOuiZYIAdEjiZ
         7tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654146; x=1775258946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=;
        b=FtMvLYAvzQulGGeUD1SyBYdED/hLJ7pqZrkPJiJYbbytC5tatGoACQva6QxZlBPme2
         GS+w1mcY1y/f8dgO6OCN8AJyNQSPaW5617mrYsP7giAunEULJpPduNnYgJOZla0gqSdD
         tMNwAvoa6PNIXSntuJGb5D++BYgKB6vMgEnEthwxRbXH4TacTzQEnw4autXxkKWYMkJi
         mk4t3kwoWfODm3/N5nyW/+FtjGK5KZNSAz99WdnZVauOdYsetGDvJ0BROm/sFcrBYyiz
         pV7nq6sYXStRpkTW0rBZyK929vXGxlhmMG6tMaKYUs4ryYBAxUAhiF9tTtKSwF1hITRM
         rmxw==
X-Forwarded-Encrypted: i=1; AJvYcCXJouSYTlQT4gLovPY/YTLe7625Fi2oHYocHSUboZnft8D3MfOrIs4QU/8apfrfLW2ABMxedDtt7pzQQ8yl@vger.kernel.org
X-Gm-Message-State: AOJu0YyrdZE4Q8oK7we4ljofuNFec1lzbmqOziYBod7UBuBx/iY6Yv+G
	Qd+o4h30nNVITNXnnzpVjemTNPdC1t3bsk89wpwe8pCrq5Cb/5Vvtd+y5OVRYdvWmGv90JTk3MU
	mPlNOc9c41rVWyZTN3LUxcAs7ST2JzUx/F0dETMsUMqq0VcWrUzpTwQW43OokCeEGtmi2
X-Gm-Gg: ATEYQzy0tn7U2Iapr5FytvGdDhOMU1hfTo+VfF6llgNz2XZm2dqRqjsqwQEB6mqFmlW
	aT1LF5JdIFVSPkyNhd+tyFnfACn+Hvxjuds1sAG9pFjJHUcvFPVMlmbY4Tfk9j6J56Uw/ztxXHv
	oFj0T63BNklGonzcse/cquYh75Oaw3I2U3QVUUxEceUg/1aYOnaHbmYEJ/IlCH+9XQLg5FPFOU4
	OkU4ZB+jwL1gobmx75Vgr6PBjS8vTPd2J5+9wVNRddLK6EgUoYS0Qqtr4avY5y/SrhtsZuABmik
	jqhLgLmUwuPhFUC9ijQVrgm0NFGThKDhFF+mzXZQfVDDaYCSh7816i3/xvcmXfFk/W1tXw46xsJ
	xgGLtViSeBA0FuP1bHe30qhCcneTCdV11QhyOS5OhRuSuXLsBq+3UaI38iFycsFPT1NRuw0ji1D
	b3Vh8Q9MLTDBTmXKbwCzXiXFjTPZ45npgRa2s=
X-Received: by 2002:a05:622a:345:b0:50b:7113:7170 with SMTP id d75a77b69052e-50ba395d15cmr60863011cf.39.1774654145997;
        Fri, 27 Mar 2026 16:29:05 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50b:7113:7170 with SMTP id d75a77b69052e-50ba395d15cmr60862691cf.39.1774654145589;
        Fri, 27 Mar 2026 16:29:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:29:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:42 +0200
Subject: [PATCH v10 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-7-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LyKW9a4ahjfp9UqYl+c9Z+AjjY5xRtESGt5zAt7he4s=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGnHEqjIotzbXdYr8CW0X4SWcrOF9UoePc8sSmrUVE6Tv5y2q
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpxxKoAAoJEIs8ij4CKSjVRIEH/iaw
 4KfjIU95Dn5u0BzSUIOCaqSnj6ozDgo8bb7BAfgTkpee+WfdkHPhgWWcWj4aPV2iTVAv0dLxSgd
 n/LPDFx1DvqwZdPLZLiIaxAc4dCdiTHSpbtRxMCZiEKS9xOVUIcBs6uv1jD+dDtkff0Tm/zyiq1
 N9ErG22nYAOwcptBFtXzCbry7pZtEM9/xuxos6a+q6bLIHoLB2IA3wh/ksljDMqWF54Q83XLsmx
 L7CDm/HK+xNGuubzFHSuakcZFYFVbAjpXphyLvhn75F3b5AX5BbEs77D925boPkU4g+icS9Wq+q
 jkshVEIGDZo2ReXF9z3OhPQCRwi8Ue3LgayMpVc=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rQ04BAThH4DAh_IMCW7W8fYSGMDoQlfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfXywGxT9MW06An
 lP7cAx7oJZqJ8YqAQV5J5BQ3tguBPWanL4f+sn++/Vgq+51R/S5pVrF7yslq1DtKWZKyBOqZBjL
 gvElAu3eTCdJaYSvBm6BNvyQnSzR+lNP5ye59DBhf770nCrqVyitMS+/OhPBJJ1/BRk2qXQQyjp
 5GeujRrL0fX+5WD+dZgVcpm3dmYJR7eAbKP3AF+sN7scdR7v0jKfu99LKARfgBMQbw/rc6Eok+k
 rlovvUFY5e8YH6tQ8s1ZVm4MiNWRzQIp2eGhlnCxSKMUB0v7DZNiVi+2BMGD5W3hfjHy4OvPhKS
 TBMg14M1GwgjWmhxo9rEgJzsGFMpyVsDWGB7XutFoWpbU+aSucywXcRVY5xV2VViVu5fzNEXqOw
 XAJfcokRds3V851/LbUPq3X0wsUVTe63ikx7br9bwJZrEdWzXVglulaXJYfdPZtk/Rb2nlNTotF
 s1xz5ATXhsk23A6gOTA==
X-Proofpoint-GUID: rQ04BAThH4DAh_IMCW7W8fYSGMDoQlfX
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c712c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qqQcAvOoDgVuqrtd-OoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100503-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12FBD34C58D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW response time is a constant between platforms. Remove it from the
iris_platform_data structure and use it directly.

Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c            | 3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ----
 drivers/media/platform/qcom/iris/iris_utils.c           | 5 +----
 5 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b..e6141012cd3d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -28,14 +28,13 @@ void iris_core_deinit(struct iris_core *core)
 
 static int iris_wait_for_system_response(struct iris_core *core)
 {
-	u32 hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	int ret;
 
 	if (core->state == IRIS_CORE_ERROR)
 		return -EIO;
 
 	ret = wait_for_completion_timeout(&core->core_init_done,
-					  msecs_to_jiffies(hw_response_timeout_val));
+					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d1daef2d874b..e8a219023aaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -232,7 +232,6 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
-	u32 hw_response_timeout;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9925a893b404..6ed4c4ae4056 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -361,7 +361,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
@@ -410,7 +409,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.max_session_count = 16,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 10a972f96cbe..abe523db45c2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -936,7 +936,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1036,7 +1035,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1127,7 +1125,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1222,7 +1219,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..29b07d88507e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -55,16 +55,13 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
-	struct iris_core *core = inst->core;
-	u32 hw_response_timeout_val;
 	struct completion *done;
 	int ret;
 
-	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	done = is_flush ? &inst->flush_completion : &inst->completion;
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	mutex_lock(&inst->lock);
 	if (!ret) {
 		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
2.47.3


