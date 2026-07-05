Return-Path: <linux-arm-msm+bounces-116509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LtcCGjwQSmr89wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:05:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BABEA70957A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:05:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VUdwCw0c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fh5hZd5C;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116509-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116509-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 886CD3044215
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6408E367F45;
	Sun,  5 Jul 2026 08:01:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104A369206
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:01:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238486; cv=none; b=MHUeGucoM1v25JvUHqWrHj+50SG3lcqOC3RCSkGiJdsErEdkjQ2TLRwLiqIcT81pni0gnGKWNPuRhxA3cdqxOtUKVo0cmeXu3yi8Px+UUg6cOUStLiBm9EpsfBgOLT3r05GW109WxMwi+iH7RqgsQkbxqVqL3TFQVJA8vtJk9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238486; c=relaxed/simple;
	bh=tmq2w7iFHaSf5G1N9NwNT8S+dyPrAg6brA02Af+BVoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Km+IN4JCu4Uo8g/8xIHiM5iwb6HZq8KsfJ5h4jddxGoyst3NnM6AwyCGRdAMChdvyyDmh62leSgR4f3KBasE1f5KHtDuhRv/e9BqgRgEtwWBFtOGqv4iVae4Vv2Ia2UlKWkQZZYxMjVL3/UG3sLv1QZ39RudjgcsIvMthntmhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUdwCw0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh5hZd5C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655H9bq763184
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=; b=VUdwCw0cILZ8JMr4
	3q2tqSbWj2siraqnE8Gnpv7whpKslc9d6eoRsi+NbHZmhTUdXk+w4NjYYp9dHmcl
	kWeHfhNilPqHWc1uYnY/EqWiA2RCxcx8H9zHxFijKH0xEVPjjdMWp84IcfsHtsQ/
	qRBgwoUpyNkqSl/7A/3mooRXdysh98qMNDe55QMtytTRkG/3uCtLYP0nJZg39dcw
	V4ZTJ6vBLZwUthTvkMP7nH7ryE4RvGTCAqNCLNtj7o+cs6u0GIPaPicWyVyqj35i
	CjZm+Cn+7Q/c0p3+yynKA6Z06hEwlqbdDMyk2VZrMafLUV11hsuLr16B2STe8iql
	ni/eHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnjm97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:01:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1381168a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238483; x=1783843283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=;
        b=fh5hZd5C0z7jgnvq3Glcs1FD3MAFHJE2w2t7R4dI66JecHZXIo8URLLNKnd3vL6IVo
         BWDk91mJtfVdHLCUPFEHPQFbt1ibqrJf/Ww2NrXCsthtyluIknQDRZ6r2JIl+6Woqc7b
         gxuUiqikNzcQ5Scz4AAfrEVCPFlLhefvTKPJjLn93J0lXwg6XaCnZNmhwc4Jr9Qx3Zig
         7pt2XZarvADvnugSL1L9zTH4mLC8fon9v6edzJLu6DMN5XSXtXGNmG24z2xhcHARqqcZ
         pSYQQ1YO41zEXmCStuEoWixuKzAqt4k/1t7b9DmaLidcvp5uOfKnEaPeFXBpkrQHx+c/
         dY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238483; x=1783843283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2tXzOW+S2Yl0q+Uq06qicu2OVLdBJOKKhZnmt9rVFc=;
        b=dOlkPAkzern0+xitQ8aohdYBS993nUZECMEoGibejaEg0ZmSQmDdqvLkxyIKvs1eH1
         /t5npS/oaMguQkX05g44WdXVB1k/VY2spgPjz437s8ChF7Zit4G1+pLv9CaTIXjLZXtg
         6nB3LPHHf2A6QAu64SzBFLvEAQubyZruxoKqCtHiCx7euQGu0HMF5Zqf75Fbz4BU7ZsI
         KVRWxS4HyzFrhavv6W5SaqaBq3VpMGM35ZVCWznMe6iHr/KZqLJzPHiHv0H7WbjksJXh
         Ykcj5HVlp5+oUAIQB6/araw+YsdewVYqxgqx09urFJscH2qQpZFFnrZ3xk2e44N8jMZL
         CXgA==
X-Forwarded-Encrypted: i=1; AHgh+RpusGze5ubkj8cER+pmes6uK0hNr/4SBzq9vc2Myp73ijy53bIuH6WnB5rCQ9PpuHmKdC27FwQoxNLz7Cn8@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcW479KX0vyLhDKF8e2kIN/tDT9PluxD5Dx0287sdpYUmOk6s
	7KOZG59sVu4qTUJIRtMVPe1svzjLnzMOhX/JIwkvzFTvESquJPrtYkQSwhgpWcih2F7ue9M+qoj
	aN+vmF+1QrgUpbrU1cAofMVoNOTqiJB/7rYd9o96AgFGYx1aEfEyQNv3HKOtn3lfQtpqW
X-Gm-Gg: AfdE7cmEas0e2nQ5VF175Wuhx+uk9B+Pq7miPGZbEee9sk/QskpxPXkRs5Ncdf0UJit
	B4le16YPsimejHTvrOOsInfZccEQ76+qYbDuK+CnUIlLje5rbD4+H+crbvOf5IYhvTnbb7M/SCa
	U3WwfkMimAhygg6G0sMzD2aQcaehRim+HaVdAw9EjLg37s/r+D0+cFML+Vm0d4S35TwztMbY3/U
	GLaLIKMs0eOJ2eaob6EF/NhSTbqDLegVvMSu4D2R7RydW1cDv7xXXv/IVL+F0ZXxREOcYk+UIIV
	7inK34ujs+jAVrFGmA3xVyHBaokdfqmHz58bWk8G3ZS6GGgc6mmwyF3LpY4SsnruCDkkWfm08SM
	hBVdBRLxxQ4Ggg81tUuhp66R1apzSfKoEyDk=
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr5736514a91.24.1783238481991;
        Sun, 05 Jul 2026 01:01:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr5736407a91.24.1783238480880;
        Sun, 05 Jul 2026 01:01:20 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:20 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:08 +0530
Subject: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Rh9iMVK1VvEe82MbzfkSioOLphwmD07vDxc9YOX1LZU=;
 b=QirepiWSprygCdEJpVf63TbnYQtCy6LXKokXYpNSjgpaqD0KgQ7t8Cn3O3YrHCcD8otxXqu1H
 DORiZTSw4phC+My0GtSwo9tg4NvRUijt3W7PfDvv2IpCpJBeYGXq650
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX3jkHBMZI4tNo
 in1fIsSQKgsWAnLzvFVPcg5RRdezccT5NCXoetk1TPmfAqjcGMX6E/zLRBMzlpi11wcweqgdY6v
 6ce6VVJ+bt0zgmVFsgYuL8HNcbhvSpg=
X-Proofpoint-ORIG-GUID: dXCKc34lXHuzfX4FdRbOhaFWOfro9TB5
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a0f53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX5IOhotUR0CBd
 LT6vaWhPVObpYnzycEl075jWQFiG6hPL99UfnYrGOjFZvuKXSCtmRx0pgWwFeuKkbDM8ehPga2b
 SwU2CBUCVq8/lTqOHQRaS2bPeX62vA6H0HklK16fN78SLEdpBPhwFHHH4m9I6bxKuWXdQSkj7Oy
 IE18AiRbzw/IoBuEFai2nT7cRu6e90mdtPAk9JtxT+3JCVP91RBX6QPvOYD3OzPmcZSTjHHVwUW
 fi4j3oH8nNht2mB8Tr6wGjps36Ikqay8Cp+Ofz3dGmRheiHY428MZMKuspMUwq720tpccU4crEX
 J2/WJVI0dHz6EqKj9cJSclTRMl0OKrG67i+UAjJh+89n1lmcq9fTicbjNQAbET+r9UliN8I9i1P
 zAF5sjj40UWZo75l0bL1yyPdtBeyETj9zFI9JadFIIxnHIzTmujG1RwGY9OR0oyJxPaB1zctoB4
 SW7Zg8usfr8F7w7sP5Q==
X-Proofpoint-GUID: dXCKc34lXHuzfX4FdRbOhaFWOfro9TB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
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
	TAGGED_FROM(0.00)[bounces-116509-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: BABEA70957A

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the QFPROM node and GPU related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 19eceecc2a19..8f71f9dc26e6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5874,6 +5874,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.54.0


