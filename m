Return-Path: <linux-arm-msm+bounces-109044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEHLLMr4DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D55A4B4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF2D330975E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA023CF668;
	Thu, 21 May 2026 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLCzdS//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enio3Mji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4CA3CF95A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365806; cv=none; b=Oy65tjqgYzXuybuNqK4OgGcb417y0e9ltHtHhGT5KAycQk0wyN7sB6ZeOda9AB52IeiwkhPkimBeYeNRSgKDylOgmRzFgSgJobvoTlO7TcAcXK5lMbMGX0ASOQ+p3vFswxZeetMyRZ08FSprEMCmeA9lYNWCmvupQwHzpTh0UiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365806; c=relaxed/simple;
	bh=aSagP+Ntd8ExqIv/bmaQy6rZMayOFWItjxgrrEoG8Mg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tArI53dr/grqJd5/VrSj6MVYbCKhLa4ABpwqCR4KgaLJxQgKctURcZiDOpmvnnvE7Ar0agHAns/Vnx2GyYIEkoAa3T3nmgeGjyGZbgf736II7BBzr+uzoONrOeEN3zQYepXFgp0NVNq2s2rOjMj3dHGWi+Htb0K3KiKsoXjrUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLCzdS//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enio3Mji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99oE03118990
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GwWcZxhrlPOqLk/0oPEssl
	U4SfaTGWracxN7WagixJM=; b=eLCzdS//wjzsLD389PmlStAfjC06KbQYZdsMSY
	tl8qnVdkg5AcZbK/E0UYa7B74p4AIxdbXB3oCZYG39sJGQWVY/om6F8xvqeJTlRa
	JPnNVQzB5hNsxLqaq4SIQJ6JptU4GRM3otw1VUfdcudro9Fu8A8Q20VSFrSS60u5
	WzCSh7yrFADgXp0ccrKWmwQS084ccnaaDLZepwAEFoSTsBXiAYFgurFuUf4h67gM
	XcmVkisuVz/DPHJGaPajoxIbszHBA7NnC+sAHpdZBjH6F9xdG7Gkj0WEWZ/BmZjW
	eDe6rkFzbFyhSawqEbkVOaGLzx4xLKf705dP8x5EfpYv4hMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962byq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc977e6aedso57616055ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365801; x=1779970601; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GwWcZxhrlPOqLk/0oPEsslU4SfaTGWracxN7WagixJM=;
        b=enio3MjiKUfTP62SZtnxR0k6jgiosN98TEWlOi3BuyV5iF4tcpfTbmCMbvZe8pTzbq
         hrGnQA8apE7xNK3irgSbczmO+Z9V9eBLveyfggCoaDTSGIpnd8lY9mIIF42x0n8/mKXA
         wHjXuZoKEXfmpeNr/RSAk0SPmE0NqsC8Lf0bB1GogtfxlI6GP5D8/t6EdcCHjnjZ6WY0
         vpSu5VlBXyDEBB9QRs6if8Fr6DP8oCb597poRLMOO/h4YDbhAxU41RS9Jri1JmHwPeFj
         cqclkIc4rk/D080pkF+A+GS8TCUZqC37Xn4ea7Uq68bXJLvsLcwFb4e8yf/L4WzOmX/A
         7LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365801; x=1779970601;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwWcZxhrlPOqLk/0oPEsslU4SfaTGWracxN7WagixJM=;
        b=GD6s1uprpshOa3F1B7+MTeI8Yl6Vlx3TQNWAvSYXzOBYrB6BWO7aSE9ug4mlJBQ5pA
         w79cnmnNf+bUarX7R9o+9iKcRoFVLlNFuCGX95tON5MtnJXNe8dMZeb+K5BJXT01ONR7
         bUbXIQ+E3/zcpinq/7BWU3slYHUlNH7OP/32tvkSLZHP5IQH9RmGjR0l+uKebfsK0c4o
         AXk4kGnAAo9Cjql+I4XMTJxwjUejQ2RcmoxyBwK4tyuYAuZQliGm8jStuiT+HN54pi9O
         dCpIsRmgWiNDqHx4+vJYCyt8oidSBjm+pbsefj8xWrU/ULuhNWMN8KlrP/5GEaOfOp8O
         oKZw==
X-Forwarded-Encrypted: i=1; AFNElJ8KFdyu0n1lmnhu/o2Y/ZCA+9233XqtldOMAJd5p/+S68P9NZallm8mLFJSi6y7Lj9Lcc6QXumNErRQlsvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEmzwmo1YYpA1P4Z0ce22L0VN0DreFBSZgvxaaKep8ELWSVm9
	iXdiCatO7akyhMuCMb0p4O5RWzGBYEOOD9hu0SGPZflqkYkuclx1O2YyKfo3FxZgkBFlMQ64pk0
	/afkVzjFOPjNnApjo+ubOf77Ea4nAxQEqruUa/TfPT6AHPrK1/NvxdEw9A7bLbRVjLX8E
X-Gm-Gg: Acq92OHrZXyAbiYfRJqAbTtPP07KuLODhz2Fs0VVAtA6yEaDQYOp2GJBRAUrHs4ceip
	suP5gDnkz1/EHCfd92zQsgrh+Iz7pPR81DoOrSq/Rnmn0p8uxBdcrQMafOukXBEo8N8YFA2cQNo
	g4/kM+YHZ4eMJJ4p8k74lTINYwsZ/zmr3FaUKiVyT7HWAgIhKDT9orLPKQL5DtJ700QWnBPk58y
	TC/Ji/gOpFn4ZNIBTjIeQG/WPVBY8SGh+32cTYf+fOyGSiOoI+s73Udh875VpL6P8re0OPEotOb
	7arjpP59rWpqKRqS55VHY9U9Ch0uemRYki899Q2PhZdpCGRS6QXu47MVclyTr4vgIwXCMclc5U4
	44/B5AAXRaOjwq6WfD+G25o71MmrlhZvZLveEmUDxjEoAsVo1wxV9xE5k/Bdd0MKf8nKuFT+7wr
	45IgjA/oDhIxGWQg==
X-Received: by 2002:a17:903:244c:b0:2ba:881f:6192 with SMTP id d9443c01a7336-2bea3346857mr29887055ad.22.1779365800643;
        Thu, 21 May 2026 05:16:40 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:881f:6192 with SMTP id d9443c01a7336-2bea3346857mr29886455ad.22.1779365800081;
        Thu, 21 May 2026 05:16:40 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:39 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v9 0/4] Add Qualcomm extended CTI support
Date: Thu, 21 May 2026 20:16:26 +0800
Message-Id: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJv3DmoC/x3MQQqAIBBG4avErBMmzaiuEhGRvzUbC40IorsnL
 b/Few8lREGivngo4pIke8joyoKWbQ4rlLhs0qwbtpoV7hPBwU3LKcqwhau0Z1O3lJMjwsv974b
 xfT8Puy24XgAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=5452;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=aSagP+Ntd8ExqIv/bmaQy6rZMayOFWItjxgrrEoG8Mg=;
 b=cV9FjF0Xo53AU67TtHOGcvo2RDNaE1U49xBnIOkD69p4q7X01HoiDSaL0kNjJMlrribCKbyT3
 7EJ6VCljjgEBLBPxnUyZLdJcdqibpp/LkSjcYeQlKgjIQwJ0CXZAGz7
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-ORIG-GUID: SKIQnm5Adt4fqLec65RxGE9PT6X6Zr9S
X-Proofpoint-GUID: SKIQnm5Adt4fqLec65RxGE9PT6X6Zr9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfXxC3Lgv7+P0dH
 b517T931nM9gnxF1TnX720bRRkFDut1rYh2KZEdtqOIPgXRQE51Kx8qVGU/Rofa/LVtKojpdrMF
 0Rl7EeEqKRWzz4WxjYXBbZvIuK3zR01qD6e+PYeY0qgjihHGqPGOPwlhpMcrP04DqUB2RSCxPK8
 DdxaWVhsTv/JeegCUsMiQKFCJDXN2zncrUmYAUrxRvLb0QOmSkU16+cU/s9b3c2ekHU5wjZkpWg
 FbtrXNpt+gAofqoCEudMjheop7ikExs9xYEGPNHyHD5cmBxovaq+rV1n9EO1NzzOhn2LD8vXYif
 pGqM+lFijAavf1mFseo21TjJW79VXMDn2dUXa3EisvXIvdcsyUdT/EpLsUa5bzDBuID7KljZM5t
 CW86ZDsU9bKS7LhA6bmlZ2lE2kL3sNxSe4LoYHx+LcjVfj59c0Lfcw3mVyI+++OSAJZ5QStqwrV
 MK2P/XZf4YFKHCOQyrQ==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ef7a9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=xEwI6Y9Ks9AXzKRB910A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109044-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 189D55A4B4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm extended CTI is a heavily parameterized version of ARM’s
CSCTI. It allows a debugger to send to trigger events to a processor or to
send a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs.

Qualcomm extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Prerequisites:
   This series depends on the following CoreSight fix:
   [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
Link: https://lore.kernel.org/all/20251027223545.2801-2-mike.leach@linaro.org/

Changes in v9:
1. rebase on top of linux-next-20260518.
2. patch 2: Replace the "encode index into offset high bits" scheme with a cleaner
   __reg_addr(drvdata, off, index) helper; update cti_read/write_single_reg() to
   take separate off and index arguments; add u32 index field to cs_off_attribute
   (moved to coresight-priv.h); drop CTI_REG_SET/GET/CLR_NR macros and
   <linux/bitfield.h>; update commit subject accordingly.
3. patch 4: Add three index-aware sysfs macros (coresight_cti_reg_index,
   _rw_index, _wo_index); replace string-matching visibility logic with
   cs_off_attribute.index field check;
Link to v8 - https://lore.kernel.org/all/20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com/

Changes in v8:
1. Rebased on top of linux-next-20260424.
2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
   signal counts; add bitmap_zalloc() for filter trigger group.
3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
   to patch3.
4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
   to 128 here with comment; fix macro alignment in qcom-cti.h.
5. patch 4: Make qcom_suffix_registers[] static.
Link to v7 - https://lore.kernel.org/all/20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com/

Changes in v7:
1. Split the extended CTI support into smaller, logically independent
   patches to improve reviewability.
2. Removed the dual offset-array based register access used in v6 for
   standard and Qualcomm CTIs. Register addressing is now unified through
   a single code path by encoding the register index together with the base
   offset and applying variant-specific translation at the final MMIO
   access point. 
3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked 
   register instances on Qualcomm CTIs only. Numbered sysfs nodes are
   hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
   derived from nr_trig_max (32 triggers per bank), ensuring that only
   registers backed by hardware are exposed.
Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (4):
      coresight: cti: Convert trigger usage fields to dynamic
      coresight: cti: use __reg_addr() helper for register access
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI

 drivers/hwtracing/coresight/coresight-cti-core.c   | 131 ++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   |  26 ++--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  97 ++++++++++++---
 drivers/hwtracing/coresight/coresight-cti.h        |  28 +++--
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +-
 drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++
 6 files changed, 281 insertions(+), 70 deletions(-)
---
base-commit: f0d051a4a0ad6d37c1a88fee7f6a611f2e3dfa77
change-id: 20260520-extended_cti-305ed12f0348

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


