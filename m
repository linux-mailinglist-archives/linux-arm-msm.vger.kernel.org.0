Return-Path: <linux-arm-msm+bounces-113704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zwTmFSa1M2o3FQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06069EB3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="T6ACa/PN";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c0J+24hc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113704-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113704-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F247B30B52D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7426380FF9;
	Thu, 18 Jun 2026 09:02:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500503546C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:02:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773350; cv=none; b=PQnP/K2Stk8Yc3+XhW63zJN4crC0z48g5Qv54a6Vg7TnOwEHEznZH5u80dQxXaNpw7q3GSfSzfFAlL0FJOy/6VJiwIv6Z3trX9E0Zgq1ClR+W2jcZ0T6gSYq3Kzpev7OSHfR5nQZwVh9gw8CLn+I3sCGXTdleCb7PfKp+h9tRcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773350; c=relaxed/simple;
	bh=goWwt4ufRDfEhhA0Tj8nkxEuYH+b7UabtZQ0Y2NUmDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A+8RULuezBc4FDXjd+si9aZmUo0I/7XNRF6+VCxcfTXqkVl1d/dAgd3ZqUw4odKfDSqf01NGRgw+1wmRLRRK2qsv+/1h7wAca01nxgjvR37bnLR6Ce5Ug2hHf5Kfj5DlzSJf11kC5VxaJPIcqIi3p3hZZ3p3gOi8Noi5WqJkn1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6ACa/PN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0J+24hc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dsbo2246964
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HPT/qvsIlzbU0wG9iW7WVZ
	Y5cZKw1RR5KoJ88EMr3FM=; b=T6ACa/PNPg7RnPIfRkcN2JqoJyC824mvzD2p0E
	O2GMmqRILqZ9TvqrHCDDlluXal88jrHbcoBmAI61yJMOxq6ZkCV/7qPiOR2cFgmJ
	7j9ygM+CBGFzNxd6M7UrNu+lWo8OMokiWKYHk/AQ4XUsaC3xRwujW4DLo6oSdPG7
	Ubdfq1+dAkEgX1vdlyaN+bkp+kOzxdiMEqb9ngAs9idk9zxl2nYnuzA9lKKC3dyC
	G+QcIhOT5R/7GAxrSHkHBOKGLEMpRRnqlEJXEJ8CQmWAa2Nm8lNUgXkaodBg+4N1
	+RZe8O+JICckvmzfdmVV967sRbS6pK3Pb1FLBlShMORDEJHQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vm4w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:02:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso539292a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773347; x=1782378147; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPT/qvsIlzbU0wG9iW7WVZY5cZKw1RR5KoJ88EMr3FM=;
        b=c0J+24hc8xzAya0nSiOr/JoYTI1ox6i8IxpDLU00KseqASQfK/0tpBQmvpXV0m6Oki
         IHxkBj3eSxzJ+CSUGZKgeRqUVSykanOFQ3MnLevQhIXXvEKuwC2AzAINcm4zFlB8ie5a
         Vsudbbxd/+bcLnvXGascyCf9MKah6MTD6rtEumm5qZQ3PbTlJQilDbLN7moy1CgRhS+n
         YQiJ4PXFFWz/33IzFnEUnXBDqWgTC/HHljsvJbGxKilTzICtxg9DKG/NrP2TZJRpY0po
         ID9N0U43EY4w57SnXp30aSJIXoQ/eRLT46majwLGf90TKX/DzRjQ+g2iQh5qfTQ0eHDx
         Ab/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773347; x=1782378147;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPT/qvsIlzbU0wG9iW7WVZY5cZKw1RR5KoJ88EMr3FM=;
        b=Fl6HFJuVHl8mYddd6uZNXr7DYeicyQm/3KP5YC08BAiK/wR5QUWkl8ZaMZ6cMYhl4K
         0LZb7JwU/EpJERDw6EIhxheI1Iu+ddt1KJKxAaB0xxoypkwUzEODS8yWwdiKFTwrGOae
         6fpSjpsuq7NKk5jxr6y7SsdLPlPDZH0SOaN8l6oriINrUhaZIC+OewrCMHYc1xYX3ANO
         nzb5SnDiR35gG4HDlMKqloPtS7erMj79F7fLwIBOW3HtbiGcqqK/7F20Z6PQ+Z8N500d
         /9zR100YMzz8a3rXvK0rBFEhnf+K8/Qqw3khMZLoUpaZnBSFmjrnVSfm8eS0g6r3UZUB
         V+Bw==
X-Gm-Message-State: AOJu0Yxq+ZVzdZMxZoLu3xMZ1etM+C857bo4U1SZyEPpl3OL0/SgT+Eb
	rCpBIfdcDmgnRzOl+w5GPEEbtIaW7Fd1PtWCQRbwFzeCV0662upyrkMUPW8jLVrZJbDzjew1cGq
	kwVPXriKvJsUiiLUwnRLWjiTQT+eYovlAGIF90Kn7/BE+MzK4RLtrf6bVpIZuhLeydT8r
X-Gm-Gg: Acq92OEuxjzdzwnmCjtSm5T7xeTi8pevYaw40JLmkRGchfnw35JDKWvBKpk0+zM1slh
	Jo60jGe+9d2HquBkz/sAUYKZ6cDIgSnHDtZLL48I88cWThi2RAwHBAL05OH5jfnZbJDQIxvQ1pL
	MGMpPML5skRh6hnh5QbSD1iUqtHmPIgBAeNfRiE90JybIQcgcVp6ZNuep9A7ylzN7MEAKuyaRQu
	ptpnfnPcn+niwvqKP9K4gLC6dZoevZF8FIOMb+EmRBSGxhsFAADMl18pa1HziAKXskdJRWsCmf3
	ULtSlOAaJOlVclWgiF5ML6Pxxil9NSBLCoFozECAfcpMhP7md3bT8sIkBBulu0cMuYL9JZlJ16K
	R2YTGbCERg5lMgli6mk3YOIggN7Qo4b1bHURl5oMyavwY+g==
X-Received: by 2002:a05:6a00:760a:b0:845:286d:4675 with SMTP id d2e1a72fcca58-845286d4993mr5891053b3a.10.1781773346601;
        Thu, 18 Jun 2026 02:02:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:760a:b0:845:286d:4675 with SMTP id d2e1a72fcca58-845286d4993mr5890993b3a.10.1781773345898;
        Thu, 18 Jun 2026 02:02:25 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8453a8c9770sm2012769b3a.40.2026.06.18.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:02:25 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:32:09 +0530
Subject: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABC0M2oC/yXMTQqAIBBA4avErBNS+r9KRKRNNUEaahFEd89q+
 S3eu8ChJXRQRxdYPMiR0QE8jkDNvZ6Q0RAMIhF5kvOSkVnXvVNGe5q6mbRnBe8xrfgoZSYgdJv
 Fkc7v2bS/3S4XVP4dwX0/TJZ6HnUAAAA=
X-Change-ID: 20260618-iommu_contig_hint-71ae491fbb52
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773342; l=13018;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=KqqlwykCZOolpKs5ikihTyrCjA8PeTCq94/xbXaFyZU=;
 b=KbyZoxjGDXs5AUE5GEivZvb5w5JJwxA9MviXPcwtkZdZFZBtO5oeJH53M2sceO48NHznVYCzy
 qfXRYJh3NbRA/prljT9BiArQ6eSf3DAAZWhigTlmcU2ola5YdvQW6ZW
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: oLsNKbmWU9ng7BnB7PSwxiNVTTjTiuPf
X-Proofpoint-GUID: oLsNKbmWU9ng7BnB7PSwxiNVTTjTiuPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX4pv5kr1KdXNO
 pfC4TcmAvMcoGA0+aaTlsPzZ7kp85K5JTNaZCyw/CYylylhjsWzOh8X2tMADzBLb/PBFXlfG2LD
 VYlhUgfB/aLObRU5KWv9/gssWbjdQAJvWYOulAYq1DXp1UnpfHwp+t4tLgF9mzC6TZmKh/CqxVj
 2dQ0lIhuUWojMWce3QT0tMTZEKA6DSkCKObRBlNv5ZSTSudPzkTauKumHs0MLOrv9hRFiXY0qYL
 /JTbf4TWyE/e5lUEWIslBlzGuHAc1JfxYpDikdmsZQKqZn3bMcRLnGY+vovVdVAF46AMORGMkKg
 B8f7QoEhhpeffLqTFb/KiA/4V7RX+QgRINnJcAPFuzUpLZqg7QBTT/m5WqyYGEnsNuyXDa6VHd6
 f98zk/+P7ohxrS2L00zXQ7d9JHAdpA+js1U9BPqf6F94LalRa9YHDImo6Z7rNxylHkaGKBO/hI/
 BTAOcZPKiFQf6KtPOEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX7NfczE73+/3M
 Lf/RAFwft818cDWfT8QULYGowTpKoSldvbSwMFm+19bSPbHslWK8JEBe78Iu+lFAk6azWar+Zjt
 sRaSaTbBobY+ly9KT5zBsw2avOM31KI=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33b423 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ood6XOM2BuclmvQ8xa4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113704-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,m:vijayanand.jitta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD06069EB3C

From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
When a set of consecutive PTEs map a naturally-aligned contiguous block
of memory, the CONT bit can be set on all entries in the group to allow
the hardware to combine them into a single TLB entry, improving TLB
utilization.

The contiguous hint sizes per granule are:

  Page Size | CONT PTE |  PMD  | CONT PMD
  ----------+----------+-------+---------
      4K    |   64K    |   2M  |   32M
     16K    |    2M    |  32M  |    1G
     64K    |    2M    | 512M  |   16G

Contiguous hint sizes are advertised in pgsize_bitmap, analogous to
how the CPU MMU advertises them via hugetlb hstates, so that IOMMU API
users (e.g. __iommu_dma_alloc_pages()) can align allocations to these
sizes and benefit from the TLB optimization automatically.

Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
provides a compile-time opt-out for hardware affected by SMMU errata
related to the contiguous bit.

On the mapping side, __arm_lpae_map() detects when the requested size
matches a contiguous range at the next level, sets the CONT bit on all
PTEs in the group, then recurses with the base block size and an
adjusted pgcount.

On the unmapping side, the CONT bit is cleared from all PTEs in the
affected contiguous group before any individual entry is invalidated,
following the Break-Before-Make requirement of the architecture.

Tested on QEMU (arm64/SMMUv3) with iommu_map()/iommu_unmap() of
contiguous hint sizes; verified the CONT bit is correctly set on map
and cleared on unmap via page table walk.

Co-developed-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
 drivers/iommu/Kconfig          |  16 +++
 drivers/iommu/io-pgtable-arm.c | 216 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 226 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6e07bd69467a3..1c514361c5c9e 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -50,6 +50,22 @@ config IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST
 
 	  If unsure, say N here.
 
+config IOMMU_IO_PGTABLE_CONTIG_HINT
+	bool "Enable contiguous hint"
+	depends on IOMMU_IO_PGTABLE_LPAE
+	default y
+	help
+	  Enable contiguous hint (CONT bit) support for the ARM LPAE page
+	  table allocator. Contiguous hint sizes are advertised in the
+	  pgsize_bitmap so that IOMMU API users can align allocations to
+	  these sizes and benefit from improved TLB utilization, analogous
+	  to how the CPU MMU advertises contiguous sizes via hugetlb.
+
+	  Disabling this option provides a compile-time opt-out for
+	  hardware affected by SMMU errata related to the contiguous bit.
+
+	  If unsure, say Y here.
+
 config IOMMU_IO_PGTABLE_ARMV7S
 	bool "ARMv7/v8 Short Descriptor Format"
 	select IOMMU_IO_PGTABLE
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631af..9fc60520177f1 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -86,6 +86,21 @@
 /* Software bit for solving coherency races */
 #define ARM_LPAE_PTE_SW_SYNC		(((arm_lpae_iopte)1) << 55)
 
+/* PTE Contiguous Bit */
+#define ARM_LPAE_PTE_CONT		(((arm_lpae_iopte)1) << 52)
+
+/*
+ * CONTIG HINT SUPPORT TABLE
+ *
+ *---------------------------------------------------
+ *| Page Size | CONT PTE |  PMD  | CONT PMD |  PUD  |
+ *---------------------------------------------------
+ *|     4K    |   64K    |   2M  |    32M   |   1G  |
+ *|    16K    |    2M    |  32M  |     1G   |       |
+ *|    64K    |    2M    | 512M  |    16G   |       |
+ *---------------------------------------------------
+ */
+
 /* Stage-1 PTE */
 #define ARM_LPAE_PTE_AP_UNPRIV		(((arm_lpae_iopte)1) << 6)
 #define ARM_LPAE_PTE_AP_RDONLY_BIT	7
@@ -453,6 +468,111 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
 	return old;
 }
 
+#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
+static inline int arm_lpae_cont_ptes(unsigned long size)
+{
+	if (size == SZ_4K)
+		return 16;
+	if (size == SZ_16K)
+		return 128;
+	if (size == SZ_64K)
+		return 32;
+	return 1;
+}
+
+static inline unsigned long arm_lpae_cont_pte_size(unsigned long size)
+{
+	return arm_lpae_cont_ptes(size) * size;
+}
+
+static inline int arm_lpae_cont_pmds(unsigned long size)
+{
+	if (size == SZ_2M)
+		return 16;
+	if (size == SZ_32M)
+		return 32;
+	if (size == SZ_512M)
+		return 32;
+	return 1;
+}
+
+static inline unsigned long arm_lpae_cont_pmd_size(unsigned long size)
+{
+	return arm_lpae_cont_pmds(size) * size;
+}
+
+static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
+{
+	unsigned long pg_size, pmd_size;
+	int pg_shift, bits_per_level;
+
+	if (!cfg->pgsize_bitmap)
+		return 0;
+
+	pg_shift = __ffs(cfg->pgsize_bitmap);
+	bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
+	pg_size = (1UL << pg_shift);
+	pmd_size = (pg_size << bits_per_level);
+
+	return (arm_lpae_cont_pte_size(pg_size) | arm_lpae_cont_pmd_size(pmd_size));
+}
+
+static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
+{
+	if (lvl == ARM_LPAE_MAX_LEVELS - 2)
+		return arm_lpae_cont_pmds(ARM_LPAE_BLOCK_SIZE(lvl, data));
+	else if (lvl == ARM_LPAE_MAX_LEVELS - 1)
+		return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data));
+	else
+		return 1;
+}
+
+static u32 arm_lpae_check_num_cont(struct arm_lpae_io_pgtable *data, size_t size, int lvl)
+{
+	int num_cont;
+
+	num_cont = arm_lpae_find_num_cont(data, lvl);
+	if (size == num_cont * ARM_LPAE_BLOCK_SIZE(lvl, data))
+		return num_cont;
+	else
+		return 1;
+}
+
+static bool arm_lpae_pte_is_contiguous_range(struct arm_lpae_io_pgtable *data,
+					     unsigned long size,
+					     int lvl, u32 *num_cont)
+{
+	unsigned long block_size;
+
+	*num_cont = arm_lpae_find_num_cont(data, lvl);
+	block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+
+	return (size == ((*num_cont) * block_size));
+}
+#else
+static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
+{
+	return 0;
+}
+
+static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
+{
+	return 1;
+}
+
+static u32 arm_lpae_check_num_cont(struct arm_lpae_io_pgtable *data, size_t size, int lvl)
+{
+	return 1;
+}
+
+static bool arm_lpae_pte_is_contiguous_range(struct arm_lpae_io_pgtable *data,
+					     unsigned long size,
+					     int lvl, u32 *num_cont)
+{
+	return false;
+}
+#endif
+
 static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 			  phys_addr_t paddr, size_t size, size_t pgcount,
 			  arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
@@ -463,6 +583,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 	size_t tblsz = ARM_LPAE_GRANULE(data);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	int ret = 0, num_entries, max_entries, map_idx_start;
+	u32 num_cont = 1;
 
 	/* Find our entry at the current level */
 	map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
@@ -505,6 +626,24 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		return -EEXIST;
 	}
 
+	if (arm_lpae_pte_is_contiguous_range(data, size, lvl + 1, &num_cont)) {
+		size_t ct_size = ARM_LPAE_BLOCK_SIZE(lvl + 1, data);
+
+		/* Set cont bit */
+		prot |= ARM_LPAE_PTE_CONT;
+
+		/*
+		 * Since size here would be of CONT_PTE or CONT_PMD (e.g. SZ_64K/SZ_32M
+		 * in case of 4K PAGE_SIZE), but actual mappings are in multiples of
+		 * SZ_4K/SZ_2M, call __arm_lpae_map with ct_size and update pgcount
+		 * accordingly by num_cont * pgcount.
+		 */
+		ret = __arm_lpae_map(data, iova, paddr, ct_size,
+				     num_cont * pgcount,
+				     prot, lvl + 1, cptep, gfp, mapped);
+		return ret;
+	}
+
 	/* Rinse, repeat */
 	return __arm_lpae_map(data, iova, paddr, size, pgcount, prot, lvl + 1,
 			      cptep, gfp, mapped);
@@ -653,6 +792,48 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	kfree(data);
 }
 
+#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
+static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
+				unsigned long iova, int lvl,
+				arm_lpae_iopte *ptep, size_t num_entries)
+{
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	u32 num_cont = arm_lpae_find_num_cont(data, lvl);
+	arm_lpae_iopte *cont_ptep;
+	arm_lpae_iopte *cont_ptep_start;
+	unsigned long cont_iova;
+	int offset, itr;
+
+	cont_ptep = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
+	cont_iova = round_down(iova,
+			       ARM_LPAE_BLOCK_SIZE(lvl, data) * num_cont);
+	cont_ptep += ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
+	cont_ptep_start = cont_ptep;
+
+	/*
+	 * iova may not be aligned to the contiguous group boundary; include
+	 * any leading entries so round_up() covers all overlapping groups.
+	 */
+	offset = ARM_LPAE_LVL_IDX(iova, lvl, data) -
+		 ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
+	num_entries = round_up(offset + num_entries, num_cont);
+
+	for (itr = 0; itr < num_entries; itr++) {
+		WRITE_ONCE(*cont_ptep, READ_ONCE(*cont_ptep) & ~ARM_LPAE_PTE_CONT);
+		cont_ptep++;
+	}
+
+	if (!cfg->coherent_walk)
+		__arm_lpae_sync_pte(cont_ptep_start, num_entries, cfg);
+}
+#else
+static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
+				unsigned long iova, int lvl,
+				arm_lpae_iopte *ptep, size_t num_entries)
+{
+}
+#endif
+
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 			       struct iommu_iotlb_gather *gather,
 			       unsigned long iova, size_t size, size_t pgcount,
@@ -660,7 +841,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 {
 	arm_lpae_iopte pte;
 	struct io_pgtable *iop = &data->iop;
-	int i = 0, num_entries, max_entries, unmap_idx_start;
+	int i = 0, num_cont = 1, num_entries, max_entries, unmap_idx_start;
 
 	/* Something went horribly wrong and we ran out of page table */
 	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
@@ -675,9 +856,15 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	}
 
 	/* If the size matches this level, we're in the right place */
-	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
+	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data) ||
+	    (size == arm_lpae_find_num_cont(data, lvl) *
+		     ARM_LPAE_BLOCK_SIZE(lvl, data))) {
+		size_t pte_size;
+
 		max_entries = arm_lpae_max_entries(unmap_idx_start, data);
-		num_entries = min_t(int, pgcount, max_entries);
+		num_cont = arm_lpae_check_num_cont(data, size, lvl);
+		num_entries = min_t(int, num_cont * pgcount, max_entries);
+		pte_size = size / num_cont;
 
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
@@ -687,11 +874,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 				break;
 			}
 
+			/*
+			 * Break-Before-Make: before invalidating any leaf
+			 * entry, clear the CONT bit from every entry in the
+			 * contiguous group(s) and flush the TLB, as required
+			 * by the architecture.  arm_lpae_cont_clear() covers
+			 * the full [iova, iova + num_entries * pte_size) range
+			 * via round_up(), so subsequent entries read back
+			 * CONT=0 and skip this block.
+			 */
+			if (pte & ARM_LPAE_PTE_CONT) {
+				arm_lpae_cont_clear(data, iova, lvl, ptep, num_entries);
+				io_pgtable_tlb_flush_walk(iop, iova,
+							  num_entries * pte_size,
+							  ARM_LPAE_GRANULE(data));
+			}
+
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
 
 				/* Also flush any partial walks */
-				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
+				io_pgtable_tlb_flush_walk(iop, iova + i * pte_size, pte_size,
 							  ARM_LPAE_GRANULE(data));
 				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
 			}
@@ -702,9 +905,9 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 
 		if (gather && !iommu_iotlb_gather_queued(gather))
 			for (int j = 0; j < i; j++)
-				io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
+				io_pgtable_tlb_add_page(iop, gather, iova + j * pte_size, pte_size);
 
-		return i * size;
+		return i * pte_size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
 		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
 		return 0;
@@ -943,6 +1146,7 @@ static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
 	}
 
 	cfg->pgsize_bitmap &= page_sizes;
+	cfg->pgsize_bitmap |= arm_lpae_get_cont_sizes(cfg);
 	cfg->ias = min(cfg->ias, max_addr_bits);
 	cfg->oas = min(cfg->oas, max_addr_bits);
 }

---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260618-iommu_contig_hint-71ae491fbb52

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


