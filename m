Return-Path: <linux-arm-msm+bounces-109085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPxHGecLD2omEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:43:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E775A6208
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B8FD30FCAFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A506B3FE65F;
	Thu, 21 May 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQLFx1+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYOv2BXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1793DC4A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368879; cv=none; b=fc9f4q5AXifu2k76v3YE/IE7o1Q+6AQAs4snkWySbax/H2evIdCS6DTSgX4aILQwlBUBGGhKrtiBw/iv+yUi1XI8QUQPdZOWlFMH6gbh6xrmVcSEBmUfBPtSnD//GoYsTC/9m+0dx/z84XRruQfcgxe/cJto+Otxu8GxxSA2Yzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368879; c=relaxed/simple;
	bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9bwI+e9SWjEZTywTBKmoausYXTQdy1gFyzW/1y39VXvkoUGBtmshBdCqgdj8vhHztrFpcUnxv0gaiaBs5YlPDH4+XxAwGYm2lL/aPVUxFn0GAV+60QBDtEWHvLHKNEvxY6TF2N5CQjll7Rzsqcw1SeV4sYyfzYc9+8lCfXe9Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQLFx1+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYOv2BXX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99u8K3772801
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=; b=nQLFx1+Hm7HrV9wF
	lZIILec6/6jwRipQFxetXMBXQcPy+Vtpj2VUrtBcLxSBduyApSqLCvX3QsT+2x3q
	ykLIiOx3q5Yf0tDUu4VrcSDD0TUufkFVzvAVmQuhC1jlokbXS2dUr5FWQwYlxgGX
	PSMFSVH0EArSLACNRS1w3iRuK0wQqXh6tl4m3Edgb2Nd4++TEs6G46KDupPrqmQw
	V30PUhT1F5YtCKg4Yc18+D12WRxhi5UGQyTwblMt8C4dL+nUDZRJHmKDmyTaZ3GH
	stTAj5TInFlFGoH613GrupOnZTFxNCc52xsZC14l4yJAZwId6LqCUSYK4/jF3uY6
	fwB7cQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43ajw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so4778344a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368877; x=1779973677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=PYOv2BXXHd/ioAlnyXNrJSZ9TvFJf6jPfA/pAZOWjE96mXkVYrSOzPznS3O6639cK/
         yoV8BWgpaDtrIJHq6yStWLBvg+rpjf3dw0yntYYjVOrGWZ4XMdW+k7CiCsC4HH3zhGS7
         5bt+6xyW8rr+wbkHxX0JDFUIZKEXWhvs5079Acq+iKynx2I4/edcc20esYyAIFblxiNI
         yzBVLx3/K0bCStu8DAhZNRlk/VQ/5J4ZYHjr/6DrR1JI3e/IyeIEajxodwOtS3tkEGdi
         ClZRhNlypFQS/dtNNVnvtj+1UXzParcXa9sZdVfndrj31oDlsFCewlWL3vbs1ZV+BagF
         0wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368877; x=1779973677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=c+Xwa4jnTRFmIsWo+m9V1qVQ2A9JpZgZHbcY427lO/iKpE0iHDupB4CazMjXEvgzos
         rFAihqUdtfyFc16HJJiu8oS2ZKjH9EhkBvkvi0oWwSq1IX1SotcnpVtw1cDZK0T+T8mx
         k/F9tE2m1pChped9P3O6jxbJz8XzN6x/luDZsgmt2CwvpwmF0BNJGRgtV1BtfXpSvGd9
         ZaQt5bmoGmcfUFOTrJ3B5Gz0eqpDqo5v5jeIlRSDDss/GNQ0f8iKoO/Z0S9Ha/PZ/DjZ
         ChdgJ7DutXsjGKmt59eqfJJwoNK7mHp5hWp6iM7l9qRBzEnxuY15wP25dBFTg9+ERQ51
         UMqQ==
X-Gm-Message-State: AOJu0YwJtPFlud6/BCVM/y60aIzpruWR7ax3g3Ey8pqMV/N5nYOh4TYz
	tOvzCHos/j6XWkj4yjHhK+MzqKw7CtlQERG3stKlPpK83J3UflpQKoYRDHigwuBC/YV+Csu8+RA
	VHMc/rV6LppTHZlDrteYQcqP9c7vKV18lRky6fbxcuvTMkvmo4OjJJEU/agoG3Y7zOxJp
X-Gm-Gg: Acq92OFpZj1eOZv16pm5P+YI3xIt1+PcFEm8rJRpdQPO6gMLHy8KAdElEIyARn5jgCn
	cQJGIeGizz3hXhslCyDedgqBMFaIXOAo1knw6YlqHDkZw6PbO9wYhfccDG6w4pfs6Xh+fSJdsUf
	3ZpXOYqqYYEjppNdtqGj8Lv5hlxgHWObSTgBvBxSUZ4Yc2CgtkxahLXHzCq+0wTDfuIhJXhzc25
	tV+KG0wbJlXdYyN10HOssQnrB9KrzfdhBWTkRCOjTziRs1CWth8tmuRxXEv8QNRpoKv9nESZIUa
	l8FOQAD9UbdetDtc6k58q90q7T+us5Ckw6skQrSYrPMyi4pN8tkcLffKy4UuQIIlLDkVaHN/Qaw
	B+5wGzqYZ+TvacvzoM+kSUlkD/wmGSbz8dxda+iXJ4mlxBq+6mAqFj0vT/QVlr8vL4nA=
X-Received: by 2002:a05:6a21:99a6:b0:39b:81bf:15ed with SMTP id adf61e73a8af0-3b308a6cbd0mr3562204637.52.1779368877085;
        Thu, 21 May 2026 06:07:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:99a6:b0:39b:81bf:15ed with SMTP id adf61e73a8af0-3b308a6cbd0mr3562152637.52.1779368876607;
        Thu, 21 May 2026 06:07:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:48 +0530
Subject: [PATCH 15/18] arm64: dts: qcom: lemans: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-15-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
 b=knoOpCsf49kmUH3hTgxhiexRNRA71Y6sVLZcSL3HolMhV0FzXx5jKk963w1jYKZxa7i0jxNqr
 66OYugdZE+oDdGnqU3ECm/wdBc+1ly4j2JKqZ04AXXJxYmNrjW+0jMc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f03ad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: PZvDCe2Ni1r7qS1aXsPQmkQGLzusQhkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXwZC1c2JGKyfW
 1J1CyguIE/imeBnatT70m2IwBXILxbZfPu3fvRV9a0Obdfa0uXV31OrhfUNNoTVXvuF2rysmtT+
 yZsXbpd0Elzyt27jeL62wiFhpVuGmTzb7OdB+eFfyIIsLbghiAhAw6rVmAPvJmwYkJJldzyBo09
 Lgo5OFZLDTIr4EPdJbTXpjbsTLUlFaeRxcILXqJbmBLiO59liNmw9Y/MoIyepHBbSBCjI0ygIcr
 Kr5jjpuSkeR/Wxp7n99+qVcsWtCKTIftOmpWnCQ+Xd1LRmEeEITkKyZjeFP0PvhRPXFnjjaALUm
 /aGWEcebt5+soRrX6I0LIcaOLL3agwA5ZYU6naSp7zrjkz6QMGPWb7HA3IonAmxfjLhGj23tBSJ
 zX+CP0GVNdAqmTeWmogdhGHewCSQd66rdt2BBd0gw+osMSG97NbvSOlDt5Ykfk7Rr7U120J232n
 6HhNX0Gg7/m5zp+TLzg==
X-Proofpoint-ORIG-GUID: PZvDCe2Ni1r7qS1aXsPQmkQGLzusQhkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109085-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 67E775A6208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..fe9a2cd325d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -703,7 +703,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -720,7 +720,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 31bd00546d55..3a6d73b485a9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -854,7 +854,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -864,7 +864,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


