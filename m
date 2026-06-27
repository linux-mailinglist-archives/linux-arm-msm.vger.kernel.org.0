Return-Path: <linux-arm-msm+bounces-114739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ygLsJDcfQGoLcAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 21:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4C6D2859
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 21:06:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="W1ebHLO/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dwVwqOdD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B916300B1AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 19:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DEE347520;
	Sat, 27 Jun 2026 19:06:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304F73446CA
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 19:06:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782587181; cv=none; b=QQ58BoJn4fHyuqsJDkLai4443sZt8wIU/Od2UbkT97HsJyCoKsRcALFS+IorohNuZ+enfyRnMkVQf0BWNVvOgLShpeoQ0zxnjCOSd0HKS0BIwzyVf+lx+SpbmOI5jookU+/6cZdTBUx0t7VIXK/w6AFsf/tL1tb+EwRqfWmmFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782587181; c=relaxed/simple;
	bh=khM8Yp5nAyYnwso19Te0A+KYlarFFg1xfopd2gQ1Pfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntssaxkWLuyR1rhXsiCbatOTMlVwTmGqH/HNeDF08JETpYBDPEXZtEGlMczX151dwv7UBK1/vPRH1rvwRWc6AK7YGsnLn1L38K6d3rvTsv8pJq7+UowojVcW2Fr+OcXGeIb2D3g9ikG92+v0YOqWwMAxv38I4j+/NpXyCu51hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1ebHLO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwVwqOdD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHnhQS1702960
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 19:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiHIy/ks5uS
	xdFF5i/UrFUslo/Ct3YN+jKbE+6ijCVQ=; b=W1ebHLO/L8PA/yEj1474lrWOSyW
	WfcSqEAS9XsapPzEuhGrisKQypR5zUzp5wy6m573RrpM4OkJkv9IrCUf5iMzisM4
	04Z6wSdfo1WeaHrgJ5qQm4j+sW8m4Pfe8sMMG0lIGd6a3fxHlyBTxUZWlT4CMm03
	quI8Vq52n14R0ai0VwYpNl8w6qNanxNILbjU2FqRdIxWLIGzO8hk7mUDLJLL/N9S
	iLugunemiPILNz7Gtvw4IvKdKEepYCcydhMvuvpDjqIi5yRLwe7yjaEJoGgh9mZT
	k2rWdgXgiYyMFcYH9XqdFxs1DLCdy1J5+j4nEERG9YGc0lAR+nSzXZs/0lQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27349h00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 19:06:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-662cdc91615so3419801d50.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782587178; x=1783191978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiHIy/ks5uSxdFF5i/UrFUslo/Ct3YN+jKbE+6ijCVQ=;
        b=dwVwqOdDOU5i42TuWB2MULwJC7gGt1Tf+yVztIeTR/BIZbOOFIdFQtdr6DJj0+w3m8
         xbWJ/+FQ50oso9M79bzlnf6dhHwaAMVfzzzA35Wgv03r5IOESjIuqQnNxFaCTDSsZinV
         u+GO7idBZyYRuVPdpP+ob7jjz9SaaojzElR5agz4OqhrocEVkMfZ+CnhOM132H9Kz+Ze
         UwaBXC/ERWTBk1GKKFRUVgFFyQmstJlv9ep04pz8juW3giHxrCIDvMGupx24uVL0C/9W
         R8pPMa2jtKULktmdswJBoRS28ImnGtnGDIJ/fK5DT+dx6Ur6vDzRjaMsXY+UFHxEdZse
         w/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782587178; x=1783191978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiHIy/ks5uSxdFF5i/UrFUslo/Ct3YN+jKbE+6ijCVQ=;
        b=ZfRZ6W48l8MHGaW+tRyhNcoAttThiigJLODQqA32GvjcDkNF12nNmRk69kOburGopX
         G9NqBG5wCqMjCR1meRDNGeNpxEM2NMHVFAdq+5Nzhp1NqHjtyvWjUN0rIWaQtdoCP2in
         u0C/509KFJQciTomZ5k5HvckoTYBjq8VQtunbwdEq2eqo9S69F4qldbYv64IYg0+xMGx
         1se7BnFX5swRVQVynynsITFdHrOrnvDZB/aRb5jLzW7pcW52KyXrnYMhvbZJjc9mjYnr
         0Yp5NDL0MTdlTczMRQdLwvtbjzq9IZtsXe15+6ofuFCwGxscUjAPC4zBxiBwTJMH8Jlb
         jqWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+gkOm1vHtreB6gPBnOCvMran13iQxu2VWxbcNSD/tbVsREc3DIF5n1rW7lbB350+vdalS2xoNDiGoQUBu@vger.kernel.org
X-Gm-Message-State: AOJu0YzQC2CgcqECjGDOlXiJmqFmhkr1oV2t+t6i1WBqIAHeaqvNs9+U
	nJ6EJqEZpYOLm/yLhv/Cuz0AXNyPzQnOIF1mKI34afEQwIeMEZt7k7RFWsCraS0PjH/9oEXJp22
	SkGTKyY0tR6HnMa29Y0AyyOWUstb81rHG7xfpRelvovRUPdS1Vqrm1p050VLr6xFflEHR
X-Gm-Gg: AfdE7ckNW9aT6MdoMm2vnhHplx+Kt64d95K4DCpGGW6/Bdxr1zhNY+jNNCfrwxUSaRB
	db1VZ8KA1TN3H7uON3chBL6NY9AryLVx0lN2EURb1s1Y5vyJ6dU9lRbpZokHvxdrPFjtQ9h0Swy
	pphhwqneTNptGT4D8swqMFXCT0xjRvG0Cd4ztOJDraM7JHOcwNnylrbLnwpSYjZcBOXFyy5yi/m
	e4crz27DEKumkHzU029KNQT/KllnkVwnCOjJlfEAz1tQaobBpBSnWO2rLelZCNwMGhjUCiSQMip
	E3tFKQbw3ast4PYoWIwrjfA4k1U3fbzSbtoDDOKRDW+5li/l4rxE5NrrJEO2DlAnDcmJQ/lknBA
	x1ODvhBpVxURxoEjhW2R2B0fLyrliX7O7PiiZuBTESh5+yu3OX9zLEcQsdJrMv6mbjs2xrECS0z
	Mcvy2enqsm8o8eq6I0GXKDLXrqymJShg==
X-Received: by 2002:a05:690c:4805:b0:80c:fed7:9cb5 with SMTP id 00721157ae682-80cfed7ade5mr37632817b3.2.1782587178296;
        Sat, 27 Jun 2026 12:06:18 -0700 (PDT)
X-Received: by 2002:a05:690c:4805:b0:80c:fed7:9cb5 with SMTP id 00721157ae682-80cfed7ade5mr37632467b3.2.1782587177897;
        Sat, 27 Jun 2026 12:06:17 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf6248bsm97990427b3.18.2026.06.27.12.06.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 12:06:17 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 12:06:15 -0700
Message-ID: <20260627190615.27291-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4OVuDyuAL1GFrTRacTl7Rv9gFkM0rb3J
X-Proofpoint-ORIG-GUID: 4OVuDyuAL1GFrTRacTl7Rv9gFkM0rb3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfX4tXYrqgGEnL1
 wA/ganyViFt1bNYRfUUBhGi3JH8OQDw3C/GyMMDhnh4BybGx1RykjKlLPjD4utNgFsoybDZhMk1
 puzD87LAVnca2OPC6pT3OtO5UOhT4H4=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a401f2a cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=-S1dkTAofOBTlHLHEW0A:9
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NyBTYWx0ZWRfXx68DlNjw+0zU
 becOngCnYdHt0ZoCCAG/E57JhoFaiofU8CSV/Fc7faJW6OWC4VI4rj3AnLyBjNO8npg1RJ6dfaB
 BHOaCbvlyV9JDgsh0sRIEdQlFbRifNP5285875CmEo479kvQgUPuecMeV5aIU/5cwnxN6jM7JMI
 Gqy0fH/H4ivRCYYVSEzLwl7bOsyZsK63o9ZaW5I+kCpFJvuz2cytR1W5lJ+prqvgaCbMLofhDAd
 5yh7f38GrSP28vYzvK/IPkiaMMz/oyAh+vIBgdIedQQTeGqRW5gef14msJRbBXpxnyscH1SDJad
 suKLPGxFMHQ//gP0vm+GNbF2sa6fT2TLm0ODnOqPO7m8zLAb0wK8Wprdsg9/4TUhlDjZpCQZw7V
 l+XhoTxr/tbluJIN9Ict7yhbsTHFJb8hvr16pbsFyA0Qi44yHTayVGQNCigNbd7Bj7sDXJ1VlPT
 DiL3h5Pa9cqB/CXcFiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32E4C6D2859

On Fri, 26 Jun 2026 13:26:14 +0200, Konrad Dybcio wrote:
> I would assume it's simply not present (as every SMB2370 is a separate
> physical chip) - perhaps we should just add status = "disabled" in the
> DTSI file and enable the nodes on an as-needed basis

Apologies for the duplicate. My earlier copy of this reply went out with a
misconfigured sender identity from a local mail setup issue. Resending it
cleanly.

I'm not sure if the chip is populated, but I tested whether it enumerates.
With smb2370_l enabled, the SID-11 SPMI device (2-0b on the SPMI-2 bus)
fails to probe:

  spmi spmi-2: pmic_arb_check_chnl_status_v1: 0xb 0x104: transaction failed (0x3)
  pmic-spmi 2-0b: probe with driver pmic-spmi failed with error -5

The SPMI PMIC arbiter can't complete a transaction to SID 0xb, so pmic-spmi
can't read it and the eusb2 repeater doesn't bind pmic@b (only pmic@9 and
pmic@a come up). I keep it disabled.

Defaulting that in smb2370.dtsi would touch the shared file instead of just
this board, so I've left the override here for now. The comment in v3 will
be updated to read:

	/*
	 * smb2370.dtsi enables all three repeaters by default; SID-11
	 * (smb2370_l) does not enumerate on this board, so override it back
	 * to disabled.
	 */

Thanks,
Jason

