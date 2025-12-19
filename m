Return-Path: <linux-arm-msm+bounces-85809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D5CCF431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E68307314B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0263009E1;
	Fri, 19 Dec 2025 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMMTDI/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMS6zNlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9FC2FFF9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138451; cv=none; b=XQtlb/7loD2Sjc0KbWnVGCpPu+X+YnoUbemiG+7ESG4dhYEXVmdvM468FPBDzbW1r8a6PC3o6wla5WGRqSX9zD4UQpN6UadpdbNfmfzfXWtChf9zkmC4IHGvmuLn3kKy51NCR9EdUgiHvEfyIXC2X5LYHUgXDsugOfzEGhJRLu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138451; c=relaxed/simple;
	bh=jfBdozrJCqq1xPSefv3D9/3EIiDo3xbbCnISBzwCQjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtWwtK50RWbIznbR59xWdpCrAHs/UHNMAvNUguVkyInuV9zo+STLykzdZJAR/fqRBH3vPC00dgEc1gMMjxw0DO/V59BJVOq9Q8g3/LLndolgk43SjmPQNUElUtOohWhnhL/mTvgHE8iH61QwPf2vHVp0INVr0nPdUhOr8adJqxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMMTDI/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMS6zNlD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cQNs1771760
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0t0lAgDoMu0vZ3qvwSdn9GRCMh13Jv+nIxjO2gvrUQ=; b=SMMTDI/l4ok8umcR
	1PPNnDOrBLrTxDCqWrQUlNaHnVKBatMZKN9RzcmE9SMGqkAXxjPpjWRcfCyDJ0rS
	G3s4nsTMIS0vAN24Sm9bw3TQmiMWCsvVBhcLLIAFDbXd/WYEbZnYhnzeVdV/UBGY
	c5HmibmE78L52shhaOnKtaSem1+HgxymNDK2cHGkZgm1qClcIHTQALoJjujcwzQD
	V7GY/rC4Nn32S831Hc06Ykj4P90g5TTvGg+zL7FmCxEQp6PsW725F58SwA2TgHNE
	ON/MPXn8yxzMyEUQWbbqSjbDrrv/uXvewT7T3Q6PDrPvdVuQIV0esQ00r8nSTVMo
	77nSAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bj7n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a5dba954so26657661cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138448; x=1766743248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0t0lAgDoMu0vZ3qvwSdn9GRCMh13Jv+nIxjO2gvrUQ=;
        b=cMS6zNlDZ6xr8+HNeC/s6sZhwZ37wyW7K525dIZFa0GPFmR4HNjGYm4rhzXOdp1c6S
         LB+/lr9o2hULciZqINnZctIZKEnn1x4eVWih9qmiM3TynBtoSEmcdBxoWpSUFNlBz5fx
         r8X3IR69fo6udfigWjiZIusmTw1C/scPsvnzVN2drKyoEcamDvB7ihIA85+539u9+6c5
         ORb7UUbPJUSjlkQQrfxvz1IfSCHMKPmRUdhJtmkJrVgA+ab/1euIW0jQgu7WtZgj9pX2
         oG+arWaUKHNR8gS9NB2wP8EIqK6Rrm7mIcNHpz3uhcZvcrp2mIpyLaPXQu2uooLatQX4
         3UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138448; x=1766743248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0t0lAgDoMu0vZ3qvwSdn9GRCMh13Jv+nIxjO2gvrUQ=;
        b=kywBFPj0R/XmzkkbMNdr4+SWAuwOEIlA8AuXhLVAe3GgPzNTAdY4EI03mbRELHALc0
         t4GPBb/D0NnW+LEwwVEe8rcQp7Kk1xRXvjZSf25ghIXspWJfeAeEq4N1pKBGubhL07yY
         02dTpg1+QVXQjwzN5SxhAXFRfmoQ/KClMjiZJW4l3Zl790wsxCHUJEgBUe9a9BrMJa/0
         XQHvSqsSKUN00IeDEBJpH0aj+NfDY4niNa32/Xinpi9u/dpbBHxWvIVx9CUhUmMBfkv2
         IyenxFDfzDXRgJ0Mfyttf5hnnPaqkCvjIZ2wMZAkdwRfDuiMpJrZzp1Us7A06ZKfrHJH
         GAAA==
X-Forwarded-Encrypted: i=1; AJvYcCUTgue2uKD/b6kmPeGT92VAINE3KXzBGIUZZaLGZp2XFsSzYG5HKzonl0GyVdWgXnuqnS473Ms8PSXjjcof@vger.kernel.org
X-Gm-Message-State: AOJu0YzidZCC6G1HqANe8tZMfzszzXpOANJ10okRGK7YiNya2c4DrvdR
	YAq+f9UskxOWzb3VdPb39b4OjY17lqRmXCqGlbKaxSNqSC3nHpcCl8s90BQxDh1N/MwOg5LUodr
	njUAJ+HAtSMVmGDS9gOZnoX8oIEHKIKUhqC0pldMuYy3Tuzzepn87euoVl4NWlftwVO6w
X-Gm-Gg: AY/fxX5tlBs5PpnJObTjOVG44ADohN1yX9EFuKQxczOUhKaROuNU9onZ3ws8syEEtXv
	yd+mzOq+LIMBt1qa5gDxUNTOQfUlMo6pBEgUimmzkP1SOjyCuaBwY+19JtdkmdyfLT7gTzoUD9F
	1tyLoeVgfSQigmBJ8BP9jwFuZmIYJCph8a6PZAvxVw/wUvTSfjqAhq8LexJW9x0lDP3L3V3sbRW
	TcogQfuksvyPK59sJiJoLJyV0pteQ++srbQsBNuR9V3LhrfYDyN/zc5GBpmEwsukT9JW6GeHbia
	A4whDNY4znP2R3FOiBiqPeQTuoQ/+jN+Ixx+2G6BbGFz0yveoco1IXtkryGhV4ROiiNc/fSW7bo
	SJyWA2I+1gJiq72g=
X-Received: by 2002:a05:622a:1826:b0:4f1:c698:6e9e with SMTP id d75a77b69052e-4f4abcf1325mr30832171cf.27.1766138448306;
        Fri, 19 Dec 2025 02:00:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcaBHubuTxPSQ6pPl2hynSeql5WWqwtCsuKEASq2ZnOG+HKVn8ZCNteufeRh3ZN7plono87Q==
X-Received: by 2002:a05:622a:1826:b0:4f1:c698:6e9e with SMTP id d75a77b69052e-4f4abcf1325mr30831461cf.27.1766138447704;
        Fri, 19 Dec 2025 02:00:47 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm4106563f8f.22.2025.12.19.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:00:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:00:29 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-2-fdfc6ba663e6@oss.qualcomm.com>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfBdozrJCqq1xPSefv3D9/3EIiDo3xbbCnISBzwCQjg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRSJHkguFuTlnmg9dNW4nQ+9zLCD3YIoqz5mRk
 eMZOhqFUdyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUiRwAKCRAbX0TJAJUV
 Vif9D/0QjkhGwIiGapebTSU4Z5ne0d8a5++zSccsAw3NdVHqYC4LLLLJ/SKNPyG/o9UwJDHo9XI
 b+LFS8suw+oqiymWAw3VtVqEhK5Z9wouUk9yCBezqFChlQSnG1ilCAYKlx+JHpYdBTVbivoTK8k
 zl2+82cLxzeDBKZcdJrYP/xvPTM649rwLONu4fIO5wIWIY/J22ZACB5Krwwu0VR4gZLUR9rE1su
 vuKefY00dYd4LUUZP8FdzW+YJzlIreMFMIr25IzbcEjif1QxYlmoIF+P0yZ/4VET1l7TWOMPf9H
 f8dn4pvPzPfsYXPsiX4KyP7JUh4xc08ixNZ8E72+wpLygHPwOLs9E//kfhMbrMygKDKEQ7bz/nY
 FXDFYrDc6gQ2njGkSlyonlgw7YMtmGuWoZ11rQhEQK+P7CRvSWyniv6jJJWu/39jHUqpTJN6My+
 xyvGIWa9FYeL5tsHcmWVj51EBvDOyqLAZ80xa4X0PyaurgHJhaiKrO1Cc//OnxEc4nwdQXQvcSs
 wODaePBetoQwV3X89MqKKwW04i7vdJdjpWzSrJi//44Mfv+r0W9LjgTSz5HGD6lnaUTopAdDgj8
 21l90Bz5LaXmw/Dai53NkDQiiJdpR5JdRm5gs7eDmqjlIIDQ67BbowDSH0eQh5WxHIviFOGFrs+
 PyQJE47aXu/b6Ng==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: pkvAtE9jUgZ2XW3owsVHNaGBbV7PLPCb
X-Proofpoint-ORIG-GUID: pkvAtE9jUgZ2XW3owsVHNaGBbV7PLPCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX60m+8fW66RAG
 vpVG01tGWTFQ9Ein3dfHveaP5Q1ZdM6K2J1iY4v16IpUQPMebLs0soF3CaWEzceDZbHogulg6Mi
 s4fm4F07xYIKabBv1OZMrFXUaV2V5IA/5LNLnxH9bvlt2m/AHJM84EWylX/IFFR2AaL81II/GNL
 BfzdU12vkrCwcth9FXhaGjCFKxbX96lGbKKdYO82p6lUDpuFi5ARet56yhkOhb9fr7HlUy81Nmb
 lTu3bnI7dhFXiFjLtFIHDAn1G98wa/R7sLwoqW30kOik2qFWeJm9/RHAt/5jVykdtodeK/tX9TG
 2mfWB2cybyPt8nmpqC9uaqfnio6pKCleJNFpMbrpIJ12KGJbOe3SoiK9Ee9esfTwwuAn56ZSTZ0
 se3V9vxp07CAJ2Gn9fxIsGSOzEH/LbGqB6K/ylq1IFt/hJt792hQWcDViW8BwHOlBE2Om82VdjM
 42FlRFX8YmmHlrlkR6Q==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69452251 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bM2Go8iWHfDejGH1_8QA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190082

The watchdog support in EL1 is SBSA compliant, handled by Gunyah
hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
block, same as older platforms. So describe the APSS WDT node and mark
it as reserved, as it will only be enabled in EL2 overlay.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..b65dfad71c2f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -8302,6 +8302,14 @@ gic_its: msi-controller@17040000 {
 			};
 		};
 
+		apss_watchdog: watchdog@17410000 {
+			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
+			reg = <0x0 0x17410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+			status = "reserved"; /* Accessible in EL2 only */
+		};
+
 		cpucp_mbox: mailbox@17430000 {
 			compatible = "qcom,x1e80100-cpucp-mbox";
 			reg = <0 0x17430000 0 0x10000>, <0 0x18830000 0 0x10000>;

-- 
2.48.1


