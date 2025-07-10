Return-Path: <linux-arm-msm+bounces-64467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20BB00EEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 00:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66DD25C372F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 22:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD09C29E10D;
	Thu, 10 Jul 2025 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQUg/9GR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBF28F958
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752187560; cv=none; b=aYir646QogQ1sEsZy9E8Y27Nzut9oH1phsYyoRx3/WYwZJKi98kqOGdIETkO3jTzOrREHqXJAh0xaf8nt0kijPH7SBLoT2czWEgiAXqVLl1NMm40E6UDKvL4K0wA7mE4WvxTCHfHR7kxsUFLMDb5vqC0dlKyrvcg5n82HkTd81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752187560; c=relaxed/simple;
	bh=mmbmraD0GVPdhgEJxQAseZnsrJCcvwfGHElQMcTQKT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UTKCl5rvwj2YoivVXW+l5nqJqMVDCIm5NhvFkOMoZqrlAK29WItJrXd1hzRcj3Umtvk2etDsm2G15O7IQ60+2H2mjCKCyeWj68tWzgwZSXC3iCEXqfdhWVGGwa9UT209U1BHKp47BM9ykIzn/sCXvTj9KvB8ZXST3KcP7djOJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQUg/9GR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJRCmL013465
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fafKzIR+UT4s3pdmqSTYy0cRGU3UkuQ70ms
	vu7PcnDU=; b=JQUg/9GRm07HG3V5q5P+htqWOQxUSo2ehvHJNua96cNsaQiYydB
	XkLFUyYaO6kBKEOrxQN1N5t0WEeQOTV0BgOIDCKxE/ynNxqGHKL0WHQNtG8xGGbD
	zAgwLWWtWYHZYUoVTr8YMWt/6kEIIhDSfUXQJ0wQa2r+xyYHsFqcDfIuOJGdpiFn
	ImwodB57eH6CIDDkLxPDRR1wG4NFvjbN6/B9ej5UO/6z5Vkv4KTrq0G4pg6LDdha
	esxEWcecFxSN36Ax1ghZ/9XsEbWbfAZ4e127PhFMIzfLP46OOrKt3Tx05+zxrzg2
	ExSWbbKPeFiX55q7NqaiGWdDE4hQFJ4mlZg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnxkuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:45:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so1175423a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752187557; x=1752792357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fafKzIR+UT4s3pdmqSTYy0cRGU3UkuQ70msvu7PcnDU=;
        b=ttlk5hruTi+2LswHrn8mzByUqnwAl+hEKWrn0vCBylPzm2NdQSMcWKuJNuY0zkPkU8
         Bk5/j+tfSc6Lokma6QQ6ltMyHJzbdqroMxWt0hSufTN+iulWpBhHCvwJ26GRFyTvXYKk
         sO7MuBS7cl+Oi1yBGpkD9THbjvljiIq+5lqCrkSTbdHNILD7dT6d5JCScI/fljcAlE8h
         Gk3uGOtbaRViVqH5HM8p1Isghzl2BCFqju+fLVofMXobywjLWr+ve4GbYCIGhWehA18D
         Ryng8HEB320oNneeMMzso4yoBl6JnnfQkdB7ocyVCqj3WhstYl3EDQ+hE6ik2ImJm45f
         SD3w==
X-Forwarded-Encrypted: i=1; AJvYcCXa/ltUErUPZoypWdD92dvtwl3DnRdA1D0ChCv/QaVpmq9oAJ1f+OCfub0KVqbWM6ZCuAPUuTwtKTUvRJD6@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXmbLhZ76U+8WFpKSRlhYup+ldwspKlRAC7XHqThv6SE7rYNZ
	Y663axQvz/iApFM1FQ75aVvgDx0xYuUWLoZEfv4yBVVAu+QqpFb6lGJQ6VZMkpHtA4oynGZW3LW
	gMNCi0Snol0+iioQk5Sd2OzLf5mCn+vUvzkcpixEuZEAhys4WCqnTNqGAaubMDAMjIpBf
X-Gm-Gg: ASbGnct9NK6LuWoXsFM4jxOye58Raw/I6u+9ENsIl/3lkBcbjKYBpFMx5+FW1TIpjdx
	jYQ6SXlUmwVgJ+tQoIeht38ofC9UKCbt7OjTum1p2Y6DjVMLQkwe4sPHurRSyA8o1UshYgZwY5i
	SKOsIfx5VtliU4z5zeRXfoaIlOiMk1E6mxMwr/+J5oybUV3V725WqcFkcnnKoxRenzYma7Hl5B2
	fAyWso/5pQL3VRQ7HCF9v4onlhzg2dW/oLleRCQIG+k6xmPGKL8AR+7URIgYYoeIQc5uVgkh6tP
	nS3VjdPRWGpw3T7MHNikyt4zoQabZHr28wiHRkBwfPU+YFClcw6Y8GjAhQeZHw+zlYK/KgMSOzo
	+CJdAk4RZLctqEjf+7+/Su4h0cMk=
X-Received: by 2002:a17:902:cec8:b0:234:ef42:5d48 with SMTP id d9443c01a7336-23dee0c6e5dmr11945555ad.38.1752187557256;
        Thu, 10 Jul 2025 15:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Js2zgDvvFTjbOa9Smev8Tav2pVyi97CNSmAdgK0xJNfcRNqNo9js/40yj5slNO+Q0jYhRg==
X-Received: by 2002:a17:902:cec8:b0:234:ef42:5d48 with SMTP id d9443c01a7336-23dee0c6e5dmr11945325ad.38.1752187556816;
        Thu, 10 Jul 2025 15:45:56 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm30479615ad.189.2025.07.10.15.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 15:45:56 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Thu, 10 Jul 2025 15:45:50 -0700
Message-Id: <20250710224555.3047790-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE5MSBTYWx0ZWRfX4vauWZ2kSr7H
 9X9cJfIzd/2shuUQIhjhnlBAbuXmS63+41acAutvmsTi27Eg4jm20vL5oXLMpVv2uJZnNZu3PTj
 VydaI1HiqA3A0ih6FKe5Snr15bT7bGjis/qB957xE9LmJk+Gwqw2YqN3+9rBx57mDE9QE/jYBZn
 UTFzrXDeCRx0Bxmxo+PpdCZ5zUncjwgwmw5hvC8Usg3kUP7b1diEV5sktDUO/MH6Y7QIrAz0qx+
 eQ3yI6Gb+9FPDs64BNpq5jS6O0j9GeKe7/UW1O6sMqDJqMpaH4MX6PxRHpclXZ/FAYjwVTet2om
 /M9mC84Ld7ZbaX7dElyoN1W7pr0/aSCmsQAxdgH3+HA1Lz0AmT91Hr9lwMrPJ+EFJ1o2883jZ+Z
 Tv6cHegK6R0WJuEjGdhccYrnl5a2K3kxTiCRjoBWCBZQe6i5XGKKNqdL3e1WkKbnANIPqKRI
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=687042a6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8
 a=EUspDBNiAAAA:8 a=NNaZUpVlUtzckGV9HeoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-ORIG-GUID: BoFtwxuXnUvxL4P2oC2PwoHIQtVLayw7
X-Proofpoint-GUID: BoFtwxuXnUvxL4P2oC2PwoHIQtVLayw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100191

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)

Changes since v5:
  - Updated variable names to use stage2 instead of s2 in patch 1/5
  - Added overtemp_stage enum for more clarity when reading back specific
    temperature threshold in patch 2/5
  - Updated temp alarm data subtype identification order in patch 4/5
  - link: https://lore.kernel.org/all/20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com/
Changes since v4:
  - Removed the unnecessary thresh member of the qpnp_tm_chip struct in patch 2/5
  - Updated order of logic to limit acquiring and releasing lock within
    qpnp_tm_init() in patch 3/5
  - Fixed misuse of signed vs unsigned integers in patches 4/5 and 5/5
  - Added Dmitry's reviewed-by tag in patch 5/5
  - link: https://lore.kernel.org/all/20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com/
Changes since v3:
  - Updated order of logic and made dig revision a local variable in patch 1/5
  - Updated Locking Logic in patches 3/5, 4/5, 5/5
  - link: https://lore.kernel.org/all/20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
  - Updated function name to include "gen1" in patch 2/5
  - Added Dmitry's reviewed-by tag in patch 2/5
  - link: https://lore.kernel.org/all/20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named
  - link: https://lore.kernel.org/all/20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com/


Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 596 +++++++++++++++++---
 1 file changed, 520 insertions(+), 76 deletions(-)

-- 
2.34.1


