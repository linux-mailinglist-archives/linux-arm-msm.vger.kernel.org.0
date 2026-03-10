Return-Path: <linux-arm-msm+bounces-96550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BEoJcvSr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:14:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E824719E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6B6031DCD30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7493EDADC;
	Tue, 10 Mar 2026 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUTEvVme";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKYBmPJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9713D6CBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130093; cv=none; b=I4h8UAvF4Du71QdZeCmjGYlBTNtVtMKSaspUxwxPeQoFcZIj/mDVZfNnm+Mo2fQ/Gk0slrtNbEdRA6xKEI0e6cMqV6rvBKM6d78sQUvovmO30cPed09cMBI8klXi8PuG1VBdqKuP/fG7Huh8nMvqfrGps5fAar6Wp72LLh7HpBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130093; c=relaxed/simple;
	bh=i/zN6630ICSGfAnaDut73crn2lpipTOIb+yAdkPL8Zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjoO/nX4k6xKpSTWkHdqoASsGF8O47S2/rJxxbfZ16+T3I5BNwxUAr2yCG/qblk60omkl/djkxZSpngepee5BidW281N//k5K8SBTXpAPQ8mS5TGBgVjDBCUbBwByUuHBGcnpzZQe6MUvDEngeO5g0L/SBAOz9t+qr5fah9o2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUTEvVme; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKYBmPJO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EGe63754581
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJtaIZqWtg5VuflBFduFh+NdHGHumImiPr+NGa6fjWQ=; b=AUTEvVmenNC9y4PX
	w3lyNv0NYDtIW55yEj5xXiWeOt1Mlwf6DgykMgzTOo9Pxe1VzG3uhWOFyupsnvad
	DUAcdSTCOS1cLNAkH+QZiwLFJ7e86xymep8dShFXd+ky/MvLVnnIyZFFEEdGU7w6
	1au0EvCXifeilZw5Qakh9SH27uaKjNiNc2Rt7bbnEf+kUMmEGZs8xHjNWaTbR27z
	qsVFtZzWGai8IRCQjENyuMuoM2hbccldjsXOpUN5iJ7L1Paz6DIAcfHcFR7HRdlX
	dOWxRk0hCbNDuWwFPRy1r/x79o0ebpwgOA61oh/Yp9p9qgNOrr93Q1Mdml6WRps3
	yjzQbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477j56f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:08:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso72761274a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130090; x=1773734890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJtaIZqWtg5VuflBFduFh+NdHGHumImiPr+NGa6fjWQ=;
        b=LKYBmPJObZ9Jw6lq+N8WsyPJfc5zqhri270LcDVLPisdFxaaV6OBI8uj5sCMk29G29
         AoTGo4orfUjdIjsjZnlDCGj3YEqYdSLB6K2pRRPjjVzoVTRWjTIrofY8wxJOn4bcbdxG
         35+LJYwPfugOpR40jD2NrMr23pTi4dkJTE88/expKsU8F8KvSHndgOIKN8l/4ImBuE0e
         rERUTFiR7dgLnnjn4yjg2ymG/8aU6Dpno4XN/ZLUFkO44wFbVp1c7Z5MRRvVgRVp0RF1
         WBj0VGyuk+3WJm/CSPjike5SCbNGu9gqYDbfhVtm8n9EKfUZ7NrDa3yJCopoDlREalka
         /2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130090; x=1773734890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJtaIZqWtg5VuflBFduFh+NdHGHumImiPr+NGa6fjWQ=;
        b=jbpvmm6s/NVygR5XyeI0jAtNjGgYtLmLlvdOuqIsMa0+2gGD0/6m8sQIYrhgMEwWIS
         Cy2ACOJ6n+kQy0XrWSvya/n721mrs/u4nPn0+Uhe4joFPX4VwFCJVmJXZRwu8P4qoLJ5
         q90NsxxM3iWA4g4k6hPWV6fcVFJ/8vNHaaScA3zMetktzk9/jkEBRhXqOIlPJ4U9gL4I
         h3Sg6q69K3LE1pPGXKQgEZ3sIE3OkfpkD+h0tWM36y0bksx9Z+SxLPJ/wWmXKCH1rjzg
         j9+JRpTWbJeAcZZsrYKcz/B98HYQaylQi96AXx73Gk9c1ipWhJ8wbH5yhI0ONO205F4a
         mopg==
X-Forwarded-Encrypted: i=1; AJvYcCW+QUpGn8ApxxOe4iKgl41vSr1smg7jb6QX+fd6KIzPknqqduXJTfmgR5/2qxk5dYjv1vmeSP++Dmb2Yu3k@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOUtPuVBquLBiGvPTf6BpMZ5iK0JQ38YCH0+etWL+vrRd2sZm
	ybitLDQ3ouWs+AZ9iioqOcjCmj+1UN8g6bxpqHnRrhjS57BA1cPazuP8XbkU0UGK6q9Nj3qGNqB
	qJsLS2lsrLbQknjOctt6GxGL7HSpxvvfuYqtxRGWf32VJd+UQT3sFLpAW1dOU+u0kmTWA
X-Gm-Gg: ATEYQzxGu8GVEHKzqEQMSTyVi6TY1mJ/oHENzK19ExBGOdFKQhN0NrtJJ+wtPc94Twr
	Ce5laTrS6vOW4+utZtTKQxFe6/lnV144qtGXq5Br8bF/Ix2vUWDw09m1bphRheAfnJOrnwhHBcA
	xSKV9K4ZQjGzOp0QOsAf9vr+HnQJayju6x2VLPepfRM1xdbvfQAWFGWNS3+XoNeaszmpJjCL/fi
	MauMctWaHLQQwCGf2u6Ez6Du14fB2HpIGS6pg5fkX3HuqEi4i5vpw9/4wqluToWGycYh4SiAVOc
	aZISbA+ZWE7axOpbiH0QSdN+no2ickjCxGkbEosnwp/9x2XhpPJSTmnEGe65i45GUxMtgWanfVf
	RG4vkFuhX9J2pdfQjwdxtblbSl7/nwoYe4UBAI6pHpJc1emk=
X-Received: by 2002:a17:90b:278c:b0:359:9a25:d758 with SMTP id 98e67ed59e1d1-359be2ecc6bmr13879949a91.16.1773130090159;
        Tue, 10 Mar 2026 01:08:10 -0700 (PDT)
X-Received: by 2002:a17:90b:278c:b0:359:9a25:d758 with SMTP id 98e67ed59e1d1-359be2ecc6bmr13879920a91.16.1773130089412;
        Tue, 10 Mar 2026 01:08:09 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:08:09 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:36 +0530
Subject: [PATCH v2 10/11] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-10-b9c2a5471d9e@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1407;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=i/zN6630ICSGfAnaDut73crn2lpipTOIb+yAdkPL8Zk=;
 b=0odt1h0ELIBKQcJkrBiiKSIBIUtJ3/NO7QdVLhQ4nmNGVv1/zfaHVj3ZywxB9jPzUeQSJ5TLm
 3n+oMm2Yk/aBR+pjmKnFUnWSYzU0f10Zt+Sf0uiyyfbmLLTE0ObAA6I
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2OCBTYWx0ZWRfX1VDAdm875E8y
 Tqg8t9oJUbrcGHczxBx9cLttgRmA2nRED/eyx4sIp+Y1T1oG8gIwVtICP3CvlxLhdqBDhrs+AnA
 se9k71YLtOqp7BvZ8XKf4BNWPWV3ROu9Xq6Z8StdK6JpurNvRjxkPgGBH1AB9nMaK6tvmQ3jSUJ
 obRgspPbMFZd08yxnNSccgSQpyDkEp2J3AzNhAyQtbGaow08Nr/yzybxLZPOCY8A1MlRUDC5IZ1
 d84E3tD8atJdKVy+4xja/+3WRZKi3kBPXCzppmmQOIhrbDjSQbZMvcrbhxr/XjClnTrWbXwn1x1
 0v3udQMTjrayP4ebc6NEg06gpT7T9PyKUO7nM8oKN9il93OyTNer+2kij+MB+06V9/dT4qH0X+Z
 PHpGAxOLhfbLJlSR3gw5GCLVj7xz+bvCGTQ4eGOVyR4kljwMU14Ozvf/1VIjbBcmU9lBDp23uwf
 JBeUn0vjy0Kf1MSefQA==
X-Proofpoint-GUID: VLj9esOSmdlo20gsnHQU0VPeQd4I1098
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afd16b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VLj9esOSmdlo20gsnHQU0VPeQd4I1098
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100068
X-Rspamd-Queue-Id: 380E824719E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96550-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email,1dc4000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
sm8750.

Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a76bf5193a70..11352cb16baa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2074,7 +2074,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


