Return-Path: <linux-arm-msm+bounces-100685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gASXIGU0ymnn6QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D51AC357281
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27B2B3045036
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821E23ACA52;
	Mon, 30 Mar 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRGRe7Yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epaBLvRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D363A8744
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858901; cv=none; b=A+vL/x4oXno3iMM62NrHuNt5FZf5DqR1C2va+DPqFDSWsiV0e8gIUEM5bMXjF4QMuImzBK7YRgdrnx5UNmFqSuxHUoxfuYddWz9rHc6VcNZF7Ec/6E+q0qmh3+giLHtWxSzDFNmbs+BXTM+UGp33NsVaMgz9xa3fOFdgBjA+yM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858901; c=relaxed/simple;
	bh=V5T/qd3TANJw1qd6u6VahJ4dPBNJ8hf0QkxJzpbMCss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6a9LDfscDyYIKpb9kZ30XrEGUYPbdD4Qv5rgY4ZekUWOZO9SekLlLApQlRXkQZTKFAuUjlju9/t9IqvNDG/chTuuMcGjXRjB+1kOiW1d4yPiCwvIbAdh/RAtxPj7OInsoLBIHXA8p1tb+sm9W7rG+8AvrCjQdwXw854EGjcjuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRGRe7Yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epaBLvRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7BI9U2224414
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8DfOih8+t/M
	QOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=; b=mRGRe7YiXgCCuNTkk+nV04BvmtV
	pLzB9tPPu9ZrZUGpHPjNkhZ1W87+TFvF4kkcSqfHlSh94mQ10hZ29iCFUGl3e731
	/TeGZ+C4sMDHhzVql34jI+qtBrk9tkqUvkDKuA7G7GuqlK2LdhuEWmkfj0BLkz5q
	Hb3RAtT+wmfHU8i47ZeVW+Sw5gy+6U0wTv1b9izNR37xFw9OSEInFyOrOSgSVsQV
	xWlMTE88T97kuZFNjKRRAs1sC+gxc8AuUcoZADoOzS3zQ9pcafjcaLvW3lAI5vHB
	b5RA8dXKVXvCgqk3a/hThmDOX+zqYtNRDYQxU4VVzHs/ZKw0cafNJjwdIPQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hd3qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so223015601cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858897; x=1775463697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DfOih8+t/MQOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=;
        b=epaBLvREA+91FjMjKfeefov4hgo57TEhLdplaCfu5HaWNNrUiQWx4r4RQ97COTOp0s
         ffEkRANCJkRQAEYsib12t6sttL2Wi2AbEzzBe/pXd7o7VBMkcTYdl+B5eeIFq993wkJp
         NeFXyr+sFXGDxOz6mXUkdZTD/5DvR+gXK3omKJ7sABnnkbqX9KvIS0rLh+v5ep06fXkC
         RiyBT1hK5lRcjHHNqFo12feoa46ITBzI+eibkQ2JRC+OjUP6TwqgDu6jqlyuvRpQR++Y
         I5HMKPpUKBLFrAtG9XaYitQzkrbT1DodV95GX3RfDrUo0Z37QdvCNllaREzxshNt2eh1
         PtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858897; x=1775463697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DfOih8+t/MQOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=;
        b=Mi67+lhCQZeCmuf+YhQTdb2Os8JIcgb/xWiurI4BFAAtOo5z5hRKLDMKcshnPtnEQp
         3M5iFngXjaVoiG5ml7b0/yjDQgQOQAWcYxH+LxdlktK0U3HSHT4zAu0LnEBmV2XCH+xI
         gxyKO9mH6x5Suqpt4626T7HPm8nBt/A+rcq+nvyZW6bMDX/JtcLqfI6jdaXjl203Wcek
         SHWbqon4VlRD1CGnzhgFyKTd4pmb4CzU1iT0TGa3Ju7s3W4OBm6GUqWFu/lyYwdL1/iO
         c2lMvYMFQjPVhqh9xjwq7rqidFnnSTMtCCGJN7i4m+GeyfMx2S/ap2mlSO3bK+5Qafot
         8S7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHSAu9MbblVilb4+fxV5ii+ZL8j9Bv6hGBmgOyIZqQ+jj13ujfsixq1hvVrwOSJs+tDWsuzNw+kEErqRYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZVmhVGpTeBLUXxrSpoAUBLb+CopbLsA+31yy6PetWHaCvI6m
	G61r7UdwHHb7zdOt40Avx82ThgG0zqd6WXKG/81fPnftk9YKsKwjS6bjdFJ379zgE62Z/OYBMHS
	o/+dcS8UfYHRDODtk/NHPP9iPeETwJhl41S6BAHpuVIjVHOqiwuvMQrWADVERQCAFHoFT
X-Gm-Gg: ATEYQzyb99jkIOZgMx6hLZ0luA25lONncn9bam6gNe4aOYfu9PqK/9AVSwo0iWNFMI0
	OohQEKPe4ovDIJlQjH/JcM0atEvSEYqQjZj3Deuqe8Y1XnFx3xm8Dr/kFLS28UrnhvJH3zA8uAl
	CBj1KrrVeL7CHxytUMs06Ax+m1eQpun1gKMd99OubCkx2qETv24MWy7DQ22VBUXAnvzhYUD4FIt
	ukqMWDB7grqK1JXWKrcuHuYNF6Q8sfXpLml3llOj+9qC4OC2WOg87rCAf76VZ01tuYV7fU3LdQ9
	pU8GsUIPODxVn5jbuIK9u5AxHG1eArTaFHrsQKqAV6C8Pc6fDtUC3CG/VJeGZGUS5XqBN+DW3ib
	boFUUT/ZTBZh7BugDH0+N1lP6zYpld6eCjjYCNbQCtgSgt/Ro70W++kM=
X-Received: by 2002:a05:622a:345:b0:50b:286e:ae7c with SMTP id d75a77b69052e-50ba395ec1dmr165292211cf.65.1774858897400;
        Mon, 30 Mar 2026 01:21:37 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50b:286e:ae7c with SMTP id d75a77b69052e-50ba395ec1dmr165292021cf.65.1774858896949;
        Mon, 30 Mar 2026 01:21:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v8 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Mon, 30 Mar 2026 08:20:53 +0000
Message-ID: <20260330082105.278055-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca3292 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZjLH_7kMUelE1Q3ziugA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX8WJgpcCjXzzE
 HmZyurgpaHLRRtxzc4rzm3gkp3w2rt0sDnpdQKpLWHho3WXwkAq8gM6EsR4r+EnBnXoQ6LwyWQs
 MjFtUuQ5giWMLk+J8ZqPrxhRqfgTGFOQSMn+LUw+QKKkNE/1Wr8J5sbW4S8km5KhaHaJTF0GZ1W
 DiccAP/3r3MowvHhELCA0o2tO2Hqqk9UUY83kuPb3sTE2HJ0atQehyiukKwpwCJJyqcAWnS4eK9
 75HbyEZgqNxefheVXJ/ZTXmLsZcQZ61memgMDKCJiQ2+ZLxSSDcXOrJ1Ud32ovPj0QascH7BsrA
 KZZiQ2xu3BLKSHFv/lXqGfzt3wZYnfW5aVCVhSaExLOMnO8BE5LzcxnErUaME7m3sb4XE+ewNu8
 /l1WTkdTXzH0/elTdKprLP0dQKCNwqOdrbqDWTO6tq4D2rU8uS/gQpQZ6HxJ16KdR62Y7/saK5H
 pcXs1leFiK2VIftgIGQ==
X-Proofpoint-ORIG-GUID: R42vS7FW5UzS_OBMRS1CPQcHs-KcSgB6
X-Proofpoint-GUID: R42vS7FW5UzS_OBMRS1CPQcHs-KcSgB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100685-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D51AC357281
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
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 970b08c89bb3..069048db5367 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -747,13 +747,22 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret)
+		snd_soc_unregister_component(dev);
+
+	return ret;
+}
+
+static void apm_remove(gpr_device_t *gdev)
+{
+	snd_soc_unregister_component(&gdev->dev);
 }
 
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
@@ -820,6 +829,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3


