Return-Path: <linux-arm-msm+bounces-88836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D726ED1A5FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E428305222E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FB03148B2;
	Tue, 13 Jan 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9Q4NCOS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoeRFzNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EC42F5A3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322527; cv=none; b=u98wD967qH0s6dS9VfME8+ee9s/tb4mtelf/qUwTpcA6xQbuUWDyMoOUUd9SPJDDr4aq2eGXY86664rejReLlrAvXR7aP+hUvJ26mfADqc4U/pvkHNRhIg1c0fdcNY2FdVwb7i+wcp+x8troC1nUA7G5Tbmu//pswmc2kYx4xbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322527; c=relaxed/simple;
	bh=ywbYf8FpXZsSTvjHvak3d1a6oaK/ZzP1fkPgmQF4ut0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CTJZUvYDDPPI//Z8tEiG+vtkaARPaLt4BsLoq+tw3x97vBBcpWBTq1gLX3VK/oy3vUBHCh8Wli+w9yBe6asBHBs93Oai0+VdACh79wnzbL14rFh852vDuGor3EsSYne1pd+z4ZhGKy3ZfyckldbyeHf95D1WFZ0RTehajF1LdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9Q4NCOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoeRFzNX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsStv2071209
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7LX7ASpW6leCuOxrRq8giJ
	H0WRmRK7eH7bwiYJmlR1U=; b=C9Q4NCOSbaiBSP9ELx1mnGgcsvVmef73HQrmNV
	asaSXMmQer1VlhvfJ1muV9KOOpfrU05/MLtwxclziOZ2Ex5decoYUEmY1/fDBtqy
	EsOevC3eOGyfNbcQ6NE3WTiE9Do43SJrY24JqHhKTmlJR1f+7aViKFD8KEti80ne
	hAvyVgpS59U4FgCN99Q2dk/WIZcMz8wpqXcpmGVPDc762n1G08zS2asp0pUelBk8
	oKsIaOGywjUAcHwCebqSPb2TDuunRIgzvPnX7mQyLO03Y5xI/RcZDH5uRqjU7zAr
	GlBmQXA+BKLGh3K/xkIyawbmV+zrt43fOXe3p+fmBFZiYSNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8krm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:42:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so1968506785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768322524; x=1768927324; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LX7ASpW6leCuOxrRq8giJH0WRmRK7eH7bwiYJmlR1U=;
        b=QoeRFzNX9FSrPiRYJ2BPBiHdBvjODnOFLXrhfpWP2juRnh3/esWAuBVJYKjnxOe/1v
         eOF0Q1PvK90v7GKXq0BCjmelfUVQMcX1TIXefNcf0b4Tw6q+X5uHWqpa5BV4/OiFejSo
         OTMExr1ibK5z1IZNd4/kzCZK42w91N5nozG8r4UwKZ5kB8kqMRoFc3Rr4Q8BVsM9cslZ
         qSQU5gcGZYu0C7U0ftpSNDjs4eVo6o5H/5/STw232+uaONSamErSypf53zWDGyV4Jlra
         drk6ehtMuh4yPG+WWIc/PjKSKPm5v6jRL+zZKBoHENyGhcGLPTCJ7gO4YzggqhT1Hygp
         CjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322524; x=1768927324;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LX7ASpW6leCuOxrRq8giJH0WRmRK7eH7bwiYJmlR1U=;
        b=jlq5QIYaepxCwMb2XTv9/KMhKqWHrwcli3xkYDb4QY4uzYUxGT36+GZgS+iTD7BLPX
         6bkUyFHq+F9rd1UWtXo1/+BP3Y5DUk78zxR/Qtb7BUviwg96rc6BITLpMI7acBsbroPZ
         3TPxvrIPZjLL834k34HESAh6d+xDE/GBWJQaViaoUmFO9sUxpKXzn7ymJ5yFk+T0MgUR
         IPRaoBj1cYTtbSiyPTprqLjxPSJLuaKKjh2AEGjRa4o/SCi4ygz8UxoI/jzOCVncMir0
         tjVKgctRObQxJC6imeiMayX2qUII5lU/X7LAgqf1QjXn2x+aD86OoH7sHL0RLoZRaR7E
         7hYg==
X-Gm-Message-State: AOJu0Yw8+mmiCtHAHwhks1mQpsDX9rxF8jt/ji6jYtUhwZrrqI8CDnc2
	f8JAlYz2CDJRA25fOMrT0Uhb+wlCZlYNxbd5B90jeS4rkQquQrswh+gZLyinaCxLvKFkx/DbYFd
	JcjUxmi8kXCI+MBXrFW6MRUJGswXcRrLoxAQUcO3TGywHuJ0ATlZqu2/NHYeVAzjGOQaJ
X-Gm-Gg: AY/fxX6/jXpl+N1ZKt9COa5o/ccwB549t9yqhVlK4X1P0+Cr6JJNOk0FCi45xmdA0a1
	yTVggk/DYJCES2iIxZirwTKPSrLjIoj+p5S8S6/BXY/aF8efjdiZu3p8b2IM7UjNW80UjVvPNZf
	/7/6T374MLEcGgR8zV9DlUVZZrn543xsfhzpuO8PlgRkTApmdzDkmiZXxs6nTvkhNEBCn5hNjJ4
	pfh6TNh0lQ7u75uQPRYNj59Gk/VkFM6bc+ckF8+kWgF4ZoSHEAD4uQMCYLffTwOmQqDwA/Nu52R
	mhossS4MkSEWe7PGI04FGo+b+sX2bpreZjEhIrB8HTOCxC6cADHRCHUSIQhui1Nv7ntVAbBedkB
	MDIS07yl0zUbUUJhFu29/RaMK7rpYd9sdPCf/rGuLL6nGKt5n2u52C9EoozAJvF3qoi9eEvSJUI
	5QssYoNMmvA/C8pgSPnV63Fxg=
X-Received: by 2002:a05:620a:198d:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8c3893a9c5bmr3118492885a.40.1768322524567;
        Tue, 13 Jan 2026 08:42:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0af992hx5wBmcZk2Mln82jUPjel4zIx/9ZH4sZhi362Xd3XTINmL4wPa6lfOuekAjR4sQiQ==
X-Received: by 2002:a05:620a:198d:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8c3893a9c5bmr3118488585a.40.1768322524010;
        Tue, 13 Jan 2026 08:42:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6b606408sm5367378e87.11.2026.01.13.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:42:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:41:59 +0200
Subject: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANZ1ZmkC/3WMQQqDMBBFryKzbiQTpdCueo/iIkknOlCNzURpE
 e/e1H03H96H9zYQSkwC12qDRCsLx6mAOVXgBzv1pPhRGIw2Z43YKNvbnFkFKznNXlETqHVkjWs
 NFGlOFPh9BO9d4YElx/Q5+iv+3r+pFRUqMqgvugnBO7xFkfq12KeP41iXgW7f9y/jA8guswAAA
 A==
X-Change-ID: 20260113-agatti-fastrpc-e3fe4bea2b42
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ywbYf8FpXZsSTvjHvak3d1a6oaK/ZzP1fkPgmQF4ut0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnXasjfFMOUxo4BUyovCwXift+ztZBiq7CaMP
 MB+HWymfhqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ12gAKCRCLPIo+Aiko
 1WzUCACIatwtBJKHxHAh7M5OkyZotIE+z59tXnCapkrr9lkbvtbO9ZQPTXeXidJylf4IUGIv5wY
 NmUTeWsCRjQQ0Zmn7oX0tymen8j+EfoDvHYsAhLW7eYd94Xpu4K5DJX6EtLk1c/naQjBLfEhl0N
 /2qe0lJ7HK6s8BBxmpdn51EbymSqD97U64yoetttsddGz0y60z+T8h/e8GVzxeB5Ipy0QLcAmGg
 QcsaOOW7XHxWxIJGQpS1+gBq93Z1PLUnv+A6BHN0fHt021RzS92ES1WI6B4vYBb6DP0KqLPrCSw
 AqYclb06Osfo7UdM3mfSB84f9iChX6Ohu989wa6cWI1nioxb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4fqwwrIy9gFEICFVGiaa_3YbAK7NNmUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzOSBTYWx0ZWRfX1EnEhna4E/0g
 5v4P2FSn/T0RMmDqE8IqUN/6yjCObl9aXasvfci1uZ3N5291MjiHEBEqwwPvWUH2PhqCwAEH1EB
 G9Tuw91NjvAvwp/iADkxljnPyQGytVAglyUNyVtv4kdz4wm7KWhWyrGwbqUKh69DC60TvDb5dQ7
 KOEnkZDpu2QtJ17zpEmOtSdnfyQNCiXN6sNH3GR6N3E6VFeNvWnV8OW1756OOr3z39vsjwchaIN
 Osquhjw2z5JpQpO0QEvY1ORMpFzaiUPCNjXHBtsqOq0pA2+K+aCdpY6Fue38SYQhdcqcT7aoRsK
 TuA/zP7w0dw7AGvqgdz0HbLU2LRzxVWmVMq5xcJVH+2O1qAl5Cug2VN1JEkkITTnajsX8pUDN5b
 7yP/DCMYXUOIKgb0jYICz1Soc/F7v1r7d0xY4sB7eHYNdxmfKP9ut4D5n3X8ia+7XUZX/ENutqz
 j8dju1CH8FTuMSTvlAg==
X-Proofpoint-ORIG-GUID: 4fqwwrIy9gFEICFVGiaa_3YbAK7NNmUD
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=696675dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qnRtB28rPDfBZ8ych9EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130139

On Agatti platform the ADSP provides FastRPC support. Add corresponding
device node, in order to be able to utilize the DSP offload from the
Linux side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Add more FastRPC context banks (6, 7)
- Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 7815ece261ea..217d465df846 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2287,6 +2287,47 @@ q6routing: routing {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1c3 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1c4 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1c5 0x0>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1c6 0x0>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1c7 0x0>;
+					};
+				};
 			};
 		};
 

---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260113-agatti-fastrpc-e3fe4bea2b42

Best regards,
-- 
With best wishes
Dmitry


