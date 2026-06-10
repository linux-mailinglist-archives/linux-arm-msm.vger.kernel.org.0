Return-Path: <linux-arm-msm+bounces-112305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHrlN+4FKWriOwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:36:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 034476664E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AIu5OqaU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d3n17VFx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112305-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112305-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A4A304948C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A04379C3B;
	Wed, 10 Jun 2026 06:30:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94673377EA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073045; cv=none; b=eV/PfvRDUtEXjrGxa0wbBJpJLRra53z2G9ICHkhzmD4OltBv8Uak0VU8bHM1XjpFazG3mYDqQ0KhJ0RltDzeztxgtUowDX1551EvE163gwUvSPb4xhgG09U9h0h3042Gel3guGFAQdti1eWfTQFFtzIlXk7nhy/TG09SCaqjrZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073045; c=relaxed/simple;
	bh=xu0XPQQrGgIcADZXkcWURUAsf1MnYM7xyMfECG6R4iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLia5RmIeWsvY7rpqCrGlmSwJqFUZ8pa44eBpiOuCrtQT6ko3VUSdAocpxe2DAF4TUFH4Maq+FbcF8z+Ss0F2yMipAt2tGT5D5GMKp+Tjx/zhqEO9qFSwn3kEHRl5jQz3V6Fbrgxe32SbLeTloFUg987PEHGPeCALXpDw0rhSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIu5OqaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3n17VFx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2egZc282603
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=; b=AIu5OqaU11VlkgCu
	io1f17qEYHMztmqZbaxrGPlMzRwhWQywIko15R9+cbIg8vahzI5f6+YPP+MajUj1
	6uH8UpoNEl1vWnRGWWdjkgeRb8ElZJlW52TEoIUYDKdEaY4B7g0Ht2jP+K91ocIc
	z09tNlRwKIAzqaU0/pacnpWWQ8in88PphDLZGdGN1yOjNp98mkcv+G/KsaIu9eoR
	dzWrlizqF5i0yMFTvssoe4bKEJI1wkOzSCm04OIiIg6aR1mdX7wcBLfbp3rQ4S+G
	0DNGPFGLdRDtzvNpxARHkEBwFb1IMgJWwT9l4HzcEop/ZQrbcDUPmJc9mX2VXewh
	NASfxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnns2gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso6132332a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073038; x=1781677838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=;
        b=d3n17VFxZozx632jWteWDU+6t0T1fMJMhGn7fdnqcZyjctCqV2DrO2qpNVpSxwVj89
         pOaZeWm4M9WUsfV4ALPmGCviuga2ltr2KVVmCHQ681qPho9CozRjK2216aPe0SVkhSl5
         2pisPHTPMREgZ1IilsM/vEmzCP/xsHpBzWcXE3pLUavx+0bWl20HyGqLVNqDV3uJ2GKh
         dBcWcjBmGT9QiUU5HnYN+euXVWXjNBqTIRkq9yom3+C+Nd7WtbJ1wcbYKAHOJ1GWo13d
         uffuKQe06Mvk4YcuwdYIdS6rv3mij9PzkH4C2uOgny1NjGiJSqttr7mBU4NQLAG/mFhj
         oZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073038; x=1781677838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=;
        b=N0tWkZLAhcBP5ALy0rBBqP6CmnTx3MmjtYP3L8+YpakRPZR7rJZlIEenhq+BBB0i+E
         HxI/drbydnNRx9ZXamDtJOyA3go4OF5A8CoyIwY2XbdKbsXMzau3DMPfGkWhExZ07u1n
         lrMsCDZGIS7Tqz1OblG+hnBu3qTGbobWSt5aTtgLW4PFeH/6caMeOQpxwCBMfvpu1iyY
         24EfwNOeLBnHwFbWLpLYqzYaBLf4rk27mMNtpKugOyuhS3EC6hSnT4r+uwxgpERO3999
         SquiDwtXV1b51L/sly6NoegNPBzqsPIATR5vbQbAbVnVZBGzuMyQE2XjJjoED7qZ8+M1
         avzw==
X-Forwarded-Encrypted: i=1; AFNElJ8y2rsWMtZ+AOKY8OCE2jgRSp9GDIa6BIyu6EsdJM6SvzKuldc9HqC4r7tcY7BjsuWWRPbxVd4Xb6xtxL6a@vger.kernel.org
X-Gm-Message-State: AOJu0YyzYW/lLPvQowtGLOFe8VFMjl/rwEReEZJvheBTIpgY2HSz3AB5
	aryiKDg8N4V8wTuMuGxayb76xZNKQAuBUkJB2umpdSigCJ1MpdSABvRGUeQmG8Ll/vNR1iQ4RAK
	kvGdZnm2qKvWmMsywiDRgof/YIqJIjXMsb76VGSGzTL+NiBr5VYn932HNZrTctEa4Bni4
X-Gm-Gg: Acq92OED4LfwrB+Ql+1c8MPVm15Eh4BZdj6NvksIZDioS3ramcSt7zpwv+0QCa4QX+W
	Poiv94V5GnHcO3e+IhuKh50pa4tD4afcDb3BvAeckI8HZhMop+CHm32eJHAW4mYlRgriDTYuzBt
	NgWcf9uOhX7zDt8jxANm90BX4RPXPCp7q2TXuaosbaFdWIRthu8vgO7vh6bEjrkez8p6OrizLwM
	e/Mxd03Jwgv70B9OKF6Nt9tjJOpjmv5bUMCFREszWiYZsClpauwqOlgoBFyBQUePTNb9boPd5u/
	qOg3tNg/oGlWB278+e4e5zDe66EWT+yi/Q5+9ZU6bMbb7Of0zc8dDE7pKK1fw5685rkSBWZL7dW
	pPsx07sWcSiTua6kU7F6CnWs9FkmffantBSY9lfpTZgg6vUoJ/rNu0itQKNWD1aBltw==
X-Received: by 2002:a17:90b:3c4f:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-370f057b7f0mr26102097a91.18.1781073038214;
        Tue, 09 Jun 2026 23:30:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-370f057b7f0mr26101909a91.18.1781073035080;
        Tue, 09 Jun 2026 23:30:35 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:40 +0530
Subject: [PATCH v8 04/12] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-4-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=3955;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xu0XPQQrGgIcADZXkcWURUAsf1MnYM7xyMfECG6R4iY=;
 b=bhxQGFLqPTHgIUNF7liZjSwOjDJVrophzNwIhKAIt7mP8Rj0AmnNn/j2fvNMuvpvvrPzTfDor
 Ok9eX9jBxT6DBvC+J8JzDCx4VCOhGvpkppCPigyec28OnF9HI+6Q93O
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: MrUah84A1rq6cBtO_iXlYZdQBU5vpNHJ
X-Proofpoint-ORIG-GUID: MrUah84A1rq6cBtO_iXlYZdQBU5vpNHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX4xVH53bb+U9T
 J/IrlT3Rrqg6RnQ0NjsNuIn8y4zmJ8tyvsMCHc8JfFhrpcWQXQjn356c1oLqvRhBor51VR+Yn7+
 Mt6yIYAq8zVbXMSPf7IgoqLt8xlRZiBx4x2e6MlFx67K9Heabtd8BC+7fX6kzMhd4VUqa5+AAgU
 bx+c+btZFeT89vkNRXYSlgbILQcjDBiDzZLaXlEOljg+1F5M+QQ6/yOKKsHEfUt1U03va693slq
 sfMgkcZMpNQu+309fpc4lKdjYL1K5v4TREyW36FETtBqkgwuL3PSKkkxsD/GyQcYybBCOvW8k81
 CviTmZqmHfNeINstg1nxOC5doP/bBN4JZ4J7aAqDZxJYPhKTNSKeUpZxFNv9F5L0TLY+LN2YXbq
 cNinejUz7LCR27y0fJ0UwXOhf4KwOYjQoNtg0cf3sfo1G/1H1l1hWQz+wn9fCyezNK47X+8yhvI
 dPFUe4Uqp9BKJNxRBWA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29048f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZwZBACt1qYONU4SPBGcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 034476664E3

The glymur platform requires a dedicated firmware context bank device to
boot firmware where linux runs as the hypervisor and driver needs to
manually manage the firmware IOMMU mapping.

Add init and deinit hooks in the vpu ops for context bank setup. These
hooks allow platform specific code to initialize and tear down context
banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  9 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..89dbe9bbf6b0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -19,6 +19,7 @@ void iris_core_deinit(struct iris_core *core)
 		iris_fw_unload(core);
 		iris_vpu_power_off(core);
 		iris_hfi_queues_deinit(core);
+		iris_deinit_cb_devs(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
 	mutex_unlock(&core->lock);
@@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
 
 	core->state = IRIS_CORE_INIT;
 
-	ret = iris_hfi_queues_init(core);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		goto error;
 
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error_deinit_cb_devs;
+
 	ret = iris_vpu_power_on(core);
 	if (ret)
 		goto error_queue_deinit;
@@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
 	iris_vpu_power_off(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
+error_deinit_cb_devs:
+	iris_deinit_cb_devs(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..8bdfee672954 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -319,6 +319,20 @@ int iris_vpu_switch_to_hwmode(struct iris_core *core)
 	return core->iris_platform_data->vpu_ops->set_hwmode(core);
 }
 
+int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..e0dc109bbe6a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -33,6 +35,8 @@ int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_set_hwmode(struct iris_core *core);
 int iris_vpu_switch_to_hwmode(struct iris_core *core);
+int iris_init_cb_devs(struct iris_core *core);
+void iris_deinit_cb_devs(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


