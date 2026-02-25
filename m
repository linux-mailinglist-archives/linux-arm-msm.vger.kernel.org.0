Return-Path: <linux-arm-msm+bounces-94035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI/AAlaknmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:27:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082C19365F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E17030DF40B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4F3EAC7;
	Wed, 25 Feb 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EB44F3x2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mqd5yoOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37922F177
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004024; cv=none; b=NwKqZAvUM7wHENlYSl5Gxms5KQK7fcN7cXaRTMLNyBbr0Yo076gTvBMJW73FKtVbnEx6jUvclRuJjGVVbszC+bse3ycJ0302P3qBJIOwr3dKAzGPaZuuZZHrGCY/qcZaavAcc01Msm/h13oBPKxLgmtWOOkKIQPwPKmxYywSbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004024; c=relaxed/simple;
	bh=nrawkYrqaMLcFxb/56NRyFT5or0G6gDvhZqr/+0lZy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e/5PT4gRPtbODz1EaNlTbCa5RJBL1UAQyd7RAeq7BTeG+x4J7TyzHwaY8ckGRfryf+oJj2TblqwsN0kn6tYeOT9bD7KAx8X79zxRxmZm2iBCcKbw+aXa9mn8G2+9uz6jiay2for18U2UNDmF0vb8SQxK+LsGgmyBb8EHnx7j32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EB44F3x2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mqd5yoOa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P28H1a3660098
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y8UXtpsg0b5K02mJe3Kp1i
	iPoBapYGtxgr56r34VJIE=; b=EB44F3x2vn7IqNq8q2S8Urc/qRudf19hgZhMbL
	KTTgfWMdnV/EGOZoYxXOX6qd5grxnxF7h7w2qYOlCDrTdd9n7bUkRmLk6ksZ8kmH
	ImGlgLZbaYXI6RwqaDY+rBLQqZpqRrvW2D5q99TasEuww3XqPtQbGQ81d4f/EAmv
	4PGHu/mwiIz7EnhZqY0TUoQcZ5zetoPHgrlRFQcjAf71E96o1qFlSm1h6nRRQWrI
	26YUiu5qCYfgQXYPoYwqP+1s+uT9F8ZvcFyoz4uAoKfPEAi1IKRFjn+7tmOHTtUX
	Ydpm8wiIbXf08H2Hk+VxBadZkBKiiJ5Xra4U/BfACIZbI2cw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1saak2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4502a80d0so73356573a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004022; x=1772608822; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8UXtpsg0b5K02mJe3Kp1iiPoBapYGtxgr56r34VJIE=;
        b=Mqd5yoOa8e+jU4EwdprhBRLvzGrj8uKY2xPYDOgYerQXC1rSowbsFjnhWOcTEROwmk
         wxw//Cp0/nNyFPsfipuV1KliZg/qfSEB5eNBx2EmhmUj+HB3RNY/I4YiJ/f2QzQ8bbOE
         0Gl8DzXLK3vRNAupdLlhh6EpyRzP2ypv79nAUmSCg1P73bLtk8oDsmxp+gmray7GbXI2
         scp4Pick3GbsjrFsI9JIkqiBXY4Ge9BsW3yhvizPKnqGKfzT17ii65JxcsHLqoxt2Zj1
         Y8huw7Zep/GrCkCSGzz+opaGXIVeQmk5hnGzlYpa43RZabQgyWTcJBNehNzalQoTSGnH
         1SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004022; x=1772608822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8UXtpsg0b5K02mJe3Kp1iiPoBapYGtxgr56r34VJIE=;
        b=bMKt+epv42eRH3wi/rwabHa2QbHzisPsPngnXn2ZLKLwtfAgnholxTMgDigt9ptMpe
         b4YSPRaLOL7b8DC5DNp2/INpe3SMZnKa90BQtMidg3D1Iu2jDgdnIUHozn5D7affQDCI
         6UBAWJYR321wLFwLei0BDiDA/4sRk3MxpZsMO96We7JaKwvbsrgo/QrgpJCNre9V2NWF
         dm8oT2+BFZpan8hi2v35czWTl2JASe4vKNY69qbJ97ZwXRfphWrQAGju8nPTufrSLEsf
         FwMYsH8mtb++2rQElX9I35aeOL+15k6b9dk+4VBqvhPSsrxG8CI5c8pFOU51KA7iKVLJ
         UHXw==
X-Forwarded-Encrypted: i=1; AJvYcCUDIR/hux9uROxzFWg3E0+XOKoPTFDC49qPo0cAZzRuJCYJkyTLBeKak4L6fKw0njfJjJRSosLGJWqpv/ef@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VrJs2XYTqaDunSh/fCrwijquhKLKrhOcCKuWfzwJztj7nkx8
	8dcNs5l4cfbrrI3tQmdMS8q+Gzuz7JbdnDPlNJ1RxIA2LUPz4Glci7I9gThPm70GIl5T94S68Jg
	zf8XmM+COHF27D3FYehOiJzXiH6Mx2UfxjGEfh6tzuP7RSTQ6So8NPTtTM8Yto6nE+I0h
X-Gm-Gg: ATEYQzzAUyXisT5SOLYXyrPyNUQ6fVbCssEcetV59zXrajVxn0+CcrgsKmlW+j+ISQ1
	iOn1/M0ZqR+B/vjlu7XqCCVqiEW+xBTuomWwe/lzhs9tSoWpfFFXT1jHfkNfhe2n39QOt4axZv/
	jVT4+Zs1HHIzXPClDxuC/2SjSojzOQ03/6f4c35FRnccq3uNuNBRwWNGQhlQULS9xFFD7RR0VLp
	SEDvsVnqFuuEOLUK2ZCiP73giLCgjLu6hmJ1mFcO5Qrh5wyKjUgHhT17lQmFBU0X7VjLuz7b98Y
	kot4iPYYG+3eUK3utEiwg7zB8PSnRro9aEHMo3bfvHAy+0U4gMljO1TcwWi0MFxZvi2X43zQFoS
	DF7lEBYY8PgRXO4sVFhC/U29VONEOx+Ct2tnKQ9tC0qudTuIGcaWtNh2WWrvt/KRIYYjwrKZQ
X-Received: by 2002:a05:6830:240c:b0:7cf:ced8:b5cf with SMTP id 46e09a7af769-7d52bf30d38mr9088740a34.26.1772004021953;
        Tue, 24 Feb 2026 23:20:21 -0800 (PST)
X-Received: by 2002:a05:6830:240c:b0:7cf:ced8:b5cf with SMTP id 46e09a7af769-7d52bf30d38mr9088714a34.26.1772004021531;
        Tue, 24 Feb 2026 23:20:21 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:21 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v6 00/10] arm64: dts: qcom: kaanapali: Add more features
Date: Tue, 24 Feb 2026 23:19:15 -0800
Message-Id: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHOinmkC/2WQQW6EMAxFr4KybkZOSIBBVdV7VLMwiVOiDoRJG
 NRqxN0boF1U3Vj6lv3ftx8sUfSUWFs8WKTFJx/GLKqngpkex3fi3mbNJMgKpFT8Y5y4nRMffDL
 cWUlEOvctsrwyRXL+c7d7u2TdYSLeRRxNv5lsBj9jkW73DJuPWTZQSrjD2uJ5ZwlxsCINYaYpB
 sMXxYE746ADZUGgew0pnW53vJowDKdcXtgvdOv4uS1KctA0HRhd1xIrV+uqVKQVYqmcdgZQGlD
 CsC1u79Mc4tf+jEXswY67Qf69e9E5CUhLjezc+QziXxJ2Wdf1GzsLG/BeAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=3020;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=nrawkYrqaMLcFxb/56NRyFT5or0G6gDvhZqr/+0lZy4=;
 b=YDAxiXM5tVVLLU22vPc0+K55aPv6TOxQrupHKoVAHu0Zt4mRsaxgcFjf7naTGAa49M9mSLSDB
 ViCxI9VehJpDkTGc45Z0N/TaWXtqse/IAqUVQYLqNeEaaXsyNRhaRl5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ea2b6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4LptFnmNR7OdvzKBXfYA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: pHc0ri_puzgF3ixBTVHk_fczwRuhdAuf
X-Proofpoint-ORIG-GUID: pHc0ri_puzgF3ixBTVHk_fczwRuhdAuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX0WcRCf+jDiJd
 VMoODK5N8rnjCtAdHhGAMgSERi1PpuEEme28rJb3XrdxDDC7F+2I0zYjAM8+OHS9mvLpCxDpJzR
 3jsL9YQMoLAIp796WDsGnicO5YqPgM9mteCbL3BR2+jrXnNBHR64POvZGUGbgpVSdao68vw1nmz
 azGrs+N7UoYMR9ffv23KJfBeI9hDuefK2br0VSJ8cMSlU+P9Il6epTq14BBenPM34qQEsRQFj8c
 1EiJ0W6LM50Tvukk/Xzxgreh9wMXCMNKEa1E/tb9onC3W0U/mxtoD0Ycbv8yxnsi8HDoWLPmKrZ
 taDHAYAXoqd6jKl+U3whyX+dCxNuu0fQxeen7pkwOnPudU+n7/dCGYqIhtfhfuQgK6RLol5roQP
 R3yAUUbpUcWVWG8dgdkyPDMV4Sly6F6DxYlPwlR8wBpEkME2H4er7Mij6kR8+7aK6bBxNbeP8Av
 rbB7sS1VBeMvydZRVpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-94035-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6082C19365F
X-Rspamd-Action: no action

Add new features on the Kaanapali Platform including:

- TSENS and thermal zones
- CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
- QUPv3 serial engine
- ADSP and CDSP with fastrpc and smp2p
- Audio(enabled on MTP only)
- Multimedia clock including display/video/camera/gpu

binding dependency:
- adsp/cdsp: https://lore.kernel.org/r/20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com/ - reviewed 

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v6:
- rebase deconfig patch
- fix audio node order
- Link to v5: https://lore.kernel.org/all/20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com

Changes in v5:
- fix audio node order and cambistmclkcc reg length
- add reviewed-by tag
- Link to v4: https://lore.kernel.org/r/20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com

Changes in v4:
- Add hot trip at 120C for thermal zones
- Drop smp2p-modem node
- Some codestyle fixup
- Link to v3: https://lore.kernel.org/r/20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com

Changes in v3:
- seperate patch in function
- pick remoteproc/audio/MM clk patch
- Link to v2: https://lore.kernel.org/r/20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com

Changes in v2:
- picked latest coresight patch form: https://lore.kernel.org/all/20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com

---
Jie Gan (1):
      arm64: dts: qcom: kaanapali: add coresight nodes

Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: kaanapali: Add TSENS and thermal zones

Prasad Kumpatla (2):
      arm64: dts: qcom: kaanapali: Add support for audio
      arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)

Taniya Das (2):
      arm64: dts: qcom: kaanapali: Add support for MM clock controllers for Kaanapali
      arm64: defconfig: Enable Kaanapali clock controllers

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  240 ++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |   14 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 5119 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |    4 +
 4 files changed, 5377 insertions(+)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260224-knp-dts-misc-fd2eee5224da
prerequisite-message-id: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
prerequisite-patch-id: afd581c1ad048b1b9d5cb13cc667a5efbdfd1bad
prerequisite-patch-id: 554f737dd82cedf873d73db34d735c95c28b9cd3

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


