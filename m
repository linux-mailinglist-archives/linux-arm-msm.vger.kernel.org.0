Return-Path: <linux-arm-msm+bounces-96079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOzTGXvPrWnz7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:35:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0EB231F97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D215D303C2B4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 19:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1C339527B;
	Sun,  8 Mar 2026 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7t05n81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5eU7ZJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A2B346AD6
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998473; cv=none; b=Y4HpLigGu665BpTQkDaS8gHFRNiCT1a0XfY7TTyP/8FHKwqwcsbN5K9hF3AVczfhN4sYn06RzmzgHcfeKHm+SbqVekIKPbQScZzDNGf3tJY7+WXdJrFX6yC5m+BgopExPW1HpxRDzLJa8e6mbBfZdx8PXpQ5LpykKxtyz4hXv6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998473; c=relaxed/simple;
	bh=I/1nXD4vYCQCPGNZbp5WDnKte+78fpuFUppW/XXlKC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrqJoS8g7922ZhnTipLwN7G4GjfSrru2KkbHNjmWE8drbquVamShbGiCVsNkYajZ6zwl4TwPqntpJr69Ot9lBGxXkEFMiMBUyGfXYjRjQbUSAPCHXYqvEzKX1++y/rNq0fayZxDb/6Up3CPJihdWKIFk/tL97Fi6PjE1Fw6+vmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7t05n81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5eU7ZJl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628JMQU32233391
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 19:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0f+l0UZykxb7mxIoRRD4wGsukxC7Yg8uv8eg8ZQXhE=; b=W7t05n81CGCjJycM
	rB6ngvUqGgEoubTypruWnhT3yBAf+l9BKRx9nXxl8on7bN7AD7vMZvuVDbbJXBBW
	MI3sHnNc0AVDH4OkDMu+z6G79TVzjTt3NPX7d4pzD02oVyxbXEnoD1wYpNy5ad1O
	XB80ulB6gd+eCcH64Dd7KM8KMWcDfSJjAn3MxQUwF8hmevEZAVuMNFHWQs/Hb9YC
	B0KrhFsTTtLCkdfJ4I13Sr7hENc7pAk53RDSXgVwiB2Z+7B+KZ+7j/6brbNRuH5B
	G6S4wEgkOFSAXg7mxr0bDzdfl1OVaqxSKHTu21vwELL07pMtq1y07m/VLqgyZAAR
	nsVZXQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpkb6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 19:34:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8298c733f52so1281162b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998470; x=1773603270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0f+l0UZykxb7mxIoRRD4wGsukxC7Yg8uv8eg8ZQXhE=;
        b=a5eU7ZJl+ds/ut+9yZDuazD3+VX1JeL6SB5h96F7RuBNqRXH6mGtgKtlLiJYtLRhz6
         6cp5qzgKx4X5vBqfPXjTDGK09pPKqrFopQZRXEmEZXEF6cHclcZns5o24ItcU2zEh/Eh
         D9P/VkS/1QchMgFQp5OYhJDboZqWqJfk7/QyGT5oJEFwU6ZZuz+S5JUZN6/b7YPMCrdq
         4p04tIcq1/rtBjZiSLTEawuUUwBRWFr3segqm57WWco1zgFIvuqJSSjK2diP0+2U9vCR
         Ga/STX+QzcAVRSHtVBea90I7nxX2BC8CKAHJh4Lj/wrxpWAqy1gOxB0TriSSBt/nrK5G
         CdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998470; x=1773603270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s0f+l0UZykxb7mxIoRRD4wGsukxC7Yg8uv8eg8ZQXhE=;
        b=ldfE8zmgkViGTTX0GnfsdMxJpbNDGnRlbkaXBqf6gdQO2ch9vzjr5panZDaEnDlXV8
         lXvmWU/uhbIsXFfiS9EOjq5YD7r6/ieymD0o9j2Wy58YTpXcHo9PTvn2xbhIKmQ/iQO8
         g7VIaJs3G8F4VK7n7Ih2g+eW8j7p1o+q0oggczxaruRvsvkj1N7legoXDzHR6Df6I/2K
         NOecBBps98f1H7iDOa7E0Z80+gYbh/pjmjUJo4GP2l+fj+bd8HEWTfDYl6/Ib1biZ2YT
         X1ICY6Obx9vhR0uVHT8ltAim46r3s/lIR22Y6p8leqildpS1aeSvs2//ijZL2QOBPqeB
         wmQg==
X-Forwarded-Encrypted: i=1; AJvYcCVmPwFOPyaxuPXOj2+nsFhcHd9KJhiztmFmYSc/cL9i+IkU+QzYylp1p7WqUKtEYTxwsZWkEjj59IPOXfOc@vger.kernel.org
X-Gm-Message-State: AOJu0YxpOjUg7p8rc/JYpsYaK7VLefAWIC1dWHo1k9RDdDsBglgX9PyQ
	8XfRf0E5r8AT3qpNy++MK4dfFJ3ZSApglxR4+/sY/WwCMh0kgL8iwQU9KbrCm1jitgp1u8Exlef
	nqT4O18FDwc27qQJkS8CENTdzW5J265jsP0+sc1615bio4lJy0oh1usC+2k/YNcvsavHc
X-Gm-Gg: ATEYQzxo+nwiBMJA2dqRwu1Z5SY9v+ki96aZLPkPGEEdPZ8I7v0zSOE2aEx67t/Vq8F
	eKmHJSCCjqepRgUG90ejjkqQXfrhtabjQWnEG7g+ddZXvOBn2hkAt8GDh7JMIwSDVgcN6H/DC4U
	nLx1cdtifbFGC4zeq6GB+Lh4EO06gbCwoplwFs/qtqYpGw2TDBH5rP/OgnvxDqeqnqD1H8w3yIb
	+0fXCY96yHuIl+FKY9dPM/hAnWsupvXJzErT6h1lj9FJneOS+14pQ2LFHVo3YVUxK/pEFM9BCtb
	d6NtDyIdH7cT3Arb8BMlLZqWLS4f5ClwHlMM9UsqR8sCa7hkAy6WJtTvGgncCJrGjWkQwv3owBi
	gI/N9SPgmnu/PQiOFo6cqWA9/M934Tx6XHejrxgC1ZPZ5kwb/FOwm5DwW
X-Received: by 2002:a05:6a00:124f:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-829a29d27aemr6338706b3a.1.1772998470212;
        Sun, 08 Mar 2026 12:34:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:124f:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-829a29d27aemr6338664b3a.1.1772998469631;
        Sun, 08 Mar 2026 12:34:29 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4676593sm7818909b3a.28.2026.03.08.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:34:28 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 01:03:38 +0530
Subject: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into a
 struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
In-Reply-To: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772998436; l=14423;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=2xxclcz292iaXTCTUUgVe5HU3Ug92HRVDDP0RH/vc/Q=;
 b=5EJAcBss+t1VSBS7dm5TC4pfRYcv/8aKwEEwlHqkx/KhRZ1Bd8rbDtR/aYN2PXiCfTlToSZB0
 p8l0VQz2qwiAABwp9J5JAJyalSiczsMQk0nyzXRX4xjBsUDyD02gAUJ
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MSBTYWx0ZWRfX7cHCIh9jnskA
 2Xz255xz5ulXrg+QGY5DCggC8eC4GWOGFiFxwCOIb/E9hN3BeSiJeMh/XfjO2rRwiiEilNvAmSE
 hdbByo9GA7P7JkhjMTdP/KlmopwLXJ67ykUC4fB9Ez6yxdgsxMWL6/6NVicyxHvQmhkxEE8tUnb
 qcipupcpcXrJbeMuTUrLAfFMUS8AasvMbmimNoTMj2/AyLWLgvJ3AOBNWF1Ok/bhqn4kUAABg+J
 DwMD+dtpyTF8pJ+pGApmB/s2ImxQI4S/HV1gpgA8PKnoUp3fjcaQ0QIP3K803Q84kGKNcujgFUG
 JHJ8soXD/NhDo895yIBfH79kqcGceTxBvBQnJPi1zEnx9TffYE6X3OAh1qFbVuuxOavfn9fu1vO
 81nKj2jEKx/J1ZhWtisXd4f1GwuaMky8M11Icn/HlqerhGf1gOJiNSyZihgvKrAHhvc53QXHaQU
 xIw+2eMld5sZAYUcKwA==
X-Proofpoint-ORIG-GUID: yp_Vf6-jFLLS2251RxlQinlPezULQBjf
X-Proofpoint-GUID: yp_Vf6-jFLLS2251RxlQinlPezULQBjf
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69adcf47 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fHHJEzlffGKYVby2EucA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080181
X-Rspamd-Queue-Id: 0C0EB231F97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96079-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,iommu_spec.np:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Change of_map_id() to take a pointer to struct of_phandle_args
instead of passing target device node and translated IDs separately.
Update all callers accordingly.

Subsequent patch will make use of the args_count field in
struct of_phandle_args.

Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/cdx/cdx_msi.c                    |  5 ++-
 drivers/iommu/of_iommu.c                 |  2 +-
 drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
 drivers/of/base.c                        | 63 ++++++++++++++++----------------
 drivers/of/irq.c                         |  8 +++-
 drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
 drivers/pci/controller/pcie-apple.c      |  5 ++-
 drivers/xen/grant-dma-ops.c              |  4 +-
 include/linux/of.h                       | 12 +++---
 9 files changed, 76 insertions(+), 50 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 63b3544ec997..03232b5ffbca 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 			   struct device *dev,
 			   int nvec, msi_alloc_info_t *info)
 {
+	struct of_phandle_args msi_spec = { .np = NULL };
 	struct cdx_device *cdx_dev = to_cdx_device(dev);
 	struct device *parent = cdx_dev->cdx->dev;
 	struct msi_domain_info *msi_info;
@@ -128,11 +129,13 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 	int ret;
 
 	/* Retrieve device ID from requestor ID using parent device */
-	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
+	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, &msi_spec);
 	if (ret) {
 		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
 		return ret;
 	}
+	of_node_put(msi_spec.np);
+	dev_id = msi_spec.args[0];
 
 #ifdef GENERIC_MSI_DOMAIN_OPS
 	/* Set the device Id to be passed to the GIC-ITS */
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a511ecf21fcd..d255d0f58e8c 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 	struct of_phandle_args iommu_spec = { .args_count = 1 };
 	int err;
 
-	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
+	err = of_map_iommu_id(master_np, *id, &iommu_spec);
 	if (err)
 		return err;
 
diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index b63343a227a9..729fa2f9f758 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -152,6 +152,8 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u32 *dev_id,
 				phys_addr_t *pa)
 {
+	struct device_node *msi_ctrl __free(device_node) = NULL;
+	struct of_phandle_args msi_spec = { .np = NULL };
 	struct of_phandle_iterator it;
 	int ret;
 
@@ -178,9 +180,12 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
 		}
 	}
 
-	struct device_node *msi_ctrl __free(device_node) = NULL;
-
-	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
+	ret = of_map_msi_id(dev->of_node, dev->id, &msi_spec);
+	if (!ret) {
+		msi_ctrl = msi_spec.np;
+		*dev_id = msi_spec.args[0];
+	}
+	return ret;
 }
 
 static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 959305a84748..b6e07c5fe715 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2102,36 +2102,37 @@ int of_find_last_cache_level(unsigned int cpu)
  * @id: device ID to map.
  * @map_name: property name of the map to use.
  * @map_mask_name: optional property name of the mask to use.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
+ *	set to a target device node to match, or NULL to match any. On
+ *	success, @arg->np will be set to the matched target node (with a
+ *	reference held) and @arg->args[0] will contain the translated ID.
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
- * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
- * @id_out may be NULL if only the other is required. If @target points to
- * a non-NULL device node pointer, only entries targeting that node will be
- * matched; if it points to a NULL value, it will receive the device node of
- * the first matching target phandle, with a reference held.
+ * ID, as per the "iommu-map" and "msi-map" bindings. If @arg->np points to
+ * a non-NULL device node, only entries targeting that node will be matched;
+ * if it is NULL, it will receive the device node of the first matching
+ * target phandle, with a reference held.
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out)
+	       struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
 	int map_len;
 	const __be32 *map = NULL;
 
-	if (!np || !map_name || (!target && !id_out))
+	if (!np || !map_name || !arg)
 		return -EINVAL;
 
 	map = of_get_property(np, map_name, &map_len);
 	if (!map) {
-		if (target)
+		if (arg->np)
 			return -ENODEV;
 		/* Otherwise, no map implies no translation */
-		*id_out = id;
+		arg->args[0] = id;
 		return 0;
 	}
 
@@ -2173,18 +2174,15 @@ int of_map_id(const struct device_node *np, u32 id,
 		if (!phandle_node)
 			return -ENODEV;
 
-		if (target) {
-			if (*target)
-				of_node_put(phandle_node);
-			else
-				*target = phandle_node;
+		if (arg->np)
+			of_node_put(phandle_node);
+		else
+			arg->np = phandle_node;
 
-			if (*target != phandle_node)
-				continue;
-		}
+		if (arg->np != phandle_node)
+			continue;
 
-		if (id_out)
-			*id_out = masked_id - id_base + out_base;
+		arg->args[0] = masked_id - id_base + out_base;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
 			np, map_name, map_mask, id_base, out_base,
@@ -2193,11 +2191,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	}
 
 	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
-		id, target && *target ? *target : NULL);
+		id, arg->np);
 
 	/* Bypasses translation */
-	if (id_out)
-		*id_out = id;
+	arg->args[0] = id;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
@@ -2206,17 +2203,18 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * of_map_iommu_id - Translate an ID using "iommu-map" bindings.
  * @np: root complex device node.
  * @id: device ID to map.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->np holds a reference to the target node that the caller must
+ *	release with of_node_put().
  *
  * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct device_node **target, u32 *id_out)
+		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", target, id_out);
+	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2224,16 +2222,17 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  * of_map_msi_id - Translate an ID using "msi-map" bindings.
  * @np: root complex device node.
  * @id: device ID to map.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->np holds a reference to the target node that the caller must
+ *	release with of_node_put().
  *
  * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
-		  struct device_node **target, u32 *id_out)
+		  struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
+	return of_map_id(np, id, "msi-map", "msi-map-mask", arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e37c1b3f8736..18248c3d76ae 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -817,8 +817,14 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	 * "msi-map" or an "msi-parent" property.
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
-		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
+		struct of_phandle_args msi_spec = { .np = *msi_np };
+
+		if (!of_map_msi_id(parent_dev->of_node, id_in, &msi_spec)) {
+			id_out = msi_spec.args[0];
+			if (!*msi_np && msi_spec.np)
+				*msi_np = msi_spec.np;
 			break;
+		}
 		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
 			break;
 	}
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index bff8289f804a..5f8a11774eb5 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1137,6 +1137,8 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
 
 static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 {
+	struct of_phandle_args iommu_spec = { .np = NULL };
+	struct of_phandle_args msi_spec = { .np = NULL };
 	struct device *dev = imx_pcie->pci->dev;
 	struct device_node *target;
 	u32 sid_i, sid_m;
@@ -1144,7 +1146,12 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	u32 sid = 0;
 
 	target = NULL;
-	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
+	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
+	if (!err_i) {
+		target = iommu_spec.np;
+		sid_i = iommu_spec.args[0];
+	}
+
 	if (target) {
 		of_node_put(target);
 	} else {
@@ -1156,8 +1163,11 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 		err_i = -EINVAL;
 	}
 
-	target = NULL;
-	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
+	err_m = of_map_msi_id(dev->of_node, rid, &msi_spec);
+	if (!err_m) {
+		target = msi_spec.np;
+		sid_m = msi_spec.args[0];
+	}
 
 	/*
 	 *   err_m      target
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a0937b7b3c4d..2e86f8fd300b 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 {
 	u32 sid, rid = pci_dev_id(pdev);
 	struct apple_pcie_port *port;
+	struct of_phandle_args iommu_spec = { .np = NULL };
 	int idx, err;
 
 	port = apple_pcie_get_port(pdev);
@@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
 		pci_name(pdev->bus->self), port->idx);
 
-	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
+	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
 	if (err)
 		return err;
 
+	of_node_put(iommu_spec.np);
+	sid = iommu_spec.args[0];
 	mutex_lock(&port->pcie->lock);
 
 	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 1b7696b2d762..36547d7cf1d6 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -319,13 +319,13 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 					   struct device_node *np,
 					   domid_t *backend_domid)
 {
-	struct of_phandle_args iommu_spec = { .args_count = 1 };
+	struct of_phandle_args iommu_spec = { .np = NULL };
 
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
 
-		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
+		if (of_map_iommu_id(np, rid, &iommu_spec)) {
 			dev_dbg(dev, "Cannot translate ID\n");
 			return -ESRCH;
 		}
diff --git a/include/linux/of.h b/include/linux/of.h
index fe841f3cc747..f50d7a3a3b28 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -463,13 +463,13 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out);
+	       struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct device_node **target, u32 *id_out);
+		    struct of_phandle_args *arg);
 
 int of_map_msi_id(const struct device_node *np, u32 id,
-		  struct device_node **target, u32 *id_out);
+		  struct of_phandle_args *arg);
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
@@ -935,19 +935,19 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 
 static inline int of_map_id(const struct device_node *np, u32 id,
 			     const char *map_name, const char *map_mask_name,
-			     struct device_node **target, u32 *id_out)
+			     struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }
 
 static inline int of_map_iommu_id(const struct device_node *np, u32 id,
-				  struct device_node **target, u32 *id_out)
+				  struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }
 
 static inline int of_map_msi_id(const struct device_node *np, u32 id,
-				struct device_node **target, u32 *id_out)
+				struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }

-- 
2.34.1


