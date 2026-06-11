Return-Path: <linux-arm-msm+bounces-112772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hBz7CijBKmoNwQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAB672942
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RYRNf5vL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cxPXFEfj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 546D630C2F77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881EE40BCB3;
	Thu, 11 Jun 2026 14:05:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0B411694
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186740; cv=none; b=h7ha9vU/i0dX5mXiOca8eKgBFzN2wXiY69t0MVuUiKmJHfpw5h4KGpHOOxsxtnQlOFlzO5/nt+5Zy9esxSPFucPI6s4cvJN4dP5rN3FiL821W3852ilaiXiz1NyE6EFMSNGb113pTubFlRYmFiSHK8TvW9/5btJ60qTkfvlHISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186740; c=relaxed/simple;
	bh=jvQBnPqQDDUlETRre5szjLW99tq0I86jzYAKTdMMgvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcRuZpXlDcfeJICyVLBd6YBbqq4Dzig6oTXGKkarAzKB5HVE8LuWmZj7dSPiHAH7gkFzJ5nT/AZR7vqjIG56nEAPrPkdQKkVdfm1OViK8wodbhnnOsLJA2EYn54qf+itk7W3kVmdrhmUvMoqCAG9u1con1pStxLY4525KqOj7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYRNf5vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxPXFEfj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSg2F576060
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0tGNL7h9K2ue+T6NUx1Za/e4fIV2S72cYMFlFmr6TU=; b=RYRNf5vLR5GIUpzs
	SaasccBBvMEuhQKxF/Q8D+UJEZeP+97mD/KzQ+b2DiOmNkhxDA3m5aVD3CWCQwjJ
	cJpsXzEd+n2v2BlaMYh7RpdVIbT+qo2S8z8d7io75t8lofnXDPBUN1CTI+tenhmk
	5ahYPvnYFgY5Qz+fNNnJXfgsw8K56NyicS+1CVjXcDMVBE2ukE9Os0Y2cG4DgBVw
	dDtgOZYUSecReQx9CgMwr3XyRkwWuurirR4lMBahebJ0uVS3h+owWMpjLXsetmBO
	H3JmB7yt6XgiSL27jZXOn0q+ocKESQ8Qs6e/9bWdNZwoM0ZSqJIREeyTFt+rfqMs
	kUmN4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703t6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so10785240a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186738; x=1781791538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0tGNL7h9K2ue+T6NUx1Za/e4fIV2S72cYMFlFmr6TU=;
        b=cxPXFEfjpeiUb9UcQ2QFCSzZ6y1uSds7ALEzkW/S8gW6QdPOzuiAc2EbuRWCmuePEC
         oY2xueJN9ScMGN4Vyv2LV/7r7P0tnQn/9ix74WbfJWflKkLQQmA4BOX3KZoub8lrJ3V0
         ftWUnndDBc0jei2I1qVZcFQG72U5Hk3yp63HyPrB2YokNIX2VWhm/ueF1joJ2NwNiFis
         HJPsEpy7mAIClmxz8Ng2CPdUpQMILCJIYHe1dlDjIX15DKOGdBa8eVYgrrRaA1hqK9md
         DVvtI2XWFtBWeJlJUde+Wv/v5vBVKH6CVZhxQgrdYQwL/j/Q8Yny0RgY1qJ1jwlonp6Q
         72ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186738; x=1781791538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0tGNL7h9K2ue+T6NUx1Za/e4fIV2S72cYMFlFmr6TU=;
        b=XzpmQ7XpprxSwR9z8r8QKA/f4bLn8+XPebYYWoZheOkKqD6gqqvo3RcoKXVQDmv9ZZ
         M5dHlMGaea0xB4Y0NwI5nDysH1z0F5Q6cRt1uDi8t5/lM2aLWjmO+eGCmMB75tMDV2GT
         H9RZA11lBtAJKiEAZntTqGK4p6FEdg58yxgQv2LPFSMZOnlN8D7QcOa2wHx7ELkZ7YFc
         0WoF4711Qg5iD6YIq+iwnhcx4ogS8RNsjpnN+Xy0Ei0BOYXhUQEFbraXTg6Q6sNgjnug
         Tuu9HrqVvvD8yHQOQ7J3Bl+O/jcgJVzNYTMkffRyNs/Qh/Esimx3e6Nz0ojevoZxW/m+
         6gXw==
X-Forwarded-Encrypted: i=1; AFNElJ9FGF3zdC4K8Oiy08pJya+TBfV2ew5O6xKcP9Zr1eQNW0DUNePhOPDO1T4KRRBu8lc1gilH933SihRDFfdF@vger.kernel.org
X-Gm-Message-State: AOJu0YxzwCVRYBP67aQhu7XsN9VsFoLR8IbLYqAcYg9gV11MSX9sS8rO
	vkYkWQBbbAFpjEjq2mkVNesjcVvmiIExcflfxpTxYE3zJBnifSLyO8sJDGNV0O0bB/RUcT6OJvT
	lk1P1gcDdizxSmfbTM/46jnHg0+PFpXQMqUxq+d95NItXwnz/DLx2gCTCaKolq4DN4403
X-Gm-Gg: Acq92OH5+M5q1fBZSafyprSgpvg+h2mYeHSCTylFheUJVa8/84HBT+adgXLRum/iveo
	DxghCAh6uf+e3/jIS+6TxLQ/s1cV7obgYXTRf2OV12zIrBrITfpsQm+ubsWCD491ZJolvdl6DR3
	k3wpbdF26Ftr4p9vGWYDoWTeDxDpLT1srIx34rS0oGkw/inh/Exwdtq9r0Wi7omZKU5iLFyhPpT
	eSSQHSPrIhk3myZERqjkpOxMKhUJ1khzEMzNWFTx0WpHM9l9RYH3Xowq3tk3B+QJlHrkrQvLP+b
	VV4hx60LB7JT3imMZ1GvGsVTbkuQhcE+iR3BmKw05q5q+nHxR21K0JMhxU8uyCv3+/C2psXRBGJ
	X8g1IRUS7eFG9ITiw7Mo/SHE8lbWnH38cJuGcuzzy15r4Bdiwl8TMHM0XcnpkScE7yuevTK9AP3
	OZaqI2HjOwza//X1/solzoDxXwPOcX+VqOVrcUP5pBR7Qg2Zsca/ZNTcPaZF5h5tU3Ct5eOJjv3
	9Xa5qqdVv+H
X-Received: by 2002:a17:90b:1c85:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-377a76c0b9emr3324693a91.14.1781186737838;
        Thu, 11 Jun 2026 07:05:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1c85:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-377a76c0b9emr3324554a91.14.1781186736789;
        Thu, 11 Jun 2026 07:05:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:26 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX/G7K+MFReDCw
 QhW0y07iWbiFm12VXJ2c90VY+4GHNkj8bISHe4Ytj9D2Wo+zmV94JpXCt559+sOIjDbffKm6bG8
 bV2km5FnEKtbnUb9UiXyEScAOvH82ACyQETIMUU3p5C6nsCei/9j8loLi3gaRrhVlYJtObxOfMk
 I+gN98CqTVWvbLSupbylpqRDxLsb2qdi20Ou/Ne4zOW3MDonetxWujryCa7w5qdgXBmmOvQe2XE
 34q5O8ZhHYmNfz/XrLIYv5ZYLBpvrLcBZSjT2A/5WpE3ZWbsTaMgOVB6l+MW+GQDtcTX2xBgvi+
 mzEYc/gTCvRYUghuPSSXbJ10iUMdhULCc2g5U6J1f0Za+0qfl6m+xPbQPcsCLMCteSpPdNHgKWv
 G+hvtjR+rDefJHUFw7Dodh0Q3M82TBCPObdcq9Kj1Ab3vjBq0ZRTvemV64bbZxoQIG3Km8G41RW
 COlSF9AjhszittQ2BhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX+bIWK8JjDv/w
 86rauhfJaLamdTxqkvZiSmWmL4n09ZqNrRK+7q2E01BKnLMe6zTyvCsAz1AgM4sr9gd9SMXhfBc
 xGA00PrHHTcfu+1ZwLO+joO0879wpLI=
X-Proofpoint-GUID: K8blscE09BXgjuYqkmAaOTm-JBeol5i6
X-Proofpoint-ORIG-GUID: K8blscE09BXgjuYqkmAaOTm-JBeol5i6
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2ac0b2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6BAB672942

The Arduino Monza board has a TI INA232 current/power monitor connected
on I2C12 at address 0x40. It is used to measure the board supply current
through a 2 milliohms shunt resistor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..a526c8a07b30c22820f54b54644916b268496209 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -291,6 +291,12 @@ adv7535_out: endpoint {
 			};
 		};
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina232";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+	};
 };
 
 &mdss {

-- 
2.34.1


