Return-Path: <linux-arm-msm+bounces-82803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A2C7890B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B079B3356D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693173446B5;
	Fri, 21 Nov 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG01GSaO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bl3L/+MJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F53345CB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763721399; cv=none; b=CBAsu/uYV1w/n23ogmwOojaA3qH880SlzLR8h5pz+qM8cetsDRvvScyp39fwyvd1P4PrjN5zU/8mLk3YlGQkAk5YZBwy/ACElQXsjlDaTlaQ5PVRs03shD4mWHyMpBw/x8RDQswsP8oz9OPQnIzT0pjwDZpsldoTRvFWfnjdPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763721399; c=relaxed/simple;
	bh=Sz1vlOSV0D+xZIKhfYfVDh8pgF70ZFS+nkZyzuLd+Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/z4RUTrk+gZUK0o47vpfbJRkq9cFr7wojtX8zNJsiB3bNY0MGPyR97mQwfaxRr6Ic1lj+PVvhqSWbryUIt0g8Mk2Sv4faxCRJHYqPINR6I63OzWIVYcwAEuGo0v13Ik1Sdk6fWI8Hy2Z0kakCOkb18mrvq/wCGo60O2H2cre+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG01GSaO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bl3L/+MJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8rV6Z3675812
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LUtc/dFuaKo7IYHuZGMVu8mLcTAVi9XHB3HqrpmlT0=; b=mG01GSaOAMm65hDM
	KYNUT4JZqaZ5aaG9uNqsTX//2J7lIblVeDNPr3f9HBlLU8aUcGSBbRIySAZEBO9x
	QTIokWi1lHP8/Ft5t1N1bwnLM2xMuWhOCh2MBXgk2hCe8zQsMfB3YCiyPe0rXK7y
	AzMDG0ZSB5jFfGyuAwV5jvrh5uA1tGMbOdPkNlnT1G+yt+ZfmGKjyFG5peINhQJ+
	tLeoCU49B+YoW0dIngMECcKmmsf5avqSNJzpA6FSFhVDxiM+WwcQrL8si46XJWo1
	K8wjII0HFidLdiOD/Wl8MS3BwfDzi1RSv9H4wtcKD/fbowPRA52L7GBocszkhXCN
	DaNvng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj8ehs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:36:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-342701608e2so2200650a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763721395; x=1764326195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LUtc/dFuaKo7IYHuZGMVu8mLcTAVi9XHB3HqrpmlT0=;
        b=bl3L/+MJZ/UMzM7dhNX77WlG4nHGOjEoqR8p71Kiv6ZRIcrKlZcbcfx0lF5cDab4xD
         IXKuqwDCSEplUPYP5XtXMVY4ApNXXrEoki34LgbAKEDh9K9BONxQ3o1Le/KRkJ3/ytH6
         ytyN0wy5rgU/YYtzAdijiyZXQRJuZb2rHoVdyZiZrLiwZNbVOktaeTB3ni4C+WFDyNDj
         7DGX61DbvCZHPdmoPb+sPLQseLvKs2qQLBdz2be3jPcGhu7DekqIrOd5inrkyi74HEcC
         b35yLFIY8d9xVHwae+UoeZAQM88Ej7ZjZd2VJiUvehCPt3fMZeG4VRkli/T8pl240vb2
         VSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763721395; x=1764326195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4LUtc/dFuaKo7IYHuZGMVu8mLcTAVi9XHB3HqrpmlT0=;
        b=MNZCMEFaZDquLw0b4y+JlO1JTgpzK8BWyKaPjVtbAzaGHO5Ey4QtrJmhj8LAWHBwBp
         uDaeoDO0MK5DqfN8rFScKxhp/75y4pHizwSKuqtguXSVgTFNBbRg+C6r+BgzjZ8JC6YU
         v1tvpxZEYOiDlYgom25XvFhrmWzrA7YXCJyMV+kmnKzoQ3ja2j3BuU4vN8cxTfctENdp
         USjLN2cBNOJ/dUqoJHwZWmx5+Rln8H5QVaqal6WMe+kEyoLeHITVnY8IJuzc1yjYKacW
         /TtNvrka7el4Em4BLncYbHl36ubB/HqxkgUqr9uPiAJ67VtIrMB9VLIdCJ0O3OGnYfY3
         sHAw==
X-Gm-Message-State: AOJu0Yykc4WZm+AsTYymf+PQkvqWE6dmbk5EKYWCV1F5/xf9rq0YhDWK
	jHpiXYkY/4T0vT9k6VPyBxGu2F7U0NhW8/LFZCNVR1VW+9yjm7pK5D8nGAoXrSJa4VyRhKJyymV
	AgPnzBW3ULoWbF2ZvQshzsCwro2hejqK/WNcSmac/oXEUqeZUbWfUn/PFZPyDEfzWjWE1
X-Gm-Gg: ASbGncvm/6heI92W4GvHPT8nRNpzUuSpRxja6m1rasvlrTrge5qRJxj91UXtrhk9a3f
	AnRQIXl4CjYB2/Hv/STzaqaJr1gm+t61Vbabtn/CenRcgrHrLZWweBY/hXrkf7V8dAnSH1iwNTb
	eHuOJn07+QvgMhaqxnpUxk/tTp9237xbG1pCLB2nLP6K7Jj2Qg4CrdeVsuz9+Xh8pAUB1XvorfI
	kwJbfuOPrWi8OYEs2safnQjDQOtAQpyoYJ+Dgsg60i+K3sfEpVvqrehpEoUFEvui7F9FwDkZhng
	ItIWC2Q4CqG8RCpsslUBmKWgmOpKAhTvoSV+wSfW3XkHIK2jpPjS+Tt9kfY9UzZygppPy+kGgr0
	pu/S2ycDniUVrsAv1JZRSwN4+chMEst0bGFaEiXavR1RrwZI=
X-Received: by 2002:a17:90b:5291:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34733f006a9mr2006813a91.22.1763721395444;
        Fri, 21 Nov 2025 02:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyRidwSlFOnbJRIIYJwVdp1bjncHdnam+AEc2s9XEeF7HVt0aV3t296lfLC+14ccvC8iEszg==
X-Received: by 2002:a17:90b:5291:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34733f006a9mr2006786a91.22.1763721394994;
        Fri, 21 Nov 2025 02:36:34 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727be2fa7sm5122890a91.6.2025.11.21.02.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 02:36:34 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:06:06 +0530
Subject: [PATCH v2 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-enable-ufs-ice-clock-scaling-v2-3-66cb72998041@oss.qualcomm.com>
References: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
In-Reply-To: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=692040b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u1bwIIJuvd_SIhYoViIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4MSBTYWx0ZWRfX4Iy9Ew4Gp/WQ
 bJImfQzyGrtY0tSC0ud2i6OquxtUNH4IhLB3sBZr6LVqJM24LG4QcdbJcMmEGCbd7DdCecwK2ya
 iAzQHgfnUx9uIwNxQ0Jbh5jZDjmN3KNJtt6iC/BvcBFXpC+3lm+G1eqw16th4q7JflU54kJLTxD
 Mo7S0lGgePZUF1XPWXeA/HO6rWPVgApjbasded9MMsVxlXtdqA1JIPqaZb04Vy7DfkMaHYJ7F5j
 gvJoXzaqb8ThFbYVVB6bLGPiQ0B9LMa4Iexi9mf3rIZD+8X0K1EENtq/radI1C1xS/5oERdY8dO
 gijho8d3usnkIROBI8eN8/J2AuawlsndN5jjzM0fzu89Km8siugfGRlxjBrPA5xghyxOrZtAPre
 rFuTIMdsXhE0KlsyYI7tIKASVV9lPg==
X-Proofpoint-GUID: fdBHRPI17fhFZ9gj0ILbkeFSyQqXky_R
X-Proofpoint-ORIG-GUID: fdBHRPI17fhFZ9gj0ILbkeFSyQqXky_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210081

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during probe to
align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints. For legacy
targets where ICE is integrated with the storage controller,
fall back to using standard clock APIs to set the frequency.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index c352446707ab5e90e6baf159c86a0914ff4bfc53..fd1ae680c64370ae6cc8f999fbab20e4e875be03 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -616,6 +616,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 		if (clk_index < 0)
 			return ERR_PTR(clk_index);
 
+		/* Vote for maximum clock rate for maximum performance */
+		err = clk_set_rate(engine->core_clk, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
+
 		break;
 	}
 
@@ -636,6 +641,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 		}
 		engine->has_opp = (err == 0);
 
+		/* Vote for maximum clock rate for maximum performance */
+		err = dev_pm_opp_set_rate(dev, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
+
 		/* Since, there is only one clock
 		 * index can be set as 0
 		 */

-- 
2.34.1


