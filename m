Return-Path: <linux-arm-msm+bounces-85555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72829CC8F88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 18:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E7923116598
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DD029DB61;
	Wed, 17 Dec 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjcofAbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5REcQz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3A348896
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987030; cv=none; b=VPQCJ+XDvHSbkU/qQVloj0GYsrJvPNSM0V/GXUPcVb8iX47Mzm3B03M0kuxh8xXvcelZWmv8MiAdWS1NyeMo7Aw+QO+DRz5z0t/x5WcNgkpBpJXfC1G44DfK1UDgpMdN20CYxQy7RHJ4q888o7U1Avjjtff2JJTZIScSIR27+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987030; c=relaxed/simple;
	bh=gRnwoWYVjN7GMrjsuBdpDhiMQwmfcdo/4r/Rw1j08vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrgMdQ+OKZrz6/gtuhS6FHg2qc21qxP3pAl/Y+WeRl632fKorcbfwtMK3vLOzAj2sqtzAE6lIWr/xo5pu7uWsVAtw+8q4Ar85ED7CFzvEBbgY5uCeTXHMb/bnO1d0GFaZb7SVNEnYm2eVSgIY2HHR0RJPf5kNwooHh73y8iTJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjcofAbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5REcQz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHEvUYc2720294
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4KqA588JLPQI0i1Leq0ab3vXKKNpG6AzEKsdY8kU30=; b=UjcofAbvH5ht9RLh
	cYDq/xR01gLxK5bht4pOfOe/Ivsszgr2Fdc+4rcX4BKCEK8dYHehIfDscs9uNXo1
	c99OZw+2Hhp7E+iGe+UUdUIzg20l72HxXdn20rJxGjEoM9C5iDBpi/nU5Gj1peGu
	zJV872/Ehdt2N8ZdNXR1QHbg0OrsQ9zTpRvBfbGJd5ioRNCDQycKNXOoWuHyeG25
	sMGWfTG7WP81EoILnuep+ocmdsTk7487psinZdOW7vf21t4uujkft+xeThwvgNUX
	bo7HqQhm2fZiWh4O9HW+uRwY198oLau6bSWKMY940YVr7bEIYAQWOL3tMckzmBfE
	pj/7Jw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr587gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:57:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so16515281cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765987020; x=1766591820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4KqA588JLPQI0i1Leq0ab3vXKKNpG6AzEKsdY8kU30=;
        b=F5REcQz8IfQ0pWce3a6i/wPOtbb4O/rz7hxWm5v0rBKY6+1OHXj2TvYlqKMFWE+BO5
         Qb4+rfs4/2RrHGe+ukFhQ4NULqIJCZQv9KNp0cLN5rQ+mjt/EliLpqJnq7S7psYlHnUK
         psWILYCaqwK474EcyA3P5CcFX/Di7fRTjCEQkOjgzrOJ/D3OQNiZylicOagiSImOQkjh
         /vwkRzT7rRZ2XUBr9WdSXxosV+0mCZtn60P4Dk22rMyopEnh7YtYS599MdhXYJWtnUH0
         HLOAuCCCh9xEnv3ojv72tm0rJ35Ekn7x8mp+9359Cv/Nvj2IM42AkWqzFNYd1DZEk+hO
         rXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987020; x=1766591820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4KqA588JLPQI0i1Leq0ab3vXKKNpG6AzEKsdY8kU30=;
        b=bnvrPgIMsS+FLlgWUKH+kyosvcv+bHTjXVnWP0KFXp3Wtwisc2BOmOlAMDVbE0P24H
         bCQBnJ0KDdPc4siSvDx1QavORswRV/sui9GxzB+LrpFbTANnvmASRUbjqXmJyCcz4936
         g0/pxXcuJcZXBpX9uCd7Brgw5YV8FnU/uEIzwc6pv4BZuGnWYZ4W2RhETD7A7IqTloNv
         gCPP8AOHQIi6z4uWBeeg5vJvOnqqhxb5aLV/5y2Mdp0vwpwBqFt6KE6uejLnXIsxkstf
         tkI+fhn1hOvsUDb9GFvha+Bk7qHCetf4ax1MwVRF8bEg8ahRhaqTPcP1GTxFHfL414Yg
         ujzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZYMQ+Cc8TwSNM73HSUkiMRNIqZsp1lDDMbKechM26sNYRoViXm6R/ML9tG+k7VvPu7Vmyf7UaO1tAA/g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BNY8SV759NEikcs7X+VLmmsgP67ZZZ1UfHwpAwL/QrbenjiL
	z/JaXy4z8fA9nq6xYsATLGZMrPVfNI47U4OIyvdvF1Q5EMw0WGRZDCSnP55i+kA/9Cw/RqcUrlF
	s8s6ErhTkEw81ULNr7OCBFuZr8vBIIF5UxRWyTZ2hi6Pj70bWLDLgbcnRHYu4cvAaDF0Q
X-Gm-Gg: AY/fxX6uGvhFIRmGNHwZu6q3ozwENVl9TC5LDDWdOa/yKDwyMhD5hWXD9hF1zxQhzpQ
	0WjqKhZ1zz6IAIp83V4c9BgQKrttq8LjEhfAwA4aYqV370T4YgVRpLdPvpwDfoHpAE5mzqX4FpW
	m1L4cJ+kacl2pLLey4DXnDOPQqrNcfTUeJwT+un9NXSQjIHk1BK04uqo3JLUKhi1YAJvXcvaOAH
	QVvQSpsC1uSRChnpOhOvqCiHCHT3BqZ0aw4pkzoA4FFmdsV/vHaSFElNfGN0VCKNWkKspqMugS7
	AAGMGO6RwHP8Ya5EiFGfkZQDLQ8D9gmvpLrFF8jLOkrXvQPxPV/uKhoDXdsQpPtbxjVkmmwVO0w
	ns3f70DPJCVC9NvnwULJ3cHGsoJbjdUoY
X-Received: by 2002:a05:622a:50f:b0:4ee:12e6:dc73 with SMTP id d75a77b69052e-4f1bfc359c5mr334303301cf.20.1765987019688;
        Wed, 17 Dec 2025 07:56:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSeUGQg3MB7LH9Sfie6xzdKE2ev/yzJYMwkoILOdDw7e/522lcpaoGhlmo5oVnRw1Xh0YFVw==
X-Received: by 2002:a05:622a:50f:b0:4ee:12e6:dc73 with SMTP id d75a77b69052e-4f1bfc359c5mr334302971cf.20.1765987019289;
        Wed, 17 Dec 2025 07:56:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeef6sm5439800f8f.32.2025.12.17.07.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:56:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:56:29 +0100
Subject: [PATCH v3 11/11] dt-bindings: bluetooth: qcom,wcn7850-bt:
 Deprecate old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-qcom-bluetooth-v3-11-ced8c85f5e21@oss.qualcomm.com>
References: <20251217-dt-bindings-qcom-bluetooth-v3-0-ced8c85f5e21@oss.qualcomm.com>
In-Reply-To: <20251217-dt-bindings-qcom-bluetooth-v3-0-ced8c85f5e21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRnwoWYVjN7GMrjsuBdpDhiMQwmfcdo/4r/Rw1j08vQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtK2taJdcfc71fNpPw4LJbo7qeYKf7M33R32W
 mEtK42HxAyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULStgAKCRDBN2bmhouD
 17MiEACS7xd3LVPvQXjWLBMFSa2PmWiLwHVDtKBW8gEpmwHoSPzYHXgOR/euSJamH8L8boA+IE9
 NeNxEkh+BHZpmUmr1RKMnw9o+y4hSwlDkmK+irX804O+DD1fH96l+morgQJC79vCrUV63p3doS0
 3n16dXUgxUM+TdL0LGtGl3psTvtxOw7IEpbEE86qnkev75YQSaium8SCcHj6teZT4ErdMCgBdAB
 6zzZEW/Q7iLizEdaq4OZmWoPT6WMwxyRE3BYcLANAyYRIidrxFbZnwn8e6QhyiDj6jSGkP0crtj
 KhCIqf2L1U4TGtIEpnyNW8auIKrihZVy08m2aNUmT7mxWqSlTDsbiqJR+EyxmMAHKb6fzOymixR
 rczG4JI3uZq6DxerQbJspEivHWpHLPmMNeUcX9TzdM650mYGJWGDcHwBedq9ylU/KbyJgiLETHR
 TpYPPYhCY0+9zZwUI73lCr4EKsiov7Q4qxA36iEBTTRj24hZBfNkWMDEkJad5wb2ha3c+yUUVYo
 jte7+mXAx1JTOTEUtSGaWRLAGn8fAdOoXfuHIT013tMtMsYh/0OiAj8YYx5N2UC4i9GL5H5OWdW
 0/UzJTRu0oFSUoe72e0YsJZ+rERfj9LTTSKUpf/mdrFkK4bcG9+Jbs/3y5bHyPlXK8yzGn8tovv
 2NN8rWjvqXRChig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: MseB7QrRyNs_l9JOoxGkD_1tFDYvClRK
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6942d2cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Yne-JONsqnic5O4-CUAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNiBTYWx0ZWRfXwAdCKC6dBRen
 KTjMPVmrTNFrRSbWenbpxkhDTryMnR56+PQd3+8uOihbyhq7TCSv+4rajVeIQBIXwwXBtm+06yA
 3TW+HBItRYWhqs2GD16aab55KElAabbpMOjkuLFqOdxDuktUUA433p74um6HUktO/Znk1uehM+s
 jAW1V2DpfwJ1TxJ/IaxFsxqNdxESIpsDTCq0rqpeQ1Hb8HWizlS72SxVdAUVSV/sysjGYMLITXi
 471qxa1CKatlBOwe1xndn7eD3c50SrCKiMvATbd9vFhLT2UxK5QeFikug8DfdpiGKRo83nzCgHE
 9iME0arht8174kymcvh7BUdziM053VwgZULkJCpsp1cCDVeorgXS9/YYw0PmeCNUGt2s5dJs9Tn
 hy0zGK2YCRbfXO1mvqO3Lpp07mHMFA==
X-Proofpoint-ORIG-GUID: MseB7QrRyNs_l9JOoxGkD_1tFDYvClRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170126

Commit bd3f305886ad ("dt-bindings: bluetooth: qualcomm: describe the
inputs from PMU for wcn7850") changed the binding to new description
with a Power Management Unit (PMU), thus certain power-controller
properties are considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
index bd628e48b4e1..8108ef83e99b 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
@@ -18,20 +18,24 @@ properties:
 
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
 
   vdddig-supply:
     description: VDD_DIG supply regulator handle
+    deprecated: true
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
@@ -44,6 +48,7 @@ properties:
 
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
+    deprecated: true
 
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle

-- 
2.51.0


