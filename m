Return-Path: <linux-arm-msm+bounces-118171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tdPVOq6WUGou2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85296737D44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ekK4ZpbF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="OYW/SLhm";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F37B53006790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74C73ACF0F;
	Fri, 10 Jul 2026 06:52:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC86377579
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666347; cv=none; b=rnsJVy39V9D9szUg5djBV3TxFzntwCyMLcJV90A0HLh8BhSUfzSd3QXbBmAI3OiDkGHfbcNx8e+Hd4p3XhNI0vMgwmrJGjQE3NqUuAKLS9lDMd3YeqKtpuNhrOwo8KG4VR699Rnrgte7mZe2FoozjxWXWFrLx55sRKdZCSWT8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666347; c=relaxed/simple;
	bh=/7NlMDFPZE5oCC63nxSuncrInQZHPAi8dRAP0la18Rc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pRH/3TzsBy0G+kFfvKscPeYnF8/XZvDMO3JmYiyH+YeryduBpvt5AUoNzFm+vaTEfZg2/AOrvmKa/WOIopYlfhNKKGETwQkoo87iHKzUzgLJs8i7kWC33qkZn7yoZIlnv9O8eOagLajn0vgyfUIzGNTbRpZpUT9g2GJIc/OWl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekK4ZpbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYW/SLhm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3owbI3855117
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i3TdefvualQUIkfoZUHTRi
	JH9VXmvoVYkXiMD4zAGCU=; b=ekK4ZpbFeuajeaHh4dGGF0/B0Spiepp5S9nS54
	OHFPFIw8AHa6YUf0F9I2pv+GWh2K7jUmtkjHuP3P6/map2cOkhioG5JvxmFVtHVE
	TviHHMHTgP/25Zbe3YW4jnch4CalC+eEEG2qmBQQX0yHBjva396ZmCgD2oVfOVOI
	1mGoEL7FCh0phvLMAW3o8hslT08nvBxqcjLFGI92OnDL2ekjTrYyu0bC9VQdgn/u
	adGfsGOHFP9FZkStMxPSOvKGlwZFN/pWpDqgKfPqkdGGrqyrfFS73jWuoy1rvfp5
	Z7dUIx0aUFThdoMVFeQd+dpQfCNCyLHhcPxyHPtZ7WX6YgBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n0mtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so635567a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666344; x=1784271144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3TdefvualQUIkfoZUHTRiJH9VXmvoVYkXiMD4zAGCU=;
        b=OYW/SLhm1278VyIGuqp1zE/5YJxSa/mnq1fJ5ChUtZJOd2B/+bW8bFQs4FpAWvDw98
         ILzd5m0JWZibWBwVaxuhMydiJTIhWh97R//gQkw80rPOnrvKxy0WQYz1g//PTMECrNJK
         BoSU7jhcK+tvSBLSrDi+wr7NlqEjWeB9KGbEm8cdLG+dxQdnrxOjlUkhw9+E0ZXwLvjh
         AtGTMQXNJ9hc5NcPr1YXrbAtiPEPEMtZl7ZIJRIQK1PvMzOLQizXcNybvzWbZqCH3PhZ
         3UJxDi+Tg14mpfwawlN8CTeC5fhn8/SLOguNvO6Q6p7rQoaWUm/18P2KpRdRYBr3mxu8
         runQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666344; x=1784271144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i3TdefvualQUIkfoZUHTRiJH9VXmvoVYkXiMD4zAGCU=;
        b=hbKWittZDVMzb+kYPDgW2cFXPG70VxlEPz4xilR2l2jMP+zORZOi4EoPlkaQxxOyKJ
         4c7XeH/rJm0N/vYUrvq6fEEJXFvztYuL7TAok/r1MgxKy5MtI8FsMxONPTzWYTBNcVGa
         qxcYrLIxpg7haoG6PXKV6DeENh5mOZ95tnU8JqHXTbjRQygvGzq1zqQig18aDwAsPpHj
         iZR8kd/d5VPrscFpYWziZdJUaXboV0sf1k27/BjPKKF8gfiPAqEGn10B+qJjnJreyvNr
         E0ChVQ0kgK6WE74c/kapp/jCqx4XMCjlKlS1v0tFAoKFV11oGjuQGhSDAbXrz9iLKm05
         8Slg==
X-Gm-Message-State: AOJu0YxymW0loizxCuGjrzhIRq7QS+h9FYWbax2dnFGWIn+BhmPsQ2UO
	fc3P/pfZM9A7wm7S4iQbSBQf1w+0yCNLnhx5DvT3OFFIZ65S9GmEl6G5+dCTAX/VTIq/URtQIBi
	YL92jZKG4Ir+m15PBmkaoeibtjIsW6w6S+8/PZNnR1842VN7k+othNuyO/y20bLhZ4vEz
X-Gm-Gg: AfdE7cn2WK9fNvYqxS70XY6s6EBSfL0Wnw+sHiJDAecGKnqLDgdRvXsYRP6n3Qt+uSq
	NlOLim9YUuwc1lqsn4W6IoGAyCwrD9pPvz2aZKUfg/1fVDVElBcvNCHACfdvXp9Fm4KvAPMp/th
	Fi1zj3FL1C1x5iJUGLhLzrTP/WOFI2VHCangMwPRxjH4cVkrJgSQ178iXXqIX+0jhidK24Lgkx9
	Xy7oiirEmfLF3Yo8aAi77ATgZR7leIo/GKs30JqkYwbzyXnql5+FZxRzycG6z5h2p6cvUigwQPk
	f5isFrzLdzkHQQ0BohGRv5rK/IExajg78jc0q7KO1dv26SYyEIdtIoq78LOU0FhbsLDM6IQ2xJA
	tzymlQHmVOlClEZYrGqBFKGL/lvSekg==
X-Received: by 2002:a17:90b:4c10:b0:387:e0db:bc25 with SMTP id 98e67ed59e1d1-389421a5981mr10559400a91.37.1783666344315;
        Thu, 09 Jul 2026 23:52:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4c10:b0:387:e0db:bc25 with SMTP id 98e67ed59e1d1-389421a5981mr10559369a91.37.1783666343879;
        Thu, 09 Jul 2026 23:52:23 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:23 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra platforms
Date: Fri, 10 Jul 2026 12:22:07 +0530
Message-Id: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJiWUGoC/32QTW6EMAyFr4KybkYhgQRY9R5VNcqPU9KWgYkDa
 jXi7g0MUhcddWPpWfb3nn0jCDEAkq64kQhLwDBeshBPBbG9vrwBDS5rwhmXTJaCYh8+oj5rZ88
 4T9MYE2VMtbJmYJS0JC9OEXz42qEvr3eNs3kHmzbSMRHhOme3dB8jAyDq3a0rDi9+eFGX6CIpo
 9JIa+rGmUqp5xHxdJ31px2H4ZTLhjUagW6NkLoCLBNtyaVRXtsKhPaiBmOt1spK3xrZqNropiR
 bxD5gGuP3/oal3BP9d/FS5ji1cjVIq3yl3N84G3XhvyTF2ocknkmNc1o0XhkvHpHWdf0B/inNU
 qgBAAA=
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=2599;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/7NlMDFPZE5oCC63nxSuncrInQZHPAi8dRAP0la18Rc=;
 b=/LzLjqyiJwHFSxBSpktFTMkp0HXAElF4AO9I5OprRkOo/QbcF1+lT53Quz+AUxhjQ8mwj3683
 4PWBdozDIhnBjvgXF7Krq7Z9S7AealmOW4qWvptJrrBcf4w1/FJYSn0
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX3oUJ9MPAfM52
 kicf/XIUaWc7ec5jx8UVI7uhrnen6nOReq6qJPxmVHyhQa7bSrWtzXtvo+m+wnozIK9Vp23bIUa
 Ml2QijoxlQ7gDzYc38isM2Akm3RF904=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a5096a9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ehwq6YvRiQ2Q07RnrmwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 08PdyjY4LJtAAmrzMBXSSx1ZUW0DI0XO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX2Zo0utCNvKO6
 R2RQHIM0G4PeCbqpiSVjNu0oK7fIHe0v2wsFIVr0HbOZ8WnyV98rPNX+rFiep+dx7UNh/XO+m2Z
 ds8tAf4e3kXwFwcufkWkVk1ewm11F86h3+RHnRo1Xgpl7tz81XFkXZE8Nj1lHwfixcc2NhRLlT6
 /CTE2uglFSg2oULH0/LVoEluk9Nv6hJftsA+OWGYgNosSb+9NlssQK1307OEzwYmEyxPWF4yhQ7
 CqBo+b1zMZv25hvGgLVtdnXDFYI3d3R5+503dsittzAnBPSs+9Id3EDl823NQxngU27FvsdetIl
 3kMg8knedCKJG9CPuqM91EZPaLciG8ACF2r/vQigtEODRYT3ZQrqxeBG5a1waGoJslvYrD2NOzo
 JAHXqwnqXGx1MHTEUnu8n2qjZehV7FH9GDzVZABRTF7dciUICRLk0bgZ7r1O5KZLwamBT23wOIz
 XPuPiWFuN6jXe2hPIMg==
X-Proofpoint-GUID: 08PdyjY4LJtAAmrzMBXSSx1ZUW0DI0XO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85296737D44

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Dropping the polling-delay = <0> property from all thermal-zones as suggested by Konrad.
- Link to v2: https://patch.msgid.link/20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com

Changes in v2:
- Move thermal zones to their respective PMIC files (PM4125, PM8005) as suggested by Dmitry Baryshkov
- Rename generic-adc-thermal bridge nodes to therm-bridge suffix (msm-therm-bridge, pa-therm-bridge,
  quiet-therm-bridge) as suggested by Dmitry Baryshkov
- Update commit messages accordingly
- Link to v1: https://patch.msgid.link/20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 104 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |  35 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260613-shikra_adc_support-0079650eb76c
prerequisite-message-id: 20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


