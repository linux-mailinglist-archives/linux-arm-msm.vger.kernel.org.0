Return-Path: <linux-arm-msm+bounces-95796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBnOCiHHqmkyXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:22:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5F02207CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5922303499C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41D6390233;
	Fri,  6 Mar 2026 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCqSTxW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkf6iktT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3D288C22
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799727; cv=none; b=O2u/BmXSADoKL5Y63nhtOGOphHp+6KRL3noR6ZL9L8fqcEXBnuj752iI4iKqv4fAfdQmAMUVzEQSFEQfjiwmgtbgozrY3huHEp1PzMR7rEXRjV8pSVZ9a0ZoQ6eaUzGnAo/tuPGellkdSrYEmdiNSzZIFZXHs+kE8LrxN7VPKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799727; c=relaxed/simple;
	bh=8xebNSAbJUskVVac7rNorJvuDpnXHbFrlQJGj+Tdu08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUwDW3O0lfN+hLiPQphYbu0EySZQN2CGJ9Bt6vK8rAL+TZkYyvE2MhBTOoDacpDAOmHVV6AU6kAY1GwNqoYcBobddsfOLNm83Q8o4RH5wzfjgHLOjqEWvFCjKQES9CHLp0nwUIBRNoO4k/JxNO7vWqA3F1pxlNJz/9+4+tteDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCqSTxW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkf6iktT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb1da4186361
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IH7tu4cejEh
	a0Z5gHxKrQArAxI79sxkumwMn24DAosQ=; b=DCqSTxW1NYnw8P4PQ9uOeLVhvze
	Cwm190LF9q67ZhRd1baP+n3G45DKAzghJKSL+y5zLUYKVqoHV1P55uLCqo/RzhH0
	fVXkKvSlyytVknwroFu7yAihsYvIM34vE7n//Pm1JGEfUkbpFiew2QnfI6hleqPJ
	9tsQzli8XRinRjcxlUW8SS9K1UrOSzliL/rjVdDa7xnHNErFx/3nmtD2EXn8zFmB
	8TkYDaBb3s5uNhowSQHnuifGvqQKv/w0/Xro+LtpafmitRIXvRfhwswpKGJU8Xer
	PvqxO/D6C8/iMTxAYl4Pi+jNVWa9K/6aWRa3vf3nUwsZhRgtp4w8HsKIvrg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9a89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899ea295601so96298356d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799721; x=1773404521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IH7tu4cejEha0Z5gHxKrQArAxI79sxkumwMn24DAosQ=;
        b=jkf6iktTOP3gM7CMiqW129B2pvHq6+Bja/9UPvU6HdQGm5uHpzujmTa3RR0+d4wsYM
         PJrblEwYMHOX6jRm19cYZXw6fxc3Fqhcp1ux3nJDXlzzRpKOSPdK8zz3W3tyUwMsLqx0
         rPid2DKkf8JS16CG9O3eo3J5r2rMlU1ORMv+oYGzpMX0ov+7GNb4MNkC0Yp63MoyAuMw
         sLqVPuegVjf5nWhi0Mu986ot0RL4+CGIyOAquUR2vWV8IHMNEORTsxSJZlOk1MxGZx49
         /fulXpnCt2lzScCIMvLyjXFiv1WLA7ekqLX/0Nm0UbzDOCiau2N0unt8akjhlkz1fXJY
         358Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799721; x=1773404521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IH7tu4cejEha0Z5gHxKrQArAxI79sxkumwMn24DAosQ=;
        b=sJtHuBbsUSic+0aZ2HzEEpJNJvK8HR7aZD4ymiZ5672/XxHv16HRcHUwVSzXTMd594
         MOLzVRBQh50CPQTMl7uM+8bEhe1mj9l6uDaJIbVQiY9gzOl8nBdnm37ld5DX9s/XPh/a
         RXjkZXCuDi+Nhuyvlb5zLmUOjbf9apQ05euyP16GjV30AP4VZQiqkSkgF1cM5uN6AaWT
         TAy7Wf9vjjFap403gfRAxSHJxCtOu54Kh2Ob4zI02ZCMNS27hzS9ow90+xgpTQP/osyh
         3jAOOtBhpH990wyL1jDS0C2bs7kLW5BembzwQlgsl5haDJu1v723iujZgJsh70RLjyQU
         uH+A==
X-Forwarded-Encrypted: i=1; AJvYcCVIXbJ3sqSoyNMJh958v6ydtROzn0wfpJComld7V/LP8vZojSK5Cudnhl+DolRkOfYNcPSoXBL1UmksZR46@vger.kernel.org
X-Gm-Message-State: AOJu0YxQq9D42N6LP8qc6ODMLVgrLiayHKEclmrCex400dpfQ7kLOjMo
	Z81/R21N0t86D9I9Zb6tazMvpOK9oFH6+QMfNO6/h8YkohgG/6J+5fBjSHiDktWVOebsKvRj7zi
	96D4rl2kidDLjIclEtH6kgO5+0X/Ogmar6z+BZLeBiiok6toQSEvrPmUdQ7Ho+RbbA2DV
X-Gm-Gg: ATEYQzxK4WIe074ezwb/jcN600dJTatUuIFKT2Lhbt7JkQba1J6j+KlBAKA1WlFh84D
	Qg06mQufINXQ2xtq2S3kjJLhK70EdPJKz+Hm02BVCIDov+RUBabIyUFpHGGcHLMw59uw+EKRi5t
	fD1aOr3hx8zm9FGnU0Fg6Rg9M398k2Medu3ZeyCZciSOy+xydmBotvqFZ7605I+Cc2AW5iO+3aM
	WrWfhpDkPw5Z0oHgDZq1NyNJnqFvo9YtI6zrZtJ6cDIZ6gQULv1GiXvxijmAD/Qi2TwAnVoRimS
	I2YwqoZYm5BsI/NqFd3Mvd5Ubej14jHjEWPsNB8LtyWE1QpszojrGO95Ujbhcjjr8J0ESCXAPIO
	1HMMzwMkV1cwS8TU8WSwmDbjNr3x/pZmrSFfCPnwvu0pTdyjPV8byAGU=
X-Received: by 2002:a05:6214:4014:b0:89a:3c4:5159 with SMTP id 6a1803df08f44-89a30a185b6mr21352446d6.7.1772799720813;
        Fri, 06 Mar 2026 04:22:00 -0800 (PST)
X-Received: by 2002:a05:6214:4014:b0:89a:3c4:5159 with SMTP id 6a1803df08f44-89a30a185b6mr21352086d6.7.1772799720359;
        Fri, 06 Mar 2026 04:22:00 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:21:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Fri,  6 Mar 2026 12:21:03 +0000
Message-ID: <20260306122115.509705-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX1vgKbcUUZ9R+
 h3s+wRLeqy8ChA/I02+XnCza2Ii6f8TipNDu8XJ3AjSIqhnq5dfmigNlTNL/Bu1vsfGbfuRCqpj
 tUTQXZcy09e7FeWYhOw1iZjeVPZhxuFsIJOCXHjvFxKZ+NaYg5j48tR5MqwKipXi+kSBshbJzwT
 qclfgvNgfqQAQFfnF5hb8B4++jowcdC48AuEzXymut/oXHWjm2RzL2qJk0vF70xXJDXWMNLMaKk
 fAchVNgx5IvHfWI/XMvtdqudLoI7ExtxtdVzCBtZ2bD0lUjRj2sE75JNvGaXtW5mzL7DICSqle/
 rN9z3DcUGTLP7agLCjj8cs0w37KnmIlppK+ljVLNlTIkRZjH0euk61/geT8LLnKnbKNvryGM7w1
 UCLI/iqvRr6zimJRNfKY0iVgwMOgUm1Ld8Zik9wnpGdNZl+I9YL9GNLmGXKuHuSukvfgBmfaxyk
 9wmee1ZQZxgTlki2XIA==
X-Proofpoint-ORIG-GUID: AVq8XTX492eYgc7khU4TaRzFyAd9WG_d
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aac6e9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZjLH_7kMUelE1Q3ziugA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: AVq8XTX492eYgc7khU4TaRzFyAd9WG_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: BF5F02207CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95796-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 44841fde3856..a4c662be52e0 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -746,7 +746,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
@@ -755,6 +755,11 @@ static int apm_probe(gpr_device_t *gdev)
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
@@ -819,6 +824,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3


