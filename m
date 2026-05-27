Return-Path: <linux-arm-msm+bounces-109978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMVgCUy+FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:50:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C925E21EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CBA43053BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1B53BE646;
	Wed, 27 May 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgA8xXz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKKfmk/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7523F2109
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875121; cv=none; b=WAolDDNUmoSi0gFLt4qidkbL3xuNAB1DiphCuJ8QFAvrcf84/UAb+jL59C1leRiCTgQAUmsTLVUanntAsrUx8i5WpJ7FoWLRuW/dK/hx5VxGdCditod9ri2CrBJyYJeTKWHQqfZq3XtphAXPi5A3UJdX2kK/TsTGJkyFne9tZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875121; c=relaxed/simple;
	bh=rJAWNGsUae+RFQAefT6e/WJHv3vndCiQ0/pIsj28NOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObDONyQZ7K4B117GNUtd1LKaNln6skXnaLnFWfUxSWpmQXQ28cBderUT2608uz793mqfxQ2u8N4j7ZMfyd7wYSQkNbOwqzV32jb6fP/oMe/6U5nlhfA4g5IslhW9fLB5OqkXz0GEzBAmkQLH/BURx4PR2/bOI9ZnNLe+O3FHpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgA8xXz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKKfmk/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mX9O1167814
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FxhIsXPR5LW
	ktLKRm5hy7oEi9MsprBwCA3a46iFjFrM=; b=dgA8xXz6AEC6S8SXuM+U3MxMHHU
	LNsslGIwXh1yEAvF+ItIPFO8s+C+iP2EO2v+owGCaJXQSk5q8JO6+f28eYR7m0Kh
	MLRf7SeW7tXbifczxlW6VdIcm81kTbYE40dmR98L62IhzdN3A84XLEGsQtaVNDUy
	u7ZOukt4hMeGUaLTQP8eHuPq+8y948ckBPLS/SyAFZ1AiW5Phsdf7xeDCrx4jN/R
	MLUM4guvLNlxQxod3HVm41GNGRkGrEzOkK/TI2yqdD5n/1bcsGAOWsIcdobXIx2s
	t/aUDiAiBYF2wk8fvcoUkx7twjUnFr1oWUbDnhUiH9qCDY/ETnQzNeO7MOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk33a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso117836555ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875119; x=1780479919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxhIsXPR5LWktLKRm5hy7oEi9MsprBwCA3a46iFjFrM=;
        b=WKKfmk/ty0WG7PJPUCEVlJYpgb/VaaRvNpfZn7QpD1+8/k1vd8ZrFQa+VVE2pFdGw0
         AJDH42k4mqt/FOtfDhOD4zIOU6nba40PWTXtlADtSsR5p5GFER3S4ftapYPx5EZoEwAt
         +dKIZIXjEfxFfV4Jop8OfLizwXY1iNXhChaVC1WFLZIvlfaQ8muoSd2V2FeHeneu4uCD
         AvE73o2JxbjIngEHpY1GbqWr6tzdYy7qpuCwrV38ABqobZ9eJ00hx5dS3wirNJPz0PT9
         SOxMeMHEaz+Y78BSK5F6KHCh9SEDgIO/BfsxSP5H/I5SPLz3UfWOJs7HpF33yh6Fntej
         8eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875119; x=1780479919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FxhIsXPR5LWktLKRm5hy7oEi9MsprBwCA3a46iFjFrM=;
        b=QSKpE9dNnLm8M1iIlHaZzVvxJ+e9ZEajtzGYn4Tt/KzNqYibSUbuqL78GC27wripqr
         DlpVGqDt62wE9onbmWMIWagOoeLDeo3mvnX/SjD26tKJYefKngNzuk9jun5lfbsevuc2
         czJrMapcaNqhI9lRWDIDAi1Lg4FWFGnjXhBB2uyYvYEjfD+IS+eGbDDV/UB71fKiEaGh
         IbVPQCy0gfAP1bIdhImN5Jj7bdcU5jbeCHLLCWMsGrtfOOIInzrCtoe5hPE2dg0A0bQB
         cPHW1fM0qQalbXT4L1nV/ihHGVDguS795pWOrv8FWA7zkQVi4KfPQ3jMAeSZlMDWIcVD
         v4YQ==
X-Forwarded-Encrypted: i=1; AFNElJ90z6enl/OjO3mnR2sBJ684LkzMPn8jFvJA0r2iiWqaAvslluLY6LcC4PmN6raYVs5m6YwypFcK0rdEcNyP@vger.kernel.org
X-Gm-Message-State: AOJu0YyFHuAiJDyPiJHkOM9s+IsoCpieGawxnJdLeFY04u20Eln5CBNz
	v+uSapl49BCAi5HVYSXEyLSJd8XczyFcFiA+BVpf/7Z3+LOlbf9FR5+H1IrKBlOT8MTZTlMHHVb
	kKWpBNv/iwPvW+DtDIyHuuBuPjukOea6UfbKgUWkwxTZyzkm9dTlfjP+nVPXcMGI+itBn
X-Gm-Gg: Acq92OES6c/ZIBHZL35feURTywXTZN+vP4FebXAXEaa++nXWNVrYPgaJrA0H5T6dTb1
	bt9fItzR7XRVaLqdav/VAAqN0c6KrlMG/R+nhm+jpCbx34P+aO1J4HWLlI6HQXmhWATvPJ7SgdY
	KWk0ni8nrgSOr2O/p0LXSVFSa9DIL89ZPFwq6OB+xaZA5EJqgWA/zIQ+CibDl6ix5S4tiVdcQpI
	U4XDSNX+Fb6fa39E6SnOhGtDUCmtAmVKPMRJKZ2nrOV3qIKKdbr9TTaDZWschWr02H9vI9S2dty
	+6MknfHsZVGd8HxfO0liG3kL6X3Hj7bH63+0dC4q2/oSdWFsuJstW8HLLjwfGHuqlJDNP98mczF
	/GuHMoDd15Twmeiz298NPRD+pLH11g7KtoZT2lY1r00zmn1rqDV/pbFkkzzE=
X-Received: by 2002:a17:902:f544:b0:2be:bb7f:ae2f with SMTP id d9443c01a7336-2bebb7faed9mr209221075ad.27.1779875118400;
        Wed, 27 May 2026 02:45:18 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2be:bb7f:ae2f with SMTP id d9443c01a7336-2bebb7faed9mr209220725ad.27.1779875117882;
        Wed, 27 May 2026 02:45:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 24/24] arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:29 +0530
Message-ID: <20260527094333.2311731-25-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a16bd2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RnlY3zcTJ2gksRAPNgQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JyOTGxfrX1EHVfUDsH07XoQFLa7VUMfc
X-Proofpoint-GUID: JyOTGxfrX1EHVfUDsH07XoQFLa7VUMfc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX8Cc8gV/iuGyr
 zFcyTC47QlPYSEhGA/7TdwiUVLKgeKJJ/rXUuHVCdWu0JT67yP5N9TaStQlZ9ZgvUoM5+zD18dM
 IH4d2nPAmiTwfQFvHJT5zioqJqDLeKOQFtscMqLcV+e/I4DJ+pLOXFbPpyUmkqGvmfitDmGAz2P
 o8feAlQI/3+esXUk3qfw56hDl6WM9i4myzxGD8h0dycjZuSQU9dskgMVZWToFlTzPORVSioDa9m
 Ya32afXVCNv/mPhv3fH7cRYpGo/x2qNGyq3aaOIk+iuQdunPMVwn5XelyVMLQH3oq/Axfg+1byf
 ALRIoc4khxV5a9S9aSam45EBdkxb+3WzCgtIhE4MJmxiXV9lwwNop5ECj2C26ATRLbxXG/t70mj
 RRSbTIdudyHUuOfDkW1P2Xg59DVT6TA21dCCZBs+ix/mVeS0xRzlEX2V4dLNcvCdxcBWysBTz2C
 /uzS3krh+RDNp1CdVkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109978-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,qualcomm.com:email,qualcomm.com:dkim,0.113.56.96:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4C925E21EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on eliza spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x40000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 24c680795481..190728d3e752 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -917,7 +917,7 @@ lpass_lpicx_noc: interconnect@7420000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x40000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 
 			qcom,pdc-ranges = <0 480 8>, <8 719 1>, <9 718 1>,
-- 
2.53.0


