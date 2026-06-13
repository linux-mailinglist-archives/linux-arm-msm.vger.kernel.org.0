Return-Path: <linux-arm-msm+bounces-113012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id terPCziXLWofhwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7B667F36A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kImBcS6E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IicaYopM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 492F03040967
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB59723D2A1;
	Sat, 13 Jun 2026 17:43:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B9383313
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:43:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372634; cv=none; b=d+MyGqhJU/fBRrcOLns4v01DixGwbkAt3vIqO7SFCS1kyasD3C0EbanW4rD6RzlvRzjwZjXTBtt9cOUJJCXjkiVN9POkblYbUJMTDM9XjAV9jUFIrIa8Xkaa6cnrlksEotu25s0iJv+cYF/xdCFzlYZ7MOmDGfcx02nfX/wkOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372634; c=relaxed/simple;
	bh=i1C+7GVwz8hqSxonETSP8Z7foT49r9/TUeD3+VkK9Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMq9rxUuMtP5KpiyMvR0qstlzYu4KQDFB0ndve9kaORovaOxaqw11DQySflnxQ1RjqouWB26h1AjfAvtHmkN2qKrqnIv8pRHIFhg25RV5VC2Po7jE2NMnWkrTxB1QtWOjzgeDCemYlvJuGZbjY9e7fhhsm0GKTfFzV17LLHGiRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kImBcS6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IicaYopM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF9T2d2769881
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eliVjm18cWWxfayAi3KcJNFoMA1vSR2kzp1VWaYb3AQ=; b=kImBcS6EHxWaZhVb
	eWG8NPJ65KU3oR5iGbYrvJcA6jHUdsfeZgkAJDcABqT+SOK3ezsJxlL+/cChSysy
	TCE0700ld5UrGtJy6KUHekJbF5H1P+FzsQwzgPnYkwgOv1azfubaaUEgseT3wd/v
	rVB9wsjjcz80KJ0sqy9YjxRu/u9V3d3l/TlRtHgrH4zBFY9ujLcmGRJ/ER5nqd87
	J54Gfo8vVvqut8gWligtjGCn9QU5+X7HOZ2cT4ARviBXyNTfX03SEM7DDsszrI98
	wgBdG69yliJ0yuDcMr9r+NMhS5NS09DQrGtJRXLD8gHpHxE6tkKrfnVrCLyVJPAJ
	Qy2e/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye11nhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:43:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso958097a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781372632; x=1781977432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eliVjm18cWWxfayAi3KcJNFoMA1vSR2kzp1VWaYb3AQ=;
        b=IicaYopM9yt+UCtWQBp2nw/ra5uGB4NVyrNl7s1hAetUP+NxZK1RIg42NxxW8csB0L
         1dgXwIfk7tyEuQyV5PbZYYgFVjfjemrBtJenhFwrXYRyUuKtZJRUa4ZVugspJaLNEnGX
         k/AtfU3XDII/QGlxhoHK49hJjWO+wjJQMdy3IADilgVTK4oLU+IlkwFxt0oTa1BoGr84
         hHiTvWEY+6tf1Dc1eeXZq0qH3GBtWuHfifYUDLhtF4F/1cejLOwIlHqOqtZi5mUyJsHV
         E2GvloeFFHGyYVZF9Ay+ID8ETum/ybiQ0ILnUFXeRHzkdKn1ATkAbPncaDHWHAr1nD2w
         cuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781372632; x=1781977432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eliVjm18cWWxfayAi3KcJNFoMA1vSR2kzp1VWaYb3AQ=;
        b=EuDKqbb3ZnDTgWfVoAdrSJfAezsUU6yLv8O837xA4sjIkJXwVuyY1X/wObljr++9ld
         JvQ0IhsCSsTt3hbyh5IM2rL1OJUTFaJE2eSCl/Wl8KPyU8K4zPVE8M9m1KwwXNFqdIGN
         9cWt91K2VYD+FJ5HyU5gquGuLbVzIcrgheFH6w9dtMct8NiSyQbjx9Bfmc55nTR8qk2n
         B6GDsuzAF+A1x+fS/mkVnVBzyiqOpl3qk0fzDR+7GjDQhsLvUKPTyG2hMIjJAIdsR1QD
         62hGYXhMVD55wgGs0mMbH2/W5QREJcWt086Ej6pRWRQNfQiX3d712kqkX6lyIHLJnrEc
         4aKA==
X-Gm-Message-State: AOJu0YyVODsEC+RkybbEkZtyPaYY3xDsltYBwBM44fi97cw4kM9RFS5X
	NqUsYBs87py14JWYjM/YBUuM62dbuOWgD/XyM1+LWWOQ8ZpHuoi22GTcaZTspnWdRRjGvZsjrAT
	KyvTbCEX7sZY0McUovtuiN2s5xiGwXm+1/9jIxUcDsTc1yZvUuelIG5qFm+yGScOlHGQf
X-Gm-Gg: Acq92OFAbGRsbJWB/+NfAT3ZIWsbAX/ygUu9yWyLDxLJR+8xb472NSeFLw0/RUzRmUg
	v6yYrZhlT4gayui2ZbG97K0TzSAFf3sIhL1ABiNl3UTejAcigYqYvFtmXZL+lvN50nkSJkb5T1Y
	qzI3zxM6wAYAPJWd4Qj2Upxuy3LXz3oeDt5VKdJPqQXurptQZfNHB04yWFnOts+ZAjVO97wBNC7
	eiwJADINHAdGJdVbKzrgtQ0xovKaPjRg+h9++nDOGK5its6ThlFPbbuUc8JDJjudfPQuqo91DWb
	nNGYPM40F0CNPJffKyYSZaEhmanfxHS+1h5mgsz7woL2BAPiPlRaW/l6pWjoqZn+YIPIcSlod3d
	cK5hGjesDn8qR7BMMHpipoKqlN/mVuU/bKhRMEGps6h+euPNvVAQaPw==
X-Received: by 2002:a05:6a00:1f0f:b0:822:6830:5900 with SMTP id d2e1a72fcca58-8434cdcaeedmr7853508b3a.6.1781372631973;
        Sat, 13 Jun 2026 10:43:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0f:b0:822:6830:5900 with SMTP id d2e1a72fcca58-8434cdcaeedmr7853490b3a.6.1781372631441;
        Sat, 13 Jun 2026 10:43:51 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm6594096b3a.57.2026.06.13.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:43:51 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 23:13:36 +0530
Subject: [PATCH RFC 1/3] vfio/pci: Virtualize and scrub Device Serial
 Number from guests
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-pcie_vfio-v1-1-09168188f3f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781372623; l=6577;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=i1C+7GVwz8hqSxonETSP8Z7foT49r9/TUeD3+VkK9Uo=;
 b=0WN5zT+Mq0FFfXU8VJ/YH6TO/KCuwKs/cW5LjPcv4yOeQbyQZTmTdoNW8qaJbx1tTpv/Q3RgX
 ZLlGyyE6HAuA62vYVsgUD0/O6tvmiALyVOt6/LY2rnDJb1+elDq4NvX
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-GUID: sXdciu9idJhWJNJVYo1YyqkOELAzx8vL
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2d96d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Sm3NOD-Glf8aR10cVYQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX6PHMQSH2UrBs
 HNYoDASZJYLixdFGwXp+A9BlxhI6U2kNr8iuYKnJE3l5VrAUz5ucVc/BcyGXGfqQ873MOuL3ut8
 nw+Zk7BSmGoCxLIqjOdMWFb82Nng/+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NSBTYWx0ZWRfX2zTaodTQ7Z6z
 je3opYVBEh3/COYikRIG2nwxJRZrKa1hRzVxLL2pO/AAqp3uE0Bi9f737B7qCkJ4O8NK6DrRBDr
 Gb/0UG37TolfZSZmPukwTfGNGR8a9d5BzQgsGv5WvKTLtvF8qruHsYEnkUn7B2ZRGptMd8ObrG2
 Jsz9vIUHK77wYkpo44BzMAmqAdH+QiA2+/UWTo3fW6HvJIfiK3mKweoBQ4DjVSWYsi7LOzlKwvO
 myXN225B6Ey6+pHMd6GD1i2AVayAEX9ejvRXcpA5S4TFJf5XqUUfiS4Ktm1IZ8QFb+GYKA1zBpN
 rkpanLDThGL4kTE/IhFlLbcQTn7LJpbF0pjV8RFlA4XJVVd8gKiw2TmrDDOqavQ4cTrCJWaItG1
 F6uwSX5slVXFV9qs78f++pfo09QbxjpbyB1aNMdn3mttNQ53KRlv9vFKPxKMSe1S1qcMk572kzZ
 rXPoXIcC3fyKgQyp4sw==
X-Proofpoint-ORIG-GUID: sXdciu9idJhWJNJVYo1YyqkOELAzx8vL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113012-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:bhelgaas@google.com,m:dmatlack@google.com,m:shuah@kernel.org,m:linux-arm-msm@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:praan@google.com,m:mani@kernel.org,m:pranjal.arya@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D7B667F36A

The PCIe Device Serial Number (DSN) Extended Capability reports a unique,
persistent hardware serial number (PCIe r6.2 sec 7.9.3).  The value
identifies the physical component: per the spec the functions of a
Multi-Function Device that implement the capability report the same DSN,
so a single value can fingerprint a whole physical device.  Root Complex
integrated Endpoints (RCiEPs) may implement the capability independently
and are not required to share their value with other RCiEPs of the same
Root Complex, but each such value is still a stable, host-specific
identifier.

vfio-pci has no perm_bits entry for the DSN capability, so guest reads of
the serial number fall through to the physical device.  This leaks a
stable hardware identifier into the guest that can be used to fingerprint
the host device and correlate it across VMs, which is undesirable for
multi-tenant passthrough.

Add a perm_bits initializer that fully virtualizes the DSN capability:
the header dword and both serial-number dwords (PCI_DSN_CAP,
PCI_DSN_LOW_DW, PCI_DSN_HIGH_DW) are marked ALL_VIRT/NO_WRITE so all
reads are served from the virtualized config space rather than hardware
and writes are denied (the DSN is read-only state).  Scrub the serial in
vconfig during vfio_ecap_init() so guests read a zeroed serial while the
capability remains visible.  Add the DSN register-offset defines to
pci_regs.h.

The capability length used by alloc_perm_bits() comes from the existing
pci_ext_cap_length[PCI_EXT_CAP_ID_DSN] = PCI_EXT_CAP_DSN_SIZEOF (12),
which covers the 4-byte header plus the 8-byte serial.

SR-IOV: per the SR-IOV spec a PF's DSN applies to all of its VFs, and a
VF that implements the DSN capability must report the same value as its
PF.  vfio-pci exposes only the assigned device's own config space to the
guest, and neither the vconfig fill nor the vfio_ecap_init() walk applies
any VF-specific transform to the DSN bytes, so the DSN capability is
virtualized and scrubbed for a VF exactly as for a PF.  Therefore a VF
that implements DSN (whose value is the PF's host serial) is scrubbed,
and a VF that omits the capability (the spec-recommended case) exposes no
serial to scrub.

Variant drivers (mlx5-vfio-pci, hisi-acc-vfio-pci, nvgrace-gpu-vfio-pci,
virtio-vfio-pci, etc.) build on vfio-pci-core and share this config-space
path and perm_bits table, so the scrub applies to them as well.

The scrub is the default because a guest cannot rely on a meaningful DSN
through vfio-pci in general (it identifies the physical device, which
varies across assignment and migration). The following patch lets the VMM
present a chosen serial where a stable identity is required.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 39 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/pci_regs.h      |  5 +++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index a10ed733f0e3..24dfeb43cb71 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -1085,6 +1085,31 @@ static int __init init_pci_ext_cap_pwr_perm(struct perm_bits *perm)
 	return 0;
 }
 
+/*
+ * The Device Serial Number is a unique, persistent, per-device identifier.
+ * Passing the physical serial number through to a guest leaks an identifier
+ * that can be used to fingerprint and correlate the host device across VMs
+ * and tenants.  Virtualize the whole capability so reads come from vconfig
+ * (which is scrubbed during init, see vfio_ecap_init()) instead of hardware,
+ * and disallow writes (the DSN is read-only hardware state anyway).
+ */
+static int __init init_pci_ext_cap_dsn_perm(struct perm_bits *perm)
+{
+	if (alloc_perm_bits(perm, pci_ext_cap_length[PCI_EXT_CAP_ID_DSN]))
+		return -ENOMEM;
+
+	/*
+	 * Virtualize the whole capability: the header (offset 0) plus the
+	 * two serial-number dwords (offsets 4 and 8).  All reads are then
+	 * served from vconfig (scrubbed in vfio_ecap_init()) rather than
+	 * hardware, and writes are denied since the DSN is read-only state.
+	 */
+	p_setd(perm, 0, ALL_VIRT, NO_WRITE);
+	p_setd(perm, 4, ALL_VIRT, NO_WRITE);
+	p_setd(perm, 8, ALL_VIRT, NO_WRITE);
+	return 0;
+}
+
 /*
  * Initialize the shared permission tables
  */
@@ -1100,6 +1125,7 @@ void vfio_pci_uninit_perm_bits(void)
 
 	free_perm_bits(&ecap_perms[PCI_EXT_CAP_ID_ERR]);
 	free_perm_bits(&ecap_perms[PCI_EXT_CAP_ID_PWR]);
+	free_perm_bits(&ecap_perms[PCI_EXT_CAP_ID_DSN]);
 }
 
 int __init vfio_pci_init_perm_bits(void)
@@ -1120,6 +1146,7 @@ int __init vfio_pci_init_perm_bits(void)
 	/* Extended capabilities */
 	ret |= init_pci_ext_cap_err_perm(&ecap_perms[PCI_EXT_CAP_ID_ERR]);
 	ret |= init_pci_ext_cap_pwr_perm(&ecap_perms[PCI_EXT_CAP_ID_PWR]);
+	ret |= init_pci_ext_cap_dsn_perm(&ecap_perms[PCI_EXT_CAP_ID_DSN]);
 	ecap_perms[PCI_EXT_CAP_ID_VNDR].writefn = vfio_raw_config_write;
 	ecap_perms[PCI_EXT_CAP_ID_DVSEC].writefn = vfio_raw_config_write;
 
@@ -1702,6 +1729,18 @@ static int vfio_ecap_init(struct vfio_pci_core_device *vdev)
 		if (ret)
 			return ret;
 
+		/*
+		 * Scrub the physical Device Serial Number from the
+		 * virtualized config space so the guest cannot read the
+		 * host device's unique identifier.  The capability is fully
+		 * virtualized (see init_pci_ext_cap_dsn_perm()), so reads
+		 * return this scrubbed value rather than hardware.  The user
+		 * can present a chosen serial via VFIO_DEVICE_FEATURE_PCI_DSN.
+		 */
+		if (ecap == PCI_EXT_CAP_ID_DSN)
+			memset(&vdev->vconfig[epos + PCI_DSN_LOW_DW], 0,
+			       sizeof(__le64));
+
 		/*
 		 * If we're just using this capability to anchor the list,
 		 * hide the real ID.  Only count real ecaps.  XXX PCI spec
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index facaa324bd86..bd0ae9decc00 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -768,6 +768,11 @@
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
 
+/* Device Serial Number */
+#define PCI_DSN_CAP		0x00	/* Capability header */
+#define PCI_DSN_LOW_DW		0x04	/* Serial number, lower dword */
+#define PCI_DSN_HIGH_DW		0x08	/* Serial number, upper dword */
+
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	0x04	/* Uncorrectable Error Status */
 #define  PCI_ERR_UNC_UND	0x00000001	/* Undefined */

-- 
2.34.1


