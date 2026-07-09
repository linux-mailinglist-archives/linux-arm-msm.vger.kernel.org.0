Return-Path: <linux-arm-msm+bounces-118103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GZrsCsL4T2pFrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:38:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB873511A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=URywAtA6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hwbom8DP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D101303649B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56683C10AC;
	Thu,  9 Jul 2026 19:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BEC3C3BFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625839; cv=none; b=GD1tVQ6MKW4SC56zUNghegWreyaMcyx8ofOccZxkoNbqgrG+SCpA/UWsnr0m/gThBFV9Vh7EiEC/EJzlK8Dx0u2Btwwqs3FZ01jiyEp1bABCf4dzaBILrVzzf79fa2Jky/eIAihJzltJdyirw4CIGJYkfVcNiPLlM8jrbFPBgnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625839; c=relaxed/simple;
	bh=ExR6aYJGUABcfgsgorOmvfya83WqhibhOuJ6YBT96Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDJ/aGszvhBS4UOHvxs2KwJi9JlKnCvUlpN+o2ZZESdUUnl9aYTMjS4MXHBPDg3u+rdIBtAyBBM3h8WP71L4CRUundP1SnehvwrW8AY/tbxtBhYcQFdP576KnPnioEgU5Gp8b+xAUHzFkCF9Imba32vQCBgmDita5Fo9nEgE/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URywAtA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hwbom8DP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXRLK2422261
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Im/jOe8hqK6N5FZ+1qlvzsp8eel4l9P8JPFSMrxcQFA=; b=URywAtA64IyXNcbq
	I2ogQBxxOv0MhB1ztEftPAS9xS14d0nPiGJrtAowqoYovUGhFfXQcuEyEpGhxL5X
	jhx2J1gFzpKaNdhdJgy8P1x+H+vKp/vtL9IUzfZpe6okcHEIFumWKBk2wkcqROLJ
	9MdHC9ueR+hOyHG9GKp9qivwdxilQ/LmOXWu/BXuGu4ZHsqNR+9ebi7Pv6qDLisK
	AnsXeNHTIYxvNxz3YGxbGFvzdZIjJNvRMxG12BmaX+JltD/YVOw75cb7shZWztLu
	E8edS9EpX+K67utVfEAmiVGrM9F1weLXoHwE/WFUoZb3Bf+In0vLIu5IsXIULkz6
	dk6xmw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj9brp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738105fa48fso194318137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625836; x=1784230636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Im/jOe8hqK6N5FZ+1qlvzsp8eel4l9P8JPFSMrxcQFA=;
        b=Hwbom8DPdJED5vNxveSNsnyHld+dk9smIcCGj0SDgCbzvOjliDvE+WR9FE1HKhRjFJ
         tnXkTxMLwKudETpTN53hg6R+hpUhYFGC5K/ZDloV6MXO1AbVal8OoUbCHeEd2Cn8K0L6
         97AlssAkDh+9V0LOq/2ok0dt2rxJMlc/bhIZfxsJGYU7UlC0JaCbQ/ATGmZRybr8roV9
         MIxtbHeAYLsqNL2p9/oeOII2fUslI6mPaTVa4hgCDmcZo+5ZfSo9eu5fm5xB+vJLUbRf
         m2dyXrP1lB/3tDuSD0qqgP91U4gkewEhvq/9rzt4veBrPkvFw6NraQo5jWXygu4XQ+VQ
         2b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625836; x=1784230636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im/jOe8hqK6N5FZ+1qlvzsp8eel4l9P8JPFSMrxcQFA=;
        b=rJ728Y1nD6AeRJ/EdY+Zdqws8FKVDx94mGkqnt21IW5AtzczzP3frXYZ2++diNWQye
         t7VF3dU+Oe31+FVzcqhVKZHuGqL6hpBkbEgE8kX64xnohUucPj57e2AtNkXCB9YUvuu3
         10Q2HItu6yBpNuQ9OD5fmch1FyzEjTuQAdmKfWzjAZxV8o96b4swvbxG76varCcmvJK0
         SNyx7XngqM2KkHfGvhpNm/0l2Pc9Yxji6kJR5ZiAL733rsqs9Vc5KtzSCk3muMlOHvDT
         6/M2kL7dgnjtJJrzZCrEJOta3rf/Y9XxV25jjDUN4wB+VXM8HYetFAtwQ1pJvjg430q8
         DoRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxdwmoJpTGXswidSgqqThnwRG4Fy1mC/l/KfMccde8S/6JZG7C8oQeYJ9v8ZlzJlLnCFFwtGeLHFjsi6Xr@vger.kernel.org
X-Gm-Message-State: AOJu0YyN1t99h26l2O0qmonkiBxgre+qnJLMrxmz+P7yi5fn9DNh7xTB
	IeOgXq1m/s6xY6DJIBTZNOKVehGpO3+Iz8WaccKLh/oPMzE/7xWhlqV1LOFOotailLBIvF4+1i2
	muIjd3z2j/O7YJu/dI6g3CRIDp2HFJDiN4qXFKafUqpiioKI1FR4exkTLgyIupn3sJc2v9PaD05
	ML
X-Gm-Gg: AfdE7cnO7btQHAMhzS3KUgtu3ltvVjex7EFzMCSlORFgbQ1HCFskmq+5TMKl4TVHKlS
	VoDojGYoE7w9T49cQfQTEme1mNMu/mWzvLpzEUNMbxmtPMHlFgTjanw7RG0LBTVmPFAAJgpqTiV
	hfn1QsIFH8vMl9LG82LcLA9YowtxgHyet0RNUWsNv3TC63tpLOAa1Eo9YAzlGtnkWsIOionl4pC
	7CO3t4qZzVhy5slQhfp4CrUhJGaeaFst4u2E4+8CgDiKUKOcCUjOKHzzTX0KkBI+zTszYuOEaaF
	3l2ViQ+bpy/mhiK3P0DWU4060w4c/8yagi+SRJmGTKjqy78PvBwpsME0HvVQx2wQj9Tv/HniLVe
	n1zvt+XCdQvkRRokggfz3cRh7o+KC0ITCHqPD4j7rnkhVhJS1DN2WlmvOd4gnj677SZXp4nCLuQ
	PZbs4XVrHSOX5sWM0kB4Rm+CVt
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id ada2fe7eead31-7450c6bee37mr318706137.1.1783625835539;
        Thu, 09 Jul 2026 12:37:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id ada2fe7eead31-7450c6bee37mr318693137.1.1783625834987;
        Thu, 09 Jul 2026 12:37:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:03 +0300
Subject: [PATCH 6/9] media: iris: add VP8 decode support on Gen1 firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-6-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10875;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ExR6aYJGUABcfgsgorOmvfya83WqhibhOuJ6YBT96Mw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5b/j9ilSr+fnz/yWEr1YJ6P3YmQQ9eL1lRorXfds2NFY
 /XMqzydnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyF499v+OqhOz7TjWn92u
 p/fo+MuNmZmWCQe3BhSZr4v+1rv09icj6xV7GeNcFX0473blClU/8tX+ViDztSzwYJzPoZ2Kr40
 feE6I+Oba/k6cNe7olD2v779RPTLhBqvc0Y+NvaJqgTpha7P3Bqy0N2F9cox7p+bH8L7W1VXKIS
 y5ec3vxFnWcd8r5S4yysg4/UTjyRLeXBarmBXWd6MOTfvSrW9x1fTS4opXWn8k8/h6NSc1dv7eq
 XhNvjCzizk871K5k6ZO0cfr5XrpXKIaV/z2LMo33KuuEb/mlaiY3z31ha3OF8618D1j1tpvI+Xd
 oWecf/53waI4u0Yp9W33k9MWfb8kEMFa806Q87GGyAlTAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX2tsSXu24SZ7C
 MZ1dSG3ZlocyHln+vOXjvFsmC0CIqydvG4lLou8rk1jvpmUsGV5ljijhhU034eDgWpQWbr36Vuq
 ErEF4PF4ZDPZB/6HR2H432FrU0T6PXgHWYpUANIJLwx+WE3RxM4k/PHsJvrrA/XyRviszPucwnk
 WD6/BwOV05mxd+eGP5GpVLWtBD8dLodoxS44g39ARUk8RnNKusJk4w/JyjyG0Aq4NUP5n4SBYBH
 PLS/hgC9g+ThewPJ/ryKXm7sfwcW+n9OX2xTQxIKkb3lca096y9439nUfUbyE+kuSolIZWUtmCK
 8i7sOM8vB6T/jeIyZyYdlYwAcheqWxJp8O+giyAHFPi1ZyyAhPSIMu1bh9sxm+ZxUI+ueeuIAwN
 1C6XtNqRXX6Q/rlXGMDOYbofi8I0kYXbcVbjLhShHa85dsqj6khDuuQx3d/eby3XaeTAHEtkCVX
 O/4Xy6az4O6Wn6H8W3w==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4ff86c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hIvao4VD2mfccuCEdWcA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Ac4uNOzQjSI51s0OqE3JxS3k3U6WBmo1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfXzdnZ+1K3J3/r
 8dlLEGoAr+DIK6ms9e5IUZaUB4fWjOevoqVcjuIABiRSH/2YClSzGRQ23vAzNGUMvyrAS2TwXmu
 Dryz9nWzZ8WDw7whVc730RV2ahGTiYY=
X-Proofpoint-ORIG-GUID: Ac4uNOzQjSI51s0OqE3JxS3k3U6WBmo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87AB873511A

The Gen1 firmware supports decoding VP8, but the iris driver never
advertised or wired up the codec.

Add the VP8 HFI codec code, map V4L2_PIX_FMT_VP8 to it in the Gen1
session open path, and compute the VP8 internal buffer sizes (bin,
collocated motion vector, line and probability-table persist buffers,
which reuse the shared VPX helpers). Advertise the codec through the
Gen1 decode format list and register the VP8 profile menu control.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  7 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 22 +++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 64 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  3 +
 7 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index c12fe724dfb8..1bd6460a1b0a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -28,6 +28,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return PROFILE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
 		return PROFILE_VP9;
+	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+		return PROFILE_VP8;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 		return LEVEL_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
@@ -171,6 +173,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_PROFILE;
 	case PROFILE_VP9:
 		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
+	case PROFILE_VP8:
+		return V4L2_CID_MPEG_VIDEO_VP8_PROFILE;
 	case LEVEL_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
 	case LEVEL_HEVC:
@@ -558,6 +562,9 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 	if (inst->codec == V4L2_PIX_FMT_H264) {
 		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
 		hfi_value = inst->fw_caps[PROFILE_H264].value;
+	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
+		hfi_id = inst->fw_caps[PROFILE_VP8].hfi_id;
+		hfi_value = inst->fw_caps[PROFILE_VP8].value;
 	} else {
 		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
 		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 8119c639ec24..4c3aa5a03ddd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -30,6 +30,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PROFILE_VP8,
+		.min = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_1) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_2) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_3),
+		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.flags = CAP_FLAG_MENU,
+	},
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
@@ -423,6 +434,13 @@ static const u32 iris_hfi_gen1_dec_fmts[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
 	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_VP8,
+};
+
+static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 const struct iris_firmware_data iris_hfi_gen1_data = {
@@ -677,8 +695,8 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
 
-	.dec_fmts = iris_hfi_gen1_dec_fmts,
-	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+	.dec_fmts = iris_hfi_gen1_ar50lt_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_fmts),
 
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index ed9fef2aec08..90645ed3e0d8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -105,6 +105,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 	case V4L2_PIX_FMT_HEVC:
 		codec = HFI_VIDEO_CODEC_HEVC;
 		break;
+	case V4L2_PIX_FMT_VP8:
+		codec = HFI_VIDEO_CODEC_VP8;
+		break;
 	case V4L2_PIX_FMT_VP9:
 		codec = HFI_VIDEO_CODEC_VP9;
 		break;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 2702f255bc04..13c8ff59d6e4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -14,6 +14,7 @@
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
+#define HFI_VIDEO_CODEC_VP8				0x00001000
 #define HFI_VIDEO_CODEC_HEVC				0x00002000
 #define HFI_VIDEO_CODEC_VP9				0x00004000
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 317ba48e6305..84017b66e98f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -115,6 +115,7 @@ enum platform_inst_fw_cap_type {
 	PROFILE_H264 = 1,
 	PROFILE_HEVC,
 	PROFILE_VP9,
+	PROFILE_VP8,
 	LEVEL_H264,
 	LEVEL_HEVC,
 	LEVEL_VP9,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 88f130d09a6e..ca90414e6c19 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -293,6 +293,11 @@ static u32 hfi_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_buffer_persist_vp8d(void)
+{
+	return ALIGN(VP8_NUM_PROBABILITY_TABLE_BUF * VP8_PROB_TABLE_SIZE, DMA_ALIGNMENT);
+}
+
 static u32 hfi_buffer_persist_vp9d_ar50lt(void)
 {
 	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
@@ -715,6 +720,57 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
 	return _lb_size + vpss_lb_size + 4096;
 }
 
+static inline
+u32 size_vp8d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, 16) + 8) * 10 * 2;
+}
+
+static inline
+u32 size_vp8d_lb_pe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, 16) >> 4) * 64;
+}
+
+static inline
+u32 size_vp8d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return ((ALIGN(frame_width, 16) >> 4) * 64 / 2) + 256;
+}
+
+static inline
+u32 hfi_iris_vp8d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_vpxd_lb_se_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_vp8d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		2 * ALIGN(size_vpxd_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp8d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp8d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
+}
+
+static inline
+u32 hfi_buffer_line_vp8d(u32 frame_width, u32 frame_height, bool is_opb, u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 _lb_size;
+
+	_lb_size = hfi_iris_vp8d_lb_size(frame_width, frame_height, num_vpp_pipes);
+
+	if (is_opb)
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
+
+	return _lb_size + vpss_lb_size;
+}
+
+static inline
+u32 hfi_iris_vp8d_comv_size(u32 frame_width, u32 frame_height)
+{
+	return DIV_ROUND_UP(frame_width, 16) * DIV_ROUND_UP(frame_height, 16) * 8 * 2;
+}
+
 static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 				 bool is_opb, u32 num_vpp_pipes)
 {
@@ -950,6 +1006,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_AV1)
 		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
 
@@ -983,6 +1041,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_comv_h265d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_iris_vp8d_comv_size(width, height);
 
 	return 0;
 }
@@ -1021,6 +1081,8 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 		return hfi_buffer_persist_h265d(0);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_persist_vp9d();
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_buffer_persist_vp8d();
 	else if (inst->codec == V4L2_PIX_FMT_AV1) {
 		caps = inst->core->iris_platform_data->inst_caps;
 		if (inst->fw_caps[DRAP].value)
@@ -1101,6 +1163,8 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
 			num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_buffer_line_vp8d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_AV1)
 		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 2085e316a6bd..684b459c0cad 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -66,6 +66,9 @@ struct iris_inst;
 #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT (32 / 8)
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
+#define VP8_NUM_PROBABILITY_TABLE_BUF (5 + 1)
+#define VP8_PROB_TABLE_SIZE (3840)
+
 #define SIZE_SEI_USERDATA			4096
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1

-- 
2.47.3


