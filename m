Return-Path: <linux-arm-msm+bounces-86557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F8CDC096
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EAC6301C3D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87CE31A558;
	Wed, 24 Dec 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGeNVfjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6I93Zj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0231131A7F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573142; cv=none; b=QY2EZy06kmtHtWAe59Ydcjeh3UkmOAfQg07fu0qMlutglufGoRRxtDnQtqqnM6HZn7NzlxH00NWtz9KFNMfw/eOc8b3qSD1HlGjE5NNw9L0XkI+950BrbHWD2lus18TRZWUyqnTIhXPDQh0IfBpt7FnuwXNQJr5CfD9jhNlON8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573142; c=relaxed/simple;
	bh=JkK2WDxkusINBjMjzR+mpI8unpAS4ljvfOmxAvZ/otU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owjk2uZwF8ijWuTQ4UnOhAyGsUi1QovlSV+S4ZwpSiZnKClgj1LaJKoMgjc/1LNHP+pzBHktkwWLrm6LrWj/c8xPQZNXbVX+QlfIn8jhXfNv0rtS9yrqEluv83Y5Mg0ExjagBkbS7GhC2jRQcFgy2zH7WnrA0JzpL42ZsNjkl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGeNVfjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6I93Zj+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO90v61700441
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwhD4Sli5tu3cWY9dzskDnVpzZLzo/kU4OteQUdf1fM=; b=IGeNVfjLNk7dQ9bk
	EfMH/rkwILR+kugx4/S7k5oX5C9pfB6wnUy/HrCKrh6MIJiyfQf/d7BwZhTJrhwc
	6W+ZhWYE1284j1nRPkV4uz6Pb7TEJ/5Z3mOadRkVgckfWRmEvWwgFnWThz2oitTA
	2Tvs/RfKKkFUijNm63h9YLLM1QPtLi3+MYD8olYS/bW/R9qOTrb03y9idej1T54j
	xsp7XfAM6R7bGHg3eVZvb4PTfqvlNW8Jt34Yxy566zfCWy9q2AlRRTFODU1wxPJc
	iveV+IZ8p3SPHngm4/wlKMaMZFQ+XdeVhayfRntkDXmJiGnD98lj4Znro40lXrMS
	eb8DBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jufdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:45:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea3d12fcso312054385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573139; x=1767177939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwhD4Sli5tu3cWY9dzskDnVpzZLzo/kU4OteQUdf1fM=;
        b=f6I93Zj+ik9gOSzKyRQQ+Y9WOgI6W/nMrYnBiQaZsgj3MxyosbRRVGfdYmzF3tn0Fb
         q6T3wQjUnnh+VjjTa+cCHfzRAFEzVd5z1/ygtTuEv+IdS0gkLtc3xHXgPsadCKiniPwN
         dIWGGM14pttkjOpmJwPXE3IwWA/LJn4Jewz/bg/GBB4mvgM6YsCqBtxq3T/ui6F5YyEE
         yDbrxFfCL1L4EO47ZYIvhBvDCdObeivTTIVWODyce8ULFin6qy+o/dJOrEYf1UaXEoh/
         BS0NcnwF50iVrgHqAlaoUBBdi0/3OrSBhJHPWG+tusjdrHCRuJfX6gDLu+QXkOT04jbJ
         Wc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573139; x=1767177939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwhD4Sli5tu3cWY9dzskDnVpzZLzo/kU4OteQUdf1fM=;
        b=Rm9xxfZFjEHUXsyOOqj1GzIkwQbiRXoBQSqetn7So6q3+ujKGGJOZOlUKXOnv8/WQl
         iJyb11+zCQ5AgZZjGNDvD/vsRjhbZ83H1P67VQbzwC400nwYq1KhujwPVPK3dmrzNU0x
         xBKimSRYbPkye0SEgHBMeubZh+xSuf9sQEsFrDoYTWpzW5Z/CUQVucA7MiCUZ0blcXcO
         iDDisKMhDjvASyJnZtPnsukzfKGWwxtwM52Z3SLocuJ34cDKQG8bTVHm1Pg3mzGhPdy0
         VyYRoTxa1wICi87zUF+mmn6JnhxrvpRxGVdTViQuZWqYbaWJ2PEzHI6PSzqxo+Zm/zal
         KZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCs76qQFutMC3ePxmGSaHREJgHHEaoAaOmB0DYC5ct7JIFSux1NGRaeUXZuWoLcE0Sn25+qvWrY2IZAcJl@vger.kernel.org
X-Gm-Message-State: AOJu0YyANPHSDbXfVi/N22wp0IVVVotBE7mtH5HcxMawjljZ2pZaJNBO
	9GaTVcK66PSMITVULbu0eAOWInm3R5Z797wZDskOGrUsZqtQoZ+DfoTKg5rFs3btLOgkrRvqA0T
	VO23rKqu0M0aFktilPC4N9eqCJnms2y9BsrizXs/wul+dmaJ7l1hTcVT7ydeyXxJEGWvn
X-Gm-Gg: AY/fxX7EJsRnkPFDM6vKvfds+idA6DX8uOOwSi6k9XF+fzgtB+lpNhQmzPdHz8vQsnR
	/2Hw85PNDA6IN4K7KS8cpWMc3uZo5nBomh3M87iQHz10DJZCyqqd5PWlzpQHHf3QT8CjhIZBRY/
	GqTL1BgKhcS21eZlDncfzM5fMg3UqqUTdGA7drWg9jNc7+Hg779n2ej33XYh9EX+s0dIUCx94qE
	QVy30aHfNf+iQQYuus4XWT0KR2GgAE9QyfiUhRvKk0/M4JqWpH0iQs02+TrbjJdGlQm4ofFWlRK
	FPc2P946LaLgXoJi+NgCECMGJsVZTFJoMK8wjGR4B0msbkBRlLyqw6SvKqFLnLb0WL0F0qfzaGF
	KspP5tUzyzF2QvIE=
X-Received: by 2002:a05:622a:4010:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4f4abd1f227mr261556791cf.35.1766573138387;
        Wed, 24 Dec 2025 02:45:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiAkVEc4Amsnhds5LCOldsnh1e/WxIElKdG8SFR4ztTSNLfUa889UQ49m0YEQ9WHYJlZXwBA==
X-Received: by 2002:a05:622a:4010:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4f4abd1f227mr261556481cf.35.1766573137831;
        Wed, 24 Dec 2025 02:45:37 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm31409049f8f.2.2025.12.24.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:45:37 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:45:21 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JkK2WDxkusINBjMjzR+mpI8unpAS4ljvfOmxAvZ/otU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8RJITaqw3atYKpkoFjqaAAaxq71QkhJ6mBWI
 IDIuKyW3EuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvESQAKCRAbX0TJAJUV
 VsIGD/9deRhr014A8lIKLOSlzhgeKB3Um791Qxvzt6QD5dj1fGWdXKvUX5A+9d37xgAaiDKmmwR
 RUBTN2kodlxDntXhMXUaI1cJRf1o4fap++OlECVaPsJgV8dgSrMRknsyaYRDDWN89jsJZ756Hp4
 iki2iRDFak/Dd106cpiHRN+XS5V+oeTKHbdgF1EQW0+20W/BXRkGRanVb1aJqQHuGJE0GEqDd5w
 jxRlak4K8N1UKWOc6MnXmadWcX159X764z8K6wXVjqQUDhCC3W8Mtfh7NmmF0XgELnacqvpzWVW
 B11woj2HyhyP8u8Izde7Tbdcodvqic8n0pTevEDQ5yVgQ21iQe2I4gO99WRUO6yuDhlt33/QFEO
 eOhEzjJy9nUBSuEdw8JHPPntEFaQb6aMNCeVqvEo3dmDYvbdC1I23DJCtQGTZeJHQJEgLABKFBI
 YQl0/ya0lprtfaxWFfMRvh2paG+1wvfh58c33eqIHCnyeSwlvwDBjWWAwMw1ePIAGMTuJWz3MpT
 a6A0lggUOb07l+RvvCCjX9lraw7jI+RErDZsipgStVr2Z37vo1HcWnh3m8jx8ye+B/lp8mfMTqy
 o8JgN6OjJI1P4s9gltfQhtmAKi4BjaGe++lWFYkRtzt6ChPg5/xNnixXY53FcvHaLEdZScYDdh3
 9iF3sIqa6UjUN8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MyBTYWx0ZWRfXxpuR3hmjPfPg
 7U8eFFgk8rzhwoY8+JMF4IXIfG+i2128DJJ5i93FxMf489QXSof+OUeL8rInrvnzW+zch5eIMBH
 94xle65IurYLjlWn40Lz5kgfAM53Xpx+UENVS7mH56p/cW+/rEgldwQq7jENAR4KQyWBUghQJF3
 +totTV5JPB0M8LtKqw+XYisfKT2vMoREF2E8jIuM1wqT1khBJDgMMiq2IYaltvAV7b8dPhnLXe2
 VAJvNIiJmIpvGPLFqy04pyhHmWOdmUVrAPL88oQxw5Fvz4qxmbZDVSZKF/N4yyUafr7KdeI2BKU
 OPLPRPDKKwiWs78ggEvFgd6kYcT8MqnpFwB00RVQyy73pE5njwpU+G3v7nKMXL9oltK9FdUIt/3
 mqOkm///loFKn3bPALNadhHJszFi8Wsoq7YuVwVdD5OwULRnxuCXUVCjROe/+kHVNOFY702hMXn
 wXTWublfdJP3AWYXecg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bc453 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bM2Go8iWHfDejGH1_8QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FHWRhbM7mC2SRuMApZ1sEXSpuQ_gNP58
X-Proofpoint-ORIG-GUID: FHWRhbM7mC2SRuMApZ1sEXSpuQ_gNP58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240093

The watchdog support in EL1 is SBSA compliant, handled by Gunyah
hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
block, same as older platforms. So describe the APSS WDT node and mark
it as reserved, as it will only be enabled in EL2 overlay.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9..7a1f7e6860df 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -8328,6 +8328,14 @@ gic_its: msi-controller@17040000 {
 			};
 		};
 
+		apss_watchdog: watchdog@17410000 {
+			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
+			reg = <0x0 0x17410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+			status = "reserved"; /* Reserved by Gunyah */
+		};
+
 		cpucp_mbox: mailbox@17430000 {
 			compatible = "qcom,x1e80100-cpucp-mbox";
 			reg = <0 0x17430000 0 0x10000>, <0 0x18830000 0 0x10000>;

-- 
2.48.1


