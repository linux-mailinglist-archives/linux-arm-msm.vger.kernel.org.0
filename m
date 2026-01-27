Return-Path: <linux-arm-msm+bounces-90666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHXsMLF4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:34:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF5F911B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DBC7304E73E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2269529B79B;
	Tue, 27 Jan 2026 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHnUOiAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDfH39qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5E2BCF6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502858; cv=none; b=fA6UDLUYQ+xd+iTuBRigEJ4AOAAQWMhuH/zwWyuS5DPPE+tY2jbXNV14Welx8QScBgh8NjekoHVeXhL3WkuDof8sxX4THP6h72wlWRc2HPPHyUil2XMplnfemmmp1Wsc8w5Z4yZx1IBX5LDiS7sMSKVNe0zJ6cDibtT3T5TBpCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502858; c=relaxed/simple;
	bh=uUBE3lTqLTzvbb91gqNdaKq9CEjQg0KFuOf7KF+AA3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNJI355LIpRpS5be5xL86zQRwKdgf16+vQV9w7FjCeE3OSd5oe4pwLPhHPow2lHT5Jb2vvSb17e7WQN/dQtZwQMI5ha8U0v7ny8enkfxpLy7zLw0wYbvdiKYZyCw6hrlXD0auF0RrhF2x3G/Qc6Se34pUdwnsRHW8APKbm+caIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHnUOiAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDfH39qL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86uBM621131
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=; b=eHnUOiAGNDg8SHMl
	tD2l+E8Mn+UK4ZPgdm9xCnniGTuGkHDmirqlfs688aEW6GMMFKn3WmFQC0Cyjeqk
	UOnggxVDSZWA+/4Uqc76X8duHbmHadERbNak0AunJbHmB5StvoUJ2ZV+kAmvJ2lo
	dOTey+VvOFoDpQjYC8g+AJyk+040ouLRgVYLzjnOGLYV2nT/VRIsNZaqVXEApxNq
	NFlC5qmlJ7zziIryIyemoqikmP2rpieCdV13xMOfQ1ZycQOHmxXm1O5k2SsRNclF
	mhccb4l0UJKVZMA1SocbYCgu+yH14GfYfx+G1YrdRT4x29EBrPQ63dm/zvI6zHv9
	cDPwpg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjeg2q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1233893db9fso23688930c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502853; x=1770107653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=;
        b=RDfH39qLIA1X7tsA0Pco0vO0OVdL2+7uryvXczQ49XjfLyppdleqq2aW09vXGGSXLI
         T9n4Hb/qYhWVjOD3QR1ELS80oZ0pe2iNYgDOS1FtUxRGUEM0Zbd4NKSjG1c85jIQ8gjH
         hnVedB+0BSXM2d/J8BagT57SRELnqJjBXM0spAcL8SbVwBKNWbUTs7TUNvTQxlX3jnEb
         C8rCAyMzLtOvKZSzAjDzNX9EckupkoMdXTG+Vu0CseniGKYPZP+QAUL34vzfmqW1drCs
         iPVFTz3CKjWENJCBSY5OyYZrHdxadRduxK5tL9fPtR6ccnoptbJ6CrYsY00R4zj9Pvil
         XdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502853; x=1770107653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=;
        b=WivDn0yQZZPGBviXZtXbdcSLVUWszFUxIc3t+bmCvVAdXpUzcLK7SYp04HGPc7rLat
         tWBTpgOSW2tP1CktFYL28VY5XC5aNLldVCxTqcgAjAg2BYgc8FY2Ey7jNMRJXaNIhEl9
         yfNOBzKXZm60VTz9yDpeBJTVirJ0dXQT2Gz+ddLN1TftU1ciSjRyWPL+p7X86YZQwR27
         63y90UnAG2yQngBedt/WgbecsqqvblycpjaYYdNMgqZW7J/kiMOG28I8ecQJC7g06I6C
         07B1jYNLBwAxHoCvxCU6gaveGxkca7B4+fsKcrEuIXJq5K/IZLk2eJOi5Ojg6zOwpv6r
         7X7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOpnjHjxjclDQyHP2VepX00u6J4THCSmLxQhk7xLV4D8uTnYYNNa/a9Trxyj+1dPNec/3b7nvFVYty5mcy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCN8GkbM9ujMfe8phXw+VK2lpupE4zAXmQvavfixnyPWARylHp
	V5tfMIq5qTC3KEvvIOeNpz4vMhp+cDlzCG9u0bWvnQDmkt5GJ3xsrtw+4jYY6M3u6wbDaAbdwGO
	C4uEjWVX53OxJFqiY4NLoYZNSgH0+oA7DCn/X0Itxhl0oYJ9XzijklCJ085FzyPFvj5qm
X-Gm-Gg: AZuq6aLdWpFuHOSsfJr6Xvmw38ZvCG3nB3jkHnvRzYdLaRDYyJS7DYR6Q5ifl8MqN9v
	ZyBwvZmSQFQVDz2sY736jPv03I/k58TgssKrlRnrFU+iVSoATEvezZWe0d0ff298rwwBj46bgWw
	vnx0Pg69Fu8bJNdjmmOmDg/2RsPLtNNZ0/YrUFoSZH8p0W6Nwfl+lCdGjzEXHf5v3Y6vJ0pRmt1
	gxJkUQUrXTQs39Lf4e/nT3TQF6H19F/1/MGBDhKd3iywDZ7e9j8dVWK4IF3b4I68R/OOjV+nB6Z
	jGby0pgpUCmF6MZpjRHpdL6SgJI2e2hz/cC6wq/DUlgBScdFfJym3apVC5FtG0jzcljS/oJXd9l
	eEt0mbxtt2TXRMERU63V1wDmLqITnIA56JSiGRYU8Xsc8PRGR2brp5PEVEG1Q
X-Received: by 2002:a05:7022:6998:b0:11b:9386:a3cc with SMTP id a92af1059eb24-124a00e445cmr667694c88.45.1769502853334;
        Tue, 27 Jan 2026 00:34:13 -0800 (PST)
X-Received: by 2002:a05:7022:6998:b0:11b:9386:a3cc with SMTP id a92af1059eb24-124a00e445cmr667665c88.45.1769502852719;
        Tue, 27 Jan 2026 00:34:12 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:12 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:01 -0800
Subject: [PATCH v4 04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP
 for Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-knp-dts-misc-v4-4-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
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
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=9654;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=uUBE3lTqLTzvbb91gqNdaKq9CEjQg0KFuOf7KF+AA3A=;
 b=EY3hBMx6R295SncsrQMzeJQyIVPnt/QvcemdnVlS+As8CyrbmDUTCPx7KvkvW7aY746mSmYUH
 eMq5pbecIIpBjQtVHfgD55goVCh4qh/Ok2aOaTtKbmu0hpMQQK0w666
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfX7QuBtgvRPNpc
 rDwmVpzzdLA6qBrL+lh20UjAjRoTP0BSAUD2fnPJwXCR5Z71zdHSFSkLHgwgzAl7T1yUCQkHrrB
 1mPX9N1ZNQn0uLNGBzfrzHc9dqkedAcr4GZKC02Keeb52FoYORAC+LvHPUW4+rsQ0n16qwTXbug
 9OhEaVGFRpYzGpFV8SSMMMBLw00nHfgxyeFTuj+Idu+5Be1TPsqx4yNAD8sEgqcDc+urtgJesEw
 EOGZp6bD/1ztsE6VXPwdsWdNsGI/0iwZL/0M1597qciRXrbitH+fzxzMISoKX2CHN4UAhxW42DE
 smQ6b3mrmuatv/yD6B6/j0o3A8NhC6p/qFl+a+bumV9fgMYyPKmrMHNZ7DpvppvYWt8BtsGS5a0
 r4zfrwJJK8Xi87BVVWvR5ahNwGHBtfQH7+68+7OODy7ss7raCPxNBN0gXTTirAgdZFSXSQabQ7d
 jFY2ZMBYeiiQv+7Cq6w==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=69787886 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vejemSqAVpqrvhYTndAA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: leIBjjg7197Y-kl8sF9LyArQdExm2Fhy
X-Proofpoint-GUID: leIBjjg7197Y-kl8sF9LyArQdExm2Fhy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90666-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.12:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.8:email,0.103.194.128:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,260c0000:email,0.0.0.13:email,1fc0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.6:email,0.0.0.2:email,0.0.0.4:email,0.112.234.64:email,0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CF5F911B8
X-Rspamd-Action: no action

Add remoteproc PAS loader for ADSP and CDSP with its SMP2P and fastrpc
nodes.

Co-developed-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 314 ++++++++++++++++++++++++++++++++
 1 file changed, 314 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 251e36cf7477..c8f61200f261 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -443,6 +443,58 @@ rmtfs_mem: rmtfs@d7c00000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -2478,6 +2530,111 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_MPROC_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				qcom,remote-pid = <2>;
+
+				label = "lpass";
+
+				fastrpc {
+					compatible = "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1043 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1044 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1045 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1046 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,kaanapali-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -4760,6 +4917,163 @@ nsp_noc: interconnect@260c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_cdsp: remoteproc@26300000 {
+			compatible = "qcom,kaanapali-cdsp-pas", "qcom,sm8550-cdsp-pas";
+			reg = <0x0 0x26300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x19c1 0x0>,
+							 <&apps_smmu 0x1961 0x0>,
+							 <&apps_smmu 0x0c21 0x0>,
+							 <&apps_smmu 0x0c01 0x40>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x1962 0x0>,
+							 <&apps_smmu 0x0c02 0x20>,
+							 <&apps_smmu 0x0c42 0x0>,
+							 <&apps_smmu 0x19c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1963 0x0>,
+							 <&apps_smmu 0x0c23 0x0>,
+							 <&apps_smmu 0x0c03 0x40>,
+							 <&apps_smmu 0x19c3 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1964 0x0>,
+							 <&apps_smmu 0x0c44 0x0>,
+							 <&apps_smmu 0x0c04 0x20>,
+							 <&apps_smmu 0x19c4 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1965 0x0>,
+							 <&apps_smmu 0x0c45 0x0>,
+							 <&apps_smmu 0x0c05 0x20>,
+							 <&apps_smmu 0x19c5 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1966 0x0>,
+							 <&apps_smmu 0x0c06 0x20>,
+							 <&apps_smmu 0x0c46 0x0>,
+							 <&apps_smmu 0x19c6 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1967 0x0>,
+							 <&apps_smmu 0x0c27 0x0>,
+							 <&apps_smmu 0x0c07 0x40>,
+							 <&apps_smmu 0x19c7 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x1968 0x0>,
+							 <&apps_smmu 0x0c08 0x20>,
+							 <&apps_smmu 0x0c48 0x0>,
+							 <&apps_smmu 0x19c8 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x196c 0x0>,
+							 <&apps_smmu 0x0c2c 0x00>,
+							 <&apps_smmu 0x0c0c 0x40>,
+							 <&apps_smmu 0x19cc 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x196d 0x0>,
+							 <&apps_smmu 0x0c0d 0x40>,
+							 <&apps_smmu 0x0c2e 0x0>,
+							 <&apps_smmu 0x0c2d 0x0>,
+							 <&apps_smmu 0x19cd 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		/* Cluster 0 */
 		pmu@310b3400  {
 			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";

-- 
2.25.1


