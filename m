Return-Path: <linux-arm-msm+bounces-107660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEJ4DOLdBWqjcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:36:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A53543387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B67973077510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5709410D32;
	Thu, 14 May 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeQM63iu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQ9SbyOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062E40242C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768942; cv=none; b=LUqmGLPCkcw9Ff18xtOse9yICzJX/ugvsSG/7relx+XhXFSKrMqOSK8Okg9R6hgoVrEm2lsakjGcwsESCj1lILngz/jYGag2saV1ZkxHqUb7jzCyDLo4dEgFI4oofiKFAGuD1cdWjPVDC9uTeGbf5RMrmeBHXgZZb+Y79y5OW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768942; c=relaxed/simple;
	bh=0UqGJToy0TBXJ6WPFU7lKlAFIhpopdAI0eFI74nJSqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNvS29hs+mhxLtWdgVQ+3UoyIHfJKgsu491ZY/DwDV8r1CZjeNaF9q+AaTNThMrTB7hZZvT9m1owwxq8z6wBhaxShG509VDLIQZZROGSQ7X7ZWHC+K/NS6DpUOOWMWoalfmHPxpy7VmM6stfRGV6F0ry8gP7ADpyDQrfsp+5z6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeQM63iu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQ9SbyOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBePiD1717719
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=; b=QeQM63iuLk/7LG7Z
	M4Kp+xld3oR+w1BZnykV7HZRxxUscupSqZWv+NxtomStZgmTLEQbV/Juf8JezgDY
	DR/VvbfEebXjbFVtGyih5I0zB1GzYG3v90Z8Z4kojHxRv7nIKqMRS/XUu+NWwkLh
	7LBaeLZx8HkF+1WxfMypBu+WCdi6fpDu3TvOtPJpx/Sre9RCmTatPUJc9OJKs7A/
	wGyFnlv838TVpKzz0wbYHh9ltETQq0F4c1XdTa76/YdtCqsyVMYkE//dPoKsoTtt
	2Y2MVpBGnMirHmLDL4XVGWp42GkRv9Y1fBXzpnWR7J7wVh8AVkpjQYL+H/mSeLSE
	56VYUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hwbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:29:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc977e6aedso54745785ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768940; x=1779373740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=;
        b=KQ9SbyOZ0hSJmFobCdfHsqggcT38FotnsswP4MMGCCp9uqNfVcfgF5F4ved/eXJ0Sf
         yVZIJYqRgqHNA6RJN+LuG7yHQfGqisoIvZV5RxVu4+VKpA3rdKE8FdWV1559WLf7lCnU
         xwmqHThzupb01p2tjQIMOfdBI29vncp8oFjy0MAHsnqmh8DF5ptFx1BufUM+dvh60wrv
         ze1meLkGWRtL8sXszt9Wi7OgskwGsU+38Gj09DLz0SB+ft/axrOExS/WL6tfjRdFJnD4
         lRs0hnOld+3H1yXKcrfL6TgHjpqQ+pRR5gyHOfH6cj35702oIFzsZYlLkXTI/WtLPbHD
         zYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768940; x=1779373740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=;
        b=PbC/16k0aGD5YWYRaBBWLWsg14YQtnIvnpV+C6XwnvLMhuBB5BIfk+Pv4n3tdzjdWr
         Gjy9qyRd3nG+MYDMiixTkLqvcMuTk9Qv2/+vmyc0+TrpKtpYiGfZl6gcA/zDrYei5f6g
         CkBPNKwveuGaDS2yKlVf1qSOWWBiuwiqYU3AKbgGXCmvQCPOn1Dszvy1vk1dd0thPFuX
         KTn7TFFnGAapWDq8yr//dfVM7d+pwgsFJxDnNAn34oGsNX7hQyeJ3pqikASk1xLZmZGe
         vu/3Xc4JGUwIBd21BDyCrx0VAzLVGK9VJUVjolq5lEsYdRNFWTUgzXfNQAw8FW8PVNMF
         MSuw==
X-Forwarded-Encrypted: i=1; AFNElJ+5lipobHZbKrGasESbYR4oJjVDgPpOHXepTFbh71jFafJQ9xmrx8vLSt4mxjjS77k8nN4H5noDERL9UK1A@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFDyFltPUUhxwVpQDnyVLwhEiHGDY7oGqsnUsWi6VxjxInbUz
	sf8UqHS1ghunHXWGAvwGfTXIglrnU4JD651p0OlCxa1uOdVLOPrByn2W2+VldaeNZu9jrsKnF6L
	1qaX0UedCsmxfjbqVq48/bBECwTVwR0NYCTfXSv8aiQbS9EkcMn3s9ggaXnF4ADNuMkUv
X-Gm-Gg: Acq92OFFz+m4m+sYaF9delewLblP8/0oSb7JFdZt7ErSfrp7sX/dnZbZYhOaiVASi4T
	yMPl5DHkbJgWsC54Yo6xX/FI95rQHCVgBQrT7e7LYzw9IVb/7S0B1LIys8dsmwu0SSyikBa9u6/
	R0qayKbI/jl57G1EUHbxmbf2hnTJ/PRuLfIJuFF+VYyQVXlf55I1iC3xWfIqPR4rKTLxjwLai54
	KFbkzyT5OMnAwVgpCBPOoVx1UVf/5kenZOR5Prb+Vn9aGjyPyrGRBFHN7NNL6cHRxj5Wrlo0vt5
	0bY6qSkKVZaRnFj4hNi/shxHG4m9pq8ongfSMzgoksQHJ/dzZbRKKs9U2pUyRbiRevfMHiG32q7
	/Rv1yYeBuyfPNaUZO+++uZ3EtmULtbw+TsrcsWT5I2tRx/H4WZBFmOOKXRg==
X-Received: by 2002:a17:903:247:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2bd27291ba0mr83863345ad.20.1778768940004;
        Thu, 14 May 2026 07:29:00 -0700 (PDT)
X-Received: by 2002:a17:903:247:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2bd27291ba0mr83862895ad.20.1778768939331;
        Thu, 14 May 2026 07:28:59 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:59 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:53 +0530
Subject: [PATCH v22 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-12-28a5bde07483@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2244;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0UqGJToy0TBXJ6WPFU7lKlAFIhpopdAI0eFI74nJSqM=;
 b=mc2n32EA1551rOvh7McfKD4VQShAaZJi6Mm1+QyG4LG1g9r/Pp6mbhT0nsgCYpFPHBED8gDSD
 4eBSLKFcKEXCJfpEeyPgXtkIksK8OgGl2nUJzAaCxihw4VD+s4uRJlb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 3FYv559ro7zcoLKgWWGAns517-ipzWOo
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05dc2c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 3FYv559ro7zcoLKgWWGAns517-ipzWOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX7E7VQPpUCz9I
 OuYM50XHMh3KRpJAQfF/dufBPCCtQnGLJ55Z5Dfxfg7qZWQ5DiOO29asdj6oSywN+y6W+xqZ5EA
 ggoh5RP/HpC8lAj+yraoW2p71TaA3sG20N4bJdCzIbPbeLUzdijEv9yQFfixlxoQ1qr3lcWziYw
 5UA7rGsfW9Gq9HvmV+2/GJJY0wysvMQmnf1qPgwVIKQVDZhrz9vNDjjg2SH7zYtL2cEgBfoxFNa
 BmyknPcASrkGaFKY+53ORb3qmzyqR6dFl4R+6CAnfqfLXjSaSYdQlJQGQd5tPD6B2Dih5QxGajj
 CtTKG9eE3DxfctmCmNv2liKwxJUrRcJ3fCxgojz4jXrFUD2feMhEQH6escWE0IaoNHs5HO4PCON
 kQA3iqmmAKt4qZiuShmsWl0+wXiafxeezAM4u0X3xYBPLFxSLiWe2sSVjcuQW/nIBc1Ae1J0dxl
 EFgh+IECDJsTKAeHKZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-Rspamd-Queue-Id: 92A53543387
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107660-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..df668dbf2bc60175c36cabfa310aff625647899e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e6953acc7fa06d22a1f83ab24edb0..da675f7a8f2d83f3598a6a7ad71a99206213d03c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -674,7 +674,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d821ca88a38ac59a78625707850bb5d..3ab5ae3124ed5314f04202b6b247fbbbef665053 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


