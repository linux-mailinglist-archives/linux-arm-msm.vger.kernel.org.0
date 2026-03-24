Return-Path: <linux-arm-msm+bounces-99460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ITkJFDYwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:18:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E780F2FF841
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A6BC3096615
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525993594A;
	Tue, 24 Mar 2026 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYzkLm57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDDSliVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4F45BE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311080; cv=none; b=dujuS/ZKnZrW5WvESpfRvexVWUl8ZohG6xaq6EF24fJxL/mBLi2kK+Y0NYz5TV5UzEJhQJEgKbYAi3RYcxwpB+nCrV6X31SWSbj3A5dwiCsSA4n0Upfk3k8ZkC3EqkOGuYohG+jwyP50X8cE0yYL57cXsGSlnxScqsPGy/mVqzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311080; c=relaxed/simple;
	bh=8a6RAWnpQyKLw+qq2wEoeMrOdQrrg1+uqpvE2+exeXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boawm1pEJpnADmyUE/XuewupCIvmd+vGes30GuYPHLhHFBRhWNLlRMqD/MfPgFK2sQa+KCEicMOzOkjS4ljfVQZhsnCH5+7ns66UWJTm4O8LodnhNyxexrlmHsznbzPNLQBPfa8fJ/UdponFZvV+w8acDsG+bZL2UGKFDOX0NrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYzkLm57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDDSliVr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqwjt2972577
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuNcwWzSJZ9Jk+gtOFKvHK8967Npp+PD7mT24N4najw=; b=JYzkLm57Pe+x4wqO
	7UvzB2j96NrwiN3O9jQBXcTv+TbMwjfhiN+UUVTL9oJFJmbR/nHJP/wfqhdpAcXi
	Vtn3JU7pOcaRTrGBp3H/iECHKMhmJPmjNtAVNoz/AmcjPiqB9fd8mKVBnLdHyj5M
	PL8PvQMe4/Ad+UVpYjNQtk1UjexDB9Lm7G018cUsIHDgzizctBO8a7FSb06pCBc5
	HBofLsnPGHCsFdd9jD/PrJJWveZ9lHAmmKaYvyz2rOgW/aV5P398U8HwOyH2npUx
	G+Y/9uVpPtvlVL3VsLHZncC8pNegYyPvpO73PjRSjSzAsJVhaODX2itpBuj4vrFE
	7CDPQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc37yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so19237331cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311076; x=1774915876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuNcwWzSJZ9Jk+gtOFKvHK8967Npp+PD7mT24N4najw=;
        b=dDDSliVrm8gg1BPu/wScXhJnHrBeHGyfdhhI/HIWNC3Dzkl0HnA+iBsfOo3wthemag
         HPXtPP3Ei4JMo+xAIH0FSc41KZvXpv4FUmrE4lq9aCnwS99SM3ezlc00+XJI8J8SxSH9
         CjUqFtKHyJxQkU2ARTqL1iIvygyEUxc2OvpI2AkRxeyHjPoEbibASiyptHN5m2eddU5u
         UwzYhLjKpBF+bLoXgWeG4KiMkDcriMPJR2LAw7rD6y5XHhVwJBESHprZOzgvnyjcF6a7
         hOJztT87Zwz2hYAz6oNYohUxjM2+IcoAgRlr2EVghQDezevs/ztzWyCombUTP00zIp67
         z7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311076; x=1774915876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CuNcwWzSJZ9Jk+gtOFKvHK8967Npp+PD7mT24N4najw=;
        b=GwvxYHxRVhyqzqJyfQELSoQiTfKQuWwsCmlNLhoJcyiISiNLhPReAlS1cKLQQclBan
         rzgOthIhqlQfb62QNN6VE9HggG1IUDMZa+dLyGeQbw5ewHZzz1RfycjZjQZ1EA9baAos
         R06ECeq/5Es4LNNfzeMmrfz8ut6kiFdkb1fgw6Zkmz0rRfzfTHpzRC17n50uKKxV5I3e
         5n/arTTLyIbYc0C3xLGIsYzvls477Tfgq6tLMs+7HOsT1e6JrIJ+hp85BiZq+wzm6EZv
         26FR02v/LxJyxYPMAqNL05D9e+qPLVwpEwqvdWEc6rti8ajD0+q4dZFAtEjvawjFPPiM
         kDxw==
X-Gm-Message-State: AOJu0YypNIrtslhhdTcfr5NxYlvt1seqVE1bjHqABSaA+1uEASY85wPx
	CXve/XGkFo6LQ7yrIYwGDOBap5ShapYYSptFkneBmm1uWpumX1QNY0JFbP0N1WjbJeT0qkWaZVX
	jfZ0qqvipGu2EE4t9JAHRiQeaUk0a/hDwxyGFVIlqEG9oUteSYSmee4kGY3e1y7SFb1R5
X-Gm-Gg: ATEYQzw7XjD6CqcRZ2ewgBgWxbK7uNI66IFbpem5gZjyf/3esSNIbqXAzwQI4cGYMzs
	c1+Q1lPcDfr6b8Xm3b7s6BorS0RoR2HSfDgk6vWPaKGPtIV7Fcd8qQjv86Et/kTN2rbmqfPZ7hl
	IrYz0oBhRVr28pDaSgjfUSPwWkcq2UX5eTJuuPaylONDrKM/Bh+QtUK4DibAHpbjf+GWRrGuun9
	Kr3B3sv6duNQynoLZ4nuTUczvwMOqDSvcHK+zWtuAWtfTx0/ZQ8gvSXNMuRtigLLsNgFNzo1skE
	TUhiMDFDe7SWP4+GNUvVyPKMRVpdKW6IFDrX1dUs9QDqDAgucu0cR9471xA55uyMZz6KyHTjCAW
	pkpSfvYEQG4G5fgGVJ2fRzXpZuSbGqCfveocyyP4mrk7mEDO+V2hH28JpniJU4ChTZH/2mwUcfl
	Q6zmnZJhc5WN3mIP8W5CeDW0Ja/Xs27tSYCe0=
X-Received: by 2002:a05:622a:2686:b0:509:4faa:f3d4 with SMTP id d75a77b69052e-50b373f5e0amr149282781cf.3.1774311075711;
        Mon, 23 Mar 2026 17:11:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2686:b0:509:4faa:f3d4 with SMTP id d75a77b69052e-50b373f5e0amr149282421cf.3.1774311075239;
        Mon, 23 Mar 2026 17:11:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:11:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:42 +0200
Subject: [PATCH v2 6/9] interconnect: qcom: let platforms declare their
 bugginess
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-6-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8a6RAWnpQyKLw+qq2wEoeMrOdQrrg1+uqpvE2+exeXU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaHp7qz6SG/DOiLvdooiKKlYIUeJE2ZSuPSV
 +Tnah9NV52JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhwAKCRCLPIo+Aiko
 1ZVZCACU7k5s3Gj9S0OczGq4VebeWmPfpG1WesCjjw+x8OheSTobHg1hHr43X1rkLkkzZbMz8Qa
 IsEod2PWl6I76+CQ3hWdI50Sbae+HLmvAW3dhLm/TfydM2S6jB9X/FdzkgueLZDe8l7pxHcTJF7
 w1/P/6aobIE+BgJYvMZ3XrcY7cA640YTiDNXR685dkJkbbaAq9R8UPsc6OsqUboXFOxG59aHl2X
 XpZZGZRoPX0qgeJyQggTS0GjX+YDd3DJYo8ubuPkqL5iXscC2sN+gc8yl/Gf8OQrpER2tbaA5+u
 fgYuo+Z4yW2CmFPLsyCIiXbZY+lksK3J3GPQCSEGXu5PpwM/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1d6a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=PYMLbkgk4Fc5e-Gbr9wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4NTNTs0fVuKdvhxWL4F5KewQ7FzYVdrP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX778y/16ddKUB
 CvcrwQtPe3E6CHg2PVH/mIZab8fA4gCGY8KwCSIx1jkxn/PjgCKNBzprb3SpsqdjqmbTa6eZuis
 8C1mTqsuBLbO7pC+K4kOF+N0XJz28DkLAriKvqfhzRsv0OpnVsKyAPuBjZ2514SDeiGTC6ci4go
 uDhuT0aurXp6fmmVhCfll0lRYj6bSD6p7SyxZg4Z4cRg9LVFVElSC4WAFeqhsSvBGdhCUL8ZaZi
 xp8GJmmjmgDojWJGUsrnb8GgzRK7z5b1eDAJK7WFH14C/RB7W5PMdmIzQGU2HxSWbvrlwreJS7M
 m2d5PavY3QdpqC/VVJSoo1ZaUmhDl8/YHz721EedSxuWdXMeoI5/fblagkg+D6gkYiw6HZ4KEgX
 pJ8Bieu337lngGXU72Acsaht0IENtQpirrzCkUAT+1t7zTiftkocINYbE8NoQE9xNljZcPsoimp
 QMoxKY3vecVJfTYo/EQ==
X-Proofpoint-ORIG-GUID: 4NTNTs0fVuKdvhxWL4F5KewQ7FzYVdrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240000
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99460-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E780F2FF841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On MSM8974 programming some of the RPM resources results in the
"resource does not exist" messages from the firmware. This occurs even
with the downstream bus driver, which happily ignores the errors. My
assumption is that these resources existed in the earlier firmware
revisions but were later switched to be programmed differently (for the
later platforms corresponding nodes use qos.ap_owned, which prevents
those resources from being programmed.

In preparation for conversion of the MSM8974 driver (which doesn't have
QoS code yet) to the main icc-rpm set of helpers, let the driver declare
that those -ENXIO errors must be ignored (for now). Later, when the QoS
programming is sorted out (and more interconnects are added to the DT),
this quirk might be removed.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 17 ++++++++++-------
 drivers/interconnect/qcom/icc-rpm.h |  3 +++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index aec2f84cd56f..23a1d116e79a 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -204,7 +204,7 @@ static int qcom_icc_qos_set(struct icc_node *node)
 	}
 }
 
-static int qcom_icc_rpm_set(struct qcom_icc_node *qn, u64 *bw)
+static int qcom_icc_rpm_set(struct qcom_icc_node *qn, u64 *bw, bool ignore_enxio)
 {
 	int ret, rpm_ctx = 0;
 	u64 bw_bps;
@@ -222,8 +222,9 @@ static int qcom_icc_rpm_set(struct qcom_icc_node *qn, u64 *bw)
 						    bw_bps);
 			if (ret) {
 				pr_err("qcom_icc_rpm_smd_send mas %d error %d\n",
-				qn->mas_rpm_id, ret);
-				return ret;
+				       qn->mas_rpm_id, ret);
+				if (ret != -ENXIO || !ignore_enxio)
+					return ret;
 			}
 		}
 
@@ -234,8 +235,9 @@ static int qcom_icc_rpm_set(struct qcom_icc_node *qn, u64 *bw)
 						    bw_bps);
 			if (ret) {
 				pr_err("qcom_icc_rpm_smd_send slv %d error %d\n",
-				qn->slv_rpm_id, ret);
-				return ret;
+				       qn->slv_rpm_id, ret);
+				if (ret != -ENXIO || !ignore_enxio)
+					return ret;
 			}
 		}
 	}
@@ -361,12 +363,12 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 	active_rate = agg_clk_rate[QCOM_SMD_RPM_ACTIVE_STATE];
 	sleep_rate = agg_clk_rate[QCOM_SMD_RPM_SLEEP_STATE];
 
-	ret = qcom_icc_rpm_set(src_qn, src_qn->sum_avg);
+	ret = qcom_icc_rpm_set(src_qn, src_qn->sum_avg, qp->ignore_enxio);
 	if (ret)
 		return ret;
 
 	if (dst_qn) {
-		ret = qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg);
+		ret = qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg, qp->ignore_enxio);
 		if (ret)
 			return ret;
 	}
@@ -509,6 +511,7 @@ int qnoc_probe(struct platform_device *pdev)
 	for (i = 0; i < cd_num; i++)
 		qp->intf_clks[i].id = cds[i];
 
+	qp->ignore_enxio = desc->ignore_enxio;
 	qp->keep_alive = desc->keep_alive;
 	qp->type = desc->type;
 	qp->qos_offset = desc->qos_offset;
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index ad554c63967b..7d1cb2efa9ee 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -51,6 +51,7 @@ struct rpm_clk_resource {
  * @bus_clk: a pointer to a HLOS-owned bus clock
  * @intf_clks: a clk_bulk_data array of interface clocks
  * @keep_alive: whether to always keep a minimum vote on the bus clocks
+ * @ignore_enxio: whether to ignore ENXIO errors (for MSM8974)
  */
 struct qcom_icc_provider {
 	struct icc_provider provider;
@@ -65,6 +66,7 @@ struct qcom_icc_provider {
 	struct clk *bus_clk;
 	struct clk_bulk_data *intf_clks;
 	bool keep_alive;
+	bool ignore_enxio;
 };
 
 /**
@@ -136,6 +138,7 @@ struct qcom_icc_desc {
 	u16 ab_coeff;
 	u16 ib_coeff;
 	int (*get_bw)(struct icc_node *node, u32 *avg, u32 *peak);
+	bool ignore_enxio;
 };
 
 /* Valid for all bus types */

-- 
2.47.3


