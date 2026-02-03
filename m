Return-Path: <linux-arm-msm+bounces-91594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCdDIKGQgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:07:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB4D4FF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FA61300BE8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C25D36B062;
	Tue,  3 Feb 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhDldtCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xqu/GjkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B836C5AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098798; cv=none; b=OC1X24wB42bIkoYRDG2UsXZA97YI0tLu5z6Z6k86ZmPEXWN0p/4hwmXcQLd+SXQt/jGWD2ssTYJR6yS4NYkn92j1Y2yKZuZgmz7yuNlu+NN+7/S4b+/UjktuNZFQ9oTOkGKTQFrai3i7aQguZHecuwH3YzvAoVumDLNzhmrZB3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098798; c=relaxed/simple;
	bh=uUBE3lTqLTzvbb91gqNdaKq9CEjQg0KFuOf7KF+AA3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwhHCANfRU7MnymVUEusmdhGgt5WaKdzeF8f5AjQX6ld/9pR49GbU+sWnf3KwTNKMedVF18BYc46AXLhSflj50qdiooadN8GR4pGErCd8uzM0JxC4CbrqvEpzmz7h8zQvCuxfU2GY53bAdqI/zAYHtOO8VYiFjYPrEkbIzBH1Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhDldtCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xqu/GjkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134Zu7M3000449
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=; b=lhDldtCOsDN9tM1L
	l26fExgI/3Lv/G95cYU95uq9WeA2wkTN+RnyvI8/lM39J26nU1ILzeY26vAFdqT2
	dP46/DptRcE7IWoWDy+CZWAEXLHYI6jjyZjbbo9mnRc1vEfPXI4F6H/N39Bg325B
	Y0A9Vxz7ZK6nJVe/Jd1NOTEmTZ0+CqFBkWyly+RxHqUor+te2M8tOGi85UF3U3YG
	MZxtC/7obnR951WrtzSq5l1B5Mrb84mv83ToQ+KwTPp4YFZK9KaoijMhg9BGLKGp
	WcHniCGe31mrrJQEmK1az6fyTVCuTaHMTZ8vfaxj0lb95qYhrfMU0srheqKeTRVg
	qBYYCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0maueb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b75222e9easo10470281eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098794; x=1770703594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=;
        b=Xqu/GjkYOg1alNop0ZEpl1Tfx4FDbUL9EjMzMKtjR7Mt3hTIb81SmUU+b/Fcu81410
         FAFIssXKnczxQdyR9NIsn+OJpF+qDKvchH6ZGzTxrpoGD5vFHxJQ3Pr8GPoP3XYjE2G6
         MMx3rqclL5tDOToZaNo92QKRwgobyV5ld7ASDHTSm/5/+JicKPwKy3isEKttXVpiUDOp
         PqyVXZOcpMknoDvrrubUDvl8BUveGzZM0idKp2tUB6bjtLC6V7EY38HkB7ZFQyFSpbV+
         McmiRBZAwjRJWf7ILAsaRmq6Tc3LJbgrXPaBlz9xOj2cMFcrprkFA3oEaXl0+fX4mqw6
         V+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098794; x=1770703594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kD7qqbzSjecWLJSXY1U9bCqCQaTvsPLiVeUYq53PXOE=;
        b=SajH7f/dIJXcAiGSiLlWNsv4uCoV5ZSTv+2Dalo1bfiv8cMU6u/SZX6bkVRzTvEdu9
         c+osqfwdvFUPQIfxlzOxsQp5ZjbEpauectHatQtjfg1VX7KjqtPt/MFTXG0xvE7Auk8A
         dyhqKVoV0XLolASxfkvIWdWVVNYet4w+oHL0z6tEhpzZor3xkSOSkrP4W8lbiSgif4qJ
         tt8c8OL9HzVHk5v5ThySl7wFDSp1/d/gliZY8c2P2JROR6F7j0rRlm4yE/hZ5bXBwUqk
         MusjBDp/qm8Dp697VaPIDErYjesXlAV8pTMpLbgMSphr5KFc/wE4Q0GrrBNSwGoYU5WW
         +QSw==
X-Forwarded-Encrypted: i=1; AJvYcCUAVmirHAn9+DL2nTAuLQbE0Rvr2cEAdNyCtmNmmBRw4NX32zr/hfeKG1aH6CfToQTAxt0L1bSGs/i1cHis@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmP43jXwLW7Sr/bY36HqddOWNVhqI8qDeTJjnUIKuh5D2VSp2
	b0kKJhlk4/wgw1n7OH+JRZQ8iFu7s/uQA7l1pY/8EMKkE2XU7ZQXq898juXZ9pmCdRSqPxfawyJ
	zUQFjlLyUsmGCm75lpNQLDY5vNifH7rwdcOHdYNoeRT++pgUCNtaXKjSaHyVcvrkdt11A
X-Gm-Gg: AZuq6aJztaFbaaO7O7fMe5xi13ry3tDzb17CC9BPojdVoQn8vWtHXNvlv2UdVGoOmGj
	MeGvM9AuG3dtO/aabnX1o8E1aR2Rrr0PxW+3+NgFpSNAGQmsH6jD8tGnLJtSDblzUk6c1gXIn0a
	z2FjRP6x/qUwDk4FZldgYkISBE0qoCF52yoGP/waaIF4Bn6NAXVBf+fo+5Z+/xiA8JCRCRryaHI
	hnBZMv1a96YZ88XAZl8LzRmc9NtuEVZYgRhFLf6WVmj9eNMEzeTI7CNAJge5pdph3+wgQ1Txq7d
	SU1JSz+F+0eIuFpijSZ/mIDYSaDn8DVyqBITyz+/dX5mjmCp6aPbYaqhiu9OzKPMx1bpVXXsG5O
	otoJib4UgEU2u5jQJIiyjG7HzdJAlr2iPLr9LekMSzdDCdb10f/SdQXupIQ6U
X-Received: by 2002:a05:693c:601c:b0:2b7:f964:6852 with SMTP id 5a478bee46e88-2b7f9647493mr2031514eec.33.1770098794004;
        Mon, 02 Feb 2026 22:06:34 -0800 (PST)
X-Received: by 2002:a05:693c:601c:b0:2b7:f964:6852 with SMTP id 5a478bee46e88-2b7f9647493mr2031504eec.33.1770098793442;
        Mon, 02 Feb 2026 22:06:33 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:32 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 22:06:21 -0800
Subject: [PATCH v5 04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP
 for Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-knp-dts-misc-v5-4-02de82bf9901@oss.qualcomm.com>
References: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
In-Reply-To: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=9654;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=uUBE3lTqLTzvbb91gqNdaKq9CEjQg0KFuOf7KF+AA3A=;
 b=d4xtQn28BLwFs+tn5R47cPQECuqTUZy/pFl/6M6VW+y9V2BXVrXDgLgUUHzDAWkpewmb3cRlh
 ar1FnsWAGSLDQ6no1sunMBWI/881YXOXcHVzSx/rcrMbCtlx/tq1Hvd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981906b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vejemSqAVpqrvhYTndAA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 3PdGRacmTrkZ2NGVNegGcTECfRr06RSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX4J+22QEdrv1d
 4U/RFLTHBM0hIYc3DLhXVxjNtZYS/kojrGViuvLYIuoVpfByr9f9tJ/nJrPEA6GCD5Pcv38vm5L
 GfqIqOxqGWoHM8OhtcsDc9tp5/eDH9ihoboOs5z0PH6VPW4bJZx9+0kpKBDlTSp80fq9pKN8CDv
 GHyu8RAeyLirJYWUzgjAfMfgUXZhGjvcHMwN7CV9Vf8lDyIYJsG0cfEttf4b4Y1U18wJ9BwfDHW
 62/eKxMyTEwxSL07i9Xqe3EF4pmk4sdXPUwtmSLhZHJlLBB++13Q7aJMPsdK925gKojtLEABkbN
 FwykQVscDNHlYPZf12bgAQN+nQBJRxwngYQ8RmKNfVc9oWd/yPTmYUgYYmCF59ZqkvZmvN2d8gF
 NE6GLp3xjQEvt/7bNN/kj5c8FyGdYuAl/q4OMuhlB7aymhgPV8ONdSwEVZ1sFZn+PXvBjn1t+5C
 XaG7uIf/I7iucrqXJkQ==
X-Proofpoint-ORIG-GUID: 3PdGRacmTrkZ2NGVNegGcTECfRr06RSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91594-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.112.234.64:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.7:email,d7c00000:email,1fc0000:email,qualcomm.com:email,qualcomm.com:dkim,0.103.194.128:email,0.0.0.2:email,1.145.78.96:email];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.12:email,0.0.0.8:email,0.0.0.5:email,0.0.0.6:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1FB4D4FF5
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


