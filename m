Return-Path: <linux-arm-msm+bounces-94043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDd4Al+jnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:23:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC0193548
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE0943049093
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC192F3614;
	Wed, 25 Feb 2026 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPLrGKr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHeA1+eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1853C30DEC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004038; cv=none; b=nPtIBoYTYbtc8vBxBK4qesV+7510XUfvFpViRWUvrdi9rwAeyQe2urVp0fDN53wn85Zqq8gs5aitsQ1M/Y/v+2Z5bzsGofIFPTgWAoA3i5b1qPW7/c3Z+H70+22I5eKowGhSmnlaFQDz9WGUb8QNvc+Dh4f/ydQJXnVD0i4b8b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004038; c=relaxed/simple;
	bh=mHUaP5NvtmLyzzQH6UoVGlyemVmnqXmW3W36Kns065s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0q/8HVqxiNWKEuLtfWFY8LpyMx5pYoAQ6ubA0daHnbBg88mhx3/lk4hUAmclb99CC26bIWEjO3CgPCRAj4+QQ0I0cgVUCFylc4L/ScMn4w1Tho9QF1lhc3SYwCKxWuK5RvXSaTbbV2tx/duwoJd2H2FvxaVJ91S2+0Z5ehylPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPLrGKr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHeA1+eh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2HDi44077960
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ab85S6IbMI2MQ9YFhaoEHTiwYDDCEDsjuGQbKUiTio=; b=VPLrGKr9WZfP2K2p
	vXklmlVlgDkaa8i3iBEZGUrYvGFfu/VAPDuqSdlSDgP68MUGwFycGK3ADOCaTZyB
	DGDwCzeLCnWosMJnHLC3ihMn/ipFRjnQ4EljSlAhf/nVZCAU/vepjGoyYZjQkACz
	RtwWBDNcwcar1Armyqx4fx/lWwaPhWWquvY4UZmim0momMx2i8NY7r2EEGvatNxW
	zdWVjnjavZJpilEuJM5Dyt48p67CCTSIGNxBBFUVR/mEZ9XjlzBPkvvwl8YgIeUQ
	dtr2qrlVPuaFESsD6vmnvmtMv795LacQ3spsvQQrunF6J1mDSVqntqyGDSuUDoHO
	6Yk9Ag==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p8pt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:34 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4cb5810a0so40591702a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004034; x=1772608834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ab85S6IbMI2MQ9YFhaoEHTiwYDDCEDsjuGQbKUiTio=;
        b=JHeA1+ehyFOpuWamRrm815agPfp1+FGMngmOnE2usW3HWWBKsiwsrnU0zTW5I1IwdF
         lIulefJ5vN4fAXdwoSsrJynf3CzXzQjJW/KhPGwjB2jlv1k/ngv/aSPDzx8wjzJeNhDX
         5IZvT4Yr7L+qLUdXXXJxE5ctzaUu6FLfoJZ7EF40jtVlIybt0wMnc9jL48KpF4UP/tkS
         xjSG27uE+LIpi+jiROin6AdHgpqiLekI7QPx61ADRInsoUMIeDvJaP0OR2supAUutEgc
         j7zRfoyseOYPlHuI3pxZMpLuvSQEpnHbfJvryk6TcJMIJQXSsNVXi3yYu4MiuZKaRDT1
         FAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004034; x=1772608834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Ab85S6IbMI2MQ9YFhaoEHTiwYDDCEDsjuGQbKUiTio=;
        b=ejsvk+EagkmnYl4GwAaajWUykOWtYq3lg8Jvgd1C0ifnTNuXtMLJyultktUaE3DtDP
         eNJnRtXYXeHu/62tC6Dg6DjGSvVJHeBcebBMsTDo1aMgm4Rlsiwn4w8IY/jKikvUZQIG
         EA4oUMBPBr9UKJwzq1LsoFV4GrF15JtnHrODX0iVnxlYYsOTUcthi2qZjYzU9KvjJcf3
         0XsYmHozcxsIHhy+dc2CM/dR0Y+BBmNaM9hutT2JSV9JDB3SDX5Mde2S2mOfAKC6+Qnq
         vbgy92QLYR1gNS89fZgkX9bIGIwwFjOK1CSrZ9QBTZjj5gQoobrG/opTStp+aAeUmWi4
         fVOg==
X-Forwarded-Encrypted: i=1; AJvYcCWxjKAUiS12aYNuxMQGv1/j+VWBSyn/wNuFHHaTCz/zPF12/insMuQ701oyaPXxBZTuL7gjVmKvEHSsLkuT@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGnnKK0T12y2IOj5Q1MCybf5t6/uVVbyPXYRDTDiEQmTV+lDs
	gEYOaSJ9H8hSjtEOz6BNRV945Jhy+Gw5urNiHpuW3vQFS/jpXBClrqCTIfjYzl01ACiiCLhdhln
	7F1322yRBbAORmQ/7j7ezGLGMeeB0c3YELPxGcHKm4qRYyVaeFi8fb4SNchUNYmtGEzNM
X-Gm-Gg: ATEYQzzO34DOJDlWPReeJmsQHLZb6+LKQjIgSdKxykXoe4BpSg9zUL8rtgL7LezXZdk
	tKvpAvhx+8MTfxSR4d5+XoSfxG5Qa/oCekFLBDoJiEvV5Wujq6wU2ooDu+5GjNJ/u+oKf1yfl2G
	jkg7gImkQpRnXDwhssORNq+u9qVfW1dysBpsaS1G2ZBJ2FF5Xp0vz3jZKX1PdHFxfn9DE7fArap
	AiiT0Uu2dGHuuAjyL1VEe0gnYFqASI0H6Vnb3FIsf617Fq1MpYJZkcxI/WncAAuP3CDd6lsmMsz
	F6xW4WARzKbcEFDcbSUtbt2zRXCoX1OCvyE+6pJRl6lyvHj5MYgtQcxtr2YQ2TuiZ8pLJNL9Rl0
	sxMFLzxjyX5+IUnjixnywa0DAB1g9TiBQJXBci8Xb06+rBU1VqWuTEDIakTGX6G7PdhheQ8Xi
X-Received: by 2002:a05:6830:4118:b0:7ce:2b15:de88 with SMTP id 46e09a7af769-7d52c2c9262mr9232027a34.26.1772004034342;
        Tue, 24 Feb 2026 23:20:34 -0800 (PST)
X-Received: by 2002:a05:6830:4118:b0:7ce:2b15:de88 with SMTP id 46e09a7af769-7d52c2c9262mr9232012a34.26.1772004033907;
        Tue, 24 Feb 2026 23:20:33 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:33 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:23 -0800
Subject: [PATCH v6 08/10] arm64: dts: qcom: kaanapali-mtp: Add audio
 support (WSA8845, WCD9395, DMIC)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-8-79d20dab8a60@oss.qualcomm.com>
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
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=7373;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ameuWwKDmYuonMpUCitEB9BIFn0ezp5L7tJ6EyXrZQc=;
 b=WvK96evUixJDMihtHQ3LNCxJonPs4tgiUtY9t0wmqgIFUpPbe3AnqMHHMGyi8WBz5bXiqJTr7
 2J+GmOPUpUADO8UZ0jaiZ2iFP7UMNyyK96Hi5vlAOzNWPSZy+KEKC/f
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX5Yp2+pHF7rIJ
 qPgt09piOIU9b5sABc6MbImbB1imXt7J9ume46FZptKZ08i/aQ7BCXSUBf4wq5EQUY8gpUtDG7u
 QP2hbDICZqeJ9WlKGrFy2RlvJ1iuHy2/PBDHiw4vYBmc9mtJlsC7vie/TIu9rMfSiJZ9fsK22dX
 HOJjDB7YIugIvr3ezl3BNGZAl/Ytkzc0rvlFPlMxYFyx51pzo3vFwj6B2+YJdM2gwt1HLBnbma2
 T8MbO7/jWQ3JSfXb4EQoXORvjnRuQ7gyeFoQ4h8TkMAzJjgkMx35199ZUZ9e2arA+p42Hk3fAhX
 ensbjC/DcyPCYkxoCaQk30xzHS+3jNqJTA969p00mph3sjH86abzuNuYou3Kc//w6j3EQhdZFkA
 4DIsUIyBddNwsNDobxu3OZiHX0GG+UPWi9HpS5SCej/IWm7DYCySIValZbo1J6YmlN81jfvaXgq
 wbFhPVa8qpcuKciXZpA==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699ea2c3 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lxMpYmIrUrCHLM_QX0YA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: ZTDnwKePWlhql4B-fRIyUOw1jO4b5B8J
X-Proofpoint-ORIG-GUID: ZTDnwKePWlhql4B-fRIyUOw1jO4b5B8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94043-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12FC0193548
X-Rspamd-Action: no action

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add support for audio on the Kaanapali MTP platform by introducing device
tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
microphone for capture, and sound card routing. The WCD9395 codec is add
to supply MIC-BIAS, for enabling onboard microphone capture.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 3544f744fd1d..bc57935c042c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -52,6 +52,115 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	sound {
+		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
+		model = "Kaanapali-MTP";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS1",
+				"VA DMIC1", "MIC BIAS1",
+				"VA DMIC2", "MIC BIAS3",
+				"VA DMIC3", "MIC BIAS3",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd939x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&north_spkr>, <&south_spkr>, <&swr0 0>,
+					    <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+							  500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-px-supply = <&vreg_l1g_1p2>;
+
+		#sound-dai-cells = <1>;
+	};
 };
 
 &apps_rsc {
@@ -665,6 +774,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -715,12 +832,114 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Speaker North */
+	north_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker South */
+	south_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-n-pins {
 			pins = "gpio102";
@@ -743,6 +962,13 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart7 {

-- 
2.25.1


