Return-Path: <linux-arm-msm+bounces-118644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MHtwDPqGVGq1mwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:34:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5767478BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PWR8CgSA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fHiCBD2H;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118644-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118644-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3841630091CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D8F381E91;
	Mon, 13 Jul 2026 06:34:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABAE385521
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:34:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924456; cv=none; b=ZsMPsebl4lOaHomT+l59hwod6Zv+h16Ui4BiaeXt5jwuPgaks08DCHdJThVvzD/212velyGwGMp36cSFW9bf6YjLn80PP49FLGW0dHpwmgwL8x8MxQBlaJUOP3h8XsGO86IeQv0ngZCf+z32Jr9oHzCNYeRAjWmrevAcQDSPSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924456; c=relaxed/simple;
	bh=5ed2Z4b5MzgIXc3lyqVCLUWh/UljZ9Hc0R5ig7HqXLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A16WJ/IU7yCCJdiugCHLBJ6AklhmNf1Z3aJgW/F0S2fWOzdY8zyQv3LSvxx/UZxojvugOCP1A635GgSJdTrtlev0IknfiGUgffG4dt/duPW+gg9dyYlW+3sgCMtQGXU3ihqS3WHofxCKI+UjTip/UBDex89ljxzu16IeS0bmy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWR8CgSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHiCBD2H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NlWN668676
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMtXhS5u4DhJRt7XmSA7LtO8Au7WP7/Pe+XKvX2m29s=; b=PWR8CgSAxzBbF9fB
	VJ1HPO8D4NxQRpXKWAiZ72d7+HsLaUjA87wmkFDcdr2VMuZ2IW0NgzE+9Ns/7xXr
	TySpQJiOZA9wn7+z+4qmcIdUNrXmWoT1ss/etTb80v/5AJSEWHczmC4YBbsvpgFI
	dcP7HIG5SwZqjt4uVuu5CFtJA5hoYjZWIYaXPRmCSxQhbsTMekarFXCsCPWvNOkN
	WB/tIwNxQmrKqNalIv5pkIXEeeQaBxglxiJcya1eKPFPRERlGyLWIgEwyD44eibs
	bRD5cIl/WNOhekMBF13+Oz8baKmUiKxUmyFHXJHsN15Spb76+/LZOXVmJU4TLF60
	pOoxdQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm165e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:34:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2581683a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924388; x=1784529188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMtXhS5u4DhJRt7XmSA7LtO8Au7WP7/Pe+XKvX2m29s=;
        b=fHiCBD2HqrtdG9KUPd/xJve0Dje2TxyS7UOXbtGn0t/0A7pI5he3L1NdNCo3NfNvWg
         pHCxKWkPPj/vQ/ZoGDKSPujfULBcd/P9Jo1Y9UOwf9Ls5xlAPYI1q5+Hrr/GLNSXOOCH
         tS4b1zYK7HpIqsCYspDiUKbcetOJxeOoGrJcDYx8i3WpVOMDdt0RLZBWjRmc2n9K4Jb9
         WGxjJj4LGJ9XFLW5hAt+AP6Xj5klWrWoaGbSuer/m9gqmVOgSZzzk73jnjgSkrp0GpnP
         q1W6Pzx+h9dkDo0GECH1GYnqLN7dBPUnyolCj4AdNXAMWLnl3GsnG0Y/nJC696p1YCac
         Dsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924388; x=1784529188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMtXhS5u4DhJRt7XmSA7LtO8Au7WP7/Pe+XKvX2m29s=;
        b=Cyds5b8RLWUVVDhg5B2a/M3rVFz1QqmxDAp/epXPVf+ll47+DuzZJdU6zPPM5vgJ+j
         1aGi1vey0NZhOEFX2LYzIjhy2G3iI5Va/O8DdbTvlCulOVdoGH2dxJM+CmoPqGEnEc2v
         WysVQ5LW6q0qpMFoKroZkk4ocr1HnRpc3fud745tGeqCitrXmBljrt+9d+/Fg4ahYCjw
         YI+pVrEb9LyhQ7pEA/5IaNjdmBHeZizra/Pgu7+pzzxVL+y0ncqYVCi/bK15yC9+4nYQ
         xcj3efN5Ga8MIusghbh6FSTCIdeRZf4+warZIwgRXr6/P33+3K5cpETJRMKsqFe7Zmud
         OkcA==
X-Gm-Message-State: AOJu0Yw2u7dQMC6v6084QnikcWSoZWsu3rM9yB1hNLf5FH8Eq05C4Hx2
	nxKqzYs/W3PNoopabSCcA1izfDBoSendTqoMgjlIZNubu51DDPIno8unacB8CaWLp7GWWuZXs/r
	gYTHprBehCYgldMR9Nwj98DNiDHVXlgPJspb+EeX316iFxtln/opRzlOY+nfk9wfd6mqhDkP/IE
	NB
X-Gm-Gg: AfdE7cn7NJhuAhido2w/2aMK2TWRB+V8WaUXgkCaQCxGo7tqM+56C9Alu3/ofi+IBWS
	f6/thNXf9sQHzc2aZOlGWKa/jXwYOSsob7PsQkl3UkiPsLlSYrBQ6cDYwZkmRD7AsYWIHee0XOu
	dB71Wi0mL3jedVweZb87bKQMhw6cnFlx2byDD9zzn0VQqUOJnvu+s74A/rLVZ2ULACuAoSzyEwR
	gqavo/RN1FWnIbtIOWXuOnconK87MKZsrhyKWyWX7DSr+w+/6JIV36P8UFbzifVvpUCUkqHFNmg
	7Q7JwJt0TqxFTQDkOZmqg+W2spjPPTr3AfAmv2iK6S68muH8OeFqhJmL8r9Qo3NvLfT5/lQXUuD
	+gobpDfa6ZnkO+VK6KU36rhmyQx56jrfvwu1C5f3ZLITSU5Y4PvlhlrZHmyDMf525Z9IfJNJDAk
	9BV26XqP1gXsvSS3hzPhtaWsHlqYXAZ93csY3Jcz3c
X-Received: by 2002:a05:6a20:3ca7:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c110009447mr10312892637.4.1783924388470;
        Sun, 12 Jul 2026 23:33:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca7:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c110009447mr10312858637.4.1783924387998;
        Sun, 12 Jul 2026 23:33:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:21 +0530
Subject: [PATCH v13 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-5-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: PbhrqAlXmaek6VPXien6h7hMWXgM7ltX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX8lyKBMAKJYsJ
 q9MC5a/6lny94t+0DFz4kUOzIqBDymf5BdOSOLM1sBA4iz9voEd3rI6h7YKG8XtMkylGxsDe+ne
 5rLOAkXQ0M2YxGWgfohXg8tkHlfwXebLqm0Tfo2b2yOSjypaT4uU0sQbKM5u3MUV88QRx8yMXHN
 MGwl0PHEydW8MYbXIF+5/voh6+Ic3+4S3y1m9y1L4g2pcwDTP504krT9aM8Yse9W5p59Y1tnug0
 kbQ6/Z2id8bVZOp0HhdXIOHse3AAW26PVYL94C+pVqiW19OmkOrwZU1MpYXCkvYBN1F8+4btlzy
 TXdxj7wHpNhvOo6v9YGmx29vVmXIaQRu9w8qOdzw5cIPs+/h2QJh05T7vRab4lj2OdZp5zmGsso
 Ja4PgYOmDoqUGfHMd/WYiEk9UGKwqfIW7RqDRIuI1UOpVSNkJC/7yVbp48oybaWDjdGhaVevzaw
 ndaGcRG1qQKiGZq/Bkw==
X-Proofpoint-GUID: PbhrqAlXmaek6VPXien6h7hMWXgM7ltX
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a5486e4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX7BFG80/Cetai
 RgdLDew03uXqxcVMOc0lSoNX4DY3Q2yxDTAR4uzSmIBHcwHB+KThTWdD3UnZh/FnPfChoZ1wgkH
 mIT4XgodmWt6wKKR2f3pgR7hu0kdEkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-118644-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:gokul.sriram.p@oss.qualcomm.com,m:george.moussalem@outlook.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F5767478BB

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..0ecca5a0e68f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -159,6 +159,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc@0 {
@@ -656,6 +685,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,

-- 
2.34.1


