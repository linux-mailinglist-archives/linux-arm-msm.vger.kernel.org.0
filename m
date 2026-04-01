Return-Path: <linux-arm-msm+bounces-101284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKEVMK/rzGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:55:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AF37810C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 133CF31858B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC233DEAE3;
	Wed,  1 Apr 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isWEtfCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2SeC5xf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EBC3DDDCE
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036507; cv=none; b=BDAsoJ4e7EVSJr20+gHnVr7qvr8Q+10HNEOHvTlo5FGaCXlDnP2htD+Fx/pGuceNMnG1rGxsbGrjwXn4eOzGKwRiVy+/2zMvWo1xQNZHEafSUb33qButL1EBFTl420CMco+Oall8YuA4DeZiIKSct16aW9S297PlHAAwS6PJ9WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036507; c=relaxed/simple;
	bh=sasOTkN8AUTzLdpvJZcyVh9DMQLEJiqUYgURuiBgDkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MOPPoUeId++4q9AIlA46Qzj30+9/fc0XxfAgQUG4s+4FfdY4jG/eSfMCD/3XB3k17Iqwf4BMznytm4pgJ8GjageXYo1RoRKAoossUvJfW92VnK/jrX6JMNpAjqMvucLPyvrb89RuF9xkgvqR6J48gdUlDc6oONp1jHVIAzb6EHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isWEtfCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2SeC5xf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63188WAM718531
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E1ms1DUQGZzMgUe2cRl/AL
	bJBilJ7+kU/kSLleU3KIU=; b=isWEtfCDDKYH8XqDggdtAQt0ztZzvCftSeq37C
	eCge/42LKKDYy+FFmKp+LjdxZBrvzJYy4WW2hGoSFOweGRdS4CnFl9pFuCEvCeDF
	9J7zaCM3wrE3FU0iOnnuCkBi1gcxxiwJ8sv2AGylj68m+3Y103Tex8zisnqlr9z/
	qRdNCCn0dPoGzbwIrQSUpVk0PoYbJbJAOreeTqI3aQTaQLd617x/e26AdsNret5G
	lXCdWTAyE/a4m9oQ6UEa6CxBTeFoTLaUZ9SP4N+q8zPMrbXLVo3+f+iBr7PZl5eb
	SdGaItoovax2MpyvkELrpWPLMj+MMtbFoUSGGAVNW3hroCsQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsub70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:41:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12711ec96fbso13508187c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036503; x=1775641303; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E1ms1DUQGZzMgUe2cRl/ALbJBilJ7+kU/kSLleU3KIU=;
        b=i2SeC5xf2W4VLURr71vw48rfEyAtxQYY4frdWtWuAWU/uBDsAhdwsUv73gbG2ojb+R
         udFJr/W0yQKE+JME7NbCkQiLrPwmbtqyAzdScv3iigwDUoAworescSgiyBt+YTgbz1eS
         6TKX6LojptSZRsnXtwy9JG/b5HHPVVaQd0AlIrMxNM6mpsDkLoiFNCTPoyBPYqMvJclY
         Jb+h+mcjltsg5ARbC3+MEo6v7KO3FXndeEb7vGt80U0pvWeOm4wbjsX/cGv9Z4GANVnP
         U9ah6ylf5yGy0Tza4ypHmEAs7EQz0l4QDCyaNmWKPOou5oAejD5Bgb2XksoVnrQqo1G2
         RLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036503; x=1775641303;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1ms1DUQGZzMgUe2cRl/ALbJBilJ7+kU/kSLleU3KIU=;
        b=D06LJc2CYLe9zKm/d6oiv31+YNv6lDAWVPsNV/+/J7vrt9wEzCvOHUa0WW37ymIe2a
         dmvT0O2Jfftkcrskx2x6tLXCjex/VGIsTO8jSotzMrV2uYiSRqzM3Q4oybFw+yce9oUC
         Rd6hVPoZsufWW8UHYZSK4caxIhgCgT7d29y0SX/s1eJqeYrLqcgdQydp08hRWpCqlJ57
         KHI/RYawyYgmToS6R1AJzMyJXcoDuTbFWhWG1I7KQJNisy7tkQ2auIMos0Rx6EXJCSLZ
         l5Ak8Zt2ijwgFUiLVj7dfmblW4wolv/i4oW27y2kqf5O+IyXxxOPOuhGaGSoS+pq8TgT
         3cgA==
X-Forwarded-Encrypted: i=1; AJvYcCX719n7F1wc3NiHEhoAzqY4l/bDCtkxmHsPKWwQPRgDA/5MrDA5+TBnAxvS6FQtG77Mxagtm/WdO3xYOKdC@vger.kernel.org
X-Gm-Message-State: AOJu0Yznf519YX5vCgjX+F89tXU4Ds56/b3zeeaTh5fFdZsU9IgMCAH/
	BpozUhGRkYErJ/k0xq5pHiFvdyLJeV0vanctHhYF1jA43hny4ZUFBnIH7/DheUxMhnwaIk5i/6e
	IpAvpbPn0Wyib0ESSzTtZQYHhITg1TLxMaiW/TEH3jjqvaba43M7x1IYWZIldFRRnmx8r
X-Gm-Gg: ATEYQzxevpiqruAnZ+i4Wwc6pwvtAW1C9YKjWGGZY70+w5xrx7prQ8lauyQhmjsgWCv
	j0p60nQ/ZoDD9mPYlV/igSSpMn0zAfFQHQaj1J9AfNUNwdZHbCQiPr3Pmxh54uIAXhlPHMxr/Fd
	Wgt5LloDTL2Lzz57qO3sSooU6+jshwQWpzydrMMeDhf5rzNq9NYAp4IEHc+HZluIL5uo+wkmXft
	2YJUZ2ygakqct88/nc9mhZFOz4qPyKora9FPreB588XJ1wkHcpXAl/4gBI63qDNIbPOkQ/b7TNP
	JtJh/5lH8r7VcNobGaGixcwkhhlW7ghMlLBiXCfXGW786oCdCWyCJW4vpA/uovpoZgKjRfzl7uZ
	lEkM+I58g+OXa7sGcuSzkSyIBFfMCZsnjCEkMKowWwmNYSYvG+78lTPy3DXD20gUztb/SixaW0A
	==
X-Received: by 2002:a05:7022:b81:b0:128:d25f:3201 with SMTP id a92af1059eb24-12be6574f6dmr1659042c88.38.1775036503568;
        Wed, 01 Apr 2026 02:41:43 -0700 (PDT)
X-Received: by 2002:a05:7022:b81:b0:128:d25f:3201 with SMTP id a92af1059eb24-12be6574f6dmr1659025c88.38.1775036503009;
        Wed, 01 Apr 2026 02:41:43 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm18982647c88.10.2026.04.01.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:41:42 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for Hawi SoC
Date: Wed, 01 Apr 2026 02:41:22 -0700
Message-Id: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELozGkC/03MwQrCMAzG8VcZOdtR0zqpJ99Ddihr5gJu3Rqdy
 ti7WweCl8A/fPwWEEpMAqdigUQzC8chx35XQNP54UqKQ25AjZU2aFTnn6xk7Fl5dNS6o9XOW8j
 7MVHLr8261Lk7lntM742e8fv9KfZPmVFpFaiyQaM1+uDOUaScHv7WxL4v84F6XdcPvxpVJakAA
 AA=
X-Change-ID: 20260323-hawi-spmi-a29ef97409a4
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036501; l=639;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=sasOTkN8AUTzLdpvJZcyVh9DMQLEJiqUYgURuiBgDkY=;
 b=n+fnn6p6RgBM702NOfUCGKYgNk9NmhKgqva60iB3Oguc4cyIQ3uCVFeQlh/4Bjj/RzPMZOkOb
 R05E7op6DsZAvjzGNEPLra/Dt2wwrBghW3MG8QVgrsbJ7RF+tEnqJrK
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX+JY2I9B0pmXb
 oNlm3L4P695JNGvUaxsTDJfxzYTOmtFvOZ5LP9PC21wqjZh9AMhL9jPPyIuMGKtwLWxXoOLb+hw
 h8vRUZ+3PyJBvEKEJzfA/p1cNm5SwoIR5ZVpsFTIatnlBJljouryuDmbos+ewXJ2rlKrnHF6fxH
 bslCjRUSFehQLb8hNBVwcN+rbbDoFVvpbbpaj70GSJnAPhb4hHtnc2pkBGX4NRmy76rRIsBj0sF
 JWpdrcbqxn56bPRVyHsFO+zHEUSpTZiepT3TJ9o3q5EKcUp3xv4ySIiUDvmDY/guqe4aB4KO36S
 +Deik5v/tis8e2XevO8Ny2D2rqweheJTKOXoJqxsq42HZ+BAbqliZ3Wt1KcauvW1kq31biE6Kt5
 id8CcR9TufFv12y8K6G32ds94U7jqOEBtAUPctHK5R8Sr+ptkfh185tfXIwM/mBajKYaqPxASvS
 uTYPAJv7XuTjBS+u97A==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cce858 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ULQQq9JTZBL3cuDoGv8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 62IYCmaBzolhuPacGMLKLItKYpLNOpum
X-Proofpoint-GUID: 62IYCmaBzolhuPacGMLKLItKYpLNOpum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101284-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 288AF37810C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Hawi SoC and add pmic-arb v8.5 support.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (2):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Hawi
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |  1 +
 drivers/spmi/spmi-pmic-arb.c                       | 69 +++++++++++++++++++---
 2 files changed, 61 insertions(+), 9 deletions(-)
---
base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
change-id: 20260323-hawi-spmi-a29ef97409a4

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


