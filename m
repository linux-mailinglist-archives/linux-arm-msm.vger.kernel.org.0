Return-Path: <linux-arm-msm+bounces-117164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S49SB7umTGqUngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:11:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A98FB718519
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LN1TpSZu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GFikHY0i;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94513300668A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898653BE161;
	Tue,  7 Jul 2026 07:11:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB03D1AB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:11:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408296; cv=none; b=pwtsF1asRC6Vhv78jKko+Ga/1QXM0XIigfyPHLQvn2SuQrberdfuNzMu/oWqvsVSwwC0vWVtRgGc9u7l8fFe0bJb68yQz4Z56tl34f6h4owdxKkN4Dy6XD/1Klz9xUYUPe8T0ulwCuzREQAJZ6V55S0D8qLE8YpE16R5pM9Mz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408296; c=relaxed/simple;
	bh=J4TrGqeN44TOb4ec4wQtPvf8uyhMxTqfZYt3hDJtfo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASoifV6w1ozMjJccKGqwrpvZ/1tqwfGjoZkjxmPp0ksKW59gvAHqwz/3QhquIUxiwYepQCRn97EWxxQzmx1e0tFMxpddod8YOMxjhgWj/X+eDJeJz3i/1/JHZpYhbHL6OXfUcSzfzfxj2CNLiQYYfMoOOb9XrFr9BGZWdB121bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LN1TpSZu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFikHY0i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748mqb2674815
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SRvVAg5G318Eu1Z/2eyFR+WqD+YWxRCLw0aTtlvTYY=; b=LN1TpSZuh62dfOI8
	tifID6jkrQxbt0qK04QmzxuapbZtm6TAZBamWcNeS2u8sQC9F3/HbWeuh5dVNexX
	SdOfW0gujO+bfrbrzBrZYE/bSQ/ZVZk4XAntEXw9ItfnDN5cu+JmNuS8oaaytxtY
	T+g3Z7E4Wf85dGvfM3CenBer94lGyNrt9LSQtMlmEpQPF+0kbuP8DW8MJ9Wii7wk
	Mde9fz8/2my1VPgARycNDPPysVj/T088g3zGq9xghGFKNn3tVrINT4ykgurR2ZND
	xM4Ax6EGhT4A+gu3ERv8YfdGfLdnLyuGceyD6400EYJ2NP+C5dmfrhgXTf2ZTT4/
	mirx4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj794xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:11:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so3961377a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408293; x=1784013093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SRvVAg5G318Eu1Z/2eyFR+WqD+YWxRCLw0aTtlvTYY=;
        b=GFikHY0irDq7JnvUJo3aaGSHZWorHcBOdnSmcsFTRZPlrIT611/wGs8WHIieq9+UDK
         qkdv6WKv0yynMyP+3XBuwk36ySKAKh2X3zHSM353xOk4HkEDRWxOwNBiBC8eiKFJKpXf
         r7MiyMSJpGRHcPE9Ok8aQ6ru/HVM85oQktm0zw98cZ7plq1UPDIwiDR4xY6XWQSdCpji
         A9QU56ac3Qw3+DPB6frOELnuWlT4e1/vCrGnsyWqJdT1H9uAe0jpY8KSVTScbMPyldrL
         zu7PP6UOVkgqKrvQNpqPaoNPd8v7QFsWvWqhvm2G3wWdPUYp7efZ7QOuS8K+Z9M3ZxKd
         QjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408293; x=1784013093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SRvVAg5G318Eu1Z/2eyFR+WqD+YWxRCLw0aTtlvTYY=;
        b=d3rYbfoUkekNq2/SrU5EOd45Wy1SquHuJq0NxRttWpti43DiEGV+bEhM9MXEWh12xG
         IkrOs9kbINHsJ4cFxvmU2XBESl0dAzQ4M8PpYuCQJupZ9S6s7qbC7Q+j5wr7HMekWoxa
         HSxyoq5jOcbHHVcgcs496VOQ8KbcEjcIl/LrDUhB/T5FrvMIXKdw8sm/YEAszPxscjGP
         DOwApbcw96godiaAuUKsgfjfGr62gnR45RPTtWCrGMvYKNr63JbML/8coFBBlv/JV9tL
         PhgBmLWoAoTWvb4wdlHaHPee8X3/eKuhKNwv+VrG86df32NAJa6iCKQeX/dSJg64csXJ
         hOBA==
X-Forwarded-Encrypted: i=1; AHgh+RoBdyGbV9qKp9glwC2qK5V/iW6HEBVW5Lg2EkUF6yK3M6m+vkU2MYLzHwJHWinvuF00iK5fdoMJjX1YX62g@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYM2CuapbCp30hcXqVfipKa8c2tU5FdjohdWGEUFSOEY555xi
	Kq/q6amEHQZkVOd/uV2fZHCVkeLJMJKVSZEdNTApJUkrwglrR9IivAmlD95FRJyoc5rcWCdXyLq
	SInG0MIDfDimpjIXaCBirLPNFpuJ0kE4JJGhx2nXqGmtpaaZzQYSE6PPGMwrSUbeEK3jcsyezpr
	Fa
X-Gm-Gg: AfdE7cleycBoaujI0Z+SyyAdTWCC5ixwzsVJtVHoc9T+TEehUo27R05evZucIBOLVJi
	3no0acidLelmYmOlDqD7znL/6UlDjSRrJnT3FLKTDe82p0Axx/E7FCvI+H8BPELVBzzmcCHjQ6H
	nJdIdgx3V4gNT8G79h+76oYTZE+PW60XXDb80t9n1+ywQYU2SkvrrTSMutCIqcRdZpIn7vU3ubh
	lkTMb1znZy/yaT/lWS49kN5ggSMDHNhML12zZypvB/igO2Vplruu1yoMnuIURMQa3SJZTF5E/I+
	wTU1xBMI8o1D9rHkPiCvOnOHGnrZ28mhOGzxdphm5MMtdUFzMzKjaNEs8U2XOr/1g/iYh7nrWDK
	0HJXVCHyrPFkFLlIHlyXTUZY4Qwmx8zgduzS0uM7X1NRF
X-Received: by 2002:a17:90b:58ec:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-387551915e0mr4090890a91.6.1783408292925;
        Tue, 07 Jul 2026 00:11:32 -0700 (PDT)
X-Received: by 2002:a17:90b:58ec:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-387551915e0mr4090862a91.6.1783408292445;
        Tue, 07 Jul 2026 00:11:32 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm587326a91.6.2026.07.07.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:32 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:41:13 +0530
Subject: [PATCH v9 2/2] arm64: dts: qcom: monaco: enable inline crypto
 engine for SDHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: MhaH9ZALWv-4nUOVSPcJtyRbmtcXsLNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX2OJBb0gaMbuD
 GMYQaSNBNgwwanMDXlca5i/6YK3alcrdP5ddfjhI/7Tgzxyu3sYh1GHxkW8Agefak7NB/iT6tq0
 0T27XT7TDoQa6Km90V+weoOQe82lAfshZ4nUQduNw484MNmbvBaEiUX7qVQKdlLdT/EKv95h8as
 u8cIVSP6i+r4RtKYCwS/0fK7ba7pALF7NC296ZWJRovIkqcdpG7ubEtVlyAV1bm4ATeulUFlErL
 dxlqSCbv/3KxaUS/2UTUgmdczi58ZfsSEhFBQq+0okhq1Wxif+8CIwevTKy2zfdtaAkVfKgCbfw
 JWf77aEJR3c+3ZVYZ1KAJP31lCiyVesYqG1sJOguWbiWOiDSr1Gx3a05E8EBiuq8IWknyEMdcNx
 7xMTMrsbTHEsBl/Lz5RDhUTxjkgRIlcBKqHNzvosJpjc8nPCshYLbsgMxvLxl5Tqw/zz22x7Vnq
 910v3MnY1cZv/tbm0Rw==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4ca6a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rb0cE9Z9KU8QXvGDuC8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX4CZVLKxCgZl5
 akONpaOAmeoFMZlIA0Xu+nrlkwQ5Q8DlRzk6nq1SXHY2LsYO6oid1Ug2i9hovloPtmRx9xJSLoR
 ozPSYy/ZrnoHze3bmGcs8U4HqF+/ht0=
X-Proofpoint-GUID: MhaH9ZALWv-4nUOVSPcJtyRbmtcXsLNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117164-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A98FB718519

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Add the dedicated ICE node for monaco and reference it from the SDHC
controller via qcom,ice.

Also, define power-domains and clocks properties similar to the UFS
node.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 400c75437978..ffb13d61ee36 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4864,6 +4864,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			supports-cqe;
 			dma-coherent;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -4896,6 +4898,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@87c8000 {
+			compatible = "qcom,qcs8300-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x087c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd RPMHPD_CX>;
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";

-- 
2.34.1


