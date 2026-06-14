Return-Path: <linux-arm-msm+bounces-113031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z8N2J81gLmq5ugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:05:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FDE680986
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:05:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jguO0wIb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XgrYuPlS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113031-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113031-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54A19300A51D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CFA175A9A;
	Sun, 14 Jun 2026 08:05:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2C27FB2A
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424332; cv=none; b=ZClJGSx9hWeY5FwQ0EWwUML3rile5OTKmLjgoGDFUyYvTKYSJws2VMBd0et8BqiHiFRbvTy4Kqc3wZDUkhAVtwdUt11RWoA86I7+YKivYeeQalAsjAizI1yyFqosW9KMVkJ4KhH/AsNSrVuIhhCcvY4f1ZVwL8pYcoYbaeyaIbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424332; c=relaxed/simple;
	bh=/4/biboWAkv1lQS6TXW98LH+lNEXeuQKoPDNn1bh87k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ds3SdFF/dMiwchJB1oHM49h1N5K3CQHKkBIgIQzKhniecw5Ha7hwoS/Psh2pVIeuBJmTJZTE4IGS03vIqOJdh4skbNp9ztBkLZAFLsjB+v+pXH+o6NdKqjhK13gWBKcrRpyLquyjY4uXpN3h8DiakQk88oc9v7JAqDEDCDmmeoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jguO0wIb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgrYuPlS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E4Atlg626252
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mRFq1wJZY/+H2wQ02QMedE
	DOCtcndF1/JdZtyF+mv9A=; b=jguO0wIb1Oou62VFt6rAVF1jpQAEWSjX2NMSF2
	SQMtBTDKiHNkf9YN9QHjGUyjUYBNI2tpQC48l1Fckw+knyp3SCg5IC2qRQOggPFe
	lDw8d6MFR8EhcfCZEeaJM6FkeeLhPSs1qCqbOyzhdi5vs6e/zVhUwSDAJGNzqDtQ
	sziJtfXX2smF3XTmDCFCZ8TW4+On7D2AiPSem2oeo45U1STnKXWJcGsISbz0t/kp
	qwBOB+r7N53SLXjnzM+5BOfGb21YtRdZMTSVAli8XbOWUto3+X+5ysJz3UYug1Ox
	XmIhJJqYIgTufe65WbWTD9Otsl8YjTFE+GtJKsD0okKrJnGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gu372-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso22752475ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424328; x=1782029128; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRFq1wJZY/+H2wQ02QMedEDOCtcndF1/JdZtyF+mv9A=;
        b=XgrYuPlS37u6wszk731NdtYOPMo/fWwB0Plwsw7tJ/kwwH+Qa65UbJrtmDmeEYJTdN
         FDolwTxqnEtyq11izFO1wa7+u3GR5y0+8pDsAzyHitIGqsRCmgl5/RPh34xMw/0FPVch
         JfRqc+HJo/rTt9IQIlAmOrKhR4ID6P6mPN4QTa1E5IVHHy641RboM4vDAYA2xYbmLqaN
         CMGWbx1tmPrUtaCVxLCZvYLqX0cZJd0Rc+yoC70wUyEhepbGvC9aH/C8QVTLkFgTivJr
         Vn9c/k5qsKZOSgY14ujwvI6QQidwY0KdzuoHiafGFCHP5CZhwWJEiejcfc9dxZT+ZKlo
         NsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424328; x=1782029128;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRFq1wJZY/+H2wQ02QMedEDOCtcndF1/JdZtyF+mv9A=;
        b=ooD9kMcZJDbrhuf6I1qy3wZFa4PglNxlNfCSRc2lXll1Xz8Ts+FTb9vQ0qj9tBqzKw
         ClkY2N8ZsBNbXBjpxfeHtWxp32kQvInGLwXkgcBdN/9IIKWQGXhNeRr5e7WgXTi27T/7
         9pEDNkXQdKdh/xmW93p1FzJgGxuHUyf4IExlYeaxoPG2f0J8eA0kviwYBQdmkzLxDBYh
         7O7zFuM+0bXIyr24D9TwDqUeNjwe/XbKqK4GQikn1/ZaiuvpDqkfuIfCzJlyE5oXHCtM
         8txHkkHnsqFXsA1WfAdQ8lcb7eNnG8myc+d1w1lx8oT4bLRSkZbEnBrXFH7JJ7WHeumI
         /yoQ==
X-Gm-Message-State: AOJu0YxrLemo1P4ka/6Zloi6XT8iBFHRYIzaA2C82yznY6zt379Oo7W6
	Hi5aVq15lJTRM3MEKD5kGssBwwEP5JAfz5WhW/kXMs9HFQ7kFxiYLrD9EtHk6HFNvrhIwUMb9wt
	7F4leLOCV06GUcJgESktWAEJv1loVQXnz4djsMsx3GmONz3UEz7hF0W8DV69XXc2OFygPckEiLY
	tl
X-Gm-Gg: Acq92OFsRn3DOW9WBoJV8Civk2arysUKPdbgt0gCco+fvrWD9PdBClw2AcYtN7ct1mE
	bRGe2GAcpO5maf6GAk4tfU+5M5J8DFJUY1bRPeZaI4FtkKQbJy69mz0au38fSURpoRYLLp7CTCE
	yG1UGP/tw/eSwxXyjN1Fk6d1mqlCjB4vh+HgajivqS253G96gPAApUvVEuENwjVPAJ9ojwHA1bi
	v3s4QMn3YO2WCxSWV3krjRK64D7bwZHt+VuVGKWpsIp10/OC8JMsFfBUHHioozF50Zmrd0V0Fx8
	EGmgzONpBs8mRu8Cw/uOyjDSTDIpJdIyX7OCtfsQbE9/76Ae9mZlNtdbuI84s33b35huSvXZENd
	TJVD0cU71marRaxpXssJqmkJ/me+c7TXMBSbimh/3
X-Received: by 2002:a17:903:1b04:b0:2c2:5446:30f1 with SMTP id d9443c01a7336-2c6641641c4mr71729015ad.14.1781424328388;
        Sun, 14 Jun 2026 01:05:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b04:b0:2c2:5446:30f1 with SMTP id d9443c01a7336-2c6641641c4mr71728685ad.14.1781424327907;
        Sun, 14 Jun 2026 01:05:27 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:27 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add ADC support for lemans, monaco and hamoa.
Date: Sun, 14 Jun 2026 13:35:07 +0530
Message-Id: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNgLmoC/3WMQQqDMBBFryKzbiTGpNCueo8iEs2ogWpsxoYWy
 d07dd/Nh/fgvx0Io0eCa7FDxOTJh4VBnQroJ7uMKLxjBiXVWepaCut604641K3bxMBKV8YgKgN
 8WSMO/n3k7g3z5GkL8XPUU/Wzf0KpEmw61XVaDk5f5C0Qlc+XffRhnkseaHLOX32o/Z6vAAAA
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=1677;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/4/biboWAkv1lQS6TXW98LH+lNEXeuQKoPDNn1bh87k=;
 b=0tM9O8UeBcxiP253ahrazSkkbJhKiFKpgBuqwlas1RQNm5hskfd4U/0beeuVbcom8lJxDinpZ
 2RgAWkKF23qAFAV9ZvQZyObeOWgLtUgLvQ0Kgfq/UusFdB+qlTHf1jf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX82gZX491P/t0
 moTT6pHNc7Tb4hELYzJmz4l1S+FAEQnEjPnVi8gMX+CH+tzp7MWabSZ3HAFUwuJqLhf8VOExUwR
 sK9A2JSmfDok2R8Ugn7qilT5M8G+4F8=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2e60c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vX_1JvrjfLHLsnB50K8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX9m/ZjfhDtQ6N
 MJYfxVV2nwyhVi4qQQv/ZCFrR5+zhW5wV7Usy/zKx2zJvIJ/U0lyF9gNNIvtsC1pfFLePBzLRf3
 ZJKArdLLg2VHNZP9ZRhqphBfIr+TzHCMQPxkjgc2fuXzNIwuxAPHv17aT+qf/w8v/8rExacvVdi
 rTQ4BW9RYxy8Gzle6GlJDpBD3sJWjx0VnI8u460ONb7MUD1OSKeBIROBL5RoBLEsdr6lXeMHaKg
 UkriysNGSvS9CitSHcWVvWWt2eWa3JvkKJYtZTsBIt6PQd22LL2O0lnT1SWEROGjzg5lfBMvZGe
 8FVWUiYc3TeDKh1mi2RmmIWKOv8XiBaL0c3QVYp7eYF3/Bhn1zNp/4Y0rc802m59ZauEPmWvFLn
 Qfefz33/ofh6ETAtJEMKeny+9ZUg+Iv2mcbUdYv28wEaTaNwDyTSCmanCzRWamaR+j+g3iuURnR
 TQmmjDCJGrfp3Rpawsw==
X-Proofpoint-GUID: Y8uEoYyiJp_G9uJzmbkCgtTfipfTHyX9
X-Proofpoint-ORIG-GUID: Y8uEoYyiJp_G9uJzmbkCgtTfipfTHyX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59FDE680986

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans, monaco and hamoa.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Patch 4 adds ADC nodes with channels under the PMIC instances on hamoa.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Added ADC support for hamoa.
- Link to v1: https://patch.msgid.link/20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com

---
Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi  | 250 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi |  93 +++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi |  43 +++++
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h  |  88 ++++++++++
 4 files changed, 474 insertions(+)
---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


