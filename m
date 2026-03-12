Return-Path: <linux-arm-msm+bounces-97242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJvfH6fBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:37:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B9272B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEC9B30F4671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59113C73E3;
	Thu, 12 Mar 2026 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NojoTzVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRBYqyMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0542B3C9424
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322212; cv=none; b=giZH57Bz8BhgX1e9XGQGMyWi1nhzvNW7m/fwaXrc5UaAn5QKJ89HDrXZKwmVUG58x+U51ZVi4tO8VcrkUwTNaUPJXzeUa9yaV35A8GSFsc/mD19f/wI4xa05mou81Z+eKn2btQgvYAT3JgJ0IEkYmOBqD0wGic38fcx7yH2/a0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322212; c=relaxed/simple;
	bh=LSluZwsJdsGyaDROP5csbwtPVQCwJHNeWkTj020h790=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcOvHk2e5D9eyBMVx1yDrpTZ6PfB8ZbQqYC1u0wqj/3n0bfZT0sNI1ZTgQ+Ut9qEfmVKGZMiJ9k0lSqFhrPKbuLms3NIf+ZwozfrC5rAdBkeBwcJxxDukYOU33+sRnJJ9K+hJ6kL5Ss6lE833QmqVNO4+D39wXd3csoUfJEE54s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NojoTzVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRBYqyMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2c3sm1740759
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aG6WWz3Rg90Q5nuUQjZSHvpWUje1SbHhLnTAkmh3AsU=; b=NojoTzVDGp8MYNvs
	YuTHy/QmDjL/+QzghPLw/apWgLQFvO+7hDmQgKOdSdepucOh0OgrGPqV+PX3NFjc
	SfBR4me7Zv4Ymj314/aND5xUU45N4HnIgULiHhmwUACsj4QRCe4aCJZSgeFqbWTP
	kmELXsfuQCdyvibdVJXWJrEslC/evxmUzQjWyji0B+kp1CRl4qkd/NX+/fREkxkk
	RXz0cag3d1u6OcqaVK6cTO5WbOA/XN18BN0aOsQn8gNG/k+t/u14pzqVsBBoluCd
	gbL5S52BcD8cYvZUsVmuYLDhqNoPDfGFfNFfJMjBLVzQCyWTakdZepzm0bRD0GLy
	5dJBBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdhjv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so831225985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322209; x=1773927009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG6WWz3Rg90Q5nuUQjZSHvpWUje1SbHhLnTAkmh3AsU=;
        b=WRBYqyMKQgottX+TfA3KfQ8F6vXYSs90IMCxpeeuHQGyO6DxrV/g8xF8JjcsIavB4a
         oenQyb/b14TfEglbXbreZCIf1gq6MKDasS5zt4GXSItWAEggmgJ3O+Xh/dH1T2hyoh2d
         ZOUI23byCQAd6EXImjd5F3zjsUlDlIMe5o+zgGHnAgIh6nZDZ2cYzAy4EHSbbcTn7Oec
         /tkW5pe+tcKveihLbtDHvkxDL3ulvk3bqWNpLW+H6bQRLZOxr7gUlsRMhOyQOnUyeb8P
         SsRp3e58ADYIX2cuGGc1r0KpdgxCSg+5h+VUVwpF5/5cxoC3Expeae9gj2PDuxuJPflK
         A+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322209; x=1773927009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aG6WWz3Rg90Q5nuUQjZSHvpWUje1SbHhLnTAkmh3AsU=;
        b=sXKsU1dbHJw01eNynYvgBvQE6kxgYUBFQ8+t1C/kJ2Duc13PzcBGBEbVGJGYBr4ga1
         YDf2nOPvl9HO51xjiQZOwtKxPBwsTs6gVNiGTbRdwn6C1CSqZbKo9bW23gjOxq4F0+IE
         +8NT2tUn37lkiIKlo/Yg02Dk4x0J4qlHlyRONNc6j4QHeUoAl5noob/ULB50kDGiC2KA
         4mMiSgAw5tTYnHecRKaXHrEXBoHUET0nh1SJqsVaj+j4T2xazLKqi2wcVbI4C1svTDQe
         9AdGP8eZH/GORN3OsLGOffutoaXeEGRBdZXEk57zvihactrEeWHYY1yCwRN2QGOF0z4J
         dvWg==
X-Gm-Message-State: AOJu0YwXiB7kTZx1tRAUhU6YcZ4fkDkNg2nZGh08tmgxGN+JWc2dKCDk
	tomt8YCPmvnFKQ1ILtd7gsmkiCMQ0I5L7Oyblzsv9fsVuX4bR/HQ4uLgH5rDkYPrwM2oEdVa9qG
	gjmNAbRZYi+AsOeJVBbehshf9+1PHRcVgURnWR8DETnAAv9uonLcwGiNdeM6e6xE5T0+F
X-Gm-Gg: ATEYQzxvhzfHlDo3a07BTi0Nlt2Cz6jPy6g+6nxGhVRv9Bkn7CBa93aAciSAsghCeq3
	w7R+5O4tJ6oeqpNBrpPH01nyqWO75zWGnz9uR0JZi+cZv/fJ+/fgkNpfk01NSM1SLgjulJNMpzU
	eBlq7K9pviOmhS+zKrjwWCVbx0SmWwKv6a4ZEwxZ8CIp1twB7kf/I3VDuCdyOlMn5QhD73QR35z
	1lnIKBj0ZhmAnhxp/77wpaMA/Uy7YbPebd6pZtjDm0Co3Nv+qCyGdTwWvtrbT2EMg0rnftiUTgz
	d4tfaU6ndEE+Kq8PAenmz60uB9yTUGLIU+0OfwvczXFn4f3XCpjW9ezie3oC0xTwIDSRiYwmG0P
	PacSv+AfWj+YykDSxOC6KAHPFX2UrXCnqX+d75fuNQ8CMr+x8eAdhXLiYt5i7jlqlxuQgkRd00j
	HcrhmfdRR2RE35scUCMKzVFr/xHWz7oSq6uhc=
X-Received: by 2002:a05:620a:4441:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cdaa8c59c8mr458842285a.45.1773322209081;
        Thu, 12 Mar 2026 06:30:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cdaa8c59c8mr458833985a.45.1773322208450;
        Thu, 12 Mar 2026 06:30:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:43 +0200
Subject: [PATCH v3 22/27] soc: qcom: ubwc: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-22-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8046;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LSluZwsJdsGyaDROP5csbwtPVQCwJHNeWkTj020h790=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+4l3Ko26/Y3svi3Oy2rMDak0u4jXAac41JU
 8oQWrSgN2+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/uAAKCRCLPIo+Aiko
 1WCLCACGiptIVN8WwsXvOgrRnbl7l5jkpiuG/ToAYoSX00jIBZj9xuGmTrQ7ck6xyWPOva21EIJ
 MBAFgUcKU6zS5vdxj8B2cMJvZmg/uUxNLa7UL4tcjjJw2bQpQtK4NLJukngS/8gyq9qtLP+cB+T
 GW5wQWKZe6SdZxBdf8yIT5TMHj35fCRWqe096yuujGItur284+oTCVsop8dM78Pj/8jumfoqmfo
 aDaZDFy+8miqkqX41dnLgu1XEWCO06pm0l6gxjfCIkIvSb1kMTPl+yNsYwRkabXWv94Pw7kgRl3
 7sYfqV/PKRKUcRrPs6iXfkqV7ckbcWeDSvcV9xeW46ofsl/B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX7zn8+UjR0Xou
 wtptBpfbtOdRRJewKqHw1DOHQSczXyT/3VSS3mNsdNBAFqoJtenDcXGLl9GmuD9SaUZ2cXzNcRP
 iCMeEO9MFhLV5GJYAYIPtqiH/kGdvHZ9GI4bYb/EL6d5iCKxqznOhRub6vkzwH3KjnuNa6671h8
 fAS8mlyQuJaQKsyiTgPYjQIRqT6xztTymo+k8tLKpzBEWguq8QadBYesS/7ElQryb8GhKtgOOo7
 CI6SbCBJS4aaATR6CgKbbNh1isuLnquXKVjhGOAKI16Ug18hN9nxk8ixK/m2OiDgDyO6YjrgwxQ
 iZevS9o2gnllPObTNsEzht0tMq9DyyOgH7ZbDPgPWvcrBxsjk6FiRyvUBaBcWtYIbenh1UYYzE6
 JhKqsSsFjtbxXIwPj885xlGx/2RMWnp7eflWafsDldT90hUt/lOtxrXe1nxkHZNSAvKdPUOa4xW
 R4/qs6/66fy+alrnRsQ==
X-Proofpoint-GUID: 7swnrF4Zv1dgrt0AsnLpB7rT8h7w_1aG
X-Proofpoint-ORIG-GUID: 7swnrF4Zv1dgrt0AsnLpB7rT8h7w_1aG
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2bfe2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LGEa-qlQBoucZRe8vqkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA3B9272B84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ubwc_dec_version field has been inherited from the MDSS driver and
it is equal to the version of the UBWC decoder in the display block
only. Other IP Cores can have different UBWC decoders and so the version
would vary between blocks.

As the value is no longer used as is not relevant to other UBWC database
consumers, drop it from the UBWC database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 22 ----------------------
 include/linux/soc/qcom/ubwc.h  |  2 --
 2 files changed, 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index e63daf748e30..c5c7fcb4d013 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,7 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_dec_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -28,7 +27,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -37,7 +35,6 @@ static const struct qcom_ubwc_cfg_data msm8937_data = {
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -51,7 +48,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
@@ -60,7 +56,6 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -70,7 +65,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -79,7 +73,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -89,7 +82,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
@@ -98,7 +90,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -108,7 +99,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -116,7 +106,6 @@ static const struct qcom_ubwc_cfg_data sdm670_data = {
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -124,7 +113,6 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -134,7 +122,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
@@ -143,7 +130,6 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -151,7 +137,6 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -160,7 +145,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
@@ -168,7 +152,6 @@ static const struct qcom_ubwc_cfg_data sm7150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
@@ -176,7 +159,6 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -187,7 +169,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -198,7 +179,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.ubwc_bank_spread = true,
@@ -209,7 +189,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
@@ -219,7 +198,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0b5aa9d0343b..c3f9efae5db8 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -13,8 +13,6 @@
 
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
-	/* Can be read from MDSS_BASE + 0x58 */
-	u32 ubwc_dec_version;
 
 	/**
 	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.

-- 
2.47.3


