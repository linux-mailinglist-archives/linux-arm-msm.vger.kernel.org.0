Return-Path: <linux-arm-msm+bounces-118828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RGB3M9UOVWrpjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8D74D78D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:14:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ft7hkiHT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gjlct0Lj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C69630B8742
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CF0331EC2;
	Mon, 13 Jul 2026 16:08:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AE532D0F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:08:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958890; cv=none; b=j2/PkXaLwwTs3GhII9qJwv3ZIDQ235YXtvmy+cvMJNO7CUhjx+30koOk+ft1SNeFJVm6MLHN0AdodVXmZwATzY6EkHh1khXmO/YWiatD9YNmVurmVT+dfd4Y6ikWI7rcwwYvKbFht29eugoJLolXrNsT/uqzKvzhMIyqy5qUj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958890; c=relaxed/simple;
	bh=Ern4yxDNkrOKJZYws8GzYapXe0BJjPZoSyhEb4eXtwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mahDgkii5fs4gD70jxpa4J+kx8/0RDh8sjrpQfX+3o+Ox/Ch8WQ5eNMVaVu7Z6UOTRImZJnonXaIyZeX4+3neAzrkbz8f2r15Ps1RT8vfkPALC0Xbt6H16Eft2r06zlnfeNVLXYrHaRdFbKGUFBRtmrnXfvs/8z9a9MM1swRBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ft7hkiHT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gjlct0Lj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF861i1734672
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qdhUVLjwJuq
	JPnMRXedTCGp6dmGDbFMCheciaARTCPY=; b=ft7hkiHT1BICYlurcqRp6IswiTG
	oFF+SxTv5RiimomFpV+pqissjgKSu3iESFqf9hEnmRy3BfdKQQo7SsS7GCOROd+V
	tqnBPENlT7B2CZnBZBcdMsUfHLTihYplJstQjOluwR3xTpLYFxc4ktYXl5XqlKud
	ST4JOaxIjiCKMSv9sSgZldtQyyj36MzyKu3JLJcSFvjDxWC/0AfdEsxHS5DZYEbd
	1Q53hp/IiQIetgj1aDnfM0ekQpMlooFkstZAeo9nTqcD+Oh6M+7L/qHDonZmSF3H
	8O68U9zW94i7HTS8fuwFcjP1MscsC2kn9GLhzMJ3YNanDABG8iiXimXI/HA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8jeaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:08:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4508595a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783958888; x=1784563688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdhUVLjwJuqJPnMRXedTCGp6dmGDbFMCheciaARTCPY=;
        b=Gjlct0LjBSpheS06MrpuFCsY2Bw+na9kCREFH6n/b1Z+xW8DPhRdjb/MY+ieGVUXTS
         JxRY7PY6gwiZOU9KIqD/mW7nRH9ZAV8I6h0+EcXXY6/qpCU+rvnOYoSJyOLq2qN4beIG
         tbnbCl1SX+l7KFRyozd1ghnFxDIYxSLezrXGDb9oftO0hSj7T7ptG4uBPSvoZbI6/+Ei
         OgpD+lRMcS58Az9ilzgK+TpwAFNl6x4VkmReMBX6cT2sVl20bxK8aAXrYfxZdhvUzjPV
         W8+Nm4ocfafAPBC3VaJX+jInkNd1NGGh875OxgiMPKVBirYKJLk+Q7kLuZplMVpfMZiH
         9c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958888; x=1784563688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdhUVLjwJuqJPnMRXedTCGp6dmGDbFMCheciaARTCPY=;
        b=MJSrgsg2g+vR2S1vT6ai29PywbUtlFyxv/rtxR3mcQLLZ90e4lUSdUmTvcJGH+ams8
         hd20mpCE20FM8DSyAgDj47ikaJ3guMIiSX7Ns1nUiPd+Ph+Zd+6hXHJlNOCnJY6qeSSL
         gCrAVLdt6WDiMYIdHNgRUyyrFJbeut7w8/fJa0RvAZB8UT8CFbW0unFuym0W9OGQSj1L
         Qq9iKVWC/oYpqxpNPQFgKKiW54Na4xR9jUBRPL3C3jf79KNuM+4/ji6FJ8q+vhz2ZoM7
         QDmtorcT0zTtsFItmu7/G4lMNq+JbKdllIE+gUPOr0yi85HW30KXEvKr/kU/Kn9pdQBs
         0dAA==
X-Gm-Message-State: AOJu0YwNq4kNZunifbAwbluRPaHs4s7JwCjo/+c0pT2NG8Yp0LrTk7mr
	JxJ+TsTL1SHxaH4VqLII578IM3m8bNa4emWoZ1DUfvvzM+KKMZIVDGqghbGdpd88l9Dpk0DrJT6
	Qzm7IMU92hNy5Te+u8bGmBPAcupugMrbb+Dw99uRWoMVf10PqF4BofkvdiqqJbOGATJps
X-Gm-Gg: AfdE7ckLlGYjE5QQNs5EGAIAJY+BZaeze5tdyq3GO8RES+XjrkL6+PLan0up0GaJsi9
	3zBRgUxQYtazRK2B+3bQIXLbULEOsv7L7lsp1gi8SEJ1l3XfIlccTzv5ebr6NR+x10kK/xbGYqj
	JtY2AALRhf8/C3rksGQneyipUrbv4EKNQLJcSiA/Tc6h2TqALiAVFqaAa6G1Jv7KwqSKjubXeKc
	zQzThBdhTuLJMrcp5FHAKo48f6jBjKtuNmoXcelJ29+KHDTb4sMYQbGon4aBwAysfW+ETHnb2j/
	GpVEKaYHuOinAA/Qcfc4LP31r544Jq7C8Xlfs4DJY9FfVzuBH7C7mCRlKViUX1Cx23KJLKy/kau
	TnJmeYCpOGsbtpYvn6SGZTCTix4gXJVGsBDDAEg==
X-Received: by 2002:a17:90b:1f85:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38dc75eefe3mr9963981a91.10.1783958888175;
        Mon, 13 Jul 2026 09:08:08 -0700 (PDT)
X-Received: by 2002:a17:90b:1f85:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38dc75eefe3mr9963939a91.10.1783958887616;
        Mon, 13 Jul 2026 09:08:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm56974789eec.6.2026.07.13.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:08:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Date: Mon, 13 Jul 2026 21:37:54 +0530
Message-ID: <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dMY47sQdbsZcnffT607Ag5LuJ8KKG_h5
X-Proofpoint-ORIG-GUID: dMY47sQdbsZcnffT607Ag5LuJ8KKG_h5
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a550d68 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KWviAJoEAPtr9-UugcUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX32OnV1HoyVlQ
 10A8Iz/pvzX5XJXbc0+yavVmUY6lUgwg27yIkW5PFu00n/oKBNdlP13qn6h2LKhcjXIrbUUdJo0
 iuI6U0RSh1h3txPyTpPN4bREbcxHJDc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX1AQNDiyzqHPb
 Zd1N7cm9zlXSGURTMy4NqEKh/qM/gYPqSp+TNmZDRuOwrYFa2NsnmFWVTHWY1Nf3AeQoYwGJaVu
 mfUAM8Nm3KdVGZS9U1bDb9HaOIB8cuGyUePbYdAZNVyl2GtidMT5AijquUKtfr5GkK6sM2GoCXf
 /J5/Ocaz/GlYree4Bu93RrCE+ZvVxIkzFUTphLKWmfggUgStSQLQ+DrewQRWj6VBKj0Anu+Pszt
 jy5L5fNf6JEgpv90S3WCQsFp0a/A/ZYAp3yNUXJ6vIXGN5AVl0nsE60GwaqRzd4JB477tQhiwTU
 1MeYNQUMcVBtNcF94Hr3q4gMBe+C9UKOXMQhtKRPIkLbnHeCPwBNJUWnJ+bjH5LzD1UcVg+KfmX
 IC9GJ6v0vfW+v9Qof+tDuL6MVo/wISqkSRdDYHE3oH+OOIOjtNCxtI4wH1EH8i86x4t8Skx78i4
 282nJk91CWeWqtEF3/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118828-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27E8D74D78D

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on these devices [1].

When running under Gunyah, remote processor firmware IOMMU streams are
controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
Linux running at EL2. Describe the firmware streams for each
remote processor in an EL2 overlay.

Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
devices to produce a -el2.dtb alongside the standard dtb. Modem and
media subsystems are not yet supported due to missing dependencies.
The GPU zap shader is disabled. In EL2 mode the kernel owns the
hardware watchdog, so it is enabled here. The wifi-firmware child
node describes the IOMMU stream for the WCN6750 firmware; the &wifi
node itself is left untouched so that platforms without WiFi are
unaffected by the overlay.

[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c857bd7991b..22076579a50f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
+qcm6490-idp-el2-dtbs := qcm6490-idp.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
@@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs := qcs6490-rb3gen2-industrial-mezzanine.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
+qcs6490-rb3gen2-vision-mezzanine-el2-dtbs := qcs6490-rb3gen2-vision-mezzanine.dtb kodiak-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
new file mode 100644
index 000000000000..8daf7f02fd75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Kodiak specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1800 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x11a0 0x0400>;
+};
+
+&remoteproc_mpss {
+	status = "disabled";
+};
+
+&venus {
+	status = "disabled";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1c02 0x1>;
+	};
+};
-- 
2.53.0


