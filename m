Return-Path: <linux-arm-msm+bounces-84954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E328CB470C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62A5E3059361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E8029A9C3;
	Thu, 11 Dec 2025 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9niU3wK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Odzl2ul+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73D28688D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416473; cv=none; b=UddIq2Fq6V6w14P6y3N70m7HQzEL31+zv6UTNVfCnaT70asXdN+INt1t62ljx4sz0uweCpelrlhB70Sg0dZ8Q4h2lMKtm0Me0avpPLH46aM3tW+dgirCjmKktv3UywKJz4+kuwXFJUZqnWFoo/cij87d72CtYthGBB+GW5fQStA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416473; c=relaxed/simple;
	bh=AQX5r4Dkb6D8GLP+/kU0e7WNTPWOKkov+fXVx5fjvKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mucdx4U8IOXMxo7kgtxFCLbDPMciMfqJyiFGloTOpZ/NvaCM41e9bcL8Ql52KzRIwPtw+Gd9PBFY5o57vIpdXF5mQ83XR2Ho7dcwSwRNK2J+GW4x2OCLCRZkyQdOQMsEY9yBRrntiaKAAI68SK1KKnRvaXn0Nfs38GedMTaE4Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9niU3wK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Odzl2ul+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPIjx3735627
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5ItLQTk0gDw9EYee1+ZVzr
	dhpz8hlRo4GP78zhKxzAY=; b=d9niU3wKk0roexHOuH/CttGy7+x6XD8v2NGRGZ
	044OY1PvfbQ8hQ4G7WVccP9FLxAyJ63H2BaP/OPSywOE4pEnSmCs94hks1TsVkUG
	YaoArHaJ3Wn6+prPyP+eG7Mt+cZsI7v78dnbmLQ/ed3/z9GzzzYVCXYVPyo+Y6hA
	wT/1hoHCFCzKbiV6GBHkc1pqmeQfGsf1XlvcvUg1YwBp0lgSmTSFxVbOsRBg2cmj
	T94+H7d8ZMabyVWDMYcAyQqrqzmS9g5eTNs21bHENhX+qHEjzUi+zw8GYjvtPwsH
	u7jYS2mifbxhZT3Htr0kHr2SC/09YYt7xle0sede1VgHVNVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0prnp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:27:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823f4666abso11904146d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765416470; x=1766021270; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ItLQTk0gDw9EYee1+ZVzrdhpz8hlRo4GP78zhKxzAY=;
        b=Odzl2ul+m4voIbxYIKAUXz/gHyG4Lvhpp9kc0xLQNGrNHPpdRdsLz8EH3Uw9L4GDJD
         gorCazN+Q4W6IcRaEYcmgdGCn1mrWQ9n9QdbCChl1lWfjNe6u0lu9j3l3Nfsr9MA3ngq
         8FfvheR+HH5eY2wMTBI8MMJ9J2HuDbPOoeCq3AbllX9TGWR47eUQVvBG55B+5Xvj6FW8
         Aw5OaIHDoQbRI6lED3UDREx7lhSvYJ2ybvwOIrmyA+xJeEWb4GZqjsavxhOmGAuvrw/i
         w7dnypQDaHDq5v0fMcAmO7QupHkyd1E16pPgClQewbzqcPU9V3cITtfugq9k8xr4Q8r3
         XzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416470; x=1766021270;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItLQTk0gDw9EYee1+ZVzrdhpz8hlRo4GP78zhKxzAY=;
        b=vde5i/rpM11jQEZkhZ+DOKw15w4UwNCCuqylHlkPdFyO22e/0IIOgWtytnn0DBjM2D
         xMpxOqA3pj/9C8C/F77BEFztMD/oJozIO+Qm6ddesjJTVdETCccDEEKNDxx0g0QzZGwt
         VGyzcLOkgQpldkTbLdW2v0mLR+kGS6+oNTiirSBmv1+u7qU2y1t9HyjWnCVQj79KP+9o
         onijraS3jlIQWpoB58Fo7n9J3yE4KTlZ51/LELGLjwtEMNOGFGwVz3KSfpwDW8xuWqd0
         HQJOgEG3UgESwUuzZsDPHFZWpZNTs5TSTYJi4uvSeoRlLGQ78r/xkJ79e/8J2Him/7jv
         wFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6e5uBcvpSh1w/KK86/QmMInvCTKM8DK0DsiVGIEzWPO3a/FeuuIchQForfiGbiH0oXgyyONPXhPOsxfVl@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiPO93bp47xO1ZhbKbqkcGEuznVQkhmBBBGzxi6g0pAKRUwCQ
	wOhJA6+AyYW0iviIrnieNqQtl2C8S7huSW08bEZcW9PvOyKYiFuY9WXTDxP1zH3lln4Kp6zaCeI
	JNrNctqvjtQPvKbbYGhxXVtIu6ubaJxuCZCIY6w64ZR9AFTeYdgu3UaRFooC4YgAVSkXU
X-Gm-Gg: ASbGnctVRJjIA2BjAGixCrAbOTjvdJ015z0yZQTOeuJp24s7CF5kUkxCfZqJ0RvS+3i
	/PCmqDQCXB4gMsJ77/N/VoELK2QBhbZ+bbgKX8ojUCQONkdVr/pDe0nKL15LaJM/sT/e68ze5KM
	ptMmnFbdfcqaHA/KiXwzWURPm39ecQL3WefAqG950ih+ZrYBdGwi7NcO4wIQSosk+g8RLWwcluF
	26Kj0daTDRpBdYutdGWw3lAqvhMJGTivL4/6s4W60IMWbq5S76HDssXRot9MEuieLbYGUWH98l/
	FLYdE1PDAif2YFQIMXH3uSkXRmgqgHtXN4geqDcDMgGdm3R2jqSs96Ppuccp/hdQHoHHNrclNGp
	6da3joQU/xevlL9DBze/7vfJWEWoUqhku91IQFOCYokV7TXCnMQ3TuMKyexOKKvQtCO8ophxRw3
	TLe2SLp6XNCBiiUFlMLI+vHkE=
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4f1b1a7e143mr57498401cf.41.1765416469912;
        Wed, 10 Dec 2025 17:27:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEA/g78hD2Q2/b2BnH0m06ih7BWG0ELr1vgd1an2GupS4QRK+6ketnF05bvf4WoDeBmnvV5w==
X-Received: by 2002:a05:622a:4208:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4f1b1a7e143mr57498191cf.41.1765416469489;
        Wed, 10 Dec 2025 17:27:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379c8sm384383e87.10.2025.12.10.17.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:27:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 03:27:45 +0200
Subject: [PATCH v2] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABAeOmkC/12MQQ6CMBREr0L+2k/aWipl5T0Mi0ILNBGK/UI0h
 LtbSdy4meTNZN4G5KJ3BFW2QXSrJx+mBOKUQTuYqXfobWIQTBScMYlkR3Vm2PkX9vOCnb6UyjY
 lk9pAOs3RpekQ3urEg6dniO/Dv/Jv+1Opf9XKkaOUVunGOlNocw1E+WMx9zaMY54C6n3fP6PJ3
 ZazAAAA
X-Change-ID: 20251004-sdm630-fix-gpu-f9786db8049a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AQX5r4Dkb6D8GLP+/kU0e7WNTPWOKkov+fXVx5fjvKc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6aVnDCr7bN9mVIiXDkzp5rM7FG049vUVRbL6zmVj8XoA
 9e/NL5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEwkZC/7/1DNs2Hakf1J09q1
 v6RmGIh16h3VU/scm6KedFk6aZ9Cft0TFeGSbKnyXSIVzcvSfrtJPdz2dX9bNMcW8R1eBnwGv2S
 vmr0za50ln/z3WVq7zBb+lIRnu0/PLH96kyM74UPA/0ClfJU1U2pjNFvjVDe/T/12+Zpiduftzk
 3ePN669/pLHit8szELaG7NKNp2/9Tqft9oYw0/M2vdrb/NIp8JqetzcfE3hlW6upXqGz17Xvd5A
 e/EI1d1b6bU2+1coLLnx5bs5yKrH8ycn7vr5XZNMb5dTOsPtIbcaV/FohlmFKGgnzLnRul6iT33
 FdTKnzqY2iy12Ze2PiXI1+965ecTc4yZ310P7+22+AYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Y6jov5D6HNHiombCgQG59MI0FOAtNwh_
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a1e16 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0OtPct3eviVbZUrawKUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAwOCBTYWx0ZWRfX2YAa4TnJsisL
 hVzuuDov5Lb1C4jMzRlJsCb20H4EA5p/EWEcGvmdQqlwKghFh1bJBQca9ohp1SQI7NLWooCVcUh
 7NX0hUZ9AoagKdH2idGYKboNlWhvgg0IzbnG2q8VU7AvGqh4eAVzNcrHIVp6r8V1e+sPTTD+8NE
 VRto+H5n53BcaBCZnkA9DzD6wHGIlH+bRZ1hcnIKiYGRPr4eQN9t9745gZkPfL3GozWopeY8D/J
 qo1oeV3Um/1VRhPXGKpGvsGlzWs44T2Aken+YlRI57kllJ8A5mP0/4XzT9Yo+0C8WtSrScLOvkx
 vTw4lFhl/3H8Qs4BLBGajgJSwU7fdN5gyh9UwoYs3jZvWUzEi4mm75Fd3WgKJMO/gdYMAiAH6vu
 ntbWPz2nmkJE8lPdiCxymhsSWAhWAw==
X-Proofpoint-GUID: Y6jov5D6HNHiombCgQG59MI0FOAtNwh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110008

Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
cell, although it spans two bytes (offset 5, size 7 bits). It was being
accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
core: fix bit offsets of more than one byte") the kernel didn't have
length check. After this commit nvmem core rejects QFPROM on sdm630 /
sdm660, making GPU and USB unusable on those platforms.

Set the size of the gpu_speed_bin cell to 2 bytes, fixing the parsing
error. While we are at it, update the length to 8 bits as pointed out by
Alexey Minnekhanov.

Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Update cell length to 8 bits (Alexey)
- Link to v1: https://lore.kernel.org/r/20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..b383e480a394 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -598,8 +598,8 @@ qusb2_hstx_trim: hstx-trim@240 {
 			};
 
 			gpu_speed_bin: gpu-speed-bin@41a0 {
-				reg = <0x41a2 0x1>;
-				bits = <5 7>;
+				reg = <0x41a2 0x2>;
+				bits = <5 8>;
 			};
 		};
 

---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251004-sdm630-fix-gpu-f9786db8049a

Best regards,
-- 
With best wishes
Dmitry


