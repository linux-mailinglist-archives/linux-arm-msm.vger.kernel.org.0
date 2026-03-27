Return-Path: <linux-arm-msm+bounces-100205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KATiMjlBxmlRIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:35:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3B341135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED143308D8A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C993D6CA3;
	Fri, 27 Mar 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWF6ooDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E29L9D5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB933EAE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600277; cv=none; b=SQ7/eUDMeaWgDR4mUwTKoLAE/AbGaSfNX/sHN1jj8a68W387LyZSN1EfbO8jsS9/fpCbzmSWXf/cWiCN5+6fYLvCNkpN6rPt18TNqw+itMNoBfyE9Czwd6NR0eTvn2mbrVedjlehTZjkVCXyO/jcRR2YG4ZdwrohP40gnD7EbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600277; c=relaxed/simple;
	bh=YBBoXpSOqThsnriHmo35Flk981yZhZCtpZaIWCWaQmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HUL7FEf4FuCPBTB6KG3RDH0s7qOOnM2aHU7vPy7qme4Nc6pQiQYzoimMZWwKEGnvDzIgSgDWUd5kVuwudRv/1P3kZN+f/H0OGcxcz3gqoEh9k2E0ILgINwP/hgrqACbbDK08Mx61YLiwe1bbVYg7x9oCGdiozz8Ynsu5YRbumXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWF6ooDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E29L9D5C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vfiM2378998
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DhKgSU/RvXU
	TJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=; b=WWF6ooDFq3S9VAXyGOMnGd/svZ0
	JqMR4SwUtcZiCITnZ+dJ7uOZjQ+sgkhvVCzaEFtvrL4C2wuMLD6wrchmvea2nGEt
	8r2Y5P5Oj30OsmsY9byHFbhVhZsvje6J2LFeRzkFFywnVE6xWBQwxDO2nLxlEdfs
	haBsFqAZMIJnWMAvB9or2qQ1l3nUvdAn3d0KvttRjjh29G1Iv4hA9avQTTICMRod
	mMIFnZO7c+ayE5p2YN3sEPHMmizsDlUbYDzW2oini4dvgtW9KBgfjrjeaD8FiIgd
	Kbizd6C+Jfok2tAeIaBdnyOHIOTPtJoE7EWBo7U2lTlotXPB5Fo67qjp9Vw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx109k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35bea322389so2458973a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600274; x=1775205074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=;
        b=E29L9D5CYk30OU+99ZFpROMtQFrkvX/CHLyJ0cXyAOJbW+Hl9vmjGz0oJoF1UWxywX
         Gr6K7whkr+rQw5L4EsfoieXB/DN1V14o5Z8+I1ium+IKqi3MUpgPHU/8dcXAKb5CfCnj
         R3AmwKbh4t3YcJo4S49QqPcB4soQjcQdqTwKj9+vXsUEVPXa6NZbDtsGjSYRFVb5S6vL
         OmH8xdL5Gy0l9cpMjP3zwieBI+goWUWJWlPg3htQYLZNJ0nN4fEn70xRDsFKD4QPFXgg
         g5IyNoGAEp+nytqyXunRwveOAi+VkruzKTSs18iHTkPaXXSMtMC0aTiGFu39Dmf2wXr4
         0Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600274; x=1775205074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=;
        b=fYAJiwe/Dw6vR/D2uCjYWQ+G4ASf9Ad4guKvmuUgbbilf50e2NyZ4nJQXlpgL+MTT2
         VtyPevhSV+bknqzdandNUdWtu0QQvYCbzdSQJtVPyO4BO5iWScoV/ZUAAU3eL/KBAjKe
         TnlhNqEtH62Q57RM2a1HbyoCUePSYHtWcyG606eGbZOqnmDRUA4QbnHIC+sjslz738cC
         of96A6wKqN18of5S4eUm6+hsg1NtoInp/kuEWtOkooeL31PWhdPQbDErIuny6gM0hmFw
         X87bdnNKoIvxkoYLUrpLNmIfSAdU6WlCDzX/w1MQ5FOXHCXcUPoUoaZuycuJ7wE4GVC3
         QvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0n6jyLZ9V3rWKAZ8e5r/uGjoUqmQk7J75WFAkg//3/Qzvy40ksE78M0tzxAHxijiizA3hxYm0/XngvBOH@vger.kernel.org
X-Gm-Message-State: AOJu0YxvV+rxTLs3wgx+ZoFBvuUk1GI6BA5mOk0ufy58rVyFyUH6t9Ka
	v4u5BtduL+R+/nlqL76C82GVfsMtoizouH9L7TvQm6txUXs9xOHWnqDjINaA9ifk1kCY470O6nL
	Uj+cTvmbo3idYtp7AYLyB1SsghhCnf8pc02Ib9atJb4GwhGlwpL6ebVa609srf8uQmg0Th5Kh17
	gj
X-Gm-Gg: ATEYQzzNZ/g4IvPhsR1yHK3wAgRZXG9eG2NW/5O1cadPXiQxsb4c+Hb/LvCYkgIRaMA
	khzSFdJi2XFn3kN1rD1eS7cg2J8WxdkoZD4NZap/DuVihLI8gcgFlM4M+9LCWCKWkCt3U24gppD
	+FDqqCXz2TrguT12CfV1cqsfn9gLk5JlUtr0BWprRSHzOUiYgwB25ak/4danLbepXScc1zzhjD6
	l0E/FeqBV4OddfiBlmAJkE8XOTQhEVxYY2pwzBE/siFoQlsFFBLlv3nYN8nAPPJbeweQjeVvu6L
	HwsE8KYAZXVtHhE9DGV6MYHUL55HAxoc2ecF1cGj0bemSakTWWjk6gCyfJwwOwi9itBvGUqC1vX
	faOCEUiUQVDy4vP99rdPOOz9Dy7Re6VXgxp1xFQ1Wh+NsHCuLvhR5oifG74k=
X-Received: by 2002:a17:90b:3fcb:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35c300bd7f6mr1792670a91.30.1774600274370;
        Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35c300bd7f6mr1792635a91.30.1774600273898;
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
Date: Fri, 27 Mar 2026 16:31:00 +0800
Message-Id: <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c64053 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=o9fUvUwYGSpSYbbeJqQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: AB-9u6pM2zg7abLYhdiLtOsXMcTQ_IeT
X-Proofpoint-ORIG-GUID: AB-9u6pM2zg7abLYhdiLtOsXMcTQ_IeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfXxyt6KVCXS/Qv
 55w/USsS8Z11Y6v/XBUFY6dMTCVkVvf+/78aTicAVCfEeAuojI/1gxKfsqJqqm7gyDqfOoNiaXU
 o38y9zlYxf/9Oo4AHbYfFX2134/iqtOKDv6os+PIPVcJwtv7kn3EDMidaIX9WYqV5ulfaxADUAL
 Mj3cPPvgGnPTMnz17twcIGyEYsL9wOMRnTV6rjOBCF6gGrVLbDCJ2bWR6n3bkh/8b84HbRVci76
 VAiKNE4fZyYbepzqAYsZUlHgE/TYfTy5T+UliG58yAiA+lD15CEsIuwzGDBOpIpfryM75TU6tMk
 6+nd6HXMF5wbytc4A82+kzekSFdp6Zn0AyDbyS+dvls0ZQXms9/M6BAdaXnSwOw028o3MWVrXpt
 FiXaVcQipgvFHKCM/tTICp9FYr0b7AQu09GkiFE2Y1b/10PBG38LMM+t7TjCC82smGo/XsXZMYO
 qnEEg9boc05xgzFM1ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100205-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[canfeng.zhuang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8A3B341135
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The lemans-evk mezzanine connector supports a robot expansion board that
requires UART0, which is currently disabled. This prevents the expansion
board from exchanging data and control commands.

Enable UART0 and assign the serial2 alias to provide stable device
enumeration for the expansion board.

Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..1e9386677bf5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial2 = &uart0;
 	};
 
 	dmic: audio-codec-0 {
@@ -870,6 +871,10 @@ usb_id: usb-id-state {
 	};
 };
 
+&uart0 {
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;
-- 
2.34.1


