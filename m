Return-Path: <linux-arm-msm+bounces-115913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HgXGNpRARmpUMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:42:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3296F6125
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Yw3gBxy/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NQ8TzKgH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2541333ACA6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC464DBD97;
	Thu,  2 Jul 2026 09:51:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E8D4DBD9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985885; cv=none; b=SPPliKuxKBY+8+SdO/mJpITNcw1FlLWMQ9Qf5fXNl/ixeWeMkv6naSDbevM0f9xgGvdMq7HiuS+SoMBufaSal9P6A2ca63OqlX3ieBZFszWvtP0nr+rvd5l4iVWrzAoa5066ichu//fjU6vIq41rjqSvfAWxoQWwPLSJD7tt9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985885; c=relaxed/simple;
	bh=e/53ppasmjQDhLX9UrUFxxcmkhukY8WHn0fzriW24gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fcUGJpVQSZwLilRB06V8c7md/4Td5i0dLje885cDR5109n/LOYIJovtiFDfHsKPVWn2P1ev6GyVLVtwNKfxoPE4GM511JR/yoRhoSUGODfzCbqGwzvwcQ+pu47W8QXw+k4Z7AiqoBrZc74YgDKFI1M+h8PuBbi8KNxRMZAX9i6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yw3gBxy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ8TzKgH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242spu3460370
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPc/msxlXrCzKPXdcDmMWZb2kXigoey6CgHTW67K1z0=; b=Yw3gBxy/qaFa4dH+
	Tfn1XbJUQ/vttb/ZFYStefXAyLCSxr2woTFbL+YNWsw/elbJaH2L3MP5J1yKYjfk
	n4UCYKKQ5L/fdgF4iEmuzu07cbaeIafazZ6J0nP6If9RVKpJZgCApTzDV6sHeevH
	FVDQzCUSIvfSh51Z6kf2CtpbGuCMY0eEPRLF+oW0BxA2rhtWsCSaK7qQhl9MlebJ
	IyZ/MKn6WCtQ+JumtRE7LgrMxUfZW6CP2bYEukq0hnJxkJC5qoFYMtFMnGPYWyAl
	YDis87WA5zbdA4mHb/hIUUmhwYN2lG+2tavroDzw6tOk6RM+J9u51s1WpEyJVw9b
	w+QuhQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb17wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-846f50381a6so1219954b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985882; x=1783590682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPc/msxlXrCzKPXdcDmMWZb2kXigoey6CgHTW67K1z0=;
        b=NQ8TzKgH4WwbceVmmGgjMfalYmwNsVL8yuAWko2HRLuxIcRkpPhjbU3+FHURjL+n9q
         ulYEFZmVJDLf27L+IU3Abxn5n/gDmsg0Ii5HtqXyjgvrOeH2pmRQ0AdG1nkWN9Q2RREB
         dJutyFBy2zZgqtyy00tOPaYPgvFCPmlZlVC7GKtK5eyUwG8kMT3zn2ZesQGT4poqiPwl
         XRpBRSjYkPgzY9coq1fBqpGRZ0HeQJFqCjl5jOSfcvVR50Krs7IW5GJ/ekkm5RbzBMF/
         Gq7Co+XqCPd6o2NwPsmiHWs4v4RIU4VZ5hO7if3QrAN1wRCcZJjXG4WvbxA4jiM66l/U
         oI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985882; x=1783590682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPc/msxlXrCzKPXdcDmMWZb2kXigoey6CgHTW67K1z0=;
        b=dhnOQUn/tdi6RcyclnlMT3snrBfaM3FNqTQxtz47nGU0U97Qq8nc5JeIiHYS6ON/ki
         eZUbz9wh1hOKjcWMDZBmy38ZP3C9kI4kQPafGPsIvpjnDeDxScRtdbRL7a9TgP9L9u6V
         XJw3OTWJOdWWQDaerKyExrVJ0U7PoDZRiphYGOXWhHxYH6u4U7/g3oGZB6c5ayGHmO8w
         e54wgBIvqR+YYDn83qWowCDfS0tqMvS/C40sEzkTS+qwa2GQtd52F6NRHAV9W8UGKn9a
         FRYVo2KhyxXkDhdT4X4e+2k64Q+Xcb8i7Lg12DFBKHF2ajvMFeTpgRvYHf0tp+VhBF7L
         Twbg==
X-Gm-Message-State: AOJu0YyYANTRIYhONHN8jrfXf35NFy6Z8WENlOb624OnY51XyBK8sQM3
	DlbYadCC97HPuP2HW0o9kCejhrGGgqI6ueyQRZf3Le59Mkjm6TIQaVrCc0OggD415TzvGAtBsWN
	kqmQIhKQ+Rb1zM1Sv4u1GjlBS02ywfgwA2TCX8PO2QUsTr2uxBsTOhQANp9ZKs9f8lTnv
X-Gm-Gg: AfdE7ckZZux8Men+xegyqd0wv9As2BjZeH5RC57ujJpI1T/h/5PlDxKDx1dmZhGAe+N
	sfwRRACm+HJuoEEPHWDufvoQ4OBTk02MF23ttWtbZQJfqKUtX+9K2KSmmhzFxERDpx06SojteOU
	w7t+HqXNLg3bf9M4OmHLM/g98OXcBclvWe/HvFvqCqTMkz6RNn+GhpyUjitsjoFqtkiymUAZsnH
	NLf057RhRdD82JLKguQEWftBPasypRVBT42V5hsinJKEkaq9sUQqji+Vo1qYXUrhNiiCrgaluSG
	udo03tVz6r+xLsGJkwaVIFqyLXo/5xtdXDY7Kxsux1yqkB4DURC+8/ZowAL8RLYm6wt/Ljsa4e1
	eDM2qK6xI4TmK2V4I0Y8Qhn1BEA==
X-Received: by 2002:a05:6a00:414f:b0:847:70aa:9586 with SMTP id d2e1a72fcca58-847c5039b2dmr3974095b3a.16.1782985882511;
        Thu, 02 Jul 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:414f:b0:847:70aa:9586 with SMTP id d2e1a72fcca58-847c5039b2dmr3974061b3a.16.1782985881965;
        Thu, 02 Jul 2026 02:51:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:47 +0530
Subject: [PATCH v5 05/11] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-5-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
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
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=2278;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hmVT5ofK8zwiQvsflk7zqxSXAxUYKjFkgql5IFtSC8w=;
 b=UUSxe3NJLLmIApgaXx5GkBeJaNMHr7bSNKM614yCy+C3BB9RFjpaBNAOSmXHLYDjG69ENhXdO
 JAbwv86STRHCcOZ70kNRZ5XKWhyNLI+BqvFRcgF4VJp7eKEawB5RW+D
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 61C9Uv2zN99DFTmqFIvw-SzmC7Ra9KFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfXz/bjXXP1Bs+p
 VDoC1e0zd4O20E2keaZJxm+hNZmBQNtlnxEXvO/xMYmAzEIZok244Z3tyycw1GmtXzp5BSXEOJu
 bsx9H4LFIZ9SOJ0K0W8a5nXSd+IkbHw=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46349b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX+kTyqMctrEJe
 Z2w7grXnprNtVnyJpp7iCc3iVoa5vgmePuDdQU5p/IQP2HyAYMkczKj1rsnl6PnPy87cVN6fn9k
 QnhQScRk/CyPvbxuzPB8D1Bx1Fl5PoUuDkA6x9ClOL9F7TL5PputJVdJrqy1fC2AC+JyXJklj3f
 wLEQLDdMjBixsjuBUcch0LKRTLTS4C641ak+M0mTbNghJwiTjk68DAta48P9w7qZm2dBv58zUXx
 aaBNAEz3zZb317920+aDwOj9GrsVuuB7jFibxoTkduv+CNyet9gBxrrX9Za/MVPtw2ekFtwPfzx
 1eNbWIbYgUoZwL1XHpTYkRVG2jy1vbirI/DjJvDs2MmAeR5XsRdAPwDqDnw+Zf6CHrWQ+/KeAH0
 DYP2HoRBAqt9jHMpeZ0Dp3NYYFcBlsYhOJD+j+m2y7CGCb4kuPpxbbLrWuoNVLeEA1MnFE+9f52
 +2yx8INzVMb/93BQCJA==
X-Proofpoint-ORIG-GUID: 61C9Uv2zN99DFTmqFIvw-SzmC7Ra9KFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115913-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B3296F6125

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 26ae21d4c7e3..53dddf35963e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -428,6 +428,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1


