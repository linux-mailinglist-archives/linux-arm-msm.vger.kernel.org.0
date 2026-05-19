Return-Path: <linux-arm-msm+bounces-108593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNvSMCy1DGrClAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:08:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF00584064
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5629130AAABB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D25C3DB30B;
	Tue, 19 May 2026 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6eaQ+Nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/NA7Xjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77CF31F99D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217522; cv=none; b=uXQ1irzNH3LnrxvjvwCxu2rpKprR2Id4JPIQxiWHcQEL6BcA8IFI6j8zLqCPVbRzujmbb2rYn6v//5NgGGO/GkU/tCuW/4b+ulyxChmL2nJgbFfcdnAfH7JLWQ+DeQf5bYT+US/C0wKc1IRRFSvHML6mFKuClGeVRVRg7Kdf+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217522; c=relaxed/simple;
	bh=C7CEQQmP96TDGF4BbZh1KMNko2GsC/BByDb8SSpMAfQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjtU8Y7n33L1Y57idglIwLALP0AvwIK9UqWffSSciIIKbrhWoPbhKf1J3XBOPIHiZ7oCNBIvwL6/A3IytvL2DVk9BXvrxbas8KXR27RYC2V87Hl3Pmhkz9WPlEEP+sj5ac/GO/xvp8H0gD8bJYhd5nSd9DOpeLm26HTpy2z04g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6eaQ+Nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/NA7Xjh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwtmm1637265
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RUqLYjoGgo9u1VxAsNMCJ+
	wtmEWsxHGuTN8oZtSL/ys=; b=B6eaQ+Nt3nMmwKbGMPEjXSBdX461FzNxSm1Evc
	ydkbXKuUi/bhKBCEogSZzcgFJfdw+IDK1CDSvz/nQQ9K+NdGcL6TQQ5Qvy8jzbxu
	Bwo9UPwvwQNfQlTe8o/xOjtaqw5/3XZlFgkUjPsApHT3jHWIfJaCLyOy83FNTXNb
	a0QOAqLju+Vn4zMpdQQYavfKtmj8GMM1DCPmERr3yXtYt8xYnWkqhC0ZZHQM7wiL
	uTtwnOwo1oB5fHkINL4H/0QPTdaK65U7jBDi9AURpYy/nvG2VFoSS1uPi1agdFxw
	eRUv05SOpJPZm/ZYm58x45JFKJbNUgS+hT/faIKGU3J/Kz/A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3s931r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:05:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so2066263b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779217519; x=1779822319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUqLYjoGgo9u1VxAsNMCJ+wtmEWsxHGuTN8oZtSL/ys=;
        b=L/NA7XjhmfP7FGvsxsojGBgj9phI+DnceRySFKyOfwm5mDsb7rvP254h+g6UC67JWd
         D2bO4oRyV6HdjVjK2HyhG8tK7NWkaQ9YgbVrzoaNSjjP4/qGd4erE+AyS7/O36w9wVRs
         8tYfGmu//dYlgMHby2cHzLLQhYcTypDse1co1aCz8mK/AEbNbvvK4qo0WNf8OOiDtEqy
         m48ZpURILljDIChhASD8acgexM8EpszmvB/S7A6CW5wzZ3GDNOZ8nJBH5Ui9Nju/viCB
         P57qSWhBVA8zUKCdtljED9uAi4+r/T91U+jy53Ep1JnSI2YOwbxrvYoWKjfmWdPvJOlI
         r2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217519; x=1779822319;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUqLYjoGgo9u1VxAsNMCJ+wtmEWsxHGuTN8oZtSL/ys=;
        b=agC0cMZDjXgqJtjQCbUFZWd4/JThkVii0pgW2+BuHTJFW7Cq9xjuRLw/7mdHOdR4cm
         t33hMFD3GGaD/rIYRTBEESmb95gkLj6LZkqPRi0gVlWYcX6sKi9Kn5yoXNjp52/uZjbT
         PaffMaCCH046HVLew8yF8rGJp6nNofzi8QIqu0KbO2wEfTlNGQOu7IoFwgcGjLhR2muE
         aZ1trY72mLVWPs3irlMtGM37Ghm41QlqT4p1VTeRikpAS58Jjsa3nKjvMsgfYbsi/dl9
         gHWFfhLcNewGrKwnCyXcryR1/LOEAxOiJ6QsYFVvl7WXoLmM2XHkX6j5mJHJa8nw6zID
         5J0A==
X-Gm-Message-State: AOJu0Yxn8hS4E3PeJqrsfiXavD5+ZMtwelNNd8cQ0QBBTsh5Ec1/pz4g
	WXTG28cGQXXYjGVRt3pS9x+sVNASWqWqhdQp8Ek6UGToMppLkeYzmJMQKerfA5uSBYV9wB3qfXI
	FcvswLMRA4ywtitbvArDCiC4Z33TbxvmFo7PPLEkG8XHdJFAggwQ5UsJcpmt54nL6+UWq
X-Gm-Gg: Acq92OGMigc3hZFn5g9/zBxxX98ro3WY7Eb52TLsJBiIH7CyUVENuP+oKaXD8MlD8TA
	5XAAF4tZi39Eeqfu4u0nxlX35BL9DycefFOR6rBdj/icDIviy5kr8ztk+QFDYt9OdGrFBzJmvaT
	GqHoUN2JiFfqqgRuxn3BtXbgAaTXGh8aM+qv9YOL0v2YdfX2zMLwfMnMgKU2+h74hNV/dtB506b
	DIIvlFeHgAvh0hRpfooJFNqzMpMbCa7eaIJ2q/CDdj4uYCOhQK/8oMO8gKmOy1qHqGpsAtlQBeP
	Q72DXNpAHas1O5N/O3bnERiZVXPW/ILKYV1+VxnQfZQAnaJrR2Zf3gAPW4cl2K2PWrRtTi6t14C
	a0Oa2cG21cDv4jBpUDycA2Wiw8PvxXaUX+w4thNpgXxG+q0KlL/NV5AEV9NGrbM0AYM8aXItgmG
	XW1SW7nCeDlrn5TC1dpGVZE8oNBWRFc8PCgWptIuuQHkgbNFNVHS+SVmqM2NFDVA==
X-Received: by 2002:aa7:88cb:0:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-83f33c1f156mr22131373b3a.18.1779217518659;
        Tue, 19 May 2026 12:05:18 -0700 (PDT)
X-Received: by 2002:aa7:88cb:0:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-83f33c1f156mr22131341b3a.18.1779217518166;
        Tue, 19 May 2026 12:05:18 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19794e6esm17423401b3a.25.2026.05.19.12.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:05:17 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CDSP Power Manangement Driver
Date: Wed, 20 May 2026 00:35:08 +0530
Message-Id: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGW0DGoC/x3MQQqAIBBG4avIrBNGIbGuEi2i/mo2KgoVSHdPW
 n6L9yoVZEGhUVXKuKRIDA2mU7SeSzigZWsmy9Zxbwa9biXpFG9kzQAcs/XwhlqQMnZ5/tk0v+8
 HJOgmrlwAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779217514; l=1736;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=C7CEQQmP96TDGF4BbZh1KMNko2GsC/BByDb8SSpMAfQ=;
 b=CAGuwh8fTWjur/IxwwvTeIfB9DykAlHTz8PdHF3tm2yr59mmmCUFjh/N0IG7vsLOclubcIxCv
 rAM5X8nd+sdBVwaKAcXs2sHinBRa7z7qq7NHU29+21Peq9edWC7rwG/
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MCBTYWx0ZWRfX89yla4aNoY7M
 SDvjofn59Q+RDsrRXuxpEyBPslmFTKr253TsmI3VqPQqXpoX+z7pCyNyjzfhry3Zn+4EpZbmfi9
 2nO+q5yhAeCiakASXFrWyj4xBR5MOlb0gIpduaB53+z4uonCuGaKhtYni/MGYNXRdmWpzG7fIne
 Z3jGUQIH49FtI5uHZo78mnma8cVXKYzcS4fRKDN9DMVTVl0kiq7VxAhC7/pXZdlmJPNpWi0DVUF
 gJY1VrYcgUp3c468q7mL9y3Y2MadyZGUgyC9lAzoQpkks5IUTzYu/S52FFsTEOZ7U6vzJ2kXdPB
 9SLvpH9lFDOGIIavU1Dz8bg5+W+8wi2wgv75hDRlQwJ/rq7kR9WVACEa6Y6cArDQb71l0AF6fi8
 +N4+qh6qvUnFF4eK+M8Ofp1gZgxbdAh9w1I7KowdRPKA00b/lJmTdR+p0/G5ejGpo1NWh6Ur4Ko
 r3Z1Ac44vPn3TgN0iJw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0cb46f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4IyOyT_C9-gSaBXp73cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: xCdcSZ1-IAgBgV4z6qLlKebOUCow6SEu
X-Proofpoint-ORIG-GUID: xCdcSZ1-IAgBgV4z6qLlKebOUCow6SEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190190
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108593-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BF00584064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On platforms like IPQ9650, the CDSP subsystem cannot manage its own power
rails and requires the APSS to handle power management on its behalf. Add a
platform driver to fulfill this role.

Handle LPM (Low Power Mode) by executing hardware isolation and restoration
sequences via MPM register programming, coordinated with the NSP Q6 through
a handshake protocol. Support both FULL_PC (CX+MX collapse) and LONG_APCR
(CX-only) modes, detected dynamically at runtime.

Handle DCVS (Dynamic Clock and Voltage Scaling) requests from the NSP Q6
received via a shared SMEM channel. Apply voltages via the regulator
framework and write responses back to SMEM.

Expose virtual cdsp-vdd-cx and cdsp-vdd-mx regulators so that the PAS
remoteproc driver can control the NSP power rails through the standard
regulator framework.

This driver functionally depends on [1] for bringing up the CDSP on
IPQ9650, but there is no compile time dependency.

[1] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t

---
Praveenkumar I (1):
      soc: qcom: Add CDSP power management driver

Vignesh Viswanathan (1):
      dt-bindings: soc: qcom: Document CDSP Power Management

 .../bindings/soc/qcom/qcom,cdsp-power.yaml         |  138 +++
 drivers/soc/qcom/Kconfig                           |   17 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/cdsp_power.c                      | 1065 ++++++++++++++++++++
 4 files changed, 1221 insertions(+)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260519-cdsp-power-0eee60028e81

Best regards,
-- 
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>


