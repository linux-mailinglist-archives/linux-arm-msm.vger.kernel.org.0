Return-Path: <linux-arm-msm+bounces-115089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S+dfDXFzQmob7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:30:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E46B6DB3A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ti0gehum;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G9hGt29e;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55E8031558F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0093410D36;
	Mon, 29 Jun 2026 13:17:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D09410D04
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739022; cv=none; b=IFG0Xfl9YM/7ZNx1F6Mj7m00+Dr/vKhemJmdZlx1AkenKc/fByAhe0CFrCFMVsM1Jkzdt75ZQR3mepQbmaj7f5XSexUl0SnAd7NFggn7SP/57H4CeuWvQZTGMbzbQKc5bSz75D6MmtWmFHtXrulUmXeMYZrVd7tFBD9ROm1ZZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739022; c=relaxed/simple;
	bh=HrXfxA0vQxpfmNwi4ljkU3JeEeN7YnnHIMe4CnuWbEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogJGMEVUf0xQSH8V3RLSMzDWTYwSZBFMyj8L0Q9fx/i08wlu4sOzR445Q05XuFflZ5mdiUw96EY0oQzpHltlHCo+eSubu5ocaaozzD8ZfWJssH7L/GPUb3v0zShAEXaHOvAkTKutiJt9iwwvB8ll9Nx1WWZdqlWBewJWyQCi9/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti0gehum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9hGt29e; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKN52656156
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/poH3AEjItoo7L5qbK6e3dZL/yIyyfNWIp0WMuk8fQ=; b=Ti0gehumpTP/8L2C
	7sGfmXxltb+EyzR4rV8Ja+8+wrj4zOozOmBYwS7sbKBkKYUzGLCmA94bB9oYcAxP
	wGANyjJs5pZwIj6Z3HP0AL0pgDGlr9QuQsT3Ignik7z/pvQJBJv27eodWz27cHj5
	SJ33mX6Wl0YLiLFF6Bs9HotiXLov3n+xQSpDSP2Tc+5kyyW5KL5/ei3OPfzy5V1V
	apoi0EBYEtbvwZqbBFwCfQc7tCBx39xlEVptJ4vViYcEhu2SbbyLlJz4ChKF4Nfv
	Ts6qiySj7ctnTokQz4trPLZ8bLpnYKRmN+fzDpUMJX69MQGC+PK0YtSZRiRaByW0
	IBkWSw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gyc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so5508688e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739020; x=1783343820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/poH3AEjItoo7L5qbK6e3dZL/yIyyfNWIp0WMuk8fQ=;
        b=G9hGt29eRT7KL7Y39oitwE+LVFSA5R3i7Zk71a3Ti7JiXqtGaYJchZzDQQvjMNYGKO
         RrUF1hsYWnYrQP2//ILnga1Y/F0CHr/tvS8lzzgnO48G6CjUAhzsQNHvFf7H1QTZK+ao
         vh0ltyKux7pGjVgN3+DmUDRqYsJ1gz6O9boFBQ54jJchDjB30bcQT7NLGzpjlbKnfiYU
         1V8mh208PoV2av/RNvnknJkQmSwf1n7hPKInVj9AZ14ahD1y2rbII7i2rdrvlA0CnlJL
         IBP8uWDRiuYlcEIOfCSlWQ2s4oMJq3mTfYPh5blJ1738baYgoONB01LGI3gS0bp/enJO
         Cj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739020; x=1783343820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/poH3AEjItoo7L5qbK6e3dZL/yIyyfNWIp0WMuk8fQ=;
        b=GUERi/eWt7a9rUFA9eDjBLt7jEtlhsTlb+3lRnBIKCiRwa1dTy7ItjSK1r7lXg0IG9
         0zYbrk25j/Qu4xOTpaDihEQDLnIxeJ/MLvWslIpgR0tWO8uyUqSczq8g+RBsrzH6KuqE
         MOd9IS6VPGlzCj26KLiw8gcbQQNod1V5fG/314U8n6HfXhx5069YFezFPQ4cniq7YO0K
         Hp/8h76JfY9WzoS61Dn6GXkvovaEEQqhceR88CV1YsdsMwjg0MIo5EVEl+nl6iAXXKkX
         o2S1BlE9AIftjbm2CfKwFv9+Dw5s477Z/mcjCKVmjqPWc80lkCUW4+61ypG9h2W4FzvT
         Oyyg==
X-Gm-Message-State: AOJu0YzzTdcCCvO6qitBO95uf6WLR+n94FsJtf8K2nrTWawt4zKIF9Pb
	X7AkoM7IPQZBYwgh2YEAlnA4tFk59PRBNmW6dpmQgJRrdfPmeIDn3WR4u8lvJVRKDx5v/g6v2uO
	UlG5LbNIbzTaa86iX0r5dYah+6Cz6UZcQN/nQA5vboj2n1v2zq2DxP2j2WD/dDOz5wwKI
X-Gm-Gg: AfdE7cmFVTk/6mMQkNejDLZcWOmaYoTgGvBjBfEarYtiKUQ9b7/KvKgDcPAiPzoLMvP
	Tmt1hIqgcxEXVJKDQyQ9C7DHEBatVPwYZ2R3TNImx2Tk803B6/goKXu0IsGD8zD2r1GPrdlBE6y
	4Cn/oLlxToTd8FXQvoesVf9QRoOPHZR/y09Dcxy5WKCpmWtLKzWd2pvXFWXDm4qSnsgE+mBGqs/
	l9ZCVCLAZVCL7Gk/ZFFmCA9awhnKjgSGRu5F97wJu1yqrcE63ZFoFooXKmTK/E7JOTJzq2q3dlo
	ZAJR1fx5AWKXzF8x6IHXxywCSE6UX7DvTev7abJrvyGlUIj4686m7VGHneRGEX4tf3CX+9RBa9z
	/BvOvHtLUg6pJZd42Xi+d1/YtJ8SoGtIev07DV3hYNqaV/rnM1vY91LXmhfXsaPDdAs76JMB9Vg
	==
X-Received: by 2002:a05:6122:c8a:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5bd69da3acdmr7383632e0c.11.1782739019872;
        Mon, 29 Jun 2026 06:16:59 -0700 (PDT)
X-Received: by 2002:a05:6122:c8a:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5bd69da3acdmr7383603e0c.11.1782739019495;
        Mon, 29 Jun 2026 06:16:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:16:59 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:24 +0800
Subject: [PATCH v5 06/25] drm/msm/dp: Add support to enable MST in mainlink
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-6-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=2592;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Mzn/mLQcqys/EJpBrtkVNH08m5/h5cbmf+/AjWnre0k=;
 b=4XjPuruS92hOctRGAyXEjiLK0lN0g678mz+ntFwexktPlD1SIlyk++U63JB0w8wv3Pb2g1GAX
 6Ur/Pseu19xBFwmaae3hEWmd1ZvmRnYhe1aWEZA3gZfAEqAMr7pEyRg
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXwb0jtSZIhL7S
 UryPBEnBiKDPDB+PHcjP0gRi3JhP98xtsiZ1vrwzoEvj+kZaNGixw1bm43f8uWaKzuVQUNzhVmA
 1cBJ/TLOtGPUQWrel7ljctb/pDpkCZr+zWSJnk4uQDHS5PjMzj3G8dT1AljWimfnxi987kh+MIE
 ZGSxOt/wNe7sF5GQ2ceHLVrOgf0dcwGNy6kieroAHQ6kxSjeXdvGVncg/YMEMq7ZAECvV0lYfu3
 kVI+mff5PlH0Hn+DXKFBGHpEOT8IUmo3Z0Jw70RHpnqwsDfV+NzgtCenJG/XFGtPsKBSag9c0En
 kMqqrVmQ9gNucBHiAqu6UJnuAFrKnlHsSMuaW9A90cBKN/XEdu1SBJywUl+IA2COm+WtXtygAhO
 aDeMEu58yRA8h9IwYc3m+gxA6JH9zL4vSpmH5UvQG64IWOjAvF5aYVjwS28IK3iaHU3RKWk8ydc
 C3IxXwy9Rqxx/dl1zbw==
X-Proofpoint-GUID: CjhCJoUJq8e5QDRs-GZwJT2IRCwAWbjy
X-Proofpoint-ORIG-GUID: CjhCJoUJq8e5QDRs-GZwJT2IRCwAWbjy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX6fPrx1fzOun3
 hJeZO7jvWDMzSAwKjGMXqRMEpIPoZF4FUPYkgaLu+XRWVyre0dHQIFb/Z7mSQHHdYXJrEaTDFcC
 Q0uKeHrvSz4TBjscFv46smAPQNKCIIE=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a42704c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115089-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7E46B6DB3A7

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6754b10d418c..e9aa0e254234 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2678,6 +2691,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
+
 	if (panel->stream_id == DP_STREAM_0)
 		msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
@@ -2731,6 +2747,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 6808965878d4..deb40ed24654 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0


