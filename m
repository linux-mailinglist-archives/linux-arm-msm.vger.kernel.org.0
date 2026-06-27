Return-Path: <linux-arm-msm+bounces-114723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U22nJaqfP2qcVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:02:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10B6D1B41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:02:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KsBLfEFy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="O/RQ1WAl";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29DEF3011A6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8D039D6E5;
	Sat, 27 Jun 2026 10:02:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAF39E6FD
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554528; cv=none; b=T623NAnm+NC5FDsolsXHsMDJApd1OPPjNWFqVjRGWIM3uMk/+rWWTco/hkUSenwvwRpVymSp3cMRVskaGldTnJ+CPONfEbrQwTU1XkvYwQil6HspoeqeBTKE3M+GjE2s42frKQmOYijyXmo/BN7waOHG01HkXimboDupTLoOYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554528; c=relaxed/simple;
	bh=8/1IuqBe4X7zrf2GRbXPv19z3hY0arsbmbe0f0rQT1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6FRKpPiXA2Zg6eofYkfEZDSSu/Bgjjh9elOpfXaYfDPXbw32M9biIK8TCQNYEPnRZB4sHPfT1UWy25fui0QAv5RCupV56KTimlnTShsxNYiIG+AfElYoTU9x0eu5fTbtvVMiMSBtrDpkENj3lVoVsRAh2swEBHyMF/e+GhWRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsBLfEFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/RQ1WAl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZZa0720530
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+jsm1R9qsLDeP+vmyatEqU6qZ9XNXrO12lpSjitEDU=; b=KsBLfEFyy5e6wFSF
	Vh0tAtgRdWJRaGtSu6OMOv82xwd9EbFPbaKQasUXygzJffatLtJ7YAXiCwHtWj7M
	YymLGQsuaSeszMH5OcRkQaWyIErN+6YfDSymWjCQ7Owks6+JRNPvnUvpcYWIy+Bm
	X0oxdDiA02ABN6xGTUyPWhcaOmCGHHgy8O5stwfKGWBstpxwJQFQQqrlRJRI5CE0
	igcEf4T86g4N4W4e5QO6MrrlyzQdO0XnAKThpcx3NVb8LoK9kjU5cZZsWJbQhZiy
	eUd0fivAY7xvSzKGjfMEMaLhyrLbJBRqdQ5BvF5NHH618QX+CKX+Ufe17MYYk3xN
	Jgo51Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf0frp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b74d67e0so5978437c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554525; x=1783159325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+jsm1R9qsLDeP+vmyatEqU6qZ9XNXrO12lpSjitEDU=;
        b=O/RQ1WAlXzHWLW0Pgp/n2jK9ztfLp1NaUuH6Hi0QKa10ZX/S1DArglo8LTLeSeaR3L
         4vP1i40Rvtq6SUtDltaiqw7N3Zac7xRPmlcBKfLo1IakVVq2S8j+c7o/ImprUOLkZzPE
         7ffSRR1Pl3enuk2rxcNJ/RZx7vgf2dMZ1s6jZexDwz7F/cu6AuSPLrfASPg8D9BnSIX1
         jib1R+YVOyBMC0qlpKSY5CIZtoZKUAJLsJjNsOELbbT+b4aGWI5mJuPn8WDlw/aQBguf
         MEockAY+mvFk+M+7pD23Et7IhIYF0p+EwcWTZTKBT3srML6lLXnn5UAx/nzqkiL/eiQd
         O+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554525; x=1783159325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+jsm1R9qsLDeP+vmyatEqU6qZ9XNXrO12lpSjitEDU=;
        b=TulK8TCAKPjTGsaOop8lj5tbv9qvnJbaAOMQYan4QFY/1K4g93vIzmKOIn1CiVnRod
         atXuOLXzXDQ+/tdpEVxobY5MuOtyuyq7eQN/SnHP3fhTNJm7Nkt0mGyasTuD+mUC4350
         IvOv9VPTrgC11ElrePwm2BpZWqq0WGaMmoDWlgEd6XAGWkdDi6/Lg6Hz9cU7FaVolupt
         oMzRgElxbIzXGLddRlEEbKoy9wh01Queyhq+BzrPh8dyvWMLI/QcJpxoXRYlLgjEznSq
         MmW62OvK4j99XIt/dH0XkFTvfpMbc0RWXWeczkqpVhXOEArRrw6ry3mk/0jlTFAH+R8E
         Q3mA==
X-Gm-Message-State: AOJu0YwBmMPYm72jucYvGl5k0D4vnn5sA2nX6ngaI/zrTK1XKWOgzBLe
	SM1pNnBPdLC+Y4D4Zi8HefRb/8slskNENHlGsy23mMwElmCbUbjti6CNaevCV0dqmSFK85d6fD8
	ON/crAUbqkAvh3/E0mA66cjWnUHv8PcM4KrIN7tcAVXgxBxxmM0Hz6Y+AMs9qYaJP+yZb
X-Gm-Gg: AfdE7cmX7MC5Ej0XIpZXbQubRv7vioRh6DmYst7WC4qMPjx9To98AgJjQY4NX9W2uD1
	2Wz1d5dEiMHK6QI9Hf7StmSuQsAdo4lCwoyfYQWSYCauldtBfvZPA+AmKKQQxzrBsMgmUz5EE2p
	T9Fe/MIoRXI0HHGgSs+drFCu0fAGlGxP+6/ppXD8ARqK1n4EwYiAWRrQBMWcBLy8uLthhPx3Iz4
	7PNpkueRaOVNvDrB4tBMV/uub+HfvvtskyNwQnKBv2dy55UTD9/rtkLnK9O0Nt4quoAvjuQpmWa
	mlEJDhyqnDdSlXL2HowT0Vz/7qc1X7Ni9n1Sil3ErlHweR48QTte/tkNDaXYDoD8DmCq7cLVhr5
	+LhIpAf9n3tDtQJw66GHM6WvPVo9svuzf6/gOaQ==
X-Received: by 2002:a05:7022:6b9d:b0:12d:de3e:86a8 with SMTP id a92af1059eb24-139eb5253acmr2938514c88.38.1782554524555;
        Sat, 27 Jun 2026 03:02:04 -0700 (PDT)
X-Received: by 2002:a05:7022:6b9d:b0:12d:de3e:86a8 with SMTP id a92af1059eb24-139eb5253acmr2938500c88.38.1782554524022;
        Sat, 27 Jun 2026 03:02:04 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:35 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=6760;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=8/1IuqBe4X7zrf2GRbXPv19z3hY0arsbmbe0f0rQT1o=;
 b=oy8zDPdC8RkOvf3C94UuXn1Otgt8zcmzA08VL2Aw6Wbkb02bm9FEkyi4GdR+CCcxhfOHTJBxe
 c5M/zrFl/H/CGth1z+JFtVJZXUfMguhqygZNqQ554c0HYVsH4WdD8Wa
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX6AORrSByWG7u
 ESbytFZNKDw/3w27z9/oViHgnMQn/020GJUEqL2W4OF/9vk99rZyc9MGyLnjOs+buDYutFJ5r33
 Lod79yPoCH6ZqNdfiS6+c7G51idHagc=
X-Proofpoint-GUID: vXKD-53hccGjndQLrURvBt6us9CYdfS-
X-Proofpoint-ORIG-GUID: vXKD-53hccGjndQLrURvBt6us9CYdfS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXwNhrIYgF3Biv
 4clMikA48afxzBWJyzvEGB3vVjl+OovyopbSoxE68Luoy/mNqu9ohd/XE7lfI+V+gKr4nSORtSc
 oX5/YWT72HsxLi33gGsH2e6Ot6IRPmkz6k7duUTNdbSILI+1Fnuwq3S9pYTRdl7r1bM16On1deS
 EJLdRIqZ4a6LapqsdzGs8wogwvEXI/b5/aaAjjH2/wcD9WzoJrANEJMWeohRdMNWuqMzhFRFP8p
 YJIkILvhNzZX4A/Bk9Z6pyCAoTqbWsDA4KV2mOYIBigtXBKC3a/luxZ5Jef8fl1+ECXBygG0ALz
 UJwp68/GUrdvPlRhPRmvs2e5hiLSK7XsI4i0iQbYHQ/Ky8oitxC0JqBEHj9RmjHWtGLADjT2FIo
 OpJ1E4HTFP+htihAeOt7opBFy5ezt7gvDqO08liVkS3b9RCxq9D8aGbcXotukwD6F2X0hrlq4Ck
 rZ24wWBNRNeljv9iw8Q==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a3f9f9d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9ZUqVEILTzBR0fHAzoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D10B6D1B41

Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
DPU display controller, DSI host controller, and 14nm DSI PHY.

Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..3c8eda0a518b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
@@ -1990,6 +1991,204 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@5e00000 {
+			compatible = "qcom,shikra-mdss", "qcom,qcm2290-mdss";
+			reg = <0x0 0x05e00000 0x0 0x1000>;
+			reg-names = "mdss";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x2>;
+			interconnects = <&mmrt_virt MASTER_MDP_PORT0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &config_noc SLAVE_DISPLAY_CFG RPM_ALWAYS_TAG>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@5e01000 {
+				compatible = "qcom,shikra-dpu", "qcom,qcm2290-dpu";
+				reg = <0x0 0x05e01000 0x0 0x8f000>,
+				      <0x0 0x05eb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "core",
+					      "lut",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@5e94000 {
+				compatible = "qcom,shikra-dsi-ctrl",
+					     "qcom,qcm2290-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x05e94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-2290";
+				reg = <0x0 0x05e94400 0x0 0x100>,
+				      <0x0 0x05e94500 0x0 0x300>,
+				      <0x0 0x05e94800 0x0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref";
+
+				power-domains = <&rpmpd QCM2290_VDDMX>;
+				required-opps = <&rpmpd_opp_nom>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;
@@ -1997,8 +2196,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <&sleep_clk>;

-- 
2.34.1


