Return-Path: <linux-arm-msm+bounces-117901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gyUwLJRYT2qBewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27372E209
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UV/Q4jCu";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N4+itO4C;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5483A302DF87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080983EE1D6;
	Thu,  9 Jul 2026 08:14:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2D3EA96F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:14:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584888; cv=none; b=dHnQ19X33t28zZLIsFCWj+1iSWKDryQ4f23BtX2AYlOz6SnUPeuqsSrFmDUqAXsJjmEc1ZBwLLFbrQ61w3VfOZ5SVQ45tIHP5DxRWGl/3km+SKLmZut6z13z/xjQL/kqy4958hha2uP89cygtpLP/bZR81SEhy3YTaoIyObgfbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584888; c=relaxed/simple;
	bh=zvciAFc7zGmenBektFaPTFt1v3hjHI30sgPTkSx/+dw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MvclqZN/Wm09W11w2bDcx/PDEo7IeUKWaPAu07PuDGgd4NoKecPNNyV8hIjDQB8FXgc8T1cVkF7H/BsbByB5tN8+Ml26SaEW80qNEx03AjVrhDRwANi5YtXCbjjzpKVo2gSPGPIuolYrULHtZ0vIutwXf/whwD8V24fb+gwNcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UV/Q4jCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4+itO4C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GsJ931976
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z368sD9KFTlPEyAbPdMh2t
	NJuAxC6h2ddGcPFGa9uM4=; b=UV/Q4jCuxkrsDSyTyZ11z2PKsIf7Zv1r+Wy5V9
	S1ASVMSVQd26OdvPTa4DKfg+nbEo3GStXsy6V/sKraedGmoSX6DEBfylfT25AYnS
	zBUzHfGDnsSWvHAVI+lx4+WYkLeeiEL445iggyYKljZsyWavOJeSQzc2+hDb+mul
	ldDgKQ4sZwBggS2Xf8Y3gFMgWnIW2wAYqbiFzuYnD6JT4ZLmT3wg5QhZA0H51BBa
	1xLg5FxbNlJeKTAfxnGXnf42u31wvChnDb0bE3s6nDGDooKieu2IJc5rziow0XEA
	DuaPr5oCkrWRMSCvQv95wEFe/tB2LaHhFXBqz5kXjmIkQw2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsb4ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:14:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so2318197a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584881; x=1784189681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z368sD9KFTlPEyAbPdMh2tNJuAxC6h2ddGcPFGa9uM4=;
        b=N4+itO4CHSAOf+I+lM3uVuh+K0/gu9/oOzYinmqTNN3mIEAG4aa2wN3Bzy4cgHDVa3
         6YRNFQXa1hhhqg4AQHJ1tjQwTK/TqYbDig7vZsVm8wFRKRBv4EbOPaF90zvMQZNTVcVR
         1ZH3n65VQb22UBdaUMlDZ3ERntDMBwVPOXbqzwbfWhph5R5wgm3q0rzRNzSmZOlekleu
         YlHGlRsViShSddqBfEFu8AWk0t/ZIJeZUq+0ZbNM5PfWkhcgeQARgjnrvEqyGkgGDMNg
         Ut26hNYCWqmiJThe1v7UztekvXc5FebBJEcFTi3bKgVpmmbkBNAe/w3EPTlerCrk02U8
         HRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584881; x=1784189681;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z368sD9KFTlPEyAbPdMh2tNJuAxC6h2ddGcPFGa9uM4=;
        b=Do+tBiTHQy/sjv32ACjS0Yli3LMMmFeOMS0lCE9ToKtRn4YzDElBLaIUSKIC+lBMbA
         YGsI0cultlmm/IHTx2iFLwdiWaPq5P+xt7/YkOIHHOicPAFiU03/xwpnGY3UxVBTlV+F
         FGjQjMkP67soCr+EcqGajmVT7JFyvG3AmpQBPutTCGxAgVWeLm9OQIqd8wR/vnxUpv4f
         QutI/m9uiU3J9wv3Y+6b97ZLLwIrBtP2WCiFxaj45f5rcIHr9VRkzvJ6c6VGvF7Cm8xI
         tqJ1OfONWwplLnh5PrCzegNe+NtYUMo5y9InbLS1TjBTmGSJO2yUFCucV/F2r/+cxzmA
         9MpA==
X-Forwarded-Encrypted: i=1; AHgh+Rqe7PKTLj9tWgsaAhqiOE4+Sgd/zrVbRTQbDg8TrLLzuxgdbjKroIJJEw8VOlOpDZCDNvZkwPsCJgIuYY7S@vger.kernel.org
X-Gm-Message-State: AOJu0YwOPtuXPt8gKXQVHYZrwFdTTXPt5neEnG8Kk+zkQuF0dHndnuu4
	uMYCY9OgZO/DzINKwc3+Hx6qFF60JwpNwOKaHVS3r27cG0RInWgo+pZ3uqpP53VTfHV237JX3TT
	enQJVeDqx5a+vAtWmRtoGdPpLX/K9Xj7QdPFqRctd94aiz70to2g0MJ3AnI2mFBtdpY1VjGETsm
	ub
X-Gm-Gg: AfdE7clKeyimTU8Y0q+r2BpnYDtGKaaOIyKszPK5UYFCHFd55vQ0QqlTVn0poFMZ1YD
	BNprGZQ93ub0iJzpS0aZ/DTSMlN23ogWyQhCPIIbPVIbhjchp6EsmHlnP5ERCxwWJ67tAmvrsWW
	3pf+EJvkveL4gAdT8cDmy3CLscmP+vxb+4aOeyyk0FTd5TQA+EztmV74ZcvHbqy0YnmntTBs/Hn
	28z1MpRMo0rD57waeGeNvNKsJcw+iu0trbtsWpNGt+qBzhS+oI1dFvHbZbfaJx27ihipBaUqigN
	sCL/8vaEEVLLnBF/E2e7oIIPSLmJ1rx2GyD58gQRFPtmAIDytIjzYutCp2QYLgMty7c447M6jnb
	/jmC2mxJUbUFVerBJrxINu6MxHP2R9kOvxd7XFFO7QoZmEy58urwCn/jbuz3xgA==
X-Received: by 2002:a05:6a21:4d8e:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c0bca47d59mr7274044637.31.1783584881034;
        Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8e:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c0bca47d59mr7274004637.31.1783584880558;
        Thu, 09 Jul 2026 01:14:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm3392290a12.18.2026.07.09.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:14:40 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: kaanapali: Add SoCCP
Date: Thu, 09 Jul 2026 01:14:22 -0700
Message-Id: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9YT2oC/1WNwQ6CMBBEf4Xs2SWlJBU8+R+GQ1kWadQWu0g0h
 H+34MnLJC+ZebOAcHQscMoWiDw7ccEn0IcMaLD+yui6xKCVNuqoarz5ESUQjdhNaKnrq564Kpg
 gTcbIvXvvukuTuLXC2EbradgkSVBttcHJFOJnP52Lrfzzl9r8++cCFVqjSFsuDdftOYjkz5e9U
 3g88hTQrOv6BfTvYkvGAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584879; l=1109;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zvciAFc7zGmenBektFaPTFt1v3hjHI30sgPTkSx/+dw=;
 b=pTcbPDudSGizHITiTMJdngN1fNrfCnjXt+aCJ9yv9ttjDUes//u8P2z1XOme/ZRj2ofwFcpo8
 D7MyH2Km1tOBx+nFU82lB6s5MvQbzIKqQ/2Hxhn7cdnuqvEtQA0wYSK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX05ckbSm+eH4u
 U401FSSgFir2DskqoxYv2+6APhkm9XKmqms+ZwbfI0meSfuGAZanf5MMnOMAqp80zb+WWmjboKo
 DYQVDv8LwsBhGFeM2D7csvaOoJTWOLU=
X-Proofpoint-GUID: xFVKP4yX_uHFqgkqwF6xc3GJi4PVl2g3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX6oCF6OPWSwLy
 dEGZMak7cb662ye49KLNyJu8JlFb0/SOquJr+jtbmtGYV0Iy7R4+lrjW81xoDO4WM6+TugSdonS
 +MRfRf3JaVEJFueaixZtzY6bCxBL8U2x4ujmzJYJEtgDd9SJ0LyR38wT+p8ihjWhCamx9olXsMR
 TvZjX9UwyS/sujmAkchhz1Pr15kr8g+kOPR8bcrMHlvWdkZMenfKyvJlrTJYvtoJeyP6+Gajd8o
 5axZCHWJ8n2I0Gap+pCowwwvm+oakqGu7N+d9ynvlDQZ5mqUnd6zxOPFXPrMVUR9JKS22OQDXxT
 4/Hre67INKdvvamaPVKhZxxK2IfPyXR09bd2rX7MowxFByUsNpkhBuMfYo7QV8owP6//Zw7OMfs
 BO0rUEdGbBDVZKUHVq+N/4FtSWF/x6HF734ZEJqWk+G5+Y+BQW9l3z4F+yuoub8f3JAecIONfr3
 5HhQj15T62+gqkPbvtA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f5871 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d-gixd6huE7ca5b8DIIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: xFVKP4yX_uHFqgkqwF6xc3GJi4PVl2g3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117901-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E27372E209

Add device tree support for SoCCP on Kaanapali platform. The SoC Control
Processor (SoCCP) is small RISC-V MCU that controls USB Type-C, battery
charging and various other functions on Qualcomm SoCs. On Kaanapali,
SoCCP is brought up by bootloader by default.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- update commit msg and remove status "okay"
- update node name
- Link to v1: https://lore.kernel.org/r/20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com

---
Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      arm64: dts: qcom: kaanapali-mtp: Add SoCCP node

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 70 ++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-knp-soccp-dt-acdf8fce81ec

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


