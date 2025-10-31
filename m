Return-Path: <linux-arm-msm+bounces-79912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018CC25AF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01269188BAB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAF778F3A;
	Fri, 31 Oct 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtW9fTZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sgm6ZIXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056B638F9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921934; cv=none; b=HHcWfpYNa/Ax9fANClR6whNDAHGHg1I4Em+n4BGjwEqJGhI6gl73i/kduAy3jGuz609Xe6pMVfpD6OUQc/xuM2mrrLPfahtVxtrvwRSdYaqJeJAyvP0yST8ZfHCqJFY79GWKiqZ7E3kD6ro6DczbBjX2k74uCF7igQ2MUlKoPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921934; c=relaxed/simple;
	bh=6nlfIDWVoO6X4bV616Nj6UdXo/PgmNDCxuueBokBf4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QOAJPsrwNua13p9Zpp+PSI/jLTDrfXA502+invk2eVUkPw7D+hnqvHcar4pn+NurhT71LVsVg73ZsBpYtB7lQdEFECwyMXxC+rMtecSBISoBgKb1EsaWbsLRvM3hmlciVVsg0+PxhyNtqNBzFDawkJud0lGFns67yvEwRtldt8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtW9fTZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sgm6ZIXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VB8plT102819
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=77pwNb7BkfzP7XhT27GZIL
	tVUBbMiNanzHbCWZjosco=; b=OtW9fTZHUJvdFs4wEugsLpecz2Mnuu/SjcpKkK
	XcchlBOFG4v8BjmF5qT27dUA3PNROqANLOdEHURl4G3arQCZnYe0mo2lOx2kOugp
	HrvrBoHLGVionlCqA8hQUsq1EZPAiJw9MXAradG6F5kkgHV4Vme87GgvKpuBy9ux
	+THPd9D73LXAcDJ6cc1pZsWWIRQMJqJ/+emLXmHLNk4KP3bdLYk/USKJv4SpVuer
	KvxIVCbM6DANF7bko8ytluZ4kO3RN0ISLaaF7UrEr20BPV8SmWdpCaJzMLrYwbNZ
	H/gU/iO/jOFIk+DZLzaCZ8uT6a+7qkmrP4GAZf5J+WJNIKXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdkfxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed3f9732c8so5402251cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921931; x=1762526731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77pwNb7BkfzP7XhT27GZILtVUBbMiNanzHbCWZjosco=;
        b=Sgm6ZIXrL80mZ2ix75ueVSHv2o7xHUKFz+uXbnD0l06tP5mKIJgpDLPt+jNsCHTgAD
         q997POSdN5zG4tMxB/anBIzU4qnMh6ePG6+vFu7975O572BDNJAJUiVoBwV0UmhBuTa3
         h0Qlw+9GDEGEK3NQKpnRkJDIrJho7UCnDSlcFcEYt/fpfK1MDby9+IDuXPDSnua234mZ
         a/aEAahLC3ZkX0VpNwM1ZYtwNmlL3dgqcuhpX9aSynd8Q5BTVVlASijBxZGuxuN3hCoR
         qQzHu6gyQ4GNuhlP/w76bYz1BQl0DYRnewD4LXWpptOR9PVCXtRRsYBDYua32rhOw4+v
         lH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921931; x=1762526731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77pwNb7BkfzP7XhT27GZILtVUBbMiNanzHbCWZjosco=;
        b=jeqhDkBOkfmxLIgda552g+ZRjLGFjig0iTELJ7z6XF8J8J14zdp+CrhcMZqwQc3mXj
         EZA76ClFexWLg5DkMCom6EHlBFx5l8LzAEeTi4SAAFHM8OhhDBxv+euiBNh3BqbXOTQa
         O1mqClRVV4qKuWTzt0sZ4MWRZzM3lNOyT+HtVGbtZoj0xy7ulA+QPn9r9YeCRnVxL6Yz
         tehOQNNtz63v8i8KhX8iumZ/P2AOBD1cdjfE5I0I5AI7/F9rWuTy1yC1l2RR+nlVmjM8
         mvzP6vGD5UAR/TPmWQPzAsQTe5JUwAJjkXZaCjP479YDe8tagVrCaIIWRlMTWdJliXxO
         ZJVA==
X-Gm-Message-State: AOJu0YxRlKs0qrFAloVAP6ff3777aAJRNNBKeIif2MErXCFgjFhHsqr2
	Vg4YHrUn4BPlMOx00CvK7e5lCvVXh3l/M/Esd9bhDLGtyL6bh5SsASyHNvraDdddOvsQbzDwaHI
	QGxnWCaTU3/kJtKJnbigKRYFJ2+iZ8s7a5w51Lq+Rw2Az9WtmnVtxtOjABnP2LmbkE3e0
X-Gm-Gg: ASbGncsEghd+aqiRgaSCZwa7GG6tz9mU9WBgwCl7Vf36yd1U2Dn+oMrnUypfAxTPygF
	+hLVyQtHlOk4r6MAQ8mavPDS2pj3g7P8eVUJZrIxK2aSkAQF1AD+seNi1x2jr4nkQsqU8HlP1ng
	wZFx3mBGUWb3MpIoEQ4x5ZvbLBgt7kTidqrRUToyYKC3j2knjOcVOItW0BGe98hETwufwnRzW30
	c1UKS3ZXnmLRXddgIKgHq/v8S1zu8dMHhmxNHb55YMzAA5IIrGPXeJx52fVxct5m7XMOwswiq1j
	xnzVqkKc3H07OnxJ1pOI0ylWg1ADGFCY2yciT5x6+rQmP3ayL5TBxumt5Zd5+3mMcjPw5XjAwGm
	+79mItglG5OD+BYhQoNx7EH1ZNboDrWMXWbk2jp5PM3Se+shR1O8s6Ozjph2R9tk7QL9HIh0gdE
	vEOya9MyH7CqPm
X-Received: by 2002:a05:622a:5588:b0:4e8:a9f6:360 with SMTP id d75a77b69052e-4ed3106045emr43953791cf.70.1761921930933;
        Fri, 31 Oct 2025 07:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5+REZLSoIAdglhasOxd3hWm/UGtFktQgHQz41B27IbrsB/Zb7GRMxZC+lsXsS1X6v0aQefQ==
X-Received: by 2002:a05:622a:5588:b0:4e8:a9f6:360 with SMTP id d75a77b69052e-4ed3106045emr43953011cf.70.1761921930279;
        Fri, 31 Oct 2025 07:45:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc218sm541405e87.93.2025.10.31.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:45:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/25] interconnect: qcom: icc-rpmh: drop static IDs
Date: Fri, 31 Oct 2025 16:45:16 +0200
Message-Id: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzLBGkC/23PzQ6CMAwH8FchOzvdh2zCyfcwHsYouihMtjExx
 Hd3aIyaeGnyb9pf2gl5cAY8KrMJOYjGG9ulwBcZ0kfVHQCbOmXECMuJoBw7uFp3wkZrTGpeSSa
 FksUGpYWLg8aMT2y3T/lofLDu9rQjnbtvRnwzkWKCK005E6xY15JurffLflBnbdt2mQqatcg+g
 iTrH4ElYSPzRumiENDkf4T760AH/ZCeDK8rUaU84HnIhDLrYAyrVvkALs3fH5bHoDQcAQAA
X-Change-ID: 20250613-rework-icc-0d3b7276a798
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nlfIDWVoO6X4bV616Nj6UdXo/PgmNDCxuueBokBf4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpBMuAOk2hrZHHSgd0wAgezQ+fSNcc92TKHr6ax
 0lzhUOJK2eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQTLgAAKCRCLPIo+Aiko
 1SDBB/9op3bW14Vt4BEYWkX+llnk1SW1f+qbwGCYHEJOdy6G3gU0Depwb9DQeEmot09KhJr/tu5
 TWk7WMjU4y283gU16qmZN7y+vy2CxYtEBemwlGXsihvvCrfdBKuvSZ/QrkD2HEtBYUYPUn58vtN
 TUoa1XTBjl3/FvG6rCapNXRsrRs9oiQVgQ35kYl12lgtOsZB8DSHm7yrou3pPgSUo1SiAgZ7ZB3
 yGqojVhUV1ld5OjIEHHelUAxhYBxP4yeWhBk3fvhVmFoo+UDsL86W0vDuHRwxGeRtSznRfOk9pO
 bFSzDuIIXEeUslyBPXA8ALIKvaDw4bDyQC7ACM/rxz3AcyqE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfXx0PfhCKH4/u5
 2LMt77Qz4Fae+i9Bz+O6eXoZhOAUGk9ungHjuN01yWkX7ORpzrTdZdVh7Q6ENF863SPAm3TGy63
 VhQo7Bv2+BiQdoZ5oLWkhke50Wf/io0zDBhnpvm2N+Z4gkNjRk2yb+mCLE+2Ex4/BV32zxec/4C
 B2G+WlyRCdzdHeX57CQQzxSzEbACU9K8b7d21eyUCjnp0XxwdITovfWXINX18Uw4bOMzr+Zx6Qj
 s44yGbibCtLdaac6Z9GcY7PsG204pYuEbY7K33LZ1BoD74/K7l8/T7LqxACu89+rbeNM8GvqiCz
 nV35Ob/QM7isiG6BWE1KCmjQ4CXUvGv/F336ysviWFoJSOvFeQ5Vpd51vvZsMgx4RiXWv3yuzcM
 Zzq6AQESOC+8qHCRphSOcgpyiocoHQ==
X-Proofpoint-GUID: JbHc7D5Rzv6yAFxPBQftarhwG_eZtZdT
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904cb8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KoqnvRM8aJjj302hGRwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JbHc7D5Rzv6yAFxPBQftarhwG_eZtZdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310133

Currently most of Qualcomm interconnect drivers use static IDs, which
poses a threat of possible conflicts with other drivers.  Rework RPMh
interconnect drivers to use dynamic IDs and drop static IDs
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped the NULL-termination patches (Georgi)
- Rebased on linux-next, picking up changes for Glymur and Milos.
- Link to v2: https://lore.kernel.org/r/20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com

Changes in v2:
- Rebased on linux-next, dropping applied dependency
- Link to v1: https://lore.kernel.org/r/20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com

---
Dmitry Baryshkov (25):
      interconnect: qcom: icc-rpmh: convert link_nodes to dynamic array
      interconnect: qcom: sc7280: convert to dynamic IDs
      interconnect: qcom: sc8180x: convert to dynamic IDs
      interconnect: qcom: sc8280xp: convert to dynamic IDs
      interconnect: qcom: sdm845: convert to dynamic IDs
      interconnect: qcom: sm8250: convert to dynamic IDs
      interconnect: qcom: x1e80100: convert to dynamic IDs
      interconnect: qcom: qcs615: convert to dynamic IDs
      interconnect: qcom: qcs8300: convert to dynamic IDs
      interconnect: qcom: qdu1000: convert to dynamic IDs
      interconnect: qcom: sar2130p: convert to dynamic IDs
      interconnect: qcom: sc7180: convert to dynamic IDs
      interconnect: qcom: sdm670: convert to dynamic IDs
      interconnect: qcom: sdx55: convert to dynamic IDs
      interconnect: qcom: sdx65: convert to dynamic IDs
      interconnect: qcom: sdx75: convert to dynamic IDs
      interconnect: qcom: sm6350: convert to dynamic IDs
      interconnect: qcom: sm7150: convert to dynamic IDs
      interconnect: qcom: sm8150: convert to dynamic IDs
      interconnect: qcom: sm8350: convert to dynamic IDs
      interconnect: qcom: sm8450: convert to dynamic IDs
      interconnect: qcom: sm8550: convert to dynamic IDs
      interconnect: qcom: sm8650: convert to dynamic IDs
      interconnect: qcom: sm8750: convert to dynamic IDs
      interconnect: qcom: icc-rpmh: drop support for non-dynamic IDS

 drivers/interconnect/qcom/glymur.c   | 225 +++++-----
 drivers/interconnect/qcom/icc-rpmh.c |  18 +-
 drivers/interconnect/qcom/icc-rpmh.h |   7 +-
 drivers/interconnect/qcom/milos.c    | 142 +++---
 drivers/interconnect/qcom/qcs615.c   | 511 ++++++++++------------
 drivers/interconnect/qcom/qcs615.h   | 128 ------
 drivers/interconnect/qcom/qcs8300.c  | 671 +++++++++++++---------------
 drivers/interconnect/qcom/qcs8300.h  | 177 --------
 drivers/interconnect/qcom/qdu1000.c  | 348 +++++++--------
 drivers/interconnect/qcom/qdu1000.h  |  95 ----
 drivers/interconnect/qcom/sa8775p.c  | 200 ++++-----
 drivers/interconnect/qcom/sar2130p.c | 630 ++++++++++----------------
 drivers/interconnect/qcom/sc7180.c   | 678 ++++++++++++++--------------
 drivers/interconnect/qcom/sc7180.h   | 149 -------
 drivers/interconnect/qcom/sc7280.c   | 617 ++++++++++++--------------
 drivers/interconnect/qcom/sc7280.h   | 154 -------
 drivers/interconnect/qcom/sc8180x.c  | 648 +++++++++++++--------------
 drivers/interconnect/qcom/sc8180x.h  | 179 --------
 drivers/interconnect/qcom/sc8280xp.c | 825 +++++++++++++++++------------------
 drivers/interconnect/qcom/sc8280xp.h | 209 ---------
 drivers/interconnect/qcom/sdm670.c   | 522 +++++++++++-----------
 drivers/interconnect/qcom/sdm670.h   | 128 ------
 drivers/interconnect/qcom/sdm845.c   | 766 ++++++++++++++++----------------
 drivers/interconnect/qcom/sdm845.h   | 140 ------
 drivers/interconnect/qcom/sdx55.c    | 489 ++++++++++-----------
 drivers/interconnect/qcom/sdx55.h    |  70 ---
 drivers/interconnect/qcom/sdx65.c    | 457 ++++++++++---------
 drivers/interconnect/qcom/sdx65.h    |  65 ---
 drivers/interconnect/qcom/sdx75.c    | 378 +++++++---------
 drivers/interconnect/qcom/sdx75.h    |  97 ----
 drivers/interconnect/qcom/sm6350.c   | 629 +++++++++++++-------------
 drivers/interconnect/qcom/sm6350.h   | 139 ------
 drivers/interconnect/qcom/sm7150.c   | 653 ++++++++++++++-------------
 drivers/interconnect/qcom/sm7150.h   | 140 ------
 drivers/interconnect/qcom/sm8150.c   | 706 +++++++++++++++---------------
 drivers/interconnect/qcom/sm8150.h   | 152 -------
 drivers/interconnect/qcom/sm8250.c   | 736 +++++++++++++++----------------
 drivers/interconnect/qcom/sm8250.h   | 168 -------
 drivers/interconnect/qcom/sm8350.c   | 684 ++++++++++++++---------------
 drivers/interconnect/qcom/sm8350.h   | 158 -------
 drivers/interconnect/qcom/sm8450.c   | 601 ++++++++++++-------------
 drivers/interconnect/qcom/sm8450.h   | 169 -------
 drivers/interconnect/qcom/sm8550.c   | 501 ++++++++++-----------
 drivers/interconnect/qcom/sm8550.h   | 138 ------
 drivers/interconnect/qcom/sm8650.c   | 527 ++++++++++------------
 drivers/interconnect/qcom/sm8650.h   | 144 ------
 drivers/interconnect/qcom/sm8750.c   | 602 +++++++++----------------
 drivers/interconnect/qcom/x1e80100.c | 610 ++++++++++++--------------
 drivers/interconnect/qcom/x1e80100.h | 192 --------
 49 files changed, 6642 insertions(+), 10730 deletions(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20250613-rework-icc-0d3b7276a798

Best regards,
-- 
With best wishes
Dmitry


