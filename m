Return-Path: <linux-arm-msm+bounces-117577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xqlUFk0mTmqYEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:28:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD4724515
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:28:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+UHi5vN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZOztmlJu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 548B830A7A12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE50537C936;
	Wed,  8 Jul 2026 10:18:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107B2ECE93
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:18:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505919; cv=none; b=NbX7QMzG0LK1f93jaijGUmroNJzUFeXB8wjqtR1cTPa7N+mmKdcp6sQhb13X1Hlm9xJk/Faqe2F1vZ3WR20Sc9Z3Qil2UYH11/efYMUxvCmipejLcJ78ALE86n87+PwCD31CyRrym84YsnDFzDSQiCeY+Uy4JvpDCKCd2USBJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505919; c=relaxed/simple;
	bh=vgL5xu/faGIzhMMAboP+mSE9wUQOi3QfrQTUDyaaBpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H1Y/ZQR4ps0uPOywvdSj2ccFT+YjkAZVdWjkHFhFeLwm2Jmhjwf/lEgWBGLslrhEFrELwDUxgWJ0SnMl1hkZRlpDP0Er5ZYM7IzcqoE1NYzWw6F+Jz73p6PPicMCqZK0f+n9b99IA4dU6do9qa3HfmiRpbNRctJOe8w1HG1I/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+UHi5vN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOztmlJu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889MXM2186629
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vlet6Dr4eNjg6YF1wNiDWg
	Q8y8z42mBnCyt90RKWFpA=; b=P+UHi5vNG6quQkO/PNJhI4q8z2q4ESNtcc7rkk
	zJVveSZy9WT914nwJsqFfksATYhI7v/t+2swaV5XJub9qrR+qNRacqHSWlYa/wJi
	JpAxCEnJ6ouhQPL1eYZ2NWDwztuo0UVXnnGk0VwQ3HCoDDYLT3MUNCMK5EsaVuzh
	GrPeQyVTUH2CdyOThSvt7as5sWv/nJo0VBfF3Vflszp+AT2BKEZDo7S48JI14Es3
	xMzGuKmBy9BQr4jPrz1BY/E7GBymLxZxNuVEE11yF3izsbwpZsCltPzXNByWry4/
	/SNH9m5lE5KmoSPkDIzoNtKp3nEZWz9Vrm3kH6wztymRntXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd3ym5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:18:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so7775351cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783505917; x=1784110717; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vlet6Dr4eNjg6YF1wNiDWgQ8y8z42mBnCyt90RKWFpA=;
        b=ZOztmlJubWEUUS+XKWC4tgm8uPknIlMC3oTp5iMsN85lOZ9NwED00CQAFW+2buUdqq
         KLwz+lY78OfskE9KdSKzkcwLgKECyW+1SMgTwL/8CFhUuE6GcWetXIZNmkkkEaQRkSe5
         55yzKmYZ+TGKpqvoCdfDVq9DpT+f8FKUQG5c6xJ+dMaTuhR/p2fuSw9F1enX3RqJ+PQU
         ktkuTgg6NUV9hl/LvLg7Vs3JpzWgiPBa3ViL//qN2ANslRyP1ktOE60ACesFcilFH1/f
         g+poRKDCm2dmA8bMXsoHkTyiexLiKolxaDrSiWfMs5/uxmImN6oQoGI5nBzbSVjUSqXU
         mPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783505917; x=1784110717;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vlet6Dr4eNjg6YF1wNiDWgQ8y8z42mBnCyt90RKWFpA=;
        b=OelIbrEkuTYZaIeNm77ddo9thoRGqSREoqFvD3WaSEeda7PTTNZCx37kZTj21Di7Qv
         1ICFsT7IHoOvbx5cn45z28ycOp8VkxnaVTgS9JFf1e3GdSjfF1+WOvevE3m+Dados19C
         n9qeTXZACrZwCOphCKrEdK55XE74naXM59iXq570GIR4+BokX6a+uWJz7AqqSKvCFpqq
         zwznRaYv4NIdx/0HhYIhL9IN1dDv7Ckt0sdvTaOFXfRR4+V7VSZPfTkxbHzTOvyogpE8
         +O+aj13q526D8rAPZLRnvtPO4MGwslSbx5hizPGWPNMg2Mw/jY8aJ8Yd/5AUSY0Ewync
         LXzQ==
X-Gm-Message-State: AOJu0YyKSFaQugLaM134pU5iVcQdNZSon2nh3SgGxHk1IzAKzUS5JV0r
	CdypPMtvSRllqdIeYQU3w4VEiNCSKWnwziCKGEwX49ENUr2GRH77g55Nt5Qy32Kxo5JxiIIF74m
	ONqcO4bwC19SWPzoC0NetJJzVac50W9vDcghrlCRhfTVZwc4ywpGrsxA1HWoJZcAQILm+xjUVSc
	a2
X-Gm-Gg: AfdE7cmMG/kLZWF7jBtkXem1atKB1fZl1bTkPqsvJfObpxdq22P7i/xArQ/6tnLHf3a
	HxjDmhQZLzsiT04xCioUNao7oS5elzm9AIChJxktr7Gh2106NN5J/oCIXD9fjFdSmnr1N/98mJa
	I49v4VoUGi8eUK7IkCPyn+rjJT/lZbWn/rL8B53saCn8nisC1ItFY1cyM+srEHTIkp/uEcSUSQr
	8EPuMVF7QgLB2x6S98OQ0rJhB8UYQTDOU+42QnUk5EtO/jC4VZr9LxhUJBhcxEHrg3/62/Nrl/V
	asC9etVDMlgW1uN86HWeBB6EYpsmAw0xIS+p7iZGGFmN4Jcn8dvSq8ZOMRuH6+WHxi1bkI1u/Jb
	nT/bJOmj2GhMGaNU=
X-Received: by 2002:a05:622a:1353:b0:51c:1b22:b84c with SMTP id d75a77b69052e-51c8b4c6ef9mr18261231cf.60.1783505916523;
        Wed, 08 Jul 2026 03:18:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51c:1b22:b84c with SMTP id d75a77b69052e-51c8b4c6ef9mr18260851cf.60.1783505915771;
        Wed, 08 Jul 2026 03:18:35 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm39944636f8f.29.2026.07.08.03.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:18:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 13:18:26 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPEjTmoC/yXMQQrCMBBG4auUWTsQC6bFq4iLNPmjI21aM1HE0
 rsbdfnx4K2kyAKlY7NSxlNU5lSx3zXkry5dwBKqqTWtNZ2xHIry3c8TY5S346ksjOSGEVxDPHT
 ogWjRB6qLJSPK67c/nf/Wx3CDL98nbdsHaL4bbIAAAAA=
X-Change-ID: 20260706-dts-qcom-eliza-mtp-enable-ts-f57e8eef6e8d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vgL5xu/faGIzhMMAboP+mSE9wUQOi3QfrQTUDyaaBpg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqTiPzT+JcJDQMJOHQUV2MTlqOO1Owk6dmcBLH2
 hm2NWnqEQ6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak4j8wAKCRAbX0TJAJUV
 Vn8wD/9UuN6krOA+FKnjJCZhjss7PJQoq/udWjgHnkUAWhiH363Vztmi1wHykoPTy5p4dOaC3Mt
 1ZuyrsVxq+avsGJOhfmYcqfEtRtXLtHrQAiu0RlGdaSYkBPuKqBB3o0jpbDGroF+V4M1qvMbj7G
 2V5Ef4/Dl6TFqI9Vah2OHqUny/pIa8v8pj6LjvFlEs5rG9vMNXqh0+k5Esb8/F9NSVbc1NXxzxD
 ZafdoRQbkKdxp3X7aS4zOP4AQsL7Dk4950OjB6115IM/s1Qig1m9ix+jnBRNz/fQDerX84QVfoT
 Pyn1NNUJKN5sTWsa2dc2LUk4K8H3XlF4JsSzz74KM++WbhN2c6Ca/CGLiwCIPETH7zxeNGYcXMN
 8wu1LmtiCFVnNS7R1cWmgl9cs9+QgvJK2ntSKysshL1CSDxdyY0bUJbGBRjJ7G0PrhQ4OFd6hKW
 U7PZzfQzxft8nWsUjZOQp+IzbkEnoA/Xx/SWqVrJ55j3nYKKgudbnZALhlX6KYtll7zxZaT4Oqp
 +ksNLLg8yu64trAvtyt3DlaAFtxYA3by/Y0s3VzRbH8dqa8t4neJeJRmdO85czZPUfSAtHd9fqM
 AEEgzdtvJbQp12wpiQpvhHQav6hsyNnyOQtb+QKw8IpGFsO4ppZ91g8frvN4e++4vuN2w5aNIt1
 Ekr3loH9wRTc3xQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfX26qTaY1EJD9A
 /vD93YIk3hoQDp9A0VlPriqCkAbC5EEKdgAP57vRRZ/7rrPoNEgBAPPg58rXKK/J5hdHcRNO86Y
 7s0C+6HuZJwZSjTp2zy+elJoiVL06Z/E9FTFIUW1fGpX9+PxeYXfgiusTZMcIuollvEuunLSHFw
 tnF7f6008o1aGZwnIbivYeAA6YCoMBsQoL/MqHK/5gNSw2XMbGyXRDHEU/bgfbySX/FgyQQnB3w
 esWnW1HEvHIHSM1qELZ0OaoDt13LqSCYQe8ogKWkJU8oc2XxQHlLtxgUozaQuTcaJrTPoCwc3DD
 qRpSiIFzvHrRGEQBU4ZdZIAqxe6AvMQSTJz7jer5b5U4iHwRt5YBf98ZJVwXPKXemokpo5k4/cK
 8Nse+sqqZGxSbf0dMay02IpbiD5HAOcY8fBOt8hwhBOwASFrH1p+iqwbghUBudqL+aecM6SCCbX
 X57Q4iHle5zLvxkVh5w==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e23fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZAEF7KFIOrdsHMH7GVQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FjVE8167bylgp91G0QoZSDyJL8uYjnoe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfX7vr+V2e/QAzF
 XuojyPdf6JRxiyKY4eI21R4E2IzpmB43fQbz9U0rXcQ+VREtnd4hzTStyEVoisZLGKFDAlGLEgm
 VMxh3JjTVxRAukqdrQg32MMUm0kmKLc=
X-Proofpoint-GUID: FjVE8167bylgp91G0QoZSDyJL8uYjnoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080100
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
	TAGGED_FROM(0.00)[bounces-117577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9CD4724515

The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
over SPI.

Describe the controller, its power supply, interrupt and reset GPIOs to
enable touchscreen support.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..64d54369a551 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -479,6 +479,30 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "goodix,gt9916";
+		reg = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l22b>;
+
+		spi-max-frequency = <1000000>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2400>;
+
+		pinctrl-0 = <&ts_irq>, <&ts_reset>;
+		pinctrl-names = "default";
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -504,6 +528,21 @@ mdp_vsync: mdp-vsync-state {
 		drive-strength = <2>;
 		bias-pull-down;
 	};
+
+	ts_irq: ts-irq-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+		output-disable;
+	};
+
+	ts_reset: ts-reset-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart13 {

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260706-dts-qcom-eliza-mtp-enable-ts-f57e8eef6e8d

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


