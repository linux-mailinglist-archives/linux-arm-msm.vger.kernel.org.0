Return-Path: <linux-arm-msm+bounces-104609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NWcGpUF72ng3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:43:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D186E46DC09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8EC300460A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA824371CE9;
	Mon, 27 Apr 2026 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9B+0pN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3DgFZVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C75371043
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271950; cv=none; b=cxhcRx/Vvj/9T6EflzyIg7EQc7dAe0hGLEE0smKUvCEo5d936Fxc+Z62+LmrZryMYbmV6/gJbU4ov1TEOxhYkpXdDh+ZSIwrQ1R4Yg4KNPqTOUco3L6mKBj9KqCwvGy54zxt9bOZIfzVdQaZ3MEtZQiPjpBwyWjTh4e+2uI19FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271950; c=relaxed/simple;
	bh=twNgjSdLVk/DrYt7aPzgVN+MOCFk7MhrzW6YAjRqQnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IweLlQetwUsbHVlNoHQv8g2Yebh89T4hiLBOqUDAKSCU5Zha68PIH0TEuLpQCMJoAhFMEhLAsUkNeUuHllIcccVTWWctnagC2fgv+C+T3gshxrNz5bPs4wpGDT1/iSIu45RPcNXvTP1WmD7T1h5zW4dIQr08nLQAteaUGJTFSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9B+0pN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3DgFZVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMmC7Y3613340
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=61k0S6Aru9OHZyh04vEK3H
	Mf3snwaPzlYNIyU6zJurQ=; b=X9B+0pN5/64cUbBlhfNBDKS+5fVivKX5cGvTIE
	2I+HyyyDJHgNwQuDPq63k9xH5I06Lmcy4nAykLXuyUbR9PN3icJoMg0pZF1mld0P
	74GuBvt8vkDchInMD4rtAcrQ2IOvdLUdk6u/70z2NEYBmu/biHqPS0DlE29P/Jvk
	wGqX6Q43oqupWJMVSXOih26ALA+p3gE185P5yUun6W3rLXCc8krYGm0elw4+xYgn
	VYud7ar7430mjn8ZcbR3lRlr2oQz1VGBjJ3UadnipZSys6QC55/FLqA4MS4lZHpy
	cDDXbfL5oGsBShA2qOlt0wVQ9e6TxS8fEwtO2/QMI8oWTJZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdmpr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso9576186a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271948; x=1777876748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61k0S6Aru9OHZyh04vEK3HMf3snwaPzlYNIyU6zJurQ=;
        b=H3DgFZVa3ufMKtD0xIdM8IbPjFOzyHAr+CvCm/wgdqSLtIDX4JLCbz2sDDu24TerAl
         gPmi2w9m6df5qbhKkXeF0VPHKVXis8Sy0lslRtXfMvfqecZfKUFD1iRL0jVfHvBm72ke
         rWVLNfjFeLUhBYf+UUqwctEJ/5lBIfX1M9kHKcyI50fZrqWYvez0W3eKzIzApT4QF5cT
         9oLzzoES4UJ8hKCUGjLylz9rX+CEQnpGImbvUcg5cs6uS8XHnRqyUQMe/YwkGz+ZOhAF
         IvEYZ6Um/Cbmh1rukBlpyIZUL1qL1ekH4beAWfgL2fGIbTpTm5kfsILg6qJB08xMtSzu
         BT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271948; x=1777876748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61k0S6Aru9OHZyh04vEK3HMf3snwaPzlYNIyU6zJurQ=;
        b=MJb84Y5M9eD0N71l4TZSO9438H+6rjKDKNsuf+T0ftLtc4rHtVoie1nPaGK/4YmOr0
         KbUOuZBpepBXbRf0VGyroZ8k4y+/HeuLoIHZL4sjPblniCskKpnqzJfnz15BhyCtRzXW
         IAuupQfYje6TsOGvpLsJ+V+Em57jeXOSvdau8/3yEpEptKc4NTO1N5/tJZfKf65xoigB
         FbyJhc6cXzqh0FfmJph18bOWT5aEm3kMPXArtQAWGTIVdhXVvxyBlKidc1AsKyvKQUe/
         id0LbZjj+9jdym05BD/6F5hxzgoXMfDcHFRUXOtDtkuNoOnBYYWEfhkFWCR0pstJVsff
         rmSA==
X-Forwarded-Encrypted: i=1; AFNElJ8xF4y+gRwT4hX6cyUtKut/9cly97+moDkzxfivu/njaa4wd48C2oCZYHLqaN0GY/BO+p9DeaQ3tHuJG4xz@vger.kernel.org
X-Gm-Message-State: AOJu0YwpjXdykCYTtg8gU7JJrOhCj069D7pjhh/V/6p2B3DqTvgeGej0
	iLGnN8c3wiLwxjOx5Mfxv7CnhpcU9iSE5BtbRMHXe/Nm1rse+rV7Q5UyEru8yQIq8tqg0mUxUPc
	grf9N1GW+Gd4PmDfTCA48+AzaNJA6utxkNfUh09RtK26wmRZAs+j8T8VkQn0lgjzsqIWS
X-Gm-Gg: AeBDies1/2ux1LDdfFZJUkBlvTf7vaLY4EzxZkEkiXXfKcjb019gjQg8AsLUZeI5IK+
	PJ0cF9m1Lkqzz2o3sKIEmRdCqiet1Va8QamUC9ueZKQcO30RuffNWNp3vkJvvsl+BtKfj/vjmTJ
	Td4YiZHVUjxlSY7gVahUX7VmHUJeiT/pBpLJK33la3kcr6BC6Sv69wBVu12rA0ebbCZigP81vui
	934mCMb/UqaW3kyTQ6jM55uabG659mjrWN/QAMVkNqNXJHSbTfuzVfXFiAIYJnAPxnQ/IOunxZm
	tbMa6wgQSIFEy10Yh9em2kJPobs4i6cxwUqrYrTJOT4J66Aew8Jj7uPk9VgT0JszgVMwzbLGY2p
	5Nlcftmue5jldgtzrMdaBiirMn/6M4HSBpnfVb12sHWkw78T/OD2vNKvI
X-Received: by 2002:a17:90b:3504:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36140478be0mr40995957a91.20.1777271947666;
        Sun, 26 Apr 2026 23:39:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3504:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36140478be0mr40995916a91.20.1777271947140;
        Sun, 26 Apr 2026 23:39:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:06 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/6] qcom: Refactor GPU GX GDSC handling and IFPC
 behavior on A8x GPUs
Date: Mon, 27 Apr 2026 12:08:54 +0530
Message-Id: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH4E72kC/12Myw6CMBREf4XctZeU2oe68j8Mi7YWaASqvUowh
 H+3krhxM8mZyZwFyKfgCU7FAslPgUIcM/BdAa4zY+sxXDMDZ1wxwRS2zYyuv2ETZk/IhRFHbq1
 WWkH+3JPfhny51Jm7QM+Y3pt+qr7tz6T/TFOFDIW1Uh72RjIpzpGofLxM7+IwlDmgXtf1A+za+
 Z2xAAAA
X-Change-ID: 20260406-gfx-clk-fixes-24a492bb7676
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX1Z/YjzCt3wo/
 FS/bzqVjp5ZW/vnrgrKN5YINYJdRi99r+b2NTpIJliKy9tqlsZw9DZQx1SSEhDsusmhjNJA+M1F
 dufJSX2BKaxuhV48upUYWXa6oy98d29+3ZJ2JZRYTKo1ftJjbBxwMgZe1R5bbqABaKAXvdVpvJs
 DdhRahc+SHhxTzLBwNxrXIoC+ITIJcBt3gRgqXeAprria9jFycM48gGQK8Br3Eg6+FMDz/kftDr
 of83YeeW3ja19CUwFTIldxrRqdDfyzep8WsyNTpaEIEBivi8jPh7gdRP1ha/C6WjKcRPuyyRgld
 j8mTU+AM+LdEHe/XapTjFthIJCuKPfRYh5NoWrxaH3G5vyrZMcZyTdC8bufx5y0W2BDNHgCAOop
 8t8HKqbrumvokOUK4EDE7Y/ZvUrwkoRpizaAGb3Wg1oBDqoDYDWuHejg2kjv1w1l1A5DBCGD/lz
 LIGp55PihW8lOWA+giQ==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69ef048c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zYEJGWroTao7pyO8AgkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ERsKF0fm6V4RTwYDpb6aF3jAuspn4Lyh
X-Proofpoint-GUID: ERsKF0fm6V4RTwYDpb6aF3jAuspn4Lyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: D186E46DC09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,gmail.com,pm.me];
	TAGGED_FROM(0.00)[bounces-104609-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series fixes two closely related issues around GX GDSC ownership and
rail control on A8x GPUs, where recent hardware changes and runtime PM
interactions violate GMU and IFPC(Inter Frame Power Collapse) architectural
expectations.

Problem statement 1: Incorrect GX GDSC disable by OS
----------------------------------------------------
GX GDSC is a special GPU power domain that must be exclusively controlled
by GMU firmware during normal operation. The OS is expected to force‑
disable GX GDSC only during GPU/GMU recovery.

However, when GX GDSC is managed through the generic GenPD runtime PM
framework, it can be unintentionally disabled by the OS during system
resume (resume_noirq/complete phases) or runtime PM suspend paths. This
can race with GMU firmware usage and result in warnings such as:

  gx_clkctl_gx_gdsc status stuck at 'on'

and failures in gdsc_toggle_logic(), leading to broken GPU suspend/resume
behaviour.

Solution:
Introduce a custom disable callback for GX GDSC that prevents the OS from
touching GX GDSC hardware during normal runtime PM and system PM flows.
The callback relies on GenPD’s synced_poweroff flag, which is asserted by
the GMU driver only during recovery, explicitly allowing GX GDSC to be
disabled by the OS in that case.

This ensures strict GX GDSC ownership by GMU while still supporting
recovery use cases.

Problem statement 2: Unintended GX/GMxC rail votes from APPS RSC
--------------------------------------------------------------
On A8x platforms, GX GDSC has been moved to a dedicated GXCLKCTL block
under the GX power domain. Due to the current runtime PM device links
between supplier and consumer, when GMU device is moved to RPM_ACTIVE
state, GXCLKCTL device will also be moved to RPM_ACTIVE and result in
GX/GMxC rail votes from the OS.

This behavior conflicts with IFPC and Adreno architecture requirements,
which mandate that GMU firmware must be the sole voter of these
collapsible rails on behalf of the GPU. Linux is expected to intervene
only during GPU/GMU recovery.

Solution:
The runtime PM of GXCLKCTL can be disabled post the GX CLKCTL is runtime
suspended in probe, so the runtime PM requests of GMU device are not propagated
to its supplier GXCLKCTL.  To avoid incomplete runtime suspend during probe on
clock controllers using runtime PM, ensure pm_runtime_put_sync() is used so that
runtime PM suspend completes before returning from probe.

This along with GMU driver change to vote on GX GDSC only during GMU recovery will
prevent the votes on GX/GMXC rails from APPS RSC during normal GMU operation.

Patch overview:
--------------
1. clk: qcom: gdsc: Add custom disable callback for GX GDSC
   - Prevents unintended GX GDSC disable outside recovery.

2. clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
   - Applies the custom behavior to GXCLKCTL and fixes runtime PM warnings.

3. clk: qcom: common: ensure runtime PM suspend completes on probe
   - Guarantees synchronous runtime suspend during probe.

4. clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC
   - Eliminates unintended APPS RSC rail votes, restoring GMU ownership.

5. drm/msm/a8xx: Make a8xx_recover IFPC safe
   - Makes the A8xx recovery path IFPC‑aware by checking GX power‑domain
   state before accessing GX MMIO, matching a6xx behavior.

6. drm/msm/a6xx: Limit GXPD votes to recovery in A8x
   - Removes GXPD voting from normal GMU runtime PM and restricts it to
   recovery using the synced_poweroff mechanism.

Together, these changes restore strict GMU ownership of GX GDSC and GPU
rails, align Linux behavior with IFPC architecture, resolves reported
runtime warnings and failures, and enable correct power collapse of
GX/GMxC on A8x GPUs.

Changes in v2:
- Update commit text for patchset#3 [Konrad]
- Add RB-by tag for patch #2, #5 from v1 [Konrad]
- Link to v1: https://lore.kernel.org/r/20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Akhil P Oommen (2):
      drm/msm/a8xx: Make a8xx_recover IFPC safe
      drm/msm/a6xx: Limit GXPD votes to recovery in A8x

Jagadeesh Kona (1):
      clk: qcom: gdsc: Add custom disable callback for GX GDSC

Taniya Das (3):
      clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
      clk: qcom: common: ensure runtime PM suspend completes on probe
      clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC

 drivers/clk/qcom/common.c             |  2 +-
 drivers/clk/qcom/gdsc.c               | 22 ++++++++++++
 drivers/clk/qcom/gdsc.h               |  1 +
 drivers/clk/qcom/gxclkctl-kaanapali.c | 12 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 64 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 15 +++++---
 6 files changed, 99 insertions(+), 17 deletions(-)
---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260406-gfx-clk-fixes-24a492bb7676

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


