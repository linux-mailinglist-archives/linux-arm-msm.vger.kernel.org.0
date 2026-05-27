Return-Path: <linux-arm-msm+bounces-109970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NyABLe+FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:51:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7C5E225C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06F523061245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB693EDE7F;
	Wed, 27 May 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="litw5UqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8K2l2dg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA23EFD0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875090; cv=none; b=duerPgZePZc6WSdC9hC3gycajawOJFWWp9PsbSrnRrfY/hNEjqbmuapgoEbpbBZmRvtwUDHW3h+4ez/Ikz9FHDDYdOFnecb6hWKpDytn/nhBzhf9Hn6qY1RWio2V03ywGwgVl1lxkNX4mv5M9EH8bYUFYXapysAT7+V6t/Cav8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875090; c=relaxed/simple;
	bh=P8i95FGbdiJapQaV9WPBprzSehQHwzILO6Viu7fCA7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhTpOwqcne11P/Ywg+sGloDwEmw1ltgy4e68IjgFsE/gTWBG4ITN1Q07SntP0RzgZNe+FHp++2HInpYORHADl0SiLAJadENza1PcSMU9+Ld05jfUD2Pfn4WVQDPKx34mfHHkw/RRc6YJymkcTCYccrp1sGp7wyWAtAVnOVRXg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=litw5UqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8K2l2dg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mSEs973111
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aj1QzDzphzt
	jGQH1qzVf1DDT5t16Ki1MCYgce32K7mA=; b=litw5UqBxG0ZhRvBeKi8Xneakos
	RWhoavfrYwJFmWR9flDoXRGP/qBaZiNW0bJlr1QPAKlU6wpCPsOrzyruH9xMzldo
	P1iKtCJ1/VjRvrCIUw8kEy0Af+EhYbN3EsFACD0xDun8k5wH4AKv5ufW/axjTtDl
	NsE5Z71vi1Bfj5mJAmtjQbvR6oKzk3ji/GVdWwiacxrsKCJ8c1FdYcVQQsBAVO5F
	kURf6+S2BajGnfrwFdvs+WGHPuCWnf3oNiHUYAZInG/gcaB4DyzOsRo+XpemeTkI
	UsLL70HsctRQY+N4rgB07OVS0DRJPmWkTkd5PEPGLo3jnPK4JQB4JWlwa2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff3h9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so127518565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875087; x=1780479887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj1QzDzphztjGQH1qzVf1DDT5t16Ki1MCYgce32K7mA=;
        b=N8K2l2dg/hrnd8iegLPsqPN43mplIIJkmO57+DNJ9wwU+ng8mZ87pX96uiMAhG3s0T
         wzf52e6/FrP6gGt+9+CYENflROwxFXQOATKLRbdYWdUNnH54xdWgnKGXwxvv89+ZMvfD
         /sRKmrFL1dbbYuTRZ3LiXkWWJU4ie+pCxrBUTdVXjcm0WCc69TPWPlO15D8MQNRNazzX
         u+RjjfWlT7yXjevdPISSK5yup60cpHaHqZaqyVQ/V8TG7jH+Q06/C1o9m54WpHFLgUTM
         MNjS+G2To6YBo/hFE2Ss0lnhEcEj1crJL84wUKFzv+WQo5CuhEsPCKF5rqmrvk5txEjm
         AjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875087; x=1780479887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aj1QzDzphztjGQH1qzVf1DDT5t16Ki1MCYgce32K7mA=;
        b=gNHaUQlxxB7jMsPI8hNFVdt/y26zbt4enSqOgo4h7/a8IhJwXWiVdvKqRDYBjxRCjF
         8rXKiBsJRIzaGIi98RnvAniXUCXj0TK0O+qHPldFsKMaGzzjlKRBYAb0Gzk2YtU5nhQF
         7JOXFYZoT+MxUy0hBcG8za1mVdbCFGryoKpK158WONvbD0mVglS1hrKjJIo178XQXBJj
         70v3hiMih4Vrkno/tfR/pd6QT/agFyDwXxRrryjPDEams14dzBUu/q7wgfeUUJPJCMGi
         Q+/JAUigUDUPqEMFgQj4KJB0tUQZYB9MyEKxZaDOQuGbJgZlGkhvorrZhx8/r84Q/bxs
         cVJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mMOsFtilBZSz7SrvTVkNb2pFzJxQm90d7oKkO4ztRFPHefBGyX3ttIS0ifL+dWNUj6tILEU0KSIvBx8Dn@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ41WU+IZytrPg77q+ppE6fT7z6AFrhe5wKuPwKA5SJ5ZYRw3v
	UfQOWxWK80YAi+WCTzx9erttoce/tt+J6MRtZ562tI6jg76e+0CApRW+D+9iKinwSFKkH8duCwl
	1qurxvwxHYCkifE1s1XzzyzBKnQhxJW4HfYuLWBKDMqku/5AJ6T3C6fRG9lUvWoQIqrPX
X-Gm-Gg: Acq92OF+IWzQV4fRm9VDnQyhaOy3MkrYBFXGA/IQEJyo1YE4T/5SQfMih5vXdX9TikG
	iMRdp6q3+kfXWuZ0IT0GE+DKBj8WLr9PVHNiqWVi+m9tgqe6yDPT/BSMlQ8mwvyml2J/PQ+BCXV
	yLJcyEGMzjrf9zb1Sb9HViwqzxH29ijGNRrhmpJTq7bKmuq832vLeXZVdiP5xFUhB5NQykMV/wF
	oj7rAV+btYIBT27MwWqxZtxG7ZfMZ2P3tEyfXQY0wJ+0rCPStTj0DImjeGqTAWG5JW7l2mDvWYK
	9Wb3pIJY4M3YmJ2ojd4Wxm97ZthZkgnCx6LI86yxC+peY1K1LxyhHQKhjBoVKfz6wP3I72CWdkg
	Sd84pdSy1JjCPGLq5eCfIdQidpTnKIH4XnIcfgmujuk7ysrHL
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr244336545ad.35.1779875086639;
        Wed, 27 May 2026 02:44:46 -0700 (PDT)
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr244336145ad.35.1779875086096;
        Wed, 27 May 2026 02:44:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 16/24] arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:21 +0530
Message-ID: <20260527094333.2311731-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a16bd0f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=r9b971BMhmv4aBcg7_sA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gBnMM4lStdljS7mD9B0qOR1mS8YT_BlW
X-Proofpoint-GUID: gBnMM4lStdljS7mD9B0qOR1mS8YT_BlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXw3PR9VH9rOPx
 4CFeHPmaDbrpGe+tBD47LLpFbIPyl5v0UGIyNaVJ+HhZnW1RpDlDPgHkskTABN7ld3jZdZQElo8
 I4Vipso9F0EAixpv/OD+djQZjgoUxRGzmM1jkWaGUyA/kShPblP0+oGOh3N045MUc0vZxgKarvg
 9dXURobz8LqiNJKxQ4Y/vdZ+rnxmmhcVINPJBS6fmx7TGEeiWGyQFVrjKZtY2LDkZKwHrAFtusD
 aJ8QEAIIutQWwmd6mfK/YwXqEJ84uYnY99IHKz/K6SOcZZUMVCjELQBeCbxGvFoepnMdBJNr3zM
 W3zsUwM3DhdWz+1eVNMeGWry7B/+tUvzhwo/XY0lgSocg3jL6fDjoVeOPMIro3Ex2JsjPi5g2cL
 K1vrAdrFAaP9q3y/PcPc8OvXhBfXvZhGWCSUX0cOYt62mFsGesbdDcxmXPLOJ6g7KQBn2oxOwK3
 tZyM7NC8nUETsaCtxfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109970-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,af00000:email,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DD7C5E225C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm6350 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..fe1750303f16 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2557,7 +2557,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 655 12>, <138 139 15>;
 			#interrupt-cells = <2>;
-- 
2.53.0


