Return-Path: <linux-arm-msm+bounces-107220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN2QJiUGBGoHCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:03:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CEF52D6A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D6303023D91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606E63911C0;
	Wed, 13 May 2026 05:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXGXy5fS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiVfsSs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2B3655F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648607; cv=none; b=ixeV948TGORsYsFywuxPznhIxyVStZUyzDv2hYp/LB/O8KFi88lgBLEAE9mQvk1nnpqbakd96DG5QFtu0mT6qOyCWUKRoxxKBLiLIkoeCEoUU8M4mzY8QkLRCz7dm3BERRqVssKqdwkhi2/LefT9c6WBuVQsPhwq63IZy8/c6QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648607; c=relaxed/simple;
	bh=3y2DTgGvaCN79v5u846mV4AvR5kKV3/9Ga6aVGHPK28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RaXpodWpNRKgAIVrckZH9Cbitrp8QFCXRk3zIudwC9Vn9O5pjfoDg7mN0mrrb3tat0Cfbb4YbKkNXe2dWhj8Jv9UlI7jp/+VYk0rcnbqHJmMpNSfFRisrEpGHunX/3V+QUWOFxAK61e5REljI7IEWwGthd4sXBXpYgmvwlUosRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXGXy5fS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiVfsSs0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9u43136252
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d6j+XWNH1ImNatZS4xxXIB
	mLlEqL9OYbGkyb149+3Nc=; b=gXGXy5fSnUkytYNrRW8W0x5c+GW0Pm4WEeArZj
	gscfmRd7Ey8v/sfGsRHy4ep7zR2Iidh+Qooe6uz5HOguG/rnxJCBXubKQ/xxsUh1
	8LdvM7qPSV6znYOdzx5bWhRZnVBr0a2NPSzACFI2Fr6ZNV0Qd2Lw0cer6SlhOBzO
	UG8bBVik4uhoyjKiaHnig7O1lQK7cvQQxu83q62KfPtY9+b5AFhKZg6TEPCL1c1B
	2JMe1OuxchHbrliYWlYBijpl/MsrIywx7vOkXFWT/6udzhSK9PhdK1cBjl8FP9oN
	is80wpnhqw/2UuBR7mOO29swIpnTXfwuhxtlILZs9PrTqaVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhuswr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so7078038b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648603; x=1779253403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6j+XWNH1ImNatZS4xxXIBmLlEqL9OYbGkyb149+3Nc=;
        b=ZiVfsSs0qWrrmcyrNEMNGkBzIshUQaMShXSnboQuJ+DDSA8FoDF2U7U9t8vvGR6LnA
         oOkcfNWG0nvW5SkE7Y/17Yi/FZlxYmgocpuU1b8WtA486BGJx9LKA28jDM4A1BVm3wsg
         ESmVupd5Rh6FbyxLpMQLLVSc+1c2DduoAltLeJZ3oGjp6EfDcIrQ/EMOhjo9Y+CVcZ7r
         AiOxeoQ+oMO8oCi8ZvxnxyLEe8fE2uFqG7MywOxze3/EQ1k3/ICw1DhebE601QIDQGEo
         bdHAvDsEThsj+tjx3SCOjO57b9BS5eS3UcMENqZHv0T10EI9dW9CT/eGfZjHi2xM7N5/
         Y1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648603; x=1779253403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6j+XWNH1ImNatZS4xxXIBmLlEqL9OYbGkyb149+3Nc=;
        b=X2A0+zYQdcT4XmyYqZ84YvrIOmIwl5vMudKFUO2/+6i9u8CDKJ+RC0x/FaXY58ijDB
         KiLKZnx/73Mq0YIeXB2C1Rihr2cf54f8yFQOEFaMK3Ujx5CuYfCj3o0rHNwASTEo+hh2
         KLl3m/D4afQGJ1OraEjgzGl9NYEidsZccCy9trdix4CcW8Rk5uQnjAxedFFotgGOarsG
         eIUODlqUmZ7gyqLAfxnAtqzJxqVl+fTQwbrEzPxlnfSkbd1xUyMWTdP4OghHbrUBifTA
         +fmsYynQmbzcEzp1oVKFdi4JSuW9a74FyFzPSyX4XZZspo1zIkh+fPLroKQfe3fVv5kj
         3Zuw==
X-Gm-Message-State: AOJu0YzeJ++QeUlwLKO3IhN3mOZqXtyaS9MeeUIcTznko8x2Nq08rt8g
	7sSwPCYuK4BouNc15eNQxokVD80EY3wIAT2zg35JW63QcYy0E5wJK9zcJmTyxiayonYuylWYogL
	GbYZoEk26/Y3kO78JGlL7J6qMqA/MVA0SslmyM3LiL9H0Kj/VNlGS4P/a4UcldH4ke3J4
X-Gm-Gg: Acq92OE3ZvAFN/DUIsj/ONtgxnV9dT3p9SGdFoNGfNtZwA6WfEFGndfioCyfMjJzFEl
	f5wSO8ytd+g8wCrMEEZGs0m8enqXTr1gGKdTnKK61Jg/HuP+54vH6yJSbJwfFbRn50Vb+bzcOS/
	8oZcKHD95WhwMjVIYDUhpWrouTOfMi5FexTxVATfqxFQVG9SccEPW/PROzA+69G6sbz0JqDN6aa
	ofKdQaeAOd+beF4InQ1toiLW0wVFOJrmjSBnSmE+gl17OAXvuQS/8AE4jVs+5Fm66o3ZVW/nDbB
	IcgcCoSV9gaLVpRqgEjYJDN7fVEtiR1Iqd65RseHW6wcN4YmT4QavGm8aMR8XulT/GhDIzgPN08
	neYF/CLrvi2mSVzqzaY1Q40g4yJIkKpedli/nfi16ieIfIBX7SW5BcTkE00BUPC4tFzDfOSWQwZ
	kFMA5xAeUeLSa8XzyZzOzXbcjgl8Ye/NcwpDGCsRploEU5VNmy80V2QRA+
X-Received: by 2002:a05:6a00:1886:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-83f02d2e731mr1711354b3a.7.1778648602801;
        Tue, 12 May 2026 22:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1886:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-83f02d2e731mr1711306b3a.7.1778648602257;
        Tue, 12 May 2026 22:03:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v10 0/3] Add support to read the watchdog bootstatus from
 IMEM
Date: Wed, 13 May 2026 10:30:29 +0530
Message-Id: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0FBGoC/3XNQQ7CIBAF0KsY1mIGKkzrynsYYyidKoktCrVqT
 O8uuNFF3fzk/2TevFik4CiyzeLFAo0uOt+nImC5YPZk+iNx16SBSZAKtAB+b4ZDoEg5TfQ9R6N
 MSwgSULF0dgnUusfH3O1TP7k4+PD8vBh1XjOmQRQz2Kg58LVAU2NZ2abCrY9xdb2Zs/Vdt0rBs
 jni15FSzTiYHK0aVSMVJKj+45S/jp5xyuSAELYwpa1128440zS9Aa9mlaRIAQAA
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=4515;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3y2DTgGvaCN79v5u846mV4AvR5kKV3/9Ga6aVGHPK28=;
 b=r96DTGicz2FBmzYyestGjnOSb8K1Y9lrge0HpZzvrNnOv77Ne2DuNxs3TDczLIAzDC8F+CWxa
 bcqCKsJVitYDpdT268EuCTe5N1Bf+HepRPFi6RLTTboX2VUyV5ughGf
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfXxepSDJQ37P6g
 yJ4bShLS9VY1cM5ATT6T11Cw/WtqpGRmryHCjrg+J7czOd5k1c/ibAJYP5A2NrZZltrRinb1NRd
 r0x34umWWB42P+bhMvVjr0K8Vi8zW1T8hL4+k4FdvE+BAbIg9IC+v/wYGzjmPCSgq+PZ1P8a/OR
 uZDxY772HhemQwTQD8BPBu88m+NB76uojdeK2MnO5Ka+/OejXeeSbBm0SoE9umFlFaueqzeOgZY
 u3lkX2J2wOvOyUjUHZmYkiUz4VvROHprt5juyx9avSIeZMZbfm09aEn0mpp/XmYHwjVLTo4sWi2
 wQRHYfJlFQDKCas/vx6NI2uqjZh1u4AMN+fhLzc3a2sBv6YcEUaEXUH2AuLe6C8I8QBMhTtipF+
 RXk2difQIBQu5tkyw0pstfBgezGVa9jpZRYagAlKw0ZiKSrObr0F0cCcqeFG8j3oySuT7E/QDIN
 hyeRTdlxxnGC0NzRnwA==
X-Proofpoint-GUID: O_bT942lk_VQdVzX9Ho9-1XrcVSkxOAG
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a04061b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K0PYKaws7Cf5qQY9JUMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: O_bT942lk_VQdVzX9Ho9-1XrcVSkxOAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130048
X-Rspamd-Queue-Id: 00CEF52D6A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107220-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Upto V9, this series has changes targeted for both qcom and watchdog
tree. So V10 was sent with only watchdog changes and it is picked into
watchdog tree[1]. For the remaining DTS patches, sending it as V10 again
which needs to be picked via qcom tree.

Since the watchdog changes are not yet reflected in linux-next yet, upon
merging this before the linux-next gets refreshed, below DT binding
warning will be seen

arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000:
Unevaluated properties are not allowed ('sram' was unexpected)
        from schema $id:
http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
- Dropped the watchdog patches which are applied to watchdog's tree
- Link to v9: https://lore.kernel.org/all/20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com

Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (3):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/qcom,imem.yaml |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml      |  1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                 | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


