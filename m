Return-Path: <linux-arm-msm+bounces-91383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPw+L6A9fmk6WgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:36:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2EC34E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20219305D0D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 17:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27DC361648;
	Sat, 31 Jan 2026 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnJqeop9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw0QbETz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141E35C1AA
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880844; cv=none; b=mm2Skzga54Y/EaLSX8zHw6gKT5dnuchKl17yZEWNgi93lungvCkHB9wF8KKiH2/ivAXPO7WE6Kv8S/EbhBPLw0mF3G73EBWFyVA2Ty5MMDy5GQeIa19cTaL10YN/lUVdr+WVkI5qDaMbVKO1puWFjQD03U4Gjm4xKPmYuelb8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880844; c=relaxed/simple;
	bh=6nfUUNCUKm6Zb4Py6SMv77VBlTkgwaJH9oS28jOc1Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nY3lhx3/WguAKfsXLT2twCyLhyhxwKJJrQfdYM0QObpzKxpIAZ1+D5zRMb1jvOjNThptsjAJDkXpsOv00NirL/asDhYngLFrJy2sVQYAzIHOmJfWVPo5/uUFB+7mjStZ9wU4SYpW+lbyDh2jpn4bUWsOjMdviP4VAKlHaU+Mf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnJqeop9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw0QbETz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4biBl1061074
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=; b=nnJqeop9xlwJZXBr
	5hyownpTbVXsRirxC+Y7PK7JeoeQfGQ2ey1jfNFxeun2imqFoaxrIVGU4+0WI72h
	k3wjkReMGBGhb0qFkeesegGh7oQiA7yKLfVcS46NUz+d5vO9xzKIxzz3dygp3mp8
	WDRLuByqIJhJx0M6s46RNlzWFkmWl1jl7GcXqDkd5d+REzupTQr1VxpOVyWJ+LpO
	sMsJ8HeephBb93yqYqWVuEJSmbAqrpNAwhR4ZiHOBPs79QLS5DJsZ/WAnd058G5L
	qla9yvzO8+ABJwqBKxOVr4sDszp3IgFOf6KRVsX8lq3tniJjqSQvo0mGtuAg5+8d
	zC2xVQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnh6dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94834f7a238so3966275241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880841; x=1770485641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=;
        b=Tw0QbETzelnewAO2Si+vjWyJLtwJe7fKQSKjG9Dn483xMhmGt01+SOwqvA1DavbpIs
         1eMyGXyyCew9SEgw3KL/qDqcfItXnjNEbSQjftjm/DpTexi9kKZKwRG9O0Qazxss0NBp
         qbAb5y0fRJKwjstHUBK7oAj2xoKMSqZCDUvoktKUVHdWDhUmIRg4cyBAI1w6RfotRBp2
         EoiNihseHTxiYe4FOmHS7AIaI6F2vgkWNoiV5YQLLueDVdns4+5vSFG4n6Ap6hxz3TKW
         3KvstupjAwHJUuZWitR53eeRPE8t3GZtCGz4FUd3l5/9FWVsxyfOJw7k1MEQ45j1QgbW
         G15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880841; x=1770485641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qKaKCFigaiRPavXRqYsIyD5X8QHsbYeYL/Pyt3XLwQ0=;
        b=Vmxgp/RcSkEpwTTz5Kg8KlusbgNZaZz4mlgipo1ucKLBla6onw4yRhBVqXkOSspSVA
         8ma6jL3d/cm2TPyvaIha43FoRuhfgSiq6RWXiY4vZi3SW/hopiMAn/KeSj1aSMo3NHEu
         l/iKGtzeYb4hGsLj+yYeqiudu2kK2OIBjPQrD3u1XavT+8VgbiNi1AYoevJWgoIyc2ys
         Nxv80pe9Hn4cEp/l6FZi52quzqfT4TVo6S9G0xbYAFHIohNAA2HinfPmwAvBPhLUYjKA
         1UmacvHTe0GEB1hSUJgsnjmdFGGlDpWYTPDRKa1QJUg4QFwfGtgZ0ezUGDRlz10B6iPC
         Jjww==
X-Gm-Message-State: AOJu0YxAccZH6QIAP4BFCq/zUxYCatDh1mx6sgsPdJv3Cyjj+6wePRP8
	8JMWEcwijR1oaXz21mGbv99HceTTkn+3XyeBea1t30leglIOKg+hJcS0Fs5lFWNwBDRUrzQXZt6
	/zhLwmUhap1i+Eza1XOHq2fJhske7ECjd2KQgyImkHVJ139NPdbEDDDQTGvqgP29dqsm4
X-Gm-Gg: AZuq6aJ8w7BbAnU99bkR87UjWcoaVDJXe+Yi7VJ/SnZ8qy4okjLcpeUEGrHnKmiArWR
	TSiz3rNTeRKIWC+AcBs4VggZ0tim8kVPq0AVQyqQftASoHJzdgFRKT/PG3NtbUNvcv3wnUNAiZ/
	moZkNCri4nyZ1EiCVKSGXwOa5WKWYcOCvKNfBfFf/WuWDyuRFEPY6YMJYx4ZmoiYc4z6fUxkiEb
	j7JW5ncI7BYhEz403lXyA01ESFd5e7MRDsU1BH6T8u35Qsp32iRASv7XtICurSEj7Bb8FjndlrM
	Ui/kPpcdy2E9NSFa8WrCFSfLGC6jop+s1rF1BFzL4psAp0S89U28M/rY32lkOTkGo5fd/hrwtKV
	AdQBP6AyJRYFib7T0hy2TNzwYLNGLNKX6tGa7pBhuZ4u3f2cOWlxKVTzcbCfb0AGdNB+ELG8ZMp
	JumaBk/SqbyKdfnVmGjkgajyc=
X-Received: by 2002:a05:6102:3e89:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f8e26860f1mr2241032137.38.1769880840922;
        Sat, 31 Jan 2026 09:34:00 -0800 (PST)
X-Received: by 2002:a05:6102:3e89:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f8e26860f1mr2241014137.38.1769880840518;
        Sat, 31 Jan 2026 09:34:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:48 +0200
Subject: [PATCH 6/8] arm64: dts: qcom: sm8250: add MX power domain to the
 video CC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-6-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nfUUNCUKm6Zb4Py6SMv77VBlTkgwaJH9oS28jOc1Dk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz/42infwTrTZfC0jKf9UU8d8d4IBu6hNwvc
 BK9CZM4de6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/wAKCRCLPIo+Aiko
 1ZXaB/4sy4mEKHPBEWtnwS9atKvpss2P9txe3u+AvL1ueKTA2ITvmHd2yEVNNHqece4CvRWcHfB
 2hJr+xnnrwuCJKyHYr+TuHgwNP4Fx0lXdhebA/SfxS2Pqx+PZ9+k5kfjz21MIi5ZSABEOS4utej
 xA1RS3Jx0snJKtq+T6HnpaGuTACSCkpyYQTp84jzrCRLzl9Pix/MdRqhTeUY9jUxpvUh++2ke7u
 e86TQpczIfBR/WfFWSzearruMIHDd1lRtEMcaQuw4eiGMT2NmlKWEQoKR5aQgO37biCuisK7mcz
 7dXC2CznQUHT2rThO47z/UF3vGyRyJv8jqoqDEoqmunpsVMm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: p--IQMUA79uXke-8ekfXktRQ6WyteCe2
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697e3d09 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8Bs0yZVtKZY9psgxZcQA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: p--IQMUA79uXke-8ekfXktRQ6WyteCe2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfXx7l06mLqLkEI
 8WjCr21D/gQmyr634pPTkNrJ6+9gHzHb+yp7DShoJ2cfOWeyDYaPqZo0WQ1+e7sdU7CXK9TIw5A
 mSnnIanYvh8Fq4VvGxsIJsbuzjx2cnxpbwPcw+RxJ6cknAk9s4rAqXtmD8DW2e0/eeVW0iO2p0M
 UniYoTfxZreSX0Muu1xWg04+Gt9QTmKTKAg+TF6wgjsonPomDclSg0qfW+SY40s6wVYaQEAPa/K
 pKteVrnRgPAIHBMMobZ26l0GHEGSRblAnIQraTZ63M+esONNiGu6JbNiDRRCrtLFFgVb8Suf31Q
 V7LTIvCf7BPGY62D1I4KoALtb8FRbbMch3un3hH671exxnL6t7s4kvpZuGJz97OdNAkIyo6nuLo
 2PocLYDySQ2XokzJt/yNPh7c9uigcuQX4zLYrY6FWZin6TAJ1jssSTI0F0u/4YGIE0+Sjq5MS9d
 SPX2BKUwwSQ99U/NsUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91383-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,abf0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BD2EC34E8
X-Rspamd-Action: no action

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Update the videocc
device node to include the MX power domain.

Fixes: 5b9ec225d4ed ("arm64: dts: qcom: sm8250: Add videocc DT node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..980d6e894b9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4374,8 +4374,10 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.47.3


