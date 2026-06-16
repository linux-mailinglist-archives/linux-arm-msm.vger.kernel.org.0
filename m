Return-Path: <linux-arm-msm+bounces-113371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +mhCNOglMWrxcgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115768E4F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="i/4zMoXG";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Abn1WvsZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672EB308E52F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D59E42DFF1;
	Tue, 16 Jun 2026 10:27:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C8423A9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605646; cv=none; b=ax+5Ywvb+mI7L3YmfwRxPUVdaRBqb2BllPC1JmxuUKomAveJn7gBfo+OkAav8NoZcsTidor3Ntc3UTsG0OTIt+zEkkClMcYf9xFoqldNX/wARRzuuhQXnqEZdpbF2wPCET+BdUVy536n5YGR8Cw0G/Z/A1AgtmKqEqDGazveuZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605646; c=relaxed/simple;
	bh=0BiABsMcIqBI1ZBbxUAnKxiKhJyWImEILdShyFJoJv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rP6Om7SS8dOekc47NsmrES4R8qD6KwrV8Bh2U5UI7AqfVeudRP1ixSCidlrIwSFGJyAX4B3vWuT515AWEmiww//Rkpd+aVgkHBYYD8ZyCIz6ne/OVJ/8iQJJK5CpC6ug/XBAjHjhNwTL1RD/jc1tNQtDsIXGIU3r5bRDAJA0iWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/4zMoXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Abn1WvsZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9MNC248528
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rULxEUyzUnsDaBJw9I9A03
	k3+81YkekQouBJsqKYP4Y=; b=i/4zMoXGKEx46L3yUpbyE325LWm3Yyz21j7BCE
	oj+tuYFoyjzGj2z7FVQvsFMWmGk5R2hDB1uyCakAKLHDIjpvnvcoC0JCfKseaRKa
	eqzQtvSuyCQqi/O0g2GPgMKHPmCE+fgDdqmyb1v8svTkdOp/fv/WtvcrTUh8hBx7
	sJL7emk+DudpopYIUuTF3opQSolhbPknUdXYxy4KR/A2Jnj5Bpjbg5f4CRb9WN+7
	HPDP6RBdYrVny3EwLbQozjVhb5diymTqU60zRT+dIJcuANRISUePHTtDNXnn1L37
	D9kflFBnMm2K52+m8KdkflklKo5aQuG43VI4K+PP138yIx5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8fst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so40757305ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605641; x=1782210441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rULxEUyzUnsDaBJw9I9A03k3+81YkekQouBJsqKYP4Y=;
        b=Abn1WvsZxwiWN01PKGAhbHDAzbtPgXLr0vHfR8rRK4nE1Ced614HYAQOhOla2J8R4h
         t/7TtDF8Ps37i5gP3z3eT2LA9iYE7MZgVC/VDZoao4yKSNGUNeDdJBPtFbLge7HN1klZ
         SOM0Ld0JlUXFqiuFC9OxpalZFPbYdmWFuMyfGD4BFVVK22UoYmKo9ARpENfDl+NdLOD5
         6g1z6GKfDNZGPe21cMHBztztmZixbTBqc6BmzscrUMSjeW6tn03PWzYcsehiZl26hJoJ
         Z/d0c/6TKeX5+pyB5Z0SWuD03k7oVCwi13vHF7yZ6xmm0GWhlGnsqnvtDdSpZptHOqYN
         gnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605641; x=1782210441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rULxEUyzUnsDaBJw9I9A03k3+81YkekQouBJsqKYP4Y=;
        b=haqtwlLoM5hL1GyT/W0jHIzdJA8TpoB/yAnFt4DOnAP7T41UB+/uHn9aaIQitpkxsG
         Mp1kDaocqb6eP6zwJOIbYF9LVMwoX3wVxmxO12QhcxdK6IL/HvqudcTkRlsjvULVmOuO
         Q5bJ1SIACTFMVzbzPr2YIlpbOIjnpWn0vvAPEB/6BjK1wP2vdFEhALGIjtSOiljf3uJp
         yjt3Q2UmLs7Fc9M0VRWoVTqz6nmaGczz/FBdPQDg5+C5fuzAvD1ukZFuUWl/t+GCsUZq
         2mGPDh3klUvS1iOjrh5StCpJgdUVtRP26h6ARXqBjHvfBfjACrf417ovQLuiT4xERr0z
         vF8w==
X-Gm-Message-State: AOJu0YwwEWLIxO8/F2dXYztEHIuIYAT+aBwqx6NVSK+bZPiJ75JMZbkF
	ndsXo6ArKiwTAG5wZsGYAjSt69tEnTiI8BP51yGxRU+c/QWfgSvkvo4yrI/W2YFk4mAXpNoXmK6
	sIJSSf1HbjWPjmxHB+HPJBTiWTZkJF0bvtbckndW5cUYWYfbIfA4Y4EqWeLPJ9YaBTZqQ
X-Gm-Gg: Acq92OGi7XKISl79jdrxp17Y9uMCn1B8PFUnjKCjtWNg3Vmif8CbTGkPYiwC1o44fhJ
	LsYHb9nNJqV1cNB483lzHYz1rTxCYH70tfJyI38FtBiYxNpeAOTUbmjt/gKmMI6MFMKH/67Z9XG
	mbgw3/4p2yrJIP49+2op9e6BHT/mvmyuKvgiq7ANR5p/G4+pPKCduJK/Et2YT1X04AeCEES3Wq2
	ot/+dT+aRrTORblWEfSZvsNEUDfftR7185Wt4/TzjE2BwcLrTEnf7QkGSlkRRWA2nBUbnZ2Vrbf
	MeLVcVnSbM7EO1y54mSc9JudF/VrTEpuifKxpF+7E3YsBD/AMdp9K7YGoy54js70JZMkG/opywe
	t7up44cwX0yrQKNhOgQ6K9ApaJxMgbH8I8fQq+2IJzGKrzdMngQ==
X-Received: by 2002:a17:903:1a2e:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2c6a172579cmr12723875ad.9.1781605641284;
        Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
X-Received: by 2002:a17:903:1a2e:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2c6a172579cmr12723555ad.9.1781605640855;
        Tue, 16 Jun 2026 03:27:20 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:20 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] purwa: Drop the Hamoa PDC workaround from purwa
Date: Tue, 16 Jun 2026 15:57:12 +0530
Message-Id: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAlMWoC/z2N7WoCMRBFX2XJ70aySUyzSym+h4jMJGONuB9md
 lUQ371ZLYVh4F4u5zwEU07Eoq0eItM1cRr6EvRHJcIR+h+SKZYstNJOudrJcc43kGMMsm68cga
 t19iIsh8zHdL9xdru3plnPFGYFsDfItNlLpLpPRMdMcNL0lZf/44jdAPsi2N/NbKckjZ6qtfKE
 nyuNwPz6jLDOQxdtyrve2EjMMmlSVNb+egiIpJBcDqSAmeocZpIKQsH9NYHTwaC2D2fv0PDCMo
 DAQAA
X-Change-ID: 20260616-purwa-pdc-198063b482b9
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=2511;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=0BiABsMcIqBI1ZBbxUAnKxiKhJyWImEILdShyFJoJv0=;
 b=L4yuECzfyMohqO1bwlQ/62OBzXZp4KJ/gdbtmEMzfO123Z0CjRsAVIO0ilTKixOF5n/Ytrida
 5ARPV11jxgTDirHQmGqBTWGt+sKh+YDOv/OE2uGRZvXzP2MweCCLB7i
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: JmbG3aZvdovbDFrcUieR6zkJCDbDsyuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX2bWQXFwcnEKM
 ZGEnl6pzoX9gb/SyPGSoLDXdmE1e06FmK4TNO8CC+79PFLDrSgpt/XPZKGOqykhoKdlGSvfEokW
 xAwZ1gMQFVUx74nHXaxE1EiNwhkxG8dxE2N7nrroDohhBiOY8SEuSmSk2N0wjbgHyS7lMMbW9LQ
 jE/SWOU/RXD575hx3QAIcX5KT3W2NwnN2DLTfQxAwKdEJivdwJo+D/WDCZ9zCw+c/tCEOZyZgq3
 jP/r2/9y9U9ah9lXKLGoRVrAzdNAXLMe/ZRQR0UqJ/2E2Ti5IznMOpZsBOqR281c+PcWXtphGhO
 6IsL4FsEnIAT9I5xpZNte374kvZwCDOld7ipkzLWnRQb3W6XXCYCalYxLn9JjpP5ov5KoUbgDg3
 3nLydR9oakgLISZLWlKu8NaL2pXQly8Mp+03SrH0R5hyfJOHRI7A7tY/KnWFEMKK9eX4TFw/r6k
 ykRyAtXThzglp++ca6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfXwD/MoxY0Sv/h
 pcnSwiJ5qeBWv4yLmqK/C5Dz3rlVRRG8M8Vbad4pHDCgmQc2r0Zjhxk4vWjY1UBMEs2mtSuxi2T
 K4srVEpZB08mBKeNuE3ddr4guw+GC64=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a312509 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eSlY1-qh9a7HmRHcGJEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JmbG3aZvdovbDFrcUieR6zkJCDbDsyuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113371-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5115768E4F4

Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
added due to hardware register bug mentioned in commit [1] which used
Hamoa/X1E80100 compatible to apply the workaround.

As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
compatible to avoid applying workaround meant for hamoa.

[1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/

---
Changes in v2:
- Remove Fixes tag from bindings
- Rename $subject to use hamoa and purwa name
- Add comment above compatible in devicetree
- Rebase and mark dependency
- Add new change to invoke SMC call for purwa PDC mode setting
- Link to v1: https://lore.kernel.org/r/20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com
---

To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (3):
      dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
      irqchip/qcom-pdc: Add puwra compatible for PDC secondary mode

 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                                  | 5 +++++
 drivers/irqchip/qcom-pdc.c                                           | 3 +++
 3 files changed, 9 insertions(+)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-purwa-pdc-198063b482b9
prerequisite-message-id: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
prerequisite-patch-id: 060eef1520c1c4dd8dac1be913d3a3807e2e4297
prerequisite-patch-id: 8f3baf0a17cf193edc0a3dd072a1e148970d1818
prerequisite-patch-id: 00e0419592d6b43eb8d17bbe2ef24ccf708f15c3
prerequisite-patch-id: e6711f15783ab50499e556618767b3450e2f1367
prerequisite-patch-id: 531aa20d79ee018e28c86567c11ea88f665cb2e5
prerequisite-patch-id: 085301f3a331a482e3f16cdd4b588139cf1f2ae5
prerequisite-patch-id: aa6592f80552d5be8f73cf2068d31f1bc214c923
prerequisite-patch-id: 501c83baa6ed0870e2f535e09b64d7510e261def

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


