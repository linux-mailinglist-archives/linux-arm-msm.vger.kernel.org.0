Return-Path: <linux-arm-msm+bounces-98681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FefHX2/u2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:18:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E41072C87DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36A873030D13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A963B893A;
	Thu, 19 Mar 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLCMTVUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvzQBPzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0D43B585E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911842; cv=none; b=nu2i4wtEG48Hvk6wzVIWPH0uX+codwRMvroAtcEXFkVeVxrZ2nlFvLQHbzBxyNPDsf6f+IOsOmh4cW84tb1AUrVH7GVL8njcen77FBdUDrc5Xf2XMENZ049UeQIIo+mhWIyf+yS/6U93rg09BZJjMVuNAOXSaLdp9BABm+UO+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911842; c=relaxed/simple;
	bh=qXBkYjPnbLAX7LWDfIWsBbSdexCvktTk93pGdE20yvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FxZkhrKm2XLGVNvrWe+AXv8X9clM2cbEPeoygKR3NBeJzAbT7pS2veZpnHWOzsp5BnAwxaHR/zogDzEgsxZ7C1ZCgUemPb+WgWliP4FFznQRC+a0anxbzRK6FZbBH0pU6CHxhhEYFnYB90+7g568SEDiSUJ0AfTkhiLseyShDkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLCMTVUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvzQBPzu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wr71898624
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XrV9CMx38MP2Hm6dd9pHytsaPAHpvSVax69
	nh+gv/uY=; b=HLCMTVUCMc6pDrUwFdYXcNhX+jU8IVSXzne3dpiiX5fTyGY7dYJ
	IcquggtpBnficPD3iLnhJSnn+grEDBavUyG9LZhs2+GpjG2YvAXX6O4+2K0FQhWn
	ge3UF/0x4RARCHJb35v2rdF2OcXWrYTkR/TbhMQvRMT8Upe38sF+AINlGv7ZZUEU
	dVcrAGKQ15W39BSMVbqBb2OBZq8EfBUupZV/rNVYyLolj7/aAQeGjoOGeewUO7UG
	OyRaS/1dbVH05PLYEeaj5/ky0X9AN/GD7SSoKYV3WFxZY07IS/bsgNsHJNZMN+pP
	scvVVW1DJ/BzOfEM6KrUGBdeiYSqmyGujZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgaucb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:17:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50920055f0aso8475151cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911837; x=1774516637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrV9CMx38MP2Hm6dd9pHytsaPAHpvSVax69nh+gv/uY=;
        b=YvzQBPzuDMWYLlXfYWfXNH1CZfZ5G1JPSaFkNsyUjnaMsvBi56XATsy7/LkJxjtVmx
         l0fqaxi4eMJD0KWSoAo1k7/krbv8mIGZCmVdX49EZNq3ZRn6ob2GK9JbYgT8QVoh6csd
         9QEYMDmcV1dIiirSrnVXq2gyToaOkQgxNd4aZB6YXXqyyrBtflrxgeOccyd7hM7b19pC
         biGUPAsl7ueujB2pCbLgOdGDWWtSeW5Tbw5vAMmvvZ4E0SZ/bJQ04GRRAK6XPhgjFNxF
         pkgbnGDdqZwfwh8vqY661vLcOdvXvzb07nYTgXW5fBN/4zdhLuHxiwP9e1sHztfOa4Ey
         Ss3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911837; x=1774516637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrV9CMx38MP2Hm6dd9pHytsaPAHpvSVax69nh+gv/uY=;
        b=klo6Y6GLcpKQQITUSzjguGHUQgYOHq8KIgu5CUj8FE1ev6+pgkEER0nDV67HOPyzEs
         dEyPHLll2M/fbEWJWfAdKqSHaxMxB4DfzW0SVwey7phcs44g9ti+BEKP8uxccT9w3fWd
         /x0pQoHT7G2YK8UK8t0GC7XBkUI46L+kWtx8V7YIJQKAaXlPdBxE2wvhCLw9EZPpSrpn
         uPSe7aRhrzVOfarRqr3AH+2CLAwr4ARczGNZKODxkDZVF2ZqiwPIHmyihuBdXggVL5Wm
         peUTi2EFC3qRdoi/FqzaRCkdz1hXweE62ncqNKDWjyaaysyEjRJ/QR8dsiuLq1CJZduH
         oFUg==
X-Forwarded-Encrypted: i=1; AJvYcCW4GTDyAJSLWke6t+MiEF0mXH9fQUT9cSENwEcPodxRbe42CvOcAmCP29Xgvv/rxyGzOoAzojx85YeyGzmb@vger.kernel.org
X-Gm-Message-State: AOJu0YyeqNySPrAqkfRyvpuKiT4ClrjYC1PKL2YpCwxlSwK65MXBfTHQ
	gpoNCoIu0PrFxJjAAPEq7KJxZ7k+R5HitKTA77iF3t6jGCUvV159jpIPvn2em/vp7BiQa+qlbZM
	TbyPeAmOzO/9Ui7A9aZ2UEa9XVPNratcgDPEPeMa83Xo44YIWCgKm3pafd9NhDsTscjKPUfJNHX
	Bm
X-Gm-Gg: ATEYQzzIHPcw4msQkAv4mzSEdAq59IqKVHsp2Ne/HYL0IDWIiO538cAj63B4CSS+o3v
	a+AQbJdZw+COOXh0QeNPTls8H3FzyZuyDHCOZN9qNm2auVAJF2Vl+mjEfTz0FW02pyABprP6Xx2
	3EKzqczweHRghEAsURYddwJy9KgKmRfDc29b08mzet5hKdeVuq4hEFEnwx7E6r3WT/NuINU7p+g
	b7RBf97I0hE6sHtXPxuPBUxPeT9ORk2GqfBBHE/twbolYewqv+CujmFAT3lOZg7A1rk3kB1ZNbK
	KUiO5+74lvAxaxBQ5ZaLSPwDjdZjaAIjYSx91Bqu8qPnX4nH40zz5BqqK0NgN+1hwcdsi8EXlwf
	pO/6DfQsEWT/DjknzwxSjR6/FUqTyXR16z0Xq
X-Received: by 2002:a05:622a:20d:b0:502:9b85:a609 with SMTP id d75a77b69052e-50b1488470dmr81064021cf.30.1773911837222;
        Thu, 19 Mar 2026 02:17:17 -0700 (PDT)
X-Received: by 2002:a05:622a:20d:b0:502:9b85:a609 with SMTP id d75a77b69052e-50b1488470dmr81063791cf.30.1773911836740;
        Thu, 19 Mar 2026 02:17:16 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a3dedsm13851748f8f.36.2026.03.19.02.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:17:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Drop stale child node comment
Date: Thu, 19 Mar 2026 10:17:10 +0100
Message-ID: <20260319091709.20981-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=776; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qXBkYjPnbLAX7LWDfIWsBbSdexCvktTk93pGdE20yvY=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu78VuqPS3Pl0qlCoQuOJPbYWcQB7BvC50FN82
 a1TI4nU6YuJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabu/FQAKCRDBN2bmhouD
 18Y+D/jPjz3nFQaD/FoqE/ExjoBM5kWR14Dz1i0ubF4QX4qzfzgdNR3hZEsxdNOJ9FrhcJIcwgQ
 NlphyfsXprP4VjCcxE+pwH0MhY3YQ/ESwHzeZCraZIPei9YqHsSBcgdHU2ZkmhJgccx5OnY/uwF
 W/bW+eWMQpNq7j7R/T+oDaTWjBgvQA1jgjN7D2Afriersyk8e5BB8huL94WoVh1ZXcpBbrSj5QE
 Vm5318b+NQcviDS9XKnoQt775O+XTXfz4/AzAz6ez+YSm0o+SxM4IORLzSYgOffeuJiTJ7syyDH
 JWgHm2EHZWHympn7GVpQUMqZlBaeIaYdVDI8JR0Hor9C3cpzuy211tXNmobzrfCPRu0n+6n6dY4
 tAwtSWLMR/suNxqb2VUC5GieU9upw2rXJbX8lW+AkDCcFv8r4dDwWnlpKpAn8uQRUiGiT4sN+TQ
 66HDCMrkM0Z6NXXIo/kxbZ3/1avx1GXw/7sAYvmkNXmThc82twd52FIzpC1uPIQ3LtFEfzSzSVs
 NsnCYpHFQLFjn5Da/TCAl/JbAYHvore5cMdGIqXmVaaC3bW5jpwuEonxanYWQJuRsqSfaIjeJ6f
 O52VWritJ0HA8nMkvX2KapyZ3hfHZTKVTJqauaUiw4xDCuf2tPc7hDgm0EYw31hzT3tBfLVhc1Y EjW/zyp9J3qTY
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MyBTYWx0ZWRfXx4B81tn74NPp
 RTZVhd61bgj6S/HkipiiPbsF+bGgOhqan4hT+Hbm+EF5wZD48aJPyYgDyQMZn5rnOKWdguqjLAk
 OU59TsIaAaeAAMSyECsKyMYOofaPZ948e4dXzFl6/YXGhnET9ivSb4dZLDztGyswkNx3unC6PWK
 +gcPGvfG7XFYi8mS3msUEddcFQGk9uzgg9D2UjvYiRAlGRnnkPjlNLqjwrGA+S5wE5N5mNDmgIs
 by6nqJNZPAZJQurdnfeizsaPsTLqz7jLg0+yeio3y4SNyndZj8O/AFVzd16ueJPdD65cXoSMgXg
 CFpAmBX4rVkx/WeSBM1GyGsDfKkptRtcdIhaRb13V/DKZgom86ru9a6+eWPW97rw5k39OVV/+8d
 UrvJXwALzsv3WOxBPS52PHt3KksCY/vYFVbWvLEzD11vXWvc5caim2mQ6xLSO20f2Q9+pr4DaQl
 Q0L8bCAQ1SuNi4OCxMg==
X-Proofpoint-ORIG-GUID: btheMIwGYrxeW8uxGgiyj0OfCbSgJEfA
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bbbf1f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OWNo7BSMJsPq8WwrYUAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: btheMIwGYrxeW8uxGgiyj0OfCbSgJEfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190073
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98681-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E41072C87DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After moving the binding to style with combined wrapper+device (so one
node) there is no child node required.  Drop the stale comment about it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index f879e2e104c4..2b6a0939d98d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -153,8 +153,6 @@ properties:
 
   wakeup-source: true
 
-# Required child node:
-
 required:
   - compatible
   - reg
-- 
2.51.0


