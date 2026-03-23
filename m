Return-Path: <linux-arm-msm+bounces-99145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIFaH9MGwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:24:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6242EEFFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2406302D958
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84E8387341;
	Mon, 23 Mar 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4KqKWT6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/4bxm29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6242386C2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257548; cv=none; b=esW5nedkSMqqhLVNAVMS42bcY85SpbBa9r4/jzxPCg8vIw5MrCOsEKSsALIK4KQjiUkPiKzmbyBPCYZgkf1RwPSEp/8MfN2qPp0tQJ4Z8HuRaTB5I3KFFuhUfl1tTONBnOjRR8FYxtV2DAgHO2ENIuk7ypLiFzhGZp8aE7WT6Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257548; c=relaxed/simple;
	bh=EwhmDrGZNvqtgUBvADKeZk3zEc+b1+NVILPNP1cvda4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTIafJdlgV9XtI83YUh50CApZcPcyVsTLZu+oDaoQVa86ldW3JjR7mq6sBLTusuTRDFoxKV1YFTaFxrH5Jb7KpkIqsY03P+tZHKYPkTogjCQUdApvQMt665wXFd9HA8D9dkN890jBrP3vRx5+wq64/lCGNN2PUV6p2PhHmB5sXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4KqKWT6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/4bxm29; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7JuJK443182
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3Bop3RZU7UVuQL/J9eof3yYKpMt9O43PmyrVI9D8cM=; b=V4KqKWT62WjO81B6
	xG6aE7zIzb6QzafsgDa6PaOTLYH7KwAJUb9fAlL89r83lmnqM8LgXqRfFq40eqew
	7OQOF9ukcTPgjkaDucxQauTCjkQzWzHvHf/dZ1rzje7Unpns3pJ6BzTl3lE/TaxP
	ae8Z0tPRayUHpUKiQpXhkWok2i8LTGgUfL+hla/zg5iNTgTW2OaZG+fO/cbhze25
	8ALxip4erGdaDr6SvENZYy3RL+TzmpRRPcxF9p9zHUTcAOMdmeEhWLyj2311P5nr
	Tb+n3uuCljmS0ZWRsdKLn8au1EsA3d6mPWHTc/nTuUtZxgUkiSeF5Om58oFLmXDO
	C4ttaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4t8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:19:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359812e4fefso4029429a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257546; x=1774862346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3Bop3RZU7UVuQL/J9eof3yYKpMt9O43PmyrVI9D8cM=;
        b=Q/4bxm297IpKukc68kSSmewZ+MHpQ34nKuATDvDqjIw2tm6AvOqQ6DUYRmX4eIUZ9Y
         lujbr/VX2ajQzRZQvmHySmxtHes51OxRvEnf8DZTrCORVB9Ni5Ubm3rZOY8L1TgMLKwp
         RmtzogORV+1qwHasjwBbb8mb73GjZmdfCBQnVRQlKa1yZ+BzXwKVWLy62CKglJhTx3Kq
         w5it9EKQhuUUyqYyG+qauffcnhQJOLpbyiO+UZfsMSPHQHqc6H9IozhBBitkGdfYOp15
         /GbXw6RWVExAgbyo3JeOWq/fGwvkr09oR2zbsaiFbdJjQ2YaH5DI4IyJBmTu+5oIn+9r
         AJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257546; x=1774862346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o3Bop3RZU7UVuQL/J9eof3yYKpMt9O43PmyrVI9D8cM=;
        b=EhE/nQz1kyGnZiF/di4LId8SHUK7D17IUx37j8Y7fbmge+7fBWOi4AQ2EQMzSf2PQ3
         4JzPuPS6aLr6/pvzqadUyo5OWbixoMRzjLWzJsWYyKxX7+gXTouZxcYBtUP1+6KoMSUF
         e/TQMIWXXz4eoVDO9UUn41WDWxcSF5TOqoIJQdABRWGtJIEm8vKp3mLmgzdKNf1p8tjQ
         1G+KXyCNcNe5C5lCHf7ETwJpD1AAgMh26BCV6bdv8/vQDYwQ3uxhvozCfml55YurVbnd
         /XBeTaY5Jnsu6ZYrVpbsOPkZz+W1n/XtYJRWy81lAAAQSxtsjGir+Eb3wU19fe2EDJiH
         nUEw==
X-Forwarded-Encrypted: i=1; AJvYcCWH4Nr2ClWI1k6BKOdw3wC9imb0Y5ifGzdUp9A8uWj3kmdSbwRGL18NaQ+eCHfXxnJp1TwliQG6UdUwNO3S@vger.kernel.org
X-Gm-Message-State: AOJu0YzEaXZrQ8eoQ/Hi4BeMX8eWC+n49jrTDp3TspUEHfMZXjd78+27
	u14xQWhfLCaK3wfHd6RZ/M3cnDSFGi34MXzXZ2V2gTJlQAOJp9DZRkwKoE+Ob8X9qtx9vB6SKYM
	qsmh2WgLXMNRLdAjerYnA5GlH0Iw7m99aKyUn6xIzkXoIwnRzDTLsWg39rjAe2Tw5Bss3
X-Gm-Gg: ATEYQzzldXCEPpSrA40tT8CL6Y/hMKR7a4b5udFkjwC0bKrP349j+f8jgVO16k1uE9S
	Z9D4LnXw2b8p+wRnL1lDlCL3jHEgIwt41gOTHChabG7EeosvtDzlhXq9gaDCtaG6SKlAvfdU1TK
	hcgnTRDts3uD+4G9kfw2KmqNjM33L5Q9uPTGhvXBkru0AAZBnPIxMQW8HZ4sP1dcKhf1vwlsk1U
	kwX6MZWgQmZm+ZpcL/JLfPytGlAw87WF21tdy7u2so3T/WTvNxioFnekd0UOXbnNTGdUPsRFEqB
	YadWOufG9FD46fKhgHXbQZ1Ngu8ukP7HhlaYuK+PdUEuaBZFF6/k8q/BmhEhtf3j3EKCuh13T7F
	RQb/k+RSrmMyTsq/pV0zpldGzIBenJmqfUjGWP3bUo5dapxE=
X-Received: by 2002:a17:90b:2e07:b0:35b:a0f0:8327 with SMTP id 98e67ed59e1d1-35bd2719d1emr8246531a91.2.1774257546302;
        Mon, 23 Mar 2026 02:19:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2e07:b0:35b:a0f0:8327 with SMTP id 98e67ed59e1d1-35bd2719d1emr8246504a91.2.1774257545762;
        Mon, 23 Mar 2026 02:19:05 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:05 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:59 +0530
Subject: [PATCH v4 06/11] arm64: dts: qcom: sc7180: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-6-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1472;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=EwhmDrGZNvqtgUBvADKeZk3zEc+b1+NVILPNP1cvda4=;
 b=vT2/ftKHtEaH7CUVN4lWEQEvuEdYuuSb85FTBKC/vZ/b9t9mf1oHpDvFgKk0blZK/KoN8A6oW
 a+0dbhGyUiCCkCL31W+BaHE6h1JgfLujox9nBV7lg+XBhItpQx4z9Wf
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: n-ZSPeG96H6yR0Fkem0RXJBSOmP4pw28
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c1058b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX1Bu5p0SaYlpa
 qOfBQU3dIQu8/99ZaFh5Q+ThsEvqZtblzklWmiFCQR2ha9rC3PXtH1B5TlK8C0sNZL7iAtPX+/C
 nxZvss5CUhXH9UP3k2okQGTaXHaNAdaBrkjz62arpFltCzNuy+Y4M5WcFusRfJmTNeuRfg/vpX5
 LXR85hPpaZHIztWjO663JN/u7tVwPtcigApTMuA5QrI04/w1OvX6I0Z8GkHaxgLcG61Lkn5MU5a
 FgHFq5tJ+eYmefDuXd7MKqQ+8lJIf1OL76cJb6KSgit2u8DD6LcLT3YjYzfuWnDB5s6VqF2TwFH
 aelF38bt10x73qXCb0yKcqG5z/TAGZg5xOy9Rxf0tvbU1COozvlduq90JEx0YASUDJTMKBs5S0i
 aeStxNtE+ECv4jx25qDP+0SWHbONJru4Uu63NZpdoT2XmFoixwFuFEMq5/E6kkkCwdNU+IoDlDC
 U4n85eXw1af4aT+bztw==
X-Proofpoint-GUID: n-ZSPeG96H6yR0Fkem0RXJBSOmP4pw28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99145-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1e40000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d90000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: ED6242EEFFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sc7180.

Fixes: 858536d9dc946 ("arm64: dts: qcom: sc7180: Add UFS nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8d69225a4271..9eaee5dc824c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1605,7 +1605,11 @@ ice: crypto@1d90000 {
 			compatible = "qcom,sc7180-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d90000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		ipa: ipa@1e40000 {

-- 
2.34.1


