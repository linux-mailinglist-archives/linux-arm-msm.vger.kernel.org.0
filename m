Return-Path: <linux-arm-msm+bounces-99077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIZwKLqUwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782D2EB610
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D46B43004D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E71C203710;
	Mon, 23 Mar 2026 01:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERWSg9wK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpHZessk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF4C1AC44D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228660; cv=none; b=EDoEGtCfcUHvzuoG9nrJVyMkJwPBeWL95jDoNvncGW7BloOa74I3lXGhm47cmTeLE0BsGEmg7CSeA7Crg2HY7zrVCKe0Cs7QJPLGhUrMViTlhzfXublInSv/3XlAE2ZC4081vNX4zQSF6iAQis2zahG1r2koybMyjD7GNx6nLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228660; c=relaxed/simple;
	bh=ozckWw8+tIOW7mP4eABTKY6sc1w7ANmcnxLtEjsHZKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZ7QzpIirJWrd/dW1xjBOEUX9C3G7UR2QXig/7lrE6mcSXr1arNxI62xvsPFtwJTemeHLyfWczqYteM5BvsRyK5IICHyJMB2YFit6u2G0hEKegERVa12sfCBcWsXGR6OiYshsJPy6kqgJPP6/tULY7VzhXnHKXlY5RrQPfVcAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERWSg9wK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpHZessk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7GSeL421728
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=; b=ERWSg9wKKw2XxByl
	nxqNd0oZKoeOduigol3txwFCFj38+/o5dvzhgdeHr4I7QKZf9XzvjwHCDBuG0qTc
	YG8qYhXEdQUToeM5svpmSJNu6DMu5Osb8h/5NuGG71q7dirK1QSxw3flb/OpkHLt
	ZOhQRa8LJg6OwWCuQYqMzgosmogfc2/c/by0c4c1Umj3QV8AxJ6tj/5i6ivMc5CV
	9TX472xek/QLEenkQ6gTNDvFnUqTlT7xViJjgGfYf9wfpSAnnSRr5sSm4AJ94ySF
	ACCriPINgdX/SZT+4Kn+tu0Lu3oypQRe4Oq5OEQSciiy3KvF4LrUXupQkexN1FD0
	Xix3ig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cu522-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so17128401cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228658; x=1774833458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=;
        b=KpHZesskNSLnihWnMZch7yAkY4Bp2roCiaBE5U7qh+XY3wGAhCqReYY+6KTajxNQ0B
         qV9yQpHxi4FkwOmstWj4zF11srZpjoNdOa7JuabZNkugLydCDL0TzGqduUD/mxlZunU7
         PUfeOUmsvivHp2Euio3JeprosskF5T4uOhAuHRszFZ0yLCzkUQZKOM6fcB24EQ2BIBWP
         ezhS+GuT9kt5VY/ru/+EbvdUU+sGUGG3nNpoLtFU7aBUrccXuPqWNvQKQp6hvpwuL68R
         tryav1E9JRsoilqXddGV8rBTyXvl9Rpu/34UkHSYJvpd2QGniOi77K8yJTgHk4NzJA6+
         4z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228658; x=1774833458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=;
        b=GBlvFgDv6BBg6ArdfT3xaBQkCpb55ckIDQO4jxAYX6fPbQyvnDzweXy56F2qFLPCK7
         BvhknZ//RhHtouG00PPglTtyiVbPNUujZqHTBEa2AgIoh3UPnKPWp2+j1jvyePIFgBu4
         xs3poOQOMyMIxIB0z+eoEWFcdF0QByzV/ohM3QRL0jfpV0RHpdLtZDZe7sS/n7d7YM4a
         rbKRkkaAnqjneYomQ05ytIZOOi1F7AGExVzD8GqFJ43t6ypD+Ezbuna32FLnbZdsx4dB
         fmkp82y8oFMt/ucVO3J62j4CR4wh3TBuREySZpq+F59vWmZBvFfeNddUrWezitxOYb/5
         ua2A==
X-Gm-Message-State: AOJu0YyVOTtoiuB13Dm9U63VnvICjfVbVBFpLsTOqWAQ3Eo8U/svb58f
	fEx2cbWYyagRSoecWxR0oBVw6bd5HSFisB5j44iyBQv22UNfb7AHE0T+ROlLkCp14kVjxOf1wps
	KJaVSKxcCTl8jSN9JXAR09n+eRkCtF4qQURqTzEBIvlIwVfDKbTZNBy7UAIAeeP2C+oa8
X-Gm-Gg: ATEYQzxh0FTqYdPfKXziPN2wXe19NMqhaYapdnAWdu4qHdG5c/1p+NIcbqrUkOICoiy
	RHhwJKuqhcTFHpFFIvqDBEV62EkyeopoadDoNTRRL3epHBrAQfYWs8jvmAFx4562+k5mf+LScQt
	4XX/WiogbsTIXrPUSfYreHRQRYVWYUURH2yvut3yJeD7szxkxUAht8R/2OgD31C/tWgHVkwYQfJ
	acQKXVAiDToxkQUj50RujRgO2s/2D6DcVIVKpNAxbLOFuxfw3H/uF49eS1sv+6Jk6X/hn8jho6t
	Vs9ck8LCqvIRnFqMSpmR8aXnliI2oyDEVzLnD10mcL4vUMtdi4qSfk5V6Aff6LwPnitpvQb40qx
	93q3pn95andFfEgN8Ga/0G1bZEoljCj9tB41Lmx+hlMXJiS+ErlHLgUUxXc1kp+vljiXjJUJnol
	pq568v+/lNb74p/aZZu2qlbIpXlZPZO6Oaiek=
X-Received: by 2002:a05:622a:1e0b:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50b37500af9mr161031691cf.51.1774228657759;
        Sun, 22 Mar 2026 18:17:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0b:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50b37500af9mr161031501cf.51.1774228657354;
        Sun, 22 Mar 2026 18:17:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:20 +0200
Subject: [PATCH 4/9] interconnect: qcom: icc-rpm: allow overwriting get_bw
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ozckWw8+tIOW7mP4eABTKY6sc1w7ANmcnxLtEjsHZKg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aBKfM6FASX8enmfMgXlBTeqqPz4nVom9CdafqlZ3Sml
 e7Y/8G8k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATcd3KwbDCcEmmzPJ+g62x
 TzdwZD/IVNR7HfzJqPraz9t73///xXhsu88GmTUX6lwXHXO/ITXJQyHez/Vjed28M+/LLslltuv
 2ps07JRa+ckne9yUiUZb//jT/eOHxuVuQS1SyQfJMXkGMkn4ly92/7EunRfuIC6r37Dz3zfbJ28
 sVvk097Wo8YRfezZVM5a3OX971WZQ1SvfEBKm0xf+k+5dytGeI5Rc7Tlxtuji7Y7vqtY1Tpnilx
 az7NFdVZUX6KpGHod2ntR70tmlUGqmszz/Q7fthce+q3IkqHTXm337YMyyI2nbW4XbbUkPtoL07
 I9IKK/+Jv+T63xlw1ldGpPCqcGCCbtL/upwNzswSfI77AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aIL27O4Uth6W2j0Eloz_jZGnjIBD3HRO
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c094b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6pvQaZlX7ZpTHHZizXIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX8u1mUpKGaytQ
 PxmzFHJcAB+NYbehzmdOQoI4KGEc4pCDMTF/hFCSN5GCIaVp46UatDlVugUsCh7UCZOXYAet+oP
 h5e+VYyY0F6SdFhhwHOP7aqYcYf1aIGUcnfU0Ge7Tx9UauHDvdotM8YfacviAuHM48DADy1IRAT
 UIVxOv5CYVu0ACPLNKQm3Uo2tnHKttnhXLfIhqcIOgYaLlLEAQqZZ6yiOSUFjxfTIsoDQYuchxP
 VRI/LXheWKGIuuGjE3+oxs+YSwsg6PpwPXkbOves9kbDMEZsdPL28iObLgaJJbIw51Q1cZaWyKZ
 NkB85EFKfMw80IjhTdPwnhrPQlmTy09174H8A94rUnF7W1IFUs9JJBAkprNTY4Hgr+tOI9yTvnH
 Lf07OnIq4giHyCF4ArBXDBINe7PfLoxQhykvHGcVNkPRpzKXdZznxtWeuzHFMeb58NI21/E0HBn
 UTC6Xk6Md7oNu5NBIow==
X-Proofpoint-ORIG-GUID: aIL27O4Uth6W2j0Eloz_jZGnjIBD3HRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99077-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5782D2EB610
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MSM8974 requires a separate get_bw callback, since on that platform
increasing the clock rate for some of the NoCs during boot may lead to
hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
msm8974: Don't boost the NoC rate during boot").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 1 +
 drivers/interconnect/qcom/icc-rpm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ea1042d38128..aec2f84cd56f 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -553,6 +553,7 @@ int qnoc_probe(struct platform_device *pdev)
 	provider->aggregate = qcom_icc_bw_aggregate;
 	provider->xlate_extended = qcom_icc_xlate_extended;
 	provider->data = data;
+	provider->get_bw = desc->get_bw;
 
 	icc_provider_init(provider);
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 3366531f66fc..cbf0a365839d 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -135,6 +135,7 @@ struct qcom_icc_desc {
 	unsigned int qos_offset;
 	u16 ab_coeff;
 	u16 ib_coeff;
+	int (*get_bw)(struct icc_node *node, u32 *avg, u32 *peak);
 };
 
 /* Valid for all bus types */

-- 
2.47.3


