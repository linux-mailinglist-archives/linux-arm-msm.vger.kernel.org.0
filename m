Return-Path: <linux-arm-msm+bounces-106053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBakHVnL+mlTSwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:02:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 178284D6359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 07:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23D3B303CE90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 05:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FC22D8DDB;
	Wed,  6 May 2026 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBcbtNRn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCmwxhwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD62E4257
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043682; cv=none; b=pi7l0FND4ItOIqGgLmgaqLae6i0N4hQ0/ep9d4c57O/YZRhndajtC56CNmN9vEkmHaC2pYdCLzyoKlzqwNg8WQqltERz6ywVISLOAsoBZdmGxObQlu+w8OqP8RfWMbFv6cVEGnxpXxJHeupv1Aj0HFR6aMSeOouUYhVnftYRkRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043682; c=relaxed/simple;
	bh=MC+gTHyuzbCFQ7MGbEHykQYQIXSqCBAEcgMZu5NOVWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHCxROpa3XshSTS78/V+nDYx3AOwFWr6DK+KGGAcxhtuUAsukzGyI532J09tQOTs12DvNqegqQU0EN4KUNJEagYjl4RwYValDLIMNaaU10eyTFScRPUuz4E4KVsq6FdGv3JTyc0N/jNj9vElKTMBc6MxrU9SKG3dm6oXm62gEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBcbtNRn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCmwxhwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645LrIoE152048
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 05:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xr0E73EkLGnOR6HR/oF+giSeEqh4Ur6LX6Iy0QgKyu4=; b=SBcbtNRnPvK7GScL
	vwnhQKLWJLHoK2ZUrF/4CEYomTfXSXl4S0HnXW+gMsSraHTFOXZPb0WosEFDfTG1
	CglesOSI6i4veFk9NILLzyy0HbUgK3NsxY3KqlKjN1JX+6cLGrfQlewDGVkgISl3
	vnFCIa+wsGshdhrHWojNR7YUqkn/xw3UBCatNb7dvkzDsxG6iRqUuEpQhP2LR1LA
	7mY+wru+5YsYZA3w4Ph0Ge+v92aF4zBMz6XmFwWB3qvDdbIFoGWTHEOE2s3K9U3w
	zS6FfsG51pi2kaW774lb6qotng5vLxVcHdkL5sNRbiCxzM1CNnSyt+XNQPQUlb1L
	guo10A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80b05p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:01:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-836d0184333so2863296b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 22:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043679; x=1778648479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xr0E73EkLGnOR6HR/oF+giSeEqh4Ur6LX6Iy0QgKyu4=;
        b=fCmwxhwAiHBt1w624Gjo8O7OhBw1dJkkstFhJF8BdKC2og0j5rI8EPU84H2pBhG/im
         LZMNS3c26naXix4LRhKvmRqR2EuG+N+Ljc/c8ZDeBLbGBhWDwCHZaOifVxhR3KrEYoqo
         GPitSQnrwAc8kxcoKKPjv2Pj0s1Me5viG+X2u5hVkTnDdxIx4A0/mcNPiCP6c6TrML5V
         l4i2ai0+7bP3cI6ktOo/lJKPD3c8p/abDRptrxWKacufXNMUYxUgwo25JvN1GB02QTaD
         Pye6/LC27RUdOTHkUTpg6KGTIRwvbM+XWUjv/IEnN6/wy5db0L+XtLbQFowYH9qIcx1D
         BekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043679; x=1778648479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xr0E73EkLGnOR6HR/oF+giSeEqh4Ur6LX6Iy0QgKyu4=;
        b=Nm8jRri9KdOh3VN0ioB2tWa9JJm+HD/8j2auVQb3vD/K2THgNUkGITuQeNUX73OJyR
         8kTx4gMAF08d0A61hCGl3+XIART3tTvDzXTzONm2DZ0D3SS/SBK6wFkNBZr3HLdtdxPe
         O7w+RTwc/FIfixPjf2J9kpTTT6DVVCgQVhuFWQmaT7kI5iZKL2N9GTlvK/CTXytk0Fg9
         cE14iCBMWGWMQLoBg0Sty70IsxYQCgYN7RaBwr73zRRbOf/W2gXeJh+wdy8a6g1xSa5h
         sfiAW9LTraajF4qjx1dLPrhpyqQRZzmJGkEVaOsT5PM9nPbenTAvCaz9EkAl0WkdTKuh
         4gLg==
X-Forwarded-Encrypted: i=1; AFNElJ+dUlVLs70eTRJfj2VWXnb33okM4afmaX30aWET4+FoXCpgt+qVq2RpoHOLooa9kLcmA9gYhu1+fpE0ivGS@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZa4pbNrdVxakCSTGsDAL8OJO9uPfVMcgpszGQt/bNGzV/fxr
	oev1RuhL1D5KoqNP+nwUSbXPaS9h+ljgD2SfMjj2NT19xmMV1qWc4RR5H0i6Sv8DlfJ5WPD5sQE
	eyAnJFn9F7V3+hB0XGRRc8GeAg7x0RHHPgd8xXrnDYa6AoEWsbJarQxSBXSC5zWilplcT
X-Gm-Gg: AeBDiesEjnpFrhWtb6lSZNB2i8DQgRFrV0XZB2W+X7V7MlwDsjKHvEeGfXCPEuQfc5l
	cDne03VF4wt6p4Jfeo+54FJCXujd3bIB29eXwy7cw63EixFILK4i6eV1mfnHxTO9b7FJ+Hl/7Cl
	daCI2WP1i/3xOG9ViK4Yj6smLJi4UdO7K5f3+0Ilvstt314GI2bNctt8qcJRU00isU1VpRtGzYd
	qD6LZQdqjA3AqGGdly4jaEoxBsdIx/sE/UukU8CHxotamYWoIPJz0XAxTr0Rc7RU3tNI8/OX5oB
	lx1pxA/ALSntmO32pt2oG8+9QHek/TW/k7xK55Bv8ghJGgfayqo5mvPmZ0o34FWZ6EXW+2uXXKQ
	PxITtLXxWh4WqZuY0w6urN2ODnjZ6daRBYC39mdiYLCp8WMQVvbm4sc8TeFE=
X-Received: by 2002:a05:6a00:1991:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-83a5d873ec9mr1647243b3a.31.1778043677976;
        Tue, 05 May 2026 22:01:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1991:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-83a5d873ec9mr1647187b3a.31.1778043677074;
        Tue, 05 May 2026 22:01:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/5] remoteproc: Move resource table data structure to its own header
Date: Wed,  6 May 2026 10:31:03 +0530
Message-ID: <20260506050107.1985033-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69facb1f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hqicfOp3TDPPg1m-M2YA:9 a=Y6HKh-LrsuiIPCo2:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cbGVqGI7_-2VbnfyT9MfW4Ht6zGw9a5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfXyKRz7K8BrVq6
 zRaQynV6N3SSjdRiI2A9csAoda0D/xtzbZtSt+AWdtzOHMrhGD8Q5e5C+zZH0omascBnmyUfJRX
 YanmPTtjIZJ5tbOglwzoTcA/RnSWvID63XdA9XortdcMhUyfm0xBfgOidmdimSRAnYlNMkSzag2
 jelWu2+0xWW1Sci6+0AhIn7HiGL4oEIDPRZoNI3Ah/ndM00agXM4ztfUElF7fqYAYKzpkgE0bCU
 ZeEQwKvAql1WvtOATaFhOT7r8U7M9u8YhDar3SeyI6kcWj4C2ro2TnkerT5Lr2iuo0SDPElN3BI
 /dfhUDxWMubNZsCs5XGRftdsPMv4JbqVbgl7thN3F2G+nZc5XrQ0Rq+4nEegukbWDSUP8X82fVK
 kwRJWHHQ7YupknykzCnzcpOuALNSCR9fMgPW68eNhU2lHE28/OAzRB+54aHcurfe4DKEZ/Usez2
 W5xXhQ3a7oeTMjvOuJQ==
X-Proofpoint-GUID: cbGVqGI7_-2VbnfyT9MfW4Ht6zGw9a5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060046
X-Rspamd-Queue-Id: 178284D6359
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106053-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The resource table data structure has traditionally been associated with
the remoteproc framework, where the resource table is included as a
section within the remote processor firmware binary. However, it is also
possible to obtain the resource table through other means—such as from a
reserved memory region populated by the boot firmware, statically
maintained driver data, or via a secure SMC call—when it is not embedded
in the firmware.

There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
etc.) in the upstream kernel that do not use the remoteproc framework to
manage their lifecycle for various reasons.

When Linux is running at EL2, similar to the Qualcomm PAS driver
(qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
also want to use the resource table SMC call to retrieve and map
resources before they are used by the remote processor.

In such cases, the resource table data structure is no longer tightly
coupled with the remoteproc headers. Client drivers that do not use the
remoteproc framework should still be able to parse the resource table
obtained through alternative means. Therefore, there is a need to
decouple the resource table definitions from the remoteproc headers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 269 +-------------------------------
 include/linux/rsc_table.h  | 306 +++++++++++++++++++++++++++++++++++++
 2 files changed, 307 insertions(+), 268 deletions(-)
 create mode 100644 include/linux/rsc_table.h

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..7c1546d48008 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -42,274 +42,7 @@
 #include <linux/completion.h>
 #include <linux/idr.h>
 #include <linux/of.h>
-
-/**
- * struct resource_table - firmware resource table header
- * @ver: version number
- * @num: number of resource entries
- * @reserved: reserved (must be zero)
- * @offset: array of offsets pointing at the various resource entries
- *
- * A resource table is essentially a list of system resources required
- * by the remote processor. It may also include configuration entries.
- * If needed, the remote processor firmware should contain this table
- * as a dedicated ".resource_table" ELF section.
- *
- * Some resources entries are mere announcements, where the host is informed
- * of specific remoteproc configuration. Other entries require the host to
- * do something (e.g. allocate a system resource). Sometimes a negotiation
- * is expected, where the firmware requests a resource, and once allocated,
- * the host should provide back its details (e.g. address of an allocated
- * memory region).
- *
- * The header of the resource table, as expressed by this structure,
- * contains a version number (should we need to change this format in the
- * future), the number of available resource entries, and their offsets
- * in the table.
- *
- * Immediately following this header are the resource entries themselves,
- * each of which begins with a resource entry header (as described below).
- */
-struct resource_table {
-	u32 ver;
-	u32 num;
-	u32 reserved[2];
-	u32 offset[];
-} __packed;
-
-/**
- * struct fw_rsc_hdr - firmware resource entry header
- * @type: resource type
- * @data: resource data
- *
- * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
- * its @type. The content of the entry itself will immediately follow
- * this header, and it should be parsed according to the resource type.
- */
-struct fw_rsc_hdr {
-	u32 type;
-	u8 data[];
-} __packed;
-
-/**
- * enum fw_resource_type - types of resource entries
- *
- * @RSC_CARVEOUT:   request for allocation of a physically contiguous
- *		    memory region.
- * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
- * @RSC_TRACE:	    announces the availability of a trace buffer into which
- *		    the remote processor will be writing logs.
- * @RSC_VDEV:       declare support for a virtio device, and serve as its
- *		    virtio header.
- * @RSC_LAST:       just keep this one at the end of standard resources
- * @RSC_VENDOR_START:	start of the vendor specific resource types range
- * @RSC_VENDOR_END:	end of the vendor specific resource types range
- *
- * For more details regarding a specific resource type, please see its
- * dedicated structure below.
- *
- * Please note that these values are used as indices to the rproc_handle_rsc
- * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
- * check the validity of an index before the lookup table is accessed, so
- * please update it as needed.
- */
-enum fw_resource_type {
-	RSC_CARVEOUT		= 0,
-	RSC_DEVMEM		= 1,
-	RSC_TRACE		= 2,
-	RSC_VDEV		= 3,
-	RSC_LAST		= 4,
-	RSC_VENDOR_START	= 128,
-	RSC_VENDOR_END		= 512,
-};
-
-#define FW_RSC_ADDR_ANY (-1)
-
-/**
- * struct fw_rsc_carveout - physically contiguous memory request
- * @da: device address
- * @pa: physical address
- * @len: length (in bytes)
- * @flags: iommu protection flags
- * @reserved: reserved (must be zero)
- * @name: human-readable name of the requested memory region
- *
- * This resource entry requests the host to allocate a physically contiguous
- * memory region.
- *
- * These request entries should precede other firmware resource entries,
- * as other entries might request placing other data objects inside
- * these memory regions (e.g. data/code segments, trace resource entries, ...).
- *
- * Allocating memory this way helps utilizing the reserved physical memory
- * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
- * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
- * pressure is important; it may have a substantial impact on performance.
- *
- * If the firmware is compiled with static addresses, then @da should specify
- * the expected device address of this memory region. If @da is set to
- * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
- * overwrite @da with the dynamically allocated address.
- *
- * We will always use @da to negotiate the device addresses, even if it
- * isn't using an iommu. In that case, though, it will obviously contain
- * physical addresses.
- *
- * Some remote processors needs to know the allocated physical address
- * even if they do use an iommu. This is needed, e.g., if they control
- * hardware accelerators which access the physical memory directly (this
- * is the case with OMAP4 for instance). In that case, the host will
- * overwrite @pa with the dynamically allocated physical address.
- * Generally we don't want to expose physical addresses if we don't have to
- * (remote processors are generally _not_ trusted), so we might want to
- * change this to happen _only_ when explicitly required by the hardware.
- *
- * @flags is used to provide IOMMU protection flags, and @name should
- * (optionally) contain a human readable name of this carveout region
- * (mainly for debugging purposes).
- */
-struct fw_rsc_carveout {
-	u32 da;
-	u32 pa;
-	u32 len;
-	u32 flags;
-	u32 reserved;
-	u8 name[32];
-} __packed;
-
-/**
- * struct fw_rsc_devmem - iommu mapping request
- * @da: device address
- * @pa: physical address
- * @len: length (in bytes)
- * @flags: iommu protection flags
- * @reserved: reserved (must be zero)
- * @name: human-readable name of the requested region to be mapped
- *
- * This resource entry requests the host to iommu map a physically contiguous
- * memory region. This is needed in case the remote processor requires
- * access to certain memory-based peripherals; _never_ use it to access
- * regular memory.
- *
- * This is obviously only needed if the remote processor is accessing memory
- * via an iommu.
- *
- * @da should specify the required device address, @pa should specify
- * the physical address we want to map, @len should specify the size of
- * the mapping and @flags is the IOMMU protection flags. As always, @name may
- * (optionally) contain a human readable name of this mapping (mainly for
- * debugging purposes).
- *
- * Note: at this point we just "trust" those devmem entries to contain valid
- * physical addresses, but this isn't safe and will be changed: eventually we
- * want remoteproc implementations to provide us ranges of physical addresses
- * the firmware is allowed to request, and not allow firmwares to request
- * access to physical addresses that are outside those ranges.
- */
-struct fw_rsc_devmem {
-	u32 da;
-	u32 pa;
-	u32 len;
-	u32 flags;
-	u32 reserved;
-	u8 name[32];
-} __packed;
-
-/**
- * struct fw_rsc_trace - trace buffer declaration
- * @da: device address
- * @len: length (in bytes)
- * @reserved: reserved (must be zero)
- * @name: human-readable name of the trace buffer
- *
- * This resource entry provides the host information about a trace buffer
- * into which the remote processor will write log messages.
- *
- * @da specifies the device address of the buffer, @len specifies
- * its size, and @name may contain a human readable name of the trace buffer.
- *
- * After booting the remote processor, the trace buffers are exposed to the
- * user via debugfs entries (called trace0, trace1, etc..).
- */
-struct fw_rsc_trace {
-	u32 da;
-	u32 len;
-	u32 reserved;
-	u8 name[32];
-} __packed;
-
-/**
- * struct fw_rsc_vdev_vring - vring descriptor entry
- * @da: device address
- * @align: the alignment between the consumer and producer parts of the vring
- * @num: num of buffers supported by this vring (must be power of two)
- * @notifyid: a unique rproc-wide notify index for this vring. This notify
- * index is used when kicking a remote processor, to let it know that this
- * vring is triggered.
- * @pa: physical address
- *
- * This descriptor is not a resource entry by itself; it is part of the
- * vdev resource type (see below).
- *
- * Note that @da should either contain the device address where
- * the remote processor is expecting the vring, or indicate that
- * dynamically allocation of the vring's device address is supported.
- */
-struct fw_rsc_vdev_vring {
-	u32 da;
-	u32 align;
-	u32 num;
-	u32 notifyid;
-	u32 pa;
-} __packed;
-
-/**
- * struct fw_rsc_vdev - virtio device header
- * @id: virtio device id (as in virtio_ids.h)
- * @notifyid: a unique rproc-wide notify index for this vdev. This notify
- * index is used when kicking a remote processor, to let it know that the
- * status/features of this vdev have changes.
- * @dfeatures: specifies the virtio device features supported by the firmware
- * @gfeatures: a place holder used by the host to write back the
- * negotiated features that are supported by both sides.
- * @config_len: the size of the virtio config space of this vdev. The config
- * space lies in the resource table immediate after this vdev header.
- * @status: a place holder where the host will indicate its virtio progress.
- * @num_of_vrings: indicates how many vrings are described in this vdev header
- * @reserved: reserved (must be zero)
- * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
- *
- * This resource is a virtio device header: it provides information about
- * the vdev, and is then used by the host and its peer remote processors
- * to negotiate and share certain virtio properties.
- *
- * By providing this resource entry, the firmware essentially asks remoteproc
- * to statically allocate a vdev upon registration of the rproc (dynamic vdev
- * allocation is not yet supported).
- *
- * Note:
- * 1. unlike virtualization systems, the term 'host' here means
- *    the Linux side which is running remoteproc to control the remote
- *    processors. We use the name 'gfeatures' to comply with virtio's terms,
- *    though there isn't really any virtualized guest OS here: it's the host
- *    which is responsible for negotiating the final features.
- *    Yeah, it's a bit confusing.
- *
- * 2. immediately following this structure is the virtio config space for
- *    this vdev (which is specific to the vdev; for more info, read the virtio
- *    spec). The size of the config space is specified by @config_len.
- */
-struct fw_rsc_vdev {
-	u32 id;
-	u32 notifyid;
-	u32 dfeatures;
-	u32 gfeatures;
-	u32 config_len;
-	u8 status;
-	u8 num_of_vrings;
-	u8 reserved[2];
-	struct fw_rsc_vdev_vring vring[];
-} __packed;
+#include <linux/rsc_table.h>
 
 struct rproc;
 
diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
new file mode 100644
index 000000000000..c32c8b6cd2a7
--- /dev/null
+++ b/include/linux/rsc_table.h
@@ -0,0 +1,306 @@
+/*
+ * Resource table and its types data structure
+ *
+ * Copyright(c) 2011 Texas Instruments, Inc.
+ * Copyright(c) 2011 Google, Inc.
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ *   notice, this list of conditions and the following disclaimer.
+ * * Redistributions in binary form must reproduce the above copyright
+ *   notice, this list of conditions and the following disclaimer in
+ *   the documentation and/or other materials provided with the
+ *   distribution.
+ * * Neither the name Texas Instruments nor the names of its
+ *   contributors may be used to endorse or promote products derived
+ *   from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef RSC_TABLE_H
+#define RSC_TABLE_H
+
+/**
+ * struct resource_table - firmware resource table header
+ * @ver: version number
+ * @num: number of resource entries
+ * @reserved: reserved (must be zero)
+ * @offset: array of offsets pointing at the various resource entries
+ *
+ * A resource table is essentially a list of system resources required
+ * by the remote processor. It may also include configuration entries.
+ * If needed, the remote processor firmware should contain this table
+ * as a dedicated ".resource_table" ELF section.
+ *
+ * Some resources entries are mere announcements, where the host is informed
+ * of specific remoteproc configuration. Other entries require the host to
+ * do something (e.g. allocate a system resource). Sometimes a negotiation
+ * is expected, where the firmware requests a resource, and once allocated,
+ * the host should provide back its details (e.g. address of an allocated
+ * memory region).
+ *
+ * The header of the resource table, as expressed by this structure,
+ * contains a version number (should we need to change this format in the
+ * future), the number of available resource entries, and their offsets
+ * in the table.
+ *
+ * Immediately following this header are the resource entries themselves,
+ * each of which begins with a resource entry header (as described below).
+ */
+struct resource_table {
+	u32 ver;
+	u32 num;
+	u32 reserved[2];
+	u32 offset[];
+} __packed;
+
+/**
+ * struct fw_rsc_hdr - firmware resource entry header
+ * @type: resource type
+ * @data: resource data
+ *
+ * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
+ * its @type. The content of the entry itself will immediately follow
+ * this header, and it should be parsed according to the resource type.
+ */
+struct fw_rsc_hdr {
+	u32 type;
+	u8 data[];
+} __packed;
+
+/**
+ * enum fw_resource_type - types of resource entries
+ *
+ * @RSC_CARVEOUT:   request for allocation of a physically contiguous
+ *		    memory region.
+ * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
+ * @RSC_TRACE:	    announces the availability of a trace buffer into which
+ *		    the remote processor will be writing logs.
+ * @RSC_VDEV:       declare support for a virtio device, and serve as its
+ *		    virtio header.
+ * @RSC_LAST:       just keep this one at the end of standard resources
+ * @RSC_VENDOR_START:	start of the vendor specific resource types range
+ * @RSC_VENDOR_END:	end of the vendor specific resource types range
+ *
+ * For more details regarding a specific resource type, please see its
+ * dedicated structure below.
+ *
+ * Please note that these values are used as indices to the rproc_handle_rsc
+ * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
+ * check the validity of an index before the lookup table is accessed, so
+ * please update it as needed.
+ */
+enum fw_resource_type {
+	RSC_CARVEOUT		= 0,
+	RSC_DEVMEM		= 1,
+	RSC_TRACE		= 2,
+	RSC_VDEV		= 3,
+	RSC_LAST		= 4,
+	RSC_VENDOR_START	= 128,
+	RSC_VENDOR_END		= 512,
+};
+
+#define FW_RSC_ADDR_ANY (-1)
+
+/**
+ * struct fw_rsc_carveout - physically contiguous memory request
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @flags: iommu protection flags
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the requested memory region
+ *
+ * This resource entry requests the host to allocate a physically contiguous
+ * memory region.
+ *
+ * These request entries should precede other firmware resource entries,
+ * as other entries might request placing other data objects inside
+ * these memory regions (e.g. data/code segments, trace resource entries, ...).
+ *
+ * Allocating memory this way helps utilizing the reserved physical memory
+ * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
+ * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
+ * pressure is important; it may have a substantial impact on performance.
+ *
+ * If the firmware is compiled with static addresses, then @da should specify
+ * the expected device address of this memory region. If @da is set to
+ * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
+ * overwrite @da with the dynamically allocated address.
+ *
+ * We will always use @da to negotiate the device addresses, even if it
+ * isn't using an iommu. In that case, though, it will obviously contain
+ * physical addresses.
+ *
+ * Some remote processors needs to know the allocated physical address
+ * even if they do use an iommu. This is needed, e.g., if they control
+ * hardware accelerators which access the physical memory directly (this
+ * is the case with OMAP4 for instance). In that case, the host will
+ * overwrite @pa with the dynamically allocated physical address.
+ * Generally we don't want to expose physical addresses if we don't have to
+ * (remote processors are generally _not_ trusted), so we might want to
+ * change this to happen _only_ when explicitly required by the hardware.
+ *
+ * @flags is used to provide IOMMU protection flags, and @name should
+ * (optionally) contain a human readable name of this carveout region
+ * (mainly for debugging purposes).
+ */
+struct fw_rsc_carveout {
+	u32 da;
+	u32 pa;
+	u32 len;
+	u32 flags;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+/**
+ * struct fw_rsc_devmem - iommu mapping request
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @flags: iommu protection flags
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the requested region to be mapped
+ *
+ * This resource entry requests the host to iommu map a physically contiguous
+ * memory region. This is needed in case the remote processor requires
+ * access to certain memory-based peripherals; _never_ use it to access
+ * regular memory.
+ *
+ * This is obviously only needed if the remote processor is accessing memory
+ * via an iommu.
+ *
+ * @da should specify the required device address, @pa should specify
+ * the physical address we want to map, @len should specify the size of
+ * the mapping and @flags is the IOMMU protection flags. As always, @name may
+ * (optionally) contain a human readable name of this mapping (mainly for
+ * debugging purposes).
+ *
+ * Note: at this point we just "trust" those devmem entries to contain valid
+ * physical addresses, but this isn't safe and will be changed: eventually we
+ * want remoteproc implementations to provide us ranges of physical addresses
+ * the firmware is allowed to request, and not allow firmwares to request
+ * access to physical addresses that are outside those ranges.
+ */
+struct fw_rsc_devmem {
+	u32 da;
+	u32 pa;
+	u32 len;
+	u32 flags;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+/**
+ * struct fw_rsc_trace - trace buffer declaration
+ * @da: device address
+ * @len: length (in bytes)
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the trace buffer
+ *
+ * This resource entry provides the host information about a trace buffer
+ * into which the remote processor will write log messages.
+ *
+ * @da specifies the device address of the buffer, @len specifies
+ * its size, and @name may contain a human readable name of the trace buffer.
+ *
+ * After booting the remote processor, the trace buffers are exposed to the
+ * user via debugfs entries (called trace0, trace1, etc..).
+ */
+struct fw_rsc_trace {
+	u32 da;
+	u32 len;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+/**
+ * struct fw_rsc_vdev_vring - vring descriptor entry
+ * @da: device address
+ * @align: the alignment between the consumer and producer parts of the vring
+ * @num: num of buffers supported by this vring (must be power of two)
+ * @notifyid: a unique rproc-wide notify index for this vring. This notify
+ * index is used when kicking a remote processor, to let it know that this
+ * vring is triggered.
+ * @pa: physical address
+ *
+ * This descriptor is not a resource entry by itself; it is part of the
+ * vdev resource type (see below).
+ *
+ * Note that @da should either contain the device address where
+ * the remote processor is expecting the vring, or indicate that
+ * dynamically allocation of the vring's device address is supported.
+ */
+struct fw_rsc_vdev_vring {
+	u32 da;
+	u32 align;
+	u32 num;
+	u32 notifyid;
+	u32 pa;
+} __packed;
+
+/**
+ * struct fw_rsc_vdev - virtio device header
+ * @id: virtio device id (as in virtio_ids.h)
+ * @notifyid: a unique rproc-wide notify index for this vdev. This notify
+ * index is used when kicking a remote processor, to let it know that the
+ * status/features of this vdev have changes.
+ * @dfeatures: specifies the virtio device features supported by the firmware
+ * @gfeatures: a place holder used by the host to write back the
+ * negotiated features that are supported by both sides.
+ * @config_len: the size of the virtio config space of this vdev. The config
+ * space lies in the resource table immediate after this vdev header.
+ * @status: a place holder where the host will indicate its virtio progress.
+ * @num_of_vrings: indicates how many vrings are described in this vdev header
+ * @reserved: reserved (must be zero)
+ * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
+ *
+ * This resource is a virtio device header: it provides information about
+ * the vdev, and is then used by the host and its peer remote processors
+ * to negotiate and share certain virtio properties.
+ *
+ * By providing this resource entry, the firmware essentially asks remoteproc
+ * to statically allocate a vdev upon registration of the rproc (dynamic vdev
+ * allocation is not yet supported).
+ *
+ * Note:
+ * 1. unlike virtualization systems, the term 'host' here means
+ *    the Linux side which is running remoteproc to control the remote
+ *    processors. We use the name 'gfeatures' to comply with virtio's terms,
+ *    though there isn't really any virtualized guest OS here: it's the host
+ *    which is responsible for negotiating the final features.
+ *    Yeah, it's a bit confusing.
+ *
+ * 2. immediately following this structure is the virtio config space for
+ *    this vdev (which is specific to the vdev; for more info, read the virtio
+ *    spec). The size of the config space is specified by @config_len.
+ */
+struct fw_rsc_vdev {
+	u32 id;
+	u32 notifyid;
+	u32 dfeatures;
+	u32 gfeatures;
+	u32 config_len;
+	u8 status;
+	u8 num_of_vrings;
+	u8 reserved[2];
+	struct fw_rsc_vdev_vring vring[];
+} __packed;
+
+#endif /* RSC_TABLE_H */
-- 
2.53.0


