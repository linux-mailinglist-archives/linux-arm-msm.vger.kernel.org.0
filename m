Return-Path: <linux-arm-msm+bounces-117382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gP8gFltCTWrUxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:15:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D071E8C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:15:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jc8dBups;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H0sm6gst;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117382-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117382-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F1E43043511
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E596543C7A9;
	Tue,  7 Jul 2026 18:14:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C443C7AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:14:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448045; cv=none; b=ZnO/FcZvKK296doHajN1Awaj0zEXvQ0cs0vHxJvx2pUNMfSueUFhvmVvlOhS4iLfeGfgGSDah3xnKEx5lrrKjMkYPdDL/IVe2kO/VKdRMrZwzDAQjSZVfVF6VssQN5bhhR+ZI3/Xz3Q2j6Ir+DixIQEAadaz/dm8BqyXcbbhubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448045; c=relaxed/simple;
	bh=BGy/5gEdVT+7XTzhpb4+IvxeTSPEkTOt6XHz/Hi6cY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AMF6+LHXJVzuAY6XiAtshQvnz1LjEuYaLL/4RRTNFXFA7NrMtJYCWCme4H/iMQWpc4I0WPcC3HhBKffw+UY1293he26tb2WzRQBFGidhM09yIlL97PG0fqcQdbwcz2Rt3CNHMU17ZGJ2KNwwO3U9XayiaEikcoiR41WgEpYtHSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jc8dBups; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0sm6gst; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Gxa6K187963
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 18:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1+OqwGRz2H4vukNpCJikeL
	pVYIsHXk9ZwelFw2XK69s=; b=Jc8dBupsMS+EmxX9AK5aMZWOo6OTpKOClntIWC
	Srw3SfH6BgyBOPJB4YM7Aa06Jd4ASCse5VGYMJpb5Odu97dFDYhcqAh2zRP2TfGZ
	U7xqRQrW62/MDYQx7+dRHDWW2RC+9vKZLuIunQfjgsPgs4WWI+8ChpqoEcLsshsj
	z+90EmrIhS0LKhD7ZRIebHFnHqGlhJpet9wdR+Di7DpybDN5gThSvids6ICEU02X
	f/VDyQatSb5uLAizU0EPSe4+KNHMmVZ8u7E+vTlNLI+FSz0iq6E95bxXytzjt1kw
	F4Vlza7MSZGriVHjTm6IC10icdOEmQGyf4CUDeWB6mA8xtDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd0btf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:14:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-383b6012ba4so1535516a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448042; x=1784052842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1+OqwGRz2H4vukNpCJikeLpVYIsHXk9ZwelFw2XK69s=;
        b=H0sm6gst998Z40C5HA8+RdJ7D85gJriq/PHTXb5NKk3BIeAfGFUisDwbSU53qzpOkq
         A2aTiKL7iaBTHSB35nLI+f10zzJ/51FEUdy2rRx49cxbNEltEDsIvw/uiIdqfch3jNJ5
         L4frUBjU6Kx52/fOwbQPhrpXr/phsZNaso7GZOi3TbW4U10LG4ob0GiBlS9+uV5uvo1R
         lv+shFKxfJpkL2X66k+wz3t7ylU/3MZ3y2x2GYeWd/56DMI3jweX/xOuLzk9sU+omoyP
         CqpXSxxfuPxCgUn6A5Z4Ye5bfBKYBofu3f2oRDB4gO8HRymFj4ebE3sma3T6tD2Xoqyi
         7Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448042; x=1784052842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1+OqwGRz2H4vukNpCJikeLpVYIsHXk9ZwelFw2XK69s=;
        b=REosSHC0V7c7YnSU31hV/5J140n1mgW2YI5t8Xt6wG+CnMegtRcu1TQukjDRRkkFBv
         0UEgjy/Eg5b8W3UYvvhqYq8NhNGZTqSvTANNsFUzofR22cExrpzxdeJnMb9d1FKAekcX
         xEIV2BmpF+4wMV0EzwosLCWl3fVvvJwQfTkBazmxRMsyFY/pUjvAjFuERL47rEmtqT7m
         wsE6iSqbU/xYQj2/eSPBJjQtira1JEX1PlorRho5oN7hjfoaLbS1SBG5S3kKkfJQs1Ob
         fJaa89j6KA6DI11bgkEWqHjuQxg+1Hdqkjl3HyVAw6J2rixJp+0JkPTI4yHrLUlsKWsC
         0I9g==
X-Gm-Message-State: AOJu0YzH35aSBEWYAB4AC0l/QvApHKVF3kfS14oATGEWIEvCcfQ92h87
	W50ztQmz3Fshom+4tDbg10JruDfDDAGWC2Vx34rWaByROQBZdhgu+/ATh9Fuh1UlmhmSECcru0d
	xQpSANdqCRSMBAEmBtJfrlFUVJt3HcEg+bIGoDmWePM5VBF/LkBdW90yCXiwAqLLVoT+z
X-Gm-Gg: AfdE7cnH4dTvYttW3R2dB2xbKOsLhrWWD5BU3YFBUuTgbmVryOlYKx/UOFlcoPC1Woy
	fxAnxTAdgGZjC0nejdyzytDm8sprm/59qx9rCtJyxS16qrYzZn/Nis+I3V2NLwzXhO1yaBEf0nn
	9lXaiCA+MqTV1Ea9nukcL/vB/gkAWzvYpLJo6K+wc1I360FOQ8PG+SiKqYq+UwM1r55xPSQRuet
	85UXp+h/s5AtaMzm/bSzybL4kvVb8O6ywdneco8yija+zlJJGR40C8lV7kJgKg8AEYR3gt5Pcem
	xav2k7yWk0s5va4whcJI/wq6xsorMKQlwOaP0QQll8gEAyU4864Y3I1BiCu8HAMotCI0sKHIyA3
	0GM2qwzXIgLv6PFKntkVmxyXA9fvvz/+LZRbYzDsm1A==
X-Received: by 2002:a17:90b:3c45:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38755f379admr6287854a91.15.1783448042223;
        Tue, 07 Jul 2026 11:14:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38755f379admr6287805a91.15.1783448041698;
        Tue, 07 Jul 2026 11:14:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Tue, 07 Jul 2026 23:43:09 +0530
Message-Id: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVBTWoC/0XMWwqDMBCF4a1InhvIGE2iWykiyWTaDvXSqpWCu
 PdapfTxP3C+RYw0MI2iTBYx0Mwj990WcEoE3nx3Jclxa5Gq1CirrGw9N1zPHKlHlDGoaIiKDIM
 V2+cx0IXfu3eujh7o+drY6Rj/apnspoGfyR1P7Jsamx7vEi2lIcu1ik6VM3zx4EeS2LctT2WSo
 9UYi4tyUCBglpG2mnT0IRinwQWIBB5SUa3rBxaYlcbmAAAA
X-Change-ID: 20260707-maili_videocc-db0d6ee94cb7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX4UKp/giSnFFR
 DUWzRm7DkDHEbKQkxt58xqX5T2cxOVAkmfJIxTasaiul95ZaWTUcF6XUMSfgE143zTbwiFOh6YG
 CUojHIYed1/s3oaRulJhNBUQU4m427Peti7bZqlv9jao0RZk6tgitb3cyFMBnnPzH4fUGkqtpyw
 Gg9WLeIDCvpzRSnbGevIB2LURVOYO9EZPI7wZpEgOAaujdqbdhnG5GEW6nFA6sViKDPsLDOHMuA
 CK47LroaHfNhSsMSXCBbzBfMz8zT/7T0zV73hPpujjcclheyfui0Tqn6huGYtLu2hu7VoPJrfFA
 8U2stL3ItMfiaPAUjTPo/XzYXdvgTpjYLld13vNenaYa08St/FdVWeNada8oelIDr1Q31lkL/pY
 b559bFo5WiddWUI/3zO7WJetMCraBcqBhb3h0adrVDmCS/CPG2eeqRgETwdtmjXPTUB2lGSP2l/
 OmlD21ER1sjyilb/m7g==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d41eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpIYuPf6sbHbxCr7fwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cuUH6o6uwxCylkNw2aL8jhE-K0noKKVz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXztqQP5g9nBnc
 e4PAAlaJL0XW3km+LBTHblcwelYIOJzKO1D4UdGxgdjVp6aWuSZ2sbeos1nZyPwKTAsVjVSPRzW
 caXyX7EtFTrhu12NEB7X1XmB1UyIIYs=
X-Proofpoint-GUID: cuUH6o6uwxCylkNw2aL8jhE-K0noKKVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117382-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E73D071E8C3

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  49 ++
 5 files changed, 723 insertions(+)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v1
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: df7cc303a60331fa30c828cf5c68d76a1b0819e9
prerequisite-patch-id: 9139ea0ed0cb5e61cd45ac1e490596102e57a38c
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


