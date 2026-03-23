Return-Path: <linux-arm-msm+bounces-99079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGS3JsWUwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FE2EB635
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53D9030041DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A2520125F;
	Mon, 23 Mar 2026 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWqA7EyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEUY50VA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6334717C203
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228667; cv=none; b=jrqiKf5WQaGWWFY1fK/Fb49atwnGmkXiPLJW74X+zzAQp6mSN4cnKP25rIObkm19V+CasiAlb/O6yyd0l9W6KmVnU9d7isSasnG2TLSWnZAPSREqQX5nu8I2645BXiO6PrZl50FXN86J1luNejA6yZgMQgjbaPHqe4zTdQLlZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228667; c=relaxed/simple;
	bh=baPUH0igjJNSAnKp/z9q/Mft9PpLQiCQHPwVsNkTz04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijTgvqp9GZHozJ7tsP9P7QJjyeu7Vj21QDLOgZM8Usyh8Glg8DDuOlLN7hGp2P26zHCReOF51cAqYZOAFfC2r6Uu6bJQmJuBbHF0rARuScP1GQjj5Z4pS6hMyFq4TR9vBuadh8JiXTOBLp+WdMi6mTvieDILe3tZJOb1ruipSfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWqA7EyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEUY50VA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DZ0I2770715
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/t8SuqPVuhwUVvBRrLk1Dc1LxggO0aNoDGEAzNHrMwY=; b=LWqA7EyWPoIlDTJd
	cltDGAVCAGwfQo9jH2HK45UOLY1b9QRajzYyu5W044ec9DtRpi1DwmY25ExDfRjH
	5htAAY/A8nZ3Wjy7oYOiIDrEF2aWV/+LhXMVlikXkLX+VZgGNU1/HNSNoLkPY6x1
	9d1dDZJA7xvAiH1LsjdLQGLNRtUu41hi3M6Hjih0pR31P80mSPbvKrbXWJi9gaQf
	wzueF8A32Z9Zq2/D8GNg5DVnKjxMhuFqSY6Y56nbxgovtT1x8/24+XzcEef5xQiw
	MLAdjM+W8MH0v5qr9/NUXr3xtcsH024+dGoIkAu5bnu1ngPltiPQAyggK0AKaKO2
	odH9pA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1k5tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so36058531cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228665; x=1774833465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t8SuqPVuhwUVvBRrLk1Dc1LxggO0aNoDGEAzNHrMwY=;
        b=WEUY50VATJiUV0Rd2WTS1k30mUM2w+C0W+/EayXHI4SWxz75gZSLYs54FyaguTMDby
         s7aqC4rPhLPeskCK82Pef0eeEt96de4s7rGuihHUA4y+fkE80+C20mISo2JXEOR3HUhO
         RqPhRwBrqzcSlsMmgM9u2SkymYlcs4Nf+hiQMC8PfSAjO5QTBTvPtJGrgicbhAbOCjjy
         L0DWAaPRAPuKBaISTf+t2SfxGum8/17kkNANyiopeBRz0WgiqlgXSmcXvkWspXO5Yj9G
         BBUXFg5dGb7T8KyqyF8aW1lFA73e8zi6bj5dDalA1u62P1WNpAcyzfS/0+8GZ2IjD8sF
         1ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228665; x=1774833465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/t8SuqPVuhwUVvBRrLk1Dc1LxggO0aNoDGEAzNHrMwY=;
        b=RMFNfQKZtWBEz8E+ufhx/I4jbD46XRJ172vPaf+503Rhh2cHkcbN2HVKscnNzEDI5U
         GODINUHQ2syQRLUckQajLIHbBzqbHXHjKcek0/79NyR0Fkq1bNB+j25UxI2Xfq2aymJq
         Jq87M5UXBw7AW+FndMif6roz8Be0YFggv1IwNOMEhTrZdiCVu9CG68cMSK0+9JbbDTQh
         rB/hvUG/l774t6ueES0m3Rk62OgEDK/l6XMIYtE7fCBRzOwLOh7Jk24a3JMbQRpqKnmJ
         EBxaQkJIs6SB1avWNckF8fNpE1qyzWW6Rd4i8A368PdhckU721XgI0qoYKBQwbGmAEiM
         ghOg==
X-Gm-Message-State: AOJu0YwxWMBOukdBH+lmhlp+gmJNBQHESiQQ029w3jntJ8U3ygmxYvbq
	7lbVkGum2VGJdLQeQJIlcEsXwY9r/IQnLWgQdSDWqYk2fwePn7dlllj8elrQ+vuHWo0p8P/EOTl
	6lU1TXTxt2iGxQzyCpZIRoH07xo4F/GweznjpgnxsZaQGxeayhlORu/TxRmgJOA/qOySV
X-Gm-Gg: ATEYQzyWxwjh/K/dnJTKEQqxtwy9q0IvpnBqaMpY8oYpqikAbnkN0iFeZson80+ivy0
	FY616l5pIMNnLSTyG9+Kn61Wc10jLRKP/jJQJja/+vpW99Xx/nX2LdQj2HJdshZ2qaLHofkWt/I
	9fiC6LW3K03+Ks9eojWhepb/A84EkcqXhcTq0P0PA7psAgjjfg7ibytCh/Scge/iVgz9wchll6D
	xA0AGXtetUTv+OQGU5mRFSSimnlNjW4Kf+cJRNzYPRKbCGPcxHMK1HORJeROMwn2txTLg+xQW2K
	w7l1eCD7cHkgq4z0czeY6vu/bAsIz+LeLFcfvPNU8KvzA53VeD/OG0nniUAgJ+y9M2PyEQNlJWG
	fgMEFMQ/JW5GGrxv7F9rWX+gN7Qd8/h/4f0jvgAPhoi7Un/WuSPw/CesO8pXkvJ+Sqop0U2Rpge
	Czq1BXZfffPx8O01DEfv8GDIOSXzVj3sXu/Jg=
X-Received: by 2002:a05:622a:1e0c:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50b3ff3f592mr140884011cf.35.1774228664617;
        Sun, 22 Mar 2026 18:17:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0c:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50b3ff3f592mr140883661cf.35.1774228664204;
        Sun, 22 Mar 2026 18:17:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:22 +0200
Subject: [PATCH 6/9] interconnect: qcom: let platforms declare their
 bugginess
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=baPUH0igjJNSAnKp/z9q/Mft9PpLQiCQHPwVsNkTz04=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSfDBkeGmEtVasiV4Gql28ow9equeUMsxQR7
 lfteiyKvuGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUnwAKCRCLPIo+Aiko
 1a6yB/9limDxU+rsTOQYqO6zFcA33pv3UVDDPBkZ3Io1fw6LtmbqOP2iSihUjzcvKE+4IU0OriG
 oNrZVtHmsA9zpYz9LxYRgqRwB3lbhKXrjV/i9yV/1q9H41Q1g5Mrb+7p3aDCCfq5IlesEr8Hcw8
 J/XVqfYoWdsdwKh9xrbU+dcn7230zUgt1nXMaSu0wDARWkZ8MawuDILju0Ie3BO975E+7YPCQ9r
 V2w26bHIEBlzEk2d/JWTDDkPSf7eWnguBd0mJP0ZsYbPA2Mfs/3FNcG5HSlHX+rRywZ5tKrBn3Q
 hAJGKyrHFZ485vmAv8Ms7GpqzO3boMlY7QZ4PQBwf1tNMdim
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PpTN5zxabC-bSvxB45_7LMtbeVcoEDAj
X-Proofpoint-ORIG-GUID: PpTN5zxabC-bSvxB45_7LMtbeVcoEDAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfXx8YZ7Ow0vvaa
 dc+TzR7v/4FBY2ozPFSn5vhf0VAkliKfSxn1ePaG2UeJjKaXKzVGt03Ycfswo079Vrc+9dne63R
 d3zxBQIcmr5Sj8rEySWQEcBtNYujnVoV6PM16i44sLeVOJGaFn9VxWce6Y6c2qVlRXCc+voaaoa
 /HpPfHEsq6echlG7MlGGr4HBRtE3fn5lsd6qEvEIQsMhAZ+fw9eDdcf6Hsee2Qpg35ZSSPgMvlf
 irPVX3N1nM8k6+Zmcy/kQq1LgkbCZOF73J2VNjy1VGnPmoLV5VzrgNYn8DHbxjAgEXtM+7XHDu8
 AossspfmJf9asJEsWS5jgIz+nNlQGEhbhMP2Cyzr3YY1i2gcKu2tFkMjqbnMIc/HJUJvXwpxXs6
 E4e1b7Eo/EXwv28WntzkSa6s6cLrChB0sVSR3Lnh2HDldtAPR71VHjFdOf9s8Bf7ELCpaMcT9bZ
 glcxZ63l0ZSPmJXpPjQ==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c094b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PYMLbkgk4Fc5e-Gbr9wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99079-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 326FE2EB635
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


