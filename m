Return-Path: <linux-arm-msm+bounces-109075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WErzLYAPD2rOEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491C5A694E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CC93303C3E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B68F3C3BE8;
	Thu, 21 May 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iASd879f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FboRLnYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A353F4DD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368841; cv=none; b=UFMEGChRGTKTP9OcOXbgSzB2TMyklQysNFJJ8ty9PAI7Gzzncn4WW/E9Scwam/+NiC/s9RxcRxrzqpes+sgTkAIWCyx7HA6zq1wlU07XUw81gF4R6cIeCtQ0stYn4ctOngW1t0qbitgN/ylZjlWXWTTlLHYQ4OGG89v0OsoXK9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368841; c=relaxed/simple;
	bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HL/LGCZ3nTrMDmLDc22zuqYvTsE1h9R334N4Sdx89k+sfBk0mjVPgQtzK4PpESXNXPTGE19Ay3wNPu7LdChgNYbTuF93gMm6jnmyx3OOtg/5VPYn/ddzjyfOIT3EbItseyZ4y3aZv13clgjTi7v52CrAXaeS2WyoqeFpD2KCF/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iASd879f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FboRLnYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99noC3451416
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=; b=iASd879fT5XK52mV
	53TU+4vkr4SvCb384fUlyZCOjNjXiaaOn5IqGYcqNQu0We2KT+HYQ6arr8TQkAeG
	8Pb9HZ5UJmDR50YJeMSFAJyKeYEZQKvWiIo1C41AS+U8H0Y5KPZrnTFEPK72uZE8
	AruAppggVHabor+/CSFdg069bd4uN0j5xWPkdHQSreDbSsp1mx/ErEG5wV+bt4o1
	Z+yZH1j7cay2BSUVIYHim3wkXZguzU0oj9/1ahECmsPTaDtdfHjTRm9vnlhNVxMi
	OiD5VYB2mK0egtw14jgYudMO/K5zrd5MR1sU+kIbgogV/ZifIhp7v+s+iQPgtuLa
	kSfOuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8xf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828ab3b033so8691755a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368838; x=1779973638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=FboRLnYePwMx4jlym3s1sx8OinRwFpV5yQoV3OM7dh+dwo5NB8EJ7wjPN6CIwMT556
         mWRGgNQdYEQXzONQXe/vcFNU+vaY06PXa1c2+zIf5k0DWikPicESmE1Qq8Ffc4eO8w5v
         9l4efvHsBhWTMfoQzP+vZ4KNS73IYP2TPbILj1yPpCqOTJZSfpZ5U0bG7uViyuV8gzTI
         Lz0D5mRuf+DKQscrTDzS2o92ahX3aJXBFICIesdLMU3TQZ7R0rWtnBf6nmxg6ZAIHnyw
         y2GrVcg2508w7KSxfxIJnuw8GQH6G7p7LBe7hz28O4ES5qXaLP0bpaYl0+hSwEiZxf03
         +SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368838; x=1779973638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=hBponKSVjKy2gC3pWufV0xSGIjUwq6cRbtyRDfcxA9E1HfSyrLgwMDuMQELt1YER1Y
         5Oe13CNgF3Ra9OHymt3njO5rTslwk+YZtajF5wIHvf55H5WcR6kBSUxPTgM/+TsQSR5n
         HNuiPbrRte8c6MI3+zFCQPpl276UmaixnA004Jon8o2LLAwkYSt/JZjIBLnTp35eg7Ki
         ThWBGq295sS3v4axIc27EQdFJBvDB4m8e4fDJ+UBDzGGpMF0Jp8pbPRud1nH/QsS8Qi+
         FBXC3QgfhQdbjumRLAOyqERhOHt85AnejmdGWnYiRlhEL2xQSq6Y3vqdA8h6SeJaWGiy
         T7Ag==
X-Gm-Message-State: AOJu0YyVKz9GvdFhwH1Pk5IWXlM7LKKqGeuBL/2iVvsNGT2GF/CtwzA6
	4YZ/fkVgorhbzddFRcVUvzCC7k09AllvCt76fUQfS7/zLU9IdagFTByfbgVQTixau7TRMaa7+Zu
	4hhyeXlz7PX8On7WYzRKUR+a7jaUjS2b1+cPswEI0UXet1pqZtgoos6oe2YYh13+XJ0QD
X-Gm-Gg: Acq92OEZudS52DCQzVkTldIeR16xoiP8fILPt0fC3HEBd8TURmn1nM56gN/W48T6I0g
	kmjzVo4/3BAqqRVr/xWl885oPQrnyjunoR5c6tNzIJoo0qZ2tGuTY7JAZLtbo+Kjll5d1yJnUj4
	Ow6mgVqW5en6J+BkocVPaXAJB3njLnIj30DJaYB9ACXYentrFu5PWNEJ+J8C6V1k1OLK2Nb6eiy
	bG8E60Qfd1Pi212YFgYMD+77AVG0EfSDHJVvmWFfGZ/p7Cw1VXYm8nQgJ8WaIeWH26ZhP7epf09
	6mp1J6WhtM2gJDvhIMkdSSRFsYjN4tmZJ97+6RGYqW0wvDkrJpCEjMI0RBmboHsiI/ycumi//Db
	NB2J/ehfj1bV1Sghbv3z4hxi+9ZXFEHrZsiclChiiKD9cipXsFyCD9Lnz
X-Received: by 2002:a05:6300:6cc3:20b0:398:d6a9:fc9 with SMTP id adf61e73a8af0-3b308540f31mr2181443637.5.1779368837622;
        Thu, 21 May 2026 06:07:17 -0700 (PDT)
X-Received: by 2002:a05:6300:6cc3:20b0:398:d6a9:fc9 with SMTP id adf61e73a8af0-3b308540f31mr2181412637.5.1779368837119;
        Thu, 21 May 2026 06:07:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:38 +0530
Subject: [PATCH 05/18] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-5-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
 b=AFwhFFdPHrmOzBm+Y5cDHbjYatnjgL7nxcK0Pxfg55a/qjPxkHmJ3RE0nxD0cpPJi9w/ioPY6
 2YIjGnP0BRzBZFYtyoO3Ru5f2+q01qLa759D2O643MtPgN7j5wXQ88h
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: EMf2oA_grOoPqTMDabnoIpg4J-OCNdeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXzcBpkvnuyf/1
 B0IB3W7FXwHySOpwOZlYv4tS1S7t0SOfsIjnZeB329vEiU7iJbWadbPLz06IiPfLGEzovO/1xpO
 3rXYShCD7UNBN2nwEHJXmQtooetpW0IH7xgqaHa6Zrel84sLga7lvHFdwPBvZGk/wmq+qxHeein
 6vyV1dEMqmliY04KItNsqAr8+/lLytPQeDI0W5rnwyFrCFC6AFXBs/iP0VvtIirkNhB5wTXuM96
 QMHcvMJrSbJkUE07Idz8sQGuTC7OWCPvc4PEn3nB2KiPuo79IKJxCL0WOt8vVlkNwuKDy+sqp9W
 tsYpoTRv56ZmYaRpDO/RG7PYmPW4ZHS3UtM4y+tHzb6cOZQmdM5phlZ+mK2GSMrRyMmOOTSOG2R
 roHB4t813fWsENJpINU3PCfuxHw8pGoL9ScPmqbacZPoAl2q8U3Bad/wBlSr1IvNDbgXBlt+Lb2
 Eq2h2gfNC/KcbuckM6g==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f0386 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: EMf2oA_grOoPqTMDabnoIpg4J-OCNdeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,1c00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109075-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2491C5A694E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..8da494de4308 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


