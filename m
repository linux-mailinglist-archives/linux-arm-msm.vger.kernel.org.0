Return-Path: <linux-arm-msm+bounces-107661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNeCIfzeBWqjcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:41:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F75434F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 535963083DB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C07407582;
	Thu, 14 May 2026 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/7XF9ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEdYyYl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2138C3FA5D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768953; cv=none; b=r2+wpWpLYEvTxekQ7wSwTW0OPbzoc1cCFtDlkZSEu+sb6SmKabXi/kBHejnK1el3RMX9ZyQq8Y2ykevCmeCbDayDi0qm0cyKsiPidyky/97Qt50VhKAGf2tU0N55AVylOcN7Fl2PsjveOeoRr7Xf3SlvSiMiU6+TRwDEKOxUVQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768953; c=relaxed/simple;
	bh=fv/5hA6B5h6bSFJ3jKPW5Yj8V7+yiEtiEsQ3Jf2Ak5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjSIKtTdODGyuZtYyH+fCBkaOZ6dowskuNg3kVdcIaW1bL0ucDQo2Cb7wWPXm+oW2l1Zruuz03AB6zf0JrXyf+EDaW3HsIVi1DvpHLUtMAU9wlyW2Z0NvNceCO6UEyk9DV4DUFIhjdqj6FvWpZmvdb+G2JaW07n7KWo06xwpxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/7XF9ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEdYyYl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQO13951585
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=; b=i/7XF9ckTQVND/dC
	TYkq0l/GzJfcDmNbkYBgu/dmSahdZq+voxXEMKcAkQ9jb3/EwuGoHCDIB9g3hBoL
	q9hjln/GwV1tjG2/W5JoAHU0+pq9IWdB/WR93kiDXc/zJZWyhGwH2aTxEy0ZaFvS
	rPqIeaNy31v4dslLkEQWftw2+af/NBnBK70hNs7ebp06nZLJUVKF7AXg6Jdk/NN8
	5cms4Qk5F2qvkU1BJ4CexyQUXHzxVce0pkvKcF3umunCg1TvR5t2qS1jiqGF8xps
	BX2OmFHWyceJkJzvPJRDywNzES0NDADXC/Wo0ktlcdA7dcPe4HeFe67OTqd7xfSi
	BDLE6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kssxnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:29:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so91828445ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768951; x=1779373751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=;
        b=iEdYyYl4lphwBFbtQ1IbURYtbPQF+A18cAGAxmobfi4MON7iuVyDf/sJS5bWGjaE8A
         +JV45Bzl9MX0uKlu3XIPiVioGg5jYH8j++5pP8VZNjYG548kRbLBmITO+GKJfFndO3k/
         NZnkrea54xyHWMspgO8fsVcneA+EI8wAoJAEkVsATu8oHH5mFMcMkRwuOeFHfEhjH106
         LVp/GxmsgRPSaGciWHSJY4SLkfN/odIDqm1MOv7D5HRir/F1OaJIXrKo06usyV+p8qkB
         BrahTJxg2ubHs7LVNSY9K+qpazL66qnRqkii6KpQ1BU2AlmZT97nBF3AGFsuut81hLwi
         VRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768951; x=1779373751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=;
        b=WD5c1nCJIuOa9mQY4l4juU7rswIsrN315y97DfD4HKdTTerLTZxJTOgLFxO6rZosr7
         WCLtDtwF2TqKgIp8RcqUK4fpkS3udu3InpSm9wGOmdkpAql376Qba75YC4oIfYnjFB6V
         L0FTL+/k7hBE1xltZLr4C+o9g3WST8G5gInfLrXOLs5GT4yEs/0yr8GqdArcgQqihnuW
         itqhO9sSvfrT+C1CqB3NkiKulLAt07ULtqvElD4/vv8veeqAYyfI7V2SRGmXFAkqTRc4
         IqlJvIQrmLcg4mhpg4/rvvxP2oUlrpfQS9tM8P68ggblG2ZidaDQW+lNNqhU4zuvAVOt
         F8zA==
X-Forwarded-Encrypted: i=1; AFNElJ9FfnsOzJ8z781Mm9/LPiErsUZfAi/4imBe5Fp9kAIVgjOSUAoMs2I5oBEJH0sMi9ZCPzEBfzOMkq0lTkV0@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkgA9ksRjFI8SHgMllPJXn0jJ9G75OFCqhkC/gX2LIcnAwvOc
	wT/YwQ8V3P6IDe8+kJp/bYhhMF+2+0tXSGvyElphoCwF6L0Nutijl3iF0CMPfUf2j/DMBRjENLg
	Pvz2gfTYESqiLLVvRuQha8ImCqBUyHyasIwGCAk2pevWw0Yeg4t54W09cM6OAfeh/FCCK
X-Gm-Gg: Acq92OEQWlDRIlTg8ar9IY/+eouWdcCealUolJzfAwf7Gw1MbmXOugdpkhYpCICl3cS
	XwJTupXirVR6mkHNYCVNWYs/KFlyuvySCBg6wPM7QGc/xgr90OlWgn5Ot3Evq2wLxDS/oPgNXe7
	untLPQO9x77GjVTp0SEV8+Wt1CvoeEqOsRCHZcL+MlcPkDPyWT2yaHgTZIa9iomtHZrUomaqvTs
	lrsPdI3rcladfKg546u4sPY2SLqWBhWG4rvz2zHZpfZfeP9tH6NXii4DBw7bAR02IMQGkwbnQZX
	cT3wNeMnne06Vuy0crpm7Z/1QZvRd3yFjQFEovRH3ygEUXlTE7sx1yuYiG5Ni5msBrMQ3PrZ8kx
	YJaAyaN0em9cNCZp985CnlNn/9jM2VIaVjfhuVVviYpHwUdCyQCrOudLvVQ==
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89626545ad.31.1778768950465;
        Thu, 14 May 2026 07:29:10 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89626035ad.31.1778768949767;
        Thu, 14 May 2026 07:29:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:29:09 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:54 +0530
Subject: [PATCH v22 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-13-28a5bde07483@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=1676;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fv/5hA6B5h6bSFJ3jKPW5Yj8V7+yiEtiEsQ3Jf2Ak5E=;
 b=DTfcdvmuHlaXJOFI959VmgqyKdy4KwC74h60uKvEJMgANVtVK6agBUfCB1qK6VdTsL7mvl14J
 T3zgl6il8yIDiXblCoQ5QJIMe1V8sJGmhryAweJi3aC5fMddvtrdDHs
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: bwJaWTjrTRxuv20U6qD1OfEL-rZ2Su52
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05dc37 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NtfjKPfcWimlndMDSJoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX64qWOzSnFHRF
 9lmUDKdSHWYfZp086fn8r+r7J8Jtg6W5oYJoBjoKWwkNcHLbYkqb3eQN+WM9A6AEID6rRrofBIN
 7A6meIL38ljtwke7wKXIJfNz1Sjy7+WOGYw+iReupOzCtPDHdjECAJGB8wdB0MPMwhzqT+Q3DEm
 eOrZ3chHfkhSIlxqX739iPioREffdbUyQEYwz2OspW7u9+NFPduXOewUpaIiCimISfbaEA0pS8a
 /RxQL8HmBIXT9dG8e06RPCuEvey7xTdsTngnDD3Xhx07iMGJgPAWYkOM/UkYMTJyCRG3mdZNuSJ
 RwqJZ3oTjFeAIm3nX+jsJzjFWAmQ7wGfYoSUObvgPEobvHGSq3RSBQ63wR3qFj+SmjnSzbhNLTo
 O/i7Ceu4wYQYRveQ6Vw9rs6MkSrXwSrQpIgBivnmp5RnxljFOLwVylmCCLgOHV7w+mJpMKc4H6i
 +6bd6rjcTT8nOzUzKRQ==
X-Proofpoint-ORIG-GUID: bwJaWTjrTRxuv20U6qD1OfEL-rZ2Su52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: 1F7F75434F1
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
	TAGGED_FROM(0.00)[bounces-107661-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 831002789838033ff6c4135f2d558a0af0d3ec83..ad488570135591eb7a9e5dec5fb1924163a159e9 100644
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


