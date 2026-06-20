Return-Path: <linux-arm-msm+bounces-113880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jmsZIKc7Nmo68wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 09:05:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2D6A879D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 09:05:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TDf+6Hdo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QyUEjp9V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113880-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113880-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 576F730209E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 07:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D8E1A3166;
	Sat, 20 Jun 2026 07:05:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9298D22F01
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 07:05:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781939108; cv=none; b=PuEB9MOBtvOhKruNiZ5gYMdc91QQ0Fo1wBgKqqaRzfZOXxukW2F1SPmkL1lN45Ni6rKOC0wUTMDuZW/hntOJZsXRYEADVfhjzjd1nSG1K3UgdMxBoSgbZ2GKBIYpI2OdeMyAZYUehbSpAGzlnr8TsDqfDTtdw1Zwp0pc8JGGd3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781939108; c=relaxed/simple;
	bh=GXmnUpnrIVhQhzIqZgHECJoUhgeNXDbnioQJE6a6/YU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hg9SQO8q6tmRlES3QhCH1c8itj3Vn1xh9tF10+lqMWpIyap3NQ3Rw35okEja+EBg0Rf4gbcGgwfXEfEgPWpWqPIoK49YYdigerf7hXM9/TempCgXlfIuQ+PXwym61+b0ClkWFdlJ05jUylgANtBnP9oSUwE5l1kXxJAyK/PlKnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDf+6Hdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyUEjp9V; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65K3Ykww3671375
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 07:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wX47HW0hFN2j7gFzO0b6Uo4MzJsky5cYorp
	9WYhIcQ0=; b=TDf+6Hdo2bL4cJxuW1xjHY0KOMB29xm1JAlUrkOZ1VEBDoTrINu
	8Q76vtUxUtz8duJxkvw2w/wf3fzjvpxiUdZ0nuWHkgSr5+LsrmJ79d640MY7KOVn
	Se7yFL/z51vYHqt5TnYUStNPTGDjCrxRlnXTpEXLvkK/49bH0luAwk9MpKDQEa21
	BrmiP0k5GZokV0dEae9Q5qcs1UTu7TnRVT9ibB3Hd57Zx+i8UMq2Zfko/xZfQhIk
	iEkd3ZWESIzvHkMtjkR9hHx4Wcgpgwph5Xxiuvn678Q+Wjrzo7FjgFgsYh/jdnUk
	wDM8h6+WtscxwHgykB2wljYjGCZVHv2lOcA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32rb4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 07:05:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84238e83851so1781404b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781939106; x=1782543906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wX47HW0hFN2j7gFzO0b6Uo4MzJsky5cYorp9WYhIcQ0=;
        b=QyUEjp9VdQ9Bhe+S0H2twmRVus6Ki4tC2whwpqlQp38sx4yy0/ShbANulTCpXwVr7u
         /giZr//WKTMBMukSReKgAYiCe1BaRndQIn1x5S4f0umz9W0+KFw6gf0JQXZjBzT/fn4i
         wxnyUA4So8oePFt9MjMHSeRaodiYb5kzGR9KSz9y01Wywu1gWYL1gGS5scc3CJCN0L48
         9PqKPm9NCtoRaejCfbl+N6pG4Rv9AaVzaNUVl8jAdKFYw2RbOtCFpaLh05JUkXoU0By+
         KrelM8ZgIKqX7HsslA/rlysPanTbmBbm1lLTiovPknlenJXGSQbl6qRbdcfYmflDRqVf
         b4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781939106; x=1782543906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX47HW0hFN2j7gFzO0b6Uo4MzJsky5cYorp9WYhIcQ0=;
        b=J3Dni7QU29QJcNmZwfrfwldhmXYEHL/5K6H/FZE4ag1jT7vgBmSs2ZuEnagqYZSXxX
         r+teWCV3VGSrKJdJumBiEOdtLnXItgujE1fnEVHflXnhZzWxoI/KmgV24dvha3hamZJ8
         t1sK2X6oUhZG3ztnrPhCZczlAjx6nBYnNhqB/aRSU2QYG6OM3P2G7dpyRYW7DHRLDH4j
         Bitv3jdpmmb98G/iADdPaQIbaUjrAdOiVk46vQ0yX+dp7gaQBkHdawPoHon+tk6woHlh
         K+AmSEEKbt/Sxs7PTn4YiD+bNjk4ttBKc6NvOHVIIiuqElArO57StfisQjK2caugc4oh
         X/1A==
X-Gm-Message-State: AOJu0YzK6lvFGBfUocaq65IghK451tNQiIpTqA3bFTXzp8711d0Tvo12
	SaRtqN/drknm5zdN1uxymyrGod64aQsFxO9jE3D4COVjQ9UwTvvIcTezfmLjdY7ffaPwlen343e
	2hyRjTZ2geY2idChJyvfi56/tMkofRR9yoVxxVLelppkaDoA07H7UbhhrjmrMp3JGFayU
X-Gm-Gg: AfdE7cnMiI/VQ+et5qiizwwwEJtmkzrKzM58NPkfQ2mA1X8CBah+8djfFPhR7C10HPy
	8I/4ex2yOQl72zC9UmbzaFMKo9gP8SFRjk7MT3UkMoywqkEAR1ZTBITeN0X2Gac9YdhBwI8rEhM
	5apmsl8swobG0UP03+visDb6M/YZCqF7nJFkHo5wu/Ctu3AJ6qLyAMyH0zYkhIghBUh49iJrZJM
	GrATJySzbE71ryI31woFYrR9SJDXLTVnfCxYfhb2tavs/6UsRqpWUTRLvKgJVC5K/DL1asrU8sv
	VultGo0jCqssLriBBUoHNIrzRxpw/2v5Egz786t1vJmunhXxGBLc4LBcOMugVIWeJAyNRN1VjnD
	ftYTC4PJ2iuRSavMJus2ki6N10gLjwO/KKsQTnkAEmh/RLg0=
X-Received: by 2002:a05:6a00:1d97:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-845508a70c9mr6545614b3a.30.1781939106167;
        Sat, 20 Jun 2026 00:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d97:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-845508a70c9mr6545579b3a.30.1781939105660;
        Sat, 20 Jun 2026 00:05:05 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c2d9sm1673715b3a.6.2026.06.20.00.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 00:05:05 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: defconfig: Enable Qualcomm PM4125 audio codec as module
Date: Sat, 20 Jun 2026 12:34:42 +0530
Message-Id: <20260620070442.3908242-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WARRXRuI-6XEZnv2WVz_qwmd-nR55w6T
X-Proofpoint-ORIG-GUID: WARRXRuI-6XEZnv2WVz_qwmd-nR55w6T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDA2NiBTYWx0ZWRfX3eckLhjcfgoo
 5ZtER+zWRZMcke998R1r8YJerYISzRy7ONH0YJk1jC+E7i28ZFKybT+M35ji52aFloGVKNOYF8i
 zk0ePhPPl9y5vafRcC3u25fzLIwoVeI=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a363ba2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=i4l17eOepy-WKVuA_Y0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDA2NiBTYWx0ZWRfXzAMex2zkdb6I
 7tf8G62+k6wKjlLtn0nGCksI5EGkk+KqrHkSsrZ1QU26L6AMUSEX06prUBdPygc5cCJI/TcPUXK
 6Li5c0y/oGANVD1vODV+iJXALahXfTWYmLNhu6mNhi2gHlE1gkzVB/wzjvool4L1FZ0B8rUtIH4
 ePtPvTt1IBNjROdS0ZY/jUN/uyvuXDVsNeO/3zu/09IUFrDLVb/wJbcOQOTlXHrZwW1/6NtpPHI
 SMji2v3Aw0KXyqjQ4ElE305+XIsaG61+/KFK8xdAycK7mML6zDHbspnsODTqnj+cNofnGtgS2ml
 c8gSqrIpGIa7VYXzvs6ubSwSnnNVLo1N1PCkzUZNMCoeeAm1WjOEK2laFimEGDNRbwk/3Tznk+v
 17GBRfBMePO7U6Pu2LnvMjtXBt3o/lRVMddjdgl1W3mEyJm8clZs+6qQQFw05wy58qGZ+Jh4lAQ
 /hSZqsFsjMKIamUvc/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606200066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8F2D6A879D

Enable the Qualcomm PM4125 audio codec as a loadable module,
as it is now required on the Shikra evk platform.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e..69d548c62 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1154,6 +1154,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
-- 
2.34.1


