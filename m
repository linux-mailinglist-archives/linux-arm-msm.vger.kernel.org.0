Return-Path: <linux-arm-msm+bounces-90431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCw7Lt/+dWmDKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:30:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B050803B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ECBC301015E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BA931A7E3;
	Sun, 25 Jan 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQX92km5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdviRKLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BB319873
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340616; cv=none; b=VWLwqL5NpRGNXUOlqX0qhz11cWB4YyLYGjf7AMPJ9s6CWRaaQFlP3J2/v6mstsSrhd7xBr1LOHLcY9Oy/nx+EswId5G6MJpP2XBCIGHHAjxuJKZBqW081coTveJDIFdRq6eXndvAjo/W7MfAUFYttLx4Wfdzoz+JLGvQ24qjRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340616; c=relaxed/simple;
	bh=ytVe+uou8BTNPny5/OojRD5KZD6kFH473n9t0J/PfrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dht5u0vaKGSvpRVxGRIyGP58Q6Uh6+j3Ho6Xi9gAOD0vElfxFiBaWPQYNieVa9Wogoy1D4LpAO0FTVrRps4FQaxjxOvip1cshRBSSHuzRZnMXFu52ZiHZU4Www9uG4AnbAHlpyXK1CxWtYYZvPKY/w2lepbA0HG2BNWgFdgi6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQX92km5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdviRKLV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PBKGGc3479783
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=; b=SQX92km5QecDrX9Y
	+acwKvRlgQAKuVY6T2oXyTZXvzufoXXlRFVyA9nb62KDGbdtmIu6KDeQaX6EQc7i
	5wOYHIW4WVX0Da4pXfuml4K7jzvbjiV35wPU9EJMhQmZ8hgbM20Jibo8DL9A/Ott
	F90DygrwK1e0IcfRQ5UQD5St591R1VDAEFg2Pl8DOVv1DkTM/m2H3bL+yxcIlgIV
	kyasXhEt4ZMp1MDwtdmaf4o0Tk9mQDR2l9WlPsbcrT/Cu+4Ez9+Ik/ynkrWYJ1gL
	UiI0exxdgQUqfwVviySHb7UQNrCupCW99aLZnc+o3TwywZwzcKAdOYMmvPE+mAUT
	bvGrRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj0u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a344b86f7so129666016d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340613; x=1769945413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=;
        b=KdviRKLVunZmWBPC607EMKma7gZ2iNBaKqxzUYOXPyMirax/WbyXAoR1Xx4Cb0RgA8
         pZHIPZQ7dw328HXPUGwM0+NCcRizI0fSCaz6MXWqs0sR8r+12vKxFgrVxIx/CqqPKGoB
         UP+aqCeXZp0wJV17ADntCRQcE7LA9YqmiFXwGb1GTHe/ND5GPaAzW97U4dkdAqRui7su
         +CCHuM4/JRwSZ0Ij8lET+5/3lvZWj57DOgKqworioZFRI/vtncWEai35XRieERwYp5Gz
         C0dRL8ZO2Ebn/YlTreMhBs89zDKV16KGZq97ZsOSgu9x4/RUVJG3zOW1M4hu9nrTJa8S
         1S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340613; x=1769945413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=;
        b=MMy7SwNfDvI2AnLHskezW381QeNlQzPBC/XD1gDZdNpEcEkP9puVuGG0F9BziZ0pTb
         lotSHObCa5nqmtN2lVixIoXS+lYq7EDwj8/pB8mY1xKZ17QfG3pEfi3+EWIQbx7BHqqN
         ii6DO0+TS3SqNuaKl6vfbQwT9HTxWXirqkbULz5fIqVB5O9X08Tffq4P6THSwPxCoIkT
         eJHUYbwcrtoo+ucDdhquarVv0zamF1UgwrFdzS6znBFIgINtynU3w0sbyEe/tHyrO3c3
         Vrtrx5uYSXygoX0Db1mCTxSECLw0iPeTw/rtaimG30pKamdbdvCMZ4QuGUhiL6OAQXch
         FL/A==
X-Forwarded-Encrypted: i=1; AJvYcCWFtOMmESmFeHHQtMLgU2nMVPkAUEr/TsNMucjqyjzVeup/3pKza/VfQWiseuvGTCdzkEld9IXiz49UPFMv@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9BUaPkLxHdca9nKLNZ+BtBgwLgY9ZCn+3ffYcd9OpleSQ21f
	l4N1OHkqWI2cVGVzAXyKtDaITvrBYYkAMKFr/YU58eS0oCjJrK8LyhyJFKKFrfapVsGqCO14Y9R
	TmvA2s4enityaCu0Gok4DOgZ/xr4JqKi2Ko3k/tYH6soEEQAxbk9MWAIvpZXLUsoqOAPR
X-Gm-Gg: AZuq6aI38LPi0H3BujhOBn705pJTfZxzaDdxfP7ZD/wlvhKJsBV/ewB8VEP2GysW3dG
	W4ColAja88VWdAF948LPYKtJTlWn9Mxn/TI8SImmYJdjjohoHrQhn2t5AMvYA7WUNe0AmoZM+tp
	gpORChDya31peW46yvxQtrQJMQtRJsij21zbZEmrIaAmlBRVs8sHTi4gvZPOR9HsIjevF16l/ME
	gmlKVuY0mfCU+4gV7dEpu3DOPPA84qMpQNqcrvJVIvq/AgYmwnyLKxsG843gLZn1PM021lCaz+f
	BxzmZdDHr7/inV1Vo0/L6WaOsehcdpzlp8lWiGDMwshk1ehVXwV1sLL1c1lGSHwvB7YFT72CF6S
	t7nQx8tgzNhYZ6Mh/OojCA7XeE4TgXnsgOqdNZyl3eZvEb4TZv6kkoijcQo6E/JEoZWhAsKrDmt
	NwRFiz5T8TsRa/uQXTH5RikCs=
X-Received: by 2002:a05:6214:250b:b0:88f:cd35:cc8f with SMTP id 6a1803df08f44-894b077cab2mr15835776d6.39.1769340612723;
        Sun, 25 Jan 2026 03:30:12 -0800 (PST)
X-Received: by 2002:a05:6214:250b:b0:88f:cd35:cc8f with SMTP id 6a1803df08f44-894b077cab2mr15835336d6.39.1769340612267;
        Sun, 25 Jan 2026 03:30:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:03 +0200
Subject: [PATCH v4 1/9] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ytVe+uou8BTNPny5/OojRD5KZD6kFH473n9t0J/PfrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+rvTjfORBmAGtkJaWo7TYCL436V5jH9N5/
 7M8QvBqPpaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1dr4CACWDCwPjdjT+Ybs16qoXhrm/d4xsBKUhoOVYgecuVhnIph4NPRElf4FQ1l1qtjUMBeMZII
 O9wNUbIDqQg2oGahgMh5iVHY06+BuqtPjO3PF9+FPP4pGFK4rDee0nAJgEuWoE8bXRQtk+2wAWa
 4iLy9p/88N3f7df8zQ2OWgVOmFzvgdk7JuAVG4O9d/x1GLYc9IOPaoDzIGfVULU263Gnl8yGEJR
 OKH35R15GVSBHfUe1kdwMZXGKnkh2mZ1Saf1O5VtNfdHdmbHe5Wd03jqo/RLCuHqe3Nam9x8U/z
 vteYakKw41nKaidjFSZr2vGUuELvOygw7Z7hisjy3gv4Hpv3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: x1vGE6gY5EOZyztZf5G_smFwSHN0K0xQ
X-Proofpoint-GUID: x1vGE6gY5EOZyztZf5G_smFwSHN0K0xQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX/Q5FrvOk9tkQ
 7V27qTPn/EdloqyUlFuk6nzpajClqBw3Euuf//tZRsXpWAfbsleEjea+VGs6gEkuoAygS2LgL3z
 MJKDerHK3w0DQ4WDMakGpSeWYf6Y+Vgeky+cfSRQZJ6uhxZ9zcaS63qjLbKyd3bd2Q54qBx4S1x
 /atuytLGtQPklOkvoJ4/rm7nOTQSTE8Mn/JC84eZxzEEzhI0r3HfEClGnL6gGkq8nID4EUFOlhA
 V9rezEhhGRHuhOdShPih3reLG98vNw1mhCBifOnoECs0rEvyNTifSnfedE76DJQlxTU2SwRfpdF
 wgFVxvNblZMhZm4+b5eso3bbaSNevC+/DZqAHeRAxCjv9x0blWOP4Nk16od5KulEB1h3hMUJygA
 6LVFkec4lSYDJ5RHAlK6iLxqglPUpZK0MII36nxWnsMiqC2LkUkPrgq9jCalldYJudoMSI+p9gT
 fOs04O6SclDzTvp6f3g==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6975fec5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B050803B1
X-Rspamd-Action: no action

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..5bdeca18d54d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


