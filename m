Return-Path: <linux-arm-msm+bounces-107279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGzgNOdvBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:34:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 381EB53314D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD68A304C7ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8382540DFD9;
	Wed, 13 May 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDrLK7um";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drhHJvpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D541B347
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675637; cv=none; b=BjAIKgKevGSviUV5A0MkIA/Bz8qGxTm7rHYgj/yKw0XGOHtIVc8D51Bl4iOnJLYsoxarPgGOhoRtVGcPsYKqewGCEIDkFOFkK3gDdRyW19zQvC6ckJM1Y+x9E85R6fsH3IurFksMmUSn6od2zqDl80HmyYaBdk/U7j7V48/1lVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675637; c=relaxed/simple;
	bh=EIygU3vCTkwfK3dz5GTNUFb7Hw7qKz71CS++iTBAljs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qi2XFWXQfZ1OkaV6+MCeTunqLdzvCeqC0uJKXBslp6w79cSPV7ikDZ8S3lwWyt6qzjwML4SfS9IzC26rt2Gu+SfFApqgRXktngOKIkWHk1Jz2n8Rd/hZ4CVgte4wtwJKiBlkaBW3C0r+ubR+bR79gUIaAlTOkztaT48eHM2u/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDrLK7um; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drhHJvpC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rIrD4082600
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNnn47QLbPTOUAelEfRJQYjrcBHj/Gefhyt++TJkVL0=; b=RDrLK7umwPf0pgmu
	UR8/uiP+GlVSfU8JiG4EtTSkW8bnDLSN1R9NI8czJMz6FPBb+iTJ7skQO5SQeo3y
	8Nw5XSjaFwX60dmaiNdx4swRj4ehsIgP5dc+CnHWuUFha9l+GD8tpPuZ0+ugZOZ4
	nKEZ8iV8Zo2lLlse106gXIvDIbwXBwiCIBuVLIBBteMDBfk5llzLp+RivVYF8s8a
	BxixtRcDMrcKmFNBt56WVmcPDZXHGD3sc2flkQFC6foDja7CTSrVFpr+MLtbpwvt
	5z1UaPqjoeL+MhX0UoDl0jHrTPDeCl9Qn70gWcHRuxHfdYy+UFL1iz2leqJ7zZ/e
	P/hHCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0s3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:33:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso52243151cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675634; x=1779280434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNnn47QLbPTOUAelEfRJQYjrcBHj/Gefhyt++TJkVL0=;
        b=drhHJvpCueTu3HktwNtLsUjI4VshCfmWqwFOLUFskmyw5vuPzZG1P6+85/RzcGeKp3
         g/HkO45rep1bRky6PiuOoaCEhcIUhn7Rq60eBcWDxqgoBoC4IsHc338hD/8gPwI4UIZq
         oPoKwQRdk7DtzqR1Yr5HhEsYToVYvq8udv80JKwv0P9kc8I/tEqB9jHBZJKAojkE/WvD
         m1+atw/fkjv30jNMWuPlyXBVmYRcExL2kDKoixXLzZQTdwaR/VaLsLO+88J79PFkR30K
         dMs/8OHD29rgsG3BHAkRmHDiG14SjncpKDwgRPyTT+A3XcDGGggE61BNXRQjaYHkL/ri
         1QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675634; x=1779280434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNnn47QLbPTOUAelEfRJQYjrcBHj/Gefhyt++TJkVL0=;
        b=kVjyZrsRhrWC993ghUXnoUSt7OFvdQewgBbIUzfVseimW4WDCJakcJ+Fkc5dMXBltR
         AvosdQNNCKeuhkZ+Vj9vA+9KZcMOu3As3IEBclDwPO3gbgxFwOGR43gJU1hbZNRoFZmW
         ninZ2BDLiPym4DbYIX4cd6RrG2QueHmHCEgXQ2S/H6LDAv1ZzDv06mIxn7/sf8sa4n3r
         7zk34vfEW42HvcxmJnpY1pJpw7sPwnHgXbg9XCGOdTxYOnRs0jEuPFobiKUfz7nA+047
         sbbBdvTbiT0IUOfSLXRVyAlk44IGszf/+xCjQhLn/i1PGAG2q4xlT+hCGBSWlb/jbKSt
         iF7g==
X-Forwarded-Encrypted: i=1; AFNElJ8KmsMn9K7rWMhKYnCoa6Qo9OCK9ySMegVZW2PA6UI11CffMILhkyEr9CN7c0o3wV7Dl1mqaT7HI2a7lQuE@vger.kernel.org
X-Gm-Message-State: AOJu0YwCH8hDyYrj8yD3X05CTbD7B0s7XZV1wniBTibyF7s8JpRAr6oF
	bkN3MEdKseLBbwNIr9N0iPly8yDxKE652BMwF7RZMGVqsNzf4WiMJavS3t2CypI4UCNST9OAUbU
	hCJKZqoEbnDez9ggvoUmgMdb0sImpizjJs7SB2xDP3uycOvXWpQJljDnwJBrKhMb311F5
X-Gm-Gg: Acq92OFGLCjUHu4tguFtAYNipXfxY1IV3mG8Hk65NwCXWs1ZSBT2xhSYeJPLVRCjMFg
	KtRIBgKvGd24q1/HFbEQlaQIqKKRwT4GCJcSu9rv2WPM5xUvkp7MjmnMrXf3VaGh4phDn/RIFMv
	AymympGQoQp9izXFrk4FM5orZ1KFZRvZeNzTzcChsZEd8udjLjuOMng69m/axkxxACeVB8oFNfu
	NSQfKG9Au2Bcz3niqXr3ymT+gEow3b3xpmSFjwj9KVy0nMM23XcEjnxaY/FfRr5DnH/BZYzycmK
	LRUiJRJ+zXyWKyYJep8j/zYe1Al5yk8c5EIeXcsAVcl3F0YSish9CyJjU8dvQifJ5HEV1MnPTM5
	7XaNzOE9Nkgb/YsvP23rlZ3P/cLCSmA==
X-Received: by 2002:a05:622a:1a94:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5162fe99d66mr36488071cf.21.1778675633568;
        Wed, 13 May 2026 05:33:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5162fe99d66mr36487621cf.21.1778675633035;
        Wed, 13 May 2026 05:33:53 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f410d9fsm58873115e9.6.2026.05.13.05.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:33:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:33:41 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: eliza-mtp: Fix the debug UART index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-1-05814d24f4cf@oss.qualcomm.com>
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EIygU3vCTkwfK3dz5GTNUFb7Hw7qKz71CS++iTBAljs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBG+pdDK/3r3A2VDmgT4lHC45hbk/Q3SYQh4Tx
 U9g3NRCZBWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRvqQAKCRAbX0TJAJUV
 VnrSD/0QEhJfq007kGGIoR1eWxcxeRZWe0geUHmdx2xcSxGVvme+oJ/Zf3Nc3m4pRBdr+FhseyC
 iK5+JpNacDo28VfxFcVGxRCsz7CsbuKgMliBV2n53b3DvcinExdpcq4zHFkYsmUV5r3WHRkH+jy
 gLLUzpLIIpaeJaNNV0sVa5j7O/BLckkihTCCqYAtI0MnnwVG+BGO0cXVvsAnNv8wxRngwQRmOWi
 mGRixWVjEWnfhNR6d4b+t7qWDfY93PgiDXRcMPSFjadnLuJhapfyzOrD/y/XzSBqBg4V6gjNWU7
 171Vr4eZ/4CTuLgG8Y4yp++9s0w7qVydupGypKlAs1W3PnlMu9dyNyTbLc7dfO9CqnabCQIp2GX
 TGl0qm18SxHVjvDHndh4tqFWxkYfOl946e4PZDyAppyOrx/uymakY0muamHOUoFTOH7c0JY73Co
 RysnGrZ5QK0HtL8OFumZaTJOBVqRcFHK3x8NvQf+QH2EqZy/SRFPkOUPWu5tQtWD4YO+1z7EIu3
 Mhvceo8++9Wh2t+b2nsPTqZ5WLYBRev2EPmx4LkB5UiJ+EDak35jn2JMopQjcdqo3LhYJ1OvjNj
 VCvFe/YxPuFdWNdC3hgoMRV46wAxB/u6q1SYYXNeqg7jVQbA7MidXgqY7jhvw4t6ECIdv4fMN1x
 ox/86QpuS5pD4HA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Lcror0lrrcdfGwCFZG9l1npgtjoA5z_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX2RmrwkkGqWVI
 SoTIlmXmi/YF+gVt4Tfv2QlrsDL9cd/kWtDln4cRAQhWtCSkEGnRLiyJzdd84TlWRmlVh5F67N1
 153iAfZeZh9GpAzNWjsNN+o+slzcKFViyrpdlSCymrkUD3McHPufGZHwEfBaKGJQQxAPWV7k63G
 eZhpgXOaHy491IYVGLBBooq9l3QpxbCM3NhnJgtJCv1aBqMlm0ekPGnMgYgEJhcokdG4HzuEQi0
 vfILKCKbAbiMl0oAfBAQM4aA0Hsk+/tGgxZS2DAPpBh1+mf7VNbxrVzUJ5HDRPyXhOnXLH3TE58
 jb/ga+wJ3qCvbgvytNARbS26MmFYWOcrxWIlr89q28esvJ7XdhgntGaBb4ZWAJpMgjfrKGG7TEU
 A2TuwdCKqKpdZBgbK/vpC8YZAlYbS2gu4mCTf6JMJ2Jh3vRIV9Qmm7rfFqNiR8GssniDOlHOx+s
 OeUdkgnoHhBUKf5CuJw==
X-Proofpoint-GUID: Lcror0lrrcdfGwCFZG9l1npgtjoA5z_k
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a046fb2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_2YC0VPWfGMhjcoLmTAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 381EB53314D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107279-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,8c0000:email,f100000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.13.164.48:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza MTP debug UART is QUPv3 WRAP2 SE5. The existing DTS labels it
as uart14, but the serial-engine index for this block is actually 13.

Rename the SoC UART label and pinctrl state to uart13 and update the MTP
alias and node reference accordingly.

Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Fixes: 2a5d4fc6f3f7 ("arm64: dts: qcom: eliza: Enable Eliza MTP board support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++--
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 912cfbee552e..1374afd9d14e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -18,7 +18,7 @@ / {
 	chassis-type = "handset";
 
 	aliases {
-		serial0 = &uart14;
+		serial0 = &uart13;
 	};
 
 	chosen {
@@ -506,7 +506,7 @@ mdp_vsync: mdp-vsync-state {
 	};
 };
 
-&uart14 {
+&uart13 {
 	compatible = "qcom,geni-debug-uart";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 0fb153da4dc5..73211b4a17eb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -679,7 +679,7 @@ qupv3_2: geniqup@8c0000 {
 			#size-cells = <2>;
 			ranges;
 
-			uart14: serial@894000 {
+			uart13: serial@894000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00894000 0x0 0x4000>;
 
@@ -695,7 +695,7 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-0 = <&qup_uart13_default>;
 				pinctrl-names = "default";
 
 				status = "disabled";
@@ -2039,7 +2039,7 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 184>;
 			wakeup-parent = <&pdc>;
 
-			qup_uart14_default: qup-uart14-default-state {
+			qup_uart13_default: qup-uart13-default-state {
 				/* TX, RX */
 				pins = "gpio18", "gpio19";
 				function = "qup2_se5";

-- 
2.54.0


