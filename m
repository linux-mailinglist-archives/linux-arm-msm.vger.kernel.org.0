Return-Path: <linux-arm-msm+bounces-108302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAH7OHW/C2olMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:40:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E5576225
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EA723019135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 01:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8D32F531B;
	Tue, 19 May 2026 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVx2smja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ve36Kf8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62C1E260C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779154801; cv=none; b=VIc2omm0AnyYBdYBArJpYX+0bQxZQNLme1dqlk6MEE+Wylp+Cwt1D8fbi4v9LfFPrd94YMV/WTQiJtdrvLGawlzxXNWNFpPt8SfllTlzCyRgaZ0641zfO2fF1HKlYyuMUwps73IFc+ceKK0CJb8mQm27JHT/ooqcbqfxrjPM3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779154801; c=relaxed/simple;
	bh=rdqFFX8N+4qr/XgMumEnNZhfJ/InPl8ppDP+C1Ieuvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n83LWJH1UyMLardqUGa0Qs9vUKnljUNjxIkqXSDDrt4Zh/oAt8y2idQYPQIs64t/g/eAKvInSNJKaFW2ml5S2JK0LMOxqa6UIMSkTiIgFYWCO0uGevYKA+9AWFNt1TUlYUbamAbwA06l8UCbYYpgNBdHdQNGbUVL8pQQ/S3wX90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVx2smja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ve36Kf8w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J0hQct2975550
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wgPypg1Qf/Pou8SVUQCZbAHgIOaAO16+RxG
	yCR2OXIA=; b=OVx2smjaYnOQgXZDJVqY3gog5aN4oKOT/P3NZ4i5kmG+yrSEIKw
	C1UGikQzvCl5CeAUqwkz1IaC0owy0vD83o0wHXDMEYQm+sgBdBFvxqBmtMJl9mlT
	VvIEf0dF262ht3pMy67d3J1Yyjuy0Tjh5BRHiRRBdDG46er01ObB42y7pbQDan+h
	P0+RY7+hVWRWTq38UuKAKgh7iNF4/OlB/+UzK+zp8BuPoZPnL2uqjZ4fFrfcY35L
	0KYHCc/Bm7qKSo8gtX5aCdWt3HgH7VbcGCAJRpm8fHBOhWsp492eB+M0e93MvX/h
	fSGBMLk9owMiHt+VIgDwqYOtI2RtjHIU07A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4a0wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:39:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-303b38ec2f6so4102641eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 18:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779154799; x=1779759599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wgPypg1Qf/Pou8SVUQCZbAHgIOaAO16+RxGyCR2OXIA=;
        b=Ve36Kf8wNAZJkem839uBe2n9VGunnMp5nM4laAp/3EE7Ts7qqmnnGvAPZ3dpqrXA/I
         YNFAPVEBUIoDHg8Ju1Law0mDEHy+ZCCD0pUjMtVQxpArDW4wGb/RUblpFuH2q8qMC2wt
         DoSbLm2T/SdAqxD/7r1ahFps6I7prhVXp3q6NwaCBHd+4BMfRfhNk5uAeKEXmXT5zG9g
         59OwHYIzQ9n8dSlQzwwIqHg624TxiHnMtrPd51guqPJCkY2ciOWsN0t/uVY9mmSjInXJ
         b5v7ekeeVp7PaYZT8+7mth4r0YVBLJ6ZZxPmRc0abPKQc9xTRFbCgKhIuyTTdGjHE0xA
         XvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779154799; x=1779759599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgPypg1Qf/Pou8SVUQCZbAHgIOaAO16+RxGyCR2OXIA=;
        b=GSj51BhwhT782icb+cSpfV8t6j7S/1VM+UXM4EO4bpCqB4yN+aMJF0usDGBHOzxH8y
         N0MgdduNP1xtxoB3pUOKk2oCtSd6ztBD1LJAdlE0ebz7NZjz4hGDyecpyCLuiIRXYvvb
         TMcuZzWRoD0OLbOVBVQIGB7I2GPl0t9ilo1PNdIK8H6+ANpqesVRBe0v741I0upuZpf9
         OoTuEydPORSYbvrC4KWkliqFpSoJHxsiLWfNaqB2y/tqFCYF2HCQcjQfaPAIe1iXWExG
         czBSx7s+vsNXzmU79QaCTp6m3zNPHF/dTbCykjYOjxPN70Wgir/A7xOG1vZSR+BxuHnW
         z/Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/5ljdRAQ8P2QAYypWrgUSfPNJhks79FOuBIIPTACTPf1O5qJUX7mLc5ntmIi0KvUQbLeVdaZDw1ZH4tb04@vger.kernel.org
X-Gm-Message-State: AOJu0YykLdOlC+7o06nSSnquKPpl7WZ4Gcx0ZmBMNMV2a9bmo7qfZp1a
	N9YqkY4QRG0OiqyKOiU2IIuY5n5iYowzpJRA79ID1XcjeVLlVGK/I0s1N3E3DRoINHOagpqMEnv
	l1NlQEy4o2A8xYOP5kXSyUJNOrUjorl2Y5su422ts6VbfpPdLdbCTk6zZQtEcrfXVYRGC
X-Gm-Gg: Acq92OHgJ9bk4UzvmskRl4JhI41immAnDNT+RrQzIC9wVcybnPk/OfNJmYsCDiJXXIA
	IYlH/JA6FtefIus+sUxfMXpmP78xrpDjDRO5u1ERwGzADXtJgUfnklRWP6z5WIvYZS6B/8O79o7
	BxPKtvUmw0d/9YqcM5RgDRu40jW9qyXzCwAMBLhQuVDa3Hogzq2bzTSL6BPBm/emKG1xxMkiICf
	o3G4OvCXrCeVrexipmo14HXzqwTmoVYVD39fMvTSBQefDY8KAJ2dupQpsLrrS5Rx4XBLdKjTUJx
	ZpJl1wWVOYSNnoqSFsxHinUY0cESRv0XjMyPloGZMUw6FW9fIWFUzpvwc9JnNUGZ9iWf6hXYxEx
	VAun4RbaemXmzCavU2jG8QfD4DKOCfPYUTC37l1xxVk+HKd3emQZS7j4+bgWjZW7CinfcIcdqsi
	B3fSbHyw==
X-Received: by 2002:a05:7300:7494:b0:2ed:e12:3768 with SMTP id 5a478bee46e88-303986a1287mr7399145eec.30.1779154798901;
        Mon, 18 May 2026 18:39:58 -0700 (PDT)
X-Received: by 2002:a05:7300:7494:b0:2ed:e12:3768 with SMTP id 5a478bee46e88-303986a1287mr7399132eec.30.1779154798356;
        Mon, 18 May 2026 18:39:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30297bbc9a3sm15025592eec.31.2026.05.18.18.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:39:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Tue, 19 May 2026 09:39:50 +0800
Message-ID: <20260519013950.873105-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0bbf6f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: hQjsbWJyLLK7xQRqSqbs-cgetkjbsl8N
X-Proofpoint-GUID: hQjsbWJyLLK7xQRqSqbs-cgetkjbsl8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxMyBTYWx0ZWRfX+AfGtoo66BoP
 q/CGeYfpyypx7vvk+/pGySGLIvfDeiQMj/rvfIt8k3qdPNabFgijHsaFYABIXrwXDLowsEPSQRU
 PEYWUWxbakMAMg6BphED1UaJLtSlcSHTXOBtP2n7ZFXRMpHjo0oPn7IRbhy7kiQIzj7x3gb00J4
 nZIY3V0NO+6qzm4nHpky/C7IcxrtBTwGCpYb1OKIR7mCh1uuRKwwRW8BedWUaBizHvvhJ1NGqF7
 RMa8lnrxsdvD5rFcVji6Uj7lJp/xJBeSHAS0t2/H75eqGuOEvhrRxcJ4REXLg9HMpgjJ6tOLy9n
 ADF5mx57nb64LFvhMjG38u7pY6NGRrxF+oXAje8hCs2eoPsJxMXiRiVlYBg5QFAGNwpFQQ0ViBs
 /TQ3VHcHS96es0yuCql5zJJVwrkWz95yO9mFi+OnsH99ls2waI25tEpQuLwocjtcZAcMA5ByZeP
 u08y/JCBpSKqXIYBJ0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190013
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-108302-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 902E5576225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Applications Processor Subsystem (APSS) SMMU on Qualcomm
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Hi Will,

It has a dependency on Krzysztof's clock constraint change [1].

[1] https://lore.kernel.org/all/20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v4:
 - Rebase on Krzysztof's clock constraint change.
 - Link to v3: https://lore.kernel.org/all/20260504080943.825496-1-shengchao.guo@oss.qualcomm.com/

Changes in v3:
 - Improve commit log to expand APSS and drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427011728.231026-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ed0d10157bd6..35d251259214 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -616,6 +617,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,milos-smmu-500
+                - qcom,nord-smmu-500
                 - qcom,qcs615-smmu-500
                 - qcom,qcs8300-smmu-500
                 - qcom,sa8775p-smmu-500
-- 
2.43.0


