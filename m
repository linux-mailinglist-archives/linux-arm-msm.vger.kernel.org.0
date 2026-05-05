Return-Path: <linux-arm-msm+bounces-105841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPz5CQ6X+WmB+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC24C77AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABED130A106D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678943D75B9;
	Tue,  5 May 2026 07:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIYAc0wF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQkNoDTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3793D6682
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964438; cv=none; b=kg9Z9mAaw/tIcqcYegEoNXzfpnUvzG4vOWiYGG9i8uuCyZZVjMlD7JNX8w4MX3wIon7fYnh6LAOtOQs2vY1se3GNJlgpGNpPApDEcp1+fE8CUaMsaQ9vYOXdBkAaEQC10/iYSvPlsgOcHcachP1Z8/6C1vCq5wTqrBJON+u5Nv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964438; c=relaxed/simple;
	bh=XCLAciwoGLa2sJvy/DDGRqny4ifzNwzjaeJeVzt0PYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d0gA1hAhI0RsACQ0b+Q+hqLhFiwNPknDlo3FDwuMyBd/rpsvU6zjryN755I2IlSN27PNXMHzBRcmeKtP9qxFDZducWr5OV73S16KbLyEkYR8W4vsJeqDAj6Po3B4RB1Bw4W54KraOH51fMyRzbSt2d2Y1kFx98047vqBqwsKqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIYAc0wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQkNoDTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645044VJ1346318
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=; b=XIYAc0wFJxzEGvc/
	aUOolG4rOkBmutVXUNU8SM1/TVb6OL9iXDBL+kom2dgZnmX9RYWvTs4JOoOd2wvC
	D34o3YbCKlu+k/Oxen181/BNCJSusv0IsA/XC05XKLQb+6CBJQjARnClpb+GLt3Y
	im6Q8ddCxXFEF1vA3rO8rNa55ygB8vNsYQt34QxjrwVxjvAKSh9YNOvRAwc5vjk4
	B7wuy8MOacnb9VRXE1vIyXYDDQomFu8BmtVjoMcLoXnFrSpsqCHFf95bSFgEY73A
	8hfeTRsHWcGWCij8E2bBZc0+KKcHV4aVy3hA9aiWoSdUkO1bdACZK9YNPzeKiBj0
	/XrNyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xaukk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:00:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36529b265cfso2203013a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964435; x=1778569235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=;
        b=dQkNoDTpjJDr4odTDeSOaUPLzyhLxVqS9bTTSkOSRUZQhG8ojTiIV+eGGFMrgLWFuN
         UEU23dngDwGQn8AxEapk03aj3wKABL1KcXjETdk8nPOk97Ol8SrFqYNEHV7sIZ+klmJX
         wPki27lo2cApXr6tDiZZzFP8MtyfD8q6BuMxnIm4Wvm8RciYZMaibzg/zU9ORVLgtXry
         j1U4NF8/YMMcSfzfpoWn7ntm/GBoh4eBR8aIrbRMqS8xUdRztgCexVRrSSxlmUQsXIJ6
         /svh2ET9LRjTBrKLzuK6TqlMBeurkG9pTFdJA6f7O5psvY26UvwOka8dwedv3xVAOLk+
         J3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964435; x=1778569235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=;
        b=cLM2MbwMTTwtS1pNl+aAwE5B5AfznCD+YQLmqr0ONNB9c3sUzXIEDgPK1cUkJY3ImX
         aTOXJwHDrC4VSpdozMHWkMFB2VHd5r9ly4A0narWnvKENmfDt+s29RykUC+agLVZcD3J
         L4y13m/bMuf7tCPie2f6H/1KPQKNokopec3RHxA+T60LD24c5lfSiQYGYDNPU6F4+44O
         dTsGhVdiQKAsKOdYIulnozhQYz+nHKPXkEv5GNmfnZOPkaiKhJqYBrCMOh5MwT+Q5j4n
         kWI07nFVPus76HV1M2Izs/mEDpZ71oB7bQ8EfM9CoN/shg3hCxLXOYK5nqe/KXy4yyGu
         424A==
X-Forwarded-Encrypted: i=1; AFNElJ9as4jD3uEG6jF4fXK0uDYqPV6d6JkPVXrdKF4e961KaK/9T4g+/JL/LQGx4xQa5mOAyoTJnTxl1esjenYp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KtKfhaV+gVWzSEq2BoAloEjFXB5HEk+pxePTT1uj1GUXf9D/
	zu3mlnlB+98N1KjLag8S24U/9K06prW13CRDgqT2OERAWutz6cfDbHm/t9i8GeiL4f8g7R0Oqf/
	VP/cHz395/sL2du/WWduKd5h/RsHoRNta6D4TwZ2std6bsXoqlSHQtzvU7DZQ1NPLeh1r
X-Gm-Gg: AeBDietXTTYPrxZgqMvvxQU+aB74Aznp7XjVCglFCWGcNfUDiagZv1iEipqmZ8DxKSP
	MDwcmToXNvBvXZBHf7xnUI8fIxR4KciZQQIuLVue7/e6YIZYHLL8ZeGLRmPLwKg6/fsztWm2t44
	YZOTxHT3pR5uhiYjGp+3NiqS/wBA1pK2/DL+Va4EFMWaShG/YF8HdwKVmklfNgWsaJAtMMFnnn1
	ad1swn7LmV50TwDb0urrfZYlwiyHWeef5GIjyLYDnTTJ46xz+hDvxyEjsN7K4X2Muqw+Ys+N0T1
	+6fY3qDQCCl6qdo/4igRDrbqZOWe4OwsHwtEOoY2w5xA1swNSkoCvf8t/otBaV5E5RtLhe6MLky
	yVRP9kN9+oo4rfResH9HpzESMgFi2VYF+OBb4JHWhfTru7rkutvDmid3rOaGabltoSQ==
X-Received: by 2002:a17:90b:3c85:b0:361:45df:103 with SMTP id 98e67ed59e1d1-365773ba9b6mr1998781a91.12.1777964435340;
        Tue, 05 May 2026 00:00:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:361:45df:103 with SMTP id 98e67ed59e1d1-365773ba9b6mr1998752a91.12.1777964434865;
        Tue, 05 May 2026 00:00:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:22 +0530
Subject: [PATCH v4 01/13] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-1-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=XCLAciwoGLa2sJvy/DDGRqny4ifzNwzjaeJeVzt0PYg=;
 b=ktXf49S5sgx6u8kMejEzA6UiVMOHVQS4joL+4BEKP49XKZ4vQFp65+/vb+24gDkEP4GS3Qp+Z
 Jr0woULZO/2CoeWozlpPFfxeMfe4S8Akw5yLupWJ66leYOiL915/QLW
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f99594 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: axjMnVrIZ73OfCFiGaYGEinbuNDnMENI
X-Proofpoint-GUID: axjMnVrIZ73OfCFiGaYGEinbuNDnMENI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MiBTYWx0ZWRfX9+z78IpfrNNj
 0N0+lo2XwtIQJyTN7H7Ht5ESk8UOGzUi7JZyw7BTMZ32FMYlzOjXxHu8qKqCKIKUUDlokvAsmM1
 Q3TyRWuI2lNeN00slsa/2RGXygRpvF0dm/uQMDKEp0YbdxdAecrtusyBP4oxIR3Ozp/9XB/UmFf
 WpwlcL2A2GpzZDTmUDdwwH4oowjbzGiOL26nt08upeU1HSui4nimnyuOftl6NGWyAloVNLsS/Ak
 IW0+3gOK/6SE7SrtzGlYSyLeSdb63y2Wye84FKLnlrjJVfG/sWVri7pzzHrSzzBMrhxS9fa5k+m
 W1XvcnP12essXf1td16pbzn8+zC5pTKpsGNXWV9EhS6wuLkMyEO39ASotfKcc19k5Q4TKsVBkKA
 N41Ac6ZJ+SHcZr3Vr8pDbg7zQXvbdK0fbkSZPKmO2ooZ1bvACMvDVndT7XmiDqi/B7WenMdrJ9P
 ev/s54vE0mKmEpauUhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050062
X-Rspamd-Queue-Id: BDDC24C77AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105841-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d9..f1f9e04b7c31 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


