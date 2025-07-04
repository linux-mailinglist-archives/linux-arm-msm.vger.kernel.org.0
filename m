Return-Path: <linux-arm-msm+bounces-63607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26FAF8836
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AB961C81A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 06:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155E5262FC1;
	Fri,  4 Jul 2025 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h26nSnF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B022620D5
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611421; cv=none; b=nnY0V8zOrvy/matRCpwBq74bmu/ewN2m8jf9uQjm/q+qUUT5zeA7EJhMbNEpiifIGK9+w7ouprpAeQbYGzAJm8TdigXRUY+sgRyow4A2+CO75JUlajR/EJgY15GlBz35NbALRV+VlmiUIo6xzjrMOkiEb2Ty1sj8zz2AS5EiiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611421; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4aNw5VZIa7/trbWlAtFekEbT1wq/Ef8hFgLjN/j86w36UwAAjV83HqkkCjI+M+INUDQyLbnrgCpTVh7feOtUn0aRxQCuIcMNJNBVvZukvlKW2vtq2eho9H5Fa3vnSWzmpnLu6ufVpmbuTvhKuhR9VT69z/jCzIiMbNg5H5TAPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h26nSnF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56441NoN024756
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 06:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=h26nSnF3Q3g+IacY
	uNOEDguBAwPTCxknylnB1foU5LxLV5TFZtyXFurVQf+FGQv1K5LnHRHCGQF0WQGy
	o9FU9CgnsBubUhCDxxyTlKFU2DMRySQnr9Ax7ii0FJtIvMZnsN9eRIBNhuoyt1U7
	lKiWvkt/yIa7WuDhlrJe4Buo0uRGdyoXJGKR6LYsfdRF7svQMv/lcbYryheIDuQ3
	S52sooHPFY5oyRncCVHGugJ/AwTyLFBfqjVMHkz6+6Y+JQONB1amPKmcHVGUIYUh
	fI5cKm2m/XTPCBg7wM9JNP8gnj7SIYBlRmAmNTvgUD07Xh9XAtNeY4aHm4rn0ekA
	GV2SOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9tt5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 06:43:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so608478a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 23:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611417; x=1752216217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=wNvN9s28kCNrn3hfXEgM0sEqK9fKIsD5xUWYaJ3miPKMl/Vyg5zRCF00WhZi5vnhQr
         kzvuTGabo+O5ZIkyvZVK+WnXpdZy6GraTvFbjedb2D0u0eobOCaCaU9qauhkFJRr5lDf
         ZiDvJBdE0MwILvU/ZqA+DG7Ex8hJ/HoNMUai0/D17HjvObxz5QaAAqFqUiYJJ5uOTBcl
         US2pyVf/Fxdvdyg8uyqFhLQ01RjjLsnt6Aw+Z6qZhf9r28OF33FWC9qOtrJinHofQEqL
         ssQZIuRnMkl7HJBxLcole8GYWe/6cqe4sh0443cQ8LJ8AQ5PX7ztuu5vTyoHMyg4kd6B
         x2Ow==
X-Gm-Message-State: AOJu0YytfWWmMeCnN3HHIg7jGp6YMGBwiOAhzk67MUKBZ+EKXQI7TPBf
	mn2jKBDKFxpuhhYZFtccyyRFjjtjdBQ9zrxkzgv/RtlskcJd8zK5MTvs+r+FUAVrd3wHxN9gGrf
	lDxSo8KrpJLutKImrAwcCUtfqzulvno2UNLDzb4bsOAOEPCFhCJfprNvMTxAs0nTOOHde
X-Gm-Gg: ASbGncti2DvHnHL9ckRVtHACm6BrcMtGSqyuIQ5u1Ub9SFQQCQTAiKW+D8QXSHyEpyO
	feHljFJ8g2y2/TDtKfm+Uf+aAy8fgM1ss0Fwn99fCCj/wcupWWZtsAA/c7uDSR8G8S70IlWRtwo
	n7KVJ1NW9i79zXuSRwiNdJkcUk20759wsSzSjz5oxeumsTngoqgMCci1ARnrr4JRuNWYNRygKIy
	RneazMWM0Qqde82jK+a3d0rrTpId85VauFgw26NFgechdCjXdK6iZNCuWeTnM0J/yJLm5nmWveQ
	R2IhAahZhD+VwqyfCDhPh3EHQzgYJB2yuuW7NaDkEK5D9PDoZpm4Q2ax1LG2spmpPMC7mVEfTqe
	tWOFwjG39vg==
X-Received: by 2002:a17:90b:4cd1:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31aac44b73cmr2387064a91.10.1751611416615;
        Thu, 03 Jul 2025 23:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoc11QV9ma5uxW2FB279y2pYSq3X2bkAUDt9BdmUrudJX4cC2ZYBnxo2xgq0gjyejcuVPGDA==
X-Received: by 2002:a17:90b:4cd1:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31aac44b73cmr2387014a91.10.1751611416179;
        Thu, 03 Jul 2025 23:43:36 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e24asm1260338a91.5.2025.07.03.23.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:43:35 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 14:43:20 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-615-v3-1-6c384e0470f2@oss.qualcomm.com>
References: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
In-Reply-To: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611410; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=qO3rspRRylitl1mLHaDZFgCCQWera3gUWAdzx6UMBGz71sNr1+/vkEah8eeHdcOmoCc1ihVNK
 cUsNJlcDjapCcWCQikvTbOrGqdSd84Hmpp8SLjVcJtFl0W5NjwA7hXN
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6867781a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: qml0S42PLAeX2Ae_K30YtbqsyViKgYiv
X-Proofpoint-GUID: qml0S42PLAeX2Ae_K30YtbqsyViKgYiv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX9ZOaiIEHTVvy
 fDa/flTV+hgapeX0ISD4oumuIQQYbCRkP84HBzKWZ7ERWYKR4uat4697hXRTSIaUcNrKHjneq0I
 bOA+LQ3NpeDMqbiB9DlJYO5gY3ztpNrKthSp9pJGSDpYhowL8ztH2HjQM9LmzsExDJOhw+2Xmo7
 2noHB8UZhNXcOLWzqxQ1bRKXpJ0A9FgSBdy3I+tCeBy4LEv7x/5sgtAYe6bn1f6BV9TDgAQ87gQ
 n9kwMfU8VkA7JR8+qIzXHsYH81yPdcK5tdaiIyNs0OFm+r1B2ak5dlB7ZX7QSEz/z/FW/X9XoZI
 tuh+N1jnNE0I631XU4rMIAZdeg7NzMQ2MrnWoPwr4YtqDXoAUtfxQnjNdXz9HQ4GUZBjFZG0fcK
 WH3QbcDXfhw3IIljw5Sckx8jbiF2ptjNeLpB3jit8wSCmbaB6/GByBnXieRv8RTDGk+WLoYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=955
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040051

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4b51cca17de5518aad4332330340a59edfdc7ec..b4fbed517cde18e088096d182fe6b482363e403d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1173,6 +1173,15 @@ opp-5000000 {
 					opp-peak-kBps = <500000 1>;
 				};
 			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1


