Return-Path: <linux-arm-msm+bounces-104336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O2hMqYf6mntuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:33:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E3452FF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16214307EB46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDBD3F1640;
	Thu, 23 Apr 2026 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ha2f6MxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBMAzQa1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1A93F0AB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950748; cv=none; b=ATeBc4ZfIZ/BRPyNwVmm0nMOHalXbEesq+G3O+TXezKH+6Hrsv/U8zHtdBZGTPhr397j9HwWtokdps2ieMDdlnO2taQWManwHgXJ/37YCaKN+5dWabn2oXeFYItbmHzCtRYp0zTx0BV1NSP+HiztBA2haE9+1FMzTKTo+GTiMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950748; c=relaxed/simple;
	bh=mhFWDjcQIlaFOUDhsBU+7/btI9eHrJel0pVml7G0csI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YgaD7TNjjy+f7zDENAaGCA2t+PUJGpdcD4GRi5o2hiWCxtArHgRpd7p/IkfNmCIMIEJbmB8oNnj8WbalPunGL6yswQnamSJslbrcJTrVhVUunw6XhZLHuG7JbvUYlEK4L6QeoN4dCO5FkIAqk9tHN3/GvYWToi2CqWwaULgLYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ha2f6MxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBMAzQa1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNTt1565804
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t5PtXP2uc5cR+cffqPRMLt
	M49KDHVnt86V5Mw48FhQ0=; b=Ha2f6MxKPMf0GmVGSQvi7Ob6/0WDbNVZHUD7D4
	WI8mo+ZK3xUt01S1M0ihjjCMFPYnwVfwkmCnAzrdDqErA9mwvNI5yWMY7Nhcoavv
	tX6XZ77T0V0GWTpWNydGwlWpNsgDiyMxXFvuTxzVG33qmehczkQsxgMtTM7dCWNG
	sp9LpkIo1CtzBNiKAfysFvl3j8FFjVVjWKfgYEacFV4BvAcha/mCOoFZy/N0N8JY
	mrW9q54KB7pq99jkZy878bKfAV+ofqRI6WJLvP+7kzWQcZLToy+xGUFbtOw0lhea
	TbBKvb4kLmchlL97fpiDss+eYyNbyIKLR8s3KB5lvgzCQp3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wv703-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:25:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso7967827a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776950745; x=1777555545; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5PtXP2uc5cR+cffqPRMLtM49KDHVnt86V5Mw48FhQ0=;
        b=QBMAzQa1CXol7HZA884aankYZ30qqabrTlNaX/WotxwCg1YjTB57vYVtBCfo9S5REL
         IvD4zypyBM1irSsW12C8gY/lBLbazLhJVezFQO8FXKjMAN9pYMmQktgsYX+eJxY2/GLZ
         4tkQa3+FicR9gbCsR1vriWILfAloUNUHmeu2d5hbNx+QsvNX3HWI6DrKjShWwsWzOSNw
         RjvRhw56GvFkvWk0Nw5uqrCcnoVRvYFlkY2ejBUYEcBLGzEgLqOWIt2QhOsFj2j+UPDD
         1PzIfqL/WJYQd0l4SCkJi9sYCDxL3hCL6/Y0hYyzCEeuPPTScVJA2K8IzHQZGqC5YIPx
         I0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776950745; x=1777555545;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5PtXP2uc5cR+cffqPRMLtM49KDHVnt86V5Mw48FhQ0=;
        b=XKIG9MANxjjRW6kseUH5/QLvXXcDH9X+BjD2rhzWx0hxlwCclK9e/rxlCMdqLcl7+6
         1raJpl6AvRYXr4nvLOVZSKNYOUXrc2qRdQRXKhN+bTBTCNU/ueBvlZ7CpMtf9G2ayyOj
         8Od/xllSipiI0psuNZzG1SnwI6q6r8BD6iupR5jmTfMnSr6xXj26x5LBVhe6xi3NsSEr
         RKR2EvGy4h9ax8Nzwkwd/f4ZeCeP9ZDIPoeCZA2dkR7S5SpgAK4yncs7/zbSyYZeBoX4
         49GH8cnp6m4KywlSbZB1N/rmahC1ce5nB0y+AcSVcPunm9q8bifHbiROGTwTfVdubTdl
         ielw==
X-Gm-Message-State: AOJu0YwJ7nU82dgOR2awSh5xhimOourXf1RGyZtshFmURK5XYYg9Ps3v
	Zzesb4cAqin4oWDeiZV6Nk4XGUtxeFOpgalKe0w81E5NN4V/FWyVDD7Bp7MvqwUlkCqybvSduE/
	657yu8KdZxfGIwWDCHklifGiX6/yl9xkwtRoG2vKKZnlCoXtLlRPdOOKSyqTBJvIu71G8
X-Gm-Gg: AeBDies0ZnmmMOZYiHkmhQN2UrWm+deCl6r0zuZxc4TN0AFFw9qFMFKLJnEYHYkr3Jm
	NrXf7Dj1Ke9KGpL2pkO0h2tslcOTGUvHOyTCvBaZd6gt8MC5HbJ/Re4ofia8syM/dKZucui+ery
	xKIl+zu3cWq7so0p5oqqezjW2lrjW/Rhy3QEZrGsbqIp2HrMpx2p0NcZnh1DWyiS04STrPKy0VY
	hE4ruOJ1y7T7Tj6o+3xV1aqUXREyMtgq7tXtSi5BjnUbceTHC4hBXgyuoyAusk/YA0ysflH0uHk
	jyBIHNgHyIhFx34D61ljv0WlqlQqwSv7X/29lYpxY27YcKdDs9g2LnZBWy76c2qLv5qW68/3rVz
	Hewvqh8RGYKYil78iBLvfqLUnY1yUW/BAxKv9N4HQOw79SEhno2wy7gSbsO5XmejA5A==
X-Received: by 2002:a05:6a20:4306:b0:39b:c79d:2336 with SMTP id adf61e73a8af0-3a08d89fb6dmr29537160637.27.1776950745222;
        Thu, 23 Apr 2026 06:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:39b:c79d:2336 with SMTP id adf61e73a8af0-3a08d89fb6dmr29537106637.27.1776950744586;
        Thu, 23 Apr 2026 06:25:44 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770587c1sm15647276a12.32.2026.04.23.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:25:44 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:55:31 +0530
Subject: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMod6mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNj3ey8gviivHTdVNMU4zSDFIMkEwtDJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tABBnN5ZrAAAA
X-Change-ID: 20260423-knp_rng-e5d3f0d0b481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX3BsyK6BwRD/7
 Q9Wg881a0tbrg9kVObLCq4th3BqYfveMwK06xXUf7w+WxFCaTPNv3OrzEn51Szag83HZR6/xliJ
 KlYVXkC7l7fgziQBm7+t/cAggNZDDW4kbJvGDh+5AdOh+O0ZF/SGY+3scF2p9VAinPDE3RiGgYs
 JwlgwM55vC+elWeVstxzZzPlWFS27UgvMvFz/CEVsmgZZqxVC+WGKtM7dxVW/SJLsGeMF61vX7V
 nMkth8NpCAdRDCw2uhjQ1sXmNU1C33wJi7QqCE+3gi3dx8C5fPNQTXiE38jFkNX6vIzelWhmHcM
 GogjiH6osJMjN7ir8ItHchTHok28cuhgSTioXGFVG+MA3TC71tAaOri+ioZ5IYIWWgm2eG265os
 tSJ02cXXBT5eEm9/ZF01ETXy5KFTDjn1+K4+arp7k0aT+HDVH7UstQifJM09ySmc66Z9fc+/WfD
 rrhrX2RLpPULPvAddyA==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea1dda cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wRMDb1tyTjY7daH1K8wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lJ69hVLVvhflFJE6wnV0_thMdw6wdm_6
X-Proofpoint-ORIG-GUID: lJ69hVLVvhflFJE6wnV0_thMdw6wdm_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_FROM(0.00)[bounces-104336-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,10c3000:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.16.224.80:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A2E3452FF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the kaanpali nodes for the True Random Number Generator (TRNG).

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Tested-on: kaanapali-mtp

Testing:
- Boot the board and verify qcom_rng driver probe success.
- Validated rngtest utils

Steps followed:
- cat /sys/class/misc/hw_random/rng_available
- echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
- cat /sys/class/misc/hw_random/rng_current
- cat /dev/random | rngtest -c 1000
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..9dafd5518c0f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1513,6 +1513,11 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,kaanapali-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
 		ipcc: mailbox@1106000 {
 			compatible = "qcom,kaanapali-ipcc", "qcom,ipcc";
 			reg = <0x0 0x01106000 0x0 0x1000>;

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260423-knp_rng-e5d3f0d0b481

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


