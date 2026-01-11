Return-Path: <linux-arm-msm+bounces-88395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D136D0F5E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF1B530C6675
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7B534D92B;
	Sun, 11 Jan 2026 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJH0Besw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foBpzEFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555634D3A8
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146579; cv=none; b=f/vNX5NjZglu/fvXxGgA7gJsFNAkE0vNs8DS5tWPg7yVfH8er+jHvUvw7Lin6YSMWC3ABehpIRTNRHlS9GckboCfkSULtwKQV07mORZQ2VX0K7CiM3jmDzxo9/KkhIXSI2bg5GPWiPMUnmV1HsbjC8yIsqxz1IkSsLzaiANbt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146579; c=relaxed/simple;
	bh=l5WGbsKtHf21iM8+oa+/d0NWfC+n/Ku6l80th50BuO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uE32HmqsQb9874PWpx7RYMkSRCVvd42Vm6lDAwsDzx6qotLXMroMJkWk/QYhKGMJVl5lPZTk6aiOn0D+gxJwIWNW5JvktmJ1AjSk2S66HNCEJgDKhUyTVYseFdycP1uwTgacSgewKzJ+WiOiGKkbdxJyXiJkqxV6uIJ23Rh3c9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJH0Besw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foBpzEFK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BELVMb276397
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZtPShKRE9enhUtv32089Qv8Wp0CT+GiWyKxZmRT51Q=; b=SJH0BeswxXcqC4/t
	QeTV/xOR556YcZzCV7sAVhibLT5c/JGoKt/jMziNb+QwQ627L1H5spkkYLc/nif7
	RowCZq28YK/kHdxqM1XsUlWtPiKkveDB0+j9+fifi37hSgD7sVOq3McT6zc5FM/Q
	SU7+1kW22V7myK5QpGFtb+kwV1x41dM0Vzpw3sHKZzZWML1uyJZu4wWswloaT0rd
	sMgWhHUvFJ1mmEi78lkHU1JA8d5JvEicsLIDMQECTEPm7ETPZETsT1zugSiTzKa/
	zY3jaHrVc8WsB/YWK6bfv9GqSOYOaFyIlrffQ6cBgFIbLBZErHVPzYvvwEPFcyW2
	XsRx6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxftb75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so53261285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146573; x=1768751373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZtPShKRE9enhUtv32089Qv8Wp0CT+GiWyKxZmRT51Q=;
        b=foBpzEFK/HhBNmOTu3iiVNFmcFCBeYTOp4bPDDLPhxT3yTV+gz7kQu5Gkw9FG4DSKB
         snyH+I70Wy8ryUCzNTnuVuVlD0tII+zw398g/HtNIKJqiRI2DHf+GltLZC/p5OMCsJwd
         YQTJLZMojUIlAIslFQqJDVUvq3lrUAU+82rtPawkaR/WkSAnbRdWXhXKi+ADxemvQJlF
         IJw0DilF4DdtNLT8KqsUhojxbqa9j94cMJSCtgrarOEIB1/O27MbgmTHe+y6GUxjpEyv
         0iyCp8AOCmpobm57HIQb8lBEzJHqsRRbo12yiiNSmxsO0o+AovlVB2wIsVs+g3l8I/XL
         NVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146573; x=1768751373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gZtPShKRE9enhUtv32089Qv8Wp0CT+GiWyKxZmRT51Q=;
        b=RY23sBWJxIJECxqd1npVsAtvlk8QUTKu4XFpUfzkCan0oNEuZ07f5RvtsgBOIx+mxc
         MujqCJhN6bwn3J6jn7bQRCoWZyscqY9klmdFUIhkG/XPnbCpFBLV53o2xjMuRtFp7u6y
         MqDoElqe5LwrFjpJU1ScBPquf3ixW8/3nWAxjjzKFgrls+1QM3ql15llocf7sZqcT3n4
         FJX2I3tqnYE8qoKH6nBcrrnu00kyf6ABwEH0tPE7S3JBjqhV222cuSx1JfDfJPxxJO6c
         8SS8OY8iZGAeGotJWek+pa6wm3k0gL1uCL76xpBtr45X5xmNKFEMC6deMCh/9pOzDUtO
         swoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2NrxB8AS/GTIhZpLufhj4lmUM/qfDIKSLoG+iOJn56aOglg1uOaqybYHuCKf7eEVrg0TpQgzHzJbKnrfp@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEWJtrbe9KDCvGJB3YTYMycgl+7Phl7BsatTfUzL4mv2VNNgF
	xhrpYe/MR4qqIAOhewQuJ8rnVZpQrXi9/Yxrlac21q69SUdaRR+BU5ZT9gXKdeVh0STzlxfBWVN
	EU8VGL0+lNbRlZPBHlkeds8x6YziJBZbDmg1dcfWJjcgjwZbdMOOS82evocUG7jpTicGP
X-Gm-Gg: AY/fxX7YPpDWhYomYGUx2Pt6xfedll8PW5xF4b8uCzUBQheXUldipvLM1AAXX89Yj/0
	ZrH0K/gySJj1/PX0UiP1osXB9NV4vpyGDz1j+cT+DyACd1PiLDA45d2x1XnqFklE+Z1M8DzRB0Y
	kQu8sHoC4LGR4ySnzxb85OTYpdDFt1mK1Wv8jIsViMVg7LaNafO6K8QD3AeyiBcMZ2ROpMAwqIC
	XHfR9xZMcaRozm4dSY33ECErqdGrwg/42EznrJiCKyvtjBnkfhqJyShhBmn+GImyBATG6omcoT/
	atsURLvHH12MaFlrLgJfOzCEEeg8i5ESc1gQhy0K6fysUMbFkLDdCYkn/jUSm1Z6ZxKQ3fmc38m
	kEqFFEsFyt99c090yksECCX88ryJPf2hWtw==
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c38939d0b3mr2136207585a.33.1768146573188;
        Sun, 11 Jan 2026 07:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdlGwHD8RfMIrHaM7sOEs5CkAYGlIv9wW4nAoUizzkw4tro3xE3qCGCiOZQe5YdwWj+mrCCg==
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c38939d0b3mr2136204085a.33.1768146572674;
        Sun, 11 Jan 2026 07:49:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1637163166b.57.2026.01.11.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:49:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:49:06 +0100
Subject: [PATCH RESEND v3 09/11] dt-bindings: bluetooth: qcom,wcn6855-bt:
 Deprecate old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-dt-bindings-qcom-bluetooth-v3-9-95e286de1da1@oss.qualcomm.com>
References: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
In-Reply-To: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l5WGbsKtHf21iM8+oa+/d0NWfC+n/Ku6l80th50BuO8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGljxnqiQTd84H5uFD4hU5ZkjFFkYe6NOnFB2EGnreBdBvcgt
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpY8Z6AAoJEME3ZuaGi4PXwRUP/AsH
 Yw0t0ESv+O4p/pKXHGybnrTqfJ74MENintJd1XJIFoDLK36+Rd/gK/z+0G9UJ08mfLpUrTt80Fs
 x9mdmMslaKXq0RyiJMvBkG9KJKsw8QbWxeYGBPeBFkdPYwsng7Pp1SgyCHM85+7G8Kh81693zq7
 2V/JoYWReUt91HCze5t5+7Msf0pFzT+cNtv3xoEGgWQij9LIdGrBVHSjoQTzmgyqXQOZQ3060St
 09DlysAt7z7lWIukeUtwNd3dMzSuzmmJKHZQLlTLxJVFSj5GYNJynXU6xvTzhCcyGDe7UCQ8o7c
 kWAaoJ6Rz0yiZRvau5rFFSQ/XJK750wCQVjPxOo6Knn35t+QURJsbN3Fri4/nANq7CkmLeAKA8t
 zkNGppDX3izrW/m0FgHHUoxChWEYLP131mSSLAoe7WVR0/SoLMqD6hs8XHX6ckw1yt/hE6SSt7N
 J5mymF3tl7BSQUvumVMPdMUhWfX2Y2+vmDTgQz+d0IVdhjs6bGoAuByLsccnl4GRyhSTT5pfVq9
 l1a38TYfyBTHfg3FqSBhIdC/iEfavhQIomYUGd8bJ2U2JHktMIPKX7UEBSokzuXKTpK4whbLH3S
 22sExN5rqcSerrLyB7JUPeUei2ZAN+R8sJO36A7Y5va7R5/0N1QYbRA3xNIMt4ryzP3iag97vSK
 Uzi0b
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: geeNCVTrYZJSscN9x7JrGEQYThVS93J5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX4AI0r+u9ubTt
 d6ut3Xl8aSlLto6GbkWU9Ag54jhQ3/EIdp//S54/Vf2KpL/zmLl0ExAjolkJujsYh9eLInYUAj6
 xrw/T6rcNVVWFCqifegKOkH7cRVlOLSH+I962Jbr4NFwX7Y1afCnNKxpC0bF5m302CNdep8Bw3K
 B4RD9lB4Vz4FOJ7XE9LC2dHxFUvv38qZ3Zc5G0D9/euj8zbsDUkqbm+HjVLOe5UNlSUXVJWEIZu
 HRo6iAHRgDpwFfr/ZbZurr7yUwH00YEDnczRIcnwrR45nHL39Y9WEPWvkdSJpqHLJ/PI//T/2AV
 rrhvE/13JmFB6c/tDahN5eM7URnyLsMDOnaN4SyWgVeDt+4bFI+Zab9yUHI50+p08QQDG7IbsAW
 8eiiGPoraHFp5oyZ6lJsBKyJXgf0PdhvCN9iV3za0B0FORHBnUzzioB0FRMwm7hhHgn8CXFrR4D
 HKGdFFUn/8+nn3mPbSw==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6963c68e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Yne-JONsqnic5O4-CUAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: geeNCVTrYZJSscN9x7JrGEQYThVS93J5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") changed the binding to new description
with a Power Management Unit (PMU), thus certain power-controller
properties are considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index a4a887a4dde1..45630067d3c8 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -18,11 +18,13 @@ properties:
 
   enable-gpios:
     maxItems: 1
+    deprecated: true
 
   swctrl-gpios:
     maxItems: 1
     description: gpio specifier is used to find status
                  of clock supply to SoC
+    deprecated: true
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
@@ -32,9 +34,11 @@ properties:
 
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
+    deprecated: true
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
@@ -44,6 +48,7 @@ properties:
 
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
+    deprecated: true
 
   vddrfa1p8-supply:
     description: VDD_RFA_1P8 supply regulator handle

-- 
2.51.0


