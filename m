Return-Path: <linux-arm-msm+bounces-107295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKadFD14BGqpKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:10:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1F533ACF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6601B311305A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85D9478E5A;
	Wed, 13 May 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJVLcoDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLUEZzYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94324266A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676571; cv=none; b=s9uPFJBtCCxyg0Ayf7M40W+3wlhUv48qUzxOo6bsdzscwlDwp/vsMklhe4mb0PoJwlYg38QNzJIcnauA0kllLkG0cE4Puzh0tCesKA3cFRg9HaFvlb+QlyhdyXHiB8O+T2XVlRVm4lCSGcczdDpSzbya0XaJlCAzQy53ymdkdNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676571; c=relaxed/simple;
	bh=PZMTLxLwbvZOwA8LX8WRjQ2jAtxisx1shd7n6n36z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHLRlKreEEYEJ491UOtF/wyqUkGBe0b+uN8MMOytI4FETUqOPNRNqR8LLmw7gP5H9rqcIIyF7NmYiVHeBkj6FdzAbV6clMY0wc1UH9wPy1OoilldikSRb0vVk5Y6Y4V0oLd5o5HhbBdCWrUql5syJggXqN1Iy+W61A1aBVdoUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJVLcoDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLUEZzYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rIud4082600
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=; b=BJVLcoDjbkZ7BvQC
	//hNu/ZkUIPjIMYvWSuK+RMfjekXDozwxoyXJmniYpeCD2fKIQbT7o4FUj3as+Tq
	m9H1ewYxvlGf/k8ZwvJgD1In67oSKj+jw/aoJua7hWVZT+u4EcNyrMPGDDHxZRIk
	HBDkFjzex1whHAcnScdt75+6aoiB6i5MMQ+qYaKLrPC2DERpa7oNbkdXvR9DMsdV
	bk0oWOgcIo+NEFJHgpD7E92tl3u6KRZoQcTGmkY1XtFihbPC1FKA7Fun2O+jQWRB
	XnMhm87QZUWMB9eTra7DiIpQh8FHWDRS5vU5zb24dTyraG9N6pVW+O4TqPbqP2u1
	9MFj2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0tn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so152565891cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676564; x=1779281364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=VLUEZzYqbIdR2Kpac/5oQidBuSOfBBpbdgdOvrJmCPX7W3OBuwnDVB9tRGax+5AIo8
         MFKpAkUdNinwhjkmsqFOiXjNwvmzLvvGybHhalz/RhCyxQH0wrp7TTNm3mYxqgV/7baU
         PY0ucoovijehfx99IUUcv0MXf3zlhgAOouLltecXeshPsg7v5RDeylNjhBhcE2V6WzeE
         qpmcArVS5JziJ9q0zGcyaejRdpv2eltRQ54a2VgsslvmbdEDAt0PjBA3JvifW7wXcJBn
         Z7lkKrmhDQk5AZs2ZiuzopnBNApE5cGdI1Af3skix7z0YXgWrcLZWk6B9rJOWP3MswDZ
         SG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676564; x=1779281364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=Ecu6HklSrvD9hejjtsNZpaOmNBmEgaJEKpxLK0ROh2IaedAPpQjWmXOW6qJTOvHxKZ
         YdgjlVecvL+hyI0Knmku9drLN742ScZGOXUi4AKF1jyjSUDeTmzwbcsTN09fv1L0g3mr
         Pa5cHTQc8WSo5PH+fQH7RXVVrSWo6/6P9gNwl1foO4UeCT/PK0sKaaS31CwCGqSLnpSd
         ykgKJWYbaeOTFwonTk2ZCO4R/sgSeBUMnEhh3mhBwDRtErB1Nf9QuRv1hNOh805e3g69
         2MxAbLJC+VRVRacAwCRfrUWaupBTG51fm1lLaEIZ1kgyc2DP375WABuWGzktjkRuIflW
         8j7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9/B+pqSRdaKKyIoRH+ERv5NM1LRVpQC3omq0z3jkI+YkziKmR5uX0KjBP/qOqsGOyD0IVt3cz1d+HCgrIq@vger.kernel.org
X-Gm-Message-State: AOJu0YynfOa4D/0RR8GojUwl2unWxA/g8F9rJuTyQm2vwNPtRgQjt7a9
	KPTJQKaVVT0anPHWL42Baew1k1GAwkIgeFsxloFar0Kb1GbAuROtiR0d+s+dZeBl7uQQ0bkQdrW
	EaRnRDwRu9wblaOXGUAoVZldmApDyNn09WIFmQ1QNvhv2ZJFopcK6YcPsmiYcY2XdBRO2
X-Gm-Gg: Acq92OGQOMPfPyKg3i39syWGpdLf9okW3BIPLgnY/kEHa0lKS8TroCIM5y6UlqRje9P
	3jmfN87Nn3b3GQsCcWiLfvwbRYRbTOpERhk4v3Rbo1PUGmi4P9zCXvywoqztrO5wvFaXs2xEShv
	oacpGsEaIITd9tYdK3mKt3PuGZds5KJmdPT8Q7LKXFWLb7PwD4Ton4LiebcrliAx4X1OPmk+yjO
	hSBO3Ur6/bTccem+eaR7WgPI5RVh+a0c2nWrlzUnTMl/dTy3C94NXb9NgJqESlu8fHT9DZUMoAc
	b9h7/9oE19nwoKO8BOmXhjuVtvfXFyJdZW0GNXEX+b8bQYrcJWse/ZxL+2Iypr8ka/NZ0QjwUbj
	/1FYFJYMqWnP5zRzr6BjXroD6MRD6acGkCJ02GtvFQXMmYLgLFxy853MM57MMmS+0K3XKY8LjF5
	kFBY9S5drJaCHEqOgSna0L+dUqKW2NqKFqPKo=
X-Received: by 2002:ac8:7d4d:0:b0:50f:c109:b78 with SMTP id d75a77b69052e-5162f6978b0mr41927551cf.60.1778676564542;
        Wed, 13 May 2026 05:49:24 -0700 (PDT)
X-Received: by 2002:ac8:7d4d:0:b0:50f:c109:b78 with SMTP id d75a77b69052e-5162f6978b0mr41927001cf.60.1778676563929;
        Wed, 13 May 2026 05:49:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:41 +0300
Subject: [PATCH v2 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-7-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2AZDVaVeHjBN9ieMkt6OZ54VG8WgR2+oqvqtNSNqUsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNAgfaSs5ARk7leg1w8+Z0GaPXa9OAPL3Hxf
 v01WqAvQBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQAAKCRCLPIo+Aiko
 1cYZB/9HoHcOSYLAeyPxLkp4spzUEb9wPcH2p9KIVPAfwC93AFLD80RP7QojH74dRDfh++aZjAc
 3ZNa7C0guGXOTA1pE+I9kEp8svz7Z1pmuCygQAT9xikfU3FpsOKi8S80TA3+zUjgkMICr27uBw3
 sJr0YwjaYEo+KSm5fH20NnIzvTVg7y5sH8DZdSdudV1/hnC7zENtWuIxLSpjN+hmyqOltK76WuA
 PEj0/k6PPSTszazBYT51gV3Qobr+a21oL5RyEQ2e7Blx7EKcSfNCoXZJLn5J2GUgs5qyCauEMF0
 SBOXo3sx8/j8giLHGW/qobgPbwTzh4omTZXFWUUPFtPUIW6D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5iaRVhQ9bkjTc3A88RorVPkocwEH9xJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX1wxXK6hIUHw6
 8SSDBZtBgvhCNG5JVy0eB++jsIKzpjhq5kyO6WPmNr0aw7ToEkfSW/gPP/1zVI4KsalXwhmg8El
 SRwFaPai434f7yjIhOySsxffmOVu2G/InP3L3LwAnlt+Wy6XqEw47BCgOLy2ZOYY9FGCyT+5eXy
 KbyzjxTsxLK49XoMVulk/AljnADKdWZTQXqACAvOjdahOtpZoa4CE6PGNhVzM5vthE0rK+wGyiI
 4K2wqEJHJUlRn1CCJZdxI0J9ssRW9sCp8Xm1p8Mtl2urlSzUv45OJ6mePqxEeoSfxFRcBE/7V/T
 LYoUKTXC2PqeZqIhIgEGIJdjw5Vwvk/tjbUY63DIHMe62X5ChkhKsboiFsBX0L9Hg2k1dTupU1q
 FgaeJJLtFEPu9zj7uIFsE9t4yT2vwBoFyCPGnTCy3irdq64RkJcp0CdrK43Ha2iUbfvgN7bbyZ9
 l+W/5zHJ/bRQIqlhy3g==
X-Proofpoint-GUID: 5iaRVhQ9bkjTc3A88RorVPkocwEH9xJB
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a047355 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: BCC1F533ACF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107295-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,60fps:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 51d8faf6fd1a..e1dc226066c1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -284,6 +284,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 5fbaff5c01ca..8c1c8b19fa99 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -109,6 +109,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -139,6 +140,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -177,6 +179,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -207,6 +210,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


