Return-Path: <linux-arm-msm+bounces-96542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEuSMJbRr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:08:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 460EA246FBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 129F8305DD3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280543E8C50;
	Tue, 10 Mar 2026 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpoPGjMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EsD6vodH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01473D669B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130027; cv=none; b=ZCsKTC9hhb6lth/6dqviIlLfZePdH2xgm+vUo6f4HVZzDp3dlaNAYcveIzxqVF3Bb8+wCxZuM/vS2YPlL7FrknSlFE4j1fq7QVbHxzsF80CDra4mS23wCBXth6db2i1qduk0rAaKS3VmhMNeoyi0bFRWgcKmBN0xNVsOteHJi4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130027; c=relaxed/simple;
	bh=XBioX6kliz8hg3/RQUZ1PwtNPhssAHTKLszF8epseYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JF0UMp1Rbys2lZYpCw3z2eJS4A5JUhXj166Bx7+hrbUdve1unSdnPaisj7E3s5RYXiHD0+OxeKs87wYCkISdmejXpkfL/9fRQJ7NIbkrT5ff86GSvRGzFTc9S26qUAGWsm7ooVAVauIEFERJzxCD6UguUCYtquiawYqP/qhpL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpoPGjMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EsD6vodH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ESGu2363765
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wu+HsZDrvVopogRyY+pV7lzjsw3u6yHcs+egaFtXJbs=; b=fpoPGjMIEjtboHRZ
	sLWje+AtqwGu2i0D11Xrg0D+4yzrniHzGxJiStuzjxI8hbHg1YtVF/nktH7xDxOu
	e9Y16nWxScksbBuBgsJiQrlztROdAXI5fICt33V4ePrThldreZKC0z8YYpEPfz5N
	fu6y1pk+FdbUUoOMjhl01VdCnIySaembtWM5YpUxrVLTXRsReCspJ43bvR3bVNmt
	vhJLvy6Ime3uJ26H+ZpX+vcnYry3Blc02hkBTasZlke9qcbtJhbXaSZTDfpFjWKG
	yOoXhIOXJ1y4ACBiceT9HcXKAXUzwf9orYQk4sSdlOpHIx7Hp8vtOSNRG9qvhlS6
	4MrAOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032b726-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:07:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359f31809a0so3151993a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773130023; x=1773734823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wu+HsZDrvVopogRyY+pV7lzjsw3u6yHcs+egaFtXJbs=;
        b=EsD6vodHDcfzJHTFtgB/RKGEOk8VxoZaj/Ox3EK8bZSbodGCNKCXDoUQgmFOoJNoow
         5ORal7EQ8Rt8+jYY8/RDt8tz3Pbs20RMsvzUGkTyNizWEcA/970EWWXYR2cmevISCYGV
         sVjUUPzMTEGAiAa6kaQ/SOnjcLEehyHdX1I4H2elBLPGILNfcCL8ZSC3DKRpIXgih3l5
         RS2SAcuurpi4H5MjP6T2Eun6Ssw6uYoazEPrPFMiFkukVVOFDtlUa3LfPtYIAyS4JGKo
         pFSgoZzwym9rrT0sez58TJmGfAl+pL+DFuIGRlgb8DlbQjIds864GkEvBxt2ra26+KWW
         H84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130023; x=1773734823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wu+HsZDrvVopogRyY+pV7lzjsw3u6yHcs+egaFtXJbs=;
        b=bsydRCunjQpidKQ4nv2Xqdsz9HVpqQoalCEc37MnNTgFiH4wyhiVfxxAxgfMVJyFZr
         Eu/mioAUYmTVSjbNMobOLnc1P3L38OksluYyVBLdVGXKJWh5HiKww1aaMilO9WY0FK7+
         30p7fiLnGlcOzM/OSdyAyiyEWgEau6E7C6hy5cRkj0QteqjK/XMvE0cJbr+n6HwYOLJE
         B838IvDMQMbr7Jo9Dx/4JkoMpNLYoNd81cgLslFapQOhhHDPcOY1UtvxpLCAw1SF8zQX
         YfVwUd+4oDDB4RANJAUeqI2fWO8DwaFKHsnOHNzpvpthkOYK0cxCJMf3SGyTzT9meL7W
         8xZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsVU7ADhNezS15XNzFCAjXpdnNUS8W8pyfmu2seia1mwILTIXUgZBOcLM6lsoJqf5BAeUDNzzpd8SWF9dU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/+DpDlvJnRX+C48uCKj4xbNvoaYhgVzsnr5KwGzosmPdkVfnJ
	LH+ZkzUIjzrV94g/whz6UnOvOurcryMxqLdwQMLYoAkz8ZfU6VGLgB5RKlNcZ3fpgNMdM81Yms2
	ZPrliZYRjJ11QpCTxQlDMbEgp8yx/pwor/70xbeUWPbtg1iNSciLHbh35OQFgALAfNIWh
X-Gm-Gg: ATEYQzxWxP+Hl9TPD+NCsYvnYFFH9VfrBgX9XZrzBbIc7nsysaulny4jzRhKqtbXrsJ
	dTmmmJh3pe2zfiXxyLg8rsZ6uuu5yDWtbV4GRJpSsec6keHONTymc77/0Q9/ShzuZ/7N5HhwgFY
	IzBwxIzuoVfaQ5jqF0Kr1Jrpe+T01yaBn+vuYiWhsZpopwC9iU7eYa+4ftGBlsmXuMlzc95Us/y
	kmL03F9E0PCez+y1G3Xku7ecXgRQdBsFQUWCxmqVcix0ePE8C3/K051N2zEBTXk44F4Dz4TwBe6
	7vG/QI4OVKpIins2kKkvlPKepDeWfsDkmnxftU2Tux3Qf4asvbZ985ZqoGwp2+BgNj1RiBJkd4+
	f/LOD0LEyfpIEEfqP+qERkJER9Ofdx3aJIAUlcsBbUnNnXa4=
X-Received: by 2002:a05:6a20:a104:b0:398:72b7:ec8f with SMTP id adf61e73a8af0-39872b7f22cmr10560170637.18.1773130023111;
        Tue, 10 Mar 2026 01:07:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:a104:b0:398:72b7:ec8f with SMTP id adf61e73a8af0-39872b7f22cmr10560120637.18.1773130022567;
        Tue, 10 Mar 2026 01:07:02 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm11121969a12.31.2026.03.10.01.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:07:02 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:36:28 +0530
Subject: [PATCH v2 02/11] arm64: dts: qcom: kaanapali: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom_ice_power_and_clk_vote-v2-2-b9c2a5471d9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773129997; l=1418;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=XBioX6kliz8hg3/RQUZ1PwtNPhssAHTKLszF8epseYs=;
 b=z9eA6tU4+OoTJGvUrw/e7wqUQ1WjL06ZBWf7eblkuT6ek651NddIZ/UesOu2TL5lRTs0QC/ay
 3nZwKaCGZEICCSui56M8qzt56oJ7XrfDT/00VRxoncRL4JnV4rGPU+y
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NyBTYWx0ZWRfX2t2AZIh95Ck1
 aw4P4wXm1kTPhrq5Y715/FBL+OyGkb1sAHKx5+mHdSDBrxLeGqgR11LA4JWhYf0bSfNR9VX7cwt
 YGhSEhvnzlAAzZ2g/UPbbc8J+dSgr1fZFn2bcWXlXAVpVTHKWjNMMogDbWaY97irMlETB8nLuhe
 FQb2CTALz/35GodXXB6bX4JMvFhJc/uBIMpJ4BMEgkMwdQQ/7Q7WhaUvbsm9nEThAitfdVj+Mmh
 rsWZXbUPPuhvkJiMDZOO4kAoNlmc14YqFuHVUVxSv2eb8lInpZapa2LlV9wFyN2+rB3AIoXS2Wq
 oe0n672TfVjURuULNDKfqEQ4b9qpsQgZjWqKnX2UIg/NTipOlYVugopQxbFbtrQwcB0UuR94nFa
 65OhR5g1Rr4ODQelBRRDUIu85XDluesD8ri8HlzKnoe3fvTCOZHyvKXNZKNcAAp/0Z42SslxF4n
 rs98seJ3Ldh8+B00Y2A==
X-Proofpoint-ORIG-GUID: v8nm34qDeYOC2DPnLr-24kTfQtRxsvkE
X-Proofpoint-GUID: v8nm34qDeYOC2DPnLr-24kTfQtRxsvkE
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afd127 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100067
X-Rspamd-Queue-Id: 460EA246FBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96542-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,1f40000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
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
X-Rspamd-Action: no action

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
index 9ef57ad0ca71..7dea93d80636 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -868,7 +868,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


