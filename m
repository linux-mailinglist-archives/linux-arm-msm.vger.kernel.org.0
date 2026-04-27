Return-Path: <linux-arm-msm+bounces-104790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KFdCAmg72kcDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:42:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079C477D58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BB16307DA5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCDB3E63AC;
	Mon, 27 Apr 2026 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee90QlmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPXDiHx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72FA3E5EFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311448; cv=none; b=gcx90CoEc9brmzrfFg7zsZpE2x/qKICCDyyCurPL8SQIw0m2o292AJ1iOT2xuJD5KKKc/Rqr7VfKQ3mEfGXvp/9XZSWK5+FyLED3vBcmkf51UPTOvs9vYcXkXKztN12nlaRDLXalaDHlAtAXBaYpb/yIfGv6WdOoJN7X1/Zikx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311448; c=relaxed/simple;
	bh=3BzhTvgErlfjD/MREd+a1QNRoNkGhIpRGYMAT4WSFWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNaxcrAJIXOxL2y3H8jgYVwJ6+0EbyQOe8P6JqZOmEFDjNv4jvdTKSIgJl6mVgDzeQmoZ6/ozMfQITM1Hl7SWWkElTcPdmB4JvkuXfQxKW97sTI4mH6tnEDoQZQyO7qj7V2lK6YlwY6LER0WSNF6ddjwHEV+LMOR+Uggevu58b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee90QlmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPXDiHx0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYWgX429180
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=; b=Ee90QlmKOKIevaNT
	g+6xaGj08ZxfGRvhKrefY4D6mEzNX/znFaG1hWabxVvm2leF9p+oVRJj8LZqFLuI
	tuJJePzDM/RfK7SCkQ13a+525RbJ8H5n9J2yklgp4PKjCoN9D+5wOPpisVGHb9ia
	tTrz4pR9pCWZDlVWgwU/2jn86oZsk5pFjzRHoX7QRZXJ3VR1ZzfoQ/E6/gCcW3ZC
	wDtZxRjc12e3y2RoN28lwPyIfqZwmdSpP99uGABBmJeJ603yeSsE+sMa7+NZbL63
	38fc2FtWwEWIXHLMKZ7JdZaANbFyinyiQ7SUGY58Tdh3rH5ajLkCvGwZF18rBBIc
	tjrMKg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x315e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24a00d12cso106655635ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311444; x=1777916244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=;
        b=aPXDiHx07/nx4pAUrCfkEosFbgst4JXaaE6H1gXL188ch051+wrVZmXcOAZxF+n74N
         j89Rv6X/5EnpVOSdLaE1KKFC+7EufJR4gS7RfT6Ksptzka7lQVoWQ7JUGj+pvsiZ2RNm
         JD5iVo3HuQD2nNfv+U5WITQAIIUEN2Vgp/fEc+sPbjc3h3uAgvOABbB44Z40VHK11UFp
         Gz4AncPI1tUReItxmWZw7EnOVgkfFnMXrAReoOO5YufMNrB8Ch6/EtqO+aT5hyt+FttF
         oAuGYSik6YEI4rF6GVOjTpF5opuvvduzFmQiED0tlk2z2rtMtqOJmkQ8M8d6u9Gq/kid
         urJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311444; x=1777916244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=;
        b=eduihIepAjl1TXKuYfW9SQz3KbHlLcxb98bzDs8WfaM3O2gQIWnun50qIE4z0xcDYH
         mP6mhtTA0ZYS7C5w0AEWWqhK5dzewtxjb9ISBLORv/uLPMEHzdiCHPr/mCXthIg1AKPL
         Vi4jEuPqW2w7+iZgMFwSIC5j3BF9We3e+yeJ/4Lw/TIKEgEb5bDJ8XgEhVzPG+SarpQa
         ePBqLKPbo++pA2UwHC81Qun3SfNHzCzk19oVA7EIWIOJBZxI1+34rErWNwnnRA9+RRop
         rruA6fCcM5wydDKq1xVZYStG1ncZbYBAYtgNAyZ0ZFkQPiYWLIVrMPYyrrk3vkQR2O9S
         xNaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lCRx26XTEDT32etu2mjjdpMeW+MbPfg1idexbr7oOvTyHebpUxzHz87xeutOPITC9QQRJVH9V/fTDrHuI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0TWhWKpFCPCOuSamUqzWkhqsLNa1jJRiXFaoCAy/DYzTNgw3
	ITDK70Y9uk2sk7cRGjZ+/qnEZ6t/I6GT36xDAVMcep6vbQgspAvEJFmcuDMThPd7bt96GCAcCyw
	g2owyy5QWqaYzJ3CDlQCid6qyROdqSYQpiyN78sSLbAoL9HZu21HuHPRN1s0gcoxN0N17
X-Gm-Gg: AeBDieszU50jdC0q47nb8Sxk63aO7sn/dR8EPk62yofpw01He34+URQ8ZBaY658ztpl
	Iyn8SCLOoV11ah53Zyzq36OaZbjB30OFMUrSlNBf/2geVjxHGvVUS1/4/i/+xG6hSi6Zot3XVKq
	YC5Mvnk51zqulr0Bw2K4+1royvMDP7s7Azdl7VHv55iHJViAN8ZbW2cDeq7xIXBz+EUk/QMbiTM
	zB4esfawEp34i8hENXOT2waKXyEOtdMQSeSqxj2xTwpNvM+3Eu+3fB33k4Jeq317KqoWsRCQDkN
	0vDda3MiX9f9uSObwcjFgdQKCM+BCTqUdnOz6w1Ej+U5589rbR6N1Y+X5fH1YXJ+fj48Om4UV/w
	Ul9HdUi/SsHU//WsNX0GlbUggvuKnbnWsWz7dy4uurswn1fit3FNwC7WdrlvLyuiU2Hbg
X-Received: by 2002:a17:903:2f50:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97a8b5beamr2077875ad.16.1777311444534;
        Mon, 27 Apr 2026 10:37:24 -0700 (PDT)
X-Received: by 2002:a17:903:2f50:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97a8b5beamr2077465ad.16.1777311444013;
        Mon, 27 Apr 2026 10:37:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:53 +0530
Subject: [PATCH v21 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=1603;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3BzhTvgErlfjD/MREd+a1QNRoNkGhIpRGYMAT4WSFWQ=;
 b=rvn05Gu5bqUE6iUv9sodoL3hQhfRwlgTa3Cm4zjZRZac81OqgAH14XDEWkx+l9/fHu5A2bjHx
 nw7c+wgzdRID5zsDH3CkO5wFDgB8jbP8ZS1xVZ/Zpc3wmTkAnb+9Z5r
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX3ZA9L1jF50hK
 Jo8Rpk/pw46nxKx+NRSBn9bWA+QvSLLhcX60rZMtDLFjuwFfVXW8qgPFWw0kHHCp81JFNh5Noy5
 zqQAolGHjCpW04WeAfq7eUT9DqfYyRDaes0yO0JiiqfeuKZU9WsR0ZidJ0nf0HLUcdNIH1VpTY3
 qHO+I6+k9qesr9ZmTp3OAZapF6cZPXhvBtc3JCaHvMIG2Nc2+sp7YCQAo1ufaolOkmqRl/pMTNs
 DME4uVGw8sZjdNPmaw20HRFii+HrIfEPbpAD1tHZdjMiu6Cw0H4iF9D/plDd1tKluVD9rEWHVpt
 Vq3IGRjpnfWH8LDqxGl7R/2qm/97hLItQ+1zKkUCfbVXpF8Q0ctYMJDRIFjcAXDINAtU3UDjhmk
 iTSXWsOSTOTX1jgUAR+18orqVtbw66A+GEAd7JdgWuKUfXhg9n7VOXmFwIy2okcXp3ZYwOKARJJ
 6f0+kMErdXxFk5sK6Lg==
X-Proofpoint-ORIG-GUID: PJrQpRKqzcr9xnNUms32ivwaWF-2Fggu
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef9ed5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NtfjKPfcWimlndMDSJoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PJrQpRKqzcr9xnNUms32ivwaWF-2Fggu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-Rspamd-Queue-Id: 9079C477D58
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104790-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a0b61e80281104104079b4e0f51a8..8e0c5235f6741b80f975326e2b4268af068c0ae2 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
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
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4744777829a1938754f02a5f6cb5c..83ba8d3bc40731f54d71b6892045bc1dd15d320d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -560,7 +560,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


