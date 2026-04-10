Return-Path: <linux-arm-msm+bounces-102742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BbcDx1H2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:53:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B13DBAA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE6A63112C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EA53E51CD;
	Fri, 10 Apr 2026 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyGfNMNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBRj96It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC23E92B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846636; cv=none; b=ujENj5eK/zUVedQ5aAtpmiA2uU9QEs9CdjrwfdQqYVctDR3ZOA+XuR3OSHx4PZMDCxhk+5US/SeFf81an/zLTooozePdD/+MikHsFlGYGr07Sc7dMCITTGsWnLnsapRG5/nAURVBi+ltZrUtM6KPRpdakZ/XVkbq/OO4gcE9VLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846636; c=relaxed/simple;
	bh=81GHWbdftJQSVjIRnWTdMUQnEPyJI753MY760MuIf/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVXPt6DoXGsiT25zkn/EF0gKz1FvLOh2wxmxQThHj22yigqxIk/ICedYCFqhj6eA93v0hMY15Shq50ychV0DPxIudBX0UGI++HKJS9gifR5xSKOWRmbBEQhCjv6kF79N7gWq6zNAmJyHqnx9sYCGqZW08IaYPQ9LOriOYpr4UPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyGfNMNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBRj96It; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHCcS7709170
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P8RBLx+7Ek2
	IiNV3wrOtzMqa61+LguohES6DrcbHrYQ=; b=hyGfNMNqaLAE/A6WDjra/APbnRY
	QbjvU4A0m7MKcoJ+53BetfjG0/ckb6ujEluVYVj6vK5wOADlpxpzWCoLXFiE0ADp
	GwieS7p8KfVS/B7+yfq6Eq/X5y6aQ7FYeelxqJbAlCc+ATmMcX4Pv4caTWqPOtBQ
	V8VPrUwaKRwfT3a75Y+xkAld3eUsO7u2YPVbf7XoSaWhSd90MQIkotRKWlrV4NbV
	IfdKH44EDdJ3FvO6itEDri9cBYFuG1eL23Lkfr+1YjpBvHKpcCHZpo79K5Rtwr8T
	khAi1lm9Col1rJpu2aAjf+KLMXYCR1Sy9fctj3JsBPz0WLjRtnbC0YDPlCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c613194caso1284150b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846634; x=1776451434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8RBLx+7Ek2IiNV3wrOtzMqa61+LguohES6DrcbHrYQ=;
        b=TBRj96Itd1HM5DTrr1QbQi1Id+Km8Kus+F8Kn8D6sQI3OKzFumKXLwWP50HeBhxFQT
         Ndxdtn5XJdxlavVlbUjrS70PixA8nJlV8MGQs/GfRqX5tOw/zLN9YEqDrMf50T60qugP
         KrmfaQSOpOKDLFjXvOVqYqm8hMSAdfz5tE/LPl1k83nCM0kIfboR0wup8Q6GoIcBtQQJ
         GzTDrHynnY6G+DMqbCV7mFMOmRlbvkHGtzm8jh1z3TdTgyFZKo1jkcuaKqdEEVFnzOO4
         SEw1AJmK3oUJPrQdZrygSdNKK9FxC7KFDq7GLWPMAwwlnBUXH5/sB4gjKUNnRCqEYaIR
         OObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846634; x=1776451434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8RBLx+7Ek2IiNV3wrOtzMqa61+LguohES6DrcbHrYQ=;
        b=LJQSL14iysAEY1ySPmzHdttSGoBMHWaNjOpzP9SrnmuSPZfU5Kb5z+K5wnF9oTUpsz
         jWaMrjyL3lymfiJaoaUFz4ZlyFSN1ORPRmEvXcc40ma+7IrxANYZeN0cVlcmP+kA+M/U
         vaKel05sireiGm5SyooVllFTPmg31BNnvBUpB/7emS5yGGVvhas70peShZBuWuN1fzn4
         hUIDr4fUwk9KFSJRbULoz/sXx8F3E3oPewgYDPfGJJw8YZvxk4WLUzFPXS7LwzYqu+Pg
         1Fn6k4Yfm3uI8aE5HgbyQdiwqdGSylNq0e3kKLpdViHaLpL25z6CrMKq8gmfBAY8/t6f
         /n4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZkqsvOYCJK2TMBqiOfMrT+36Grrgns+1+O4309aGnrZuw9K2jTBqOU2gMVmHHGodmj2EN3EW+c8e/ewE@vger.kernel.org
X-Gm-Message-State: AOJu0YzNY0tFLvFyW2ZWkWXsW/3mETMwaBIvvYP+inLTDWS03kXdQ72/
	rHesdujhkPGdVEHdb3DiDxPFojviIkhkbHzVGj8NmUt3ogC4QtCD4ZsEsZABNwqVvoePkbYFPag
	yWVP7GpnbBmQeSzQpBxoniLPJVXcX5SEf6v148Lln0miD0mZLkjoGLJgStjLyvVAq47K8
X-Gm-Gg: AeBDieviNypHXwUnZEstUPSGVkuezGLs+d7Yql69uF/SxeRxLps1Vzxw/6L7EcaUNjE
	GJgDuRjHGjYt0BMnB01OWw39iAjriA7uMXK0qnpY5C5vWAw8+aSOpR1CjHm+hrAqQ4z8rpUOWEy
	moxwk/mxdWWy9OTVdyuOf2jOHls0zfCgROVuLguW6Rkm98lj5GhnBaS+xHNLDAZTvNaF6JlDpus
	zu2rNhhPJdNrniJM5Wv70Iwz9gbcq2xTaJC2Vwgjauph3aBIe4J0izgh3PN6cb7OeCsGuYKx0ip
	Ds5bZnFZNpOLLfGY13u7GO9l4yoSRJtrlMO7VeJoOAiFDIGLzw6PXBzHgeqZgNccnjOMYiAFrNk
	8N9ah4wrHyKKhT6k+hdBkSbSpkqtnpJlC2WQIyRaWCAdZTX/j
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4747092b3a.39.1775846633917;
        Fri, 10 Apr 2026 11:43:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4747062b3a.39.1775846633381;
        Fri, 10 Apr 2026 11:43:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 28/35] arm64: dts: qcom: qdu1000: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:05 +0530
Message-ID: <20260410184124.1068210-29-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: da1ImSvt-dNWveA5wvIRLzuOyFOh80yS
X-Proofpoint-GUID: da1ImSvt-dNWveA5wvIRLzuOyFOh80yS
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX585VyoNFd1yp
 x0/yJRzqggkm6D1pemsO/ARAoJ54TTrfU45WcgdZk6OIZulPJqPagZXTvgdfpTcina0BQGAWpKY
 E8t7MonFXcGX91DLx56GLgMpXZZJ+ed4HbG36TUit4IEXFnSoVXiodydfoOm+cC3ocO175ZOyg9
 6oRkPZnaktzx9Nhst0FabmzOjIiDlQ0fe19s1w/dFfhy6QlpTMGrUB9gn2gPLvx1ZIvfJ31jxex
 nQZQu/VqDYWt3kIpRRCLHO35iWALKzacVW784k+n+cfAQ+so+WxxAD5uPS2dzZ7fkJlszXg83EM
 oO1r9TVsxpicfVj0yU49hiFNPXvofqb05SSbAD+0UtqKcfIANnNUM9auICd8NyihVyyldBKy3UW
 zvQ/t4dV++WDTEkP3HoluYtr40bh33Rt2dUKiRowg1nVmviYo3g/rQOA+SAflbrNY+4SSIlw3H2
 UmN91iegUvq1xHOBOUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102742-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA3B13DBAA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index cdfe40da5d33..4962c27d5d46 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1054,7 +1054,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qdu1000-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0


