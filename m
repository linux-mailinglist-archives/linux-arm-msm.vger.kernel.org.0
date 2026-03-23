Return-Path: <linux-arm-msm+bounces-99417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOBYGX3BwWn0WAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B04202FE5C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF7730610C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CCF382363;
	Mon, 23 Mar 2026 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7lnKh4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyrlHnLN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D837A382384
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305539; cv=none; b=oGURqxvb4PqWMrtmFkPQ43tByh0sLreFUqjIrF60rjHduuhmxbNayJI80aNpTzDLpSc5/99D2KrZ6HK1xK+TBNc+WwnN+WF/uE/jwdGbdkBcj0ceg7gbUqEag/ha54hi3Oy5NKd83UAronr5a4ZvsniNRO4hbXsXJjrFL1u8jdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305539; c=relaxed/simple;
	bh=ioMmjxhpKgEGbU9Q5ZhuNjYP6+vM1Ed4pEa/HmaRSl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DblLJoSVQSiaFx8jWshxtwY0n9M3OFT+X1iJ8mnvApTRdPkeozSQR9HhVKPHj4XIscotAqFUtxDNGxoDvLXMbKmSQVRu5uv5WeJCITRy0kED5Okg4KMg8lUO+LdP/C8I/rNr/7mmB2dznIUAG7L7BV4UUIorNw7xK8rVgz45P1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7lnKh4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyrlHnLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXCH362504
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NKjWGmdRv65
	20W4OaNXC1TctOioozKWeG4nDgD3XJX8=; b=J7lnKh4nKYwg/C/dKoq1iDK4klP
	uH3NhYoikvDD7U7jbGrDsgDrVWrKbazTt/YPIpAKDqvHeyZq1XM/V7baRCMmnLPq
	cQX171n3fLvCDld42tgJq1RAcLzYjV+JR//bS7nuQ3LZ/UyCChzE074Bn8qv08Zx
	+lAp398U5xH4WqfpB50HHqcNuIP2hBPmMPHTOG7GW0XcY8Y1Ftl/ccm4oIxZxnT/
	YLiOcf4FpM2bWcQxtKeq7sVBJJI7dBagBE8nPVJRwQloG781lpvshsJI8n7hpUxA
	WH17Ba8wjHIyNU77G1rUIY4qp1npKHzRSMH5LA5uhYpFAY3s0N0VGR4rmkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32eah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so34555511cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305536; x=1774910336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=KyrlHnLNk4b8qcnHnbG51iDVabw4Tr9v1GQXpWyVSss7weeKnK42KGqYZbC/0FRKzg
         sEOy4REtH/Biu5l2vj0gSZHG8mhNA6C+CQODpm1AkwA79Q7W+DzR/7ztOUIPhwjx9q/n
         QWZJup1IZ9wF96tFeFH/t/Bma40BIo1xISDslaRSAilAF8CATqEoe2KaAbI215efUaA1
         3KuMjzPRInMM+dtvD5seD8PojS9ouMLH9bgLWT4+rrYwTvJj/3DhfbLlt2KorWGdK0+G
         Ppq825ssQl/73PHVAcW2IwUxJ/aWFilOuej1OAAXS5NTVW8d6GOroNrr6JwitIxhlwrj
         pEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305536; x=1774910336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=B2VmLCtlh7j6Mycq7mGU0yEywddGltR2tls26otcsX9ayz9hjtj38dhZxa9cyjrw2u
         p1fYUuK0P7+vC9UOiRwxLPpBBrjlY4x6K4ZnVEXJaif0cc2UI8p8AhrMXzSA7X14Bsd1
         IoAdgvu7y1+ilZ6XVRCltYQp/9K5j4I2m3vZU2zZTy/ntdHKGB5W1YeoK5ymTgHh+L9n
         Tg4beRH/j6JSEcB8r3Qi0ssNO5EH5GgWvyuKt7EZ/cowQFjG4y+ei8v5/4NcPPE3alBR
         r1ONOuxxw1YrL08XxfM8jXDfJxNtK6PpBZM8GQi4Nr1rJkcx/wNT+djD+MV7lPIoaiXC
         z63A==
X-Forwarded-Encrypted: i=1; AJvYcCXZLq4MJh0CZUw2vJHwf1G8vB6nawd4kS8qhX10jxwQBBiQAeTgjzt/+tko3CJmm1qRrKlh6HR3usPmf5i2@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7v14srZK1g/ErOce6F5fm1FUZoXlzlkIG99JaM7fFiFVRRXJ
	PUJFreIzYc2A/K4CKi/s2mwhCNk3itZUlOl55+j9Mw0N7hHP2/5SsYKpbBJZf/foO7h46DckJvh
	//CnucbYfT8Igk2Sh1GupndQGitBEOP0kL6lBn/g56wWEy8PVnGWPgaNnLBV9lEP8LpwG
X-Gm-Gg: ATEYQzzA9SlmbGS2wB11Rrb4Lq8IQYJCQP05rUj+7twcOxhmgMIXA7i4rT5jA9HRfFo
	eu0Y7eT55kqxJqLc58HTku+DNK7jtLtBt5bUpY1G9yOwzylm1B7EBhKseGYnGTLhAEBsKzxNRTj
	56nyYrXsAEAFuIbIzKuhrMF3ldvHJjxFbhfZ4uGaHfYB+roIYFWrWKKUqWhONH7UNtNGEJgeCOS
	CrlAWkhSDquZOvOmLT/+nhaXPMxU5KnjHTuponI8qx4nySX0qlAcmCfhcnDI8NR0cWPnXcdzBnM
	ngRkWQmcv5OizcRRXjWgYYgcJg4utzhuUb7lsSRbVrDAABnJi3mh1bxRofwMpWnUs5Bh3wi7jE1
	cVj4yOFC/aabu9nz4d2n6CRkjeqQiAbVOGe2uARm3kyxOecGTPwC4NIQ=
X-Received: by 2002:a05:622a:7c8f:b0:509:11c6:d689 with SMTP id d75a77b69052e-50b373eb1d9mr136215191cf.25.1774305536246;
        Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8f:b0:509:11c6:d689 with SMTP id d75a77b69052e-50b373eb1d9mr136215021cf.25.1774305535804;
        Mon, 23 Mar 2026 15:38:55 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Mon, 23 Mar 2026 22:38:33 +0000
Message-ID: <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1c100 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZjLH_7kMUelE1Q3ziugA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX8T1OhNsleXr7
 8dF93N3mrkrnKIhACAS8Am4RR5yUvaBp5ymYkA69TbJ/4Uuw7VWeQWv9Gqi/TT1m2Q7esQD1OQS
 MMfg8f9yFhh0vfnFC3RZx9TMpQHy4f1AJ+l5uwgBhQYrZN4QGtoQllNsrIKCBu4ykeMRjbQ/5nT
 3KIdIw02RyF3rLUVkB8aJtUM26Je2sOsA/bbxuYtOWtnBcsbmWreoTDuZ7nZgvQqHot7LJgwTGo
 f2GaKdSEx0esAn9nuEWJ4SKIMvYayW/bBTbr1zzs16yQLNSRvo6FQcOIxToCYaShSPTXcGcksCb
 ZLYDS7JJPvfLynToWjV0ihjIx/0ysIG1TTsB7sVlM9Koiq0Ea2yZB94xN6ZeMO2UtUrDAXWGSEp
 9lfXm5M62jhEjFhsPzlefJa2jO+drgjP7Lgil+nNmY+z4rQvwnvhoa79nraZWkeHRzJSgAoKAkD
 qw/4SwpS+xESM+KwS7g==
X-Proofpoint-GUID: ZFq0tNug5Z-mF-0r8ItV08WgKeh4CpUK
X-Proofpoint-ORIG-GUID: ZFq0tNug5Z-mF-0r8ItV08WgKeh4CpUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99417-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B04202FE5C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

q6apm component registers dais dynamically from ASoC toplology, which
are allocated using device managed version apis. Allocating both
component and dynamic dais using managed version could lead to incorrect
free ordering, dai will be freed while component still holding references
to it.

Fix this issue by moving component to unmanged version so
that the dai pointers are only freeded after the component is removed.

==================================================================
BUG: KASAN: slab-use-after-free in snd_soc_del_component_unlocked+0x3d4/0x400 [snd_soc_core]
Read of size 8 at addr ffff00084493a6e8 by task kworker/u48:0/3426
Tainted: [W]=WARN
Hardware name: LENOVO 21N2ZC5PUS/21N2ZC5PUS, BIOS N42ET57W (1.31 ) 08/08/2024
Workqueue: pdr_notifier_wq pdr_notifier_work [pdr_interface]
Call trace:
 show_stack+0x28/0x7c (C)
 dump_stack_lvl+0x60/0x80
 print_report+0x160/0x4b4
 kasan_report+0xac/0xfc
 __asan_report_load8_noabort+0x20/0x34
 snd_soc_del_component_unlocked+0x3d4/0x400 [snd_soc_core]
 snd_soc_unregister_component_by_driver+0x50/0x88 [snd_soc_core]
 devm_component_release+0x30/0x5c [snd_soc_core]
 devres_release_all+0x13c/0x210
 device_unbind_cleanup+0x20/0x190
 device_release_driver_internal+0x350/0x468
 device_release_driver+0x18/0x30
 bus_remove_device+0x1a0/0x35c
 device_del+0x314/0x7f0
 device_unregister+0x20/0xbc
 apr_remove_device+0x5c/0x7c [apr]
 device_for_each_child+0xd8/0x160
 apr_pd_status+0x7c/0xa8 [apr]
 pdr_notifier_work+0x114/0x240 [pdr_interface]
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Allocated by task 77:
 kasan_save_stack+0x40/0x68
 kasan_save_track+0x20/0x40
 kasan_save_alloc_info+0x44/0x58
 __kasan_kmalloc+0xbc/0xdc
 __kmalloc_node_track_caller_noprof+0x1f4/0x620
 devm_kmalloc+0x7c/0x1c8
 snd_soc_register_dai+0x50/0x4f0 [snd_soc_core]
 soc_tplg_pcm_elems_load+0x55c/0x1eb8 [snd_soc_core]
 snd_soc_tplg_component_load+0x4f8/0xb60 [snd_soc_core]
 audioreach_tplg_init+0x124/0x1fc [snd_q6apm]
 q6apm_audio_probe+0x10/0x1c [snd_q6apm]
 snd_soc_component_probe+0x5c/0x118 [snd_soc_core]
 soc_probe_component+0x44c/0xaf0 [snd_soc_core]
 snd_soc_bind_card+0xad0/0x2370 [snd_soc_core]
 snd_soc_register_card+0x3b0/0x4c0 [snd_soc_core]
 devm_snd_soc_register_card+0x50/0xc8 [snd_soc_core]
 x1e80100_platform_probe+0x208/0x368 [snd_soc_x1e80100]
 platform_probe+0xc0/0x188
 really_probe+0x188/0x804
 __driver_probe_device+0x158/0x358
 driver_probe_device+0x60/0x190
 __device_attach_driver+0x16c/0x2a8
 bus_for_each_drv+0x100/0x194
 __device_attach+0x174/0x380
 device_initial_probe+0x14/0x20
 bus_probe_device+0x124/0x154
 deferred_probe_work_func+0x140/0x220
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Freed by task 3426:
 kasan_save_stack+0x40/0x68
 kasan_save_track+0x20/0x40
 __kasan_save_free_info+0x4c/0x80
 __kasan_slab_free+0x78/0xa0
 kfree+0x100/0x4a4
 devres_release_all+0x144/0x210
 device_unbind_cleanup+0x20/0x190
 device_release_driver_internal+0x350/0x468
 device_release_driver+0x18/0x30
 bus_remove_device+0x1a0/0x35c
 device_del+0x314/0x7f0
 device_unregister+0x20/0xbc
 apr_remove_device+0x5c/0x7c [apr]
 device_for_each_child+0xd8/0x160
 apr_pd_status+0x7c/0xa8 [apr]
 pdr_notifier_work+0x114/0x240 [pdr_interface]
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 970b08c89bb3..fece0e3def23 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
@@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
+static void apm_remove(gpr_device_t *gdev)
+{
+	snd_soc_unregister_component(&gdev->dev);
+}
+
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
 {
 	struct audioreach_graph_info *info = graph->info;
@@ -820,6 +825,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3


