Return-Path: <linux-arm-msm+bounces-113472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aezJLgawMWqlpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:20:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63B695298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AoY+oKxN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QR4+H+tH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113472-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113472-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26AA732AF197
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83E03911B8;
	Tue, 16 Jun 2026 20:15:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EE38D41A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640923; cv=none; b=mUlmlQc4rRVUJXfFHwOa8Ho7Fd4fTd0kxFoKTZshnqaMyX8aAQzRMmskr8EOU6jFY6Aw7YVn6YRPdKfYzTFqtXlNzfmRpMqO0YmZri2JZt1wVs0itpd3NKav0R4lnkbtoy9+w2HYKumvzB5XxW3shR1vzsWLyXNbMOJhMHN2b7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640923; c=relaxed/simple;
	bh=BfsWCD7hTxx7YcBl8tJuBnMBQqYRlgms82Zq0fuYUag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6AXOphoIdv0BxJ7dfzn6HJ5beNMmqqTDeYZZ4mM8a/UdqTy4h6X0AuagNw2GSdyBpwmz2qaLEjxFKWsgjAy+0Ju0PT4xSxydyxJxFzYURUvTL+4YG7AzVfAVWwxk5SkZDUKpBvaupPeQ/RZQSPyWFP/WfIQ25X93977kD1YdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoY+oKxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QR4+H+tH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOOPg4037169
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oQZQNMndCdq
	B1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=; b=AoY+oKxNpvlWd+RGp/nPpjwLuLn
	xUL5GtmCtf2Wc3OFcOhLeIDPu1E6w/SU9gh60aeEPbOdGv5paniralGCQgRmv81K
	M4JBClYL4FJ+fE+tC1DrTvUZ+23FwFGat1fMFYLxCQZ8GeERtu/gp3lHXXrVbm+M
	tDWVSXHx7YQKdnR4SFTHplVQEc9VCpJp9V0Uwd67SaFepLV/Z+qyzL4ZigJRDeti
	1aAlC5z7nC8kfxPvlfhXqVDVguKlh5LW58SIRZxgXV5+NURmwSMVWkPhjsCZ0kEn
	L6oSszSiUSRJiZFVq+2AogEFRLBmN2umWhU+Gp1XCyQ1LyLAL9njCS6NPug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1763r50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c272e532so50518835ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640921; x=1782245721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQZQNMndCdqB1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=;
        b=QR4+H+tHl2MWwOvZ1UJ2fRowyHL8MwkRvFGxuh/CODnJp3lTD3afTxC6kNei4FmuYp
         AvbsrqexO8Xw9EwNRRfnjUUZfax+wsWVgb6sKrpYpkU0XzvrysftGIMH/zlbx+3Vsxit
         ukhiaU4A+9Ky0NN6ve5LPdnl8xw5ABGHBT4fVhNajjVwMBhaufrLpGVx+bSF8ZIIfcHB
         NKjTE9yqxbIyQAjrBrr2jE7ZeyZkgZbj2rPb3fBpS84R03cyP/Pc8ZdZVtb9yQV/fWYu
         1fj5d4f8WFZirqpwz+K7HyYEhmlr1o9WIVaFwl8UyBUE2UQPWjg895IzVMtSMfoIzMCR
         c2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640921; x=1782245721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQZQNMndCdqB1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=;
        b=jvCCEx4wZOILvlgPgLRAl8tQSPP0YPZY5TgwKpWHcf16k47y3CAXqe9UGW+2uR+/3Y
         VTHUkxq+ry+UXqgBpU3PBFcHxn0GARzEpgO1f9FNyccxfD3H1I3ULuxGhGnpdiCelFnU
         4SUAXj3RlyvB0Q6+IuwYJWjGT+8IqFtqI54GNFdMKyBmsBOmN9sQVruUd/+7oG+zwb7b
         kGQP527dOjz3mIMABAt/SGUFLzASLz+R3FLfOKmz/9yQNeiXVCDZH2okMVDVwNDJhMWq
         hZyf4XBVjZ1I3ehUUev3KQAo71+D64/NOP+ibOfO/oI/oQh9MMALy1FSUFiZff3Ov49+
         jwTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dMA/F3zYwf5DZCTkuFl9pjgvGDAwQUEfj+sGFdXZ3MapDdHO8+rSkq0Eqc2MAoY8NXT7Pjr97nYKqZEhG@vger.kernel.org
X-Gm-Message-State: AOJu0YyeCCrkxt9vJCEc2Nm1iwJWFJctp5VXPvJ/0X0eDBeXU27FjJc3
	zhCDkADsxJbc33Y5HDpLUIJaA/nUfrg/09YmuNSRN9PxbKc+7pduG7nYqOEZUdWwNsfEqGNoIUh
	1aOI34/BcCulHvOO8VMMjl5DQQFhWUi6WU9kzXhrVlWDwPwPtsdEc/3TgPPGS7IWurCdv
X-Gm-Gg: AfdE7ckm6Lymln4D7enVWILSYJrfvil06eMZNuPh22ElGjsGcWh92IoqQyCvG0iirfE
	PrGmsHq+afTnPgHuQrRJNtibTLd3VdEVxT5XrqSfBX9iUAG0BZ9QA5EKTyAqtnCEtenJu0CNq2V
	2f47tfEg2MHlN7SuVxMUjy7R5a2hbVjSV1mv601+HI4NuIXKKf7UuC1ymzx3qFYif71dv7Wy6/K
	v5ntd82ZyFZcDP8A/cngXkjv9nlntxVwXi07hoJ6nUZabgC+zIESei3KsBzOLIs2SbxBEMopnxN
	haOimf0eebNNrN3fc2hPDc1m32OtmDSAmPU+Xts4ZGPqHscDMpmfDzB7gQRYn3bbKy4/I8LSR21
	Fbz6js1mZN1eo4/I0sUCNFMQl3jvo/1R2mD5/u8fZM1Nk1Jy+YQn63kdHRQ==
X-Received: by 2002:a17:902:e548:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c6bc0e999fmr4915655ad.20.1781640921048;
        Tue, 16 Jun 2026 13:15:21 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c6bc0e999fmr4915415ad.20.1781640920601;
        Tue, 16 Jun 2026 13:15:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and WSA885X-I2C drivers
Date: Wed, 17 Jun 2026 01:43:15 +0530
Message-Id: <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wBFBxRk5KaePZ8WA_lYN0MpCvAysoU-H
X-Proofpoint-ORIG-GUID: wBFBxRk5KaePZ8WA_lYN0MpCvAysoU-H
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a31aed9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Y4Inp1xfyx_JXr0qu3kA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX/CcLlMqjwQGT
 SJYHAcQluguHu5YAOt1CNWi6v/+f1lXX5vZYRnC40OlP2Py1RdH/Cp8SNeCWoLKq4rsoZJmkK1z
 QAB8X5hbtcXqI2Kd5XvbQDP5KmQibO8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXzzTHmePZrkdP
 qxhxVIzdI0hLwOuJM5UoN1QrLkyfZgeVh1i9Z3Z249mPChBU9/aQqfjtjOLaUEOdQdJVw3NmUq3
 fO2CC15lKUaP57SUt6b0eP+WoSirpVIfmhxu2fW4anIbqY5cRONpxmCyw2C3JNdUr3S8XSHNkB3
 ixYUGh1OqVwHz3/iqCiyaL1UfBPt+ZLK2fDL5N7RpQ6lhXdmv4/GmW+j/NukujfyaUSnoU4KB66
 2GNcMXCItcSvSN0GFTZP7m+lngCFx8gXQfdiTij4VLhipqKSDfHcC6TM3IWMlhpz6Mpvc2rEM1x
 cDtAMeZn9sAfVaKtP6B4b/Q0BOYM4ltXl84HI9jIWd4XlJg8PfGEzPbjmLQZeynQapR9KFTQbDp
 Rf23FvamPPo18SNN41/Ea8cyqMYuEqB0oNz//KjDV6xmD3+umZLJCYxHiDtXDh3k4E5NqO1EMWI
 iofbvzy3MdAXnEz85dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113472-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A63B695298

Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
arm64 defconfig.

These options are required to exercise the Shikra EVK
audio paths enabled by the preceding DTS changes.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 271589322efd..067f4ecc05bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1099,6 +1099,7 @@ CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m
+CONFIG_SND_SOC_QCOM_QAIF=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
 CONFIG_SND_SOC_SC8280XP=m
@@ -1175,6 +1176,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X_I2C=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1


