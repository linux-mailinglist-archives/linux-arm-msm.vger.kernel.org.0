Return-Path: <linux-arm-msm+bounces-111769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a9f4G5uIJmoeYQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:17:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C26547F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:17:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=clyMt8TZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a4R4WlAV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111769-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111769-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 951833008D41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AD23B4E9A;
	Mon,  8 Jun 2026 09:17:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9F3B42EB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:17:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910233; cv=none; b=LVZLjwuyGDn/D1EWKO8am7CyIW119XJmvy9+eawLF9aVMTgrBOP3weDlIAE1fXz9BTMP49XWk2EoYUhrCE4lJG4uEdkcvitAbIqCOARuYaBnJVLljOkvcaf5tE7/4aV6c8Dul52Qdwz9OJT7A1/bAHzn/U7oN5VHiAbdY+aH0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910233; c=relaxed/simple;
	bh=5l2djtNbAKG4yz59Sy0TGxxB5M2aM0T1Ix6YMc2Rlxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=laQEFgSGZg6RoMLJCCm5SjcZmua3QywLs8h48GP7PbTKh7LpgponxQXnNiHpnmUvcM9Z0lyniU6kCethPuy6/hMxnTrGydWXOmZyzpiF3aZ0eQmqh1iYG9Qb8XkYO3KWkMXPtLgJhC0WPbXcrFzOempBxvn8Tp4Mpvvqi1pJ+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clyMt8TZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4R4WlAV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586RW6v2833493
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9TQChVoZGJE1ujfnF3D1YTCmrzz01p+wDC5
	U6eyAgsA=; b=clyMt8TZ9PBMiGr6oQ63qZiAEfMD750Be7MXNqRyIJ6k9WuvfD2
	eAzU0SJ/10PkBWQFZvnPx6UUXmurumz+J/4WE/5TfgPW8D3kIEQY8gNFbhnQJT3W
	KUPVJJZ0eF1WjixFVCtgKDX+msGmYCHp1XpROWIVoJFzp/caedoTiNTqDnmT1Mxu
	Zc6UT/xfqCHqcmVltzYSALh1/2gZITk8EYOqw5aZCH/UoJIUkpaaJSqtMEWwI3sm
	2e7I4Tu4+Cl6v1JNo1YrjV9+cqPHOOZfc0h/eh56Dzi4+ShBQQGByJ8Sg9vqQFWR
	BmKSYvPAP0eWVb+PjkRt437lXHvJw6ov5qQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4yb32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:17:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1370bd383f2so433531c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910230; x=1781515030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TQChVoZGJE1ujfnF3D1YTCmrzz01p+wDC5U6eyAgsA=;
        b=a4R4WlAVHYjFgjivj5e7q1Z/gF5dR29Bhoqm7NM9dvG9BB9wL9zV6hU6V7zEpKms5m
         LatT/Pjgn4DZR4yw64Bk/ULZwjZBojSIWiSL6DpJZQ409TgL8PJ6ogJ9ket1sSLaq/WV
         TVV/HmgCcjt8h/nC6FP3gzabX5RZMRPsAkSxEbX5N8XiHl7LHhHCh1AqRkxIPsJmpefC
         ShoojDcux75ss8rUurbasp/AO66+xU12n6BtXJ4TcdAseDBb8/InHr4g61F73hcLVu1I
         W72oJisrnGRCE4an7ov1+Syufg7k80gC38NqAGHQDYqSwi4Mp/ZVD14U/gNtfhSNmIUE
         xu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910230; x=1781515030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TQChVoZGJE1ujfnF3D1YTCmrzz01p+wDC5U6eyAgsA=;
        b=ecJWeCZEPfWIuxLZShoQvIYz4/dTF1QJ/0F65I3K5+AQzb91awdjNjRx5Cgdg7zOPP
         ktClpLRKiq+/QL3g9y/pkzF5A0kzXG8rDp7TepgVQF6ZtF07izV8XMCzg7TQJK3FF6Gp
         mVkKInwN/tS9dscauV7QH/iInf0UL+ycCXB84jjQawrHDmF5YtecVt4A6PzEUGfKHI05
         cPiQJESeKsjlRpsKl/Fv5LvubuhZtka88hTQgJu9Geq4hbpcJxavTId7JgIlXxIC1MAd
         B4VBaqg8B5PKFd0JGaMmGbR5o+kXxRST5B7ZnpaY7VNC+Mv9BtTtpKHcC82H3Rzbxgpd
         9QJA==
X-Gm-Message-State: AOJu0Yy3IZfjmrcikerxFLNrTBIMM73PHZpI0KaQhuKP7oPBmZBJ4GWn
	Id8IrBax2OYBcAT1MU455CHcVi93oAKSDheZbg3r6RFeLJZhxxYRIAjRUc8sXsivHD9yn1Z6HJ8
	R43jLcWW6aVrJKCY14N3dZx6Eu8VrbyZ0VFkriXoYBkUi49kjbcwp0FxFZ8LGIowx1mf7
X-Gm-Gg: Acq92OHmbBvVS3oEJNBUbEQl0i3wvaZ43bJBLYA9HE7QDqYRoHuKwCzehFx3ucul5qY
	F3wzE+YB6Ov1Q9Sh1XNmclmurEhFtGz4g4hlIs50I6juj+/2KjSpMYRdOqrwFZDPQaOfyHLLLw2
	1HYrjXu9E+n19X5q84s7jS8peHFUgZfC5lqYLk/T+eXZkziYYo3LdnzXisSJ/Q5ZyJqsbGVlY1z
	hT402V+JiUUr9CJj3Fliw20mDQmb6Jqu6813ldTxCjH86nxWej7rVtdzDQiYdNxrDkftrXIV3+J
	KCK+d3qQCvv2PZZtim79fsUTaMb78wsDdGohVwPr/x2GxrFdAjTJhflf8+RUqhaby5GC0Eguj+k
	TRrZtPUiRIT3Xvw39HwFqsqkFcHuo1VOsWuyGil25FwaIwGTMZIzNAZ8GrzrGFq/dY+Stq8VJbZ
	XeaTyD0/A=
X-Received: by 2002:a05:7022:423:b0:137:fdce:fec2 with SMTP id a92af1059eb24-138067f0b96mr2904754c88.4.1780910229714;
        Mon, 08 Jun 2026 02:17:09 -0700 (PDT)
X-Received: by 2002:a05:7022:423:b0:137:fdce:fec2 with SMTP id a92af1059eb24-138067f0b96mr2904747c88.4.1780910229057;
        Mon, 08 Jun 2026 02:17:09 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm12178656c88.14.2026.06.08.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:17:08 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH 0/2] Enable WCN6855 Bluetooth on lemans-evk via PCIe M.2 Key E connector
Date: Mon,  8 Jun 2026 14:47:00 +0530
Message-Id: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BYS3mPFOA3wTXBXBpYaAMt2F88kQWZgH
X-Proofpoint-GUID: BYS3mPFOA3wTXBXBpYaAMt2F88kQWZgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NSBTYWx0ZWRfXx5/h2P8Qu7kN
 nwiTKKF4SB9AcH3oHrp+OpZngk6P7i9tySXiQVYswRqfw1AWAbyiwZgtGDBJuWLiUNdygAjYw+/
 rF1ORoimqpOpsTmWRbfW5Kii56bO9xxvVwcitMiwFezvwuBFLL7LxOumKbnG8FhzyYXzZaS8IVw
 KuQQZL3dulr3UBqNv+fUm1KYhYEq6R7v9NeywlDcqcHhH2JTQOCQ0YH0bCKYa25jt2x/0aPtpTI
 UIK5gUSqzggHoDz9W82IQsCffWQ/B/6BP3GBYnqjVYAedqz9VI1Ujg8Elo9gYnfd7v0oJVhXImL
 gzZKXnAqk/VlHrAwRDcjN4tIezfi+FEAfl2b7kqZi7DQi0OGfnVVgpXzpydGFwGuPjQDtmK7reA
 beitF0+BlA13s7us7Is2fMzzlMYuZb7wpUu68mwysWDTdne1kCkCGXP5QQ9mNhQmwXpZ6tjBUiA
 MWJIbsPeYTp28ra6E3g==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a268896 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=g11dK_DTieeChMdKYl0A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111769-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 265C26547F6

This series enables WCN6855 Bluetooth on the lemans EVK through the
PCIe M.2 Key E connector + pwrseq-pcie-m2 path.

It depends on the "Fixes/improvements for the PCI M.2 power sequencing
driver" series (V3):

  https://lore.kernel.org/r/20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com

Patch 1 adds 0x1103 (WCN6855) to pwrseq_m2_pci_ids[] alongside the
existing 0x1107 (WCN7850) entry, with compatible "qcom,wcn6855-bt".

Patch 2 describes the M.2 Key E connector on lemans-evk:
  - pcie-m2-e-connector node, port@0 -> pcieport0,
                              port@3 -> uart17 (BT serdev path)
  - vreg_dcin_12v (12V) + vreg_wcn_3p3 (3.3V, vin-supply 12V),
    both always-on/boot-on, as required by the binding
  - compatible = "pciclass,0604" on pcieport0 in lemans.dtsi so the
    PCI subsystem can match the DT node to the PCI-to-PCI bridge
  - serial1 = &uart17 alias

Wei Deng (2):
  power: sequencing: pcie-m2: Add PCI ID 0x1103 for WCN6855 Bluetooth
  arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/lemans-evk.dts   | 75 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi      |  1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c |  2 +
 3 files changed, 78 insertions(+)

-- 
2.34.1


