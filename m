Return-Path: <linux-arm-msm+bounces-109537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELEEOpZXE2p/+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B1B5C3FD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D53683024A35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A3C318EF6;
	Sun, 24 May 2026 19:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIzgRwn0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YH6d81TZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E6333434
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652256; cv=none; b=ELmcZPuuye9JQfZ2x/Ju/7+TwTu7tE6bRLqSqX5YCXMrWnwaXb+LyiMRaIclxhP5Rq9aJNiCdiDw795JL2Wl0YvNKPNbKKJpFVZNeQBkk6AlBEwLN4SOgrc0st9mmC/clv1k5JrqJXAc5rq4Qy855uLdLNsEY1+diRMFRAG3fNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652256; c=relaxed/simple;
	bh=FHLYhjcHnTi+yH1S90/auOggbU7mGJYRlOt2Lry2S1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYZHLKh/5s6BO13wkBc7fs6s5ePjufDMgFg9nCykz5Sapv2TX3tFylt6564fGj0mfxCh6DH9CK/I2PQA2GfJ9xq8t86wJdpIetVOd9UCyZ3EdJpgmmRhJxu7SqPdr4lvAyJsSS2OM7d0gNM9BMxrlNkLtSM/69XOG5ixkKx7ses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIzgRwn0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YH6d81TZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OGwGn12213194
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/1YFCun7nwK0khfAZYO26wBdqUr3Eyl9c28EwiUub8=; b=LIzgRwn0WZhDBRDh
	Ty9kcAaEFF/IGw1v9L/63gN21M5dAO+9DRksPVuroRr+KEodz76utZaS2sBMhDmg
	r8l25E3wehznViJKWi7pFtPO5AoNJV3ml4hamllfMHwEB6iqSZmQZknApHSB+CW9
	1Dwy7QeaE9oebDKAXyq2s+vJK5QywwtX9/P10YccCD8EfBwqFzsfLQPN2tSdCmpG
	7w0BMMit7jzNNy2cFPvRDJOsz6VaOYsPqCvwr696gefEoiqS2isDUyqBdDFlkU3I
	ElbqCaovd2JW6oKuXDtZokwxYj0pHCgBXpXCDLvCAq+01Ki8ypkORPtVvy3z2EUi
	N/nSQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fut6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3692f395339so9037376a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652254; x=1780257054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/1YFCun7nwK0khfAZYO26wBdqUr3Eyl9c28EwiUub8=;
        b=YH6d81TZwai7Q7bKJoVSMUtbjWXzqO+7HdadK+a6uLMqn10dlJN2dfzrUNK8XvKHzk
         ZEOQo23LnOUO4zrh4gh4wxVMCpNiIzzOi1svQgPUh77q0M37RtxFEKaLkKi6vuSsGub5
         7h/4N3dghJVMyVMQn5uveQrHSTmbqAdcqInrILopYFlLEpQsf4seuP8pc1vL0qtCPbF/
         sXZebCxAHSasWOfwIGw5mgvSuVOU98tBvYU5wJ0UJrjTl2UmSVDeOlo+eWy5d8erUO1k
         brE2DTauPblzoXpAs6jeWr8MUZURW2Kg4NJffiFtESgrRxEme9kn7qQeEXIO274ISgnV
         t1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652254; x=1780257054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/1YFCun7nwK0khfAZYO26wBdqUr3Eyl9c28EwiUub8=;
        b=ctAX+acSomHDJlKFCI0FJteGcCxiV2VgbGPZa9drlpti5oPdP7Eq4Rikvl/015wxO7
         b972Pru+JSZWsW+VKCqIQrt+DMj4kRWocaHU+nfgnUlLOjpZRbGcDau+3mhuImMCnSdA
         NlFeis3ppoPPxCgWFUBm6Hzyw+jMF+Riva7jTiMmYwvKD5qag9oln1isdzK7nJYGHBkm
         JYqgME8NLZ0rJb21J+hE7DSiA7nxPeDiPGyDUJO5DGI+xpLQO8lrepEckSdIBNwVmpX+
         IqqaLpSCxkwCrdjuj+jL6dXlcj795nrjOoXGVKT8GBgfykp3rxp0D1738JnXJPbTEslw
         LzSA==
X-Gm-Message-State: AOJu0YwtOaATHAP3nzuPTF3sH189nWSTXIq7DiI9zG9M2c6La3MEPRdi
	yoB76rHNkHQozg/8V1iKWXrVGayJbqPeQFmUplX/qdUyz2+pWnfdS5r0/byr9e8TT21dDvJfgpv
	WteCOFhkMz1GMaH9o4xw5bnRvfgRGXiRNRyK9SxaN/RjTYh03w79iwFYZ91hOzc85PhxR
X-Gm-Gg: Acq92OGRKrx/zmIVtkl78PP/ID/29oQPdI7dH63CXKoJGty7k3OcLkQBKi23AqnvyGt
	8dBBeS3vN8b5t5CfQESKYPHQnIXU5akedI59XflxhWsh61dOTZm9xqtTZcJ+Y+hQq3gaxz3YXiR
	lCEazmMwmjLXgKD9LioSX+8kBKQhqB4DTS7OZbNSqsoaHyywh3vmm6NQ81f3hTYeMiw2p6WAJwx
	YNNk+5iaIV1+Ub/4/1bfCzCwRI51fd7yUjDlPIgKQHdrZrhsoClpJqFTfF2KFBV/1tSuJtQL8b2
	au82xp/A5GcyaUzlQrd0U9Snje9wB2fw8iJV9dlfgUYQUOZLxY2pvY0i7XOMCea5B/SyDC1U81s
	ob93csH0MEeBw3wnWQ5/EEQBYptHmUz8TF67q
X-Received: by 2002:a17:90b:3807:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-36a6741dd88mr11802255a91.1.1779652253847;
        Sun, 24 May 2026 12:50:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-36a6741dd88mr11802222a91.1.1779652253240;
        Sun, 24 May 2026 12:50:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:20 +0530
Subject: [PATCH 16/16] arm64: dts: qcom: shikra: enable WiFi on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-16-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=2856;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IuIrHBERJ0hnqrRSXD3mk6EzC+EPUKJKq9TAcJbNRM8=;
 b=cDCRCUW8TmJJZNo9vct6MG1ITuL5Rl0JD6RogQQt16QeboTCRT9BwbUoc17/k4xqwSkC8dxbE
 sxKLOVzqnRCB0+Hjy8pMG7HMwwl5vMCt/My/3pq4KYG0VR+Qiraijia
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXxm6y2wND8c/M
 Nw9Rjxxa+BbEwvoHO3OR7jQ50gS7/M9qFwGJQSf/AyIAHcsFudJEJBypJCLHI5TUZEor8OazFIH
 v7AKJHxgPlwRMxvkVH+bTkWRpTOjb9VqsukiV1HKgkskBvhNvn5DIHan9QVuaxbUsK7V9LQrL3G
 szsBPz0ixkIO0wlVAGfB3WT+n1cjokZGTnpH19hLTImg4DML82MuQ7HR7yDr17PEUJ3uTBeycC1
 290Y3CJQmpwiTxGyYU5ViDquja99kDkSnFCm3Y9UVlz9TseDf3ODSlYGcY2ucVe6wOYZxRG2Jic
 x4fjiXyIsW+daVpe1YF91MbUKtYtszwmND0XVAx+SnRILMXXgqQtkMO54vLOqgrboMvlXD9qn27
 lUUlA1l5hSDxJAZ77BZkwygbgtjKdqKfIxQqrHmVv1KcM2IKbbu8V70LBmT11/yOz1tZa0OZ2AB
 0/t55GnYduaLczTeyfg==
X-Proofpoint-ORIG-GUID: QUu4oAd50EPL6jUoqZP3Qg3VvQmTEzmu
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a13569e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=D3pLEnpNgmQHNggwgVMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: QUu4oAd50EPL6jUoqZP3Qg3VvQmTEzmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109537-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63B1B5C3FD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Enable WiFi support on Shikra CQS, CQM and IQS EVK variants.

Provide board-specific WiFi configuration, including power supply
connections and calibration variant selection. The WiFi node is
enabled on each EVK according to the corresponding PMIC and board
design.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 259032bd20af..15208e1abff6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -69,3 +69,14 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&pm4125_l13>;
+	vdd-1.3-rfa-supply = <&pm4125_l10>;
+	vdd-3.3-ch0-supply = <&pm4125_l22>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 142cc8da53ce..51267c1a86b3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -69,3 +69,14 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&pm4125_l13>;
+	vdd-1.3-rfa-supply = <&pm4125_l10>;
+	vdd-3.3-ch0-supply = <&pm4125_l22>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 9bf52030bcc5..f4e93cfb77e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -30,6 +30,14 @@ vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	vreg_wlan_3p3_dummy: regulator-wlan-3p3-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_3p3_dummy";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &remoteproc_cdsp {
@@ -77,3 +85,14 @@ bluetooth {
 		vddch0-supply = <&vreg_bt_3p3_dummy>;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
+	vdd-1.8-xo-supply = <&pm8150_l12>;
+	vdd-1.3-rfa-supply = <&pm8150_l8>;
+	vdd-3.3-ch0-supply = <&vreg_wlan_3p3_dummy>;
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "cq2390";
+
+	status = "okay";
+};

-- 
2.34.1


