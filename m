Return-Path: <linux-arm-msm+bounces-114222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ud5cGxCeOmopBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:54:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 029DF6B80D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n6vBdKXg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=grf+A23W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114222-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114222-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C6530C51EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25E53D5244;
	Tue, 23 Jun 2026 14:52:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118AD3D3481
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226353; cv=none; b=Ua9qVziMcYccDaBwWcEAK4HU+s/VIgMJ11GKTkVhdhyUnCAvjBgy3vpXWtYXvYfmiAYfkIndIkJM4iDcCTGe6ZflItjw3IA8wtJEDjrQyqYoOF0dTdty/6xzPKY+k7iZuno6jbOIProDrZ5z3sZJ2+3Pj1fHrHUFydSaORIp67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226353; c=relaxed/simple;
	bh=uxj9woUUStYpWcJNNk45RBrZFAL9TKwZJYdD4yHBm/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDN1MFYzMpurmXxau3DIDH+rIcHg8Kdmt5vhOuB4EtzLCMgNUawGAFxhTM4UljNwfzfdTBjhl/rGlgxoH0jg1w5JqYKeD9cJSqLVspykUkNewPJ6jzwRLE8OWdU79pAjtPFZlYCHSHQ1DFTV7JRSYnAQghBfuhvFAtCzlYOxCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6vBdKXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grf+A23W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NDFqqF271083
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iKdSrgybcUN
	V3KAPOhBBYGNc4u6LS0z8F4/c8uw0wqw=; b=n6vBdKXg+4Lsv47+TI+6r7GsnUl
	Jh/CnKN3kaaGlYRG6683MExMoM19flWseqE7fxOneBEPHd54ndDjEVmm+cTxIiM9
	2sseQP/b63+f8t8Eqd+D7S4biZUmTpTEkUeEGTUCkrzlhHv/LsZM4DHJUYpnQJKy
	CJprX6lBayt3nL3v0wBhzigHNU937VmEn2BH0Xdr/GIXKyM6mIvlLWeeZFdL8HnA
	KXbPwzY4w82+gLQg7ZRMs+SOBd1lVRvEsL8mrWIRv8gf/cb/ypO0uG5vYM9RX+pb
	KvXYIyuVmP2Ke2jgQGVFnOjBfYiDdDjX3XgCAebVMV0YSGiBRsIllKdE3Mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh0f6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92045e86763so227021885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226350; x=1782831150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKdSrgybcUNV3KAPOhBBYGNc4u6LS0z8F4/c8uw0wqw=;
        b=grf+A23WEK6ZvuGIrKgy/3Rs5zWQ607wter5F89yI2VG2plqO9m/0aifS9pu45MsVQ
         Rxrp3RtNQh6kKnGZwWK+9NaGV3GVNO6Orni8RbeR6JZEMc3bXdB15BIMU0YvD5cheh6t
         lDMWP72hFZwZzrCbbTOaU7crqu0dn8Cr3fO4IlhPMMW3xw88E/0G3HB2bZnREdcm7xLZ
         TIRnZ1P7yDavvuQ4SNtdqrOHYua0yWx4r2hWB6elwsOegSprUxTJtlazP7RMEaU88jfF
         r+tadru1ThPvqF+/q1T3xDsbbAFAWMDQCRDX9zuF67bGqD0KKJwzz6LBLNN8H0j8y9+j
         Zvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226350; x=1782831150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKdSrgybcUNV3KAPOhBBYGNc4u6LS0z8F4/c8uw0wqw=;
        b=Oe88wZgBVIjCnxMCITEraIQ1qsND+IDY1O5sou3ZVntiLV66JlqR9A72UAWLWZZ1Il
         m3p71SIo7hIiIXIaIy7IIe3vjyIjfXzI4G3UH8lhc/a7xpvq4O1+Ef1qqroiYx1cNfaN
         sdSpWO1kklg7oDuMEZkXuf11yGd2ZkUA7aUNJxA+hQhj7FY2nCWPHwe7gAI4ZESXuz63
         DSI4Y4yaaGwV6OcoY38RUEBuwBw4FSyge0qqcVe8kVmHNdzIUT8JAcidOFv/V1WDsBmT
         G9/lKv/sWurrDsb0YOroYhra591zsxJdr1urfYEBALppvPznKOkny353oIGjFO6cZ7U3
         HseQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ad5sg/Vk0ZzalOpPagK1Qbya46hUyUf5jLke+zv8fDABZR0/EG6Kdpan5BYID7p6fov0iLlzgwCac/2Cc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6r5HeX+dK5zaMJJD9LuLjxnvnvfiLBXqkdQGU9G7+y5TSnRRt
	JlgV2H/GRbHGmrIEfS3tiIGXeuklkDV7Dkg+eCc6Pet9cSJ/dtk0YJ50cO8MpRd+J7/BDVyWF3e
	r32rwVFQReqGXC/x3a5yWfDPMU0F/o03mEXmfot5tJLO+0AhxjK/nsGcqutmd1RYXkcUk
X-Gm-Gg: AfdE7cmBxOOQ4T8aGFps6OrctMh3aw9GUWbFHYfc0h3gMyYh8e5hmHAD/w76N8xvonB
	KQziwQZFZdJJburAFysJjFgFi2pLwTvql7Zxaa/Wmow3DrXMVHN0QGJRAlNt7BkQZbU9c+rqb1N
	JCUmeqUz//b9FjaBB/Y/yy+sdpZxaq7M7RvAFHJmWk9FAr7Nk/toSnJ3d5FtYpiFLubDhh/lHDt
	E0VVQTJdZaqIObjWLGRSxnExjKx4yA+vtowBUTPa+20xIYMZghxZmrDzaLifToJl0ZrfnEPuq42
	TK+6dcuvVoayil7bz5cgWEV8aEw93aTlorhICFe1lBhgwwQ4ouqBLIURmhJJGUYSsxfunWIpeVX
	pYwyM2MvIOyZDkYg0snxdQPVHrL+m1HcXj3BdG5SQUvgTsERMbdzUupT9nHhKNjjPrRF/usThhM
	smCzZNhdQhFTaUP+eoHhlwebaoWw==
X-Received: by 2002:a05:620a:4456:b0:91f:27bd:ded3 with SMTP id af79cd13be357-92601f1b354mr617536985a.21.1782226350156;
        Tue, 23 Jun 2026 07:52:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4456:b0:91f:27bd:ded3 with SMTP id af79cd13be357-92601f1b354mr617530885a.21.1782226349495;
        Tue, 23 Jun 2026 07:52:29 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:28 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 01/12] ACPI: Introduce DT-ACPI hybrid mode
Date: Tue, 23 Jun 2026 16:52:14 +0200
Message-ID: <20260623145225.143218-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX+v0gNUTfrdaK
 c+W4AgytR0d2H+X0t8ojdgPkcKbeikwVxXWEcaaWXjzLQoY1IqeR0Vx/NhtXtuosS0xxIdCCA6u
 eE1yKqPi24gk3JZBum61EQ2jZ4Cq5QE9WTXvwXxR+SICgpAAm7QSkzsZMFMYdmvLEZGKmvFryUv
 TvuLIyuYtMWNSK+g/FH4wYwgvX01kyBFxSXIM/PXXNBvMWNHA6fA56p8S64lQpKbXBg/3CWmQ06
 6QJQbDooeFn/0R9q0vTG0n0sDVH4AkAI4Mp+BKAKFKxEZbSj3Mm6UbD2Vjcy5LS5pTL2Kjlq+uq
 i6dFnqB4DqRhD+PRpgslAiKeJlGlBYHx+AGQwHzOmLX2g3/re9pBWaHGVnpiz1cAinYTufvH5GA
 mtBvJ/U5VtYkhbgHi1u//wkTJrvQ9ru6W3p4gEuJnmaXz8Nn2SroWgG3m8OEimfwCqUGsrikcIs
 0yoOZBmu/o8X5BaGP0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX+zL9UrWgh2x2
 ZdQ0oGFPZOhJlVe02e34IansmeLu5v6YQH5sp6ZuTsPOssNWDb+ba+0cUDpozYMwK/s4UV2hjdI
 YVX5dx9FI9U5Car36Bm2KDUjOmXmg48=
X-Proofpoint-GUID: jLNiC5yZeY98Be3L1pcOWsQxMVkiBjyI
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3a9dae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=SyvYybavyfcVUkjtgKkA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jLNiC5yZeY98Be3L1pcOWsQxMVkiBjyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 029DF6B80D3

ATM on platforms which support DT or ACPI as firmware interfaces ACPI gets
fully disabled when DT is in use.

In some cases it is interesting to at least parse the ACPI tables and
possibly also use parts of them.

One specific example of this is Windows on Arm laptops with Qualcomm
Snapdragon processors where Windows boots using information from the ACPI
tables but Linux uses a device-tree description of the hardware instead.

Since Windows is the factory OS, these DT descriptions need to be created
by hand.

Having the ACPI tables available at runtime allows the kernel to use some
information from these ACPI tables while still using device-tree as its
main information source.

Having the tables available at runtime can also help with creating and
improving these DT descriptions.

This patch prepares for a new DT-ACPI hybrid mode controlled by a new
acpi_dt_hybrid flag. When enabled this makes the kernel booting in DT
mode still load and parse the ACPI tables, without taking any further
actions like creating devices.

In this case the ACPI subsys will still parse ACPI tables and populate
/sys/firmware/acpi and /sys/bus/acpi/devices.

Note this patch itself is a no-op, since all the arch/*/include/asm/acpi.h
files define the new acpi_dt_hybrid variable to 0. All the added extra
"if (acpi_disabled)" checks are in paths which already check for this
earlier in the code-path. The new checks only come into play when
acpi_dt_hybrid is set to 1.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/include/asm/acpi.h     | 1 +
 arch/loongarch/include/asm/acpi.h | 1 +
 arch/riscv/include/asm/acpi.h     | 3 ++-
 arch/x86/include/asm/acpi.h       | 1 +
 drivers/acpi/acpi_apd.c           | 3 +++
 drivers/acpi/acpi_memhotplug.c    | 3 +++
 drivers/acpi/acpi_processor.c     | 3 +++
 drivers/acpi/arm64/init.c         | 2 ++
 drivers/acpi/bus.c                | 6 +++---
 drivers/acpi/scan.c               | 4 ++++
 drivers/acpi/tables.c             | 4 ++--
 drivers/firmware/efi/efi-bgrt.c   | 2 +-
 12 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 8a54ca6ba602..3116bb872f47 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -76,6 +76,7 @@ typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HWID
 
 #define acpi_strict 1	/* No out-of-spec workarounds on ARM64 */
+#define acpi_dt_hybrid 0	/* No DT-ACPI hybrid mode on ARM64 */
 extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index eda9d4d0a493..5f725bba6e87 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -12,6 +12,7 @@
 #include <asm/suspend.h>
 
 #ifdef CONFIG_ACPI
+#define acpi_dt_hybrid 0	/* No DT-ACPI hybrid mode on loongarch */
 extern int acpi_strict;
 extern int acpi_disabled;
 extern int acpi_pci_disabled;
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 26ab37c171bc..b72586fe650e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -22,7 +22,8 @@ typedef u64 phys_cpuid_t;
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
 
-#define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
+#define acpi_strict 1		/* No out-of-spec workarounds on RISC-V */
+#define acpi_dt_hybrid 0	/* No DT-ACPI hybrid mode on RISC-V */
 extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index a03aa6f999d1..ae1d3d588c06 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -25,6 +25,7 @@
 #endif
 
 #ifdef CONFIG_ACPI
+#define acpi_dt_hybrid 0	/* No DT-ACPI hybrid mode on x86 */
 extern int acpi_lapic;
 extern int acpi_ioapic;
 extern int acpi_noirq;
diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index bed0791c17fc..0f9e22046e0a 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -263,5 +263,8 @@ static struct acpi_scan_handler apd_handler = {
 
 void __init acpi_apd_init(void)
 {
+	if (acpi_disabled)
+		return;
+
 	acpi_scan_add_handler(&apd_handler);
 }
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index 1d7dfe4ee9a6..00469a4b8897 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -361,6 +361,9 @@ static struct acpi_scan_handler memory_device_handler = {
 
 void __init acpi_memory_hotplug_init(void)
 {
+	if (acpi_disabled)
+		return;
+
 	acpi_scan_add_handler(&memory_device_handler);
 }
 
diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 00775b91bd41..f4ddd5e126e3 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -785,6 +785,9 @@ bool acpi_duplicate_processor_id(int proc_id)
 
 void __init acpi_processor_init(void)
 {
+	if (acpi_disabled)
+		return;
+
 	acpi_processor_check_duplicates();
 	acpi_scan_add_handler_with_hotplug(&processor_handler, "processor");
 	acpi_scan_add_handler(&processor_container_handler);
diff --git a/drivers/acpi/arm64/init.c b/drivers/acpi/arm64/init.c
index 7a47d8095a7d..9826c0b35715 100644
--- a/drivers/acpi/arm64/init.c
+++ b/drivers/acpi/arm64/init.c
@@ -4,6 +4,8 @@
 
 void __init acpi_arch_init(void)
 {
+	if (acpi_disabled)
+		return;
 	if (IS_ENABLED(CONFIG_ACPI_AGDI))
 		acpi_agdi_init();
 	if (IS_ENABLED(CONFIG_ACPI_APMT))
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e..1d5ea66cb99e 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1290,7 +1290,7 @@ void __init acpi_early_init(void)
 {
 	acpi_status status;
 
-	if (acpi_disabled)
+	if (acpi_disabled && !acpi_dt_hybrid)
 		return;
 
 	pr_info("Core revision %08x\n", ACPI_CA_VERSION);
@@ -1361,7 +1361,7 @@ void __init acpi_subsystem_init(void)
 {
 	acpi_status status;
 
-	if (acpi_disabled)
+	if (acpi_disabled && !acpi_dt_hybrid)
 		return;
 
 	status = acpi_enable_subsystem(~ACPI_NO_ACPI_ENABLE);
@@ -1494,7 +1494,7 @@ static int __init acpi_init(void)
 {
 	int result;
 
-	if (acpi_disabled) {
+	if (acpi_disabled && !acpi_dt_hybrid) {
 		pr_info("Interpreter disabled.\n");
 		return -ENODEV;
 	}
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 530547cda8b2..4836286968e8 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2253,6 +2253,10 @@ static void acpi_default_enumeration(struct acpi_device *device)
 					     ACPI_RECONFIG_DEVICE_ADD, device);
 		return;
 	}
+
+	if (acpi_dt_hybrid)
+		return;
+
 	if (match_string(acpi_system_dev_ids, -1, acpi_device_hid(device)) >= 0) {
 		struct acpi_scan_system_dev *sd;
 
diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 4286e4af1092..6aec547c0872 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -247,7 +247,7 @@ int __init_or_acpilib acpi_table_parse_entries_array(
 	int count;
 	u32 instance = 0;
 
-	if (acpi_disabled)
+	if (acpi_disabled && !acpi_dt_hybrid)
 		return -ENODEV;
 
 	if (!id)
@@ -330,7 +330,7 @@ int __init acpi_table_parse(char *id, acpi_tbl_table_handler handler)
 {
 	struct acpi_table_header *table = NULL;
 
-	if (acpi_disabled)
+	if (acpi_disabled && !acpi_dt_hybrid)
 		return -ENODEV;
 
 	if (!id || !handler)
diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..dc69342cdb38 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -31,7 +31,7 @@ void __init efi_bgrt_init(struct acpi_table_header *table)
 	struct acpi_table_bgrt *bgrt = &bgrt_tab;
 	int mem_type;
 
-	if (acpi_disabled)
+	if (acpi_disabled && !acpi_dt_hybrid)
 		return;
 
 	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
-- 
2.54.0


