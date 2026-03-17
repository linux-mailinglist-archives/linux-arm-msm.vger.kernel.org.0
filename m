Return-Path: <linux-arm-msm+bounces-98115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPUyOegfuWmergEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:33:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB32A6D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A185F3075966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B43138C428;
	Tue, 17 Mar 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCpp14aP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkHXRT8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D03612D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739303; cv=none; b=L6XcvR4+LEs8mS8nWrIGbjrXphiCUycJMMSG1PWt/uysDjudCyeKpEayG61x3gfUFYQ77wiR9LkeTRQ1+VgscCNWAr9XUvV32Wdj8OS0zfj1aGfgAtIKxnZ+v+m1avrDyzGgKL/Sl9IjXwLQudOleL11rerUkTH78Xyrg0xandw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739303; c=relaxed/simple;
	bh=h4RpmgObOzRNkVSgccxhU+fMFg+bHom6DsbHl34Ky1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdlDIqirk4Bxmoy5N/CZNlsX5sO3JbsMsjo19h1zHhK+2Qn7nSOuRd+DNmX9mE8gYtO+RfKghIiY86X4dB3Vo0ZhIdbCkbput0k3YqIpOMP+CiLOVwlofSjcpOkd0SbCFutDyr6+3m48m+IhEKefNZ6TJLRVBijJm29DZYV2BPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCpp14aP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QkHXRT8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2ZO3P4022797
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOrKK9iw7hnO0EM5jUF4TlMhkVqT4sv/sqyiQLLaVeA=; b=WCpp14aPex3IvYtw
	aYSI/WlBmex7QIORRUHQsERmLspX2uDSDaS/7ylOK/uWXw0ftl24cR91z01HKXq3
	AXorl/TNgTV9dwVEAGsa/qaWAFPokX8BCIe38ImgwMNsU3qqWbBAsYGSXcXFkEfb
	9+EwpDNOiovjXraHXCCaClSJDKJsfF5q/4ehBgfg4+JZBHuLHGnYkZN5dFkHT++3
	AnCkNVlCgEVmReOCvsQw1chDQeN2wKZIa4WlHHoZfYJW6oBgy+7MUmXj2Zglu/LP
	ySqe8gpQ8LckZOHPuuOt34qCZAtgFZwh+N83ZqBlpJkM7Lcup72prl/DZnjxXOTX
	QJkcew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fk2g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a0998a441so34992274a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739300; x=1774344100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOrKK9iw7hnO0EM5jUF4TlMhkVqT4sv/sqyiQLLaVeA=;
        b=QkHXRT8p22nAJ0HleiZlcYBa9pPqVAXc/VXVgDLjSeCcfa1pOT+IEYx3q3qzOuTwnF
         BYW9loaLvcdkcYYBMPYHTdRlxFH+bVnUQdtPt/bucs8YjEd2l+OI7+gD0oklUNw6XEsa
         sPKgkPfdFglpMgfhkFDKlnsqke31AHSnqjawKrBoxn7QMD/IJWb1AiuThUOntXQyf7Wu
         wAObeC8ddPHTBYfjP4bS5NKKR9AJAitzw8Jbpt/WR4wKLtskdpftVIzzXEghxlqOLxDo
         dbUMmBG94x3k9JL4jSX326GlopyUy9qXA3OdQwOpCzZ/KChvHmBu647Y0dnzV9E68sna
         Dg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739300; x=1774344100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fOrKK9iw7hnO0EM5jUF4TlMhkVqT4sv/sqyiQLLaVeA=;
        b=Zz50lgbHzII4PP9PJNbEyIPCeqXQi1cipXxVUDJl1vlmLScZ2BUPIyr/GuByzi4iiq
         H0HwT6lLCO3RUU/OgvmtAYPwHxGEzpr4F6YICE5m0E4M5akizY5KwsMPKRnIpNavR87I
         YQ8bVzsxLNy6gf4prNthhuQdk1X8js3scsO25M7P3FSSElgt2OZmunzwdOEfOoRirT1K
         mXQ2s+eLtnVSIf1+AXCFSN4bXxFu4GhUS7JF8HbPH6tO5H/8HpgKNh9Tsjj8s/lWSnSP
         R76WS7TSlOFWoaMh+nPMJNxarSlpt8qS7008ler6ZKjMPKJ10JbuI9UZ5KDh4brFET3P
         SPKg==
X-Forwarded-Encrypted: i=1; AJvYcCXYRFzc6fUTaXZekhm9ilo65mWIeMMH8xpEczzMoU4kE26f9KLdHSjKmIXpBwT8is2TlKFLsHyi9802QVF4@vger.kernel.org
X-Gm-Message-State: AOJu0YzeCb1Tg1RnRTJVkKZF7GoW135c3ZweXo29J3rJNLlHTSEzI4/m
	lwWMnL2/au+Whjqr6sX97QNX2iqi5Z32zoDgpFXC/aM0Q5NqprJvcIt1je9jRmQgjtAStMpwlRA
	3xZuxEvJOrwyPvByDQRFR4x1eY7oWKtIW+9knA2QZvhFCuLbR+k1GfOFbQ3Vk++LhmQOp
X-Gm-Gg: ATEYQzzUgGn7Z+nyUls7dnfMDBV9I6EufmKqmacJS/R9n+9gXUrg0dBdhcx735549cd
	6aD/mRfdd9/kEgtr8cVR3YDsFt3XdKuFPYJ6lvYv7+ZPqnxiYVIENW5YeqgvJ2fIg9WPdh1OkXo
	teCa6q5LX6ZSFlfI85pZVj76DwVCI2tvj96SdktkQ4SuQ/PO6Hh3I3f+4h+6MYwqjYvkiDQyAo7
	0jXwh11X4OkafG5tH9SPlkst5BFE8ydrrAh3ls0oRnM5yZ5nYgi9tEGJM+X26lG/DJIDvI/XYSs
	BqYraIxkNNwZ8rwTFeBhCD6DiCinvX1aBuoZxYRC7SAfBM9tnOmhuXcDv45Y288KUGqPmxf5HM9
	fw2OHkzBrAVNgqTgPLbWPn+xtQ+qG/QTGsL9VAjsVVAyTn9s=
X-Received: by 2002:a17:90a:d883:b0:356:1db4:8fe5 with SMTP id 98e67ed59e1d1-35a22081da2mr14820497a91.29.1773739299822;
        Tue, 17 Mar 2026 02:21:39 -0700 (PDT)
X-Received: by 2002:a17:90a:d883:b0:356:1db4:8fe5 with SMTP id 98e67ed59e1d1-35a22081da2mr14820446a91.29.1773739299228;
        Tue, 17 Mar 2026 02:21:39 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:21:38 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:42 +0530
Subject: [PATCH v3 03/12] arm64: dts: qcom: kaanapali: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-3-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1406;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=h4RpmgObOzRNkVSgccxhU+fMFg+bHom6DsbHl34Ky1E=;
 b=dtCs/OirE2kPvaV+8TmLiJczC0sVB5u789ja7Dp9pUVBiJTkcFAv3iUdaSbJCWBPdm2ielOlH
 Zp4PTiH6XPVBdftzBOPsDRT9uUnR7uRqfxlmNehVMJ8RPncljf2uf0Z
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b91d24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GgkDlbKJ0zUsmDFvAdrxA-FfF1jgKJvE
X-Proofpoint-ORIG-GUID: GgkDlbKJ0zUsmDFvAdrxA-FfF1jgKJvE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX6bSwFJdk5irn
 3SFzwBPBXqI3Aa41qr7pgbzRaUB+MPGUk2FqktSOJk5hHhYDZsvBNmyDiX8CQtvKx2rrENG8Y3O
 N9rZP7E2XVwUbG/neCFxF54rLsrrf6x0y/Kyzhuzcri2ZIi8Q+6gqFhsLoq3ncPR/8WRDSHVxyN
 rPdRJfMVaqu+HKsBXcpn+va8p2jKxNtjkQXbAQdTbu/2K5vfPA9XkVdhX0K+MEjrF0m02TtJ4hA
 z30N7b6hqBBomzozdaK7qAuGTPuvBepitYdFDgJXWWs4OhnvbMrfjc3eBA4qGaQ6SzzUeL5baIW
 HomFs8wHFckTxhxCsN3F5xdfZCehSJnQVlB987Hjk9uIhwEWvGOJg2Arp77fLtFE0qvBsc0jGa/
 Ki2M7nVtbx19l0PpYV8GAKSl5zk109GML3V0CGQRnplb5goAmeppDbyTPJf5V+vzqOvi7b0pV1h
 oleAjCehH1oGunphFoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98115-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10FB32A6D7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
kaanapali.

Fixes: 2eeb5767d53f4 ("arm64: dts: qcom: Introduce Kaanapali SoC")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..52af56e09168 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -868,7 +868,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


