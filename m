Return-Path: <linux-arm-msm+bounces-105450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF8eFQdU9GnDAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:19:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F195E4AAF17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E1E9301F19B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E090D363C53;
	Fri,  1 May 2026 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cm9EcFcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyQDj3S0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84F35838A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619759; cv=none; b=JgvL9XFdEFjp12Z+zbD29GA3zkJkykbyQxXb5YaK6L+05j3IxC0xj9KWhWNVGsVShvN9wUlfkRAfqMxjlZUdW0DzImZR3yZ8oK9xPuy6Sv0xj+SDlr0HPkeI0tdnT3/8ID/ZPcXtGUh5XFFZdo4j8BNbEI0WTq/D3LVVItR9E0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619759; c=relaxed/simple;
	bh=Fr+3q/m8eQdZKnKkiBfMq+f+wZxUQm+q5ZEQU3G7Fjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XiqcNZz7UHLNcAzL58F9gQ1egdQzRcE7M2dldHgakpmz9Iu/ndJq1zSCeuu2IREdDruj0VhF2WBtBkcmRSi/vaPHMrD2YLVKWDErlT8M4CIHVsYXz+U2uAHNycaL5qvz2kt0v7Z/SA3mCMSTxxTTjkcJr8/AP96Zna8xAWbK9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cm9EcFcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyQDj3S0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6413t1s01988442
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 07:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KhFirPZNgW5encf6J90dux
	StBhWjPPuiggwSFINADfg=; b=Cm9EcFcRDVsv3ek6IFzzrWfUF4zNIljnAPNXhc
	bdMok3LPMXjI0HEnysFLuX8sQGSueWCFvfN0gy4BDUoLxJ/BmVDAlTT6nHDcF1at
	Wyzc8xIHfNhP4LOItrwhS1DSdOzYQUlhBXNS3fjrH58KQsQTyjImzxOHQ5gnWlKq
	V1Pc6148c9UPcjg+ed+QEnPcy77FFJ4ELoA7Mm6szfYGakA5sSD1I3LjGtOoGlYJ
	9CYBQg06nQk3E0GX5dv4+NDPjag3SjrQqCwgdqb3oRnisZml4w5RiCeA2ccS9iLI
	uKNQxbEJNVdxIAi5vuqE48o0ls8LPGKCmXqhaFDxk4LqCktw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc459yw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 07:15:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso3957144a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777619756; x=1778224556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KhFirPZNgW5encf6J90duxStBhWjPPuiggwSFINADfg=;
        b=SyQDj3S0DqBSN6lByw3nzbIyNi+mPKBPrV+Y+bODY4Vhf4jAbuiTaZqADyRM76Ox7I
         syA7s26rXBmkpgQKcBdLVUup5vuQGiIz8O61IJpQTIElpCEbeXWtUhvd8UOzILgAeZ/0
         h5Gdnh4AKVP0ttyYiZvIDhTLsz4bTBk4gu9TagtGxgzw1m2Dc93nJPJhSQ5ljXU0P036
         iJVVIrbQvYoaL8kLeXlgQz1ZSwntVRN7f4qMLEeLoq0LT8MuKfgV/3iCcIqTG7dQi5Vu
         mnT1CxCZ2OcS7Tk7Jmvamy7QAsAskiBuudrbEqFktiO/PbJWouxW/TSGAH/fNPGHiewc
         SKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619756; x=1778224556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhFirPZNgW5encf6J90duxStBhWjPPuiggwSFINADfg=;
        b=Z0yEK95RnljTHtpoKIVUiEm/oUHXgguXLZxbDs0fNj7fs0B6vV7Uy8u9igewhmtukq
         bBjs0gfdcWM0f4M8/XgwWbbFMyzGwn5PSrwxkAp8NRT8ClBSLbIR/njOY0oV0zuYJBP9
         ojNmY6lrjI46xtsODaISiG53S8t+KJEiAhmdclUjqDtPlspwHlgoG5XjMnTktDRmd5xu
         wpqfzqRpYLmzrDGwDemMWC1MET/Rs6hUWBjBVAmIqBvyGCG562NbddicqcPKs+l4/sOJ
         6xHSQJ1GgeXcrXeHpdyTWqMjg7YQjL6NpAsSvT0uGqC0geArc4nezAG86rhUqPqbCZVC
         gGwA==
X-Forwarded-Encrypted: i=1; AFNElJ8RlI8TzaTVStrKetkobhutcPnUtdk4A2rdosI21V15Vp581RRiI7deUu4an69//+zZI705mXRRINlJbcKS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94gITEZ0J9luKS/VF49L1+UzdprK/BWhImoyRzwmX9WJisvOc
	u2xMKSBmgjVQ4vWqsmsfZAQa1QGawdzefWvj8J1Pl5qca48P3VMLWpjAzWAcWctaoUGTdRVg82X
	swIW8RKaNyIOuhioAmbwR/Al8Koj5zbYz00hoPCj4o+l2NTctQda+ySkp1yvz6w9LArxS
X-Gm-Gg: AeBDievksAS0ZqAnLQE0ONJQ6bP0nNxoPlJ9NeTlDZgppsgqqbMs6t1RvjnHCvuha4L
	1a64vJ3G/ehNm8IaYAAJX9c8txW21LQqsJnkKul9fojy2wmKmkL1+O5uh0hRz45zsB+b3SNaBr8
	apLpnxA3knbl12N81/5UUS3zTc6xjZLMxJNu5NexkyFcFR/6cMv7E0Xv/zo+IgDjSStC8871yy7
	Lo+UVwOE5gozWrP7ThypevcS+mGJ7NRmtFXpUmdYZAEaGoL5HgHp5Qg5HeKwguZ1k34Xy0S8LYJ
	sh4+cJEIGVvIf/JDSEUbPuqVh6qL2nVui3jubsNC73+2VArmNr3yj+pNQx8PM6uQDRyYNHhpdNr
	paHYFxhQVF/KYHZ0ofV/SVpLakzWHkhAw0+Ife4MJu0GY0/DCGDpEsJ+bqqH6Edg=
X-Received: by 2002:a17:90b:2d0b:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-364ef67a4acmr1762301a91.23.1777619756412;
        Fri, 01 May 2026 00:15:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-364ef67a4acmr1762272a91.23.1777619755945;
        Fri, 01 May 2026 00:15:55 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00b094sm1424265a91.9.2026.05.01.00.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:55 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Fri, 01 May 2026 12:45:43 +0530
Message-Id: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9T9GkC/x3MQQqEMAxA0atI1hOIVgp6FXFRaqpBqZoww4B4d
 4vLt/j/AmMVNuirC5R/YrLngvpTQVxCnhllKoaGGk+tI7RFVg0Yj29SPtFi2CTPGFLyHdWOyDs
 o8aGc5P+Oh/G+Hw0ID+9oAAAA
X-Change-ID: 20260430-shikra-cpufreq-scaling-aff690130063
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA2NyBTYWx0ZWRfX9tMl5N19sRzO
 lMwCewqYnHyIFw644CunERuz3C2ePRtIin30yRoCYuP0e1C7LnXK+fQngLyMnRRVPoTNo3bsTZL
 4VVFVvKKFB7Iu08ulzQa9LcbYKMxGz7OwJBK3/jDuHI4rJi16tTODa9k1gT2y7efxlaQ8Bhh9mb
 /+Ji78aSkmShxR3C8eXcHt7MIo7wEzCbT9tfY3EvevrVfMGKO7pxpGxVvlKol//TdThrEmU8ojg
 3E1GTcGOANds1HN21v7mSIkkzzr+titu1Tca0NpCjBUWB6SVqs1MYyExlzKsslpwN6ic0qRcVOd
 u2gTxRoy0kDryXpQ79/8zyuSKwLBxMyFPIFuPh2EjklMWmBOooghuliYzfEToLPQvhioP3LQlWz
 I9oxcFNp9ldtS7HJop4Vd3UBEfh8Q3ZVfOwOkJFWr17yqcyp6uEkv/fO/ixQa7L1kvZXksdHtYf
 pKTtdRS0OUoq+URuKnQ==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f4532d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qdwp8Cu8RznD16sri-gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: CCkxh09E4b4M74VfETJS1H41Xj3fKYz2
X-Proofpoint-GUID: CCkxh09E4b4M74VfETJS1H41Xj3fKYz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010067
X-Rspamd-Queue-Id: F195E4AAF17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105450-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (1):
      dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ Hardware

Taniya Das (1):
      cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |  7 +++++++
 drivers/cpufreq/qcom-cpufreq-hw.c                  | 23 +++++++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-shikra-cpufreq-scaling-aff690130063

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


