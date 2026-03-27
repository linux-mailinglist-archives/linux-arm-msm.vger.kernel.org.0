Return-Path: <linux-arm-msm+bounces-100227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC7RISdJxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B713417CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 454E130850EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C18B3D9044;
	Fri, 27 Mar 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpObczxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlpouOA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0948A3D3322
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602244; cv=none; b=rSPUyuAy3Y83DUgyzfKDRb+FGBrss6LzEV76ZIJNgicyHmPvecLvghLYZ4dZqwc1JCsKn1le5IReasRLdIVMjrjoDC6hehgPw3mhTEF63ank2OiDC1C3takrtWoXzNDBHv9RKGFyAua6X9Kx6ClY/MFMMz6C4RzBIPhXeJxOD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602244; c=relaxed/simple;
	bh=sijOfDCZP5Ip0DhMoFL0SnSyLmFbSo4NH5UDAkeNO/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BPaISvtQS9qpwFvO7gFxUhAnHiGJ5fxoPb7Rjddt7y6KLcXoVLyimMmOVUoCuxiggwcWci2pMpXohbPi1h1aZenorSZrWKgM94iD7vMausvwoneSFhBKDKO3gny+S31NoC/9rY1jZWKpVXLZ/08YHHhygMgEc/mq1KeIs7iUMqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpObczxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlpouOA5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6viZZ731325
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BsP/Cz6pi3D
	/C1lGz2QDJeYO4Xmqw8Q51D0LRWGF6nY=; b=GpObczxiW+hQHa7sdKWJ6hxVIj6
	vsXcQnWfYqyXxW1+NN1v9Me6FVgaDAyj4TiFtbqnpXyyDd7/BJUlQonMJYaWTGoD
	Iwd4KH0G5LyJxTeI0qDp2oz8zpt451EdFolNJxnEOWh0j9IRWoQd0k4T9hEwvUus
	QO/y+OM4OKt8Tan0Yz67j+as/jWNl8JF0Wp/0WPu/d1Mi/pkBPitZGviZOsu4/gS
	aYiewnbAK5150RdcWfJZWMqomNNNvubxfbMbtw6ws3jkIoYwcpT/5gpWcn+sGb63
	mZqcG4+7FAgTMK4nUQbhRuPu7JeQSQnJm3+dnKHk+zlSd5GPhwM4lCkDa0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q2mr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:04:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c1107da15so297792a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602241; x=1775207041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsP/Cz6pi3D/C1lGz2QDJeYO4Xmqw8Q51D0LRWGF6nY=;
        b=RlpouOA5avY7/xsr7P3Ieh+m37SWh8eYvgShBCqUwcUW4lMnxfx9PVsVBNram9jrUS
         OZe6UsPVamZO/VpY0tq9TgKb0rCtL+0wuxqoTzkH7Yg4ZJnqYhcUjoH0y/oKB/lPn9F7
         1A28T93b/i3mRVjR/WVHEaYQEVN1n5XMAQGe9GYI9P8rpH9AaRKzsIRHc7GQhyFNmUh3
         hCoQbQN7wEe70iS6DmcT/RfWGggcLpaiN7td4RaeU+iiUYon0XUagv1W2NJ1U2MCNUk4
         oij0l5dKdKFbgx1aC7f9hg+AuSfyXr8TbcYnDE+U2DIV1Mi/VxanNkEOBWHyFlnswaLE
         FbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602241; x=1775207041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BsP/Cz6pi3D/C1lGz2QDJeYO4Xmqw8Q51D0LRWGF6nY=;
        b=MC5Y7wIR2MNYIDEF2/FPCasdoZ+OhzmI0Tswzn5g4nv0Mn/L0c7xfoRPgbPLUGnThn
         j/r/VUxqnw6MyOsNwhwvbEjrrPWU+LsvRUO29MxwO18yw3zCMokWeDOC0O/P/F5e3WW5
         8IQWUoTKLbGbiASIzJDLnUd2T41N5uVvbcEXfit4X27cCx7Xg/7fAd+c1MjdAoNxzMn8
         xG+jLGV9UCmB9fuNb0LsCTalH9hjFwOUN/u4p4mhqV6TJoHJVP7KNc/FEBG6ObngHmxW
         xs6Zl+7AIxtlqEXiCxfsFwzPGdQW+mxpFog90t7/NafoKKXAmHNYCmZtruTc3KAhvuSJ
         piSQ==
X-Gm-Message-State: AOJu0YxSdjbZk3QO8MWPP3aDfbrOVwS35jBYEihoLRyNawK4fUsuyocU
	lVVyQA8hIF95jmFihVUs/MEhc3mMbz6J9Dl2/9QVQghHQmKuMvNh9uPVQW4IJ1j9Mkyl34+d+X8
	uZ2cdCzSVOusW3sVh7MuZc6nWGmUUfvifwStGlKogT1Cy6gNxZae1O32S6BugXpxhvkaQ
X-Gm-Gg: ATEYQzyQCsQ0QSILLyCnmpHOblk38BtrXvLnxugnM6vgyrvM7yr5mMIdI2mzBGE4f7O
	VdoUjIzFclBuS9VtjVdBcSbZUgVQ97xrrzU9AWeLla0I1Vyj7+pP7K99o45RoBZYIuZjhTAH4jM
	3eWwmcMLKYENqMY10HS4D+TzHobQ3dFrRDw5+tWmPNKyJMD97l3n1hQpErFCU9dQt/ncOlMXrNo
	otMCUjzKqUIcm7vjpuxikFI6B4nKh3U186koiI+HIXf+SFcAmi0GCUylAvhbeDJytYbNhkrrH8r
	uc78vS1H2Re/8d2fuBN+m5/fU8rSRMaWx7ScBvB2bW6RnKN2VYaGfyExVitYRGpPnsWy+hiXglp
	W57/Yy+t5k5ITEA5LnEcLq6HtgqcKkKhh44IxUupEisKKcgjW6wmjqw==
X-Received: by 2002:a17:90b:2ecb:b0:35c:2c03:430a with SMTP id 98e67ed59e1d1-35c2ff5074fmr1727783a91.4.1774602241051;
        Fri, 27 Mar 2026 02:04:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecb:b0:35c:2c03:430a with SMTP id 98e67ed59e1d1-35c2ff5074fmr1727757a91.4.1774602240516;
        Fri, 27 Mar 2026 02:04:00 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81744sm4230006a91.5.2026.03.27.02.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:04:00 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 1/2] ufs: core: Configure only active lanes during link
Date: Fri, 27 Mar 2026 14:33:45 +0530
Message-Id: <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kheDJ8jNR_B8DgCi4SgZTcSvI2QQnC1q
X-Proofpoint-ORIG-GUID: kheDJ8jNR_B8DgCi4SgZTcSvI2QQnC1q
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c64801 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Z8YMyZzXpU5RQDwMThsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfXyn2fzo2OuLP/
 fVBxjFfUSa1oq4LAFqFFQ3F7N0WTTWNgQTswhpXe8LsIE17jaWznqZNXQk9L4S80+mwuLDL36xI
 tNZ7MxZ/cPlx/h9bO4DiSt5dBHOr/8AN2jLgh6nz4GnWrl5u+efON+Q+zKNJERN/6fzeEGLWbP5
 fZN49YKyGvjloqxXY50Mnw3vGHIB0VdCj9h7VqWZJnxjYgBPb5Cy5OObaKPY1SXbjDQsGaIE4F/
 LRkj682ZLEtaARjUTXwvT3C8CG6DbIQhKDf8YvUr6U0YnLnUHK4TCg8gRGSy7rY+QhJyx8mUjew
 7agwN6Oz5AfjBVdHZin26PgmnIrrAguKdSlOUnYpreXkWFb8mg5oBri7aLnHh7H8upEzbhZpiPF
 q/w9NEwRSj1DPcM1gqLuKbX9aSBfYgSiw6cxhXoy5c8cIwFgiopj7s3aoqhnwhh45EbzM6tqHSG
 PQXltNtfu49SlAfSL3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100227-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05B713417CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

The number of connected lanes detected during UFS link startup can be
fewer than the lanes specified in the device tree. The current driver
logic attempts to configure all lanes defined in the device tree,
regardless of their actual availability. This mismatch may cause
failures during power mode changes.

Hence, add check to identify only the lanes that were successfully
discovered during link startup, to warn on power mode change errors
caused by mismatched lane counts.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 31950fc51a4c..cc291cae79f0 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
+static int ufshcd_validate_link_params(struct ufs_hba *hba)
+{
+	int ret = 0;
+	int val = 0;
+
+	ret = ufshcd_dme_get(hba,
+			     UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), &val);
+	if (ret)
+		goto out;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+		goto out;
+	}
+
+	val = 0;
+
+	ret = ufshcd_dme_get(hba,
+			     UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), &val);
+	if (ret)
+		goto out;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+	}
+
+out:
+	return ret;
+}
+
 /**
  * ufshcd_link_startup - Initialize unipro link startup
  * @hba: per adapter instance
@@ -5108,6 +5142,11 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 			goto out;
 	}
 
+	/* Check successfully detected lanes */
+	ret = ufshcd_validate_link_params(hba);
+	if (ret)
+		goto out;
+
 	/* Include any host controller configuration via UIC commands */
 	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
 	if (ret)
-- 
2.34.1


