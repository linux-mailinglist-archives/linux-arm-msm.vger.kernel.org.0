Return-Path: <linux-arm-msm+bounces-108043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G3BAuPXCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:59:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F126561D0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C65C2303D4EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E8E3BD625;
	Sun, 17 May 2026 14:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RY9DlthW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5vlL4zW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B453BFAE1
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029796; cv=none; b=NyfJbuVJ6nUuHAT7RC1rirFBi9slaJP35g0WSkk4ny2qwnmVO2RUkEb7h/WaaeYSBGQm44aA49Vrd1tJBbLzAjiwELJ7zHD4rWYSoORWsveNNSzAbNo/dhtYcsA5dvjkHAM9n9uQZv4aZxS04SVEPASHfQP1n3KE45dYPp/uM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029796; c=relaxed/simple;
	bh=BUo1f5Hs20+LqYYQn9CEw3PFB5xz2jMfHCuyfRgmlzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ObX0sY2aqhkuQJlXIb7+dRXwZ0wv3861FBcEnclPKrcN2O//0Yx6jw+HNO7GaBMRyx8bVmInA1odkEExOYdxlHsLiJ3czU44a86RUFd2+wQGiOFaTrM5EymHZplYLdQDwH/ZKjfrYmb+ZyrmH48En0zGnZnLkfldnSRrY+whUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RY9DlthW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5vlL4zW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1haYR2531321
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79jeazY97yejuQSnm2hDKJfC8lQNW47dhRITiA6LWcs=; b=RY9DlthWAYnYdAlN
	e4fLRbi7PSyHhc/5a2FckWO5HNUJrjUEJV1VsDzIUwLh/3OhHTNMbhKaoE08hmnv
	SkyhuWjz0wDrK7xRa/BtBbyhMKk8dmMiCgpEWRB0GW1Roi1il2x8LKnMaQijsjz3
	CQS3JV009I7TTzqsl4Nv5k90Q0bJ2keNfagyNI+5MgD4F2Fi4eQ2zYAPy786mYJV
	0D0fqzDuHNBeAJ7Z+MDUFsglpZ5ndDRVfpGE4e/iKjbvs+eMp9V5wzlmbZYDO8yr
	fCP6FyI72Yrgo5Pr/xKMxdiravoF5eFgZwiDtpqbPbY6Xn9cEjz+6IGIG+VfOSfJ
	VjyqCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchwj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90d6fe98316so353591785a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029793; x=1779634593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79jeazY97yejuQSnm2hDKJfC8lQNW47dhRITiA6LWcs=;
        b=U5vlL4zWctjgNwy/EX3dlwLNqy2Iru3WNyjUAEswAPlceqPP9c0geBimsAyxme+tW4
         0ZuV+iWkXoqvB2ABmruqdsUlvoa0k++7CMVIv94rUtonxzBijvWD3F9ihtJt0dNbFZh+
         53Gh+6tp+0skNkYPSStHKZhauQOfsrqsFsj6S+Y1GiHp9/gRtkAMtPDCYvoLTZF6l8HG
         yEmDL+94OiMtm+rnhT57CB7Hz62355Ge+UROAsxrPmdptIUra1lDYwOQogahqtnMlTSo
         Pg1cM7E8Tf2bC3dg26iFGOlF9YVGhHyX84BO/cxoLdY8pNsSmhMmATLA0HbCRVuU/hCa
         zH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029793; x=1779634593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79jeazY97yejuQSnm2hDKJfC8lQNW47dhRITiA6LWcs=;
        b=iHcXzFKcjpnjCAtBR/NEdpXTH1rzwxDbyUTmnfaIUCQ11GYqUaww1NnYrcia4SlJ9/
         O63zWV9Q5Sv9xM5aMym7oxFau9AD+oEQ5UJIJ9OP0gRwqgxjYQ6ZZqlraT/+dV4vwYn7
         e+PKwCNgKayvVc0frkW2zy2bsmeiKWeuMRjK3KLiAmlEe185h1+YqBLdrrPz31G1+Sbk
         IGEZvN+tObQX+pUGMr5ecNUHTlurL5MGbl8IZUUCip9qZ1/KjATbp0vK7Ilm9PodbqA+
         aabnmAhYyE+HKp+xYE9iduBpkXA7/8ixL9MGrT6hlLB2SSId97eO7iiK2Cks2E6fGrTj
         iGZg==
X-Gm-Message-State: AOJu0YyJdW0XI7lhkZlUn9K/fiFKjR8uy94dVmi+WEGOUU2BBh28LmAX
	yKAsYWklIyDXzMlfQJCrtdlk3zmrP2izsnlKLghKx2fArEWF0nvcGbXBMGOjh1A4+X5h1DoLwtw
	u1tIsXJ+SaHRDzpkq19GUr1Bq6tlA1PH9+/6J7obLfYXTprS1SIyJm8bNSH7IN6EGnaZF
X-Gm-Gg: Acq92OENDmtx56Zs9VfXQHLQfz85Ohv8lGw/JzPboLAfvccHdHcBnqtp5+3ERjbixp2
	/gjLrGQHXJlv9IdW7TgQZCE6nPNdIAdlR8Oa9e1Y+dxkPF5zG+eNAX0oSEBblSg3eIpGj5mBG/i
	DEaxP/DNH8eDC9/M9ghkcl8VLU84Fx87QlMh0TG4NvxZn2L7BRRCJKgFxQh8U/fi9Pu6mz0IJnU
	+JSALwH875wBoxk7t9hufFejmKvoV2UmHt2JZE4/VwOR2onLMMgY60mlPOyGDbvfD8gKh3y+TYt
	0KBvKHjbI1FvmLHvfXVBiyQ3MpevaMrPbygoOEJtkU/TJCpnjpbLpXpcN50v0j7jIanoKiRG4sH
	qPxoO5iOI9lIBZGwBfWXACcJjYzGFf7poIdDcfa42xFIm5YX38JWfDHcbySOMQuqZKRUqimy6tx
	nDvHi7qQgWNN6hILTXhh7WtBfVko7l9mX+FSw=
X-Received: by 2002:a05:620a:4713:b0:910:5c81:7cb3 with SMTP id af79cd13be357-911ce81230cmr1856711085a.31.1779029793154;
        Sun, 17 May 2026 07:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:910:5c81:7cb3 with SMTP id af79cd13be357-911ce81230cmr1856707485a.31.1779029792561;
        Sun, 17 May 2026 07:56:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:13 +0300
Subject: [PATCH 7/7] ARM: dts: qcom: sdx55: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BUo1f5Hs20+LqYYQn9CEw3PFB5xz2jMfHCuyfRgmlzA=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGoJ1w3IBUjgC3WTwLRuVU0f7wJW+hTB33sG07MKcQPE09jG8
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqCdcNAAoJEIs8ij4CKSjVttoIAJPX
 2c7C9J6du2QyqO+hNh1b0PiF4FVpujh6tsOCfh5Xxe+ovuTF+pGUQvpwGy1rc7rz9QfQj7qlSDC
 NiBIYAx0qJk7RKXolhw5ZObodhtEE1LTx+7hIo9qWGkJJEMh8p9MZwWJRkTgg0teVgJz60syEx9
 MMzev4buOtfq+RUTTspXs4U6KzZCDdfV1hQh6JctyAX1P/FZyxuqLo55kCwkCmLiMzRJZy8qjZa
 QUYWcSQAQdwk87xd3g5hqsaC8gTT1nLkpuBSpyzpppvqBpRBdFywYfaMkNzwxy8ENpkbohzYiKv
 GhZzwrsnNqXU44zFrm+MVaCBfnuMIEmzgi857vE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Q2ZbSU_mHAzeYIjg2UDAj2O9UzKAG7L3
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a09d722 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8sTZkXN-kXGHD58140cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Q2ZbSU_mHAzeYIjg2UDAj2O9UzKAG7L3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfXy/sMA/1tH5zP
 hbhU6QE6PAkMylinW9tLhWgHJyAiR6cSsZ+z3L8OZ1YAk3bgAoLiksgqD/pkkw4yTGM49LCdWoc
 oZ1V1vKyunbAOD93qMjbSr5KoxjYFv7imvrdsIY79c7EUSm6Q3tb77MBoRjNHkdXjnVj8KDM1G5
 q9EX8wDq9Q7dNcXitDsODw3CqIsdEZ/xN+3WtwmHmHZZZiwSPzX+TwKq4Ssv0+Z/km2T7BiPmoR
 cqc1OPxLPhflv7si6kht/5M4mYOKqjoKlxAPcme2+xme020cRte7MG5xBfGzOrUxI0lrW8VHuR1
 9c2AdggjkauBjpMiiFHtZS+3IAbQtprLS6jlVJVMCs32DLJpnCdNNASWXIw54nh3AJ40HX+crRe
 QhKvH5uEtVbH9TeyW271oquVPjCjEUrIr0sy8xr6ZDucLNbboxEp+NmVyfXiCT3nDKaSLKoZvA9
 R6ABt1PCn7mVPalXS6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170161
X-Rspamd-Queue-Id: 8F126561D0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108043-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts             | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                | 3 +++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 082f7ed1a01f..d23b8ec08af4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -237,8 +237,6 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
index e336a15b45c4..1e80ddad591e 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
@@ -237,8 +237,6 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 05b79281df57..e9982c46bc2f 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -510,6 +510,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			status = "disabled";
 		};
 

-- 
2.47.3


