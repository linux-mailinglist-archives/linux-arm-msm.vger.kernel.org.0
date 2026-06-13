Return-Path: <linux-arm-msm+bounces-113014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kXHbNXeXLWoyhwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:46:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868867F39B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:46:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YMcW+YW7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jq4UX27m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113014-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113014-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B119304CFFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573A6385D66;
	Sat, 13 Jun 2026 17:44:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E338AC91
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:44:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372643; cv=none; b=XTNSq7O3NhV8rMPBD/bLjGDHvwovY8Ny3TVW60LuhMWhxe3ZX/K8AzwKpDk+MGpcZjEP6jj3E+PAsg1n8dAxQOA+JV2gGoWNH+CeL+2aNd5/31xea7Fo6BC07oUeJnHXda1srB5D9vxkDwMPcfDvzcDKZybPviGJmkpPLxeRIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372643; c=relaxed/simple;
	bh=BDZWqkfYrsTMwtOSpaB2NdOxl/p12WNImICJVo62OTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntDbnm7qOLOS2zrvxXvQKN0t49mCvya6XbnqGtK77Yg9TNvicSuGTzEPzjqGf1YbB4aI2USPOeup+VuUojdFycW77l4VSkhpM0jIo+AYzABS/b9nQJCKrE4+tAIlD7Z6xoZ+m1IVqE6/33pfk6/9QjOnRb/SNfUm+37QJcYoa8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMcW+YW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq4UX27m; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFA2cV1237021
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGlZQjAgHHSL6xRUZ51BYdvPjbrtrzdJlj+7nJq97MY=; b=YMcW+YW7MQHvLjwU
	vNRTWhsv2fEco+19A8pN8KALS93u93EgVcWlk83dCa5jTfzP6cTus8JRkOgknca7
	hrFdA/q42Cb/Ss5FGvj0TuWDPiYFJACqv7M3/7z8KWDMMA5gQMfnbyschXp1G4BM
	ZS8F6rSBoDjok0bhf8/v6BoXj4MTr1lrvwzob45eHQoinlJzF+JfbTWEyN4vyRdU
	cV0QCPLN6CbxymWHUca5zfp2PIxxdwx9RF7iXnGRKh5KAiPCR7g3Ro3Q2U62y5ge
	/Vb3bWNTXcuCNrmAOI19ygTDVgTgK3bBo1pS6eUEcF3QGnWGbQboXEZ0dGb0PTiR
	ovhibQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffhn53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:44:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so1152679a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781372640; x=1781977440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGlZQjAgHHSL6xRUZ51BYdvPjbrtrzdJlj+7nJq97MY=;
        b=Jq4UX27mQY9XcDRnUfiSJU3oUzT92raAQBK1CLbEUPebRTmB6B9Ohr9c9EkMo35LZ/
         W4mNA9XWdqAxp/If6BJ5iMokvdxtANwjtmH1DWqshAHJVn6Mb12xRr6c60oNV/nkqlsW
         TOVzcKPAkVxTtKmQSmQrGAKaumoAeRNJx4y8FXaYMSBj2bAsals7ytqapE3s/4gLeqLL
         q8q6ek4hyTqGPkwm4AcYVgbNsdBQ/zgbOQOZ7P5Na1PT5WI6XijVxaKoLPWMrvUBrB22
         zpP1aPQdjHALEvSiOXlK9OVB7GNAswNJuY4XQjchuShdC+mPqnQJfI/TElgLQ9Gbhbp5
         4HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372640; x=1781977440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGlZQjAgHHSL6xRUZ51BYdvPjbrtrzdJlj+7nJq97MY=;
        b=KJJDk0E26F4JSFACZs5Jbq6rrI1HMKmlr6TZf8sWmzc0l7QL1PA869tPM9P+GI+wGQ
         Z5tnf4/j2YDp+Qa6PBkCWOJKpQKXocCctV1YI9xUKFvgWjBWzIuvTALmrA8nMlZJ+rIC
         tEjzk9t8Uj35nF8mK/2qojf6y8S6J6Oyowa0vQhSpGFT1mtcCfMgS4/V/TE98WimOUEp
         qPOyCQK2lAOkSvpxNynWTuFJHvFhIBcTz6ho98HH8DGrQYjbO0Pc3WA5M88oJvAcX2nb
         xLcvPWBBiogBIS4bq81DZ5+O8Vyooj0HQ9X58FYKz128HhvveMw3LLA/RIH+ETuQtwOY
         8x0Q==
X-Gm-Message-State: AOJu0YxW2wHPlGXuJzJc2iSK40+rtKNEUcu2PVrVKEtMjOzEOoMALXDE
	GkSPh/gKZnr87tvfZq46f6+rsjxdHLlI+5xZnAcnGDQtSrXoNII642icieco3LmR2fEy1lLRgKB
	R7BaZdAoY3ICynKimauh5UMJ/xOtLMxHrw0Qaq77utCNL/C4HqqVsxkBisDzKHoPH1Iun
X-Gm-Gg: Acq92OEw5n79d+gWa/2iYbeoHL+zPAzYhrZ3AbPwx+2lXDgHWrUVdRZvDgIiLYk5O0/
	Ub9/Y8e1TqLXzGVoAyiyfqeJYq7QdUfbLjVkjDBS5iycRZnkjl2r8k5XlS0j7G+GuyxIfXuCaiv
	dGvpR6ia2kHW8JtjTfUo4YM2clH9o1KQQSAaweft4F9jQi6Ml3FkiucW+z7IQwOjUnQ8p0gjaZk
	gfyU41OgQ/lfKDJ0tRJBqQPhzTJX/u/y6S5AjXl83sNbsN2O89u5DoJ0U69uNvLJZnLWvhlYMb2
	HdU7zWfs1nnK4pS2LHijch0sNiyGSzRWUvUxywjnCTeurG1GgYYhmC/QrnHHAQggv08awXQ5jzt
	3WAXE4bxGjEXLkKPBuP9L3cJaAaJj35TbVLn9PjNJz/ZrqmIv3VBOsQ==
X-Received: by 2002:a05:6a20:9f48:b0:3b4:8566:1ca4 with SMTP id adf61e73a8af0-3b783b30e0dmr9127580637.7.1781372640247;
        Sat, 13 Jun 2026 10:44:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f48:b0:3b4:8566:1ca4 with SMTP id adf61e73a8af0-3b783b30e0dmr9127556637.7.1781372639756;
        Sat, 13 Jun 2026 10:43:59 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm6594096b3a.57.2026.06.13.10.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:43:59 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 23:13:38 +0530
Subject: [PATCH RFC 3/3] selftests/vfio: Add PCIe Device Serial Number test
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-pcie_vfio-v1-3-09168188f3f2@oss.qualcomm.com>
References: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
In-Reply-To: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>,
        David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Pranjal Shrivastava <praan@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781372623; l=9082;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=BDZWqkfYrsTMwtOSpaB2NdOxl/p12WNImICJVo62OTY=;
 b=tA0YJrvTMqCrTEAv5MxC3GN8IkPZeJcJ5zXGWWHEZdAi6gAmkJvqQrup3GLGHYUA5S5CJwNIQ
 xsfJ3D6XYRnCB/aATY/ygUH12AHy/aOxJLAEZ2cWR8tq8UVO717hz2Q
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2d96e1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=VokUo_5lpJzrCtGbjscA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: eczPPBaINA-eWIggTmSRuBqMZ24e5Gvh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX/PycZ2uk8Z1b
 iYHtPkfz58JT+BRU9aAts/KGA1aj0322a4Jv/rAqy4WiS8tSiWBYZIBV5FPGrYXdwctMzd6AyqX
 tYXbpynEcR5fhcCg/HuyY+1EktgXiE0=
X-Proofpoint-GUID: eczPPBaINA-eWIggTmSRuBqMZ24e5Gvh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX7updeRSzaewE
 Yng0C3Khl3GxX12tBWwZSTBDT7IHJw9XmtttoSh4+dtjRXO++NYpFHWBAvmg/1SgGKN03gkodFz
 nE9GUWvEjDSHA3vA9BN7tBxI9IK0kyFCYJuzHaRWS9qbDvJtQIOtuHx65YgHjk8YD+0EOafQKJ6
 QrAgfwswbXyB0aLrb+P8H2LJBhCJuRg39/wPRSbYj5zs58r7h/BfQTVz7Ejisg1Pm1jGmQjkPvq
 Fi8qK+Y9q96jvgTF0BE+BwJEuQ4vob1llBf5/v5jZsNYhO+AqEcT365Y6xLSjsT4iwRa7r/+hd8
 GN4BKuk1TNSpbNB1fTVhrHazvbK/v0lFz7P0t5phXMfWu90CEGA50wlzPKTu/Lysg2O7sBDlSsz
 rJBsBYdp3EZeHrJTF9vL12yyLMjwFzu+W7iWt+NuubOtR1u62cGjtRSwXDbikVB6+geJe7bBUtM
 +gqWSaFYVwnxHBvszRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113014-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:bhelgaas@google.com,m:dmatlack@google.com,m:shuah@kernel.org,m:linux-arm-msm@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:praan@google.com,m:mani@kernel.org,m:pranjal.arya@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,nvidia.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4868867F39B

Add a selftest exercising the vfio-pci DSN handling:
 - the serial number is scrubbed to zero by default while the DSN
   capability remains present,
 - guest writes to the DSN bytes are rejected (value unchanged),
 - VFIO_DEVICE_FEATURE_PCI_DSN PROBE reflects DSN support,
 - SET/GET round-trips and is reflected in the guest-visible config
   space,
 - SET twice returns the latest value on GET,
 - the presented serial persists across a device reset, and
 - a short argsz is rejected with -EINVAL.

The tests skip when the assigned device has no DSN capability or does
not support reset.

Run with the device assigned to vfio-pci, e.g.:

  VFIO_SELFTESTS_BDF="0000:01:00.0" ./vfio_pci_dsn_test

Exercised under QEMU with full VFIO assignment via IOMMUFD: all of the
test's cases passed on x86_64 (intel-iommu) and arm64 (smmuv3) against an
emulated e1000e (which implements DSN), and on x86_64 against an SR-IOV
VF that implements DSN in an AER -> ARI -> DSN extended-capability chain.
The SR-IOV run used a KASAN + PROVE_LOCKING kernel with no reports.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 MAINTAINERS                                      |   6 +
 tools/testing/selftests/vfio/Makefile            |   1 +
 tools/testing/selftests/vfio/vfio_pci_dsn_test.c | 206 +++++++++++++++++++++++
 3 files changed, 213 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8629ed2aa82f..ed8e7df12021 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28347,6 +28347,12 @@ L:	kvm@vger.kernel.org
 S:	Supported
 F:	drivers/vfio/pci/nvgrace-gpu/
 
+VFIO PCI DEVICE SERIAL NUMBER SELFTEST
+M:	Pranjal Arya <pranjal.arya@oss.qualcomm.com>
+L:	kvm@vger.kernel.org
+S:	Maintained
+F:	tools/testing/selftests/vfio/vfio_pci_dsn_test.c
+
 VFIO PCI DEVICE SPECIFIC DRIVERS
 R:	Jason Gunthorpe <jgg@nvidia.com>
 R:	Yishai Hadas <yishaih@nvidia.com>
diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index e6e8cb52ab03..06e637573cf7 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -13,6 +13,7 @@ TEST_GEN_PROGS += vfio_pci_device_test
 TEST_GEN_PROGS += vfio_pci_device_init_perf_test
 TEST_GEN_PROGS += vfio_pci_driver_test
 TEST_GEN_PROGS += vfio_pci_sriov_uapi_test
+TEST_GEN_PROGS += vfio_pci_dsn_test
 
 TEST_FILES += scripts/cleanup.sh
 TEST_FILES += scripts/lib.sh
diff --git a/tools/testing/selftests/vfio/vfio_pci_dsn_test.c b/tools/testing/selftests/vfio/vfio_pci_dsn_test.c
new file mode 100644
index 000000000000..d7652ad725f4
--- /dev/null
+++ b/tools/testing/selftests/vfio/vfio_pci_dsn_test.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tests for the PCIe Device Serial Number (DSN) handling in vfio-pci:
+ *  - the physical serial is scrubbed (read as zero) by default,
+ *  - guest writes to the DSN bytes are rejected (no change), and
+ *  - VFIO_DEVICE_FEATURE_PCI_DSN can probe/set/get the presented serial.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <sys/ioctl.h>
+
+#include <linux/limits.h>
+#include <linux/pci_regs.h>
+#include <linux/vfio.h>
+
+#include <libvfio.h>
+
+#include "kselftest_harness.h"
+
+static const char *device_bdf;
+
+/* Walk the extended capability chain and return the DSN cap offset, or 0. */
+static u16 find_dsn_cap(struct vfio_pci_device *device)
+{
+	u16 pos = PCI_CFG_SPACE_SIZE;
+	int loops = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) /
+		    PCI_CAP_SIZEOF;
+
+	while (pos >= PCI_CFG_SPACE_SIZE && loops--) {
+		u32 header = vfio_pci_config_readl(device, pos);
+
+		if (!header)
+			break;
+
+		if (PCI_EXT_CAP_ID(header) == PCI_EXT_CAP_ID_DSN)
+			return pos;
+
+		pos = PCI_EXT_CAP_NEXT(header);
+	}
+
+	return 0;
+}
+
+/*
+ * Issue the DSN device feature.  @serial may be NULL for PROBE (no data is
+ * read or written in that case); for GET/SET it is required.
+ */
+static int dsn_feature(struct vfio_pci_device *device, u32 op, u64 *serial)
+{
+	u8 buf[sizeof(struct vfio_device_feature) +
+	       sizeof(struct vfio_device_feature_pci_dsn)] = {};
+	struct vfio_device_feature *feature = (void *)buf;
+	struct vfio_device_feature_pci_dsn *dsn = (void *)feature->data;
+
+	feature->argsz = sizeof(buf);
+	feature->flags = op | VFIO_DEVICE_FEATURE_PCI_DSN;
+
+	if ((op & VFIO_DEVICE_FEATURE_SET) && serial)
+		dsn->serial_number = *serial;
+
+	if (ioctl(device->fd, VFIO_DEVICE_FEATURE, feature))
+		return -errno;
+
+	if ((op & VFIO_DEVICE_FEATURE_GET) && serial)
+		*serial = dsn->serial_number;
+
+	return 0;
+}
+
+FIXTURE(vfio_pci_dsn_test) {
+	struct iommu *iommu;
+	struct vfio_pci_device *device;
+	u16 dsn_pos;
+};
+
+FIXTURE_SETUP(vfio_pci_dsn_test)
+{
+	self->iommu = iommu_init(default_iommu_mode);
+	self->device = vfio_pci_device_init(device_bdf, self->iommu);
+	self->dsn_pos = find_dsn_cap(self->device);
+}
+
+FIXTURE_TEARDOWN(vfio_pci_dsn_test)
+{
+	vfio_pci_device_cleanup(self->device);
+	iommu_cleanup(self->iommu);
+}
+
+/* The physical serial number must not be visible; reads must be zero. */
+TEST_F(vfio_pci_dsn_test, serial_scrubbed)
+{
+	if (!self->dsn_pos)
+		SKIP(return, "Device has no DSN capability\n");
+
+	ASSERT_EQ(0, vfio_pci_config_readl(self->device, self->dsn_pos + PCI_DSN_LOW_DW));
+	ASSERT_EQ(0, vfio_pci_config_readl(self->device, self->dsn_pos + PCI_DSN_HIGH_DW));
+
+	/* The capability header itself must still be present. */
+	ASSERT_EQ(PCI_EXT_CAP_ID_DSN,
+		  PCI_EXT_CAP_ID(vfio_pci_config_readl(self->device,
+						       self->dsn_pos)));
+}
+
+/* Guest writes to the DSN bytes must be ignored (read-only state). */
+TEST_F(vfio_pci_dsn_test, write_rejected)
+{
+	if (!self->dsn_pos)
+		SKIP(return, "Device has no DSN capability\n");
+
+	vfio_pci_config_writel(self->device, self->dsn_pos + PCI_DSN_LOW_DW, 0xdeadbeef);
+	vfio_pci_config_writel(self->device, self->dsn_pos + PCI_DSN_HIGH_DW, 0xcafef00d);
+
+	ASSERT_EQ(0, vfio_pci_config_readl(self->device, self->dsn_pos + PCI_DSN_LOW_DW));
+	ASSERT_EQ(0, vfio_pci_config_readl(self->device, self->dsn_pos + PCI_DSN_HIGH_DW));
+}
+
+/* PROBE must succeed iff the device has a DSN capability. */
+TEST_F(vfio_pci_dsn_test, probe)
+{
+	/* PROBE must include at least one supported op flag to pass. */
+	int ret = dsn_feature(self->device,
+			      VFIO_DEVICE_FEATURE_PROBE |
+			      VFIO_DEVICE_FEATURE_GET |
+			      VFIO_DEVICE_FEATURE_SET, NULL);
+
+	if (!self->dsn_pos)
+		ASSERT_EQ(-ENOTTY, ret);
+	else
+		ASSERT_EQ(0, ret);
+}
+
+/* SET then GET must round-trip, and the guest-visible bytes must match. */
+TEST_F(vfio_pci_dsn_test, set_get_roundtrip)
+{
+	u64 want = 0x0123456789abcdefULL;
+	u64 got = 0;
+
+	if (!self->dsn_pos)
+		SKIP(return, "Device has no DSN capability\n");
+
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_SET, &want));
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_GET, &got));
+	ASSERT_EQ(want, got);
+
+	ASSERT_EQ((u32)want,
+		  vfio_pci_config_readl(self->device, self->dsn_pos + PCI_DSN_LOW_DW));
+	ASSERT_EQ((u32)(want >> 32),
+		  vfio_pci_config_readl(self->device, self->dsn_pos + PCI_DSN_HIGH_DW));
+}
+
+/* SET twice; GET must return the latest value. */
+TEST_F(vfio_pci_dsn_test, set_twice)
+{
+	u64 first = 0x1111222233334444ULL;
+	u64 second = 0xaaaabbbbccccddddULL;
+	u64 got = 0;
+
+	if (!self->dsn_pos)
+		SKIP(return, "Device has no DSN capability\n");
+
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_SET, &first));
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_SET, &second));
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_GET, &got));
+	ASSERT_EQ(second, got);
+}
+
+/* The presented serial persists across a device reset (FLR/SBR). */
+TEST_F(vfio_pci_dsn_test, persists_across_reset)
+{
+	u64 want = 0x5555666677778888ULL;
+	u64 got = 0;
+
+	if (!self->dsn_pos)
+		SKIP(return, "Device has no DSN capability\n");
+	if (!(self->device->info.flags & VFIO_DEVICE_FLAGS_RESET))
+		SKIP(return, "Device does not support reset\n");
+
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_SET, &want));
+	vfio_pci_device_reset(self->device);
+	ASSERT_EQ(0, dsn_feature(self->device, VFIO_DEVICE_FEATURE_GET, &got));
+	ASSERT_EQ(want, got);
+}
+
+/* A short argsz must be rejected with -EINVAL. */
+TEST_F(vfio_pci_dsn_test, bad_argsz)
+{
+	struct vfio_device_feature feature = {
+		.argsz = sizeof(struct vfio_device_feature),
+		.flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_PCI_DSN,
+	};
+
+	if (!self->dsn_pos)
+		SKIP(return, "Device has no DSN capability\n");
+
+	ASSERT_EQ(-1, ioctl(self->device->fd, VFIO_DEVICE_FEATURE, &feature));
+	ASSERT_EQ(EINVAL, errno);
+}
+
+int main(int argc, char *argv[])
+{
+	device_bdf = vfio_selftests_get_bdf(&argc, argv);
+	return test_harness_run(argc, argv);
+}

-- 
2.34.1


