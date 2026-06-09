Return-Path: <linux-arm-msm+bounces-112220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TjRiAQIvKGr1/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:19:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A9661A69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:19:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ljIyuDQk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NOx0zkb6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BD9031CD955
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4DC4418E4;
	Tue,  9 Jun 2026 15:04:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CC48165E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017440; cv=none; b=RUH9Zu+3Xj9vlemZ9zKJS6XRSF4FHxjn8WSoX9YNasSI3eCZnYSaO/fA80+yTmg2EQcPXaYT/Ee3IGxn0jf6bXB3+Wodw1IsQvNPL93/HF7hgNVfYOkIfmn1gZN2snsWHYXjucAI3Ly2oH7OOzuqBjGweDqrU4Pu1vywjhHoal0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017440; c=relaxed/simple;
	bh=PCD+i7SHH1Q3aqP1kDg+0xqXQ0lxVY9bSo+70E9HpZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpC0UI9yJE/6lL914Q3aG4hxWJa+HnbSMK3dDLHau3V5+Xfl6FB2EXdn+p743gLMVoWYbDHVVyjvZwNfkS8zapsEbHpZNIA66UeXx1iT6dYmcEX20SHsVnmUMz7PNOZYFVgKwawwuJndUPKzKlorqyGqi1CbEB7F3A1IC16CxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljIyuDQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOx0zkb6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmQRY2625090
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=ljIyuDQk9FzaHl6O
	K7gOjQJNj8g4pkgmE2oy+jqjEeOF0kZt1kA7vjugP+XWDux6tWhxK6opWPLIHSDn
	8RPotDBHnJb5W7qNQo6AhyajCSqfcVRB0rweuVrqWE2hDtMUKSCq2LojZ69k8dxW
	PrTVbzlHgs9LD+JAiymYgliKxm1sDkj1VtIQx0yAqgpy1EyIEm8//CF+mwGVdeGC
	C9j4zEuGr4tJT2eYcL1aQhN8rOmDf6+p3hFFqkOovLVB67Pvmj84i4RPUi0oXaKw
	7+BQE+2PagrtuI8nwmPh756efZaRMTiBUKxBDKkvcrMzr1jzyLLSUJj3FaW4JQ9R
	rg0BoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsadsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:03:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso9666579a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017437; x=1781622237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=NOx0zkb6uxbE55uzf56vfhHB/WeVAQUogYjZ905C+SjcZNQIAmma3kWvaeyZ0LvG3F
         hLFvPEn1RYMLLPOOUxeE3G2awi3AVm/Whrxx22ERIbbxEbOunYeud88qv+0BKs+bjmBR
         Bvh235XY2M1piKToxjfQRX2mkBrUyge3Pc2gb1ZLG6Z0RZnEUUNNfSVh0f6wRYtQG1go
         bypwHGLxcTEWPihFrxesjajVvrPxHJnEUblSuQBp7CZyWHuK1mQbb1dW03d76oYhGO7p
         /EEtgLvu4dVQCBE9XqMPD2Uthx92MsN3yZXkxUcmJpKxWgRbsUDwVJmMe+/ZIcZdEVrc
         isHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017437; x=1781622237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=AlVj5zysRSTjyjcQU+rL7hjhLXy9buqbZeOSOvQj0rqJV0sF7QxrZTZbcgJ7Oij8jf
         4ndIMzg8WollC1KMei4DW5TYl4lFuwkRRCPgw+OMA1MJz/vpzMKp9TjdLTGX5wlXO0yd
         RHU0CICoguCCSmAKkJgZYMyxPvfWTzknrp8IycKt+dhA80qJXBWnnkuChRjdXcPdrfap
         CBRBZ36ml0gumKevhnRIlo2nOGMsWMrPfLbSgHHV1b2a814VdFvzciNcxCuZoN+Q44ve
         eV4GsIzu6tAWmplTo3mohEYqwTkZ7djGn+hmsSHzlP8oE7ZR8x4bUIxPRrsUgNLonuEN
         jUEw==
X-Forwarded-Encrypted: i=1; AFNElJ8qQOnnONyIV3Mf4a0cLrF6vfAC6WLwQ/JtVVb9Zr0Kr1KWtugmubljTXl4k4loBzSclFMg9v07+ciJbSnF@vger.kernel.org
X-Gm-Message-State: AOJu0YyJgHb0D/h6a7VDvwYk41jVbakKpMvw6WHZhzRBedOYbhkKhUdQ
	qAO5l2vl+/hfNKlaQ7P5nHwA+kn7cUFUfMtRZ7/twGC3+wLey1RpGKyaj8KZe1OKc/WvhsUNeQ7
	mwDZ0Nu3hlJOC9KFhmMdWGgbT85wCS/hc7Ab21xJw8YlGasVyDbj3/gNzUAIWQvg1JfwlJwYRgy
	gj
X-Gm-Gg: Acq92OG3vBfmgiOE/QV0e7hflLzGZ7uTHWq3upYWhJguLuUgyWeECqcBZo09YuIgP1I
	ZhtnpwIvcGrsZCmlyBVGwxagCJa7SFtO3oiUoajamELDOIVjyel5/eVclGCdGDthAI+deDtSnq5
	nOBfGn+h50p0Yq+W2jpO7AwPO2g/IIKP2csFNGaB7QBndZF0AVKJqD9eS26Ajyd9OMJXgkWs23m
	a/66nT6F9Q4DG9dJ7njnlVkihkBRvZh443FrZvRa1S5g+FW7DwvCMHF+CoWxaYUkGS1NkzE4eom
	8HTb8ZUbuqn05x7PgmCWQh4/mkGPoZ5Lczp4Vt1STHb+tQLacBhM3wPeIDrVCmDWD/sDFABw3oN
	he1o4DYJ9L5MzV+ph/fNcwQ8H69QL3sVhoYWJH362FW9eTyf3R3OO/8qv
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138413a91.19.1781017436514;
        Tue, 09 Jun 2026 08:03:56 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138338a91.19.1781017435965;
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:58 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: RatGm8AAtQ2CYNvjwv_v356QL8v8wadw
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a282b5d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QpH9IB84JAnPMoRP7PIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: RatGm8AAtQ2CYNvjwv_v356QL8v8wadw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfXwSIbvmLp3Dvh
 /7wXmq3I6ZPrVgQnZFc8tG3KnRIWyYINZHWwDeISrFSIJLGv8R43gsKgXei/IWPVFz96HI+YYkm
 OFkZ3IDEEHcMjuonbds4/WU4I8J1by9dTgQulAJ0A9Q6jCZVIrBs9huWvU/9TMbbuomuE8g/NJe
 9R1NvXYOurjhtoZosJE1Fl8KYLBfJU4JU7AR7mCAtYr9f6Z41ZEqiEghS4quZUoQWKwidssJIIC
 d/ZQSZUfi9YUa380Y6zbloxi6joAJqhVM7MGWV4KZKbvOXjck81/BbEzThq+Fqz7xNe9zN/1rBl
 ZmKj+ywa4G8H/XMbsiXKdD2EYnQjeaftlXBfdLi2bXPcFPa6B/EVvAteBP0zlppZp/e/+Z/sWOM
 wa01gTozrI3tToQ70yrefKPThjZ8zTXf5sToX1CmsILRK4lKgH6oX1uf2oZdmhVNo4v+9xYTVHw
 1j7hgsI6d72LrWe0xzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:taniya.das@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B10A9661A69

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..c5635f22e2a7a68fe665a5b5236901b17de6983d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,19 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2674,50 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


