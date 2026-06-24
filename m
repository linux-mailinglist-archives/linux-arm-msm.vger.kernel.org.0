Return-Path: <linux-arm-msm+bounces-114405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ABCJfEsPGrbkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:16:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA686C0F2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jjBZ2otq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T00HVRwS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114405-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114405-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5A03144F55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B52037189C;
	Wed, 24 Jun 2026 19:10:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621F348C65
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:10:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328203; cv=none; b=kqb+XC/iERsDm7sNc23uWC9wM7Y8B547VvWHTUbuOX7I0zOvcYa8q5TFUvv8kqwawbT2nukjQOJZfnZ6Bltb13KBny3QT4Nduev2G9iiW6cV6qqsdDgCMb4q3KfTz30acZUn0sT7yAoUBIbfeQ2Y6LpUfI0zPBU07qNeD8yyyxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328203; c=relaxed/simple;
	bh=SKGjni1KOiKZfXVYqG/Wt+yBdTIJXei8jtnT1CjWOEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y62a30b58dbarInNS8B4R2aWTvypToEjaPZKaYBqDQmnzW0RV2LAn6VI0ojXvkSG0qI2CpJDrkaiQPziv+6kapS0DVUS8XAekI54pYcJAIokznyDHVG4d+tCQg9Z+0snHh7tT2SxUVOGknWuZbQ4O3WWuB9udn+sHLYWKjzyjv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjBZ2otq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T00HVRwS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj3pC3487730
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Emdn15EHeJD
	m/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=; b=jjBZ2otqX/o6Sw9Zyd4YJ8ZPeBq
	A8/Qb+w59Ofd2VHlHo0F4OyflR/+kMkF1ApGpCv65JRNJna8QoIZOHZp51nVFvqo
	4pcsznyQHrODRTwD3Ys/HamdhQfdIYx3XoTt6tdiWicNkEZ6q6ysu5KxMp3BWp2J
	a9Lb3qt6GQjLxpumCO/hYfyR7c7k0X2W1dE8PLm62o56Fi/nko0c94bBCCR6FLxt
	ZFCJ2cXvY6RuSFcjU85USZUdnFncTrTS4La2lknmleS785w1SwcpgkSPtdf6Rrav
	V9E+GZ2s0eaw52Ddm+5W18TfnHNrl5Mh1FTYtzh69qkubvu8pIMvy2rZWBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d45285n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:10:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso1072773b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328200; x=1782933000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=T00HVRwSp9BJZeIEalIymS3LW0RBVtyujqYJ1wjZQLt7cHujZOuGjQcQ1F5AdGcgDd
         X5FX2gqgISchQA/YocKzSAdKrcIanqbASFSVKP2/5JKiu5xpJKHB7ulURcuky4z1tZ4R
         JKpZBJ7MvR+b68o22LMvGY3iV26UCYM+xA8Wmwb7Qe1urVnbexWb33J1l8AQ56vI29jX
         Bn3idWCE5sXP1LQQd9kkzK3LH4ezw9lcHnAfG8WwWMev2OX77DX4/hrFtQK0NImw5eTh
         5CF2p2nwBIcV6a/3mhZ8ho0SrUL6Q2+7YBgQbVtfvThLV+SYCKe7JlHuNtiXph84i47/
         kVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328200; x=1782933000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=qOhuo84U/G2X8GRQimxbyp2EkeZiayR16pwfYvsfKrhgt7+0XrbvmJsdJuJb+W9rOa
         1ig8e6Nlj5h/hPNZBuMvgL6I6HxdvgtnmPLr7e6c+fcteOI3XRKfmZbH58Dwz6kfqJ8R
         nB/lrw9FoeTMTnnJ9mL8l8vQ+n34kX/B5DD1gik8tawyy65yb+vWXNNn39r2qIsWKI9y
         Y2YwLaFM9Z0pkuSc4CqtpGjQqYXutq9r28kjtagWABCRdGE3HDbZ5XVztnEyQyEENtIj
         +6/RTVi6/q6x8/tXgu34QAE9rQTHTBqkswctN/ApNjc4d7nX6ks7tZ0nbtCjA2eHrZ6x
         o/FA==
X-Forwarded-Encrypted: i=1; AHgh+RrTGx2hWWYvgQ4DohDXNzNNr3zl96CU4KxjToA8FFxzRWPSO6kUDUK51dSsIuh4pyU/nIU08mVhbgws4qvh@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsbmeCZ0C6ILnSMwkcrrFXzrGYG14lx6UwCqdnoHElvcdnvXW
	j4LPLubrd82BPPk2XsjlQmL5InfHFXN8Y79tcF0RlXqTrrYJZdrE4ZK/TeGzuT1ztjvDdmP6zkS
	hX4yPDjAsrz/1f4tC6yANYWNzT5rHB+tjwCPhnaOQ1Arl+NzKtaGWAN+/p/3NGevwMlKo
X-Gm-Gg: AfdE7clBj3wCTh7gORF0gWHydsFmNQR2GBbbOYypEK/vVFf7K9iof5RyRBKvSeWsceB
	/n6CDQb2leO0aFANRKmSA4KVkl4jA1XR++rkua6bIK+QU4px9ia50iS9g7/tVtbEHmCQxZ/DsB1
	Uc4z3VhO6WcvSxm5iI2l8khLDHhaeu95FpsgAUzza86xMSuwe/N2XFoKa6xcQA7UpLAaEcvQN4F
	n/whgwQYl2gjReqRpiebqZXdN8j4ri89jNv1tMkJF2EU1ayuZb707YEcGcEMYeFdhWy6i1TWLyQ
	gugR7xZjSHJyVj6XaWSX0FbpeVATPtxIWDsqLUNmpMXI9f5pZG5MKUT8BJieuTTe0cpPKj5wJVE
	Iu9nV5f7n+DQYl+MZNwLuJlcAzjgxDUM50ox/eA==
X-Received: by 2002:a05:6a00:2d81:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-845a2793386mr6016874b3a.29.1782328199932;
        Wed, 24 Jun 2026 12:09:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d81:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-845a2793386mr6016835b3a.29.1782328199342;
        Wed, 24 Jun 2026 12:09:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 19/19] arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:30 +0530
Message-ID: <20260624190830.3131112-20-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXyfIkFXVGZ0Vo
 oRVBJlbnjYXyzxC7JQEe7sbcDuwaynLGg83Dtnt1zdLSoqv0TQ7GeEW5+6rvypvu7rkiRQ2sncx
 QWmH33Ej9ZM4dymVoC6ujm6+CK19WWo=
X-Proofpoint-GUID: pSxvEwgb0nHCy3Nlt4-7fRuAJmBKRdln
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3c2b88 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0qvS_bSzHNCwZkaZnqgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: pSxvEwgb0nHCy3Nlt4-7fRuAJmBKRdln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXzNn0CNBbkRLf
 ONaOy2cq2oB34LPg1tsAYEtLxJe/gZZCz8yqaTFQwsDxaWDWcxww/zUeBdAAm6uQPXpJ1CDilV3
 6tiHfYH+OWvxhOKElRzPygOpOFTV2v5sMRuhrkFggpWW6LZPGOitfITvl7arUFXH22CUv7Zx0Bk
 MNFlXLcyh2nX8qLepmZMB5Aen4a757LWMAVNUrKrnVZeTpZSxmxmvbbIn+ASNCsyBP/l9Cb9H0q
 PeojrBJfDgkY34rKgDerAzl91Tdi8SKXJR3BB7U+HISSSZ1q7xiOtpO5K53l34jr6fFu+YCp8xT
 Arha5prH90JqN5BKVlOKst02E/CErR4n8tTDx8cD4/TwQjZYcTm86V69e4z4NsoC1fS6zv0XlY3
 mVhjfD9r6wTXyzHOcX7HNW4J2FLIlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114405-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAA686C0F2A

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..2179988dbaaf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -363,6 +363,7 @@ cluster_sleep_0: cluster-sleep-0 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sdm845", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5192,6 +5193,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0


