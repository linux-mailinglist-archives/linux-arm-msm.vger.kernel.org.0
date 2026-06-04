Return-Path: <linux-arm-msm+bounces-111129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NtK5AagOIWoD+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:35:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4763D084
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WYNjxrI0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HJKcdeyG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09F1A30D5247
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BB73BFE33;
	Thu,  4 Jun 2026 05:27:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8E3C1967
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550859; cv=none; b=aXFjSVfjK6QVX9Yps6rbyITtvl2JCLGM5ZfW2Ta8kjb/KoHrcLtv4xqFpz6wIk0miyZnbdG3HmNP/htDtTfLCg0Wi/ntWG7xvbhH0FcE3C4PR1Ikyc1l+lR2E+ZnvesLw1cZ0Xu37ZxJWIyXUWZxg3gLl9lx7n8zwma2GnW/5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550859; c=relaxed/simple;
	bh=3XPM5GTfEWus5e7nz7aKCY0rPQs4qFX+m9ud6edOuUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxmkuTjWRGNd3YAPrlBF6QLhvMJ1r0SxcqV3zsy6q8CN5R9dIjzXOPJKM30X5xY7N+HYMi3UVvorteAJvaOBauJItBywOMYAcngTpbgQG6g4CJbvg4ru02Hi5/meRkBHfqybYT9/cuRMc2hRZ46nj3+7lvkrFJbrgIvfvKgP6Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYNjxrI0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJKcdeyG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653NXcLF1476538
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/xsy2u+YlnkV58dJ2Zzap4FwbISqgE32SWxOXPVdM4=; b=WYNjxrI0Gc+ekDf/
	gdHC6iiEP14XnhLrkytRon7paS7BsuziPxkkjLVG+3k3JWomdDHM+0CJDBit7Sjd
	Uc5sbn3PjpOyyfxX84XmdBvqqlKv2VeXQ+oPPGjaVIe5OpAMlow+vrSVkdrcr+ea
	7VL/MVbl6sxhhme/bATSZpv5lRDXFFSTezxSmvIDJ1FZ6huKjkf/YvpxoXzrgUyZ
	L6KlGbIrfHXVntTpwB4ppwlGWJaht5uGPtamglhkSGlsoYAPuYeRKdSPDxvJGaTd
	hOfF1Vfcn4U+URMycvHAVfXBA1H93H4Uz6FPMgJlfuplUK55U7FvLSCfCbpIVcxi
	JRGG9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84235f9b91fso244958b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550856; x=1781155656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/xsy2u+YlnkV58dJ2Zzap4FwbISqgE32SWxOXPVdM4=;
        b=HJKcdeyGJlXvu5pRKb/OAp5zqmQPVVBSykw+X/0W2nsuwvfz3J/3scBPukjjxxOaCr
         2p9cXHiUNDD9LEABuRvs8P4BgpWaS/m90yW56EflzvHRMtK2fKoDF1CqwSig8nHHUSdi
         Pm6pnbshVvLQqYF+fHHzl9xYTHkF5P65dpjLfZrKI+dC12TTFHepb9tN56Do8UZXVclE
         8RyIQmpcn3y2sRebA0io6EhwwCMCA/dEnJjxYRcafFCpmNMEk8+S8efbdNZCpif7A4rU
         AUgTOkJslkSODsGnuWLIaDOvJIVMVrtLPnk4H7WPbylfKruH+efZ0HvgkbeYFVIQhoNt
         LfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550856; x=1781155656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L/xsy2u+YlnkV58dJ2Zzap4FwbISqgE32SWxOXPVdM4=;
        b=NDhfM6RHG/DgBv3YKmQ0Thty+zZzqrnHmWMz5gA+Par+pnb5GJu1lP6qxrPcDS5z/Y
         /bwJ/hXy5WRCguYqtQfudAG0uSq8wPE/Sxnk6AJRtFbGQzoaexZYhLxCumkmiaToLGgN
         sCT84DRRSfCZehYsemFg5M1JpttTxn1Qu8KL7mewaKSsGNt17MvbgYDTMEiD+SvZWUtz
         thVomlSkRUSTX4ausRCyRUQpfQt1CKj3typV9d+wtvH675IR6L+9Zu/DgmX7WaEh/cvN
         YVl13XhA1fKQC0sL1FRoj9cXozECsjW2Z3v20EW9VWfTjsuOivxMJorUkMqXY/bt8cab
         Nm5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/TkkmnFky8fzfdRliRrEokoqc6CtzkC9RqIC9kt5QUfDtoxnOi18MlV/YGOrOeT8Nl6C00FJoHISY+0HU6@vger.kernel.org
X-Gm-Message-State: AOJu0Yynxc1beT8lWjQkML61qbMCsJsSBaWA0DdAy3Z7fv582FE5L/F2
	W8MHEcM6vOxzRELuh7DDg8zIQllsuC9qGBcRof38gYJYfdgO0Wxr10t2eKZTCZp3oBPyAzzqlF/
	SS/no5rZfyx6i6R+r98IhhQaHtXB2/iOLtPmrJ+7p2Y0sBF2msahU4U0PuR0uv9oD9fWj
X-Gm-Gg: Acq92OGQ0/v65T+zWyxdtlBKHV4NDzgmII1ZCCz5HiZK9tC4dn2Fbpn43LhKDUA9thN
	RlAOXC1lfWzameDH7cOMa3NdtAYL1lv7OCeYJcXrON8+OxrMqOP0I7veCWRMi4hLpmqqEtY/ycb
	vDJGF/F0NUNmMd+G71/K7T9G9XYJVJeax6pU9WMacOe6NNY6tO3zXwsOqqOM48ldvO+/AOFPQQ6
	ZfZCVsX/6gdb7sgIesqQrQC2cxwspOlUu4HtmQctGq50zKAXluDgEr6YMmj+JVyJHMrF2jBhut5
	xUrkM5/Oswv7Z9L9HTg7TUBh/00b5rfFm85Mo2Ne/V2nARD9GUZRmOQmHGXuhkL/8DL6RZzwic3
	zzxxnOK+HkzDVpZAFYNBPNQf7tjBErUs8uMw01T2gJUm3GvaJpqtshXDyyrtcLuI=
X-Received: by 2002:a05:6a00:ad09:b0:835:3f51:730e with SMTP id d2e1a72fcca58-84284e6ddb6mr6505541b3a.13.1780550855805;
        Wed, 03 Jun 2026 22:27:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad09:b0:835:3f51:730e with SMTP id d2e1a72fcca58-84284e6ddb6mr6505515b3a.13.1780550855371;
        Wed, 03 Jun 2026 22:27:35 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:35 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:19 +0530
Subject: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: R2GeUBb4ln79kqcNknEe59-Um3DIN54i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXyGY5hlDMo4Cp
 utnb0r1fTdulY37v8KjlcBWycIIsjqOCd+Oz9JVgwX1g6grXy7Hg+Rl5i3zmlb/s4jeyYe5ipBE
 jPHeDu2NJr1HUOpHPbtxDY2R913nNM7muVOjd8O8zMVMnmoaSpWpHwdEs803REt2FEkGEzeiExE
 sigUa2seDg5tfH6pG6yg5RvBqV1c7U0K5oc7ddZv9SthY3UzhurNPmhfxeC6e02sDJqehi6gy11
 wZ4KfmkbXUpxflca9O8r5ufTmE7f7YVeydfv1YTgLcN3Z5eo44Ze1IIdV/FzNiMyWWL9rRZEZ3S
 u6TdgzC9aJI1Y2uRsVf07P034mCEeHjDf/Q8V9mKouPzVCo9hQJl3nm7mFEWtKNellouMC3RUaN
 Bwg89AYEf3yT48zll5lJFIOIq7iyhZfyuxGC58K7QAfVzdgEag11iaUoc6zE3M93TZMo5MLHTMe
 bcOaF7rcsY+bxPWQLJA==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210cc8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KUIDwAxYdJFQKfevFyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: R2GeUBb4ln79kqcNknEe59-Um3DIN54i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111129-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FF4763D084

Add support for Display clock controller and GPU clock controller nodes
on Qualcomm Shikra SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..1ccb0f1419aaa34d32f3c3eaabdb8727a497b501 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -640,6 +642,45 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		gpucc: clock-controller@5990000 {
+			compatible = "qcom,shikra-gpucc";
+			reg = <0x0 0x05990000 0x0 0x9000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@5f00000 {
+			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
+			reg = <0x0 0x05f00000 0x0 0x20000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


