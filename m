Return-Path: <linux-arm-msm+bounces-99520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMjNMtP4wWlSYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:37:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8CC3013CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54F5C308F8EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845AC35F609;
	Tue, 24 Mar 2026 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Grk049RB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ID7Rz4d0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C7221FB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319565; cv=none; b=TvErud9lTQNHpLGuTlTMJ53Siu6DugDK2uX4g+/EArkrkV/qiO+TM6nk1n/0Dg64mnN36SrXBrwKxFUjZbkMSO7Rj2GKGqGsa0U/DILK5JaUaWNgejaTd+seYCJL3jVaQR44FjCG6aWGJ9YCTLEKSgJneOatQGkwr2+A10kyurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319565; c=relaxed/simple;
	bh=sUpzVtSWzHXG2xISKE4+8vGpJMrW6ceWMusJ5Fw+jXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FLb+GypOPB3PogREpIhmGwtTQXxNaJGYa3eLv+qc7ACOfu3fzbqWnPijQXRj2QgscLFA9s9QPPOtrNFAgwR0C9dm5CwCY4zqXstrxcjzsyYK1NKaFRCtAda8s1ZEO8YkGRA5a7DLVYhheWVjpD7QCtMlovdIrYyGkHkwLY7kT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Grk049RB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ID7Rz4d0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIYuh91909250
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aMZ7qUnKi6Br7IYZAcw8Vp
	4jm2qzhzXUo8k75ozmPus=; b=Grk049RBTL6elga+TWbn+m3Nmq2HNXdIEEaOQo
	JixKKKZcRLZBO//sB7r6O7T/exSNojri+3ISLdkLg5Ic/5oAYq9O62UKZmJ3FyNK
	C9D6c/1hNauJunfxxYIrr2c8mv05yuSwSSEPt7MI050Mw/PTNdLxpuus5CNU5FV0
	RiL5TbepkODh93JeRY12iWlFPFgAQe1NKHeWZFtDOLVIKjO4DGKo/KJJFkFy7LJX
	uoRZDPhSEze6g5+gQuaxXwHeDjZWuQFoZqCtdFq839fHIKFD7ROQh+XOmAuhlPgK
	l5rHo/OfBonZz7kJPy9vJgxpPbAdmU7j9vo2qguqx4mVWadw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awysb8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:32:43 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67df9928ec2so1090389eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774319562; x=1774924362; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMZ7qUnKi6Br7IYZAcw8Vp4jm2qzhzXUo8k75ozmPus=;
        b=ID7Rz4d0n/tSMTKo6lgOrJSkv4Jug9U+Kvh2DP9ywHsRfAOxaYZ5QcL03Dcv41wCAk
         eAKlZKtQGdpeU6giHuJCs+reMjirfPFMJ8bKRs+holEAYLKth9+Z1c/4lNBNGwUED3is
         X1VeYf7hVynp8PHhqLwHOtbSgJ6fhR/bN3nr2UM1rKapK6A1prHnXV/OI3NR52mUHYV3
         cAnNkKkaNXMWHzGoKiuw+E4dAiTelZmLaW2bv63EvKtS+9e5BpRzGaLsyh/1fHXFl95y
         4Qs6N2eYE2gmq3u31Z37Ci7fqAFj7s2lOcFZO6K4kHQYz6+hVoBGG+HRlntKc3br+9h4
         vyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774319562; x=1774924362;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMZ7qUnKi6Br7IYZAcw8Vp4jm2qzhzXUo8k75ozmPus=;
        b=FWeqUByyWP7vU7tPR5peDwzRI5OLMeGuu43MFCw/ySuvk8H5E4R9jtDZGjzhhds1Gp
         NxOG4Tqn+WyLKnvvOyHyqR7vWcEHgPQD9EkN59kU8Cs1SDzcu72KyHQ0x2X5f3ugouGZ
         NOZk+1e+feIIaz2hJpUeJ2PiIFCcIoXqel0xbiiaCLifdzMpf6rrLHlIZ1jNI4dtRpkL
         BpRBEQaLlo0xFOCKPRrlV+MT34lRagKVLawiH1eJaF8dGOf0OtTw8J02ptOkv3tdpwf6
         E33hneJP0L5zgPoYC+ynghtt8uoLJW1bahLK86u8cBK2ImZP/2NJmvAIwYqp4JZizk0v
         eZAg==
X-Gm-Message-State: AOJu0YyE+B37W+P5BF5KIFjMSDcSEyZqCwXPC4vnh3F6QfkhK+QPWvkr
	flHxIz4qRjYRF9E5cS0ByO3Sq2dNaU/RUqM7QC+/IiU80SIPSwKZEcoye3nEge1IAeTUIzGO/lm
	SC/NBoAawJap6/IoOmaLHsJGF+c90SasSe4OhjX3vbFAOvjpq7+EvNhbZXkRiDgB1c79avZo+Dy
	ZB
X-Gm-Gg: ATEYQzxViN8IhuWUEp94hB1R7+jjuMuhaP1l/UBxVgGuLB2tn9AQ2uI4RaiwpaF+rsC
	/Q9cCDSGICak5SSPPm9/nl4E6tD4Cm4EfcRqcw21/bDwV+La/js4S/oFo+0Bg9rtF9M304Fvy0j
	8HRVuQ2SebGIjFRy0gL9OHnSF/YQXUG3h1dj82/3rBA1Nra7Qem4I5jCBbpm47uWfRF623n38A/
	lIPboE1l+aXXWj076xltLWaVZCTh9au5bEd9Z6ihueQISAMVihhzQBAXGDua+KDHmvD3uaykE7k
	ogKoTTEcxr6jESkOw+dlh9AaMeFJWV7gBfFxAQ2fyDzXqZqgiI7TXVW+IkfjnHxbTKnHJClUYqh
	edo3KVV587i+x8HAvtJfm+5m1lxh2AuoxK0nI4fFv41s=
X-Received: by 2002:a05:6820:6ae7:b0:67d:e8c1:35ad with SMTP id 006d021491bc7-67de8c137e4mr4540121eaf.14.1774319562314;
        Mon, 23 Mar 2026 19:32:42 -0700 (PDT)
X-Received: by 2002:a05:6820:6ae7:b0:67d:e8c1:35ad with SMTP id 006d021491bc7-67de8c137e4mr4540107eaf.14.1774319561840;
        Mon, 23 Mar 2026 19:32:41 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252ac65fsm7247725eaf.2.2026.03.23.19.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:32:41 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:32:39 -0500
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201 and
 GL3590
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMf3wWkC/32NXQrDIBCErxL2uQZd+5un3qPkIcaNERJNtZGW4
 N1rc4AyMPANzMwGkYKlCE21QaBko/WuAB4q6MfOGWJWFwbkeOYokAUlDTlk66KZmeTpxpkWgmt
 9QSShoBSXQIN976OPtvBo48uHz/6RxC/9O5cEK7oOih+Vkqj43cdYP9du6v0818WgzTl/AQFZu
 Di7AAAA
X-Change-ID: 20260212-rb3gen2-upd-gl3590-d110dd722e1b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5119;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUpzVtSWzHXG2xISKE4+8vGpJMrW6ceWMusJ5Fw+jXQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpwffIyub47/pv3B7dzIyeTC/CtpiEoHpaVOFiJ
 iBSHo7Li4OJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacH3yBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcULNg//ZnBJ0neNxqX9IMUo6bAgMiEvsTFpkAmC0zd5uKk
 bIZEc/g0x5fYEn+OWjQq/+CEGv7TFc9Ltr9HjPLAvehv6RLuOb/imORGP/Ok4y5xgUxX3wm3Cis
 I+hdX/iCLlvNPbxENnIK38ghd+XJ4btuQhFNk9tlynMzES58LwpOS/qn/FBMurQLg6ryprPVbvP
 udOfrtE7Y6D2tdUEE6GpDSFhck9NpyMfYL+SgG++VkC4cEzO/yjB+arNtf8I3QmH/845PQKJzE8
 hIW0KWNHH6Hs4SfH48YYtplVzYg/uRaRBZeGeu6oydoD/GPM23wLPQ+K6DmNxpzfFAO8r+Wy6Qn
 r+IzTOJ86cNc9YAK5pa2BGSWDgXmw6L4rwMa3wSihIXydMYZOgfSPRwg57zlv5QkVNdDl3Bt5hS
 gQbtzBovj2y2N+NbXvit31lV0L2ma4rTuQ2LOs5moJLqtYu7cZUwTz6APV6KsQx3stcVpuWTU1o
 0/X09Ns6s2LywwYYERpJKfOan+sHWwcyQ6ToJN1uSUlVLPqrN1p5HqFD+f98xiWvA3y+BmxH1RC
 +96mVRX6J03Jiyuq2UQG0FXw3lqlJspHG/fge1uW+BaU8Ek6Ery0PeAPD7HI71Noe8GverRP7ZI
 8EZHVrg4EjsCg+yd/8I70cGX2r9VxkfZEOSXUxD5Sx8U=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxOSBTYWx0ZWRfX5s8BVbeKkI8U
 RZdOC8/uO9HK7SNEGStwMCV9rP93cNkanGPNljDDPbOX6oBGUIk8GbxVoL3w4WPFylUERdjJj07
 qtThzL2fvY6dyQjdRWu5z0mkzQ0a+ftx+YADEDEZQI5MczMzoZSSMECySQYsDxiMSvxM4VfkIPx
 LUry13Awtsj9wrpyRhgpv9AhN1zcdE41fQdKC6vdedweW1t/rPisuAfHJY0c1EUuDYQBrz7lDmH
 DISC7Gl87cACIGBP3XojSo7LMs6mpESneDU++nDp0mLxAqw1QSidgFaGlX34ETqSYcrb34wim2G
 nmRojyGJzC5PnzrC/oJaHtCuzphDuVeQzwBcKClAls0WNL8iAcj79PIT93aw15GHyM7zf1om5/g
 whFvMC9LmDd2wlb47EsWehODwBf3vVuMzOzJUYuhCoBVLONto3lVDLB821WVUoNIA2rNrbsQe4b
 u0Z88BMRkGk6KgieLEA==
X-Proofpoint-ORIG-GUID: iIcdreKHB0C5TqQreLSXktd6HQB_p_8l
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c1f7cb cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hJVUIvWn-uBL610IeTYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: iIcdreKHB0C5TqQreLSXktd6HQB_p_8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240019
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99520-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.2:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C8CC3013CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
interface.

The Renesas chip is powered by two regulators controlled through PM7250B
GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
The Genesys chip power is always-on, but the reset pin is controlled
through TLMM GPIO 162.

Describe the Renesas chip on the PCIe bus, with supplies and reset, to
allow it to be brought out of reset and discovered. Then describe the
two peers of the USB hub, with its reset GPIO, to allow this to be
brought out of reset.

The USB Type-A connectors are not described, as they are in no regard
controlled by the operating system.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Dependencies has now landed, so this provides USB Type-A and Ethernet
support (when renesas_usb_fw.mem) is present.

Missing from the RFC/v1 description was the mentioning that unless I
pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:

  xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110
---
Changes in v2:
- Waited for dependencies to land.
- Dropped "RFC".
- Link to v1: https://lore.kernel.org/r/20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 93 ++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index cd54525e45e0f58c7c4d21b010422b55e5fbbb77..e393ccf1884afde7816739053d41ca789acfca91 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -262,6 +262,28 @@ active-config0 {
 		};
 	};
 
+	vreg_pcie0_1p05: regulator-pcie0-1p05v {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE0_1.05V";
+		gpio = <&pm7250b_gpios 4 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		enable-active-high;
+		pinctrl-0 = <&upd_pwr_en2_state>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie0_3p3: regulator-pcie0-3p3v-dual {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE0_3.3V_Dual";
+		gpio = <&pm7250b_gpios 1 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		pinctrl-0 = <&upd_pwr_en1_state>;
+		pinctrl-names = "default";
+	};
+
 	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_NTN_0P9";
@@ -870,6 +892,41 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+
+			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
+			usb-controller@0,0 {
+				compatible = "pci1912,0014";
+				reg = <0x40000 0x0 0x0 0x0 0x0>;
+
+				avdd33-supply = <&vreg_pcie0_3p3>;
+				vdd10-supply = <&vreg_pcie0_1p05>;
+				vdd33-supply = <&vreg_pcie0_3p3>;
+
+				pinctrl-0 = <&upd_hub_rst_state>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* Genesys Logic GL3590 USB Hub Controller */
+				gl3590_2_0: hub@1 {
+					compatible = "usb5e3,610";
+					reg = <1>;
+					reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
+
+					pinctrl-0 = <&usb_hub_reset_state>;
+					pinctrl-names = "default";
+
+					peer-hub = <&gl3590_3_0>;
+				};
+
+				gl3590_3_0: hub@2 {
+					compatible = "usb5e3,625";
+					reg = <2>;
+
+					peer-hub = <&gl3590_2_0>;
+				};
+			};
 		};
 
 		pcie@3,0 {
@@ -1198,6 +1255,17 @@ ntn_1p8_en: ntn-1p8-en-state {
 		power-source = <0>;
 	};
 
+	upd_hub_rst_state: upd-hub-rst-state {
+		pins = "gpio4";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		output-high;
+		power-source = <0>;
+	};
+
 	tc9563_resx_n: tc9563-resx-state {
 		pins = "gpio1";
 		function = "normal";
@@ -1378,6 +1446,15 @@ &edp_hot_plug_det {
 };
 
 &pm7250b_gpios {
+	upd_pwr_en1_state: upd-pwr-en1-state {
+		pins = "gpio1";
+		function = "normal";
+
+		output-enable;
+		input-disable;
+		power-source = <0>;
+	};
+
 	lt9611_rst_pin: lt9611-rst-state {
 		pins = "gpio2";
 		function = "normal";
@@ -1386,6 +1463,15 @@ lt9611_rst_pin: lt9611-rst-state {
 		input-disable;
 		power-source = <0>;
 	};
+
+	upd_pwr_en2_state: upd-pwr-en2-state {
+		pins = "gpio4";
+		function = "normal";
+
+		output-enable;
+		input-disable;
+		power-source = <0>;
+	};
 };
 
 &sdc2_clk {
@@ -1431,6 +1517,13 @@ sd_cd: sd-cd-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb_hub_reset_state: usb-hub-reset-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &lpass_audiocc {

---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260212-rb3gen2-upd-gl3590-d110dd722e1b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


