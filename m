Return-Path: <linux-arm-msm+bounces-98938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAV0FfhhvWlF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:04:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F22DC43D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6C283061178
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2E23C3455;
	Fri, 20 Mar 2026 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3PZlQwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcUDIYWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1939A078
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018167; cv=none; b=MfkDGocTimx7p5OJ7vf3kQM7QezdcV4zai/2WEEEnMkoxeuuP46+hyd0dKLaUR5X7ekAvq/AZuhKmWepeu+RvNx9YLeCzweHmhfg0kKqxXmqOxtelhdcIKAZtrpiMVhufrEZX4vqY1l22ujxV9GdX8VVWdza5532pBxqHZDcfGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018167; c=relaxed/simple;
	bh=ioMmjxhpKgEGbU9Q5ZhuNjYP6+vM1Ed4pEa/HmaRSl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZyLrLu16MpECTS3nA/W980tWSo++zh7nfb/UIR70D2Hn6f3xaQO7D5Cg4Koy7JU+s24xdBae2E7ryePMUXUz39prRaCy4K31HzTwHg16juJWlvFAggpyOShYyMZa9k0BN0/fxpZI+gepTqAxg/yM1uRdTEfWDkPLJvVEuZsgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3PZlQwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcUDIYWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBsQmi3876006
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NKjWGmdRv65
	20W4OaNXC1TctOioozKWeG4nDgD3XJX8=; b=o3PZlQwQO9IaP04i4zJIwMNcNc1
	edwARPEPwIoKRydap85PblMumF6blqYfYpjc2BLZP/WHvVC3XXg5qaXHdXdyytcP
	G8ki5J5AFmJqp0iYdgJzhP1y3zgDV06Myv0oQT/qhc0xTg7t5TMtfj/CxCCoKZOb
	gvAM4Ycxo3cdKOey1k68+kh1gfOP9FQAmC2QEM56eD0NKwXIfzOFUqIxGouWiuQm
	ziwXzKRcxIkYji86xrF56zrW5+OpSqrKC4Tkn1l/6ZR+ElgSVzijguUw2w4Y00Tt
	Kz+iyP1L/PEwH77EnMX98pTd8JXBWVnWm7CTRc0pX1UXiQNF8YncdE0bCoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08e40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so129938641cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018164; x=1774622964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=TcUDIYWP1Oj7idnqgzS4WwRD71KSfpwI2ZoWpaPBCM5sGB2hQQwwhNKv9pDH+IFKgR
         TRgJZI7rbDocm6qHNFtADyH2Ua2QqRofK+flekxOmA04u9nbe4LmzJwaW/FGwXL/W3fa
         5PiPmXEaW6Dd6dYCtH8VAJODu2X9YaJTy38qn+PQb4GeZYRGJFEjVhvKhGh3ffd6jtCR
         SxbL/+3mKHT/o31LPIzWM/Mkq2j+NBGxgb3j/qMXk0O7Kl38lUQxrY3VX4qyPzErl/vp
         vP0zANIWlxOnN9W4HDctuXzO/GicR6TGZFE1rI/MKk/qdFkmSrMn4u1JqiNI311T/9fB
         dZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018164; x=1774622964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=GLVx9ZX1DQgkzU7PIY3kOlZlVuXd63u2R4lDPZLozxPK2LKlGvcC9mrQKhhILbf/BR
         5N9AbbAWdQ9IulIKufk/qM2AG5aQaNuYt8DbLInL3YYA9UB6+Z/eUkFljgJ5QRtdY3D9
         HNUvbA1+K0CpCYxnSGmnpYCGOXoaQ5Yft4/GSKIMiXs8uJHd09+HH2PQpnaMAcx2W77C
         suWfCSIkcCYHQGPfxK3+z2ASCnwlEio81+mcZoR7KrCPyv32DuwtuxcsljDdQbijEehG
         PBDNT08Sj4LG/aVfjqkJufdyR90KQb2Edy/v3W08cL+7nvtVzjkQELPCuHN8hHv+zvdM
         2PQg==
X-Forwarded-Encrypted: i=1; AJvYcCWwIZrkS0eV2nTsKbQUmvJ3gdjnKkdAmHI4ArgQMPtaXdd6yEDpug2OtL9oH+dzpVOLqdsN07yh6s3yhnAr@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIpEKnp4kJXmSIGL/nVcMLqIx/G4iZRrnmdQaNmhPXbmxQcf4
	jnkjCDf72vBx68Y0Dfed6MpWPQoWlaKDMbj8XL15aX1MFC97zmlChD2hi5a3HWaLlpDAaU1lTI0
	PSE+lmqxj1YJ63a/Kje4HoibmwVwr5NJ2XD7FEZJstUjLTgXJ8OR/2Hms82Uz/ZS6BCIb
X-Gm-Gg: ATEYQzzEYjwped5BsTRz72rJZ/WvR7Wu6LHy9PxNnwOqDDXdjHNexs1fJ6dtmU2hFhp
	Ez1RwhQn610lqHeTNJxcFr7in5o6erTOqD+hSNklwGQeYK03YRYTJrceyuAhkxKeWFv8pE009aI
	1kbKkNXW5Dz+L2nVAVoBAFiEXbOuNgVRqMNpcMfP1BK0SE33nwYrTaRkmWqqujk7SWZj6UHquCv
	JqIa88y5NUdM8GV8xgA+yxFeBzxe3P/fmKtxbMMOJ4Oqu9+6oQLxRsDbDFP4U/a4hEEhQ4UjDgh
	ncML77mSJCoPXWtmT9xn9OLtfmTxN530CCmaevW6cbC/L3ZT0eWozFGNu2TnYBE5I1twVRZQxt5
	CULEy6EhM/L+nNxUvHZ6gC6P8ElzBQUdDOla8BinBFhYjE+i1wdc0+ZQ=
X-Received: by 2002:a05:622a:1b8c:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b4001b068mr19927601cf.46.1774018164477;
        Fri, 20 Mar 2026 07:49:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b4001b068mr19927011cf.46.1774018163780;
        Fri, 20 Mar 2026 07:49:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:23 -0700 (PDT)
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
Subject: [PATCH v6 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Fri, 20 Mar 2026 14:49:06 +0000
Message-ID: <20260320144918.1685838-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bJ8vjC9_8IZjZu_rT1VQf0KRlQsZTgg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX4qU9guuI2Cdi
 Hbhc8KmUsIzePO8mKCwXCVn05J9jxHBgMkiQV0eHVTXLZBowY1OXyvR+HouCwqnF+EtKBI670PD
 Y62DmdI7xQmjGYTbVdyAGjBPQEPbDZ+goRhw4RHUsIH83WFYYKtpfU8EXSHeUbP0Tb/W1JHUZj7
 8osvCrS4DHDZZ6ohHOFsErg+Tj67fmUVwQKy8Xnrx3OtLOGzNgqImMTnRIVHHFl8uropVTgnJa8
 2mzoACibU8E6+W+tWucclID3EoyWrQIOxUusObtUooP6csJu/bOwmSNR5jtgo3opnwkq7YHpC5f
 4V+2UWC9gR3r1e/DuTixDFVB8zQtET+SamFfXM+x5XTxaQeZcedICI+hIgj+TW1IkTnrkendX7X
 CCrUI09AEDisY76ueJ3W5ePD58s6E1hBP33ZNHoOBWdK+lQXTku/a4fUVnE6k+fnD+lFxUk1ypw
 1sM4wAx3FzngCC4mp6Q==
X-Proofpoint-GUID: bJ8vjC9_8IZjZu_rT1VQf0KRlQsZTgg0
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5e75 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZjLH_7kMUelE1Q3ziugA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98938-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.966];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B57F22DC43D
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


