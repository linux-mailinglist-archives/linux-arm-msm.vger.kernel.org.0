Return-Path: <linux-arm-msm+bounces-80880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFFC440CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 813994E6166
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAF32FE584;
	Sun,  9 Nov 2025 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qulzs5RI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZgiIy2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90D2FE599
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699166; cv=none; b=ROUyzv71R63bhgC0KlNNwMJTOQOXBs3a85FMMv0o3uYSd/d0Cqo0OuZp4yrkFRJnsutPhU/tEfBOYPdfynkqqXBfNqpqZNGOslxrNBwG2xuPSokltZimDb+hOvLci1N6w9232R7Zh0j9dLX/XihdhyE+SMsDKeRtZrptObxsk+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699166; c=relaxed/simple;
	bh=L5z7An1rQfRgBI3aAbZ9RvjHkAJiYPaDq4L3GKStdk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxyNlw5P3SpMlTTW2o2BmS6srtJMtYBUBcaL2Dx9McMHacyCO1Q1MG0fix9gPRo2cvrV6JFDboejJylAG2dLY/QwYJ4jxMFPQkrF8ZOuYEYaUq5KeziCVozpUcC9Qb27SvbHit5FQmPtU9U6tefp1mXrvnrRVlRoSr+NuLhh0B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qulzs5RI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZgiIy2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DuGZp484654
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=; b=Qulzs5RIIcnCNQvw
	3YASa0XskvbnqqKy9Et5ewjLMICObYe5WyY4Dp9KLZDrt1fKTRPPJEVoF+hKdhnt
	1nVtb5sLIeeEsMQQs+OWfbBzB2L8tzmb9g3O+ega2uaFOsQq/GL0G0CrXp0NUdmE
	CU0hQj4rvUY69jpAJzSa14a5JbXYJt909h1ZPYHQTz0Lmb52KCiToZkj8gG/6ufp
	ueLmRn13RSa+g6vU/HD72oV0TCUjkXUWnjkwQPTU2PgtKwVJUKmTAGO7gVmtgkHe
	H0wZejM89vC7pojazs4Rq8swLhC/zCNkrxchus3j37ug7KIgNnp3YLDsW57qCyr+
	Ij4Iqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7a8ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:39:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so2718474a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699163; x=1763303963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=;
        b=jZgiIy2oAs2ilqRqsJYytbJsNvkw0Q9vCB+5tDijCJxacGoDk+8u2+mK6upMG1fXRv
         DUxLHp/iug9IihWlmd3dNMHVHHDd7XMVO+A1nEZ0Qd2Bahiutb2zQ4Fr/AkamhvyhCpa
         0r1Fv7P1P4UUwBoyhdp9YMrSH5TdiPCAvUl8l6ZgN/AVuVx9mt5ZURSnBkz/QKuqm8F5
         7M/9kryJsOej60g7FLDP91onY75cg4cSPLOYsBzYPxQK7XgP6X8INUWI5Wc7IVHGbrdd
         1dlV8yQVRt/NXW2iLVHIrj+U/u2G415OV0+gXdGKPoX6tpvbIh3O03CbWH8yxjGp2zNz
         W6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699163; x=1763303963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=;
        b=Tjpfl404RLh1TAPLeQXdVnmNwce1Y76KXlSimZ+mZqjFO2JW/QprMChgQuFgkLHyFj
         llPIPxfjk5gUbXexvoMt+TYjv0SZKO4dI4R6hCl2a4fVFf79HfIfi/s/sXVJzjxHGjXZ
         rRdSm2Qy0YD9RPYFmhIv9SB4TuP2gXZLHoOxlnHNtLy7pf6lMMZSGKbRRR2iHbrR/vmC
         fIQyY8FKK+5ex6/8yibjO+84tWr/A0JxBzjnPybRAAoQJqdRYRC2OisOb37Ih1U5M8B4
         de2D9fsTxU+7uEAqKS7YOkklOhbabHZwEegGYPf5SNRm+KbUrt8RLleoVhERAnaNQvai
         b3pA==
X-Forwarded-Encrypted: i=1; AJvYcCXDN54IYpAioU9itHJN39NHYzGCFJuqmb4tC888ZyybF0baq3hFlFrJd4gb5dmpfwiVC7FJABLifdw5GOGq@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBkk+eRb3tjuJfTTJpeP+rQ1M1Hx4DWzAZQgXtcbqP47LzskF
	QSZhtBikGcmmGOUvX45xeL8Un9g/ARZqD5/HKePUP0nuOMrot9nezqflqxagWUDIQusAG88M4VA
	FX1LfaRZkZhmkkWre6DDY7eEp+rBB4x/nO0RfJ2axNa8Um7pQFZdPerFXWe//xonPH7pX
X-Gm-Gg: ASbGncvJ9J3tiT53jaUkj8hQVEOFYQPqQcOefGA4cfgPVVnfLA/l5uk7tvddMfS/vdW
	6iPFiZgdn95yTlctwuR6Yay5i8BIr0VHaZ/D99NWnQ4Y4gMDpz39zGk3WaxSrI5QOcztDaRFkTW
	4UoTYF+ldL0CTQb3RDReJQ7QlUqmIxlqL1ghx5i6M8d2XSuSwg8qN6Ppr9pg6vT4HIR2/y7cjpd
	hZHtAVVR9QWqdlHc2QvcnukK3/cEeI89Lh8s+6Rgx/eUOELMaSurEeLcn7SHYZfd5ERH5MLZU5+
	BjAfI72eVr2ejFKv8vVf2MyIzobcYu3aUCwe+Y4MlmpT8XgLQFQnxJecqcsCxq4aUKM9Wfzd977
	Y/9fx97+MwCnd+uJSQz6auN9cwaI3Tyicfzg=
X-Received: by 2002:a17:90a:e7ca:b0:343:66e2:5f9b with SMTP id 98e67ed59e1d1-3436ccfa18amr6671645a91.24.1762699163439;
        Sun, 09 Nov 2025 06:39:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVvyQ7Ie5qv51GMyMWvjT+5IIfkhTgU5ORFWh8Z2JxruCZKThIUurXvRJ2KKFN2TNS6U0/pA==
X-Received: by 2002:a17:90a:e7ca:b0:343:66e2:5f9b with SMTP id 98e67ed59e1d1-3436ccfa18amr6671612a91.24.1762699162859;
        Sun, 09 Nov 2025 06:39:22 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:22 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:22 +0530
Subject: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=aXB/ZtnzKwJgS2fh5ZS7UmEMWdC2tYWUu81bgPi7sZA=;
 b=cGRfGGTemz5mYMnHzcIsN7x+3Xmr9GhPgiiKRvGsHEkgcZwXovPN8MabUz5/JPID3VZvw/NR1
 ZRO8BE+Wor7ATT2oXZpYWQAGPs+8aDB6Tz4FhHXDk06RqE5h7lgvJnC
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: JL1QmzAYWaxRd-zYaDMHV2u-EiYSuj8R
X-Proofpoint-ORIG-GUID: JL1QmzAYWaxRd-zYaDMHV2u-EiYSuj8R
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=6910a79c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfXwVoKG9Ai6UxF
 MOad7Pldgh3PAkNNr1DErKExVzDYg9iIrGyfUoTlBhTaP9PhERclks3YA226mb228AP3xETRbc3
 lWTdaQPHSUWJ+1vPPJ9cQEF2P/fbLkApkuaqqjtiCnlMudF25ujCOYDDmusvgaiv8mhjL1vOng6
 8trP0wSxSiUF3lWMaprk3+tuXT4uKBaBOZAReRMWE5G2hFs5OCJZM4YWtAUbNRt/E/maR8hCZ1w
 Ygz5KgzomNrhuNCq7OL49fQr2KfQtdb1cKCIJ+2EgtWc2guBePfDuaXY6EDfogg/0xzZaXQx04v
 iZ72psAMbm+Xw6pMl9szcSB5xSqwFWnhuHEPMDU21Nl6q9hfmd6UrHBfQpAlu2b9f00elW0cZZn
 Fjb6pUK2njSCQyK7Z+juf5B6+xIuug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -935,6 +935,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


