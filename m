Return-Path: <linux-arm-msm+bounces-106716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAojKEsz/mmHnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:02:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480F4FAD7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51D47307B07B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C10B3D903C;
	Fri,  8 May 2026 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iel1ax2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAZhpWSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9833DB620
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266872; cv=none; b=RgMUUyw9bZX6OC5W8FS+fNWgsWaACZYdeXAGYPyJCcFo9l5P5rcpJt6BBy7sFp6piuRGyab/MQYVngWFoNoovrswPOSdvntVcTBenUfMDirJ3V46uT9fXircsMZ8MhMHJYDzesihj0LndUdGe/dnn23R2Oaou/52rv9IUbQfCx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266872; c=relaxed/simple;
	bh=ECsH5Gs45CqpRqX5C/jNn1QZ5iDd0NScn6UK3/KsjCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1J3mcbC8Rc3ypbC6IRIhXElRbgkx5tnFxIm2Iyx7yMWqbtK0Q9KVcNvKYVpkY06t6jIUhMrof9jfvtzf4v/ztkMgBl2YSuXMgcEwaPrySrBq2JPfIcQ27W9zeWx3C1kxS7yrURTtBw9OZmI53mENF2vq/NFVXxwAPkgeHKULSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iel1ax2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAZhpWSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HeddP1661975
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=; b=iel1ax2rWwLeO8uZ
	D6yJn+0z+XjVZA72k9D5bRPJhMSmXyjx8TszMpMcdCpmpefZ0FzZeaA6yZULSurC
	o1J0PfV1r7xBL5qNUabH7LmldPwb4rGDwOBOIFZ7mbYrE80r+OR8f4OioX2NyPnD
	eJ6dRM5lLpW9U8HeNOOe4UTKye7tcOoeqA4STQAtNluiEXMwnaE9Ja7VykIQlR/R
	j7qX5dpXrAZHdRYH82Js+uYqks4Us7YJasAvcZsNvkCkaC3YxdYSDQRIv5r8BKml
	UR5akM1jgReQtOFpbJD8vdr/jbKuIzpnpU9Ltmbgw40UngID18yUIBEbnpoArlBi
	iO4yog==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men08qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:01:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso2929339b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266869; x=1778871669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=;
        b=OAZhpWSInhZKhJoUdF5LckMdDUK5aU0jSjXgq0xlSQDw5vK2qw54LjIGh9OHchfsSP
         mhRtauH+ReyStG1KK/4o4Zexflaj0meY63ZJG1mRSMulNzYwwawIJYBpN5xiHkJeWXS/
         LDCRU3DNWlDKufv77M74ZTC0pXyoM6UdNsdqm5+SgWSf/I+kPtSu1g4NmZTPjditkKaj
         VA/M63vp2LOFRLofjKPL4KovR9iXogo1n8+e8U3ZOH3U7FyVrFwYNMhJuUllnXp7wPSz
         bZrXLmS9cF7TnQT7Xyz3PjzmvrmLbeHAzHLOb4JKQyUFsS7u+xgYRyslSjUnP2snQZf4
         EE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266869; x=1778871669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=;
        b=dr9m0d2gQu6vlxtYGM0YlRuHlkAZAjvv2dvalQ73FkFq+r5n36bVcGu5z99YkWbS/p
         oP7U7VKvdyu9zAyq6MMH6/IWEnSg/J56WyiztEorE9wetyzTN/lEuEctV+4kpK3gIdPQ
         QneGm9fuFnxpcMcn1/9ckubvArOD6S9ThrLvY4vpkoIQCYMG0rNLw6sW/DH0LcUZ9XYt
         zLLzSWYtIqcSQaXqtJEJfX06fSr4Ng2LU0CCwQbdZEPDNilMJkd8nk1fLBIEb5ffPGIS
         A1oWBAYEMQ1jbDyQS0B+f6sStaSYMZX1iJEYjI7ytQO4G66oOVErSnqGa8V1ljbxYNup
         56WQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5qX7t3ePpmknA4SUN7jpfTc6yGVSqnNcgWqrL2TqxTAn/H2OiZdGTFf1GPguXcdVa3Mm71hfUeT/zAUJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMPil1AsZkagWzIiXeOcxbzzcec11WbD9BCHwuqaCxzc98NkW
	ZlgB37nOrBOxahDWYznKoe7TaBFE68/Y/raJ7o7ehbU7uhchSPjolg934HsnwcjnjI5fIo/33i9
	WRcxGLevVxdgsHtoZPULsyDXfVoVnq0U/8xGZA8wIHShg+m+qR8pWNM4zvPFlBH6O3oVy
X-Gm-Gg: Acq92OHm9VOze1lcuznKakdFfpFlch8yJNjTwGx7RHN+C14KfQSLmmovm/Ka+ICOGie
	g61Hf78Bo85mKXR8gMhHagYjYpLRaW4a/eIEgr/DDO3kBU5BRM/6yGUdhB3bc9GLgDEjCJiFkwv
	LIJWVmCSeT6bxeuQ1rrXWwzHmqutvhMQvkRhH3eYZyuEvkgWwTP5gt1A8Ktc0Oh43M4Z5UJ/IDA
	7Wy9kvjx9I6K52mIVoKBjAsK71ey1WGVFNwHOWDZyIuOZrlnbtZ11Q3wnnwNcz2kURejX1JdAF9
	p0uWZ4W3+pPi1xxsoWleesPBUBlLm3DTojdjs9ztns33I5gQWyWc9dVS67YZhvz1rhONNKtp5F2
	uSryaOc5pwGLt5+1ej+FH7kc3s45m4yTHMPy+cbDXOl1f2bzoP18ZwQU=
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr14043034b3a.33.1778266868621;
        Fri, 08 May 2026 12:01:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr14042970b3a.33.1778266868032;
        Fri, 08 May 2026 12:01:08 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:51 +0530
Subject: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=1118;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=WbVuGY0YNDSgJ/NUQMQmGYDqgQRedyuwh2xVr1Rt3qk=;
 b=g4ip/Dem418f0yjnajSGGs74S3S3o+EBtTgU2gWCC0Y8pQtMZowyDugB0vnAvvkDMUhHColtn
 EHdVoMJlf9gBkirrywja/++JGIhsXzm42t+xad8qNcttOjkBs2PFyVN
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfXzFV4+3849Y7x
 Bb4Umnonbw/AzD/7eRfMRdWnoSNXBzETa6Hw+hhjg8I0YrL1b7d90ne+V/IBeQoD7pHlvgjL18R
 jniRCYeCIpea+LQy8cFZzkiJglPb28spUPdR6Q9Aq/vnglVTwiiUHL6V7WujJEGq47Rxl5rN+k0
 Y35kNy4iCKNT68+4CuxX4KuT5eHDJ/3KioQ8S7r2zcAhWwjrG+1q/IqeGcr8EqMcb5RosjPlv1s
 9c+XEgZ+qnqdiwxe4ewvLELo00u/s01JBP0VfZu5XNATNUtfF2+nunJ+psrHrUfHw3n4rifOBaU
 HrDnSkk/uVtrMVKlt9puZaEauO5xtCq0HbptSWfRSxGtuN9FX4jn3UFAXFwFUKxVErH2wKjHDiJ
 t8sCn7DOwDm7hcoFM0cszbjuxF5s3wZadXGWARHJf7wXv3lJMnoDmC6xgABnCbkqkxwcOflaQ1j
 ZRLP61Zccm6X3Ktlk/g==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe32f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xrnvD3-Nyurt3IVA76Lirap4C8fer1EM
X-Proofpoint-GUID: xrnvD3-Nyurt3IVA76Lirap4C8fer1EM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: 2480F4FAD7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106716-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fccdbaf6dbd5..903a8bd118be 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


