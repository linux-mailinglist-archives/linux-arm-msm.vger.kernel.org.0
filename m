Return-Path: <linux-arm-msm+bounces-114150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPTsMYFaOmp+6wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:05:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F56B6107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EIc/eZuB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gu/H6D9O";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114150-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114150-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C47E3303C146
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE7A30F938;
	Tue, 23 Jun 2026 10:05:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B52372057
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209146; cv=none; b=CwjZnOlVE1fZ54Tp2ZLUWbOTuBfHUEaWyDys/MlapSSczIb8IOPAFyyOPoIBsy5iRwIPbeYB6+SkmsAChDR3oRIz2+hfP2OC139wh5lC4ksaLkRDNIHLekak1ydMNH1M/RUuASJCtTGCIErCs6+IMP6177I6H/uylmcQbDLXS1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209146; c=relaxed/simple;
	bh=LDEf1yOnCnDfS3qRRj2JXTv0cT4mYQsmy7cmAYMnlvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYWNY/yzZYT1ohx+j3JzxpNIYU9F/qTvfM7KfAsv33iyegBSCZFbYyggOF6YsumOXr+uOxH/1l5568d6bS6NB+fn6ZKitDmWj/0ql4NxHP8GIX9A+w2cvHdv9zG/QGf1QL2hVTja1xHfIlq4iuaLWqfAjVnc0mlZdE1Se8fMpWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIc/eZuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gu/H6D9O; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KUbN3918983
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bc9Gq1dJvi12WTS3VXEXEna53dTCi3FoTXBLlw5ECQk=; b=EIc/eZuBoQ5off6L
	+3KENKfJgfxyncCdNG2ZQsxcLeFCT61zX8R+H0rGeUEYjNjKbv7m80ykC2UGR0IP
	vjZKvsTDSXaHJVHdr5//HOIm5HejKJPIiFDo2mQ8fFF3ah5gD7d/AeTuSdf/TVKo
	zBQFbeegNVmPREPcqXMCLk/C4y/nU9TlLfJjv68UFX2uvQm/fCvS9mpWOisvQgDy
	AN53AVXoxUqr/bKogMKFxc9HIVXU/AMeMBue4trMcJWH8UHY3Rh5d+VxNW6grAWw
	cEzGwb/EHrXoJy9Vl/PqiBmirPwOieRqdvuVhr1/QWr7IRFexfjSs9kMyTJekt1G
	3gpYKw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe687xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so8431829c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209143; x=1782813943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc9Gq1dJvi12WTS3VXEXEna53dTCi3FoTXBLlw5ECQk=;
        b=gu/H6D9ONx+pf0ZrOFr34fXV9BETZH/NZHtlkD1d/fnuYErsCglaK0fW17T5OmyLz8
         5H0EpsAcKaTAS5oXgfSRvbBK30M/QaXot4zHs8nIdhs7ZKLp6C0+KXlqMfDr+8yAnx4T
         sn5pqSSuRioAy1AePTfNqkRTWegl9RmAdpQrVzpjMKX/kEjZlj0uhrPKYT5TCUiYQtr7
         jwvn5QP4DW6R+dwT2hM9QLqVVctnJcJJZYcNjrnGMhl32z7Uek4ouibFeWYHDE1FC3BT
         aUxzomR+0Q7PoVDYTEgaGTJnYT6wnHilHSMN77+JcgpkeWCeiYEf8RrZlVQFVKkfaLuF
         L8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209143; x=1782813943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bc9Gq1dJvi12WTS3VXEXEna53dTCi3FoTXBLlw5ECQk=;
        b=iCmUN1+3M7ljCBXwV95FEZVndeoD0P4BNd3fA1JcnbUEGtIJTTUGXIAbCyUJUQG2fB
         ZKaZLhmneUNSOm+XB0hT92rbXJPeNyFk/o1madM8xiYrK4b/IznFHWFbDxQnGlijd8g5
         7jdVPIiWOc2bqYpOy7f5bwZr0HlmFKnDVcouwRKMIJMThYO5H72mbzDb5NuvPEppo2vY
         bSgEaAPtRfPDKR6+ErMCPav/C+1VEh+/NXc203TWwm+jtyJ23FGkyf5DfnJVaiIWDW8r
         MjGASxDeLG2Bh9votmZEgbmBDkcViO4z13TnchkF46WZiArdjWc58SaMyW7wqWNqR1cK
         hS8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IG+x3bZFLwsQNPcOdF50W8QhUir3EWt36ta9e1Ia8e9RvOzzcv8zMdx54yoNB6dpBYv4+52MhwbHdGX16@vger.kernel.org
X-Gm-Message-State: AOJu0YzsyeigKcaDQOG1ObZHH3mTGds/Wr561tl7T7c+bJF0KdvNOGRg
	FDfW39ts0qlyNZjQEMoGtD4iws+oZvz3GrjNq5wYo6oOWScFWjeATdDN3jy1DpI9ESb4PkAp7pS
	OkrCbVi/b71+f9Q+yPe5/qKMYzAr2jgJKFQQbg8KGQcBgDPTngAZECCED9EfMfpbPPtvg
X-Gm-Gg: AfdE7cnZ4ks88e1SXaN8QBDkaWjyNP1gXtdM6cSW68S65flUyj2vuOIFYBiC5CSfxGA
	AmdfmKzanjOxWbkQJE0NezPZ4+1GbOR5M1rpiZM5HOlF/DlLu/cKCFQqv/SiJ7mNOlJA14TprgO
	V+TBljR1oQGPKSDw9i6sS1AYKkwOM3c60b7ddTxkppdBmHebpRUQPLxd8uhCqPiFbdG+sGpk9Q4
	O4feeytnTIx/MkyXBAMf4JEvIAvNFEKSwiq/2MV/CSI1qaxxxOrOH1cyOa2664itNjC3sVNPwJx
	QnX0G1xIBoItYEHSLgfawt9pUXR6JoxPTY169Nfw3U554MTEQnfIrSsyoZqU2AzeYSjaoAu6BM3
	ZyA0b1q0O2eh9kIyosS94UFtplK6SvaVd5RTYke09BNbToRTTB58ZQNZANhG7Cg==
X-Received: by 2002:a05:7022:68a7:b0:12d:de3e:cbfe with SMTP id a92af1059eb24-139c706ea53mr1092597c88.37.1782209142701;
        Tue, 23 Jun 2026 03:05:42 -0700 (PDT)
X-Received: by 2002:a05:7022:68a7:b0:12d:de3e:cbfe with SMTP id a92af1059eb24-139c706ea53mr1092577c88.37.1782209142231;
        Tue, 23 Jun 2026 03:05:42 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:22 -0700
Subject: [PATCH v7 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-6-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=1799;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=LDEf1yOnCnDfS3qRRj2JXTv0cT4mYQsmy7cmAYMnlvs=;
 b=jBTzlXgMEO3PsYRFMkLFIM5mxg4TQqAHerJESxOUtX6wbodiMs+tDzr6BXBWY/awIxcwKxASn
 l85DSFQBVP5DqOgTuF6szzSF4lmuhF4QhkhHizfDYL88dBEas1w4V/f
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: v17c_uukCzMyN5sJj3Nhr7FHmUuqFPXy
X-Proofpoint-ORIG-GUID: v17c_uukCzMyN5sJj3Nhr7FHmUuqFPXy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX5Zp+4c9uey65
 cRxIkb5zXbf1ZZ/5PdCRcho1Hmq4hULqybDt9XqY+UjssDq34W3n3fdMQFerrPypCHECymeXk2q
 TtzPw7mR5gJa3V5mr/pSkvEBkQMIMF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX8AxryfyFfkwo
 I2vY3uFz1XKq4VMH3siTTBRUBkNc6b6Eac6cclgx3/B5xZx3Adxxo8gbWQC/KcxbNegke6qG2Dm
 Le90movNXyyCvTc0dl1vpO6yeujhBrT3mJAkyVOXtMz96OD1gfdgOpiGIoHwkAm+bBJ8lV49I2g
 8wNE8B24bVTD+WS4G/yekXPBbJuxb+DQaEruUXioZEqC6y6d7hcO4wrzvH21h0uDbS94s6/vT8t
 jWPXIuDWscmbadmr7Bx2TwW1AZZIqo7O0XAmMKdtPnhmP9XuRMhiQOq4MEB44MWee6yk3uFicdg
 ZnIY6u2xqubROUf4QZAvoNvIdMyr38cr3Te+kAdMN4SGKk0p7QGN+Ivjr3z6RZPm8YOxsbX/b6P
 Xk3tyqMzR2QFVNp/c7e3RuQ+a/CtsNZX8EYup59s0uoL9Aw5QgiFI9urIIN07SH3JGYCmTyhla3
 jine8hDNBXGZZ+AhS2A==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a5a77 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230081
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
	TAGGED_FROM(0.00)[bounces-114150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB4F56B6107

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8a0bb4b2e71c..60a4337d9e51 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1640,8 +1640,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1


