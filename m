Return-Path: <linux-arm-msm+bounces-102574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABO9G0Fz2GmodQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:49:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE63D1ED9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65B2A300B8E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262BA329E4B;
	Fri, 10 Apr 2026 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GR0PMc2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0keMAmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA202F3614
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792954; cv=none; b=nN/P88fue1DjOvB/cnUJsJbhQOJCctYRJ2Dky/tM7vr+Kj5J0MM7x45SvP3tAaByJdNqFgPzU+aZboPNqn665gkFkGtWFDUnh+ixDJeVPFloS6KvgzlFOMYA/T0ClsxYKSftFOUvHbiP+SwvZ26OhX2G9eEHdAy54cJoJgvVKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792954; c=relaxed/simple;
	bh=kTq6lPmtEdVuss5Sec90PHYryIzFE7/jtO7umhTIj04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kteHCjK6bIsi5yJ+KpUu8hJqe3PLVuxWixJeb8B6CponlAHADgxuXUfvZPevaSg3GhirbdFLUjHxNsFzCizoynZSJ1ozjA/usJgR4MGODxaPJr1qkVmftDKF2VxmWBwotz757lk6B1oZIhkQTvI14B8T+wXBXsklnq424Iwzrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GR0PMc2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0keMAmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639MpTfu3934963
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yMvaOL/KzFTlS8jqm1Qwp0
	Ep+Esj+Ri93hlN7bcwQ4M=; b=GR0PMc2ZSrbxLvTHjk3RxbSIJJ7UdmRC5KP92P
	tEXAyFXGNRnw5AGxX6Z7Ij5kWulBlUiQD22ZSTQzvZBsgwtFGDY3VIeNe5JZPP7m
	676HCneK3imShrIA4emk2JLvSw8snC2T67LKb64odqWNxUZWjwvRG7zQaFBX6IHE
	pX2gcTl+ggEjlQk1Yo/7t+vNeRoYpWtHw1kyQQDwMrSi0H37yLnflZC0//zrjse1
	oiL5t4vtbRMuUR6SJiGfXW3BCCb/ZF2KI3WMxTIBa85lF2XRaX9wOhJwCPKxL3wI
	OsutxVC5vm+Cn7Zgrf4pIe1lExbfar98napbwx6MY3qENa1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sadnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0cf396c45so19934375ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775792951; x=1776397751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMvaOL/KzFTlS8jqm1Qwp0Ep+Esj+Ri93hlN7bcwQ4M=;
        b=c0keMAmc0K3aIi+af8SISXZtSyutM7Ladwp9Vk7InY89K0/7/otY9SCBEmF6o97MJW
         r5WzI8l7cBE2nSRWKRumtdyUsr0rjO24fRKmKyT1/egTPcKN8+TSyItGjb3KlZoTfUp2
         jEjPAzxnW4SjJWBkvTymx9bO6WPo49xrDY7MRgHUXiM2FKgkJPfU19QAMHti6bY/PuCM
         piWJ7BJ0KD7vWDQjb0zdqr10YDqNFDdi4GEA5zrtPAwiQfjGS+lAPjAXasjVYcRpaajy
         4bjkpUCb8swAy2KEIAmDvazGlXDfWe9hxc0Yoa+nBUpbnoxyujQG7a625iKW5/0Q/4jp
         KwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792951; x=1776397751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMvaOL/KzFTlS8jqm1Qwp0Ep+Esj+Ri93hlN7bcwQ4M=;
        b=oRIhRlNyVuC9/AAl+GTIk7+aEt0hdCLJfvKodFxPu7vD4YJQdvXHMWgKMfIoL0jt+9
         +nmKGoQECUuHuAPpWkuRalaQ2XgoRIFgAX9hIJ78jbm9FOp0y89sluXN/8J+3U+E71Be
         aZtAZsjXbcZg3pZBboG/a2dN1lOFcKSJ/bLcYYJF6qz0yq1/nf2G09T8t+EDeDlq7rZ4
         h2LS9XIKQKT49o0+yzAorKGd2hcFbMBaHi7d3BeRa3O2e85iB39StcZxwmbwU6KCg1a8
         8UhX+MC5xwV/i90Ofypa3Ec39a2Uee88a99eqc7hMtnq4YPt8TvG79zXGYCf+dwigQi1
         1/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhF5SOAsJU+ca97NJO8AydGoI/gzg8y++kh9sfDHi8P5ksljR5m1hClFFSHT87a2/K9EGkbCF6tXTKNjtN@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNrgnz3AUfFZcDbCm0tlZGuXgv2S5vg/JH42g1YGLN4lEc9b0
	AmCxvZWQgjCfffHMfVVKZMW9YqtWq5iW4FUngbLtnINLtoGVjebnk5IQ6N32WNyxT91ZPxWlkS2
	+df/D2jypibi9IHLsRSslsIVl20Df8/4SCRASYu4pwTEcB7zzELywzNNM5xAKOX7j/lAd
X-Gm-Gg: AeBDieueqrAnSb8EA6h6tLYHgfgKUXmQOfI88TCHiCcHmmQemiulJO0On30bbsaw7+H
	EII4azRO+w88exUIvFJAZ1cPuhdJzNeqvCD1H9QUMXu9NSUdvg0bdOfbWkER0MlfS0QFJB/TS++
	SEViGekbYRa7yZULoJ04zycWvR9Xn7ioY4fJPAZ/hdF2BjUHbhkjKyjejwCY+dlFXRphJubg/uX
	JfF9VQ69dCAZBobRElp8O4eTXuK228WEoi/35k8drWInfFJHAUImo28mtDpbrX7hdtJtI2iTx6D
	vmuE4wVO/D+EDwj9ji1iB3IB6TqzgA9m7Ffm92U/w8kW/ukP8SsaTMc7HV/Z2safSnbyrMCiR7r
	wJZ2ZPMWyOAlOpAX/FCaJo9LG2T7VZhXaj3UzTvTy8qCdVA==
X-Received: by 2002:a17:903:252:b0:2b2:4697:78f6 with SMTP id d9443c01a7336-2b2d5a8b81cmr16792405ad.37.1775792950885;
        Thu, 09 Apr 2026 20:49:10 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b2:4697:78f6 with SMTP id d9443c01a7336-2b2d5a8b81cmr16792075ad.37.1775792950324;
        Thu, 09 Apr 2026 20:49:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddcda9sm11588185ad.28.2026.04.09.20.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:49:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add clock controller device nodes and
 enable clocks for Glymur
Date: Fri, 10 Apr 2026 09:19:03 +0530
Message-Id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9z2GkC/42NUQqDMBBEryL73Ui6obb2q/coEsIm6oIxbaJSE
 e/e1BMUhoE3MDMbJBfZJbgXG0S3cOIwZlCnAqg3Y+cE28yAEiuppBLdsPo5au+JtJ00hbHlTi8
 oDF1qRElXZc+Q66/oWv4c088mc89pCnE9nhb8pX+MZklhTW2dlTfCqn2ElMr3bAYK3pfZoNn3/
 QsKFFH0xwAAAA==
X-Change-ID: 20260303-glymur_mmcc_dt_config_v2-ac59220c73d1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 4XqX9TeGsI6Y9N0848ZVZF5Z65vWeVKS
X-Proofpoint-GUID: 4XqX9TeGsI6Y9N0848ZVZF5Z65vWeVKS
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d87337 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bpG4E-VrZjG0UIdspakA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMSBTYWx0ZWRfXzL051CGf+QTv
 Rovwds1MvfUQZkMDVfGnD9wLcCpF+Ezi/cLs3PvtZ7/ElhiJdahPS6Q086tyCCtUDNKpw+XJ13F
 9HaCXbVxpizJmodyeEc05N8c06720Cs2ZBbMB2fdiYgkWd8hdGYyudnV6k0UKijGxb2zUgqZ/CC
 hISY+q+4QJKBfUFb9niUUtpFKzaELzgWVh8cZHrV4BebFhRpPBrOf9doUqDwR9VBzws7U+NaRQr
 QICS2UjmY0osb6d1yaH3dryaNkXGh61FRD9noSgI3F/wQ/KSq/Y7++00mWv7cLiXDYlFrpVvYuG
 VmxGA+NWQ1uLbLh0fCWuWlj8x3RqkPN63US+TpNldsPpAolD3w3iWQXg++wYtcphncipRCxAsU8
 56Epr5c1bhI/qO+jNQGNntkkxHRgR/qoCPjaoyF7Op6+wZI7Q2XnESiQ362V98n7vmK2M/1wvFh
 NWR4GIDzWXV2t0API+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100031
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-102574-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EBE63D1ED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Video clock controller and GPU/GX clock controllers for Glymur.
Enable the clock controllers for Glymur CRD boards.

Changes in v3:
- Update the GPUCC node with the required power-domain and the
  require-opps [Akhil].
- Add RB-by tag [Dmitry] for defconfig.
- Link to v2: https://lore.kernel.org/r/20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com

Changes in v2:
- Add RB-by [Konrad].
- Cleaning up stray 0, and add 0x0 for regs.
- Add "Qualcomm" for defconfig commit subject.
- Update the subject for the Cover Letter [Dmitry]
- Link to v1: https://lore.kernel.org/r/20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      arm64: dts: qcom: Add support for MM clock controllers for Glymur
      arm64: defconfig: Enable Qualcomm Glymur clock controllers

 arch/arm64/boot/dts/qcom/glymur.dtsi | 47 ++++++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig         |  2 ++
 2 files changed, 49 insertions(+)
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-glymur_mmcc_dt_config_v2-ac59220c73d1

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


