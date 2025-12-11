Return-Path: <linux-arm-msm+bounces-84961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F6CB47B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9420E3022F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCE127456;
	Thu, 11 Dec 2025 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VewpZq0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhEnFoBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5C26F471
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417870; cv=none; b=Am+P6vWCpIKRNXFkZZjVHe39SD96OXPJL2u+3INwgrMXyWt6BH+8qbEnJXXaJvsZ6+dXuHgKFTvPVRdli9Xf5CfnFHdWX0rLM9TvaO9tgB5xaLF6ke/KHfjpF0EZaeZlSkeIlFBN8njWaWY65fJbe+kNRLl2paeEp6L3claB9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417870; c=relaxed/simple;
	bh=bvsPud7Jn5y1dHQ3DPCIyrutcU2S/mnI1fd9C15vShM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MrUxtb/dKCnHGp62uriPv+3xIcrU0IRDb7596wTuE3loso/v3jaqWpm9WpqHo8OxHXfnwLrE6THPVwGKWRX0xRxBg1o6iZRCSbU6uK79OCpkWAQcJ0e24GWxAfikwzGlCOVp8AZQjCwGeSpERWPWVH6hyoTV10luKoAV6GEOOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VewpZq0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhEnFoBq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP4Yf4126323
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUKCCr/JRSbAQ7JX9vL/YA
	9WWtNvup2AA/NvXfFOzfs=; b=VewpZq0sgR8EPObHAtve6st2Md0yVCK6s2B9LW
	nOqdSOqKwxSzvNTeaEdGsDrA4rST+kSFTLTMLfu3c+9CSGYwba2hAmlXuo7Q0U7R
	XcTI81qLosRrBiVdo9mXRQoEY+QFsd2tDRCSfB9unV8hKDHLz5VSsNX4A3b2eUZj
	M3bRrpdDtc8bFZJpiFhfCMVypYvn7uFX3Tyov8UxmvKJ0vW7QeGXPxA5yuGZUicc
	r35la6jKesxZlli1YVuwE+CHfg858+NkRXgsJC1rbFWEuXxntHyUsmQ8J3Igx1yG
	WOOsMTDuF+mr9xQZAwQ9AuyehufvRXvHuv1A5bp95LXQzyZg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp9sgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:51:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8883eb7f09bso12536256d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765417866; x=1766022666; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUKCCr/JRSbAQ7JX9vL/YA9WWtNvup2AA/NvXfFOzfs=;
        b=fhEnFoBq1mCtBzj/0MJmaytp655dfaXFF50zOGMKXvx2/SSIOgvnLgjt7tk1EA1Y0Z
         41/70WlTzmsFmhv3WYviUYQLFWD2j0bvdyN2tSTUmRSR24sB0oAeHjCuaWZq8Xjs/ckC
         Ygl/CCuU4owF1FwAOITDwt72zEcJwWQe+cTK3ILEOR69V/fniRolVqyevl+U0h69XdrN
         dZKEbkBMqocEfaN/lLxswGxwuSGVbf3kZ8vbmUocDwKCBPlzssIudVGNgIeUV0T1wFCC
         j8l3h+83xz1Fcy/xU49gaQ6XEdaYfbj3sSiY10SV277w/eoO99/fFTKrSWSUAulUA2R4
         0CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417866; x=1766022666;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUKCCr/JRSbAQ7JX9vL/YA9WWtNvup2AA/NvXfFOzfs=;
        b=wVESj0s2IVN55l+v8+gRCiT4T3Im/nw4wL5IUSngXE4ail6i/PqUqvEB8zoBbZFB8Z
         Ls6Y0POkqbC6VuapP46xf8xBwf3F7SeNk9uTm7yLYvmuGSUvU5yvyJyNh30IzFpC47bA
         btqkGeZSxuGBE0aYiwFd2M6Fr/FaQr1B/OvQvJfrCWqEPPehgp05CHnIqtZgMhKFls8I
         edn5frYfhXwwwePL7H7IY3lSD2hYhDVwEZjoVzlKXnD90B+dvN9nAzF1zoE+7JLZYOmy
         fF0vVZ5Gk6oGV35cRMUxpvFJT7ypXgbIOKG9t7kNCiIzmAxYUXjnZPEvXHSRnFh7hIRh
         fd5w==
X-Gm-Message-State: AOJu0YxWbalWcEuqgBppf4bSzLL7YFtQMBIQFhMZBRVtSycx1LGDwexT
	HhzPGY00QFV5DHdRjLD+LVGZhF97OnpSoFuT9oN51YGgCnZU641HKMC1e2UIMICpCZDvI+i1Nby
	vwDTooEsfIzTqP2Z4v79G+zvvQbYVdqP1Tp80BnX4o1P6mnYMdgV2g/lrfKTCuj2lfqDnt05Vhw
	b4
X-Gm-Gg: ASbGncszop3ZGm7oESTl8TTRgR8V5fKDiHMp0Lrb7wpBrHJCzc5rDNAu2os/cwF97RE
	J7wEy28yeV3gmvJcpsXxMqS2Vg87TyAII2ld8c7UcorJhhElF2MzXrqMWAEKfFI7i3PeVL4rJ1i
	zvys2mK1Ai1RLH/HhDGxNsASV4rTr127BHJO6quPYJDn/yqD2wLSN8iytYPVSr7I6ME26bV9PKd
	kJZLbrRqUiGF04i4gY2QK5KfL2JPDMdghWc4hyuxCCGN+hLG8o7kiK2V+ALTWp248zbCpTO6SLF
	V3r+HmprjpmebTpGuirA8I6rYgucWmm2MiJk/qYpVg2+hhBP4DIAljhyRdoFzvGDQFeEtwx5qb8
	vRcK5xhLF5QefZzuOCEJRlKBjdHHYEm5CrEKh+vUJ6DOTsKp/HSMeqWSz4qpuIvQhQGiAO7nu4W
	6x/KuXQSvsriM7nYAbB4z4dAg=
X-Received: by 2002:a05:622a:514f:b0:4ee:4a3a:bd11 with SMTP id d75a77b69052e-4f1b1b4a0a2mr60602001cf.64.1765417866211;
        Wed, 10 Dec 2025 17:51:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0tSVH5yC6RbeCAj3uM3eoDL48iaA6P//MfWrSYh+hezTH8fFV2NCWUB2W4vS2ZgUdPg8dyw==
X-Received: by 2002:a05:622a:514f:b0:4ee:4a3a:bd11 with SMTP id d75a77b69052e-4f1b1b4a0a2mr60601761cf.64.1765417865801;
        Wed, 10 Dec 2025 17:51:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f3efdasm402577e87.32.2025.12.10.17.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:51:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 03:51:02 +0200
Subject: [PATCH v2] dt-bindings: power: qcom,rpmhpd: drop duplicate defines
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-rpmhpd-drop-v2-1-569e5e8ab34a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIUjOmkC/zWMwQ6CMBBEf4Xs2ZJuUxQ9+R+GA7aLNAqtW0UN4
 d9dSbzM5E0yb4ZMHCjDoZiBaQo5xFHAbApwfTteSAUvDEabCg2i4jT0ySvPMalOm711Fk21PYM
 8ElMX3qvt1Aj3IT8if1b5hL919egd1orpFfn610lJTqi0IvKuRV1TZfUx5lzen+3NxWEoJaBZl
 uULHophjrUAAAA=
X-Change-ID: 20251211-rpmhpd-drop-f0294c41256b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bvsPud7Jn5y1dHQ3DPCIyrutcU2S/mnI1fd9C15vShM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpOiOGu1mKuxkcv+2Tb+XmgWZn/WG0gwxBh3AHI
 rBrTZRQD1+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaTojhgAKCRCLPIo+Aiko
 1UWfB/4ma06uDyri+nQ9QgbWWO6etGVEQE1Ve/UiT9OUb/g0MT+2kXCdPzBlFwtnZpmy5NPdVyE
 8emqPXJHOcxK3VFMagT7cg8buJ22EjVAle3ejQ77EIBHYNCtQG9j47XaiqnjdB7nrNrvdd5wl02
 quW7fAB2bkDi6jwVul8jMCMoCgXu6bIZQwxc4xEO5Rh3PGxfEj0q82OfdO2+5Mjm3H/fiD+Mj5T
 kup3kem8UUYdbac7dl7lKjob1i7Bfzb9VUk2EC+8PFkFAyUk5iWdPdJ0MoGxq69sOh4POyormYK
 QwSMZLwooeiFmPpZ0jHo2hjp6UuVE/McFH19hKzxohXYaUST
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMSBTYWx0ZWRfXzI3Qy2eyyzSX
 Brb9+qzEMuAnYjfbdGoCjZeDbh1mHzA09ECVWZt9leXX72sNtFldALVEKnLwx3vHGNR2WYSInNU
 Z900YKq2XgH6dUE6qXnorbTvdb12oGrKhaZBnmpt445AM9coc0PlS+Zlto1MxMucncSDdWTAUFB
 ftBsOnaC3m25pwHw0VBzlvYXjzQMr8eYJGkvibAFEzeEu5dpGsl6vtLagHQTw03fy4PI+Thjql5
 /pfcdATiD6R3srX71YkTJuFnuIt0gd3Y5Tf70TbpGe4nDRxD0JFzL5zlrSxqAHKEVgD1vhom6zR
 Bysdy0/AcQKbJKUTT2b3TfKGFDo93leHJpwbQNao53cszAwqDWv2WIfDrSFEmTkIA2kRIgFVERw
 +TdbIvpRzWlSQ6uMl0r8B7fmDra2hQ==
X-Proofpoint-ORIG-GUID: 4SQ-wnr1ieRK47QJcrfl3MkFwi3FJiv8
X-Proofpoint-GUID: 4SQ-wnr1ieRK47QJcrfl3MkFwi3FJiv8
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a238b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3Z3j2bVvPuJzJSmPKPAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110011

In order to prevent further confusion, drop SoC-specific defines for
power domain indices for platforms which were converted to use
RPMHPD_foo indices.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Split the patch to a separate series as all dependencies were merged
- Link to v1: https://lore.kernel.org/r/20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com
---
 include/dt-bindings/power/qcom,rpmhpd.h | 58 ---------------------------------
 1 file changed, 58 deletions(-)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 06851363ae0e..b28625c85529 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -149,64 +149,6 @@
 #define SA8155P_MX	SM8150_MX
 #define SA8155P_MX_AO	SM8150_MX_AO
 
-/* SM8250 Power Domain Indexes */
-#define SM8250_CX	0
-#define SM8250_CX_AO	1
-#define SM8250_EBI	2
-#define SM8250_GFX	3
-#define SM8250_LCX	4
-#define SM8250_LMX	5
-#define SM8250_MMCX	6
-#define SM8250_MMCX_AO	7
-#define SM8250_MX	8
-#define SM8250_MX_AO	9
-
-/* SM8350 Power Domain Indexes */
-#define SM8350_CX	0
-#define SM8350_CX_AO	1
-#define SM8350_EBI	2
-#define SM8350_GFX	3
-#define SM8350_LCX	4
-#define SM8350_LMX	5
-#define SM8350_MMCX	6
-#define SM8350_MMCX_AO	7
-#define SM8350_MX	8
-#define SM8350_MX_AO	9
-#define SM8350_MXC	10
-#define SM8350_MXC_AO	11
-#define SM8350_MSS	12
-
-/* SM8450 Power Domain Indexes */
-#define SM8450_CX	0
-#define SM8450_CX_AO	1
-#define SM8450_EBI	2
-#define SM8450_GFX	3
-#define SM8450_LCX	4
-#define SM8450_LMX	5
-#define SM8450_MMCX	6
-#define SM8450_MMCX_AO	7
-#define SM8450_MX	8
-#define SM8450_MX_AO	9
-#define SM8450_MXC	10
-#define SM8450_MXC_AO	11
-#define SM8450_MSS	12
-
-/* SM8550 Power Domain Indexes */
-#define SM8550_CX	0
-#define SM8550_CX_AO	1
-#define SM8550_EBI	2
-#define SM8550_GFX	3
-#define SM8550_LCX	4
-#define SM8550_LMX	5
-#define SM8550_MMCX	6
-#define SM8550_MMCX_AO	7
-#define SM8550_MX	8
-#define SM8550_MX_AO	9
-#define SM8550_MXC	10
-#define SM8550_MXC_AO	11
-#define SM8550_MSS	12
-#define SM8550_NSP	13
-
 /* QDU1000/QRU1000 Power Domain Indexes */
 #define QDU1000_EBI	0
 #define QDU1000_MSS	1

---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251211-rpmhpd-drop-f0294c41256b

Best regards,
-- 
With best wishes
Dmitry


