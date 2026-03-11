Return-Path: <linux-arm-msm+bounces-96828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFA1AFngsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 953F425B7C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84809319BE67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561D136B043;
	Wed, 11 Mar 2026 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjRrXibc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmtHGSJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396933370E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199407; cv=none; b=cma+QCJa8dZjr2EM2Iouxqvf782tykYjoJy5/cqsEoxwR2jegaH92FpPEFQ+yvITXvMrTeV3T86ZB/pf4gtIcxN1+wwl2tZtZEPuOtRHeqd7I8N9fmbhrDmzwqeNlXzl68UdYDNU7oY8zhEzjRuH8H3NMvpiYzd8+Gw+bTB69Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199407; c=relaxed/simple;
	bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBS2PVbIMEmndEDPBfSyUHo/VTJJ0NcC0G3kMvnXpXMmHYlgsaW7wVucrNYg2Nj/ldfLpM602SLGZFac6vbh8VzZCXG7eZWAYq2o8RDYej09Ai31Xir1Ug4Tyn4IL9n+NXRaAS4HDt5Ndws0hZRk/Lr4dR9BGrYmZmaQsqcL/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjRrXibc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmtHGSJe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2PGD51573138
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=; b=BjRrXibc3zReh6gU
	M9oxEeQfUVKnlGgtrvw8Fk93SwXXtjmmQzw4KPIvaX7mON4GTo36rd+ibWHhMFj5
	JUF5hizs9Jp3tW9jijg/K4iGV6fs/fxbAFGSQ/mwePxdCJmU8IO/MWRcGAf7+Zxe
	WD6K9AVa/RKBTWUSajEUcna33UkuHqnqK7Ybexi8D7qeZNpfMBeBJzNZlqHa6Z3J
	WLrCaurdelgGKF0/k7C/kqHzKkYpv6HiAFgAFErHMQtXpbsevUP4Oijfm4gIYeF/
	HzCGY6ivoXp9tkMIfAJCg9MIISSWc7z+MYc6GOIWrJ2ZPEXwERmUD9pJeU95KHBM
	fZ1B/g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9r93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9edc2158so8443334137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199403; x=1773804203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=ZmtHGSJeczRuxz3/pV9swILvbwmJn6D0t7+/51HMCqfoa2DzED7xYC80pNTrS2NQ/P
         Aa7w95W/r7FvuxldJcbxpdYilyQEKFJwxVoprKKkR3lpoKFUMXA52lbK4VMeqbbVfUQ/
         0D1t23ZcpoxSLaupez7qK22OtoA6mwPn3zde+4krNgAtL5AJkwq/pgwD5M27R0MTxX91
         oGpu3z6K+8uE/iugh90FbCtf9jRRBzGydFOxwG9P8VoTfqbMDKXbPAEm/5u9VJib90xY
         0xWb/tDEiZjMtGJc6+y0FgKb3f6OyYT7j6q9o4KO9LA0qrXJVsT7dE3w3IBsdT5sZXSk
         I5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199403; x=1773804203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=UQBD/F1VilWAuZVJ96cBccJUtjcyDu9JhUkpasmd3zdorD1/CC5z9U6w1VrebZsYKW
         m+MmxG384Vigyray6PvXXdczHIXxW3CtrJYtr0p1Lt6hZJug6jmH6r2TBHJJxnZKRWAS
         v6MjbxTweaQqI1qCa1DqbAuhd8IJsFoXShE3oS3UbIFOxtakXnO/fycI9U6ZS3UoPlg6
         ZYpqb/zG1SE08MwI8SDVKTo8swgoc9yKeVeigFCpPmFu82PmnXQ8B0D/fefwYVOyzO+s
         YfDlEqlI/6ntjlDWKK11AlC9z2q6DRS7NaPVnLpjqSeoLe8QV3a5bQzeJ1XRK8kZjqDB
         NEdA==
X-Gm-Message-State: AOJu0Yzq07dzjc63DjPexwBp0ILCjgGWt9Wj1BoFSawSX/3nF6Hyfqfl
	2+LLMWmIcmpGWy05MRY9qSRzisxuTH+R6Jf6iIPUfQNz1bv7vOsFwGsqPEB5FLo3ZJTSck+pTvp
	doxqnL7/jZu/ooZmR7xPvjxR76zDNg1Rzf7djDg4nt5gsqFdb794MuDFHpSBKMNTA7G75
X-Gm-Gg: ATEYQzxpIys+Cf44YgULPqKFTNd51aTRr6q2Y2yyBxCTJ0O1cA7XWcdrPyJae1LXeX5
	Ass0Lxf3juM0WbDd4G4JiTbn7KXH+3WbtaQo3Kl8x8RsflgL7gCu0Ud60hZsBIEuL43OEKy3rYv
	bAfb/ZieMJggCNXc2bwf/qxSboH1ccpttg70EqXREq5KunPgioOzb+eYawENzW86VlVIMDlhQ4+
	xUvpEQGaT3PUHUSXlOYi88CAfj3I9mKcHwZe93fZIR9HFcCkQscC17xfpSARGtgJVyLEKge8zT4
	U0cel7vlekURHlNKg5O7sy/Jz1o2WWsn+G2AxEAHRK8olldcZCLB/yfdsxzOkJDt5wTqu+V4oPt
	jHiQ4E1zQxupTF+Byrt6+WuIqVha8lCSMjG5j9b8k6HP/VaPtXdDryrdVNOizxeUz5QgduLhX7Y
	7u9/vMPzLXGoESMfrQwhkoaFaxQBnsJ+3LVDs=
X-Received: by 2002:a05:6102:c01:b0:5ee:a12d:55b7 with SMTP id ada2fe7eead31-601defe675emr356522137.29.1773199402859;
        Tue, 10 Mar 2026 20:23:22 -0700 (PDT)
X-Received: by 2002:a05:6102:c01:b0:5ee:a12d:55b7 with SMTP id ada2fe7eead31-601defe675emr356502137.29.1773199402448;
        Tue, 10 Mar 2026 20:23:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:22:56 +0200
Subject: [PATCH v2 02/25] soc: qcom: ubwc: define UBWC 3.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-2-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAdC3yGDM87kWaC0sLCL7P8YfeMzOWrmZeA2
 3RrX4hptZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHQAKCRCLPIo+Aiko
 1fGFB/4mC/LJqSDDFefC/Ph3JtGVMlxhOZhgz5IX80sx0iR9aRn//xJcT4+IrLY2fJNghE18nus
 KD6JjdDnpVThOnCSiv9sPQcR7Q5B40iQvVgM+zw043V5m3lsZ6U83nO14I+xnGVGrju8H0OPSGa
 iPXFTwRh4wUN+WoeZsyXgd38ZwmD3U+pXg//FwBQ0xBMOoeQHhJ1c5Jnsp6wLrLll4JvvjH8bgg
 f4rKzz7FiigIZKjw5URT43ig9uen2bGU+7ewVhNBLKPQa65zfpNJfpLSOpreuHKQQGPrPVZEfHs
 bwidbtlo0OC7/4mWdGDl5bGe8ulHCM/TyG5s3nnvtORXOX/U
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: iuNkXyCpe7SDka1i9Eri8fTfzxHDqrWF
X-Proofpoint-ORIG-GUID: iuNkXyCpe7SDka1i9Eri8fTfzxHDqrWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX7ync8thJxDtw
 M3k5I3OWtnRsMkZvee08vnQpSyhiDmQDSgPzVSrfFRTEnrOe576EISdPM/Cyl7nV14MI4vH74JZ
 Cua/19oerP3X72OI8yGD8dDhnABuw3C9yzx4zua9WBEHxl7vWsoQztok68GjIQ2fFkRg1U0RJai
 URNwGP6+wZ3fLcjhDuHfMYflqHPRMUqlxFNen2ZO+EBb3m7hpN7wAtTJWqLuj7Z7kS7kMoQbaPu
 jEH0w9F5bvqn1RUtqOKk1a8O/5zl5qcE7JC02JLZFY9E/nP0Ht/BjGsTR5vtGV3WcCP0cj+YIh9
 EJcoMuILjSst2/iWQ5m1R+P9yzL4vXk6mIiZ1kEt1i4GEqHeAnaO42Yujr1MVFk+uRE7o/Rgij3
 IjGSKpWMSoesnhGAEGyuJBkYiyAQBKmrskx93U8521IJQ1lGUXKYN28v+FY4lac4b6Su4CISttK
 wXQriCkQTUkWyVjbR8w==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0e02c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=o8D1m1ilSIXDguKSM1sA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 953F425B7C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


