Return-Path: <linux-arm-msm+bounces-115557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e6acC0xzRGr3uwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51376E91DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GfmhXF3L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ClBCiEFb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4B08303CEF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 01:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC0F36165C;
	Wed,  1 Jul 2026 01:54:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372740D574
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 01:54:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870858; cv=none; b=S6Ss0Ddl0AnEX9Q3w11OpZT5R+Dd2zsz6HZtIFpi7YiR5t5N21lKWDGB4H5CyBUBiW/CyA1T2Ctk3D0+8/K0fQQKjE0PeucOAL7LM0ww9h3wAK8e4vaEG0LmgUzZ10rOyunuzM7D8cQ/8Xyv/fxIBJ+GvHHnss7qEicL1+qaw5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870858; c=relaxed/simple;
	bh=/ryGcxx6Nu7BXIs0Li0gmKHu5V51HhlktJvdbFAeafo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VZXJCNeaDxY78IvcB7fLIpFIlQaFAhbB7Vh5/UkL2Hgc4Y4OFnrQrQXkEMy4KCmkPoVtm7/hAaEHGoHnWvP/Xx/10/Qu5+3eVQkmE+7e9ujt+hJ2YSYwwYveOYDyyQnKjHWvI1rgbpM7dD+E/fPQRp9WcV3KesR+rAeZcLESmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfmhXF3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClBCiEFb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMCPA3453318
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 01:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C0Nt8/qawZeMhk1o8C0hBJ
	gi0bwQbxoP3TJUKy1hBOs=; b=GfmhXF3LLHIIqhsHDRDt9eyfsltliPJqARJy/8
	8BCD2S2QXGMy7V6HDDmalzKyR/OCfP70/mtTX9FvJVQYz7z18h09Y4r7NFkkBPma
	++IYdjn9Y9KJpdIRPPDAfhruNQNfJzt1rpwFJCKeKLKI7r1LMTLOXDSXh/FCOS27
	U8uzll8GY5Jok9pE9OS1Yqss0FDkKODnukyXRC6hJkomFPtDCtT0gvzpHMVOaW+j
	nEyJXI8ms684te+8b+J8NdCvCA8JgcEMIUakyscY1GrcVBejlM6nLP0RqP6ax7f3
	skkCWvg1OOKhFm4jjE26SRcEFxDK4oLUqlPQHWF1bptG7rwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvw9ffy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:54:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c825562f8bso1651515ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 18:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870855; x=1783475655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0Nt8/qawZeMhk1o8C0hBJgi0bwQbxoP3TJUKy1hBOs=;
        b=ClBCiEFbIpVhHEdOcuGRACVPhzUECOvIhw42n5C0yI52P50uswl/4aitxcV/KU/rYN
         hnN5hN+k8YQsJoqviR+kcsj6yO25vp3M5SI5kyObYZl497DBHmtUlJVlPj8MFFsp4QYB
         YIG38qYkrDqaPt8G/an84LgLNR7JAGBYAea/FnOeV0hv13CtiB+G6AUaPb8cNGwQ0g6a
         B4ZIWaooHNmqsPqzuUQom2cXRhpKprAhtOuXundMrXyNNhCBBEyLWnjTEsi2hFWwJmNC
         CZYhNF1I33tTwJ2obBThTh8t8ehBwS6hWtChJ8WNJ9z8PGEmLjgbkrtkg5WWwomXV2OC
         WeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870855; x=1783475655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0Nt8/qawZeMhk1o8C0hBJgi0bwQbxoP3TJUKy1hBOs=;
        b=CPdRF30lTKx7e+oY11MetxxOre6jW1dHfe2jxp6rfXGCxdaR4pqTep17tRz5BoWUem
         7v2h8Kt0KNclFSKqKx5sfyZmfXI65XDfPcIakB1aYJChcw3hD8c89n4TAljU5s0nJCZs
         LyqL2DNynOkhscLeC9RuXf6Dvwm3HAgXEyC3x4/cLFNeJy/ZT9Niq7kg5wMCAwxntwRU
         3zaItO1MKvmiF4s/ZLkjsSyLojJqaK5qhXMOGp3ydrchvyustsB1TACCXfMe8FnMIyMX
         tRGcnovszzUpRZ6/u3g9MFc2+dFTyxxjoNcXVGhI3+m9ynVDlvJbJpBvASTHELPmuY3S
         y+PA==
X-Forwarded-Encrypted: i=1; AHgh+RocTggZdJQyImuFE3duCTkV3NJHnpbuhThm6qM2DLCKLd392qQOL0lTm8ACMrdTscYE0uCX8EbzMv8QS5y1@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5EDKrDLwiXPXTLHnkBRUnKQy/0vZmRyhye3jWE74SJHsnJg6
	ypInsGaByNPs10i/bxe5iRPlsTed2CGE5WEuj6QxlVMpafHXikdO2Sa4+ZePlubKTZVkfwr6CJI
	/o2NPMo/6ZE0to0VhRf8CNTEhWDTBNkf/UKmNk5HJGCPHJxrG+oiAEJFZP498pVqCS4LgSxddfn
	JSWpE=
X-Gm-Gg: AfdE7cn6ADRasFqwzZvaI5+KSYA6Ok/TIn9R1jyWJgI5O2/9Xd6Hue7iTdZXc9fUmJC
	fJoapHPi8+RMyj8Xz/bJEPxq8TPZAni44PyAjt8C+l7T7YV5js09SEQezGEQmG7EcHrXEo6PCJ3
	SfEUBvDmGF1ZYLTAIrGrpVIkDeLoNNLcjswtCHLFY1lVoOn/YG0Z3pgJFUYViuf6/caWwyFHh+a
	yWyNnC6cSaKmq8E28emBYrkrpPGWII3mFKsqFcw14ByngXeCugkAWBw6Q0QK8gdgAK92azHbiue
	0sUWyBXROtekddSJp/S8TmhQ3qsGFildl2AEl4oCssZQgdLouSoSymDZjeHhIVNP6tpK10t3lpK
	4og1s9DeoNZ5R0CiZb+IaLWZuSY3uLAJsXQbT2ZnQjHDHg7T54t088DUyxo6gEWE7Y2+kEg+YJg
	==
X-Received: by 2002:a17:902:e750:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2ca2d79cf0fmr54119895ad.13.1782870854750;
        Tue, 30 Jun 2026 18:54:14 -0700 (PDT)
X-Received: by 2002:a17:902:e750:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2ca2d79cf0fmr54119515ad.13.1782870854181;
        Tue, 30 Jun 2026 18:54:14 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:13 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Wed, 01 Jul 2026 09:53:40 +0800
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVzRGoC/43NwQ6CMAwG4FcxO1uzlTGGJ9/DeIDR6RJluAHRE
 N7d4cmDGi5N/ubv14lFCo4i228mFmh00fk2BbndMHOp2jOBa1JmyFFxhRKse0AfKkOtN9AFX6d
 GjAOBURLLpkLdWMnSeRcodd/08ZTyxcXeh+f70yiW7Qp0FCCgNqbQuSi1NfnBx7i7D9XV+Nttl
 wZb7BHXeggcCq1y5FahRfHDyz68jP/xssVDLkhoKaiUX7x5nl/e/qeJZwEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=3766;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/ryGcxx6Nu7BXIs0Li0gmKHu5V51HhlktJvdbFAeafo=;
 b=/UXhHbIqXN/AyUqRrNk0GJChbDZcuDbq6hv4Cytm1eI1Q9jmtBCfevqm9yhCqTQN05nlTBvcU
 7TbZgLFeyBFAp7hmUZncgOhPmTYNBzvcpK69v5Sd3wv5zdGBrwGYlo8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: JfQb7sv6u0CraQNc2_s_J3d8rG6876aI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX+//xr9VuU9/0
 3ioe+oWD5UXlx1n3WQ0hcrvhJb+6IXkAj8txjFw4r706NSar1SZujhzZASI6HaoSUaPLD2fiB+D
 +r7hiLZBWbQ7OVKoIl9eFSh+J8jzJLo=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a447347 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CPxOtKTflHPnepyb4PMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JfQb7sv6u0CraQNc2_s_J3d8rG6876aI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX+dESsaneu6tR
 HPAs89rUccRflWrvVtRAyjp2i72HPmuVWOki4bt5SQ3+2Q5sbtpKD8Tn2tAqMOS0bbsh+yE/8k6
 Kstc7vWScVfVvjsFfTw0pbVtfvG5KMRJ1+3tikubkKqSMxZ8kLhp2h/ZUm3S7AYq2QggBxVLbA3
 PJFENB0WHuqOb374ja9xhTPE0gT8R5g8QE7RoasWzI0MUyTD8325AvXyelWN9FIwWQholcMrWUU
 Orw6sEKahVnm27IUCcksn2hKdFfF70u/NKZtaXetIhrAX0VFQ0E7ntYtp8bwH8TcEU5caBhWv69
 +yG0Lq7yOmMPbId2XJ009DIbkG0fLgLrgQEMio16bjobnm9bfBuqzBR+m3wpgmIikuwYVF+1IuB
 Ni49Y3zutvOX4Lu2vgfMZeQY54mtX3sCVg7BeDpcmcHXA6fHZy6feOFM8S9hUePUskJ5B3NXV7y
 QPlCr2TaDOBUl40+f3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010018
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51376E91DF

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series introduces a standalone "qcom,coresight-agtnoc" compatible
that describes the Aggregator TNOC as a plain platform device. Without
"arm,primecell" the device is created on the platform bus and probes
through the platform driver, bypassing the AMBA peripheral-ID read while
remaining a fully functional Aggregator TNOC that allocates a system
trace ID (ATID).

The series is organized as: binding first, then the driver support for the
new compatible, followed by the per-platform DT fixes that switch the
affected nodes over to it.

- Patch 1 (dt-bindings) converts the compatible to a oneOf and adds the
standalone qcom,coresight-agtnoc form alongside the existing AMBA form,
updates the select block, and adds an example node.
- Patch 2 (driver) adds qcom,coresight-agtnoc to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
qcom,coresight-itnoc only, so the standalone Aggregator TNOC is no longer
wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) switch the traceNoC nodes from the AMBA
form to the standalone qcom,coresight-agtnoc compatible, fixing the probe
failure on those platforms.
- Patch 5 (glymur) switches the node from qcom,coresight-itnoc to
qcom,coresight-agtnoc. This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Add standalone qcom,coresight-agtnoc compatible
      coresight: tnoc: add AG tnoc standalone compatible to the platform driver
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++----------
 5 files changed, 61 insertions(+), 25 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


