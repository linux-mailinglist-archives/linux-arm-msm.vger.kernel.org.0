Return-Path: <linux-arm-msm+bounces-106252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIiqCdsv/GmOMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2644E367C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16DC030066BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE01033ADA7;
	Thu,  7 May 2026 06:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cbc5IjMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZbWlsq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7642A33A9CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135001; cv=none; b=C8FisMV+RWSeyoamApcskPdVHboxJyxSrfUiXpAa+7vK5uECxe/5bllgBxn0oXLSbdRSZ/vjU4+HnU/4PCf00hHPMizFBOsTBTI5xkOq3BymTSoGJlt7MskmSO7HLmji5iGdlq8um16437H/SeolfYa9qvOv7H1jiHadA+P3Z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135001; c=relaxed/simple;
	bh=Yl8k4IkXG93Q10ouFwMwsh/vm8vRnW/RaSC/Y9eSn4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A/E5Fr/5qZWSdmV7sgCW8STqwpL/Op/v7+TaJUDjNKD7uSIBFpqwPJYOTy2SSlazKjYL0QuHEntqmUEISWjq4UAuZu0KiOs8pSXgkaFeg1XtMWfBcQT9gwLih3IvwlzhpLARYodMtxNgdNAdC9qUaA89l4z5tK4zj6P4CR2FxWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cbc5IjMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZbWlsq1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745uGh879630
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i9uWI5/lasx
	6W7TVmUmXkz+IrOXTCg+uMGmg+AQA+9o=; b=Cbc5IjMHJHhLGoNEo+vRevkBn4/
	o4Kwq/6NgQfNjIi5b/PX+3DG6j2BHNDpNVMhhinPqKmd3d/Ts2UeKdelMEPPZ15z
	tqmaNK2ogHeJhdFCrG/H769+ari3uTiB2Ssk4Nzv9H+84dd0svx7MdH85Yqu8C1G
	MDXj2PWZ12XC9Tukupc/Rsi+F555ZFQO/brGs+Tth9XtELHF+ljEIhOG6cq9qx9S
	ZcZdHqLLwfLLvLqbZZhXuNfjLusTgqKVzxcuTliqnwifwG8GhfnlQ5Lxwp+vqzJr
	kwWjOPV2C3Fq6Nn71t294h4V1yAANJ5xIE71MNrrRxhhO/ZgpJcCLbqodyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0d4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8397b14a689so345232b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778134997; x=1778739797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9uWI5/lasx6W7TVmUmXkz+IrOXTCg+uMGmg+AQA+9o=;
        b=ZZbWlsq1VETnR6s80cZu3a7HqzvulYd1TXvWcvDplMX2nvPbpMhgNorur+zeQ6lmIs
         2DUz3cBaen6v066n3aBj9qZYg8OyXU3G5yxNdVmZlxcoUZGT+mmUdeEbI7diwmtXvObu
         rR8oJWG2B4Bm7S5NDzPWUyknV9HW+vR3PcXOIoGvFPiRU9dgaxQfPTHDemXaDrg/7GBl
         WRCBIQPZrjJA9GyPm62hWEhj9jKvVPe3uG8gQVGpbC+ApOjjilTK7oY4Lc5Oc+OXZBnP
         WgzpOxS6bxmkwM6gWAAUXUYNsKQoIR+8Uv9dCG6h4ex9S0/ZfcfzeJvxEcoLbL339rb/
         h6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134997; x=1778739797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i9uWI5/lasx6W7TVmUmXkz+IrOXTCg+uMGmg+AQA+9o=;
        b=jv5WMlz1UJmXyR+s7dy+B1A9bQOtUxHNDwv0DqJjmYrAEAv8DEvEKzT65QOKwcaE6g
         /UgBpUTVLzPHmMIYRe0TTuzcuU5Duyzx+6tRTwJqd2gDagFQslDqg7SqqGnDvXjknLrK
         hfmVocRcUzoBlXJHLp0AFLIrJcm2tJxfgFBn4GArUhN62Zcmv3PSRUPJLO55ho+f8tfP
         Y1LX8eGwj49LcGgkR3pzK1GM4SVQKy7yhkFZxW5CCpbtt6SHG8ifzNcGKo7ReaW4WIO0
         o5G8yn3CNYbuL6i3BSDXRZjK2EXaH+dtvfv1jIB/z/g/xaVT5tah5o9aa3HsnMMDhVPM
         w/Nw==
X-Gm-Message-State: AOJu0Yxae0YrpZrXIgtFzQCyBLLH1qE375VWychReXEEi/sNJZHTdSQi
	nJ6A1AS9x9xxXobRJKSlwnhYt9q9IVzqIE5nk8IfOnRMI6ePfq3Sv7K+t+qczxIWG1REB+17MYg
	atGNXYxGy57qV0/feFDT9RAOGGdviv+yCnheQN76Rj7jzjBX3dz0nJnlYNBStpRyN9DuB
X-Gm-Gg: AeBDietV1pF64G6uZaKEWFaBpXtERtYwaqHzVzQpGi4nIplbzraM5rNbodjDCtN0O9Z
	FwiZ5QQPMQycWSgG6J6kXR2tQwogsxFEeU8g7OMHPWScV2URn+I9wnbMdVYNvZd9tn3k6kXBGm7
	/gwluLKqVMWEJlwU6Fd+VMJcR8QU6e+UXyeJpHkCdsY0Rluj/7ebcSl1N/Z+IdzHN83RgMiMIEa
	yWViN+6CYodddPtzKZSWWJxOjRseobeBVa1CHrsyqcIdWASUe44wN8NPm5HSmhKLTgpLryrf89c
	vJM+jB1JkjIh9yIFZhLS4JndIRBmHdyBgoM89rFyVScv/IpuZxA7kL1OiybgSD0JY5nrcTvxKg2
	NO7CB85rNz4+GaUjGrR/ONb5IfX2UX7XVifvZ5fONxmLnXm9rF0KJ6JFoeCcoMCemj53xaN0j2+
	8wd4HwGJmW7yztUci40QoiNxGNFQpVGREYriFQI3mq934YZhg=
X-Received: by 2002:a05:6a00:39a5:b0:82c:2205:507d with SMTP id d2e1a72fcca58-83a5dd5bc34mr6085694b3a.36.1778134997538;
        Wed, 06 May 2026 23:23:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a5:b0:82c:2205:507d with SMTP id d2e1a72fcca58-83a5dd5bc34mr6085657b3a.36.1778134997009;
        Wed, 06 May 2026 23:23:17 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:16 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 4/8] PM / devfreq: Add new track_remote flag for governors
Date: Thu,  7 May 2026 11:52:33 +0530
Message-Id: <20260507062237.78051-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc2fd6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=LlpFjwiIyvKxJCA_QE0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: E-W8yGdTkdsQbO_rVhAul2yX09XhawMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfX/7Y2zrr/JqSZ
 HJZdo8aLyV3ACb0ZM+9oZAuEjDQ/7qfgTF7eeFUW4dnO/FggXjBG3xtgfkXG4wL+RDYpczdyK2l
 Y/lSStdZaiSCoI2FdTiHZpGBw4SVu5x6LMcvgAM45TtUK8J1hB+pV+0aHDvQJ/q0Ncr3dVYJGq9
 uNB0y2Wc5K1BDPH5OJ7plbFepMPuSgjZ9xKuHZWUYkUL8CNlH4+MO1B0xPiHlnEVBoaortFzRxn
 1N0LW7Xo+RPa2DoOqOmkbaF5k44G9llqwKeJE/oJrllFvXWI2sxm4ZJlWRPr73AUMj2xASS9WrA
 UqjQtqehItoijGmt/cUOicnCZ88oeU0fGYGT3FmBAaU9VjHDq1q2CkZQXG1IyfFWGpIII2XzcrR
 rG7eZUL3b031fzUt9oUDX+L9NoTHYVfnG69oBg4BeslegNQ8lbtoSEsKKH8Zu50jhh7qVd9iqjO
 GvVm23xJOELJKaaKNyg==
X-Proofpoint-GUID: E-W8yGdTkdsQbO_rVhAul2yX09XhawMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070060
X-Rspamd-Queue-Id: EA2644E367C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106252-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a new track_remote flag for devfreq governors as a pre-curor to
adding the devfreq governors that is responsible for tracking
frequency changes on remote devices.

This new governor flag provides for a way track the remote device's
frequency and keep the trans_stat data updated and skip the frequency
update sequency for the device.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 5 +++++
 include/linux/devfreq-governor.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 85e937e321e8..e0272078912b 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,10 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/* Frequency already updated, update trans-stat info */
+	if (IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE))
+		goto update_status;
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +379,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..83aa82c4a9b6 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -36,6 +36,7 @@
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes
-- 
2.34.1


