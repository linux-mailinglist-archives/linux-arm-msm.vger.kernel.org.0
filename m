Return-Path: <linux-arm-msm+bounces-115890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1XiJO389RmpiMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:29:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA96F5EAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:29:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hU8fwqvH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=et8oITuS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115890-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115890-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 820E832B2CCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900A947ECF2;
	Thu,  2 Jul 2026 09:41:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0D47DF82
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:41:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985267; cv=none; b=dvAJ2DowbSjgQQB17BadOtxkWescVU23KZoiLTQXbkEXkTidRUqUHdY+hGzBhPl/e9rPPg2E8xY8eZF/Yu7jmgh39pkc+qki/G/Atq2G+0CYF6VCTYeP882Au/cRYntCr9+aJp0xX+f78kX4UlKSpT0sMf/HTpsIvBTePbxB3I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985267; c=relaxed/simple;
	bh=1G3LrXmYn2uEMTtea+X4pf/i7bDme/Ax046+mCCrLQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XJKzKl2NfYXpy65Th8YsppXWtGWLw6FsnOqCihJ5SoSkVNTyYsklV8rmQqFxwnm/a4YbQf/2CuGyOQVXlVzkNxHtR+neyHy1fFxMbuF3FbcjVksuEWcJfDdKCK9PO/tv55iz9AZ/bRseofXeaVmfpMpMpxC7IehU4KTswKE9g6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU8fwqvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=et8oITuS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628Q8hd3009480
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+TNm0mODHSz8vdYYesFSnv0FOwpymz1QDXT
	rzGIJgH0=; b=hU8fwqvHaWWHSLrw/cQFAr/WF2i6wbsxl3PTmPMHUluMlm4WVH2
	ugzEGWzJ1KxMlM/eNAPxZ1l6+nVu8qHcp9rICW2ILWDwQjXuWLEFykxQxKGjPEMe
	7/amCE/S/bzkoUIMrDkVYDSt9cnKwqL0uUKvOh/qeHLPUpk7M3kyULuobMDS7y5V
	y8EglbRsC2E6QHX0E58ALQ4d72Iyfx5Wcy7cylh5lYWVaaVBR2rF/WNERxbRUx7L
	zU7D8N87v84PjT/hEaSgDWKg7Z8gt+ataRUnt+qu6MHBRELzU8FiwK0RxEk2l//T
	MYCELoaq8RXDBnORIxVCabKy58tVx03hT4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rub4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:41:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1456386a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985264; x=1783590064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TNm0mODHSz8vdYYesFSnv0FOwpymz1QDXTrzGIJgH0=;
        b=et8oITuSl7EGU8+g7IluucpFW3HzELL8wWhmX4HRN79kgeEuzLP/AntPFWBI+oTGNm
         b6Z0Y57KBzojqSuAWmjQ7/Z/TVDPg6kpBgmB5wDxTOITAX4wPTwdmwyCzoHLUGmYj8SR
         xL23gNjhsG8LR/ju2W1VRmyDj41eZiILc0jsGR5tYjGF98nU8p/Sy8wa8qKucybksI0E
         /KyyTcjgHKioJ06OWaoSAFm+w6JuOMpifINiLc4bmVUg164Mwu2lbHRhyzOdGXNnhjSx
         78lj75WF35zX4S9AXDSJGZWPkAgcDwGCNxG/huYECTyBKpwzo0Tktj9mtD/8F7yYZknS
         Z3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985264; x=1783590064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TNm0mODHSz8vdYYesFSnv0FOwpymz1QDXTrzGIJgH0=;
        b=L6bWRoLO6BuxdS3qdlAa3hyRItlpek9P2QcOUk4Mi3sTjRdgCkA8jheylxN0c1UtFK
         k7EXh5MBEL1MUHbXAkac/6Qnq7FW/z1Gz1pkbe4q128YoDBU1JReDzm/nOGDrA7eVXC9
         geh7e9lxZOI+OyjMPowYukizhNmBrbQ1ts3J/EA2NJxFX5NwsWhmFdrJp6odZn1Vpdls
         V02R9frW5qIJoXwtkoRBMC3/HB2aeGauNZFZj/azl/JYC33nOE0f6nBXf0fuMEdDr1Un
         dn3wDgEdS+1DFe45lfAw10zG2vwF9wp4unqZ4X2DCGY+R+ProZGORjzhyMApY91gI+Q9
         Yn6w==
X-Forwarded-Encrypted: i=1; AHgh+RpuLPm1L2BsjY6iidXTeWec3ticaZbIIqdYe3i46TiG959ycLzyvoA7XIYqJdBNNRIkeeLnpv8hq4VoqMhk@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBIwg9bDJIa7RzqDYs0yzTHejAtUu1KgMMF5tv6b/6u9WF+sB
	GTwerg/5xtT72T6XP+g0JvNFRa6zKqBSxNvodSE1mI5AKmiIvRkJHZalDP6lENMH2Rl256aMRid
	Kz/Ae0LhVriOCwal6+PfvgmBc7XnOBDr/y1BoLe+seJzBuyDYCxtcHTOkaMXveITG+d0E
X-Gm-Gg: AfdE7cmnzak3Ud0ccJuQybNlsRNbbkMhBJ6nhtSIur668BluM2CRlZHxJdehve8JmZm
	AGYNsClGToJ5dcZDXZjuTj1fzfUgirX07S1lcZRnJyKuAXJMJNfuA+AfjI5i4grG9GLNY9KmcSx
	avV0ymz3t63lw68EupNgcEw6/YbzaTvvccnQeFQHiMKM3CSiPrO1IavT2II9SIT2TdzAGN/bQXp
	Qy/PuGgvvwKvez6307/1r8VylB4WjMxiJE4WHV9TCSIiTI7BjBC/pt1CMtqPHRbgYmrtrTq6C+U
	COGHyOzDwKBxps3nnMdZ7lK5rgUnnxy54w9xwgWhhWyrtrFfBmUkNL553E6TB0Nn/9yIN0jmC93
	dfkhxe2DGknvwvhbFOzWjjvveT5xIVc+5ikYrkQ==
X-Received: by 2002:a05:6a00:3d43:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-847c519386emr4042406b3a.48.1782985263934;
        Thu, 02 Jul 2026 02:41:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d43:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-847c519386emr4042365b3a.48.1782985263419;
        Thu, 02 Jul 2026 02:41:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Thu,  2 Jul 2026 15:10:52 +0530
Message-Id: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxAHxBdB8UQsF
 cco/N0qPeRbWMt0sMrw0zlH9dZLRXV2/dvSIOKNk18jHp1G2b08h2VRDiXH4T4D8H9ji+1aQUoT
 n8fhjJ/qRBYfIGiigBxb9fAiC203Dt9S0isP6wouzKfCfBBBhd37UWVzwT71opI8hqIay3NMic7
 5cP58mOSu8zlUb/O8Mn5CltzedGSVnY5sNwzN7+2B0yTTXjypcDMr/kkNxYhot8q7fMqB8mwLrV
 nc1NK4SFUZlIsEIYR3V+KbSnvYHOdf3O8OLMx1h3RPiGNtCt79FmoNdR6Ep64mylilo9vYsTZQe
 rpWb4Sb10EHLAVZHih+Eo4ftSrms3T9iiJPOiVyVVF7akEee8UeL6Z1Qdt7aTUMExtqhxDel62K
 1630cz7FI5eNOLt4e1kOFnPz0cp9dIZx4NZZaYYXVnxsA1KhGxUKeR0IM/X36eCZ+4jty0BX+R0
 MOhfFL46j+FJuayR5AA==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a463231 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vifq4xLP3jNeXsT3PTkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 6H5TUWtM0-6aACbuxU7pVeAJH3458v2J
X-Proofpoint-ORIG-GUID: 6H5TUWtM0-6aACbuxU7pVeAJH3458v2J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxqYaLIuOv+jc
 xxcJRb6pJL4fQJ/RTcrpSBD44zixJc0+1sJ44Cykztfpo9x+ULmvQROVykvC6IVRGNt17kswnvH
 2DPbGe9SBX7C1W0T3v+EEbEJMg4HoGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-115890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60AA96F5EAF

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Respected Maintainers,

This is v2 of the series to add SD card support for Glymur.

This series adds SD card support for the Qualcomm Glymur SoC and the
Glymur CRD (Customer Reference Design) platform. The changes include
updating voltage regulators to meet SD card requirements, documenting
the new compatible string in device tree bindings, and enabling the SDHC
controller at both the SoC and board levels.

Changes in v2:
- Rectified the iommu sid mask notation to hexadecimal format
- Updated the power-domain corner for 202 MHz frequency as per the clocks plan
- Added the BCR reset capability for hardware reset as required during the init
  sequence
- Reorganized the DT nodes as per the DT coding standards
- Link to v1: https://lore.kernel.org/all/20260610111508.3941207-1-mchunara@oss.qualcomm.com

Summary of changes:

Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
the Glymur CRD. Specifically, it reduces the minimum voltage for the
VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
increases the VDD supply (l9b) for stability.

Patch 2: Documents the Glymur-specific SDHCI compatible string
(qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
as the fallback.

Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
configurations to the base Glymur SoC device tree.

Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
regulators and GPIO-based card detection.

Testing: Verified on Glymur CRD hardware.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Kamal Wadhwa (1):
  arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
    for SD-card

Monish Chunara (3):
  dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
  arm64: dts: qcom: Add SD Card support for Glymur SoC
  arm64: dts: qcom: Enable SD card for Glymur CRD

 .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 24 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 10 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
 4 files changed, 121 insertions(+), 5 deletions(-)

-- 
2.34.1


