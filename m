Return-Path: <linux-arm-msm+bounces-113826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dD9fKfYQNWo/mgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 11:50:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229B6A50AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 11:50:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PG37/ZEv";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jKkBVGNr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C94D303EC09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 09:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1A8365A02;
	Fri, 19 Jun 2026 09:50:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7253331A76
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 09:50:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862631; cv=none; b=qTykVn3iGheEu+oxPCu8lft14eCNoR+UUriewpSCvR4VvMKAq4F5hL5aljALRTkvjIFTQdd8XQbWIzfzfiRLrwcVPb+t5hr/wCrzXDQ4YRYjDAB4RXgE3H2oDZLOA/9Wh61ic08uFQpaHIV6FE3m74uT2cfScNWq3N34620EGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862631; c=relaxed/simple;
	bh=T+uKpBm6Lhim3Jf3vS23fgw7smb6MZF63zyhIlgxM3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jIjsGTZatMSWOioM0NxfNcQEuvsbvouu5IMT8VXlD3HmN79ynsZWI36l11iAmR6N30BnqyfSMebOsXM83FHw4lnVmaKonUxXBZ+lUjKT1JnlAOFpRJfHvngTN4u0Kkym5cRouQC1/YF/ZfNDBVya4ce8HborHU/We4DcKrmN2JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PG37/ZEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKkBVGNr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7QHXj4185261
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 09:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XkcwAOf1ZNNGk7R3X50Mhi
	hR6h47SAlzpuY55G1Hpag=; b=PG37/ZEvTNaRvKijCNr8i09l1hLs4GjZ3Soa02
	5y+4ivaBF1foqrEG3U2cvlaXXzkCr4O+h3cd8HekQ3C2Mp1he+Qc1u3VI5gYMQb7
	seutlG2CHJLLeHNurYKv+D0qZ9X+ma3gq1VGFZn1HHkqxaEQ1HeCQGJRAj9gkoWA
	UHaszO0G/njhpN3UsZmqY3FzaDAHjn/AZJL1BUlS9qd1PDn9xHYUJNduveA03s2F
	DA5nqE+VZc6OST9vW38dSlaH1apzR4n+P7FWVh4pHPDcs0vVzSv4w+PQYeu105ag
	m5/i7zP+JCU+aNn7A64zqc0NYH8D7ZDhMtMcS/ZdzHG/GjYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6satp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 09:50:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2b64850easo40855665ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781862628; x=1782467428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkcwAOf1ZNNGk7R3X50MhihR6h47SAlzpuY55G1Hpag=;
        b=jKkBVGNrz0CNNeCb20FLwh/QLPLNzjIHBArcyZ3LpRpOLEPukE1wzRTZ5+2P58EUkU
         atUz5zicxGM2/Yg8FTRtv6zRRmYBnpBRdjumpixNIG6q1chSCKVrA/eDjxTOdokze9z6
         u+ezlgtG64MWEODntyUE1j9mARuTmxKq4fRQBfmaAfb95SYjFiiouhaZCFRohnUgl9Gk
         H0SiC9GiPC/Zx6paNIkXu4rPeyDjqvJTRUaQ5whhTVW4OQInm2nAZs6b8H4CCZiiFuIj
         3IbiNZeVMrba4Bi/2Wh5j1EVrcuKviyvcDC55yvvwNlpJcSpWCuFhqTGwuq6mA6PHASH
         XKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781862628; x=1782467428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkcwAOf1ZNNGk7R3X50MhihR6h47SAlzpuY55G1Hpag=;
        b=flyDPoNJ/ppTo0VDdijV4s4g3ud/LnPEhL6wmB7omeq6+vSLrnqWfSAALb1qgesboU
         hM3Zh5UNtZ6utIK/Z9pa3qrxQOgCwsIFt/rb0iXAbQAWaOkANj0nBxIFAajsMidkipbE
         qzsNbQpLfJ44ZsLoCRMNRI/FMqT0xYoGDaqUNI4R10NKqRncFSHyESsZCBETkvAhJY4+
         jT80IDyka5deGVtnPh8NMDdcu0mVDtQJ4z4ZHSfzUbZUgzg81pEcx32O6o5L+fLSvEq/
         Kc5U3yM1huRtA7TQr3FzhKEkeZZgjcIBu4r/f6nCaU5QF6F/4YT2UMIlSOfLHMwUWnMY
         HZ9g==
X-Forwarded-Encrypted: i=1; AFNElJ/bKt4+2posS5jWEfHVLLsfg43ny96CDqKcK+eg4/ZJglIzJytUAceIxhyGH2BGxTDVugK2GnGHnHqw1951@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CpnBJcXVk1d/DFeC7s0HjP6Tk9hZ+0k23aeAr/8mKs0WaXqx
	ZUsj1ZupjokQNMG1Bs91F5wFVZYUsTt/J3KjiUPDsdf3l7AsmMV0FqhU2jrlneQJ/77CxTnc+m2
	oy6hKD5vNPkCRK0wdO0/R4ff822ipOkujEao6pIbwSQnSKgWnpDcDiVjoIfOUJ3c3MADt
X-Gm-Gg: AfdE7clpH3h340AyDPOi/wTC0H45zzoPNdfckyEzs+vip7jvFIguEpLVtrYj2+DAj5W
	KXeelVlSbqNxnzA3q4SoW6uq3UtSUOjKcViGUuYf2I1tAYeEcebQPM8giwKs+9xL94zZRA0I8i0
	HznOpMEyevAX+N5JwtelPFfhq8pY+r6LoK1ylUQZYO/47zWYzSsjxbetOX4NT6Qrk3RqhuhvTdy
	NT5njy57TQQUGUjU4wpHMcJYNj/yfxQm/vQ6ZVK27zkm52soj3OB/Q1A6BeO/Dkg4UKHqWybb4S
	5Pkw5Y8um1kyw6bLPLBJh7uS0lL7E3+XMK0NiZ30xjohguM4I3xAnzaOkLXbNXegK58wEHPgngR
	CluFThHO7Myfp0w0ZyU96m7tzX8DI6soNs+sPsBHXeNrn
X-Received: by 2002:a17:903:38cc:b0:2c0:c4c9:4cb with SMTP id d9443c01a7336-2c718ca5cbfmr32878215ad.14.1781862627721;
        Fri, 19 Jun 2026 02:50:27 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2c0:c4c9:4cb with SMTP id d9443c01a7336-2c718ca5cbfmr32877815ad.14.1781862627312;
        Fri, 19 Jun 2026 02:50:27 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bd3ddsm18193975ad.38.2026.06.19.02.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:50:26 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:20:08 +0530
Subject: [PATCH] arm64: dts: qcom: sm8250: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM8QNWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3eJcCyNTA93E0pTMfF1jC4MUYxOjZBOL5CQloJaCotS0zAqwcdG
 xtbUAzNYrQV4AAAA=
X-Change-ID: 20260617-sm8250-audio-380d342c48cb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781862623; l=1782;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=T+uKpBm6Lhim3Jf3vS23fgw7smb6MZF63zyhIlgxM3U=;
 b=En4MTb8L6o+yEP26qNmHzGnL8Sk+KF8LMbRzpzqILvytSON4xcFSoBFevIjmtJ107EK8i6keg
 qz7fZOszx3kCNcCryaH0WgVEurRXVhWkQSykaUlUzMhOfzd6xW6I5d7
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: Vjt1fCGPtqyXf4iaq4S8K1ud_VPk6sZi
X-Proofpoint-ORIG-GUID: Vjt1fCGPtqyXf4iaq4S8K1ud_VPk6sZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5MSBTYWx0ZWRfX05660ZWOSu/L
 70KJnm0M7qeUzNaw6p1VKx8wRTrjHTQIWxukm3gZMaNPtO6dEk34/f6a8swD/ofqZ3tSzo0KJ7q
 o1F1Xnw3ut8kTW/L4XWhgwXoVnMgBbIxPZHnM9wDHtuadxh3oXnT8+8Qrl+0wekIvByjJcsDc4k
 8GpGTjAMMvnUNd6IAaGBCVHlxQ/GSiQd336roUBp5JoEIePN6Q4m6jVhL7OKv8B5ZZAV6266FWM
 UZw9QTYubTcBzyS0nUhsmcV6QTrKvx580tcufklseQozw9+rzSFfEWh98+Gorvpue3VUmOsdyBk
 z0DBcQX67ibrPlpl7KVohdn+8c8L+5he0yJjngtA8ZWvdV3hu10fXtvheCA2xQeUJeFd/aghhsO
 oouv1hi44Y8czCNvnUmjT54hv6vAqiN+PpISA1oosr533SAJG9fqNzz9/9LTDlun4Z8Yvi/IszD
 unUAmy2wgfSt7Sv2/Eg==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a3510e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5MSBTYWx0ZWRfXzCvQnu/pnUVH
 HMheYDfgNzR+0f9KE+hmN4lCbw2dd9h1UZbEYlaFReou2Qh5mqPPUX6O2PA3b7RslZ15bPBw4k6
 fxLEDtUFA5GDC+XMLV+A1F6WHom4syE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113826-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0229B6A50AA

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..3f2f1b644db9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
@@ -863,6 +864,14 @@ cdsp_secure_heap: memory@8bf00000 {
 			reg = <0x0 0x8bf00000 0x0 0x4600000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smem {
@@ -6077,6 +6086,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-sm8250-audio-380d342c48cb

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>


