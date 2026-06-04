Return-Path: <linux-arm-msm+bounces-111161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id miyhHlQ/IWqSBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:03:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72E63E4AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XHejtn7g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SqCW5Jdc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DE9F30A5B35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2643C3FF885;
	Thu,  4 Jun 2026 08:43:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E23FF1A3
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:43:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562592; cv=none; b=E3GmXBcYLw7J34UeWSp1Gtu84Yo+HmeSV+DK1mgV615isYoxu8FGN++bSa6ziVM8WiOiPVug9vhoYywdOpv6eUzd/HR6kJXkKniL34F9k/6+VKpBk3oXLQvk7+rvDLVbsPguXFTqiKifNH5KnjatSOsIf9T+DjHemlhFnFFSrj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562592; c=relaxed/simple;
	bh=GXJ69utKWyPJgnkZag1w62NuJE11Qx1+7KpvKSRoBR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J+50rjVtMt4P1leJzCZ4E7utZCasjnHCl5agUoIdcrj87JIg24A40OHlE8ojYmp3Pbpd+2KRy3PGAjPSnYxCpWcLsRu0Kna9EXqL33qlHlHmv1Jh/KAd8VWXVx9YoiW/z+6lLSjv/XFzA+rzSa/7eGibNcTAST7iSFVtpGDNNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHejtn7g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqCW5Jdc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543ac443234785
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nej8eXPfMjROiliR051aSd
	DqaCCBaa43ZcZOqpmcZMQ=; b=XHejtn7guIuHzC2SMLiluSdhOKdVVgjxp+Exb3
	hgn0ju/X+WO54yTAFnCi7IME7r9wPuJd+pwNrr4rJ+dc4BAyZ92JGTmW1uGQXmhG
	7EV1woe44+RiLYUG5HYTTzmuk8OLMpiW+JG+wG3OBFWSon1ypRUMLCXyzuTRpHQZ
	S5ySVyu/UBODJS05VPhAu5d5s/rRvGuRsTQmukzJNPCGybWAu2lB6QiE/97lFz5i
	B96FcAAKl5YYzkVmR3Y7CdHG9a5gp1ehlzVI3ufO+F5otaSEnAtz+QythaJbIHiQ
	LMz0RENJ2k0H30vcdR2XHW+okuRpZV62sr3k1t5N1EokqxnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s2td2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:43:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c1e112dfso8136805ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780562589; x=1781167389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nej8eXPfMjROiliR051aSdDqaCCBaa43ZcZOqpmcZMQ=;
        b=SqCW5Jdcrxhdipd1Pao6V14BTDdHuEhJJ3wsRp7ZEN8Vzn2DJEVLrqHnEA+MrXTWJp
         dFPp3X16k1Pdh2Ue0lqZWYzJo9EJ2BCjfc2Fp3B5D3e84oYKX1wdmB2XXvfMIWeoV5vq
         XmAJ9lDY1gnOArn2Y/mNmYCg1kifc6Ul+tbL7rIkM0Bwgjt7jv2tMf/TdPLcedVp3Toz
         F2xFQMxtwsG+mml2w4of3di0VadVf3aCDw/H2ZluwwtgTqJ3Vzk0cHdtAX5EqvpI16ic
         anyEmzyNLYXG2L7e6Qa9e5EM4WMJNLo8C6fyN4UacSnWIo8atAxmJvZyD1J2GhJcRNpt
         lRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780562589; x=1781167389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nej8eXPfMjROiliR051aSdDqaCCBaa43ZcZOqpmcZMQ=;
        b=W6ia4EzCrOpIxi8xR8gJdS0EOpXaQfzg8vwJW2JpAQWpHDZ/FuWsBtDiTVbLHs/gim
         JhVTB3T0CslkbSwORw0SzEl68KevY57H6LuGnxz+DW9WLKz6qKPMFY9U2Kakk7BATtCa
         ASkxO19Xt97RxZuBv817J+jRwdziZmRKI9oPZWVQSTGQLLF2lAo2z4/jJ+7p3Wr4VODY
         goiKnIZssuGNIN4XbAcUkqHCQBfGBwKpIPAf7EDk1xXHYDxLi5UyX+r2UiZ9URmnYgpK
         C+3RaYLvKhUtZxR2NkQoCYsg4H69Hcnck7FbeirBsgQuyqcarwJeHV8bAJqysyW1N0t5
         TPCQ==
X-Gm-Message-State: AOJu0YwYFUbViRGzpH6YkoWE3jCVb1HDmg8dRvYT/RJ+V6pshPTRMj9t
	YD+xZcH9CUzo9Gj5MHSqeGX71NaQ+SftoEPRzJ26JyW9BLQqPwd5YY2gSxcerCUkZ772AmvNY/h
	NC6hb01UxzIBT1F480iwzFPjyoU9n3x/fUDDAhocob/iU2fUCJWcLgi+oT34gVozYznKimC/bKO
	vA
X-Gm-Gg: Acq92OF+WLa7L1Ai3dlLo5FPkvq07jg5ZTszluGAcn1CCOZVJorvxy4epRLUgs1fr0z
	R+KKg0kOHADvh/ofFpuDzs83KAs3xW1siCJqLSCvItJ7crJszUWkUnfe7lG44CIdlIO+nCs20+g
	fx9CiJiusb3ACOSBFzNLvFyv5CNTwtjfVl+Qrzz1PvHqEPgnSwYbnH5Xk16YdOcx/yZk0oHIDg1
	dljGRS8nDIc8giVEPzAcqXWsfAbrbslyNULUw+g2aXbzzNIQtegDDjWFIQg5fDvxG1dxZ3yQ2lW
	lSgrIFBUIyXqa1uRm6Crgn1pKjVbTaghz+ONBaTQ8GMykCZh+8skt9X10RRm/AE3GotS60nQfjJ
	cjEj6y1cPHteTvZx9OWiy2zKd6Asz8og+0doXHlMjsPXN6z4tczN5LTfMa+WHOpzHX8ux
X-Received: by 2002:a17:903:1a83:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1644b08c7mr74707875ad.33.1780562588583;
        Thu, 04 Jun 2026 01:43:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a83:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1644b08c7mr74707585ad.33.1780562588086;
        Thu, 04 Jun 2026 01:43:08 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0a2sm52759175ad.46.2026.06.04.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:43:07 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 14:12:53 +0530
Subject: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIw6IWoC/42NTQ6CMBCFr0K6dgittiSuvIdhUdsBGn6KHSQSw
 t0d8QJuJu97eZlvE4QpIIlrtomES6AQRwZ5yoRr7dggBM8sVKFMcZEG0jRQA00fxg7q8AaP1vf
 RdRxoTnEFnGbQzpXWOq2ULQS/mhLy9tDcK+Y20BzTelgX+W1/Aq30f4JFgoTa4bm0svQPY26RK
 H++bO/iMOR8RLXv+wcACwm43wAAAA==
X-Change-ID: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780562584; l=2762;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=GXJ69utKWyPJgnkZag1w62NuJE11Qx1+7KpvKSRoBR0=;
 b=fYI1bhxnSangRLv/Vc5ovSILygfo+4TwhXpGS52FH6qITIQOn11EMLxEHP/1hy7ZVj/hzIJPP
 0WPAfXlGsCsDMq2bx/NAsEsOPehyhdEEpQmFRVofKjtGe0cVXVz5Bjj
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: uFZl209-jrXFf2Onl1ses_mn-aV7IM6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NCBTYWx0ZWRfX3L7SumGsEdFy
 azEkjQdPSNMTPaymkxmcjah+lQuZhCCYrKjjKweEnaseDECbPvD57ctsFD1nT6YPgjmoZsbuzAY
 QJaWICq9zwYzD372WkYUQciqi5NhWZ7SkbcOcwfDkqqAIqJt4JSm8td4jZgI3ZqEhS7XbIntcjt
 /MU0gfed/pjmWo3/kn9eOvw1b/XJS5QZ08ZvH175DHiqMvjZhA+03nq4/Pn7dOt0IKm8q29DonK
 nEOQUUl+/uJS2MEM1SkdNn84qG/xyOdAx+WLJb4m8rokXi/7NgFtAfsw35WoYzsYjH6vNGyIeec
 4aIAp33M6/UoNk12FQ1C4thl2GyO5KaQy4fNwXQ16dhy0bewkYupeeYz8ongyE2Pv6QFh96ONgl
 AkA8dSgzvbU+3VsiaPopDPvkE1wSa0o/eKDjA6XxEy33ewWVTyOoEUczVAZeSPl/mrTRtYq/YsW
 oouYu4d1599RiOl1wLQ==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a213a9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tbFSlT_ZUQ3aV-P4CqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uFZl209-jrXFf2Onl1ses_mn-aV7IM6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B72E63E4AB

During driver detach, the device core holds the device mutex throughout
the driver's remove callback chain.  When the rpmsg endpoint is
destroyed as part of that teardown, the GLINK endpoint destroy
implementation attempts to unregister the underlying rpmsg device.
That unregistration calls device_del(), which tries to re-acquire the
same device mutex already held higher up the stack, causing rmmod to
hang indefinitely.

The deadlock manifests with the following call chain:

[<0>] device_del+0x44/0x414  <- tries to acquire same mutex
[<0>] device_unregister+0x18/0x34
[<0>] rpmsg_unregister_device+0x28/0x4c
[<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
[<0>] qcom_glink_destroy_ept+0x58/0xbc
[<0>] rpmsg_dev_remove+0x50/0x60
[<0>] device_remove+0x4c/0x80
[<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
[<0>] driver_detach+0x4c/0x98
[<0>] bus_remove_driver+0x6c/0xbc
[<0>] driver_unregister+0x30/0x60
[<0>] unregister_rpmsg_driver+0x10/0x1c
[<0>] fastrpc_exit+0x28/0x38 [fastrpc]
[<0>] __arm64_sys_delete_module+0x1b8/0x294
[<0>] invoke_syscall+0x48/0x10c
[<0>] el0_svc_common.constprop.0+0xc0/0xe0
[<0>] do_el0_svc+0x1c/0x28
[<0>] el0_svc+0x34/0x108
[<0>] el0t_64_sync_handler+0xa0/0xe4
[<0>] el0t_64_sync+0x198/0x19c

The rpmsg device unregistration inside endpoint destroy is redundant.
In both contexts where endpoint destruction is triggered:

- Driver detach path: the driver core already tears down the rpmsg
  device.

- Channel close path: the rpmsg device is already unregistered before
  endpoint destruction is reached.

Remove the redundant unregistration to fix the deadlock.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 401a4ece0c9777398837d4427746fae0a5003e88..ab7ff3d2f56bf797592fc4227ce5b730bce72226 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1418,9 +1418,6 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	channel->ept.cb = NULL;
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
-	/* Decouple the potential rpdev from the channel */
-	qcom_glink_remove_rpmsg_device(glink, channel);
-
 	qcom_glink_send_close_req(glink, channel);
 }
 

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


