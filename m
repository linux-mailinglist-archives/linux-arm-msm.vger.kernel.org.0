Return-Path: <linux-arm-msm+bounces-119256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ti45Ho+LV2qfWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:30:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D275EB29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZzZxgmwO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HXNDdUir;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119256-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119256-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 668F7306A435
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D62241D63C;
	Wed, 15 Jul 2026 13:22:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF741DEF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121754; cv=none; b=iwpLzbKIy4RNJMuLwIPVHZ+ad4nrPmVF0Ke1HHx4Z/TbJB7UKSNWtGOeiAOJWmzHbw8TNLbAqRmtU1+gkg3uazm9wcMf16UhrrQUDwlM4bcHeUD6nL61qZnN1eceWPfpBKc7gOVz29ZjmTw4qtEs8UvoJpfkfjaM2Lg9pgH5bd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121754; c=relaxed/simple;
	bh=68eZgRgdcmNjgSdNgODpVZyt9WyIdiTgG9qRJjHQTdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6lO53wzoRXU3I9Sg8WqJHmOB5gDhs51PQHHcupfaemHDggJIq5rqLE2G5y/R9CyVqbN43ioK9w8GvYLVaWTPlZqQKMgz7XSVZA/xqLdd/QAzfl/BISMq/z7afud/p40+ppmvg2tWWha27sflqSDEV/No7ggy5rSdrOsrLpNF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzZxgmwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXNDdUir; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcesI3338715
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3pOrjFkRPKJ+aWas0PAq89
	n4Eek6ceWASyL+xpbnAwE=; b=ZzZxgmwOcK2eaqA+o4aID1stj3d10JjCcbGsdX
	+/Oh/RVYAYFqxmtB9/SaSWsAWTxFJsFKLStO0FdJumnULMadB0dDxHVC+CBVANEy
	ehdwlhNhmiMuJsPMuV/hBmxLj6cmpppthRyvWwqNakt1j6N/fK6u2NhnhaTatmbp
	UvLHHt9U5Lfxq5670y3pbZ2Ysc4EQwOOd4rFE7FNIqembjlxpyd2qpL2dSVIyk7s
	gA4iUHRxQNXe/rlsAMgqNj+osB33SkkwGuBVPoweOKbN/2+1DfTmD82y2vFtw7Ab
	0h/kA0MSz4PI+RHy2o6e9625uBDal0WQ5+yJo4I1sEv1PnRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mkvas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so891708785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121752; x=1784726552; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3pOrjFkRPKJ+aWas0PAq89n4Eek6ceWASyL+xpbnAwE=;
        b=HXNDdUirD3IW5y0cWWKLvv8f5ivDTNoR7ir9SgnuTXEydS/DUsj8H6A0rJqRCU5NCO
         D8vn6XI1F1cIhsvoPDxvwyb3q6YNMqPOlbEwAU7kOk4Qz97/zPWpPyh/3LrWn9DoSHoB
         DZjLFRx5yEZO7365twLSpYe42F03n8Ldobm1Q0syiXo0ShYUgHSwv3kRpgrPaq3g+yHR
         VH1AFJQjDhF8wNpjIRh0qoVY3U1MimjGg+gKtsaq9lxt9OA6HwQBATkBhNk88/caxUEm
         aRvsZJmEAvEEuTG4jNZ6YSTrHbJ8OobPplWwadZD34gLRt1/Voj9scja4hK5hqo6iWWM
         p0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121752; x=1784726552;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3pOrjFkRPKJ+aWas0PAq89n4Eek6ceWASyL+xpbnAwE=;
        b=ZlwYh8/mSDx9GxlCNb5Cnynk2kq3Ma8nNm9BjgVQV3FM7dZCxPtx4G9VJw6sMQ37s9
         xShNAGgKjz2QFficnlPehXKiYlQCaJK+8khFmS7w/kgpNdGDTujcWoxwYBSGXHg16ctn
         cbaXnJ3Ld6uiGyVdcgbpSfsciGyqGTo96DbLzYy66YGs04MK1935rnldCYMcLvGm5wpK
         SZ/CNo+D1VNCwFt4Jgsp575NHDRTCQxWGEVHysH2VwuKEY1A8QKgtFDUTqkK92iklkfI
         X8NCPTlFrmjj0uPfwtcHXgfk6Mz6hD6NDPaDgI7UvLRsCdU6TKC8XOY57WyBBj3qwev8
         fX/w==
X-Gm-Message-State: AOJu0YwcJ2Ew8+eSc7ViZ75Pq3QMqEFYZBkpuG4eeEFKO87rqvH3ZPUT
	fp7xDCkBwX/5JMoCr7InXP0AJ4FzKTWQ46qT4nhsKXp85K1JrsiolUJVcbNCMRxjrfIK/GCXv86
	y1+1/xyG+3SkhlVySGOJToJNai0u+1GTZl8U85Z9qb0XpPoING4/gxjhL1zEJZrSpB8lM
X-Gm-Gg: AfdE7ckAK8dYjSXzjmArvovjDsZ9/dj2PDk+7MDBBg/Betq4ZrViFVoqbU79EqAzwhj
	YExPqkH0zWrQzg2AyU7V7cBgoPozAvVV4Zqc9KT1O9ZvvilA+pU3eCavfRZ7mK3i4n0p4bALf2M
	zKSk62rfPv/j4a1dXk5xr6lE1YptRfHSrj8BEQ9NylamkHx/YUVYzmpG+1yddqa6xpUJT32q955
	7vyOxoug5vPB6NVHhXegOj7nFCtkORhlGulQP/uhCgP44zyJJIy6ICjADA2+Nat42wP79Nt+6Y6
	kdaZ+4LcsNq5oX9p+UIIr2bOl7X4NKBszaYz7SeFviVQ2ZbiFVvUHyLr4x6nQLwt+R9ZmB3eeMS
	0Fm8ICeifN6wA+MRKG5zDrSUGkP0wxcuSN5EjM20=
X-Received: by 2002:a05:620a:40ca:b0:92e:1725:15dd with SMTP id af79cd13be357-930961fdecbmr278938385a.26.1784121751499;
        Wed, 15 Jul 2026 06:22:31 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:92e:1725:15dd with SMTP id af79cd13be357-930961fdecbmr278933785a.26.1784121751041;
        Wed, 15 Jul 2026 06:22:31 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:30 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v3 0/3] purwa: Drop the Hamoa PDC workaround from purwa
Date: Wed, 15 Jul 2026 18:51:59 +0530
Message-Id: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHeJV2oC/22OQQ6CMBBFr0JmbUkpUoGV9zAsSjtIjVBoKWoId
 7egiRs3k7yfl/9nAYdWo4MyWsDirJ02fYD0EIFsRX9FolVgYJRxyhNOBm8fggxKkqTIKU/rY87
 qAoI/WGz0c++6VB92vr6hnLaCr2Fx9GFk+mmtdpOxr/2DmW3pv7GZEUpypcQJG5ZJzM7GuXj04
 i5N18XhQLWu6xsrCqyW0AAAAA==
X-Change-ID: 20260616-purwa-pdc-198063b482b9
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=2407;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=68eZgRgdcmNjgSdNgODpVZyt9WyIdiTgG9qRJjHQTdo=;
 b=O9/mA1inZpijsnLStbohm0GFGrbot4fkYzzOBJ8ujvdr2Mw8Qdtdjh0pjbJmq6lAKPH7wiG6I
 8u9+ZHh9qJBDVj8tozpJ/iZSze4hSWY/0gc+Y2Kai6yScZZq7hsHKyS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX2+LZWnf4F4Jm
 QFxpgHrV36dgaTjMtsi6/l764rGHwWsxsJiVfNWuu41WjjqUXsoPn8lOI0FXyxKCC2DUXNolclp
 EuEFbCaxHUTEUdjFg6LfdPkYz7zB4hJVy63bD4mOnIUyXt57/K+Z/6PU51VcHAmowWH6KrJF8Bv
 j6CVRp3qUjCaiYmVGFTME0YmJX4jBUCdfGkHcvvvvXgESXpUcJeGnKcU7RY4FSQ3ifg5TxfVa3c
 TGahXRMDo3ebbOnVqB0vyEIt2ZWdjPaVv+Dkg1XuVB+VGNlgO8P+mUsl3YfI3cBWSQPAd4qICI0
 jnT9MNuiG4I8iC3jp+OPP7AVcKW77rYURaSErokPyVVwN0b3TQyK2oFLBGKgXvwat2NkimxGUE1
 ykhkjrAN61UY6pji2iqnAGPGYd0J1H7lwlZJm//nLgfCOqK5CYlHKHy5ayxnUi2z6+gxqifTygs
 KeKTAUk+ykGG9ld3oHw==
X-Proofpoint-ORIG-GUID: 7zbw_j4MjPe0u1B7cj_9jANtLQabyn7Z
X-Proofpoint-GUID: 7zbw_j4MjPe0u1B7cj_9jANtLQabyn7Z
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a578998 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=byf8UBOB4SDztmWUoWAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX9yttkgCnilns
 8j9rhhD+k6XdFvnlPIwEQ2OA+1PIfsjM3bB7JPZMUDlLyPnmiubP0Ud5qBuExwoDrff72lE/Dyr
 x3IW2Nec7aPTnySqVyhje4ljkc4EebQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119256-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 497D275EB29
X-Rspamd-Action: no action

Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
added due to hardware register bug mentioned in commit [1] which used
Hamoa/X1E80100 compatible to apply the workaround.

As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
compatible to avoid applying workaround meant for hamoa.

Patch 1 and 2 are not dependent while Patch 3 of the series was dependent
on [2] patches which are also already pulled in linux-next.

[1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/

---
Changes in v3:
- Remove the dependency (b4 prerequisite-patch-id) as dependency is merged
- Rebase, Add reviewed-by, acked-by tags for first two changes
- Link to v2: https://patch.msgid.link/20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com

Changes in v2:
- Remove Fixes tag from bindings
- Rename $subject to use hamoa and purwa name
- Add comment above compatible in devicetree
- Rebase and mark dependency
- Add new change to invoke SMC call for purwa PDC mode setting
- Link to v1: https://lore.kernel.org/r/20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com
---

To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (3):
      dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
      irqchip/qcom-pdc: Add puwra compatible for PDC secondary mode

 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                                  | 5 +++++
 drivers/irqchip/qcom-pdc.c                                           | 3 +++
 3 files changed, 9 insertions(+)
---
base-commit: ccb82733ff94d656a66447c374b16ecfdf8d4cb0
change-id: 20260616-purwa-pdc-198063b482b9

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


