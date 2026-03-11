Return-Path: <linux-arm-msm+bounces-97092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNthJJf2sWkqHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F926B398
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E8D83013C6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346133A1687;
	Wed, 11 Mar 2026 23:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRj5z1KV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fb1WT8+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA38396B75
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270674; cv=none; b=scA9qvg78FLfyGMA7nWqIVM5tEqZG6rtMXNLS/ZPWlkc5sll4e6X0IVc25dXiqZ6sJrHyHdgDcx/PsR/x+tBZFzGOr5RhKdXBlFcTuNNT/eGyWDEBYTVrPF3kHQnuaZvIQTVn/Cl/V9PRDoQm0OhC284UrBLXPpgYzty4u8FWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270674; c=relaxed/simple;
	bh=7elHzg1UNk9Wsnish7wJ90vrYg3EhkwD0297Z68TdME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsgIVAkhifvtXcYvz16Tb1OWbnMiLle+BEsrNmXG/+Pz/DfVbb2kzaZcIos2kQLBO7IuwfmmQD9DvqAwyjf7O5lZKVpLTkHC3rpMJGH9aSrCMl9qwspbmGIeFHY6m8Js6m3OSCOIhlL++xKR8gG1yyCulyOn9MdDEBHFxeEF+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRj5z1KV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fb1WT8+Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMrYY3136622
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2T+MvpygE6cdPLi+vNPpCGaifOm1eWlB3knZySS7pM=; b=eRj5z1KVH64rNJtF
	DjYoXO40PIA+Nzr01La4x3/RYBlVXCgDI/d13NYTDnkV7YdI+zSlx3tYx+OzhY20
	EfBora4ee0Ev+zen5+ck7LG1gF3AuHckCUp8xkk5Q/z49YjSUyZSyEjUo8Imc+Rn
	lEJIsnM9ALZuN2JnobaUeX5rbJEBoRt6cQq8f1+Pl1By/zTpf0qcgHo9JsaWZ0WX
	jGplvzdEwWNt2rYla6P7K29xtckxxFy1qJwlH6EYM2AMj1FCMzTnPQajJ9Y6PRJV
	X/GFEXsvOPqYorF7c4Aa2pPwThPlNy1zt6cyPGWEcsS+v1u93o9zXjO92f0WqMvS
	K/LldQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w83js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:11:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73783c96baso128695a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773270672; x=1773875472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2T+MvpygE6cdPLi+vNPpCGaifOm1eWlB3knZySS7pM=;
        b=fb1WT8+QpBS+LDtmD1pF3F4jPYkSOmiMy9XIPSW55/JbTb1eX1aNYwXS7MvYmVeSq9
         VOyk+svBAeNumE97afIYaBv4PG4Qd6ifM5tpovoL7v57xwsRmsUFx4VgNhSDTwHJr+nz
         Un4YsRbOy+woUEDB2+dEqbR+cuZnMTkWzm58Z0G5+pdJooITVfvvofu8/G3KPonMEjxS
         DV9y3GaH2iu/Uo/2n3G0xhRipvOUfoHYN++c9dEmpFBqUcz9y1lQt5B89ytlQxGxQMBH
         dJgtovBSZ5DVfPb84zJ3NZjk3zmuN4GocsyTfiZ2/NIZ7hotgjdeJI+J4JuZcV0UUqln
         NVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270672; x=1773875472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S2T+MvpygE6cdPLi+vNPpCGaifOm1eWlB3knZySS7pM=;
        b=jQx3byacKK2xX5QyNJy3ZkepC8U/1NbhYzjPfr6tmy6EDxJgnMq2Tpftg4tCgqICBT
         jyqKHWl/Gs0xtAvKoQe0upPKpBdXSiBbgj5ZJd7n+Coh4UzqEVcNQKdr39Ed3iQi9HUP
         MeLTYliusw51HgskNLoFw/+SVjuNaeoBdJZnJ9wOX9nJhOqq0kDsbVUzgob3egcK3VYk
         WaPQJqdqN76wfqbgQWJPZ5oEWfPJTKalban9H/8tPqDTzecLK0fKvVYawZLySB006OuY
         bjDVr/SycUeW9zOR6NiMio0rW+sjcCMjlTjk/ZSDET8snwjk54ovdpFgro1zAqSGfKQo
         TfUw==
X-Forwarded-Encrypted: i=1; AJvYcCU7E0eCbQ+0a2X1NL9xx/9/SctGxkFIu7RQxZ1FmcdcOLIL0iGfeOE6IFAZFyNnm7nNWsi7msKAFWSOrg1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23VfIHLuC+TpM/V5z+P1GcefYRmT0G6811lNybHALCkGMXYwI
	x3ZD3OAhOub22bG1d41EGoF+omdsI9vd3wvxDqwLH7eQcoDJTfvfmsjJesCQx/kHgZypCgEMmI6
	sA/UPjIIJ+8uR/fzFv9I1pjxYiM0VRucQPLx4TlA+UCPWWbXnKMpeY1fJN13RHnREcGKF
X-Gm-Gg: ATEYQzxUMUX/6vkNnnCZ42p43UfH7CmbENte/YvF65rIu9v4NNwEtiQOab7/y67jxPv
	tiAmGNoJ5Q3fSvZEbF/ngBO7crOWyAFwrn4ZG8LTzlK3ZLkLY0eE7k2vOBDSdLQyAsl3fLDF+7j
	JmRrmWUhmX9BBJzARDKN4hLtD032rFTXI2aoJeu/52t2s4vIwz42XU94Rk0E6sarJHsYyQCdIvi
	3yQI4my69QW0UsfjhkAvL0gqLCHa0oLD6dyKuZMCtL8OUeExeOqskcxCLzhY1VMAo92B8Cqvpl6
	ul0FYdWLqMfg27HkaiFr5OnOdrmPhtwI46gkPhdRrg4bACF/DlwvnNOkPoCgnGrCQE1jtPEyo8a
	3sa+e78UlM1X2yLTomMUe3EGHHBcSaZYtprT0HuTWjbEj8Q==
X-Received: by 2002:a05:6a00:139d:b0:7e8:4471:ae74 with SMTP id d2e1a72fcca58-829f70f332amr4484468b3a.64.1773270671846;
        Wed, 11 Mar 2026 16:11:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:139d:b0:7e8:4471:ae74 with SMTP id d2e1a72fcca58-829f70f332amr4484421b3a.64.1773270671365;
        Wed, 11 Mar 2026 16:11:11 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725facbsm774569b3a.20.2026.03.11.16.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:11:11 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 04:39:55 +0530
Subject: [PATCH v8 3/4] arm64: dts: qcom: talos: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-qcs615-spin-2-v8-3-fca38edcd6e6@oss.qualcomm.com>
References: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
In-Reply-To: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773270637; l=1513;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+Z/QPnrPmdecyuWUuiIu3xggJAb73CsDdJQ5DBAszX8=;
 b=rCzsQrtcv0dpai5LoHUt0DH3EKLieN0xfqaVMuJV/X9vYM/ec9uZJxaGqo/URLDLufWBEyBPi
 knS/wGFoYNwD2YcObmP+ZBMq/dwZrT5xK5Yv2YZMu7scZnBR5lgznkE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: gY9Md3xAMcJSzls9QcR1Aa6TpTYLkS1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE5NyBTYWx0ZWRfXyLf4Wj3rNr4y
 xeBgeiJ1WrrpGiCqgDO3mL55Znp0m5NUutyR9Anm+XC21kcR7S2w3hDIp5rdpw4bul2Uk1IuSSl
 AyVbD/bXdg6ogriOm7A16XvQTPbRFF9lmKBXjXfp4HgtCryzRvmXzQOiWFBufUzZ6UwwA6ikLxm
 Km5AtEhGZjAvDC3HHv3p+gL+sEq8JEQkIMTHfH84+OMb4zvOcH1173DFKtwujFaL+JEawrKQEw4
 +NmDVWl/BbddrkGZi54Z1z4dLkmSEsJGzmbrZj3GJwI1k6HgiT8NpZx8GUXhfT30soCl/aazLYk
 mm/o1y+8Qyfz8lEdoJg96XWi0TOuXvKCHBAzN3GY8ZoX/iCAkV0XI91rtAXYBM0OAkblqLbDo/j
 KDMadpM+APW5UJzpiwTYT8tDHj2sbL2zGjOE2GXzAf3zMIziUa246Zx5Yro/nvl8MxzqrtHu5Pq
 yjC66u/f2GOEFxtZfvA==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b1f690 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: gY9Md3xAMcJSzls9QcR1Aa6TpTYLkS1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603110197
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97092-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D7F926B398
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 11689da96c96..fcd9aa0f5c33 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4985,12 +4986,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0


