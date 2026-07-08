Return-Path: <linux-arm-msm+bounces-117468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PoG+Hj/bTWrY/AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:08:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C787D721B57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GbPdG9+R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DPDEgP9i;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117468-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117468-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBBE1301B703
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4513B1009;
	Wed,  8 Jul 2026 05:07:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7937CD3D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:07:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783487278; cv=none; b=HwYIx4RGYBFX1k9qLGJFyNW10fX2BH/5jR0hf8LPDpXazh9FgfJ6hEgtcwKrvfU01V0uveE+20m/QQf4EFcIKjzOlhuSPMkVzUDEm6p2nViTzF0/RDXxzosunVk2gruDc5B5/6GAcPX3E56g0RAquKWt7kE4c/pbSlSqdxFTDdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783487278; c=relaxed/simple;
	bh=9OfkiKWwlp2qQpsg7dv9lTO4NG2bB8KmHym1X6IBz1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AVVSRB/wM29fS0xkpC7Op+AKVV9LuSVWtv4hJNQQt9j85TeJecKbtBVYSdpsGxbJQfBCWUGCCG1TuQieP6Gbczlskttg3kbwLC6reJPadXAKDtGey+EaCxKzvsaall+ZO5vaGbkN6iSoKARWMRSI0c6ieibL2gHC5UiMp/RYB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbPdG9+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPDEgP9i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842hAl1625060
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qHLFifMehx4R79sU/ZCv6Q
	sa7O6SacW/K2cZpA2clRY=; b=GbPdG9+RGKYnvXSxbH3c6QSTsqtsexb+Yf8K3b
	nYeUw97h6BA5WqVE/is5nfzbNWpFH2QAl38W9tBBKoLnbFTjMX1evaZ1Zj9oMP4I
	dPDgTId6NCkff0O2jH5hN0h2zLnKdO23WaeLCaPB13QnWqS7oTH9DzvITq8dDKJU
	Hx1HYIQWz5o/JBsyvwc+9Jk2dymtJzKsq61GDGO+C8Ze1HO4bAa7U7FVQUYSpKxv
	T6we/bsIjREJ+6wWsYoBJvQtEmMbXHu9611N2MGVt4x0qRcR2dnQ1oYPGMx9ca9W
	rwItvnFeE+x9s3jw6lkLnCZGmZ7Bg/2n98dZXL0bx0ALSYhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2qeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:07:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso6734725ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783487270; x=1784092070; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHLFifMehx4R79sU/ZCv6Qsa7O6SacW/K2cZpA2clRY=;
        b=DPDEgP9ijjznl3ddt1B+yyzeBdBDSKTftSE0r9pI2JLqkg84/qdDe4CsnlqUrOy949
         +WEXlNRm20W1hiyZhTACTP7QFoTN7p7S30f07Zip3ZW6keR5DzaL8kuqFq8bEcCsSEl7
         ctsTLhOzoTYCLATKMcmLCOqSU1m6sZ6vDGh/hV97UDJEngB6sCG3fZHEE07voFm/Ld/3
         oars7fooziBDocdbBdbYipHB6B6Nx2bJU8Bo9Dxxse/PVuht1vABLNtbirv7pKlXXfm/
         pJvRMOn+Ip4XEExeUfbnr82sdh8sj2FafSELe7CmzCoioF0y/ASFRZGpWSFJBsgyV3C1
         l96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783487270; x=1784092070;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qHLFifMehx4R79sU/ZCv6Qsa7O6SacW/K2cZpA2clRY=;
        b=U7EFXZqdtO1D6qGPO7AUHvmEiQnkN+/upoVuUbQbOaOSLJy3ulzsW73uxLgjM/HFbc
         JMh34/iDeak3bIE4Jr3nPTD8D02PbZOAissU23S/UHp2pjhWTbwSZ19LUhdZVh6VzgTo
         it2XFYY8vIt4k0kcCm8lNbKEf+g3/tVCpWh2jlsgjiCFVZaqyF3ObKTNEIjJbH0ofRpa
         hn3v8iNy7PviQmT24HEWwa+gufmIy8IxLLUjsk1yonMYx2oTNMZQk8hE9pS+SyNdf7eM
         3S4oyQSBHugmUQZvDh4Gsj5Cq4A1e1rKiTs6IIlvoZmehZ1EFRw74x8Ag7rhsIKzBVb+
         FQPQ==
X-Gm-Message-State: AOJu0YzvdnDwugl5OighRRAH/Li/YKtaq+5pQXk4Dc7NzKrK9T7bkjzX
	29Ld/4tE9HpVi9vw1D9lF/gM7wmibq90jPHTwX4RGx4Adbz3GSYC9tES9htHjU7JQpMneW9zAzp
	RWrZlqVjTTn1vDd3mSSWLxeIai6LrnEy+fVOY9WK07UtPSX5dmtRIw6WPJ9xGEQ0yqp25
X-Gm-Gg: AfdE7clKxa1ymoQQzZto2ZvnxsoFJ+GnT59q1ANAmuOoLynkAm7+WcF3UVxs93h5ODu
	85JoVqbObR5E/CPImFgYRzh2Aw59xYULt/ZwbUsQx11isYwAaeIjIisp8yOE+61BEo3dZGGRZPM
	yoGRh26YBt/K8W3cJoS045hWixQGKU+6Tpw9iZnrcTVNd03S2X0vV8aaOgqS3EwQ+NuUjEwvDS5
	qGeddOagtcdfm6o44jwekPPPkTczBfLidqte60I63neA6kA/sAFxVb+3tE3DjaO+57Gqljl8oRF
	mXDsXnAfjUWcT98suIxI1P9LR9mYrbVAGy6kAnyK7h2aGk+4Iczp844ck+RrCx5rHUAkHYzbiUt
	EBUV1teVq27XU49E594ZozzTzCedvaEg82KkCjTI1CHq4I+Dan54r/u5pORDeUd8=
X-Received: by 2002:a17:90b:2d87:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-389421ae167mr1022524a91.27.1783487270305;
        Tue, 07 Jul 2026 22:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-389421ae167mr1022480a91.27.1783487269832;
        Tue, 07 Jul 2026 22:07:49 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38902cb930dsm342648a91.1.2026.07.07.22.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:07:49 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 22:07:46 -0700
Subject: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACLbTWoC/43Pwa7CIBAF0F8xrB0DDNDyVv6HcQGUVkwtPtBGY
 /rvUt24UONmkjsZzg03kn0KPpO/xY0kP4Yc4lCCXC6I25mh8xCakgmnXFFFJfTHDlJnwcU+JrC
 mN4Pz0IYL1FygUkIb2yIp74/Jl/XD3myfOZ/t3rvTDM4Xu5BPMV0f5SOb737pGRkwQI6ohDCIt
 VzHnFf/Z9O7eDisyiBz3chfQC6+gbyAjjJLvaTOtOoDiK+g/gZiAVlVaWWoaiqtP4DiZ1AUUDS
 2lpq3Ft27L0/TdAdijdAozgEAAA==
X-Change-ID: 20260605-lpg-rgb-color-balance-fix-82436649abf3
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783487268; l=10658;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=9OfkiKWwlp2qQpsg7dv9lTO4NG2bB8KmHym1X6IBz1Q=;
 b=43bpxAPYrE3J8OEoykallVgWgK4PzJdH2huQVOf8gIcwXK5Bw4E4/ibp02yNoGjLggBIMdeiI
 hB7km7y/6KICWQAIk29dbtlkPLLPhFRDWrV8jRr8l73A0Jsl9TJOrwS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA0NiBTYWx0ZWRfX+VpWMMk50IKk
 NuvSpxLYL1rc6nTcVhCf6id7dBjIllTuo7QZpMoin9mwh2UvpopNf2ZUH7SUu15DuIsNlcI6wgf
 ACMRAnkZiAz447CUeWs4MY7Cds/Pb7sLY52/RXB0M6nSJLokNggewvN7tLWXr1q9LS/qJ+SUfDw
 Dz222urAZFJBwKE7DpiJNCKESSnU8yTQuaYx7D2qAS9CA8wDNpmhNTj3d39Jo1oiJeOxFLRWBDu
 AsROtTvvTBYLYFw5t3FtZ2hK2ocWAVGG1JU5luNIjByGNBH1ZDzQ2d9dTE2U3H5TgXWe2ONEk7V
 uyGf8mEWKtCxEgjTJCxyG5ui4AP2t6JTZvS9wEb6klVJPF9SzUb8kbgWuggYoDWNtUYdrgzl8oM
 /xEC2oCwEUNN2YbVlSVpzN6LXTQDUM33rYFehS2uqHaJ9hmkAVLUEXU/5QoUEiV//XhlWuEmP11
 ZmUGaeD5GXd8A+hkcNQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4ddb2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=63AshnvTA_EL1TQD_80A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Zmod4ljiOFP0UCG3iyKyb8LJw9sj4MKN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA0NiBTYWx0ZWRfX/kDVgRHXgyp6
 OjCQaQKEz7XfeOmVuCo4sKiph8lxvLeD9q9B1k3tjH03tzhrRAAu2oYrZKtuK+G/fR7QLWvXJHt
 aU9Y2GL+qPcLgGSRTooCTBUEGkENerE=
X-Proofpoint-GUID: Zmod4ljiOFP0UCG3iyKyb8LJw9sj4MKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117468-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,somainline.org,quicinc.com,gurudas.dev,gmail.com,google.com];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:fenglin.wu@oss.qualcomm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C787D721B57

Currently, when the LED is configured as a RGB LED or a multi-color
LED device, the same pattern is programmed for all LED channels
regardless of the sub-led intensities when triggered by HW pattern.
It results that the LED device is always working in a white-balanced
mode regardless of the intensity settings.

To fix this, scale the pattern data according to the sub-led intensity
and program the HW pattern separately for each LPG channel.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v5:
- Add no_free_ptr(pattern) to avoid it being cleaned up
- Link to v4: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com

Changes in v4:
- Fixing LLVM compilation issue: avoid jumping over guard(mutex) initialization
- Link to v3: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com

Changes in v3:
- update to use __free() and guard(mutex) for easy cleanup
- Link to v2: https://patch.msgid.link/20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com

Changes in v2:
- Change to use tab for the indention in the comments of 'struct lpg_pattern'
- Remove the comment in lpg_prepare_pattern() as the function name is
  self-explantory.
- Link to v1: https://patch.msgid.link/20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 173 ++++++++++++++++++++++++++++++---------
 1 file changed, 133 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..7ba4765e7cfc 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -148,6 +148,24 @@ struct lpg_channel {
 	unsigned int pattern_hi_idx;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:	The pattern data array (caller must kfree)
+ * @len:	number of entries to write to the LUT
+ * @delta_t:	common step duration in ms
+ * @lo_pause:	low-pause duration in ms
+ * @hi_pause:	high-pause duration in ms
+ * @ping_pong:	true if the pattern support reverse
+ */
+struct lpg_pattern {
+	struct led_pattern *data;
+	unsigned int len;
+	unsigned int delta_t;
+	unsigned int lo_pause;
+	unsigned int hi_pause;
+	bool ping_pong;
+};
+
 /**
  * struct lpg_led - logical LED object
  * @lpg:		lpg context reference
@@ -959,23 +977,15 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
-	struct led_pattern *pattern;
 	unsigned int brightness_a;
 	unsigned int brightness_b;
-	unsigned int hi_pause = 0;
-	unsigned int lo_pause = 0;
 	unsigned int actual_len;
 	unsigned int delta_t;
-	unsigned int lo_idx;
-	unsigned int hi_idx;
 	unsigned int i;
 	bool ping_pong = true;
-	int ret = -EINVAL;
 
 	/* Hardware only support oneshot or indefinite loops */
 	if (repeat != -1 && repeat != 1)
@@ -995,15 +1005,16 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	if (len % 2)
 		return -EINVAL;
 
-	pattern = kzalloc_objs(*pattern, len / 2);
+	struct led_pattern *pattern __free(kfree) = kzalloc_objs(*pattern, len / 2);
+
 	if (!pattern)
 		return -ENOMEM;
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			return -EINVAL;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			return -EINVAL;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1016,7 +1027,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1084,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				return -EINVAL;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * duration of all steps.
 	 */
 	if (lpg->lut_base || lpg->lut_sdam) {
-		lo_pause = pattern[0].delta_t;
-		hi_pause = pattern[actual_len - 1].delta_t;
+		prep->lo_pause = pattern[0].delta_t;
+		prep->hi_pause = pattern[actual_len - 1].delta_t;
 	} else {
 		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
-			goto out_free_pattern;
+			return -EINVAL;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = no_free_ptr(pattern);
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
 
-	mutex_lock(&lpg->lock);
+	return 0;
+}
+
+static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
+			   u32 len, int repeat)
+{
+	struct lpg_channel *chan;
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int i;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	guard(mutex)(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
-		goto out_unlock;
+		goto free_pattern;
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
 
-		chan->ramp_tick_ms = delta_t;
-		chan->ramp_ping_pong = ping_pong;
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
 		chan->ramp_oneshot = repeat != -1;
 
-		chan->ramp_lo_pause_ms = lo_pause;
-		chan->ramp_hi_pause_ms = hi_pause;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
 	}
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
-
+free_pattern:
+	kfree(pattern.data);
 	return ret;
 }
 
@@ -1144,23 +1176,86 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 }
 
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
+			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	struct lpg_pattern pattern;
 	unsigned int triled_mask = 0;
-	int ret, i;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int scale;
+	unsigned int i, j;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	/* Allocate buffer for the per-channel scaled pattern copy */
+	struct led_pattern *scaled __free(kfree) =
+			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled) {
+		kfree(pattern.data);
+		return -ENOMEM;
+	}
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	triled_set(lpg, triled_mask, 0);
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
+	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	guard(mutex)(&lpg->lock);
+
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		scale = mc->subled_info[i].brightness;
+
+		for (j = 0; j < pattern.len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)pattern.data[j].brightness * scale, LED_FULL);
+			scaled[j].delta_t = pattern.data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+
+		if (ret < 0) {
+			/* Free LUT slots already allocated for previous channels */
+			while (i-- > 0) {
+				chan = led->channels[i];
+				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+				chan->pattern_lo_idx = 0;
+				chan->pattern_hi_idx = 0;
+			}
+
+			goto free_pattern;
+		}
+
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
+		chan->ramp_oneshot = repeat != -1;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+	}
+
+free_pattern:
+	kfree(pattern.data);
 	if (ret < 0)
 		return ret;
 
-	led_mc_calc_color_components(mc, LED_FULL);
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1269,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
-	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
+		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


