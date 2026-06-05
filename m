Return-Path: <linux-arm-msm+bounces-111388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HxdRJdSwImrAcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:19:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37721647AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ThW7AMW/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IEdeIjhF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111388-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111388-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40039301A0B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EFD4D8DB5;
	Fri,  5 Jun 2026 11:19:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491B4D2EE3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658370; cv=none; b=HaLU0z2wuGVCcDF6vjT9cYOU0NuqG7kVFnn1xRNkL4iLppsdE8llSO0MdIvvkJ1EmM9IbUCOIpmpLPTejr0Q4Yp8PtOmYvLULnWemOxZ0oCTmToEfq78fWwyDMKyizzNta/TIzFQXqxs4KcBYHCPzIRNCYuiGlqCxYFe5tH/qJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658370; c=relaxed/simple;
	bh=Hno3yiqDgD9bZJJwY7n5fLKWiLMFOXKg1w6K7rsVM88=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fDM5iB1Z189G9Hlr2RU5dEua5XQeRLYn/lyfvr3aF2VGjTkQ/BxlocTYXCfmtmHVBnI1RaHGXfAYcYqKuJNtTfpcb799AufhOJluojl+5lOLIj67n9v3nXbZ2HLcndng9cst45ee0gaZ8s0aa35d7a07UUoDBTYVEbAisPEwc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThW7AMW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEdeIjhF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559Vm4b820574
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FQqVQt5Xe7OTDM8AnHOfVt
	1NXuwCB3WyrISJperJfGU=; b=ThW7AMW/iPZ4fmrXI7tfwQs2hv/iXvBblj7btD
	0WHSUVdV5zSd1i0A6d5+IZvomKvdLwwv5dw8qEBsFeb1C+4sYuWSBVRHdchdi7Q5
	8Ura+L5bZjjW4izWSe63gCJOJzYRXxTW56GzIqe1tTZsRJROst4lOT8Yz875UwGY
	WE1DHKjCuRyULZ0xHKlzk5nXzoIRFGWejRg1vhh9+82PwooSIILDX3FDvSMG8+Yw
	od+PHFy1/Hk+kjJ+vXqD5uU5gC2quPI5f8Ui8Ofw+2OwaL6BN7/aoEue/1cwucSc
	xgn6BuKinLsYqQW//o61SwMOE7CLFeu59491WZnoR5QZERug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbhxyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:19:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so14894625ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658365; x=1781263165; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQqVQt5Xe7OTDM8AnHOfVt1NXuwCB3WyrISJperJfGU=;
        b=IEdeIjhFL9c3LYeF2ZxU6YNlZ9kRP34naCrgLfkxkv6sI+OIFrkScZbauokSs8YhCF
         FQ8ge0PQPQH1VniLx1N7GnSzA1MCC2KSw75bQE8Ur96wvkYrcxJbKHLvWAV6ObwlF1I9
         AGl2XD0jcwrPhThVzd6j37NubRMQLD6N0u6CZEt+NfqZcfPm+ZznhuXFPNfm0BjhVGIx
         3cdkuurXWaIRexuOfqm0UK5f4bkTK64quCcirNQPS9f3ePCwHzIr0Vq3kYVAsGpHW/Oj
         RE3mHgnYQ2xuJuyGGBWTHOqFlEhLcPbcmdXZPyIBLoSTosTZK6LhBA9Z99Qzv93/Somt
         BpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658365; x=1781263165;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQqVQt5Xe7OTDM8AnHOfVt1NXuwCB3WyrISJperJfGU=;
        b=MeUfZ3vXAdeulAD/XCpmRB4fDua54K53ozW/IZQ3rEntH9yqPuFa2Mn++WSfbZvUsy
         A53pHZ1gA7nEkL22+7CfhELL4Quf9EEEo2/gj3m+vspPOKx0f7wPC7mzdtyvi7TmoJaI
         TF8Q9bUFIS/OXZ0IynX+ce59LraCzGLVmh6jX4mAK14HD3LNuQxmJvQEz/r5dFciQOBJ
         piiJxObHaIy0EYiljOGYAssdEMAEPrDXBosoeFht80hod0NiXfW9Rk8DQhoj/IwGvRi7
         ze/jkGIHf62pN7QUbbn57kkBK2ikzTy3vBsmyNxOkY0E/KjpDKt94hMqg/oCM/1B3peC
         5wHA==
X-Forwarded-Encrypted: i=1; AFNElJ+yIOZkxG2Z/SN36Yi18xywKgnSygqCpn7GwragM7CqWNrZiBiYmD0jyq0Mvl814Do88inunxt8d9VPCx8d@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkbKICTLIU//ki9G0To+vZprQN4kTnEFpJFhgSW3ge+9+mv9s
	9zKfzrGr5mGUJi4jdsGaODLC4NzFSIwnOaFFAhZA8y4K3zB7Oi5jT/rkA59LFSf0t+cC0ZBeEbZ
	iQ6RtinsC7R4A2e9I/nvLdiOMdZG4HbxGqulNIWl7f4XTIwlS0SYiVoyNeUIrIZ6TPz3hMiK/xW
	A9
X-Gm-Gg: Acq92OHPMj8CgiaY3CEriuuFKkw52D/ioe3jwVMcQVnIO/0sOWh0drPS83ooEaAnJA1
	dJw2L5KAq+Eavqlo2jusw3AjiJauF2lRg+R0rxlw1jRKLW6eqtcZc8Vl9kFXZpMzoAhO999tgLU
	A9A5Da09KvnrIWqi2IIOwK7It2/7rXkIWHWUSumlKyUqBI8kaxFyB+tFyU8lSVJ+ZSHGr4fjV0i
	NJr3Bbmp6Fwbv4dVASNKINRTGYEjfWURsNRtligu7/yT987gMXsGoBtQzlkYCnchWA22BXSLOak
	mvAGrmBd+M7Q9DEXKq6SEIbok/yWgywScVLyQSYZdRryghPzzxM5fXUMiHe3OXskTLkATML45Zh
	FvD2AhN3L/rVGdXBCaWCBREHR5My2N+KyAyBQ0yJWonyxA9CcK1w/2mMx6dSVWAQ=
X-Received: by 2002:a17:903:4b47:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c1e79e2110mr32863335ad.2.1780658364709;
        Fri, 05 Jun 2026 04:19:24 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c1e79e2110mr32862645ad.2.1780658364171;
        Fri, 05 Jun 2026 04:19:24 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm124551665ad.17.2026.06.05.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:19:23 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Fri, 05 Jun 2026 16:49:10 +0530
Message-Id: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6wImoC/4XNyQ6CMBQF0F8hXVvy6EDBlf9hXJQO0CCDrRIN4
 d8tbNhI3NzkvuSeN6NgvDMBnZMZeTO54IY+FnZKkGpkXxvsdOyIAMmBkRKHxrVe4lop7Mcuprq
 3ARMomdHWWloBitvRG+vem3u9xd648Bz8Z3szZev1nzhlGLCiSgvBeVEJeRlCSB8veVdD16Ux0
 ApPZMc4FEcYiVhBCS0qSRjkcIDRHcshO8JoxESuGOeWay7KH9iyLF9pdHWRWwEAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a22b0bd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vqexoKkBG-sCeqS34qIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMCBTYWx0ZWRfX5d57tBzJj2+K
 XrG69Iadp9IX21IgQH3AL+GKuTtnwGiizD/oUMucdAE9Idx0e+oR1h6kvcrRgVE4tGcdfYezUIL
 rV1/hO9989AdxbABPxuneewGgLUCM7p5JjfD1T1r3vE1Pfpbp4mQ6uf0ksKpXhTtVxu6JAMg6Tb
 G8FIxx6Flag5Ym/bGmrVnw48qlsK6LHBqpEjI47PMNMCpnVUugH8ve7Vo5goox5GdsymVIHKCTf
 Wwp0RKyXtOniDIgOh7OfG/JmRAsA5xSpYiG+vkLbJr1Z4kQ6q1k0pyWdoLVoY2/+f1IPruxGQ/1
 xNlvrjuP1rbX5D1uMG/L5tqpKqv11KWn7Yz7TDZhjdN3X94y76ispEnvDYtZNPu3dQNQR2rqlUd
 LA5jtzh8ccpSRqHD+51QduGEIB0Jg4lio3ixZIL189jBgbux3kpklnikF5IngIjceu4rUWiEmY5
 LF3LyafRfazZ0dlaf5w==
X-Proofpoint-GUID: 75no35pIyqL5ZhBlQfpi4m1_dlTkqh-Q
X-Proofpoint-ORIG-GUID: 75no35pIyqL5ZhBlQfpi4m1_dlTkqh-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111388-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 37721647AA7

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v4:
- Updated GCC critical cbcrs list to add GCC LPASS clocks which are
  required for Audiocorecc register access.
- Link to v3: https://lore.kernel.org/r/20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com

Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4431 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4816 insertions(+)
---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


