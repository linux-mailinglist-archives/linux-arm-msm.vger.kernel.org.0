Return-Path: <linux-arm-msm+bounces-116085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RrVFOwqdRmqyaAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:16:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C1D6FB309
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:16:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fm+8SKgW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LO3iObp5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116085-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116085-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A3D9301BB9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9E433689F;
	Thu,  2 Jul 2026 17:09:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2130033BBB9
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:09:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012167; cv=none; b=ZNcpe82ffmDMBAxh0Z1YXUYDtBVVC5CU0Nq8ZJhNcW9iBOCguwEW8QBZGurmiMbxIcjGvLq3kAz105saQ7Mlf9nB6BusO4NNz38OpalYW8i0rIKcTU+JtTBxep0ZXfi1rzfxTj9NJHbffCcsE/0ht7q0Kz/h694D7neFlvkSNrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012167; c=relaxed/simple;
	bh=u79lhT1lMVctCBRknaRHjj4cM7lR/xKEJk/uC5skegE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fX5H0OXhYEkNR0nzkqpanB9dP15tZXTBclFcS1RWH4bBOxusg4DM/BKOBPqii+ZI1Wyzr5RO3pyZunz6pHQLatGwEGb02QdynaY0hdXBvDd6CIypRoO3iwRhZVvSmLX0OZWTavOfJGPBaLMtoBJbULmRIxCoJRXxCct412wSn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm+8SKgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO3iObp5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3IN0558623
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+tfsQg4XuWFCHdwZ0VNEb
	dCPvzW0k/M5Unmvuik7v0=; b=fm+8SKgWCh+y7CDJMa8kKmajoAkWlPfLj/xRip
	poLsmF6eWM22LAJQAhhwVtTC0XWOUAEp0AhHxPElDtuxPn+H9bRs/f9sYmWH9mfd
	nP9jLpGo5sx2OvbPku93o+ANJDhpOlplYdwLIHGTFqgx2YVP6xwf7Sd1QOX2m7te
	oq4z0BPwTxceEn2Ii98ZiKWAiE4/OvZEgSoe3fuBN2/ibxU6I4qOsP7pUngPV5CG
	gSAYVde80IAY5JPbuDkwM9nPeGLyMlAPQScislq98e7mE5ed0uw3NSAKy3af38V7
	mKGP9AqqXl4j/wQfnoPjGrfeThR7SNO5tqGqc9+rpMf18eZg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n94229e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:09:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9999d8bb43so279741a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012165; x=1783616965; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E+tfsQg4XuWFCHdwZ0VNEbdCPvzW0k/M5Unmvuik7v0=;
        b=LO3iObp5YJdfMsCmndy3rndoqpl+YqY6cvoUP2r5g8ywgjKrJs/psNCbrbOzEvRWRV
         2Gw8WSgppd1FiBKIbGYhJOjwedGcamGPHztqGEisgNN8CSyWObh4WduwjhHK/7e3uKGA
         xJBqOs8zfh3rgPlQie0v7X3xvkCDfG6xra7Pg8Jo1CUFwXwYgcm/6aSy0lnJmDWbwEW5
         V76IpMLDHYZGp+TftYZSZxA8ZstG2aQ+PL0blNavBuxJmN0eenahG8y5q++U/OJdwE5P
         u+2HRSb2mDQ5WrDIWiWlZuzjfwF+oJ187RHbJYNuoCu3geZ4xqvR5nNpSB5Iw7X47l60
         QPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012165; x=1783616965;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+tfsQg4XuWFCHdwZ0VNEbdCPvzW0k/M5Unmvuik7v0=;
        b=MYz/LEbCXygusMAdedL72aANkQMCsuOdqZNN3eVZhpIMIAOPTNbvOla40WWHU7q4WK
         Yclr+qyBxu7Aowcm2WJc+FD518wEgAKil++e5b1XLOM7lmTTJ6d0ISazNxr8ovcxyVnp
         x1ubDVwsehMqG08JrEV0mgcRCcDXdl/sjnqYgii971sEZqOs0qZ8hStcUDzmtbvLYeAh
         Rlyy7EOWXVf/CqOlaCAM5ZRTmmFPjdlp8lDIt/tSfXYTxOllEuIIy3ZWrAL5UZgj1Gcx
         A6U8SqjAITaIRmNrWSSOMzPIBjKxif1u4Vif0N/CzfPtppSYCpzZHdYhOcShh25GFpw0
         ha+A==
X-Gm-Message-State: AOJu0YxiblSt3oLdNAefh4UMeA/SBxEcabpjTUoYhOX7boAKWUiUHpdY
	sMztpQ28uZYnB6ViLZIbzpBUCUmBjyZ7pJoQwYuWyCfG3JDM/hjDT4Mc9ZU4Vu6ccHPON9UgUxT
	+J5uI1Bz+e4mfojd3fCsKkOjcs5s5PqDb5B1A5PkE5EAdOY9rauh4bIbNKV5QdDx3tdJ6
X-Gm-Gg: AfdE7clywRxUV1G+krKBHUjky91rDNwrBxG08k8Iepskt5sv0afCivCII2h+TJQwUsL
	mL0Iif3eymPdv5jb0wauUtzB1gQaeDHz7VNx19UmSXZLwmTLRWEage/dUaC/7xnLZDciOy7UWHK
	VehpCE3p6Vc078u6Le/Na96tvjF3V5mIl9uUOFISSrRea17r1MhEGpgH1SSI5m45NCN2CboAi8Q
	IxnAtZf0hILXZfqAghkmkm/h/OR9oVmkYQTyxEMQFk1s47eShgNfe0TBleiaa9f6vFpz0wktY1r
	ImL1c6yAWdmEbBu/O2j+BUG+pkWWwLXhws4OoFk91AmiUAp2bTYg+behYuET5WhhEHA8XN9Ev3V
	WwFleo6knGK2wuRJe5YVbx8QCuBrLoc6n+Dr9cc/g15uwA04hzvUAeN+3mGc=
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr5132449a91.6.1783012164663;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr5132422a91.6.1783012164203;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:23 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add video clock controller support for Hawi
Date: Thu, 02 Jul 2026 10:08:06 -0700
Message-Id: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPaaRmoC/yXMSw5AMBSF4a3IHWuiTarYihj0cXENkJaSiL0rh
 t9Jzn9BQE8YoMku8Bgp0DIn8DwDO+p5QEYuGUQhykLyio36IBbJ4WItq9MqnVGouIB0WT32dH6
 5tvsddjOh3d4G3PcDiQ4IPnAAAAA=
X-Change-ID: 20260518-hawi-videocc-90265db7e712
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lin Li <zhuolin.li@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=841;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=u79lhT1lMVctCBRknaRHjj4cM7lR/xKEJk/uC5skegE=;
 b=9V6b9oWSTx6kZeIpsgNN2N6YOY+vtGSyJaUmccYW12S6J4ZVKtTKtqTthLcRO5jR5xCnUVOA3
 OQ5SLsW6OgZAY8vwpzBKTTl9UOR/ND7tCt0csroYa8VKpFnT5jsjdSN
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX7dWl8YRrhT+i
 naq5Ye3ZhWFs+sd9amiE2NIS+iH+gj4WxEfUUfnf1b3dO7z+Gy3pIJ3cMLARMhRx1TgLriZF+H5
 GxwlClYkDlZ2jsbsIA2ufKMCX7Wz9m5K0+kESqLOFAjD6iPcFq54DeGTQEpuI/N4isuvBDy7B+z
 AzUl8/1u2EGQBTewNf6HTUZJXA74AFbYSbbwg2wes45max5doDzg9taqaSOOsvPx8ymFNTlpR53
 DHr1ERucgLoNV0r3joENCWwb3qaxj4LKz9udTOdosnK+MjIqCseXjeet5pAnQzEWJkowkHrk+t8
 mUSwzdtIrxcAoTCKbwqNfYWTAlT5m7tdzB06XvBX/hEWruRcwzgii6srqk2Hla/L2J7upzjKDkE
 AxQ80invbA3LuhFoabi4L5AT3r7LCyIpNqYK9rc2uN16gttZ4o6HbyWUDnRVusM7M9AhasGrel9
 yY/2ds7T/Kz3fbTQmpA==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a469b45 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mUcvQ3vS3PEDK6hVkjoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Jd8_fiSs2GVTnmTC2lSX7a_-tyTR0WNa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX0axMWpS3yq70
 5dJ4XiCv/PCD3st8AnLrlGo1+jF7V384t9FlL6L/Orh3e6SbvXGBM5fKM/ZXRkkMY+Ckvf/vf2T
 Qe1ZU0aGSjXbZedzF1FuJco+j5vzBwk=
X-Proofpoint-GUID: Jd8_fiSs2GVTnmTC2lSX7a_-tyTR0WNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116085-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[zhuolin.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zhuolin.li@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhuolin.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87C1D6FB309

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Hawi SoC.

Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
Lin Li (2):
      dt-bindings: clock: qcom: Add Hawi video clock controller
      clk: qcom: Add support for VideoCC driver for Hawi

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-hawi.c                    | 840 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-videocc.h      |  64 ++
 5 files changed, 917 insertions(+)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260518-hawi-videocc-90265db7e712

Best regards,
--  
Lin Li <zhuolin.li@oss.qualcomm.com>


