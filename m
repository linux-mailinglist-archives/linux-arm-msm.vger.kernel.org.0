Return-Path: <linux-arm-msm+bounces-104338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOaHI+oe6mntuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:30:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77703452EB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFEB0301BA66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B54371CEA;
	Thu, 23 Apr 2026 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inrUE1eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWk+YDEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ED236D51D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951008; cv=none; b=jngnc2tRbSXvdL3UWf3oVPvaS2uyFBzFudwY2hERbJkYd9bGy6ImL9uH3MZVAdYFlPE6/OFjYp0JfjBZS3M8IlQayxQnGVNJx/e1E3a4/LXnKu5+ByRgITjCGrxoK0gIeAsXk6u72xpkkshNiNFhMiqpcs+cJLX45mTI2E07GCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951008; c=relaxed/simple;
	bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Svmngq2R1YYDWQ3VFCeKnetl6N2VEZItt+rw6tlaXSYT/Hkw7VMfx3bxfqTM+x/yJvw5LUJ2nWpPg1KfkBi23+7OLH25oua9QKhdwkmAhj2yeOpL7L74lOa31Ks/bktm8sgTs0Gkvrz89tUUCCHUtIbQSe3rhxK8rNDqOzSwfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inrUE1eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWk+YDEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NCkJ9Q3804212
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=; b=inrUE1eFryx5382j
	3x7rs59o2EAw0GE7yiTLTv6vxcNjIksca0eovJL55QwMmtmF0ghirHogM4Ku6YGY
	bLCa8odqqLPmBKzzeNDMepoaZaXk8ieuZYRiBHdEWeX5q4ApQBx+p8E7i2r3zqRN
	hm6AApefZAMvcbqH0VoQ4vLcsd+n6kdWs9UhsXDfN3FwN1KxcDl0qS0O74W2XAa0
	wBVmQX1BLh196ISWpAFrH6rYA+Y8xRxVksDSOcw+XLKIAICQYDCzAYACXF5l4vzG
	aI9/WqTstkkEgqEvQVfYA1ljH9cb8f7kjOCvWb/wxda5/10m+yYcBurx4gmsRovt
	zBJ8bA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqkqfr4hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4530a90fdso132343165ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951006; x=1777555806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=aWk+YDEdRHh/OCbh3ZU3IYGpYjJ2Kz5OsLcGf+FTTsJZXSz5lxL0VhxzPo2M1zrHsy
         pSZn6q34okLTRifSrDM1Vps0pgZkOwGgmHfnNj5G4a8GNGvUEK5QdAYvc/z5frkrafbK
         Z6BeE0ODwKjcxghQlLXoUnQiwR/SI8ZKJFXOX4Vnr/bmubL/7KvC6nxEuYRu1MTSmajT
         /Y555zJA3lIzdBbxVv5Ygao+ev3pEynMtt5HMuf+sd7hRb+2Qf/HdyhtvyaHQD/mRiwV
         OT+jW7KiIa7mjkLtMWYuUyBSFRvEkD/EbxTqd6UbFpyMa8scKT39OWito/mr8/KObZXP
         zBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951006; x=1777555806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=rjNhvdZhSFMzFyuG1N1qQv/BR4ObGY3c6mrq/AsKdZePjB1aXxBCJ7+LxWCHKqGcsM
         mdUj093rFjT5Gu0NgkiHPFA8uOoCBsmZARVsUDic7mJI0tQDgvJ2qKTJdgxTA2KEu8jR
         e4E8NtRNFu0WqAqXvHwjPek+w7++2aSANJbsPqWrZRmwe72+xjeJRhtENEajNak9fT4f
         pKDB0/DbUluiFL9FrOpg3XpFqoGQhYf+FJbBfGOmvkCrKxoHCj9zr9uzS/xcY4ycrOc+
         JF7U3bfiEj34siD52E5OQ0FpOj/CeThtEshk62CoL9fgvrqKAhWHNdpFbl0lZXTzOSsy
         PukQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qZax/xobQ4BqO3SMDtxGynECx22ouGNA+rXSctruQAxFoH5+6jTTEQJHwIIjrj9mP5wnHdkg1WpK1IZlG@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9oElgqyKipq+yLOX5lGhCH4Gg/rMb8lhDhhXPLNxLBKke2iY
	GbyzXm87zYpcy1Cz7scM3AgKKM5fk4eRHsHgnPqkrJkdj1d84T0yjqUsY7svHDbOqgZYF/Gd0HL
	fKib2N9sVogI5OJexMzcT05Drpe0fuHAadInG/8S7IlvzjSI3lLI2/Yt1ACN4GyccthdC
X-Gm-Gg: AeBDievHVBgCjY8PyC4YOmkVurr0LRYW6cWzQURP8mdmSH+nhJZCYMT1ErR3CsIWNBo
	i7iGG9IUeAjlXBca4pjS909eSvnpikjX4a7bSCjl1crIhIun44pBodKa426NYIYXmeTKGbEQ+QY
	Zm5/f2hbPQWtRKYA10gfwkOdQaJcSq5/niOnQvyZPVOaYp9KPlSSgV0rpFUYv6QXZWiZrQVs3oz
	kWqNND68YHuWpRJHfVRPgesqLWBXrsP3D5FUi7XYF0gpv5VJIiFUVkXmn0eg4dvMIHLJeDrUifH
	axZPbgZnJoUz09hq454Ovq2lRGcyGn9kga6V2QEEnntfQnZuoMYAHAiWUGpNaKX6jurskQ98OVt
	O2C7YInmrqBa1rydnO/WBUyWOHvwhoT0XOoQ1YKaK5TOHMuuI+bH8MiUlQe8gJsn2EQ==
X-Received: by 2002:a17:902:f551:b0:2b7:9ed0:4f92 with SMTP id d9443c01a7336-2b79ed0505amr34984295ad.32.1776951005408;
        Thu, 23 Apr 2026 06:30:05 -0700 (PDT)
X-Received: by 2002:a17:902:f551:b0:2b7:9ed0:4f92 with SMTP id d9443c01a7336-2b79ed0505amr34983465ad.32.1776951004706;
        Thu, 23 Apr 2026 06:30:04 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:04 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:30 +0530
Subject: [PATCH v2 01/13] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-1-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
 b=kLZ5VkIwiLF40laB5sma2d3q4alpT4zAEZptqRbq23De2A/jVlXuy2rCJ87n8t/knrGPt5QnQ
 BQ50ze3n+5yDir6GHjn/LjLJmJfxx/KjeK3oF0PhnKyu8vo9IOmZtqI
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: TcIruH8PUujXrwkk6LvdVcmhC2kQKybs
X-Proofpoint-ORIG-GUID: TcIruH8PUujXrwkk6LvdVcmhC2kQKybs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX5Y92Cb5BYHpi
 qSvzhdf6WMDaeWLBcs4iT0Buxu3TkFRN+5xdebOB5+r8hZwCRPfrGFDWN8+E4s3ElhXyQVIHDoQ
 S+xbSqpMjoHC88nLsolJwSU33Dd47GsmlrndYkvBGw33tO0Nmw1I+ocn+YjVUWIRUqvBAnhYO2r
 KE5UjbFnDZt4G8fFxowLV/xfHf1Oq9f52DNGU73s39eHTk1xQjBDDLkTatd91Tmg95cLcCB1q9e
 Om3SJsArkOQH64tqsfrsDnIxh5dUY6jq6Et6VbNnLqMSHv0wE4607UAzaGTlbcCQsBNYNcevQTA
 YkXXFXiahOlEHzB/DryVj2yeatTk5r8jgAVFTVYvfdZkkW9hliSZOdl2JzBx4FIBqtzsuooycqz
 d6YyVdOfMKJ9jNB2k9rcOTMHcffQpJViJE5xAvTTMsbgJJi1NCpBsowiFKZAXAZghGpDTiKqtoK
 KfHJlfeFL9JD5r/+QIA==
X-Authority-Analysis: v=2.4 cv=ablRWxot c=1 sm=1 tr=0 ts=69ea1ede cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104338-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77703452EB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..bfd1e762c38e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


