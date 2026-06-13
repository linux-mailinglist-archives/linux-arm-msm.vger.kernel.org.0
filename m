Return-Path: <linux-arm-msm+bounces-113013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dcYGFleXLWophwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:45:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D767F38C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:45:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="W/49r9D7";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MuX90qlp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E56E3028E81
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321F638756E;
	Sat, 13 Jun 2026 17:43:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7B38644F
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:43:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372639; cv=none; b=AYRpX4YyayC2Z7Ee8MbmQNFjmvJZiKM2Yes6ObsYf5PqL0rV2c4YAxsr2IFW8SVq2Ym8YUkNh1Y5G8MRgOR5BPWAP7cW4qWQN3AXpurH6R1BqH9qEpgf4qIK9QZ82wHpc/cz1myjsVzRSYl54QLRK6paaSYieiasxdH/oZ+7jt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372639; c=relaxed/simple;
	bh=YHwSTGThUAbGeIlWR07EjajkrrALmn/koWtj/6lSdVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xe/IEBtrxcdFC37QjeQP7Jmc1Z8QLnXGx2bBiALF7WDnHsGAjpU/EogHFpz1n/HEOOQocWLJC+/HXgNIacxbJnxPH0/l8FBr5r+1oPPVEahS2FrjOGH9wM+HPifHkAE2cPjRlQU2E6+SnBCA0x05/Q0ZnxVH/6JdEBitaKh7Lm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/49r9D7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuX90qlp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFA1nA2786203
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfuJ6D5x60z89yOQvwm7TqyYWGh2fB+rxO9NU6z64Q0=; b=W/49r9D784hW9NPd
	bes7BHETEoqD8g13JprnGNdj8+evVAoojh3OyUuaQzqvkEGCaOGxRcbFZ5aZ0CgA
	ZKr6FB8c58J5X2xfNqTHUXa0P7ZDITnd+15IqPAeYfHJJXHm7ZQfxTK+zcMIkd6O
	K9w5bVLHse2HJ5s/M239qAFanr8/TwS1eGeyMb+27FcVPZ3d6fm6p/Au0Me4Cm5k
	G3ySibCffSmmrHFpDzdekoMNAwRL5ODqcdwXQWx4ybfCw7DvYda055cu6AGw9q94
	RnH81xfg+WgMrNeOP9fJFy3igPwyFrSpv2Wrs4/y7/1sVObnPQz5qMUbyd0hxYEh
	hxNV5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cghj9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:43:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422f987f2eso3207227b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781372636; x=1781977436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfuJ6D5x60z89yOQvwm7TqyYWGh2fB+rxO9NU6z64Q0=;
        b=MuX90qlpYk4ft4iFux3YOWy80R4OuNbkzPhaQ5i1iiBfdwd5TX7fWOoBuG9BR26IyL
         AMTWWhIFLLzXn3nqJNVtKUMTCTT/KvSogeDLguIHuljwhsC1hey7OwXrJvBitctyxDSL
         1pj0B1aoxVTkmG5WG5kuRwVG5PHznX9dLjVb3nUgpcIM529cMl37c8hl9hi8u4OO4Fan
         mbjdZUJc465Y/R7B5+yT0VCcwyrLnwlZF80Lo9a7fvj4ge+DHgZnZAOeWTdAjz6eFiG/
         3ezurgv8q9JdXVK4T9wVSFyEjHOPbEzK3S18Kgzoevp6aAZrfki0G1c3BwWX8KjYlPUv
         IXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372636; x=1781977436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MfuJ6D5x60z89yOQvwm7TqyYWGh2fB+rxO9NU6z64Q0=;
        b=j9MG9ZB59m/DpR6y8u0uf/K+Hlm5fTZ+ndwf3NQoAudX67gwsHs4zFqTNX9Wb0msJY
         L0tplTUnaH9FyLRTIlTxGQjgNz9Eb3zKqxn5M/tQNIeY/DZEr14BcOxNLNosMe6o1Tnx
         jhqQKg1ghTjAHxN9JDDls+tv1bBkrdqVE1SajgdMduf3Sdr6Q1fJjTc1eC/pS9dzHfIX
         98iLJj6lIc2ScOqZVDaNurM6DSTM7HmTxwCbuEwvX51RU5RrKnPHl8KOhAerHHm7Y3a9
         aBelR1Wk9Zyc++1sherThTTYP74Z0GAAKjOZdtZAPdr2mjKBmuZOjIB0CfXwDl2hfwze
         HtEQ==
X-Gm-Message-State: AOJu0YwplPDjaIWyPCpvu8b//JAlSlf89MkIZD8TgqOgJbJxOdJUWr+g
	H7K3iI5P7rMu6lo+6lx5bX9u8kbcSyhHW4+7RGor8c/y8S6uzRNKufPT5EmIxeOYrMaTZKd0ihe
	bTPq+0ieFbaiNd4Poz3F0yjpfK5Q/ft0zYqIeRb9SXhDY01xYiZQoh2gG7dU6DhdAQQ6M
X-Gm-Gg: Acq92OHXGi2oOjl6gcKChtpBjuhg9dDVTIm7wbjk7NtVXN9cWFeFaSuDjAj5hHy18T4
	W+SHriP33KogfBvW9jmpPV8ClRS7eRdjAQxdEU/GKEjKwOpKIlqqNoTmg73yb5Zjy6A0FHhSCJh
	xS9NfkweGEMf3VaQkRKmnPu3klhRyGnuqbjp9NDsjT8eHS5Ucp2tOGoosvlBAVaPc/6UP4qtT0C
	CxYVBUQqfwvXJdNmf3Q0Mo3V+oqpGeFcQCevvigtajosycKisjYZae6ZZZxPsttgY9TiGSHGRLy
	RG0zIcgvVo97E8Vy+vfyjobTEMqxXZlaGaVRqVhjuXUeV7uvSl+DAn7E6rktoxScxUUwfvPmG6n
	kn+D5V2sdxbWGiMzsVc1aDnIvOFOYaS6YWHh+yMifdAEhDGErgv4J8g==
X-Received: by 2002:a05:6a00:17a4:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-8434c9ce62cmr8088000b3a.0.1781372636068;
        Sat, 13 Jun 2026 10:43:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a4:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-8434c9ce62cmr8087982b3a.0.1781372635567;
        Sat, 13 Jun 2026 10:43:55 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm6594096b3a.57.2026.06.13.10.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:43:55 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 23:13:37 +0530
Subject: [PATCH RFC 2/3] vfio/pci: Allow userspace to set a virtual Device
 Serial Number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-pcie_vfio-v1-2-09168188f3f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781372623; l=6731;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=YHwSTGThUAbGeIlWR07EjajkrrALmn/koWtj/6lSdVM=;
 b=q5QaIG3w1KcyGu4+OpQHu4ByqlL2Ux9nL7F71vhXzwgpASp/akqUYgl3D20lCKdlrT7ajT2nO
 JHG61pUlwuBBHbzaCl9POysZvJBxYNhI7iNwTsQCHSpaT02TT9YqJ0Y
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-ORIG-GUID: U2PF0GZqYFXiXf5d0CfBAdFMzpd4oNej
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2d96dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=QraOWRL6XIDMBDdn:21 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=TAXQPXfdsw-cyHItq3cA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: U2PF0GZqYFXiXf5d0CfBAdFMzpd4oNej
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX+8q6SHVf5+Ku
 f+4Y5UPq/+iWz5C3poks9k2XEYm9Ut0pAi7BqcHnZ81K7Jki/8CXOxkZ5uKmph3JVYdE5MitQGQ
 x+eZ2J9sttaCp+EmFAF0KAHqkoqQtxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX6RhufQr9r2pI
 fiFdj57HFSKh6E00asqAimqZWwIZxHYUeWBExw/C5xJBAHUp9V8d37OkhPSeP4fjvVk8QAnRyK0
 dt6JVA5wrTnhV47Vxfk0zkBQNnNlw4hHpHH87oUYTn6wbnvNDxD0TmUDASXqyhFb+aqYIjh6ZRR
 vSiaSENuCKEFtuq4MzFTUQg1gNKBPz0HSwFlzTGl1g/w72aM8TnfH/wKYmQ99C+KMFlFGw5OcAS
 bG6oldDy7od4yohRTeKPdQ0GBbJS8+jKmqPFceOqEHdSnUNCn8NXs6RF3fMQoKf//yCJsLPdrgA
 swpHO8e9sYkKzj8ludwJU6zev6+rCllGpmmv+NThx9ityZwbB/QDRiUTqIwCw9HXT70ixHWf2Pw
 2TyyAnIjkLN4SLMwlpYqXqBN6e9UkcF5MF31NXtY8Bay3Vy6OHHqFYxwzGYj121CZtIua838HZL
 p8aAJJLC6O+GrammiZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113013-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:bhelgaas@google.com,m:dmatlack@google.com,m:shuah@kernel.org,m:linux-arm-msm@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:praan@google.com,m:mani@kernel.org,m:pranjal.arya@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 0B9D767F38C

The preceding patch ("vfio/pci: Virtualize and scrub Device Serial
Number from guests") hides the physical PCIe Device Serial Number from
guests by zeroing it.  Some use cases instead need a stable but
non-host-identifying serial, for example to keep a consistent device
identity across live migration between different physical devices.

Add a VFIO_DEVICE_FEATURE_PCI_DSN device feature that lets the trusted
userspace VMM GET/SET the 64-bit serial number presented in the device's
virtualized config space.  SET writes the value into the virtualized DSN
capability (whose dwords are virtualized by the preceding patch, so guest
reads return it) and GET reads it back; PROBE reports support.  The
feature returns -ENOTTY for devices without a DSN capability.  Guest
writes remain disallowed.

The presented serial is stored only in vconfig: it persists across a
runtime FLR/Secondary Bus Reset (reset does not rebuild vconfig) and is
cleared when the device fd is closed (vfio_config_free()), i.e. it is
per-open.  A feature ioctl can only reach an opened device, whose vconfig
was allocated by vfio_config_init() during vfio_pci_core_enable().

This feature uses index 13, not the next sequential value 12.  Index 12
is already assigned to VFIO_DEVICE_FEATURE_MIG_PRECOPY_INFOv2 in
linux-next by commit d7140b5dde45
("vfio: Define uAPI for re-init initial bytes during the PRE_COPY phase")
(https://lore.kernel.org/r/20260317161753.18964-2-yishaih@nvidia.com).
Using 12 makes the core feature switch route the ioctl to the
migration-precopy handler, which returns -EINVAL; this was observed in
testing, hence index 13.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 59 ++++++++++++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_core.c   |  2 ++
 drivers/vfio/pci/vfio_pci_priv.h   |  2 ++
 include/uapi/linux/vfio.h          | 18 ++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 24dfeb43cb71..60c19129c814 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -2078,3 +2078,62 @@ bool vfio_pci_core_range_intersect_range(loff_t buf_start, size_t buf_cnt,
 	return false;
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_range_intersect_range);
+
+int vfio_pci_core_feature_dsn(struct vfio_pci_core_device *vdev, u32 flags,
+			      void __user *arg, size_t argsz)
+{
+	struct vfio_device_feature_pci_dsn dsn;
+	struct pci_dev *pdev = vdev->pdev;
+	__le32 *vserial;
+	int pos, ret;
+
+	/*
+	 * The DSN capability is virtualized in vconfig; locate it on the
+	 * physical device only to decide whether the feature is supported.
+	 * A feature ioctl can only reach an opened device, and vconfig is
+	 * allocated by vfio_config_init() during vfio_pci_core_enable() on
+	 * open, so vconfig is valid here.
+	 */
+	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_DSN);
+	if (!pos)
+		return -ENOTTY;
+
+	ret = vfio_check_feature(flags, argsz,
+				 VFIO_DEVICE_FEATURE_GET |
+				 VFIO_DEVICE_FEATURE_SET,
+				 sizeof(dsn));
+	if (ret != 1)
+		return ret;
+
+	vserial = (__le32 *)&vdev->vconfig[pos + PCI_DSN_LOW_DW];
+
+	if (flags & VFIO_DEVICE_FEATURE_SET) {
+		if (copy_from_user(&dsn, arg, sizeof(dsn)))
+			return -EFAULT;
+
+		/*
+		 * The config-space read path (vfio_default_config_read())
+		 * does not hold a lock, and a guest reads the DSN as two
+		 * 32-bit dwords.  Store each dword with WRITE_ONCE() so a
+		 * concurrent guest read observes a consistent dword; a guest
+		 * reading the two halves around this update may see an
+		 * old/new mix, exactly as hardware may tear a 64-bit read of
+		 * a register pair.  This matches the DSN's read-only,
+		 * advisory nature.  Serializing concurrent SET callers is the
+		 * userspace VMM's responsibility.
+		 */
+		WRITE_ONCE(vserial[0], cpu_to_le32(lower_32_bits(dsn.serial_number)));
+		WRITE_ONCE(vserial[1], cpu_to_le32(upper_32_bits(dsn.serial_number)));
+		return 0;
+	}
+
+	/* VFIO_DEVICE_FEATURE_GET */
+	dsn.serial_number =
+		((u64)le32_to_cpu(READ_ONCE(vserial[1])) << 32) |
+		le32_to_cpu(READ_ONCE(vserial[0]));
+
+	if (copy_to_user(arg, &dsn, sizeof(dsn)))
+		return -EFAULT;
+
+	return 0;
+}
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index a28f1e99362c..08a98a796717 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1572,6 +1572,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_DMA_BUF:
 		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_PCI_DSN:
+		return vfio_pci_core_feature_dsn(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index fca9d0dfac90..dfb0c800e6f1 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -64,6 +64,8 @@ void vfio_pci_uninit_perm_bits(void);
 
 int vfio_config_init(struct vfio_pci_core_device *vdev);
 void vfio_config_free(struct vfio_pci_core_device *vdev);
+int vfio_pci_core_feature_dsn(struct vfio_pci_core_device *vdev, u32 flags,
+			      void __user *arg, size_t argsz);
 
 int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
 			     pci_power_t state);
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 5de618a3a5ee..e5b8dfd3833f 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1511,6 +1511,24 @@ struct vfio_device_feature_bus_master {
  */
 #define VFIO_DEVICE_FEATURE_DMA_BUF 11
 
+/**
+ * Upon VFIO_DEVICE_FEATURE_SET, set the PCIe Device Serial Number (DSN)
+ * presented to the user (guest) in the device's virtualized config space.
+ * By default vfio-pci scrubs the physical DSN to zero so the host device's
+ * unique identifier is not leaked; this feature lets the hypervisor present
+ * a chosen, per-VM synthetic serial instead (for example a stable but
+ * non-host-identifying value for migration).
+ *
+ * Upon VFIO_DEVICE_FEATURE_GET, read back the currently presented serial.
+ *
+ * The feature is only available for devices that expose a DSN capability.
+ * serial_number is the 64-bit serial in little-endian wire order.
+ */
+struct vfio_device_feature_pci_dsn {
+	__aligned_u64 serial_number;
+};
+#define VFIO_DEVICE_FEATURE_PCI_DSN 13
+
 struct vfio_region_dma_range {
 	__u64 offset;
 	__u64 length;

-- 
2.34.1


