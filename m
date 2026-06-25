Return-Path: <linux-arm-msm+bounces-114504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O3GnKn4HPWozwAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:48:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F313A6C4D16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:48:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gYt70t6x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hF4C3Ly1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114504-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114504-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B92093006B44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CDB35201B;
	Thu, 25 Jun 2026 10:46:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F79329E46
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384384; cv=none; b=Gyj73esS5xmio0N9meO2AfJCxTUWgAyZaVvJPr4gH43ocs4Dg9u6kcvQr3vVAUDV9nx7NbmWyAhMgncMMqxbfCQMLsNp7k/Utk77t4hrH/n/JkvzDUvKkbq0yKZ8rrqX2udYIjNef800XpVkjq9D9eWoC7SGVIyhSFRq4lwS6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384384; c=relaxed/simple;
	bh=1y3m/1aA8pqce6oySsr1ykpMgEsta7KtopOf5RBOeB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L4KyUKgaHe9ZinC9E4iObjbcjtOGgT3TcPqVPdWHFIAP+usi/pQWFITMRsIQ147PAfss2xISAIqH4H8k0h2vFbQacqii4kqWBgPHIvrtf606FGzBurru7n1GF9RYt+q+u2e/ww0Il+LKdHLvOr02Y00nEqEmCSmho2ZZSHfxQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYt70t6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hF4C3Ly1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsD41454393
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2eedrxPa6/UBVtYY6z9bW
	5Mt1Eb0uQ/gB/loeBb0Po=; b=gYt70t6xUiJAm2E5pkyjY3a4bgeZ2XUNw80d/H
	gdLRSYjW2PhiBkEjbjb7FJgPrpveWskOizQ6TPsVckq/7ogayRhX77Xx1bcF1Uub
	R6kqnMWexMtkJ9lHRl57VYJjdFJ101UBI/Cpi5+n4ZDlzUN9E0ZyrzjOYU9epMIM
	nNj9E9cxya/3zk/a8gFAWfC9r5dKMTU5ahrmQHx0AfUctP/wIetW60q4TJVJsBGn
	vqtH2ckGWLZIRHVj+oZuNA4fDpA5YW8XYv5eR+zRx5yy55SJv55Z+8nquUGBmuNt
	TyTMK5Mm8FAUaOmcKe86pGQnzxAIaKNSQEhUBS30b46on8Zw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbu8e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6af282daaso29978005ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384380; x=1782989180; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2eedrxPa6/UBVtYY6z9bW5Mt1Eb0uQ/gB/loeBb0Po=;
        b=hF4C3Ly1k+hvq2cSHGAl/67Fh0xtCHvaGmu0whlDaiZxMwdgpYsjkoZXWM4LAFtCiY
         tRZ1jXW379Rvk6HJk1uYjtcP1zd8XJ6pAYmRCKq8uT/Ti5l3gY68uVmGeVpfH1864D0V
         EDjntTeH0qI6iXvOwbS6W+VejqMh0vJRYoTI8pFBVP6TuzEkuyA7NafZnW7pzZkMQNa2
         vZy9q0uayjyMF3avIl840OSbirHriMMax9uhw1/oR7QHPfCJt2y8oKN9Jhb2wOjl1Bvy
         0kAlxHEjiJXnRwVwyt+Tp6DsUA6xM1ErCV+apaMm7nY/TuMaFgFu9Njse2TMRfcFw6AN
         2bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384380; x=1782989180;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2eedrxPa6/UBVtYY6z9bW5Mt1Eb0uQ/gB/loeBb0Po=;
        b=shOhd1d/G1AQlmW8vtJvk2fu6ti/gsM/Y1zmL7zk+FExhFlL5Iyk9Z9/DI49wRqPBg
         L2k0ZJgWYCbY/8fSY3hih5DBzIq2AJGTzI298az8TQwNRBZjwA9IfnFIUNZBwGRZhPxS
         LU0/25eo5Jr8aYlVO3F7nP3V3oY8zfDekPVtXGAlk1WGagbU/l8kYnPCqglUY3QSRwfD
         4IUrWV/06aLCzWwQELERiSPvuGhk62HlE4NwxBiu1KaMBqwWMJK0ueqSPVGAe1/57N5L
         QlUmPHK38SxWO+oGKI9p4Wh6K2h5X/8G2ZjYPfdbDh/ZzTFQWvoOL7XUjvp9m1s3ouNc
         qTfg==
X-Forwarded-Encrypted: i=1; AHgh+RpAWHvCZozegC93Dg0v6SbaoctE79VjYn+Eu3OXFp4bRfhCNtUq32HfEjAtzW8PKd2thS5hErSGbQS5jdlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3BP5aR8QyTGX3PlCaIUjAfVeA3NAeP3aGASHvEHosOfaH/IrT
	XIP1kBRHaAFjyPqSr9kx0zN2ptzRjcoAEnwTMYLF6kwvzVUCPApWPyWwhRp90P1oQeMlOkvewSQ
	P9Oaj6TSTFAE1nFHnKlkhcNfyAkqY1LQTCxT8RbxFlZxbKSsE3ZVrN0e6aTgW2p9twIfy
X-Gm-Gg: AfdE7clsIzcYp19hUc4TxQ3vCFZ1d8HLx9x5Uyczg5TPKWuYzXvDqZtbvqJjERHUgN+
	rX2OtjnFbKVN857pc5GFDefGsuIHx0BS1nkuAVdcqQFsebtCi2bhqMe290sb/k9bnZcpWMBjZkv
	jCwqJsbQWLd5V65mgeg0rv1mbgBzT+TEMRLyBKF5fh6lLTF2K/DsBjVlv/OhP9JYts7SQlTVT0B
	dmYL/Rp7pjz8WWebFsewmDfVvems91nR+5HIfeNUjTAHeDCiK35cAPbUrqy5m1FNf4h/Q9nBWUm
	a2vu1O/6HhdR+YG2vMIsen3IcWlTX6rysx7bxYoUp1fJwZW8CUzRt2Wu/A1IuQYHxFIMfmhf6UM
	zqu3ZhWAI2Mg2zrB0NfZ+9wPC+U8RcyQcmD6YS2OVjLlGTuWINcwxD6FO3eaUbukd495zmykp9g
	==
X-Received: by 2002:a17:902:fc84:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7fc632ba3mr22397495ad.4.1782384380202;
        Thu, 25 Jun 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:a17:902:fc84:b0:2c6:afd8:5704 with SMTP id d9443c01a7336-2c7fc632ba3mr22396955ad.4.1782384379649;
        Thu, 25 Jun 2026 03:46:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v19 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 25 Jun 2026 18:45:50 +0800
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN8GPWoC/43NTW7DIBAF4KtErEvE8E9XvUfVBeChQUpMC47VK
 PLdS7JJFrXVzUjvaeabK2lYMzbyuruSinNuuYw9gHvZkXjw4yfSPPSCcMY1E8xRHH04Ig2XCWk
 cp0pTqTRO8UxTsho1OBtMIv3+q2LKP3f8/aPnQ25TqZf7rxnkrf4P21cpo5FZywUqb1G/ldb23
 2d/jOV02vdBbvwM6okEsUmqToIxJoHEQYBbI/UTybdJ3UnjJYiBAwQ7rJHmQUoOm6TppItJ6JS
 USpGtkfZBKmY2SdtJHvigHJNaePEHuSzLLwcrTsEYAgAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384371; l=11105;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1y3m/1aA8pqce6oySsr1ykpMgEsta7KtopOf5RBOeB4=;
 b=d8VH8S1nw42KTSLSSnY42XXLp31Xj5Cmlp3hlxmP4aEBdQ1WC8d6b4Jlt5vxeRHpfDTsjIpuB
 sKzsrL72pHPB3RoWXd/qvHxSbH4zJuZxzlhJUy2aDHBPvbR8bJ3prm1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX+MyYVUiJ94Rm
 7hRD1Wi1P0+AQ87e9uBYb+0DP/vk/1MzWTaQcfdi4Q94ZiuYF4Ho3LFUFrjYAGcl4yxYIkbIvIu
 dsFBBNKEC97Qc9THa9rVa5XAB6BR8IU=
X-Proofpoint-ORIG-GUID: nqp6wyLMXNrJ9YT-oFuQln52rotmxWml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX0JxW6ImwEG/S
 tsIPnGZTpWm7o7mbVD3rh0+y4RPTGx5KnlTt1YdHOuPGvDYBnQLO1NcBT2RBMV5Xhmj0fLxgTIi
 sA8ZUn2RqBlq4GH2QAHhsok44ablpTjPMQaVDhTC4LdO5TCM0jMgCZn0fl94pnwIEc4bkd5NyKk
 3uVIarlqZpPzoRChgtvhuK2vN+HEAb7Gb5lgkRUH6m3sZa9MPXg845nc/EcToCgy4KraIIsn1qf
 AS3Kdry1Vggs8wRs1PT0vECDBR9GrOPtEUHAH8Q/mYiE7ulUw1HWAd8yo+yklsRzmqko329/chy
 bgiR2HCEeoI8//+GhaDzm9yssWFNxSQDdmjSB7G3nze19mN4tl2ec+6WN05N+0eQt35naGDXASs
 aje5vAQMdRVyI/UiClYKUpjJV5eyieouQZoMco16/F+7LvHGXx+i8E4yF3XZ0O8pOSR1Wl8joro
 77GIb4OWygSIRRXbqMg==
X-Proofpoint-GUID: nqp6wyLMXNrJ9YT-oFuQln52rotmxWml
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d06fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ydBVYVaL_MXDkjDL6XMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114504-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: F313A6C4D16

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

---
Changes in v19:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
     and tmc_clean_etr_buf_list() to state only the required contract
     (caller must guarantee exclusive access to drvdata->etr_buf_list),
     dropping the over-specific call-path details.
   - Lock the required code block in create/clean functions.
2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a stale reading-state / double-free when irq_enabled was
     cleared between prepare and unprepare: the byte-cntr read_unprepare
     would return an error and tmc_read_unprepare_etr() would fall back
     to the normal unprepare path, freeing drvdata->sysfs_buf while it
     was still owned by the byte-cntr buffer list. irq_enabled_store()
     now returns -EBUSY while byte_cntr_data->reading is set, so the flag
     can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
     additionally guards on byte_cntr_data->reading.
   - Moved enable_irq_wake()/disable_irq_wake() out of the
     byte_cntr_data->spin_lock critical section in
     tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
     irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
     be called under a raw spinlock. The threshold IRQ is already
     disabled by the in-lock register write before disable_irq_wake() on
     the unprepare path, so no wake event can race in the gap.
   - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
     single-CTCU-instance-per-system assumption.
- Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com

Changes in v18:
1. add a NULL check for the in_conns instance in patch 1.
2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
   previous check for the return value is incorrect.
3. add more kernel_doc description for tmc_clean_etr_buf_list function
   in patch 2
- Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com

Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  27 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 327 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 265 ++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 896 insertions(+), 73 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


