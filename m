Return-Path: <linux-arm-msm+bounces-116680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7JMxCDxtS2rZRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884470E52F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ltw/ycGj";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AEFp1e5l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116680-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116680-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B09243020D5E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA2D3DDDB0;
	Mon,  6 Jul 2026 08:15:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790D3E44EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325723; cv=none; b=MUh5kFNdN+c8cJX1At8I53A92WpKhBSBYpowFYsD7DSSc6VbMzau9SKAj5Y8SGPoLFAkge8whpyjPlAwZHhJnI8l22OoIeTFOGJZt8SwXaKEiSEtxNKJiPeFio22MtT1eq2WFPZyXGrMO9HTzwHW3ivDydim36PkfKwDAMVZDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325723; c=relaxed/simple;
	bh=RNJIaocZYsVAyi9K44GDvBfuC55YSi0vUGWPt8ppen0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D81Zoha9wVwnYUtqzAXYW3xsvZsX2RCHEThaS+HQw5ziOgiSb1msnjWL7D0Vtz8GuPcVeWZTiRJPLji1xv6105h0bD2koaiI2v3aTdtbkpmSC8KWav38beMm9LqKjojPBkO7YOcKhz4N/OMroEJ9sA5Ac1ssJB3TJCgTMmtJdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltw/ycGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEFp1e5l; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641U3k3470469
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zNW0xFIonHoxP9CiO/pPyT
	lRjfRihWd8KfgBFkWrZRg=; b=ltw/ycGj6/CbJcfap2Pa9jgnEf8tKpeQszceMS
	8Yq7/66cRbtMtmoPCf0QVLA86NRLTWDwSkcqngPiyPTZvIpHdNp6ejdIiapX7QWq
	bkFEOg7bv1x+iKUwboXicsEOdFN8qrPvhhRu8m9hQBtk/tTcYn3VoEh1NBJpgn4f
	G6f5Egih+rokwp0pkPKORaxnJnB8OFqd9d4iD2RsfCgUlvg/Gl4oXIHlV/aOr904
	e2sr4WnoQ7MRW3d1GpFZF9Bq9gRJL2HveuDoWa6MhjpSvVjjzpDfJpPkzvzL5ORY
	W0iwFV6Hntk10fureFA0e5GXr2CIV00zK+leTSCRjT3mRKIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen3m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:15:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so2857985b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783325715; x=1783930515; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNW0xFIonHoxP9CiO/pPyTlRjfRihWd8KfgBFkWrZRg=;
        b=AEFp1e5lcjyAmSveGrGO053YsrpIC27Vn7/IEnS4jID55iAkqZ4kNprusj0A4hCvNo
         0FHTnLQKgmYppXaAu9vdz8aFjOqB1aSPsa1IH/rgBP6qIlH0VXg+LWqyVNmXL/AOUeEl
         +aK48y92lJNqEdMhRFjZVJw3/6rAyJG+AgTE5OJXOWOONFVHoYyo1yEbfBq49NMAwcvj
         Y98lBSRL7bL3iVLRQOIcJorszCic2lLWsL6vjmIXysPSQhBPFlAecbbfOQlN3cuiLDlN
         dGmgc4fo3zlssk6OCwG9evBPChkxmNA/MwoeVY4ew1hvBlW84JTpnLcacb6f0hmj8B6t
         NJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325715; x=1783930515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNW0xFIonHoxP9CiO/pPyTlRjfRihWd8KfgBFkWrZRg=;
        b=dsEPH9zczT/m0MnK8GuhT2fTVm1SUHrmjb93Gy1OUPPAiWDn/rrxrmQbUkg+349TQn
         hqBetQLufb3eKls9fjvwEVIjtflXN5BOpnCYO6KND75u4Fn6Q+5m2itxx0bEhOQ23Kbn
         onyIaa0Z9461BrOJKkJNVETY4eUlFzyIp5o26ve3rD0gittM/dsDNPCeMmuozsVOBiYa
         nDXFTA1HNP/2Shr01DwKrri9CeK8ThlD782ATVYADo2sS8lNEEMIvM4ZKfmM0xc4X5s5
         TGgRdgoWtkNiBMcJzpTH26xWWTiIrBMAkQ2WYUFi+jBfveMxLp5zBHAuUq8gH1hjhnEK
         fRHA==
X-Gm-Message-State: AOJu0Ywp+yTu6/mfQBabOrBdKtF75mQrkO7gqWH78X+C3i3KeCs/3JgC
	gqp9yLqgYljcfbKZofgM8XvVUBIhnn2BHEfUdC11IYKDXbXtjh6PKOq8Objjzl9Eos5nHaZKKB1
	wZveWHbbkzE/Jeldbctf6u3eHxMBz2PUoVs7fRkv4GJJi21OFEzBUlso2xQpdez9kcwIK
X-Gm-Gg: AfdE7cmGULScXyk+1InM0s9yx0iGK001qQ9ORKlbS8IPulDCrPAb/I96xp7AOPPLiXE
	SQ3Fsqw5UEVu6urz6jn53883mhF+YhtDJtuYeDJ+YDpe2FUiPIDlokw9YqKT2HI741oP7MqcEKp
	7GPLOQo30TuKjjr467qmapiZOYgSSNFlaQCOJKbhF9JtIqlHye9huxOo329QJyoQSPd3augzTBb
	86PIk/kE/FMZAQfyAn1p7CTGI3S/l7iQISlamgue88SzsluNlM7Pv8ojRwTF6gtt3dZDGMnkCVH
	cu2zlmqmhAOOiFrdHQTwP21GvC69dob488KAkNQQ4kzRFlXzK0DhS4jnhLEgyKS57h4XLfJG7wA
	Hx8fQaKI37paC3j3RQkCC7EpsKHKWPEjYo2ASMgU9jk0=
X-Received: by 2002:a05:6a00:3686:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-847f6dfde0bmr7953140b3a.25.1783325715373;
        Mon, 06 Jul 2026 01:15:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-847f6dfde0bmr7953100b3a.25.1783325714598;
        Mon, 06 Jul 2026 01:15:14 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f4cd4b1sm5584525a12.12.2026.07.06.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:15:13 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal
 monitor support
Date: Mon, 06 Jul 2026 13:44:34 +0530
Message-Id: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtjS2oC/3WNQQ6CMBREr0K6tqRtbEVX3sOw+IUC31iL/dBoC
 He34NrNJC+ZebMwchEdsUuxsOgSEoZnBnUoWDPAs3cc28xMCWWEEZLT6JF72/M2YnKR60oBWA1
 gwLC8GqPr8L0bb/WPabZ310ybZmsMSFOIn/0yya33354kF9weq7OyWoM8dddAVL5meDTB+zIHq
 9d1/QKKGIYcxwAAAA==
X-Change-ID: 20260601-spmi-mbg-driver-582aab5aa6a6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX3bQSr13VR2AW
 4gJsG9ydcRfjtJ7pgNBpekP+uIazkfC9Z+x05PLinV0gQn7nq3DoVLkJVjZH+qG2ubQ+5nq2sv/
 trijsHY9Fqe0tICOLM732474YawIUNY=
X-Proofpoint-GUID: EGyKamS5aBZ6Id3xwW3c_UufyGWeFYNa
X-Proofpoint-ORIG-GUID: EGyKamS5aBZ6Id3xwW3c_UufyGWeFYNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfXzMjONOSIUNWr
 ZzjWzBVvDquGLPMwX8QGlwQd3RB30nufeGHCh/n3rrsWe51+nh2wuDaBT09RzihDK0VsSvmW3tG
 qlvaI0cws4O10FBwwLjhy5ubzQmb6ALNjv/8lXBKLpuL6M24Mc/3AA4YF815D1/Lwn9ML4fAzU1
 rSvUsSeGychEzIgl6MVZzVW2RPVgOm0YNkQ3+TCn32J90FWQPPlbjALDr/kjY18WUeV43wW4/q3
 0ib2LPO5DbaSO4utE7iISTXOrZzJJwepK6txsW4TX5uHFRJNInmQLruYRB5bIK8YlCkFLrvFodi
 PgdZmyX3aM+xXbp2lTz7u41aPDsZxNVnBHfB3fjcT44tYYD59eUSJ6LCtSGqdSZ52Cu57bULXRE
 M+DMgZ9FjMS5OsTqrkiTrwPsrYAbcLbA3tiGYCh2GgKTeRfBAtpwfAuQ+KaZeFidAFXTccY47uF
 lsawuRR0lVHpVoGJikQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6414 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iUTBZumk_BVKSr9I0GoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116680-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:sachin.gupta@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,vger.kernel.org:from_smtp,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6884470E52F

This series adds support for Qualcomm MBG thermal monitoring.

Adding support for:
- DT bindings for the MBG thermal monitor peripheral on PM8775
- A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
 
The driver monitors die temperature alarms, handles the MBG interrupt on
upper-threshold violation, reads the fault status, and reports events to the
thermal framework.
 
RFC patch:
https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/
 

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Changes in v2:
- Fix locking, -ERANGE, enum check, and flag race. [Sashiko AI]
- Rewrap commit text, rename binding file to match compatible. [Krzysztof] 
- Drop redundant comment, return -ERANGE, fix ISR locking. [Konrad]
- Link to v1: https://patch.msgid.link/20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
      thermal: qcom: Add support for Qualcomm MBG thermal monitoring

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       |  72 ++++++
 drivers/thermal/qcom/Kconfig                       |  11 +
 drivers/thermal/qcom/Makefile                      |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c            | 256 +++++++++++++++++++++
 5 files changed, 344 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260601-spmi-mbg-driver-582aab5aa6a6

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>


