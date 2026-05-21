Return-Path: <linux-arm-msm+bounces-108906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECTdOShcDmo4+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:13:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4856E59D906
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380C530D04F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC65A2C08BC;
	Thu, 21 May 2026 01:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvtUmOFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEgEIMtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD192BDC32
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325803; cv=none; b=svS/EgTWkIfCxDBtaSSnm0P6SFAnzsYUhFvm+TsGIf6snYq293lZXctUUIe8LYlfev6YYOXXC2PA3u6P07nRMgyQoNc224TXBFO8pRCELn0jqJprkWPIz0s63pm0T304dwbbJbBaN9Vir/B4ARJ1w8H44jF20QUpD6Ni/JxCLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325803; c=relaxed/simple;
	bh=sHaXDiFQgCt9FlMExLxzDgxjno95mKMkDP35FvdVBDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHNMX8UE4no6VS95TtxOrgdyLJ8sjnvzssSXa74GjlkAAYA+rUno3kDsOFj9s9uLtl2/Mz/kFeFNoqNYbVYTa7ytCnqP6zWQmSQ8DPz/XMEBN1FA2PdcIk9snFnXCsBV4Sd4H+EMd7us/yxtwkxFBwXvc77qvipirDfPyiWbs4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvtUmOFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEgEIMtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KKP8ft316412
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6dRmKU+5SKA
	eTGqRwOTPOTFNGFIlyQSi7HHIupFI5YQ=; b=RvtUmOFagx+eHfpxxq6rjUTfilI
	euKm7aBxgbzV3OT0CzQHG41jKBf3tmXSeJpOqcbEkZRVWNEE68GMiOWAf5UpvPC4
	Y4DC72ITFVnisxFwPmHcGC3u7MTborwBg0CjY67UV8ox6E7Yzx7mv8/MAAwLtiFJ
	jzTTE0qaDui360rDvUh5uIsVP/gPkCK5KFRAc5am9HodzF091HDqb+ZbOzsOvNJZ
	Jy1i//VZW11+brqSO4IDNkclNsHarFAwFi5iQWgXxPwt/UEq99n4n9GM7qYdP+oc
	rq2Eju3JxMo4cejU+UQ1kWXaQUbAuAtTKpRszrjajfRwCZlysDM+wWP9VHg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qtpjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:10:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd5c9e1826so80094027b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325800; x=1779930600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dRmKU+5SKAeTGqRwOTPOTFNGFIlyQSi7HHIupFI5YQ=;
        b=XEgEIMtUcquy9MFM0oxEXfZSZww63VusKKrerY10ZF+POQghArIrBnMhYGfTfG5qWS
         kL8d9A5EiMqlB9k2+igUdhZhXsTxte7OF8/h1xH6WsArzRb77vFcCPON2gKeBWHbMsMS
         JMddp7AI+s4lirQyUFF6xaHQfVbI8g9DRMjz6UPYR8jkmVScEhWFk+eImoVRf3iuF9m+
         IIavycYnq/75L19NGtvsRKvF+K9rigLLnOdwZH32mcDM5ExxsSInWcBFId0yScyVetfL
         ekNDnfcc1QwKLrYnMviv3DMPE7I+5I8GbJB0v20dMuijKrSVNyEZy9Nc2P0PXFL1VJX4
         y++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325800; x=1779930600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dRmKU+5SKAeTGqRwOTPOTFNGFIlyQSi7HHIupFI5YQ=;
        b=Xbvqh9fM0rYTOi556KSECdDM2ry7LuO3eyutbueh4F44Lx8d7p0WJXpR+6MzWOibDk
         63NlBX1pC+x+B2aP6HSLYl30cwJ5qShuQbjbZEgdjDjibFh9vJWocWZXKladGQn7Jh02
         mzvYz5iFm5RFSNuFp5DSVFne8bbx9mDuJDRjwHVRgrMePRZt1vOX2SbF/Zg+Ava39vvk
         zyafycwEtfWu2SUK/oAq6OIhtyc4PE+twOcDsMryFJHvhlwZgvywywUzYd/7GHF787O+
         ouFUnuCzayCoTHFSa995+B0DlxxYL2+QgAltsxx5ukzfoaoZjKxUyGJ7k230l+ske0ae
         dPSQ==
X-Gm-Message-State: AOJu0YwjkhilxJwroqwelocVLebkAtx9/++cQj0EtdwcJKfomCrz3b/X
	pRTmHKBT/tuO2WGhBV7gJZ5UIdbswllOXiXHtmDI+rMEza70tR60WblEauPNNejiG2NRgtjbQG4
	0KwEtKe3MzLQ+ZSAq3pfDhsUOca5cM36CkTTWaaBX16ZaCL7wGJY2IWZQzaETZiOejX9/oSr3Af
	/g
X-Gm-Gg: Acq92OGlVeH064hvfbS4597rLgRqmq2v+VjktCN/FwwH7YESHB7seqTYfb7e8oy7oQy
	SjDRj6NYnRqga2E7T7AwqRiOrLnlPhlUlT6ZV+cVgj/uoxEI3x9ziPMMol8XCyF8i3+JrL/lHWS
	YtIedsxR9E4Nxqj2BwkUwnPEUx1hqEMFIHlSXKRmvFVKmRH0gGgf6lemCTfT8LpJzaxOkTpgsJz
	k/YxDVzjd/eRH8Xe2Kcq5ytz2Gr5anbOyoOfGXRaCG/wzKSHHsTWy2GEj/S84jyfzd6IQm+i4zJ
	tlsc3XSANe+Knap27W6zO3fsluWJ2p/96s1zeZ3EJRGqXtK+FuM3JBEdmBWcf42AhdVmmI9ZZ6s
	3a4uaigRV6zj7sE6hcLUmAx2sBB1r/qDRFch82yfHUn8MF9FNIa3V8mu2oVXps+tczP94KM6LBF
	vWISj5uhI0L4E5QWY=
X-Received: by 2002:a05:690c:9990:b0:7bf:b4a:179b with SMTP id 00721157ae682-7d20d50e192mr7151117b3.18.1779325800426;
        Wed, 20 May 2026 18:10:00 -0700 (PDT)
X-Received: by 2002:a05:690c:9990:b0:7bf:b4a:179b with SMTP id 00721157ae682-7d20d50e192mr7150837b3.18.1779325800058;
        Wed, 20 May 2026 18:10:00 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:59 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
Date: Wed, 20 May 2026 18:09:34 -0700
Message-ID: <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX05vyGTwGQktQ
 ZhZ9PMjE86M5vbu7DNt0HlZNfKScOLigZl7mw++4otHsQd1TBkA4rSyBe5zTJDWYpHT2twhg+hK
 OknAJapZNVLdUJpZmUI1IY+Li850WPc6M4wuZM79Z+T6g6iTGDRJnTgWI930xov+1OGsfU+qj1u
 TB3EoyelqTvW17z4DRD8ARP/FoIwnoew9m/boWw9LPv3TkwlR8vZm6O9FTOk0LxFOPAgg5WkFb7
 Bk+3D6HA6Ci63wL/UQVWGNtEhaW+grYmrJ4stOYZ4a96Zj4At39a/PaxCeT1boffcBx+6zHwH6G
 RyLfavj7YR0nsc+FDBbb19gfk1KrBje9pk7MdcKaEAYU9g9qPaIC5CzNm4bO0aU8cQJxBQ8ScYD
 6/lDVTjH/fWMolc/CBkTD40jtpWOAe7gJFpLdPT0215UMbGP5cM4NIjUnNWZ4CCXbQkRxTSZKQf
 HRlMYwpTMuEm/w9b6Cg==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0e5b69 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CbK1FIr4-MOfYfEwsVEA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: vXmZhm3NRdnZeZo4szO6ko1n3sHBDEWs
X-Proofpoint-ORIG-GUID: vXmZhm3NRdnZeZo4szO6ko1n3sHBDEWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108906-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4856E59D906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Note that these supplies currently have no consumers described in
mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
vdd-io on wcd938x), which can release them when the codec goes idle.
The board-level gpio-fixed regulators that feed the Type-C retimer's
VDDIO and other rails are not described with a vin-supply link, so
the kernel cannot keep their parent LDOs alive on its own.

This mirrors the same change Johan Hovold applied to every other
X1E80100 board in a March 2025 series; commit 63169c07d740
("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
is representative. The dell-thena board file was introduced four months
later and did not inherit that change; this patch closes the gap.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c..d6de4da02dcd 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -589,6 +589,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -610,6 +611,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 	};
 
-- 
2.53.0


