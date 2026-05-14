Return-Path: <linux-arm-msm+bounces-107659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IdPEsTeBWqjcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB45434C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFC4F30BA32E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689C626A1CF;
	Thu, 14 May 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnaUlrBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Sq7VMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ECC384CD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768933; cv=none; b=YY1BIRCUOKt6ehD0BuA6S0QJyHIgCDodVjB83WAzJqmP7ovYGDKRlFY6//zEdI4JQ8hDNFC7ppO27GtazwTTfcHZlDj/cavS0UShxbn23+nCdBlye7PKhofS7tBxsxZQPn8OlRA6W7oLkeBmLbiuOEXnKocX+DYI4bbmZkIchqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768933; c=relaxed/simple;
	bh=hQWk5GnSgPwZS2e2a67KLI3RcOaWHf38dgj5HvuzzxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vt8MnU206phVb6OOFGgPcIY8NYRIyT4eK/5jGcA2ON+tAWOsLKNXUkPDrojG8+CjLEm0IYtSrHhxG2felGLMeRhfcE/ISBVUFJ/AlTxz3rhh7MJhUSRgAgMCxGSJkA8YEKyRi4gT5WUwLrxezYBjCiw5525+D3FyuLdkRgXN1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnaUlrBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Sq7VMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EESpug1262480
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=; b=gnaUlrBtcmS0yLMj
	vnRNkqwnm2zN+h3FF5X4ixzhDVvpd0mG6TP/s5+7fOYUaDQZRnLmj4VvKeKKpoor
	op+2LjuHq6qdeQMCZuiU+0S53gGhSsTFWqqA0mGixkqkZVw/2Iwo3KQh0y+IPAWk
	ATJ96uE57gT/luf7y5L/5DGSAdXu7nm6ttZ17nhyo7g44pryVTy0uJNfUr75tmG3
	0oI71fdz4XFj2csQjgQGHxshAoP3Sc5CWVps31rAs8L3XSiO26Yrc7aapFcpxDU0
	+QpKtMxx/bLpQhrWpXP9d5gSgb5F6JTht42+rejUgKDiQMAEOMAHe8ojhNEAhS9T
	jQd+TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5g6r000b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso73544545ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768930; x=1779373730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=;
        b=V2Sq7VMwpC8x3jANRCDeUxejcU36ry6+wC8p3xmajwW6a9w1xPzMQrhSugBFQmAOP6
         DzCYLgH+6i5OJqj26pfVRj8D/nf2nbE/QEJu5yUDdyN091AJyLPybfsM9yjUpSYFaWN4
         aaDQvferhYxTbrx2di5A8OqQIGAe0Eu3XjaM8jZV21MWNgPUkJ7kEEJcAkQ9zXXWndRb
         Fc+HFD5XPl+sSSf8nB4HpV7PWcfi8rBhI7man0DEOc1RIBg1Ua0GHUyAMdSBY990bRdZ
         3Tz7L7i/1fS7/HYoIQO4h5/JIz7vx8fNV/WruF6h5jqIsq1wry8I1OmZcDLmBydAWkLu
         R7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768930; x=1779373730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=;
        b=eFuS34Ysd2JvRORrJFnRpxv3CbdYHSFXy+p/H7Vf+SyvkmucApDl1J5Dpzb40bQH08
         LSVXEVFdD2nYpCDjq8hClBBzKafPY/I0cag3GqL+uu5wG3OX8GIl6QYXco2ocHjZguNQ
         kT2quURbBEj6HdMK2+qCfqZpTXKubf8YWln576qmYl0KC9v53Bs3RF90ISNJqsAu1DVS
         Y6pudAa/UYV8/otJ4SKYuaeA/dEQvdF1PA/2ViCvhK9kFP7C741xnnYesgP5jSYnOLSM
         jM8/NJc6ia9EW92oIaY3g8qA1fsr7gx8h0lxOwR3Ea5mpR8Fw6gxaC4NDfoKS/83dT5z
         66eQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rWWyPdGVgkTFqd2UqjETFknoWlrnln67pT9ozddCwXr7e0Pf3LMlc8WW2Osyitl8XIH9nH6jwvlkPh/48@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUa4zISH+PWwh4kzaMi4PoS/cxQzDpYde2Gkbpf7zdAv0gTak
	BNyG65dK4uHeJnRUnxt2XHt7ByTbpK4yzKmvAuu0jKuqRew0hOXGV/RHrtkK7wvuy/CMXEmCB+I
	chdA/gHSH55jHEUaugOmR6PKd/6pAIQQfPhog8tDHrxT/6pNJ17dfe2h1Rnj4B/PL1JPc
X-Gm-Gg: Acq92OGK665ZLTSqo5hsyfLiF3m7A887V6yngq6POSiGW6SuxHH1+Zw6n4p1InuIxVn
	dDuDlByNzNtBpWwKmNuhOGBEIc5LVK5DhAh4E1VM/N+woalGv89srpwzt/E9Nc+xLyWmKC/hF8E
	sKwXx00smkyAltyo/I2iupO8XH5ttls/hOJ59xAAwsgq2eXFoFejoPOQsAfc87WlG93k5MLrWWb
	LSHVns3rC5wQ03bbz9H8R3MhFXp12G9vF9FZnImpr6xo9vaods0iWyeGYAv7tbmiL8nnXMnzpwv
	rGLDhr5iT+nYXhryFKAQey2WtZf+DIYTA4S/TZL84LzmkBVMItrMaQ0tG/fsITqn+Hp2m/718Kw
	p+e0s+hb/mx6SCOXWbpbHV5Xz9XAjhi+c4RFfY6rv7UHztvhN5DfBFyRw1g==
X-Received: by 2002:a17:903:fa5:b0:2bc:f3f5:a6c3 with SMTP id d9443c01a7336-2bd276f2a78mr89745855ad.39.1778768929780;
        Thu, 14 May 2026 07:28:49 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2bc:f3f5:a6c3 with SMTP id d9443c01a7336-2bd276f2a78mr89745225ad.39.1778768929231;
        Thu, 14 May 2026 07:28:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:52 +0530
Subject: [PATCH v22 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-11-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2346;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hQWk5GnSgPwZS2e2a67KLI3RcOaWHf38dgj5HvuzzxY=;
 b=8HTGNQ569NTCRAx7lz4yBrYgkXlEUi/4SOkrgYaKZRigAugMeSI6jpFJU4nygrEPOBC4fE1SH
 3jYOuzc8rIMDsTnHivJRdKPKjx/MAVpDeDU87PiKaiePS32/DUYOZ8J
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=d9/FDxjE c=1 sm=1 tr=0 ts=6a05dc23 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: AE4X0AVa_X3dMif-cHv3LGb94u0jACQn
X-Proofpoint-ORIG-GUID: AE4X0AVa_X3dMif-cHv3LGb94u0jACQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXxu8PABj2GCQl
 u+0x9cPFagsSEJV6inOrxEem0R1QmtocFitbCpgtCIjUn5peVfi1G7eSzrvbZB535hoYof5mnPd
 li8PpWz4xH0xNPNL/K7yeOuTKDlUsK1XbDTT1+hKTVGFCj1FnZsvSnAGkBqhcWRGIK9vU1XcUb/
 SheGWXynlgtJL2QT9FYGcTXrFVmwGarEyq13TYMrErE6wsGexiFxG1vPHPNmfQtmTjasKrqemn8
 u5fzZx5ZLhKUFhaWpw+YGpwcQjWifWTsxFpufHJxPKw7dCWic2u4vn6Az9aNkgfQ49thINbhvPz
 b/XeR3gDOZ/CKfBEmRUAk2VP2ies62tCP3qektcysK8ZLh14njN2MmbpH5aupV4a2U9H8YKGDjh
 gWIiEfucZJjUYRpiYJhFOQrlH3TbAKMNxhjEBv/OW3co3pw2CEGP2DnZV+IX4si8wsLmFPne525
 aZ2rLgFdUdPyCRkBnPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: 21BB45434C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107659-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595cef441f4bd5ba21fe133652b97c6..8be0f50188839e6301e33a50948a523825fc5a6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -758,6 +758,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999bd89e030a6685e6b84e7283e866c6..2a9ef170f654b1e270b1fa6d4b861dc0c4642760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 84a1e5ebbf5e58b2fe11978c3af08cda614605f0..447d80aec5bfa1fcf11a933669f4740ef310c9c2 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -559,7 +559,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


