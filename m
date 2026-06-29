Return-Path: <linux-arm-msm+bounces-115130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ihqJEdWCQmps8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:36:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5F6DC1EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:36:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AT/K1r9S";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="dJ/Te0Os";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDFBC31A9547
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA9F3BFE47;
	Mon, 29 Jun 2026 14:15:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315F37882A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742509; cv=none; b=INSFhb8bqMbPzZ2eQaNDSdhNXETOtn6DoMubQMlpMUVCyFBx+PyIkHCdmyBu7oRJ+6OgB8dSucEbj4Z6DgNjBhRUh5mnrIsLBceS5Q8nryyD3OpXSJhxUBXm00HVDi0nAccHUItw3PUKQbpaie80vnmOwpCuTUtGCV7lX58zRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742509; c=relaxed/simple;
	bh=OaULnG6ZYqDjHwwokAvPm9tNfpMjHsLvWglqwDgfRoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJpBRgVNlzeZH3/zLq0/n9kb9ctuazggXWmgsofHGTdazuJ4IkhJR+3cLNvnZwQUND6Wlf9wdAct4tiNjKe1hULavVX8UqrqdtLbN52K8aar3ducIuAxhD9LRLp7I27pe/4mXfjey15HkSsvWs9uwRJgX8I9rBzBkfLXmQopZzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT/K1r9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJ/Te0Os; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATK7B2656122
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eErWUES5lcasuhvm6WPQHNkgN01/Ssy72Sz66KPQZic=; b=AT/K1r9Sg0CpPcIT
	maqJQlcJLqZgc62+Db00ai6a9cWriVexCBYeKFuCjZkN7BuyQTu1unmZn85N5mpb
	/rhf2VE/t/GW6Zj2T135lzwPAKZl1v6dGndB5W89/FTmPaGG6cbLALvLyCp04ERF
	d98WNX2c+BGeCHRAtCAu4RoLl8+GPjt23svOUk+OVTJRZ7/4fzlhhewsBDpOjdkv
	+sAsjEXdpPKIaltRUu+TVYSh6UUVZEX7DUIgMTiBy/iUVnM6AYFAoqpnUwX6LjME
	ZHhMNAB0VZRH3UqeyVuM5wOsxFuNr5h9Sex3x8Ede25ivKqY3GMieA95o5uxm1yA
	Uo+KuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7h6rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so221670685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742507; x=1783347307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eErWUES5lcasuhvm6WPQHNkgN01/Ssy72Sz66KPQZic=;
        b=dJ/Te0OsAk4Jqu4ocjqP9qthT6AEGvNCmGGZfY7HvENqu42reje1HvfsZi5hkOZKri
         k5PDUScnMxh4UrXPg5aE3eF2F5SBV4naZMJull2+efIcP5brTBb+7tRxgeoiNW+Fpulh
         Lem9ZJz4qjfVEsylA6ztSrWA89s9V/gWOplCIbZZoZc88uW0SByodC1WWl+XZNQCXfnN
         86jBEj2vQK2EysU8MBn2oKxUGC4ZEV4Vs30J/UlcPnCl0AVOc+c48zsDv6oRgvhBLwhQ
         M3gzvHJk2EE8jReTGHX6t5eZOesIvhDpEB9vQyjVQpr6YcKQ7RW+jAtmPAyyuY1uLc3p
         yDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742507; x=1783347307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eErWUES5lcasuhvm6WPQHNkgN01/Ssy72Sz66KPQZic=;
        b=JTH+nEBTcjq0mxhvDp+xowjT+UM+fNcFthB3twKsJHKHtFz106NYQdV8nkEH3GDwRh
         ZUGllQBe6nJPnhx/jDLLkWzOeu+aowPC4higto/E+/sJ/NIenhzVy9hLJgtLlCPS3ae/
         dw+SPnKgx6v3yOBGEEVE08m6cos6+5Rodi9iLw9ge/wNBJLPM7yIKSPmgwQAAwHKtCEN
         NLV9xrjKyOgGfH6UapirEVteAVCW7i/GqsSQAc3tV2HP7355PltkVYZ8YrWgFvaiUn5H
         gTT7WiL/nOupj4teWWVz/jBBdCEYoHEcwDPN31rR+Iz67cdCNplsDMXZRJJhE8uqYa3v
         yoFA==
X-Gm-Message-State: AOJu0Yx12QvP7QwDBBq4JIxPPoDXBrs+bQCxwg9Pv9Z32Fpd6Ls3QHvW
	kRCj2tF2n4rjc5WZdgQG9gErNpeTmVzkE9iCXY8lLmqsTwARUm1/bqFbmHI96ogRQdJA5IzKudH
	4W49Cn0OTQOD7HkoLaI/6Nvn02bLLjoT35HkvY8VK5oQCECUaZZF4gn1gA/gnO+2wwI7w
X-Gm-Gg: AfdE7cmRxpcyI2FRFPePtWAIjH9aa8CFQpWnjiOKFkfc4YD15o0epp4AdM4Z1MGEmyo
	WNPLKbs60R3mvBowNhpQq13sb6C3Zvd7BBygncA+B7ablaNOaqeNnWzfgn2y6LECEQe1BjMXNOK
	C/hp1ggr1T9RNhxb41YbKOdvGTpu9Ch5/iQV2GgXPKxt7eCVPpSPeOspz8Fi5s1QTM1LSXGdXXf
	lKhrLdA6wo/XJL4RzIuXqrBaSRaZB+A6I9nADfMuGS7AKSkxm4jDv1KzWkVTtvbbnJp2Tptxs13
	2B2pCbc2H35g5tKB6OHBygUyv/9ByPBJRjOVwcPHk7aCdsDgMmicyIILD3chPULdqiwqrSio0Rp
	ibe4O+PyNGWE54IiVhXc0e69Iim+jUvSdizjzg/V6fiCG3TjBPLzbuLsKsZuaPo7yZyWQIg==
X-Received: by 2002:a05:620a:19a1:b0:915:b9f6:719d with SMTP id af79cd13be357-92b3da97d5amr1656551185a.30.1782742506281;
        Mon, 29 Jun 2026 07:15:06 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:915:b9f6:719d with SMTP id af79cd13be357-92b3da97d5amr1656538585a.30.1782742505553;
        Mon, 29 Jun 2026 07:15:05 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:05 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 02/25] drm/msm/dp: introduce max_streams for DP controller MST support
Date: Mon, 29 Jun 2026 22:14:23 +0800
Message-ID: <20260629-msm-dp-mst-v5-2-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=4176; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=Aqo+NoeQSRVWiAKg7eVou998ouelemJcrlt/SprmKw8=; b=xrP8SSMsPOs65ifnl/6yyv34YTP3zjglo6mf3Xq0XimtZ/7B5wRiJAnTUrI730coFiRU9qIWm TaeGAqCKFI+A44BGtDQibFQN4kjEpgr4++d015+CfNVJDUj3R0/21xo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX+0tirrFoo9b0
 rLKsW2hcsICXLlpekk+a4Mp6E/mJ72bftq+N6OInuAruZ2OQm4p/ujwbcpdoA2yppVpsB0xmDdE
 R+EFuECnwlpP4hui6p4O0lv/d9Fzu1i3PdZZWKw2NbRy9A6buPd+fkVMay3TSS1B+Xe++LK4yiM
 S4C7bnaWjv82sy9Vw5Ji4MhMobCgzsVs6uW8GGwx/tBLP62muGUZ1T8nUoVlQ8TEDHt+NKJ15gf
 enqTpCnDMlGlszAGLd7O81cGiou79ahLMvHuRagsBrUrU/l7d2i14d0RaxprdGYfMv1XpWa9jn1
 l5afwmaZm8xgh6WXCi+KktsxPbpB5KLak2vMrQGGzTVK4Qqqc28KMIsoe6WJ/PdhuCD7hYZ5DBe
 wewSFq/hCTTipsVaRfteC7lE9m8uOZVnPTG7sJh24z19kmpQFWUKX2senLPLGiBvXaxlR1J194/
 axWJFeLk1fPlF5jg94g==
X-Proofpoint-GUID: x6-fvK7fn4qVLh86nBDd5V1OQSHakNZZ
X-Proofpoint-ORIG-GUID: x6-fvK7fn4qVLh86nBDd5V1OQSHakNZZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXxZJA2/0CbtDV
 vM3LUASeCh/2HB5IhAyG5xIA1oezIxOuFJENNZqg3IdGnayusuLHhPWTH4OioF9fUI53N8jbyq2
 2pi9ckqFPlvIe0evuxRJOrsHVoHw3Fg=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427deb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lhQZdvDDsnZ9MB6dQpsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115130-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBD5F6DC1EE

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP controllers across different SoCs vary in the number of concurrent
MST streams they can support. Rather than hardcoding per-platform
values, the number of available pixel clocks in DT serves as a natural
indicator since each stream requires a dedicated pixel clock.

Introduce max_stream to capture this at initialization time and expose
it for the MST module to use during setup.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 13 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a475e787656e..68fb4facb056 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -127,6 +127,7 @@ struct msm_dp_ctrl_private {
 	struct clk_bulk_data *link_clks;
 
 	struct clk *pixel_clk[DP_STREAM_MAX];
+	unsigned int num_pixel_clks;
 
 	union phy_configure_opts phy_opts;
 
@@ -2754,6 +2755,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	if (rc)
 		return rc;
 
+	ctrl->num_pixel_clks = 0;
 	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
 		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
 
@@ -2766,11 +2768,22 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 			DRM_DEBUG_DP("stream %d pixel clock not found", i);
 			break;
 		}
+
+		ctrl->num_pixel_clks++;
 	}
 
 	return 0;
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index be0d89d60914..305add3dcd93 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -55,4 +55,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bb243ab09e66..9cd243411e44 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -87,6 +87,8 @@ struct msm_dp_display_private {
 
 	void __iomem *p0_base;
 	size_t p0_len;
+
+	int max_stream;
 };
 
 struct msm_dp_desc {
@@ -578,6 +580,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		dp->ctrl = NULL;
 		goto error_link;
 	}
+	dp->max_stream = msm_dp_ctrl_get_stream_cnt(dp->ctrl);
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
 	if (IS_ERR(dp->audio)) {
@@ -1178,6 +1181,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->max_stream;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 43ed79093e24..d3d4ab98089d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -26,6 +26,7 @@ struct msm_dp {
 	bool psr_supported;
 };
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);

-- 
2.43.0


