Return-Path: <linux-arm-msm+bounces-112581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WpQSD8FCKmpmlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:08:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F066E63F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:08:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RNOLVVL5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MXgcVzJ7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112581-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112581-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75BE832A49D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1E136CE03;
	Thu, 11 Jun 2026 04:59:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942FD365A13
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153963; cv=none; b=o/r+MGqRhb4JiSbh+zXKfbc2/rlZmeVC4Xi1EI/o6C+DVo7VyBRlSaej7nV93XVPsVMNTmN7jVbHZ0JV557o90XxQj+BhqKfECZNSsgsYIHGKcOAfWEPfSmZTKpeADuVhZuuqtxdE1drpSoJgs3n/K5IV9Adm13uBwFnJHs2qzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153963; c=relaxed/simple;
	bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APh9Mc3ZkzK7a0NfwpOZeg6efXW4hxEHusQEUhZqcX56d8exsiXfB5K51wv4i21PKMZ7D2SOK8GpoxhgIBV+gBw1U1vW0X2fbh61nCXcApE7fS0gwJ/nXFfnlMthgI9xZzdhKd+jYGkbMRXBkG2d8EbSyFbMPCGk+YNKn+m4XhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNOLVVL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXgcVzJ7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nl7H3184465
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=; b=RNOLVVL5zKrqtDXm
	GPIsl9rjZyvp2XaY6k+Q3Z7T5+k4doNFVwaqZTTpktLLpN5WApl56wqpmcu0Nonz
	uuvSZLPpg4taOtendeIEmfg/Zv9Sx6x/Cu4Z4qmTjBMwX+fn5gS0UltOwnjxe2/d
	cpHx4SvPIKNXPOaBC1d9dQTXwyOgvQL4+iSnHOyjUvUJSFhaAdQuZL3ZQ7nQaXLQ
	vYG5BJ1oYcToE8nmyyQl6/2QIy12Udya2LsW2VTzmNqMKMXbbymXoKnw8/su31e4
	GyZamIdp6oek+fWeGDnRfgQxCjKxcuVnVKX4UsgoK6py6o4N4KuWT61c26WI8YCz
	+GNohg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6usnpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso99119565ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153950; x=1781758750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=MXgcVzJ7OSGk8GFIcsF2nx2giWcSMRp4kDWYqfxIPXCeD/uJFZZFVlyyOXJiSzw/+l
         RHxxVA7gvOVSTB/SK9CVt3XUhDItZm/E536Tl/fV1EFXlkau3n7iFzMVS9ktoaPYvgPn
         l9pR2ghzY8kd8sgw2ae1e0wfcZxVVOZzMfjHl4ybUMbipLWO9zM0iOxbNkrD9ysVCbp2
         p7ZMDj1yvSGQwqy+FDhddRCqCe+qOlHYtw49EfJiVrvUpbzKSW913Q5vGGzxeEKSxFyR
         CcoWnb8V9zMFN1OhU9LxR3W914lvEouGFW5+MrUc2cVy0s9nSwKhQv5gExUYxXLuFlbI
         Augw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153950; x=1781758750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdqOy8M151/0bGRhRV2QiiKDAnKhEQ31U3u1FbotUOY=;
        b=mgeZ9LBdDTNtI+GTkjUdsVGw+fji0a795rs5V+IclMXGdLzNNRhoNZDyIne+qs+gkZ
         FZkPLBKY2jQu85MypZYybqVIcmjwl6RfHCQlv8NXli/ocyTIEyRIgAHI1FoN1PVNBp2Q
         RFg/GhH/u24dKngFr1jQQbnGTpEXPGj0PskPtY8uG64PAgPA0ABTsynZijjvIg9Al+jg
         2puhGeRTljllSjl9FFWquGCjB/d96LaIbemyqx2Y/u5dG44lzsy5AqcSBjykmW4tKwr4
         a8NAiQ9Wo+tfi/g+UlhmBNGDUawLKO4hXXG+V4AGZWAIUNn8TTBKFYCCGRGfcoTJiiGU
         r2JA==
X-Gm-Message-State: AOJu0Yzg2qlmr+njuPZzOgucUaWr1OklxGBqXM102M1X7FfDAWSwICIP
	wvLkc6yUKEcr8kCecDeOKhpNvFygXjLhfAVi7crsBGZVupSnUJVPOmBjXyUDb6kdNMUBBDfIjec
	tWykemOsvHC5fzRvS5atAYP4XRb1M78S5pxWoZLMbD8KAv2W+V9bLTssTJbvnasERgRrbyl13kS
	+z
X-Gm-Gg: Acq92OHL8CXxQQqZRd0B/Ahzy1C+IxxGaKqvc+cjRNpGrXs4NVwr0HX+S1YRGm/ttRR
	60xGHG9cMxFjc/DTJcQyKjIurdx3GrD2wWeLrKdBTbTitlcz5x1P6cLdbWOaTfHbayCNMXB/naS
	uz77VGhxe83XEofC3xnKLJ146pn/EnsZYcXm9JHcW8kOR42Hu4y3psjVUOxh66x3CAvDbrcRQil
	O+PlqfbffXfGByWSTTRPiZdy7l19LRAYaYVQ+N+y8nfPamofAKHb6wx99896ysZUMckL/Ia1UCL
	Xfl+1Em/0o8vsDd/sgyWmH9JMi7xsHsvHllGJvmO4qIqNWeFJau+cBSg5y4y5b1mtpuQLfOJtxX
	gXm8vEsPHtsgdv/+p+zE++sWN+0tr8+pVB31VNfChqVu7aDSV+wsA9MhgQr72M+CAem8=
X-Received: by 2002:a17:902:d48f:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c2f005ce41mr14244205ad.7.1781153950001;
        Wed, 10 Jun 2026 21:59:10 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2c2f005ce41mr14243655ad.7.1781153949523;
        Wed, 10 Jun 2026 21:59:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:40 +0530
Subject: [PATCH v2 04/37] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-4-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SnFemOqaJpb3Bo96e1V7TzNicDBNZ9REneIaHNVBH9o=;
 b=wr8KSF+6WKoLup1Xs4HpB+xZE/59CMXS2us85n/Jtt8brlMxTeoGU6nXkwO9Y3+SHcKrTK3wL
 tESJUDF9+rwBdvRhrBsk7tjsuNi98Luwbx7X+WK1N3ctfytIi+/WhW5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a409e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX8ussxScMPMnB
 ynca0c7icAam9wdk8cfP/eJTFuzttBO+ry5I7QeN35YyPEZuGdhQIF7e8J3o57g0FYtvi2Woc/Y
 s5LiwzpBgwYZ0kEsMvnvj0TZeymznyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4r2r1P6mhwMK
 /bBU6hHMZYkrb3owPJwwEIIWO+/T7Zt3fKq4zSvfLmbmHx+qHUVJd2y7zsuzBPSXIoUjuHcMfCi
 lVBanhBtHBsgc3OaahUPcLZNRP6fBnnyOrnlqMGFy9gv8PxzVHH44iHioqvEnJKWO+NYhgK//a4
 R9l1u8W0i2vgdep5/6GUvBnPl1rpSKK1QDCLET0oj1UJJAf3YDYl7BgC4pGeMtI8LkMiuvDTK8t
 IPROr2BwHCwoza/ilpXNRmoEBOpXoibvO9jmbsMpdkj4qiRO3Y+1eIR9SrBmGjuBIURZDTNL2Gx
 fcX30yq0DVrk76nBksYjGF7DL/NNOz6LLI+qgGZK4VS/hfGQHAY7ssFtJXsHIU+1hXxRWN6nKcw
 OLyDitF1+4ddNtCKPot0FXPcZp9Qcr4FgdkywYkKa1MFgJm2PaTGQz3Fch3qjDyw8kOaW5aV69M
 iGGZKEmsqNvuZcdZFNw==
X-Proofpoint-GUID: 7LuDK6BKlqZxu8Ry8rTjDZVSzCQ0l0mr
X-Proofpoint-ORIG-GUID: 7LuDK6BKlqZxu8Ry8rTjDZVSzCQ0l0mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112581-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 791F066E63F

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..44bf3db01d3a 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -458,7 +458,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index aff398390eba..a4644ecca536 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -559,7 +559,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1


