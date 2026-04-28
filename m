Return-Path: <linux-arm-msm+bounces-105068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BbwaKlkM8WlOcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F194B48B322
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EB60302E309
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05A637EFE2;
	Tue, 28 Apr 2026 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWqx3obr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDLXewgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383C37D12F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405014; cv=none; b=HE+b5RI0XfUnCPWS8lSFH0Xo07sH9C/djOGX8gFfWafjawWX27b0L7zZ3nhtd5o0i/tdoj3fgPO7JNKNHDiyJ0Z+wHvQKMPVP25mNOIzgub6t01x1A6wkCWsc2IY1F1rWb/M3GPcmruUIQNphYs3sxkDW10/j1UHuBVmlnBaOyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405014; c=relaxed/simple;
	bh=ne4VVLXjV6xzidOrW2cPlvN1Ry5ir8/CWCik3UStLf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IeVMoiUo30K0+2b9YdO57EpLK6lbKDZvOgzmhBXs+GoxIidpMSBYG4MjUM3llRnOQ7mQsYAaur9yZzgZCPo8xDIwSEIEVbEwKyrMlWGo0hXRMpxYpsY8RX3ohFQUo1G2Z3yPvLkSH8Wrgb58CHCVk/dFz+VNQX65xUlrJPfcNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWqx3obr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDLXewgd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsIOl3713184
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 19:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RsLwX+L+cRCD05EBR+Q9XC
	f92rcSrGGXzY6p7Oj+JXI=; b=HWqx3obrBS4/FAAYEGuaX/htrGNCTA0UXP2xDH
	qDuc0mhogLoWaV1/+esTz/e1sGCpuXPUsm+tK4SkdqHfCcavMZR1ND+QD5/yAa5p
	od02AGr/bkgHJIhrtINjy93v7ky5O9UOD5uWzt99YFwkYc/3Ku68n8ED+mmAQn4B
	4/q4GYqtQkDMpS27DJA05pAlGLGIPJXOKBSVHeuzomIERiNo9O+AUopnzLlNVVk2
	jqtKnGfGL17KG6CHmbgR7YXJdwdk2l2OeebeJH8rDJSHTPVoMLrDoYXi5/k+oM+4
	sQfBwMaX7ENJTIdbCPqqHWUg4Ndors646y9gmiwqtCXZ15yw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtxb519y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 19:36:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6c90b142so18961837e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777405012; x=1778009812; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsLwX+L+cRCD05EBR+Q9XCf92rcSrGGXzY6p7Oj+JXI=;
        b=IDLXewgdIX0XgwfFK+C9+xyWvawGVljYtrg9vfx4fPDedfJXPcKzvzFrSRJKPKDYf7
         pGoR1qJVjCAUqwOBARUZC6rceYM19XIeCJH+BpSrfyv1xm9HT08roN+MHrt/32nCHvfn
         ExHi/qZgGHCJ0SASAHMpNKcbV+V0Q+wSyr1Ss3IDfJ3pg+WLtntqRnJz0iO6PAjVBVbW
         oeY8ba7aT2XA95rgmXnkUUY8SLh4YWPFQOtO9WJAl2Y8UeTZ1fnutik08H2OS4j7mPRW
         axT3vCNXcmTkD/+wAlP+LxRYZxXM5CR+D+Xf3PALkDKXybt0oIgSz3U02kTh3UP0Hhvq
         Fr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405012; x=1778009812;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsLwX+L+cRCD05EBR+Q9XCf92rcSrGGXzY6p7Oj+JXI=;
        b=f8GAfhLKGxJtScowTLMzQXt9zoGQrWolhnKmheiRraupF3PpfipQCGRg+sY3qJiFAr
         OQeyEI2yXaxywfuhezDs1MULPnQNJqf+fRNW7uZyBeOPwSE807o41kSUlzz48FEc7RdI
         RjmSVPB8MjoC/4JxWC9W4r+9JNPxcphpWpa88JwuuUE4dbqxeRjip6czQ1WIYLH/mLYN
         NIzlBdLan5GRUL5EftFXIwv/C6wtEKSj3iJZbibe1yubqRPiM+CS8vEwwi7qrgf8GNZt
         fAb4MTpkjGOrd6J3bkqIKMYLc8hA+1UZsV+7SP9wX/xwRj39qUYP6E0dL1Uq7yNiF6WY
         9jKg==
X-Forwarded-Encrypted: i=1; AFNElJ/tCMIT6ntUxKFUDz8+lY1Ae2NznEJLtx0yeODb1QWrhI+9NLdF1gBc83uDBuRItGD+oBUsMxd0c5M2cHtU@vger.kernel.org
X-Gm-Message-State: AOJu0YwqbzgyRtF3kpooIYCf63cQd30Cr6z9t/fUZm309QYAS1kKBwNz
	pjFtcxjvQinDNFG1eZD1aQiMO+DvtcTnggAM2o7elCnUvZx5fLXorwQSdNMYiV+SKUusOl6biOp
	zN1o66kQ/VRAFiCVNhcxRwoGEKNMRCk9jd3i5no1O5G1QalLCNWEd/0iWGXmvaT7uY+hw
X-Gm-Gg: AeBDietCFO3dw3VcCjq82rWet6zPPJSeSgxdyUKe7dJk9LNNgPkrOLgjw1cZErKXWeA
	uztHwlmlZ7yyt6s0MrZ86haq0cou6Q3Ad0BL9teGN/kROPrnS/tIUer0AAzvpJTfLeaYHNLZfCO
	UnB8UfYl0HVgrX6rbxU6QS5hcgnqXH9s4/6QF4c4ksTmDZlUPnRK1lzJ+4zicfgsw00r6RQoDTU
	WeK7SW4KtKGG2i0kOJXYMKGgfbYgdaXW9tmt9L4HizK1O146wB8NcxLRLioHvt6HAH/27ScJtyI
	gOjI4tmngUH0qD50Q3JOHHpNdQNcG9J7lt70ydctaVA7lkZftmNJljK//i1CPQqzBLcOZ6BWJQt
	7wMaflZGFAnPTcfW4jogUqJcZaLEtpGSyCdG9icoMA1xXea1n2wQLyKkVVHrAm9pWYCUUZfyrMk
	998BAdGqKzffUWKKIp2cvjFjUeT0/VBxFfrBybsLJa/4A4oA==
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-573a52eea5dmr3151583e0c.0.1777405011671;
        Tue, 28 Apr 2026 12:36:51 -0700 (PDT)
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-573a52eea5dmr3151557e0c.0.1777405011180;
        Tue, 28 Apr 2026 12:36:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924d3541c5sm671971fa.26.2026.04.28.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:36:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:36:49 +0300
Subject: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFAM8WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3WQzYwPdtMwKoHhOqm5qikGioZlhiomBqYESUE9BUSpQDmxedCy
 EX1yalJWaXAIyRKm2FgDkNlPHcQAAAA==
X-Change-ID: 20260428-c630-fix-idle-ed0a161d4050
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ne4VVLXjV6xzidOrW2cPlvN1Ry5ir8/CWCik3UStLf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp8QxRQ0YhXV+fWRnuX98Eu4MOP+QO+f9c6dat1
 +IEr/MOd+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafEMUQAKCRCLPIo+Aiko
 1YqLCACzkMLgefDs9atofJIoqpIBnH8skLO3KcOP0eEdZ5Sj4HB/X//T6uqbeKejdQJzfbzhvME
 9rR5LoYR786CHTN2U/E6r4WowfRUl0olEryMh6XCQFbKKPIGjnT1c8mF1fW2+MdbZqkJGRYQX9r
 I5ACChPA19VjPbmaGHLI95cDbJ/1ANX+c+lMh+miof3UOUYUREXFQgikxhvGWnjkGwHtjLGFiDO
 ZCHxpQBzeeru7BGUnjNLh3D+VB852AysspGOp6BOSNKjx5q/myJpVrfhuJ4RtuQoYNU23UIBUD6
 WNCQ6AHiIvTkYm9lDqTD3CILUkZwS1HKg6bDl29fRvCNKEAd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5MSBTYWx0ZWRfX8r68PoCvPJ0r
 AL2SqN+0nwHQ+WtxVa4zjgk/dhhhx+KUjWF/Fk+Xk8IVrAdFXWgGfBMQ7h5rk04OgCfivR2XZ1d
 Zlv6IuNu+oqd13NPcg4TpBLa0SQ1576xobvF5xSYnbVhQ/w3k9pMPxpNTG8vFJqd8dRSvWHDnoj
 MFny6CWgQdXu9I64EEeHmE+ziW8j2S8HPdQ53I2taSE66dvW6ZBN9CotoCsGfrI3cseHXKl4fYa
 WSVp3NVHm1J0oSJJLz1i9fZWGhxm7RmFwdj6E3r7TGLQtyLX7kS2blHdBI9MK6cMvJD5yr02x7w
 c6eg1ebdGBo74OeiSrfxQ/XmpH8hKBdzQQys88IMYZ1uUim1df27hVqf99XTTVn1iUKHNB6bel1
 6BDvluUZPnaMxRMtO7acrpcz8flMUq/PvSgLU6zWO9ASLpFWrEILlgU57XMGRn1w3dIPq9CLCKt
 sEPacCotQ48dtGubhVA==
X-Proofpoint-ORIG-GUID: -4Zz9F467AsG5Sq_GN1sxAfgPoHv59WJ
X-Proofpoint-GUID: -4Zz9F467AsG5Sq_GN1sxAfgPoHv59WJ
X-Authority-Analysis: v=2.4 cv=A45c+aWG c=1 sm=1 tr=0 ts=69f10c54 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YmaafWwY8Jf1NbXxEVcA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280191
X-Rspamd-Queue-Id: F194B48B322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105068-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

With the default PSCI suspend value for cluster idle state Lenovo Yoga
C630 isn't stable enough. For example it might reset if display device
isn't probed early enough. Drop one of the bits from the PSCI suspend
value to make C630 work in stable way.

Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index e41200839dbe..e6c67016552a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -347,6 +347,10 @@ &cdsp_pas {
 	status = "okay";
 };
 
+&cluster_sleep_0 {
+	arm,psci-suspend-param = <0x41003244>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,

---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260428-c630-fix-idle-ed0a161d4050

Best regards,
--  
With best wishes
Dmitry


