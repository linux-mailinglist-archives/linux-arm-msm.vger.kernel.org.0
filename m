Return-Path: <linux-arm-msm+bounces-77661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5473EBE62C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 04:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A62B5E3047
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 02:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178BD248F40;
	Fri, 17 Oct 2025 02:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9jpmoHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9531F4C90
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 02:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760669861; cv=none; b=WyVm6F26f06M3MJAM4ngOKuIpGQUwTGDzoDNfvw8x3rHK98rHBy8DB4xLzYPyoHE81W/MubVxN64L2Z8bGLgEslcDK7v6lnZEMBDrW+zq2YElUS6D4mE1uNv/yLcaYwTMANF0ePkHYvB2eBfq5Hz8lqab8cWeq1o+w3tGeou6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760669861; c=relaxed/simple;
	bh=gioq/rreKsGDw5vfDqbUkugeReFdMaJ2zGZblUhmCHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=drCqtsUumq+pLn3b/6bVFxnRp/FGQEFZA7XwgT6Eg122rRpdlGO0j9Q9Yyg5W4UQkrN6YiTRM4UhlUPAYghUOesgSdPzo7MS3ID/bDmqL2nooeUg79qwjlTxrvJn3GCTkqVUqyMpSykmGcXe0sg9Ow36iLW9mpzebZq0Aj4QHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9jpmoHV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLb71016981
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 02:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=57abpEGp4rsrQeIj4jVZ6x
	t60b5upYPpH7ku0EvaTMU=; b=V9jpmoHVINxLFqxQwQani2hrxktiCSihFRSNU7
	RWIF7dvihcOzpJDqEKTuke83w0PV139XoMxeyG2CkCT0yPQjWXHZOx/Ax6NsvHcU
	v09kMMfH+MG2xfj+a9EWQAUNWm7yBQs7Frs+g1w6sDDpfk/LoOygb19P3oFumE8c
	WzyaLeAYlbWQl/FDTwNCTCEGXtODopNEcOviFD1pfkKHSkngcaHhZSVEQ0aEaugs
	15RCW/ZRHh4P0vS0NUiNsELuBgmHZLObjHu6JkvhctLRREdoF7MbVr4AdzIRQtAh
	ZUsXSK344DtMaKHe8HA+TanqUDvV0EnUAcYCDk6CKdx6rgVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5ts9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 02:57:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27356178876so10375115ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 19:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760669857; x=1761274657;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57abpEGp4rsrQeIj4jVZ6xt60b5upYPpH7ku0EvaTMU=;
        b=SOSGr+cYm8oHiIErPKNIw3yzHn1EWlCpwT6h+Bno21gWt/VBWtivnMtjvm0b6q8im8
         ozQxY6VDYGCkWlIyyghWhPfoUW2VF5G3arr5C8GrIAUuVZjzuwyn9w/fA2vhhZu4RbmL
         Qmb38D+WetXmXmSo4EMGY/4LeP+wd23bxHHDvWDIPwxmPwvygBlD2QkwPcIbw2hNd9ZJ
         +7yyM4Y6ZBWoIOa0awsWp7u/JsTiQPUzJad2WLAB8EuiZp/mGzj6UZ6KJ6Z48FdifsP0
         d7KOEoSN2ZmJ2IthlPOtikGkCuvJOiKGNSSwgynrcTYSC2mwK3Hx9/NXfGWOfDpjpiUd
         t6RA==
X-Gm-Message-State: AOJu0YzOUR5ke8ArY9QfdU37rERsiimsygqfhuYlPRn535/JzxYtneWE
	2RUoMcqnQT1TUvtzY2bh9PK7KCMJLcwvGbG2frcprhg8yo6LUk9idsSMDamLeR37t+4PsmJ2qn0
	++oa1XzqrkwJ7eJoHUB6E3cd9rOzSpLtSxnc6d5cwEPnSXL40EDDIYiF9DHM1ZxU5pTzh
X-Gm-Gg: ASbGncuc7Xi4tZG86bQzR7q+FkSlprDSKoPgO9yeH6aBoj3XIbsmZwER9O0/6yIZ6ct
	dxVmS/k+dYweldTjFkGAoDY2tQ/pQSgvTPiLo0Ao4XUyZMBqoPghPzONaIpbhQ8ohZm3sxqdEEC
	QUjfuxnFXtFSxYrJARgtZtVLOALyT1dLlX5uHZjvZ5F8FkE9d6uKxK0Cd+Tg/ElnMtjFXmhdFRQ
	Gs63ueefHi01H7dZNJ4RX06VmFsOxVwP5BuiMZwDjLpoqO+wWe/Y9rzfqipZUjmbDtZQpev/+34
	LwDZKH+pYwdWZAl1H86Jnph5CTzWY43znWQnk5RBM7QY2g8oHbbwW5x1u9jDtmXX9nQizFg0sHP
	LplLOYBv843OJqOf5x303iTNCPyv8uw2L
X-Received: by 2002:a17:903:2381:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290cba4ec0fmr21840585ad.38.1760669856953;
        Thu, 16 Oct 2025 19:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELK2esVZmsxe/N1H+g8EIuqchXgfN9778wy2RK38ItUmSSRhLSEWyy7a2rG4oRlKwmCzAxvw==
X-Received: by 2002:a17:903:2381:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290cba4ec0fmr21840305ad.38.1760669856521;
        Thu, 16 Oct 2025 19:57:36 -0700 (PDT)
Received: from cbsp-sz01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aab735sm46210205ad.77.2025.10.16.19.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 19:57:36 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:56:55 +0800
Subject: [PATCH v2] arm64: dts: qcom: lemans-pmics: enable rtc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHew8WgC/22OQQqDMBBFryKz7oiJxraueo/iIsaxBtTUJIpFv
 HujdlkGBt7A+39WcGQ1OSiiFSzN2mkzBOCXCFQrhxehrgMDT7hI7jxDWddovcLGWOyol4NDRXW
 VUp4mKlMQxLelRi9H6LM82dI4hWx/HqGSjlCZvte+iAZaPO75LGECdqHVzhv7OZ6a2WH8+sW//
 plhmGujRJ4Jpm7ZwzgXj5Ps9oo4LCi3bfsCg+yU9ewAAAA=
X-Change-ID: 20250924-add-rtc-for-lemans-cedb3e630c4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760669852; l=1407;
 i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=gioq/rreKsGDw5vfDqbUkugeReFdMaJ2zGZblUhmCHs=;
 b=/ZpZMF7MoNslhltzpF5KZd0zv47Udhhxy/1OZFBwpXoCecTqHjUaiy0ucmwy4uy/LbYQjpnRZ
 Lywv0SHagvtC5Ggrxe3HQYZlUaxxnKUyhqgGomYm7QK8sZRht72mWl7
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-Proofpoint-GUID: xqNucODK26I6z4xbKgDZ8wFFbIq8ZkaO
X-Proofpoint-ORIG-GUID: xqNucODK26I6z4xbKgDZ8wFFbIq8ZkaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX0gx2N9xaRk2D
 FvA55RevsekNnwN2Bok+HvPMbZ6YyHBKBWc4EHVXYRMo4cs7bu/lS2QTeRPyHN3G5Y7xnDjoXbz
 LdrcvDiM5PyE2GCc+XONch5j1Vo/riAEwaXRy9OXa1L4JNETayT9xn8hLlmc7iRmAouURcyi0Uj
 eDcJyOo5mDpb3us+Cn4tiGHXZ+koh0H/W/Sb4bcO50OZu/zbsBDFqV8A6dwA5/nw43XrtEGeZG2
 Wki5aUTZFLvwr/tzdkJWLfx00OSsPC/EoD5mYqSNWGwSs+KZ4u5BlNOI/ku3qDoMg3IC/6nQdkj
 /eNEM2isLgcg87zcOjmuHJ6h4eh93PZpWVwlnQfkIVLdB1B8D1vmx2SwLojDjtNKq16MOKpESQz
 z+rA72WPt2HixMJRYQpnvJGt10fXmw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f1b0a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H458QRQcw-P0b_fo_9kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Add RTC node, the RTC is controlled by PMIC device via spmi bus.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
Changes in v2:
- Rebased on tag: next-20251015. 
- Changed the subject from "lemans: pmic" to "lemans-pmics".
- Separated each reg and reg-names pair onto individual lines.
- Link to v1: https://lore.kernel.org/r/20250925-add-rtc-for-lemans-v1-1-17fc56451c84@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..341119fc824406a5f45cfb3f809a07b95f71e0bc 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -132,6 +132,15 @@ pmm8654au_0_pon_resin: resin {
 			};
 		};
 
+		pmm8654au_0_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>,
+			      <0x6200>;
+			reg-names = "rtc",
+				    "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

---
base-commit: 2ec29dae47ca4388367474080fc48cd0cb7a4d8a
change-id: 20250924-add-rtc-for-lemans-cedb3e630c4c

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>


