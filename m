Return-Path: <linux-arm-msm+bounces-99142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EioBqgGwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 947062EEFD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CE73306CF55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E25B386548;
	Mon, 23 Mar 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7LREpL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrYEiMoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63225386564
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257521; cv=none; b=jRtm4L8kqD2IIhCRERsheGxCGWZ0L3hgulNdSN+eptTzrNY3Ts8WKvvidVYaswU8xJ5NZIZ7gNXN2fJvcz0QPal+p8oH++99ISLjfAvi1LGtwVF93IFrIz301jo6eXBHeISh0cIJLL2gfLTM3d706CQZmGUM9VXf5x7gAZ0/bc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257521; c=relaxed/simple;
	bh=Ua9PTxyD06FOiJfwJksvZzTwKT5wpUwMmmC6XVvXSlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdLqonGFA3lM27oZ4s0p/Hc17KJBKl5Bhryxp9DePaESSc06TXT13c+XeGcliyDme3NY3Jh27W7uqjyKZpbQ1+iu+Bw3lPMARGPgoYC3DXs9vPIeaez77FgrqWSRS40D/thQKPci9p5Y2T7Fbn/4qJtIdMIDuJZA23IeZKeRAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7LREpL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrYEiMoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tCuD2291198
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPxK0Zd5FBsVZsqHeJ+/TpVgmVWSK2RRQcl+tl0GiZg=; b=M7LREpL78c21oNC0
	trOQJJa2IF+2bqRDglgFkpi/t+gfGaGmJSBsfV4LIAtazVQ+NtzaKCg+JtDxX3Qd
	sCPMupgEtqTiOlxqoZZiDtk4lLLRsVB+DdoPHbdYZ8dvghGvxCNu8072bLFJh5JK
	PZJiU1zbP2nl4ijdctpCn10NuvikZnUAqT+k/od4l5PM+W8f8M/LpUkKBChSiBlU
	Sp/TgW0rV7FIaC0JwJraMqWnqZukX/cMS7qf2Fra8qDBE/AxukaTogwxh6cjGpTi
	g1KZTsLREfEXx8SwgyTwbfHFD3R69bJGPNW0+b+Xw5zvsBiOYD6C/7Sf0sZTA5gk
	EZSUdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j7092y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso2307109a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257519; x=1774862319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPxK0Zd5FBsVZsqHeJ+/TpVgmVWSK2RRQcl+tl0GiZg=;
        b=XrYEiMoWVxBm3poc0f3q8vvQUffnRxd/OOhyuje3LDdGqXf3zfCR8Eulg9jT3KOt+T
         VCSlDVnDOYNLbVzi4wL1XzR9CQnD2ZZuHjGIYo/fIM2b2+diIcRJpJtMeHL6cBz2L+aM
         vzOqlPWk6KSSaCftvUjmyL6sxEmyuNQ1AlNgGerw6RcLCSgUh7W5uwoUc+S/6ZhXOeT7
         MrKCSv+2vauQdRrLzsp3AsYTPehD55rNar+RGe7KZ2dxCVn/kGnaZ/APZACanWU2zubP
         lFePW26/YONH4FoRH86t8m3Fd8AvKTdB5SpBOOpDLDWKSwqHM/l3uevwDecx0XTryYTa
         we5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257519; x=1774862319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPxK0Zd5FBsVZsqHeJ+/TpVgmVWSK2RRQcl+tl0GiZg=;
        b=CoclqAGT3G4RHDNkBgRVcyqchHII+vRWhG3aT7aIwLExin73zaq8FTT8SSe0GqI/df
         2uIseD69pch0zfQGIgEwwIA6/XYkXeABEpx+ECpzigrz/D0Yfkzme+uORiKMVNyWTQi1
         jBKtsKT0YMQS6x9Fzgcajja2hFIFWUzwyvdKeUha8ZakHOH5LqYuDgNPJXMFXNtW1KWo
         sYAIYyNhuiPTZ1n2kjgn2FbIZ9Gu+MKlB/9P6mgGtDuM1cODgk92pGbTb48Ls8uUk2AH
         12u4IsFcbqxliS11cbdlwCEmBXojYO6lcOCIiIoh++zheoMMPU4j7fQL/LGgXwDHkyDd
         nkBg==
X-Forwarded-Encrypted: i=1; AJvYcCV4i2PCV96KV/ViGDYRl+qJnJQ5G2DfcUhwLVardZelQ6SiIbxx5T9l2ihTaCvqOiqtU8cEvEyU4Brvfq+p@vger.kernel.org
X-Gm-Message-State: AOJu0YyDx5m5R7RXNbylowOSqfEw4Zufa/oDG7epx21AMcceL0lNOhdI
	vk0NL53gsczJj1fjJwvMRBMO/iq1OaBU8y0ROGc3oJyjYwwGSGLT+xmMByRCbRhX8so+uFO5gxB
	U3Vd+cF6TF824xnHXkgGqcikn4bQgJhxQ99RqQKm15s8IgGDMgIu5nITNZwwtTd1hP15M
X-Gm-Gg: ATEYQzyTfAAnip77oW6e0xlwt/r3XcZB4MatjI2ZsdY5fduc9BT9N3rznEHtZH+4NsM
	YxXJ1B7oGkDTKW48QnXTmtfVenXsdOa2JSLSGbeD2Oqt2BXJzyVSdTmak+UmCc5aHoVDSXW5+uk
	HPRGWKpD4WxYK9oDlgPwGTlACqC96hwrPHyYVmH2KtM1XSVZC9TRxVnkCdlv6WvWXaejKmlkax7
	+PNwjUntWuaA6zlCwRGNdIHoxXWcPjxUj/e4w1jn8kJDQKxDJA1UAzqbSpQKNzPCd3sy6kaX7yk
	zBdFlZ47OKjuS+JQa90bORFoe0jmLF/D3/yYMs+7rQ1UJ3k0DvLS0S1ukULn+Eb7ck/SR+KCoGM
	z9ghJ8B5g3soRxBL0RZQzam/ATsojaCJzFgT1t2WxoAgBCMA=
X-Received: by 2002:a17:90b:1848:b0:35b:90e7:c44f with SMTP id 98e67ed59e1d1-35bd2b9e110mr9337036a91.7.1774257518928;
        Mon, 23 Mar 2026 02:18:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1848:b0:35b:90e7:c44f with SMTP id 98e67ed59e1d1-35bd2b9e110mr9337005a91.7.1774257518409;
        Mon, 23 Mar 2026 02:18:38 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:38 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:56 +0530
Subject: [PATCH v4 03/11] arm64: dts: qcom: kaanapali: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-3-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1467;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Ua9PTxyD06FOiJfwJksvZzTwKT5wpUwMmmC6XVvXSlw=;
 b=Zt9Vok8cFWr43GPyTQ8eChP8X0EScM2ktgYLjs7L77NOj4EDJ0QpFsKI2OJFEqVj+TI0E3jXR
 ZMnVc6/JUiQALlY7cNnYd1huMnhW/ScGFFJu+/wZX7z9U4Hi7xMEFDF
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c1056f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: v0noetuzq2SSI66F3-AJO5-3bIkVhY-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXy5utrIEdnzeZ
 +1DE7HtVxi3n7nYtL9VlXnBpgKf/cERVnazQ1eOv7L3pfnKhy2b6mTa0C3nuVlymZDBKwyMPfjd
 MAoQEKt3DBef17cpGEOXvjMgpgmqS/nFFyTtEDfqLZ6D9om8GcnI/9NFhWtG5PAfnte3Lt9+v8u
 TZPKjdGMjyNx0QR4VTEYl2l0UjkGYPiWIR3J64s4NeCKZ1mKaR+qqVWdvcbfRDA9nlDTddiDzy+
 GTzg3DRNebSoGdg7A1lSnRIidp5ZMHozIXOG2Ebrhqt/c7zjgi+a+7OTw8KuAtrt4p2kPwldLKu
 efj8mb2YOMM80a8F3aR2I2Omj9WmUw8P2KBnkcXQwqNMqgeQIqCcFgZ73/z1kinmxmsKYJvlpor
 53UXUHrp2bKPIBmAkmcq20oS9JvHbZMr1WNREXcCTprTIpLJJuRQoOGPsRi9QG3LqXeBh7Qreta
 YCoHvpd0Kx4aYb5wLcg==
X-Proofpoint-GUID: v0noetuzq2SSI66F3-AJO5-3bIkVhY-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99142-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,1d88000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1f40000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 947062EEFD5
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


