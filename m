Return-Path: <linux-arm-msm+bounces-109928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB4zGzSDFmo+nAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:37:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 127485DF7FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3826A3037D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 05:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F337430C17B;
	Wed, 27 May 2026 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOrQbIfF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="As3Sc9/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1E22DECBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860239; cv=none; b=gMb1YH7WCXkRlIpbrVNm+Q+esPywSRIv+pgMuwBB4rKot/3rT9QxclXqtgPCQvH2HBlcZIhe6nlreSc4GFxu96YWFRXEomq8NNv2H100dlqKRjy+KWxQH5bN+vE/lgilI4aiy+xNrKKC6INm5GJTq9H8SOgeXUb8KyfiF2kp8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860239; c=relaxed/simple;
	bh=36ClACXUF+S93hV99kFRclkoIYp0sJpJ4LbEPDHyAYU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fUG18eVxbnMhYdXrWcrB5ZuxLMsVF2PLB1MsGXtXF5aELGHkNf6lYC5nvQO2NA8jaNkWxc3A3DIUrK6LRTK1Fs9AvxFpluicVCBn2CCPRTASb8CP8gNAMx4UgdZWr5TdXwGjgTKUV9Inn/SmMAYnIl3UQ+Ru/KQZ+GH67yHALYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOrQbIfF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As3Sc9/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2Wv0J019336
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X49bnoWpugg91pnqIUZxny
	eQ9LEoq+2gyaH12CEWKSo=; b=lOrQbIfFgeyAJ4Fvk21pxdV+JQKtkxxnTyFj+k
	D5OkA5gOXXTbzyP81gWjcXhu286h8L/JQ+xyFdgARZM+qaJsVWi/K1mFfqdqoSNs
	p+Drt3gJyo3XJJDczbplj7xNxwoLRl5OExkDSs56sU+qnxihzJFCMvPOMole7uPV
	3FesfUqIA0nN9CMus3Qs0xXYHPv2bZgomN6RCC8xFzACj2AOcyaM8zAZYKhTsvIe
	XuWLWakKB2rIzI/GhL47NOLPWDmiNXnPajqN/FJBGSXgr4lfpKCRuYcqohHnGZSH
	gGvSMh/Xx6NF1ACsldHThhmpQlNgxDS4ir9pg8ILQ7hb/Ovw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddqktusq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:37:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc977e6aedso121488255ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779860235; x=1780465035; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X49bnoWpugg91pnqIUZxnyeQ9LEoq+2gyaH12CEWKSo=;
        b=As3Sc9/JzHF9tzmOsS74Rm8/j/X5Ihb+4pj7lWZbbiCeTSZi97ZPmJG0xmjaq9fIkg
         lQ7jZyazoX4KvLDegpKrF4Q42hh9Ql60568i231AaoR98BDCeogGg8Mkb9I1QG3O78H8
         imeXnLsFaIM4QYmPx5+PLFvTReyeL5o11HCV09nTdJgi/W7EpfcYBYIAQXj0adepLsDF
         7e9AJ1LZh+80aoXXVTc26RV4ky02zJLLlG+Pjhshnvt768Y+5KkcVMN0FzO8OsB6vpgb
         SKsg02yOM7kVHa4nfq8TfhsttEfN9OJzXsJeBMmMeFpPwUY9LlH9OD77vvUWWnuGM9h4
         PuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779860235; x=1780465035;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X49bnoWpugg91pnqIUZxnyeQ9LEoq+2gyaH12CEWKSo=;
        b=Y4DbVudhJGt0xsXBM1Y1ijjFxmrVW2VaJNOa/Ey7MYwWldjJyJL9vK1tpZ6jfTk4Rw
         hzd+AagzPYEIewzGENMuPylRqOODR5S74vT2/bhiL8OF1bg+KXYWb5NLY1K+NOCmUCbB
         WXNnuCPDpceM0q/7lTiUozR8JeD7MLosX6ZUtpVewFYVLQkr4aTVIUfCkuz6Xe8t9/WE
         dx0a/1YPVjgJYE+K5Pi1pLTtTs8LRRNujI6OXZ0C1cZ8K09aKkzubn+/3rO6Xl93Siuq
         b7EcJeRUVZd1zkyfIZuUCkLh4x7IhMzu+MTzM69i/8FlKI6s2FalTBdpUCl0qCTG+l1p
         Ym9g==
X-Gm-Message-State: AOJu0YwP0r+YdV9RuqQiMJRXZ/hhwL0q17kB9fSVOFqCyGfFzbiT/MtN
	ZBlOH2WR/77Y95t7im+uWFxVvSnOhQWN9AuN17qeWSmDV3p3s8wUfV3Ou21A5bbucS2VVKsZLGH
	g4qZL/476+GYr1YCrWBkzAsLWHaINE2hw1ZlTchPD24w7NHZumDaQtc7xNLaugHle+LGx
X-Gm-Gg: Acq92OGjoM6hVfdSuxU32+bYvNGMBzodTzSx5ZTYq3phKJbGcrRfP/vjiNDLDmWKt3g
	cvg1h4zq2VFhAb+/T2ZsCdQf4RFOig3+On5+etS51OLA+/0Ey4CiKBTy+tu2nWnBtgS78xY3MG/
	gycxGIETjzDYRWOigVMlTW9n7IrUo9Bj2ywV/Yc52rwGQTqnD4naZpnGUA2fU2w9bX/dKCs8lXx
	jETPywz5ybEM9IHNmx/+9l8GS/9hEByRVcJ7zUfFpFCSARbkUDK35uEI5ICbo5lcAzIUJ88P7Zb
	WafwH3OrFgOl7BN/CEEN60DFqdhazQYnQOsEtZTMreltHWOst4MfQv034VUSQG4AWrI4vMP9afo
	ap9lHHlYNTic7+p0nrjG+pcMEaNcMvWbM2AHp0HR03sCO5i7EwQJtSgs=
X-Received: by 2002:a17:903:1b70:b0:2bc:cf06:6835 with SMTP id d9443c01a7336-2beb0346047mr230299185ad.8.1779860235529;
        Tue, 26 May 2026 22:37:15 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2bc:cf06:6835 with SMTP id d9443c01a7336-2beb0346047mr230298895ad.8.1779860235068;
        Tue, 26 May 2026 22:37:15 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm136338585ad.16.2026.05.26.22.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:37:14 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable QoS configuration on X1E80100
Date: Wed, 27 May 2026 05:37:08 +0000
Message-Id: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASDFmoC/1WNwQ6CMBBEf4Xs2ZK2aQA9+R+GGLosUiNWukAwh
 H+3oBcvk7xk5s0CTMERwylZINDk2PlnBH1IANvqeSPh6sigpc6kUUbMigqppLz2nkVeHzMsrMl
 t3UCcvAI1bt51l/LLPNo74bA5tkbrePDhvf9Nauv91Fr/qyclpLCIumrIIObF2TOn/Vg90HddG
 gPKdV0/8/2FHsEAAAA=
X-Change-ID: 20260414-x1e80100_qos-7d96c8b47bdf
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Zubd7d7G c=1 sm=1 tr=0 ts=6a16830c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=sTjs9E8jwIvs1E9oOeMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MSBTYWx0ZWRfX1Qw4fD+U3LTH
 x9fVM+rgc/dKu54G//GUlGSgXG2raYL6pNhPtQn1mJVMN22YArOWgdMqXA96Gr8XIFTH+78/nub
 15J+ffdHsG3S5YTtQXkvu/tctk4P6Q5Kc0Ws34QZQK2TcOwtIwee8WIL1aazN0Z1Vo2dTr3Fz1I
 0Lo4u0yBfv8IEgJx4LvuSUKJKqE0PItYXQW2sRK6OCgAAW70NJHOAI0eoHF55cXt6XKw+3xW1hu
 /3w/FG2Q6aGyJjN2oGJG2SyLslbzfo2z9IbUOTp3LVmO7LP6SJ7SfTeF3rI0qg2As+xQZd/QPw0
 AdLUgois29/linDDvs/VqZhPOfUT+4cwBSNZwq9BGadC/suKMP7lmmBL9IWfuXzdb/HGcwVHSZ4
 nAEFYV5VRy8jSCqMupSV6RopQXptd+76MjwHBixjQdrKtv0rrJ4OxcjAXC3o3pHJmZEf28g0cOU
 JrNeJ6i4LnNqYFTNyMw==
X-Proofpoint-ORIG-GUID: ss0wFR1nspK5Kl8i-6NWhsY-rWb94fzw
X-Proofpoint-GUID: ss0wFR1nspK5Kl8i-6NWhsY-rWb94fzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109928-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 127485DF7FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables QoS configuration for QNOC type device which
can be found on X1E80100 platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip).

The system may function normally without this feature. However,
enabling QoS helps optimize latency and bandwidth across subsystems
like CPU, GPU, and multimedia engines, which becomes important in
high-throughput scenarios. This is a feature aimed at performance
enhancement to improve system performance under concurrent workloads.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
 - Update the dt-bindings to make the clock property optional, since the
   device can operate without QoS, preserving the backward compatibility.
   [Krzysztof]
 - Link to v1: https://patch.msgid.link/20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com

---
Raviteja Laggyshetty (3):
      dt-bindings: interconnect: qcom,x1e80100-rpmh: add clocks property to enable QoS
      interconnect: qcom: x1e80100: enable QoS configuration
      arm64: dts: qcom: x1e80100: Add clocks for QoS configuration

 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  |  72 +++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   9 +
 drivers/interconnect/qcom/x1e80100.c               | 485 +++++++++++++++++++++
 3 files changed, 566 insertions(+)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260414-x1e80100_qos-7d96c8b47bdf

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


