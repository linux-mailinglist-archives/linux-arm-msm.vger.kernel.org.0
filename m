Return-Path: <linux-arm-msm+bounces-90291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI3BGXcgc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:17:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113897191A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3DD4302C903
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D2F3612E4;
	Fri, 23 Jan 2026 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phi8awCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHeRES9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB79D35DCEA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152381; cv=none; b=tZkwJ3LWJuwJ2L6p7gSmZbRDR82KUc8iRax1jNUAvy618hZmCFoqCTTS/3XUwDaXz3h0gHCnuj3yznMOJ7x6dDYkEr7UU81fDPCUb2QIE96/f6yes/EJuiA5rCkboIputnCM396gnSVa+CXcDove0wsLDTHm6XCKoe6C1zzfSYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152381; c=relaxed/simple;
	bh=RRvA1pnjTuwdhETh3SLAdIGbTLnDFUpnlpnc0ANqB8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLM9WOhNoZalehveiPfonxabBvtPDSpq3S2LE4aEs8Hh0lcMSFmIZdvKg2r0n5o2YU/DNI7GaNoairVKjY27OcmF+FjWYKovkWgQI1J1go/njzzFvRlhApUs/3KraYmfbx3c61u7UpKTuF1xUTw6dRL+KFmgYX0h58igljB79W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phi8awCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHeRES9K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N1D7s43649083
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SgkUQZNjmFSOBv605ka7pW+NpXIVIMHPsDQtpEBPrNk=; b=Phi8awCLjIrx8ujs
	+WSVZa1WQo/ZcqHilqV1yJHSr33PFcw0Gj6Mn7JUbHyIl66NncLetcpQ7JDTwZ5m
	GKI+a7EW5Fdct32NaFxibkbMik73G/WcW28fc5g0WC7Tv+aD5kq5x0kweS/9e/p8
	Fi/elLVc+Yap2f3HbOSQJVEsbtjgmtG4I5NxSSoMrcP5AppSA05Hubw+gIDhl2Wv
	+oJUi83fR4XVCBuBQb2iu0IvvZo1LXnTRjC1rRfSWAg6D+PDP4UrTMqvlSE/T9Tf
	YQ5zoRAYxr4sJOimLhxE7ErmC6s6+a6sQR8FiePi0p2axe+bC0vgGMxD9EHAfqOR
	PI8H/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4ns61x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a79164b686so24847985ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152376; x=1769757176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgkUQZNjmFSOBv605ka7pW+NpXIVIMHPsDQtpEBPrNk=;
        b=dHeRES9K7HKrEuJCd4lf243CyOv1nYQ3mATQpgmG2KvQ9Bx1YF7lwumu+MCo3DBCDR
         E70z48dDA0JRgoeHoDn+LwC+H76iylTmPuYsp6my9/s3LU2JVidDxuLZ6r3zCvbCu3os
         DSHDtliKyAOECDnCO0u1WJH/on6UyROdZc+dNfvIgOpajyocG90lCPC01npRFzQkCnTc
         Y5tUbu5+CdYmEQirY721H3GVeGHEjReptjyjcD5FUVJDoRQd5ml0YYhg5uYSy4azxyGL
         xo8MaRXQN2PcZMWDmEZnuHz99olD6jLKg5xcF3hC+KfS4BoA3IIUyMi0uYGeRD4Tst9U
         WtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152376; x=1769757176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SgkUQZNjmFSOBv605ka7pW+NpXIVIMHPsDQtpEBPrNk=;
        b=ktpu14kHHisktYTIXjIuGPNESZ6JoVsX4tfFvEP6cnHzm6dWrQgVj7Q1D3HQNgvOpy
         SxOKUrMI9T9K90LOpx25ov2oouvznk+qHE7r2+AIb6Qf+rt4hPCBrnN8yM21Wqj1Bddh
         athI1i4YQFrNWoHZbNSci+ynk3zlHRCcYKkYDUPWYGQM5r3CRiSAuWhxxcSfePHGZn9A
         nOzFXVEbl4ChjkjU4kBZFARb9zgBESS5YF9Ec3sKqjxhfkho51ENmOT+gU09mmvQVfer
         QNwtXB+S+EgjIUWt360mVwzmd62OzBwI5KmWNOCFMoLrl/SxDbndAXVuXYZulATCQJqp
         SH0A==
X-Forwarded-Encrypted: i=1; AJvYcCVVuU+5AvLFwHw4JLlLsmzNBx3SqSwTZUdRRthg19+Nwqz2VKkAE1V7S+9qIXI1ENsuXJuONX6V6UPE1Sdn@vger.kernel.org
X-Gm-Message-State: AOJu0YytyvoH6OSplSHCAAY0xhrBCg81uHVF5iygnE+/i59ZPR95flDA
	MJqkUNkTUVV8fY+T70q/7CRdSy7J+L6STj2zTRPRtz/rH2E4+ax1w/4VEmzHYRNSxADvyocoH2Q
	WfajLn2lKe0+SYQ2LwcqQoaXfn2iM5fh70tMi6lcQ20/6KA8WInXKAh8bc/4ghCWmg784
X-Gm-Gg: AZuq6aLmjVUca+Bik7lmXT5zDBJk7aGF0yHXG4VXSUC7VQqZoTgXgU6rOj46snDH5/V
	82hC/jQlMJisIGn6TB1PN7ksrZUZj25DAntueVdn8mAdnbWqYGKF7H8FYbBi7zsIUAVKxx2V7vK
	wBz5CUtHW2ID9m6w+Rk9aZWSfIV/JGA1EyCHuiRic622TptUoJ0w8vEg/s2Y0bYb7SUgXlK6JZO
	yUCkl8ufZnMtUh3FfvP0i8/T00izvjhVFdCv8cOp8f6gCA9YIbdAMKL3RHI+y9nN3yy0kbryjdw
	3QVvncmZBbmJ7QKogp+oZAzjzpLyWKrOfywSzp/nk+9emiG0WZtIjWdn56IxrBLrS2dNCuR/fHu
	/k3o1F9RyM+9iLXVyw1BJD/WQkJI1bvHiJIE=
X-Received: by 2002:a17:902:f641:b0:296:2aed:4fab with SMTP id d9443c01a7336-2a7fe5967dbmr22143525ad.23.1769152375663;
        Thu, 22 Jan 2026 23:12:55 -0800 (PST)
X-Received: by 2002:a17:902:f641:b0:296:2aed:4fab with SMTP id d9443c01a7336-2a7fe5967dbmr22143355ad.23.1769152375117;
        Thu, 22 Jan 2026 23:12:55 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:54 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:27 +0530
Subject: [PATCH 03/11] arm64: dts: qcom: lemans: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-3-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1228;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=RRvA1pnjTuwdhETh3SLAdIGbTLnDFUpnlpnc0ANqB8k=;
 b=FYuSrOGwJHDCWziRaOqDDJUypvCx4W/2H492KRTyiwM/JD7jULVQYj8m4o1U/nUJwgeRD98w+
 VR64fSCq+4hAaFd73BRDMbq2QdZQNm6nZnjCOvbyQGOH05nTurCWzCH
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: GXblY559rK1yKckkADUFkUpAag9PyGBk
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=69731f78 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GXblY559rK1yKckkADUFkUpAag9PyGBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX6hYoM+aRagyh
 cfNVvae5PSI//3s8dK7zreNSy5EgtwY9PvQnFmeTqJbv5PmztRfnE1HT7Dru7Fim5aMYka7/sBH
 o2u9CSA5K8p6eSfIW8DjUS5VWCUvEbiNTsIlvv4Wuz8f4DyN16FOqXwWCGSXn6JLc+rApuxjtNM
 m2xlhI2gc7EdEwiCdulP7tQ90hSQIYySHBJC9GeeId/6BZ2WvX7Xnjf7IFL5dAcPeiaI9Qd4nF1
 3xjRsY9GvOMzky5CA6tOJVjxsKLI1Fr9wLXezhP3k4rIZs1BtVKRPNIxjuBGMztFYrndxInBHcx
 sUxcykD3LO42CslhmwJ6sO6Jdz/OxFo2wrKBo6fAJxNlB4wiK8q2T1vpebYDmG1fMVT6cpgJp1c
 7x58KE0tfj6uFpcgd6FskmB5S3TSWcYefqPoswMie2RGysQqGv09a8G+naMpQg99mNmqdLO30Mx
 kVe2qgM8jrwtZsysyiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90291-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,1dc4000:email,1d88000:email,qti.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 113897191A
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the UFS_PHY_GDSC power domain is enabled. Specify both the UFS_PHY_GDSC
power domain and 'core' and 'iface' clocks in the ICE node for lemans.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 7c46f493300c..0312702020d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2774,7 +2774,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sa8775p-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


