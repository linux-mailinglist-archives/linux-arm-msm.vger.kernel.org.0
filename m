Return-Path: <linux-arm-msm+bounces-103394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPdDLYbQ4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:05:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156340DD08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B875731602F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2576D34E741;
	Thu, 16 Apr 2026 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blF2X0/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/F/FaDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597D3B19CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340825; cv=none; b=ELik8DwlIGVajurI9gaVu4Zy9tVYU0GjUCxNMtWgnKgdQK2r75SaN2N7zgb2bZOTq2rstwYtsKeJXa55cBcOXDPiG7jDVNu7K18itILGAVu9GI4z5LXiHJTs09vlzhxyaWzzRyKR0/TbncdKA7ljhZOqgZMnmUjXgCNbZem7Ykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340825; c=relaxed/simple;
	bh=WoZmdcsES0kVFqgFOLWDNt7rW2ibjnMYVhqmjTrduxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYPGZi//gyjrvc2VS/Pi6lIKxZfhUDlbkXDjlqVkNUyjCXaTIYXGnspTEf9siCvhh13Iz2ai/dJ9haKhgFztcmAASdBH91LP4SRlDRNxQB78MF7hqpC5JML35Hy9RkEy9dhwTJpLFsypUaVRE5tLGYh2qC/8mlu5Nd0kDfz3zXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blF2X0/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/F/FaDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAY1iA1245194
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdM6xkgTl4qUH9SkEuho0KJ2Ezd/MNfY0LaRCpzflp8=; b=blF2X0/n1o73Igc+
	hoQLaZ24RsP2vUB/bWyWPAPPb9+SGupsdavtwi+UKXSwx3YRtIzEN2qIbVx85xYD
	bKIl/5r/P4dt7qsmQlhiUMOqbi3eN6mi4yIt3CNgIuVaapk1Dbg3mn4A5+2O++eF
	h6+FWZ7b7ohNDgM07Dn5B6jqKaiO1Kh9pRTng/u0Ikzh6WJZcvCzv80zLiRPMNlt
	G7jVO0jSsnRnV5blhpCEtr00T5hvPvSwsEZvSYJLUjEDKkeFE5cvDxgchDYSiq8f
	EZY/kF1ErN9O0ZuXCmojYcbTwK8WpzSg6If+9lh51mCcg9/JcSlC7i7xbGojOZwU
	KsZqsw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k87w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76bd4feb9fso4447630a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340822; x=1776945622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdM6xkgTl4qUH9SkEuho0KJ2Ezd/MNfY0LaRCpzflp8=;
        b=W/F/FaDjakl1N6RCXS4hrtnmkkPhiHAGvotC3yzH5sGmIRIP49uZuUZZZ3wLB6J7KN
         FA3zsBAPHOdnAENUuSsCJ5Sg8E5PLpYKlBOXqB09icmZZx6giR9zF7SZyj6KX7g329nt
         Khd8uB6owTLTMLfx2HDQHfqDxf8bd8pd2OUpx/x+/EuVP3ROl6eqbtCR2+q2wVY8mCws
         oMnftBTwO3VazWy/ztheI8vcDffSFLRdBxcak2RuuKGQrPlZsMX48jpxI5FloxRtDYNL
         DFF2ldDhug9hz3mLMdOrBUnjSUn4+H3vXOg+nq9zGgDzjFcWmN1n7qRIaUO6hVo2A4wA
         kBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340822; x=1776945622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdM6xkgTl4qUH9SkEuho0KJ2Ezd/MNfY0LaRCpzflp8=;
        b=kSPhL7EdL0x10YrNU4MTUePtFYz2+ikZqqAobjdaEEGQt7bOE7SCSzSjoIeBtXEavm
         fXVlE52xUAkaMqjwo9KrRUf5GVr74KInnlG26PsE32jTm23VhiGz/cKorz0qUKBMVevG
         1YTZJjhxZ4F3WoMN6sMzf4c/yWYVTK2QjfIM4ovWlh5QxOJy5z+kVcGFQGd7YmLNSuxb
         vupT/UA2QAfrTYVCtOgbdPLh6mVoWjujLyOc+AiZ0ykRQiCE4eVm70iqsCQ6rXadExsQ
         Z1SfKjR9COI0VY2XPBZyK4Rg2z3oPxMhFol1PZP08AAE8z82ojEzHACfqMjD8Q+EQvNT
         XH9g==
X-Forwarded-Encrypted: i=1; AFNElJ81e2dGBcdHZvU3Xa0nc6Kwvn8AmPaewctOcilh8WSfi4otexh+xyOY2lrJTmFoOLLD1DvR5lHXXX0Rb8vP@vger.kernel.org
X-Gm-Message-State: AOJu0YykroQ/tibjeeLPgamf6FTD3lqsnVd5Fn7uFO8YZ34MgGgkrpoc
	EdB44q64KcgYsiZU0ccuK5kzSTob/+UBHnLLe4AqjtNf1WKwErGEBXkwGl4Xr7lD0i3vtDFYcgR
	4ovIe48WXY/ffZvjJtkT0Ri3Pp6tVcKvg0p69bzM/qYuGyjf32BbFYF8MeneWvo2pORm6
X-Gm-Gg: AeBDieuFxhSoNgaBb3BL6Qer/36ir07MIkQNYLVet0e+qSL5lW12CwTZEMSxVXnhmKL
	EQIDQgk7OKg3JEhK0x0eL/K5g9YtFuDTrSGrRXuopD8lQtbCowW5QuGkov23ViVo8bjzFu9fnCk
	XH+/F+loqd4+vjOsLHjdKDF0VkWp82lf8dqbxzU+JoxFrC2POVRfQyDBrFxsRfr1igBfuzehKAj
	HH0i7eGxCH1vSYlkZflaLjWCjX9h/RS/VyCEbKwsKFSqDBOUQbbkq4Xg5uQaQIQVeML002Ish66
	tEUbZQywyLjQ0vOVrRXmkC/WLkjY342v29q1AuQVmMDi7tzk4CE0k7AwAt20ZUeHm0pXhD4ztQZ
	XwMnDMTVvfEWljXdxIIZT959+/jcKq8UGdm292ez6DB8dtXB0ZDKXF15/tg==
X-Received: by 2002:a05:6a20:6a27:b0:39c:2bcb:4197 with SMTP id adf61e73a8af0-39fe3f8b573mr28395574637.30.1776340822034;
        Thu, 16 Apr 2026 05:00:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a27:b0:39c:2bcb:4197 with SMTP id adf61e73a8af0-39fe3f8b573mr28395462637.30.1776340821330;
        Thu, 16 Apr 2026 05:00:21 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:20 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:21 +0530
Subject: [PATCH v5 04/13] arm64: dts: qcom: lemans: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-4-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
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
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1575;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=WoZmdcsES0kVFqgFOLWDNt7rW2ibjnMYVhqmjTrduxY=;
 b=pb1FuQxvTSvTtFtNSn3aakvjrTq921tbTyrt+lJTWSUPXIUkJOZ2PbX2FnB84iBfcHaMWa2jO
 remJRi5jMlNA8YKTEqZFohDiorv9WeOQV5MYy7jbYZ2yWCRpkc+Z4GY
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: q1tV6UrEQ0fn4djhfyV8ggITz74nrFJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfXyuT2nZNGZBw/
 RtiLme5/IXzlI3+gcAA2GJmhBnsZGOhAnbXUJv2QQvMLqQSDa4eVWN+Xrqjwsi2BjofSJU6UjYP
 6zeLhNyHu1yV+PV/HKOR1UkYbojeI822oCeFakzZoRUey5pkjr7vZC2W1wUSmotn6te95c4Rsau
 B91lrN0JVfwIJTSQpz8rq1KO2yNk7T6Fk+juadJdvJCi5jiiuloj47r6JNSrdeaBbGAYkoSPqo9
 HtxLntS17Sr+rmnOG5fuysj0/rfdYH57+A0Gi4TSIhvVwrrTbh1dGX98sMz4jrHwsWNOzuIzqAy
 tudUn7+vQvqOk8c748F9keLexo0g8s8eVAvqYCtsSrVqZBpY1TlRJjj3foCABn3a1f7jlX6l4m4
 7fpAdIIDon9Zl41NBrka/3Ra6X9GvG/7+p4MrG7IqruGn6HAcM/wD50+1cKsmIFKlyf4ePgA0ET
 cxxO4fTSlzZcgsoCk6g==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0cf57 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: q1tV6UrEQ0fn4djhfyV8ggITz74nrFJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103394-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
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
X-Rspamd-Queue-Id: 7156340DD08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.

Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..d83cad26a20f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2758,7 +2758,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sa8775p-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


