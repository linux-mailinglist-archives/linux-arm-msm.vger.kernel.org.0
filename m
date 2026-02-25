Return-Path: <linux-arm-msm+bounces-94039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIvBCU+knmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:27:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8C193646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D007631402B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52FD2F7478;
	Wed, 25 Feb 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMYvD/If";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMsMim6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EB3002A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004031; cv=none; b=V14XT4KyL99F+lnqmAVircVmYNTP4cqfRH1nDg0JghokVwlML68h9scIWdkHjBUUMz8OZrY9i1O3t5mpy5fjOrFTbQWkR2Ji+8R7ris6/Q7rBXBUDI10w0tuSEiKpUD9gx53h/7xibfDQIj73Uhrc3+Ukt2bWIurV8+oJPgbn4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004031; c=relaxed/simple;
	bh=uUBE3lTqLTzvbb91gqNdaKq9CEjQg0KFuOf7KF+AA3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=selmTu/WXpI4uYnRHAM06ycuBLPPYapoRLCeTfINe8/I+FtD5kRoFiZ9V2tnxOyBuvDiTHPHXEExLjykPIM4rFS72BKxPdF1Vo4ZRWrYKLmYL1rDKu4jMMlvP0NKpXlT7HoKyEe3A9C+qC9KweHUnBwoYTehSocRrt9+2oN5JRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMYvD/If; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMsMim6u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P0n65Y4044440
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=; b=PMYvD/IfyDpHyVUs
	qoFFxOsw+Cxr1YNLA+01R0Dgs6G3vyPFURV3VC2YyM5Dwzljnq7JsytIadYaQuvO
	wPYqkkOo2DmVBfNHI8E7DbtY3VEBFXXrqKA1lbsmizc+S7NxZJckv6Cb+RVRgjpr
	Php3sm3AW8n68832n4OVs2UA+yBYp6O3F+E7Hzwn8CdLE5z+1IwXP+zXwIS8ejOX
	46YXuTEwe7BtDWZTqhMFT9dH5xGUZkHV5lkxzAiyxHMHUiWeQbfgvKoLVETyClbv
	IOwlbSlWeY6QsLwKEe7DGp3u1VcmVME01x4pJHictETZc8l6geJ9qkh5cH4ur0Ar
	v0bolg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexejjm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d498212845so28466352a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004028; x=1772608828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=;
        b=QMsMim6u93U9RDAyE0677qEfhgjrROTL3A/x9oxA9P2z3tjqE8gTO57/6t+t1RryAY
         NYVj44/FEHjlKTCT0t/0hiaR9Eh2hcONceBW0zRHYoQ5/ERjWo6VY9YwuMPcvg7wmWmP
         oQ6AMoVvt2/Xie1E/Z9EL+hPwQkXtXeAWxcwuT7YEC5MqzTCDK1KXfZJcgqy3I9AHNEU
         hwYrz74jt+VPMP6aPQ3Dpddft5ymXlHcPjyz46KjEQyD1j4dpFdJ8c26p7WnbPRg2CJu
         3bba+niy159JNm0Q+ISNF0QYuLpzQjqSoEv3lzopx1TiJh+aafQ6nfI1SArseC7bmFdJ
         SJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004028; x=1772608828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=;
        b=pvQ68Dws4SURivFM6MdEIwo2sd2F1mZr10jIrR1NaRSA2pd7eYAuhrCO9cdGPc1jSe
         LOXZbLVLvfeAeuH1JBF4IL21vEHOzY/sZcL4yX+DKYZdvgCSYuVdl2laQkumQ9RQv0wP
         OnHfRbIDB22ndlqfFkZbmvJRUVMOtLGMUfuk5bem6J3Oh8ki9qso2KEfyqAn8KJV95Xh
         5MABdCyugXZvnEppBGoyf6U7b4mHIVGAzEj22MYdu85o2/kFG0+1RDwKBAQnB1xiAMmS
         tjwqPLIbTgIBTH05RxOCstkXu3CG8l+XaYc8A4flSxbwvkctCk37zBTBA7/GveK6DTHw
         CMpg==
X-Forwarded-Encrypted: i=1; AJvYcCWtX5VcyX1GRs9vKw7ttFefFhJ8Rf8Rlz+Y1rYVIWn62qeS/0kJTmU+/eICesy6rKhE9e9lJotcNtB7nTwx@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjzM7Z+LLkTy7048CPxHHW/7MBUPrExVrfbfAP8mzkhq9IZ/W
	H7Q5hbi/c8EIQgpW9kkFFtlvA+xUtvnDjFvnI/xfc95+3KARueTw7Bw/z0tKbMk4B/9/SA74ciG
	/AxfVcVmYJKHK09NAkii15VmfCKN0eOuLCuOAjAjcYrtKetm7gfUS7+044hoK+/97DNFA
X-Gm-Gg: ATEYQzyB1+jTb2euqV5BA1zSqEE2EPYGteNNQa4BozEcsJQ0FyXRsk83dPBboAFUjRS
	lXvILZmmm6Y2/dZVWVHIVhYU64HtnHppyhwmKXPDVvKxSNGr2P/t0gSrUmt4hZnDb6EZVNkA6CH
	ZBkIi8zNg+vpuYh58E9e3YMmVKCoE5f8TxwWlsO6A2wlliwJwpTPmry4wnXlckheLHz88sXJtts
	AlYexJAexKhzAF90+e/mlu5JuuziMBkcK791xV2k7ycvIP8eYWWyyDB/hf6d1iHqQbJwbBv5MG0
	Xd8knS5v5C1BwFjniFUCKtlbchQ+edeHjch2AZhgm7LHGnApdvztnqwBiyxd8kz60bAP0YAiZyu
	NovwH2twJjs0EoF0iVb21Phlx1zX9zZeYXLw/DNAKpTf0agSS8urBPm0Ac4cCuLkePvRwCUg+
X-Received: by 2002:a05:6830:82cb:b0:7d1:94d0:e8f1 with SMTP id 46e09a7af769-7d57a17dfd2mr759837a34.15.1772004028229;
        Tue, 24 Feb 2026 23:20:28 -0800 (PST)
X-Received: by 2002:a05:6830:82cb:b0:7d1:94d0:e8f1 with SMTP id 46e09a7af769-7d57a17dfd2mr759827a34.15.1772004027862;
        Tue, 24 Feb 2026 23:20:27 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:27 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:19 -0800
Subject: [PATCH v6 04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP
 for Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-4-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=9654;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=uUBE3lTqLTzvbb91gqNdaKq9CEjQg0KFuOf7KF+AA3A=;
 b=TPhEdC8PRlMbzpvA6gpew8SsCmAEDEi8Jkkv8I+YgCXGtIoh19U++/cGBbiWdlUbclFPb3inK
 ivNwrcBZNmSCybj5fK2DT6i0hMPmjkUUL/RvTIy7Gwrkz4oVc6fM/Nv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX1ZHkC5cSQW4b
 qyWFC2xVqDmAQkkcg30FqSHn+zOK1dy08dY1ftIDet6MNvBkXW5x1w0JFjpQXczYJxXDQ3E8Zug
 EVDWp4SGVmnCZwldbX0i589udzC04LlDWkfQ/VtUCWM5AZEaq/XK3D5vznJYpOIDfdEP0KAwpKe
 vFyvnrXphimkLkb/m9GGA5uZXFw4hdvqv7WWHvlqQHtZYu9vaYBqBwoswlWXhMtWOPcuwijbjvm
 ufurl8GTP7E1VHbEzMQJ/V+H5G/VD47/RrVsufqodAQ3DmUnbkdA4sDMy/G9quDuOU6B5AmKrtN
 m3QRsM+cFeHBvlBpluHfiwzZgGYDU8hzGNME+2ciZNgd6HhjhJULrmExDaV5wGVMZJIjo1r5V55
 Zd6mHGG3tWDJB1BirY/JBpwgJzkFn/9nVrgxu6p4wl1NyzFk9fUOEuUvRIzuy2YhAKar7NtOKeB
 cs8oWLz6lnX9NfT1z3Q==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699ea2bc cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vejemSqAVpqrvhYTndAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: qecJxq4X4Q7kYuCgp8N_I1gEgmmUERgj
X-Proofpoint-ORIG-GUID: qecJxq4X4Q7kYuCgp8N_I1gEgmmUERgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94039-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7F8C193646
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


