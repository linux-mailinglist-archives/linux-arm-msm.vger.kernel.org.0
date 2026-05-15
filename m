Return-Path: <linux-arm-msm+bounces-107909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wME0OqgVB2plrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68A54FDD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B982302CAC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB003AE70F;
	Fri, 15 May 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtOaV8z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKyyKVFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96142EEBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848894; cv=none; b=AzF0PSnUsddbOnEyb9a+/w2CNC9dKChNBAUZTmkk/2orcdwRIETt1HyLR5+jVrGydLIN4DpzVy3YeniV1sqhPRQNDT6aR9EhBQvehUd2wf5TXxU/xDgI420HTc6rfdx/Qu+FcRUvQsyeQzFWBge2eyWQjdtg98giRu+zD2n0Q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848894; c=relaxed/simple;
	bh=fKYBDJdXDp67Zr7KM8kkWqEN84dwC5WY1qu6gcK8d+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qw7McUMIY6WHGN14LfzzhFlbeFGG0ZfvKdWANW8mnbZgWL6apQgLoBFCsBMhOm7VIXPYj5y9kmGARUFSmohTWZ2SwFah2YJBgipXVXxvBnebqoSYpNTlAZh76+nLx56yTKNS8VA7uf2ap9BgILBzDNHMYI9NZpx9w/GqDkm1QoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtOaV8z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKyyKVFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3RxG4008241
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mNVZHM0vaurUkrmXeKukxyvOImFgIrlQCkN
	FvjRNZcI=; b=MtOaV8z06trh6NO3LAF/heBio6dZNdEbOp452Erk8v629kS5Lvn
	F9R38O1CKMYEk62PpiYch//xGHy2MwSXpMVHvol0M+/ppsEBMiHWus8TIK8casn0
	2MK3/uRSCC7BAHMDE8gM5fffYsThRh3LiTWQtogrFJLyl9vTWT/uQ+ZEibjjGEAV
	K6A/UPyjdFvuJ91HPBZYgbQw7IlBVJWxnry+2fyjaljqMkcrjSqw0EF2nWMH5wVS
	BqyUVBLzirNCq8B5PuxBR4nYH9IQ4Fy77sCGlMLHkY4tYn7yWuI8GOJJi1TcUocZ
	CquZFqG9penCqYgnqZVM2+soVACIHtqBxSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su9fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:41:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so8048447a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848891; x=1779453691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNVZHM0vaurUkrmXeKukxyvOImFgIrlQCkNFvjRNZcI=;
        b=MKyyKVFxUPKp7ikmLAtavBL65xRmPlYtGVmGPOzP28pSg7uBtXT+H3Kd/zOp11/kD2
         a+sxH8nw3UUFLv0QRVJ8GEcWo8Sp45kl/QllTaZgXSamRC74dUIo0w7bQYHLW984gQwQ
         nidr4d7+lVroyGvkA/d/dkoHqvs6gfyyAMeuazI1YwKHpSSL1zADwGPxbTsdFAkNLYlu
         +nNJqG/CV6LU0jPxvfUnQZpmg1TbdjXh/KYyrb1aqQlp6gWZUy7SHFhWmrz6q/GsKBpu
         yIdFe8p/7W0sK59gbIAE4agK6kbiKAb8Ox+NzJ19OVCwlSBpvji2lwcpDES+Hn2MX17A
         6s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848891; x=1779453691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNVZHM0vaurUkrmXeKukxyvOImFgIrlQCkNFvjRNZcI=;
        b=HcxNm6sOOiu8nnjrMqNi5vqmQ9NUeLxQGCuNooNZnX5qegExXRaxqA7JGli8nBVFoa
         nIncTjLgtXItG8ufy/P7enORyNolZW1rdrQM7zWt563JFvDUOhuW3zyFIYdbkJB1sK9S
         z/Jn+MMe89n29nXQNAAEZHJrqV1nNS82RydnNKfp6kFOj8uUjU2dVuOGO/btUxKQwEDT
         CCKinE1mBnlFcp0u7D34/HXln2Xzjvs+QuCbXw3eoOBdXWY4y0wclgw6dMVPbOktG5rG
         J+eokVxnpRKEDfSvRMiDog+OuDzkSOLT9XywqJ12nce3lCXdYphWaWDTVR6+yfPfL5gL
         nnQA==
X-Forwarded-Encrypted: i=1; AFNElJ+bl2AOBYE6FI1+NVW2guI7hDxhiqaTrvU0Cy6rbMb7mtoppBHHODgXVO2QHZVMbrdHpYTP9mw3lN3FL+NS@vger.kernel.org
X-Gm-Message-State: AOJu0YyUK/OGI4TxnqzvMA+idzSQx+uHV0m8xb+Ao7Jmmxh/u54JyLQs
	GYssVPVXMf/NGTNK7p8SyYvmQSgbTqmLu1RxlztqxjOWwEPGkZBFvlBTvm4OSN7A4KsHT4dTp2v
	51LSBx5mMaNLU/Z3Mzpdk7u/1fZ1Hbac4y5bbJuHp9KnCs6IIPUOgXgUsKZszyA20PSzf
X-Gm-Gg: Acq92OHMxUWuRGd8oOI5FhOTNDUtk3L99yxbAnDg2+84S5sPZbR9aYrff975jtnoLb8
	hm6pG6cnD/+U3KMiUC3BtvYsp9upJkEKELs/JWRCWBhJkTwXv8vUoBuMr8iTyiy9Kn570O9jL+1
	AYAv82rqGADcf1PliQlFI6gihnmWDFBc25rtRUQHOYsnRRA368xsWQMzsNUJKBSKT9+q6tnzW6O
	DHph/i2LsTlK12Wep4yhm9O2HiB9oEC5HU+M1SVbY/83TdN11UXwAk2NJZjTIAFyIHVRp4Nnkgo
	ksYL8UsUC9tZ2IoNqfgaEg1nItySDzyqm4TWbwPkbHdMofgzOr8RtiEAhE+iCS/pm4OdQ18VqyI
	fEXR8njb29uXonU7l5/SA5oLqXbjzegvnD579fHiFTHj+skAnfwE=
X-Received: by 2002:a17:90b:5648:b0:35e:27ec:de0 with SMTP id 98e67ed59e1d1-36951b971e2mr3588929a91.13.1778848891277;
        Fri, 15 May 2026 05:41:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5648:b0:35e:27ec:de0 with SMTP id 98e67ed59e1d1-36951b971e2mr3588899a91.13.1778848890751;
        Fri, 15 May 2026 05:41:30 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm54910485ad.7.2026.05.15.05.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:41:30 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v5 0/5] misc: fastrpc: Add missing bug fixes
Date: Fri, 15 May 2026 20:40:05 +0800
Message-Id: <20260515124010.20679-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L4-7rycrjETb7N6MBxYrY4TIamvlAhvG
X-Proofpoint-GUID: L4-7rycrjETb7N6MBxYrY4TIamvlAhvG
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a07147c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mSfM1xQJxAVIrMv2y48A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfXwpyvP6RUsdWY
 XvO+H9WtqtBKh5miI9r4KSw+oqXR6JH5GgsRjKBIo/oM4AuqQHCGTjvriGJTYCZwHniefPXgzdD
 9LwoVEsUz6rz+adwc7ZK37goIT1nAdimjaunzhXlGaixN4ItDM0waBYYN84R7SXMPEE325xIBLB
 cjEScn1xVvO4NvwTVR3b1m+DQU7NFKy7m6ilVAbmCMILjpysUSpOQZfWEyyp4Un4UpZMwKFDouh
 OqmaI9TiNY5QA40TxVCR0CdsNPmRP0ccn2DBywZmX8DtQj/TjoBCvxi77Io47TgviZ7fUbbYGFi
 MVWN9yaZ8sKy1rnMkx7nnpNy5NbeKOgVviy2pTC7JIRMhKc1fLGko2/dViT9NgDoB3Fpi4ZIl8V
 OQZVC4AxRtnigYO07P2lui+n02A5Xt5ZkDAsCT5FICANtlIsSgY8ZQMRgOCDYjltFa7zEkLUzUW
 Ta2btZY8wvAqjrtxTfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150129
X-Rspamd-Queue-Id: 8F68A54FDD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107909-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add missing bug fixes in memory areas. This patch series fixes multiple memory
handling issues in the FastRPC driver, primarily around the Audio PD remote heap.

The Audio PD uses a reserved memory-region that is shared between HLOS
and the DSP. Allocating and freeing this memory from userspace is unsafe,
as the kernel cannot reliably determine when the DSP has finished using
the buffers.

To address this, the entire reserved memory-region for the Audio PD is
now fully assigned to the DSP during remoteproc boot-up, and its lifetime
is tied to the rpmsg channel.

Patch [v4]: https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/

Change in v5:
  - Split reserved-memory handling into separate patches

Change in v4:
  - Fail Audio PD static process creation when no reserved memory-region
    is present, instead of silently proceeding

Change in v3:
  - Adjusted the order of the series, placing NULL check changes that are not bug fixes at the end
  - Modified the commit message to describe the bug background in detail
  - Switch buf->list_lock back to fl->lock
  - Add locking to the operation of audio_init_mem

Changes in v2:
  - Remove the if check outside fastrpc_buf_free
  - Store the spinlock pointer in the struct fastrpc_buf instead
  - Allocate entire reserved memory to audio PD through remote heap

Ekansh Gupta (3):
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Allow fastrpc_buf_free() to accept NULL

Jianping Li (2):
  misc: fastrpc: Fail Audio PD init when reserved memory is missing
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 135 ++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 64 deletions(-)

-- 
2.43.0


