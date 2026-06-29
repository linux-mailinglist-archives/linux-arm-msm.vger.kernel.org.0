Return-Path: <linux-arm-msm+bounces-115090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Um4SLnpzQmoc7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:30:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC556DB3AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:30:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L9u1Qtgp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B0CHSfdB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E45632927A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7A411675;
	Mon, 29 Jun 2026 13:17:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C91410D26
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739028; cv=none; b=DwPipddBd6MhOt00GxJccSPTpj7oQjLbD/J9ZMWasvi5nyXnGq05/oe2eBj+fIvevcUfGMKQb6pCOAJCWSTAPUg5ZCWCySkn23MWLktTF8C83t1aPNekYx0IaGyNrR3oUcLtQLqBeRhB4mfwSZ54ePzd6d7i7+e6EqfxJ3tNBeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739028; c=relaxed/simple;
	bh=92SBcbOJz6iW/NT5A9l38IM3GJXtNmfe6y+JjRLW9Ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLgOZs0iTenSM63HjmlDhgPhdfvJj1LwK3zKYgTRKbmMw68YSecSdIbLYCAPcYUxvb6Elr68sURsOIOAyV/NJbvueaEnkB9o/3efnNMixbkCE/P7m0MNuI1eYZFNKDau/wNf2jUng3XhfaV3EB7zQJDG34o46SdEFWgodlWFBIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9u1Qtgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0CHSfdB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASvpE2601200
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5iB5ejigL/1+7eiQKKge0TAmtZoQNU5D3awPHwLiWE=; b=L9u1Qtgp/pADBDvr
	fYzyFPwMyqEaDFUE/w/zeWYQjIRt40bV3xr5I9608p1O+RNtPflaBzpHgFXQem7c
	zylSiodGdA7C92GvsmjyaLXC8cWRi70FmbV8+/x8tjn0paJ6GdGiEVqvxttpIKjQ
	b1+Gf79mbl3fksuf08yfvQH9kOp47+uJqb1aVn0ITzz235Fk3oXk2Ki9+gT6GmN1
	oYAHHzEopyh02Nf15TzsnN8TfXPMRKXRpm7BpdPLGJYRMw4ijDrK39xuiV8aT5Ba
	CopYCxfb4hP3LV267vpnT3tYvBmoYoshhbsvBOEctXr1qIP2wdSGLNEto7RXY+mP
	gg0Izw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8yv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efe7db1c42so22394996d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739025; x=1783343825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5iB5ejigL/1+7eiQKKge0TAmtZoQNU5D3awPHwLiWE=;
        b=B0CHSfdB2rwHYMei11uE+8IYG8+JTB8cDPq9vQO4ST/Iv0uW6kbsYJnqyl18jjdkv9
         SNoCti9whIBf1bqHe/JVp7+/HMKpMms4BBK/WgXsIsKWaktebd5+ygMAvtddGmlmBVEX
         YL4IU2VUmtI72jPfmvsy/vtZnH98feOgx5P9aAjWNl/4ZbD/ayh0+wiVC5Map8D9U1ab
         FnTa1jcvGypCqmOrjYBfTiCUdo/KFtY77P+Ckh5Z31kmuwQ+ucCZHnsq4QwNFShTSb6o
         rXpAXescKEiz74mK594h/bkNgX3zx8Qw7McFvSzcNNYjgS/c5wMGM74tWIpilL4w1SdR
         zC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739025; x=1783343825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p5iB5ejigL/1+7eiQKKge0TAmtZoQNU5D3awPHwLiWE=;
        b=JKZorTSXey9aaETMV+VnDypZCmHE+8ov8XuUf9PHMGFM4m2C+OrLSTr/t/nTe3zpkJ
         Hk4n1zYxFFjZrlN4F0G/sZyetkdZyemKjbWFRO79vaak60Y3Q0l6UGErItXPG5vcRadP
         fVqVy64u+oZnN9zulrRHOxekc0C0BNfGnPu0ZAz2EYq/lnKbnBq9k+EoMJbuX+F6HvqC
         ZiJ6Amx+YWq+kiDjwna1VMhVr3BLf1zch5Rx3bmKGcrBB4Wp8qppuT6FaqQQ0Q81+o8N
         FZi23/sjYo5Mb7MBIbznQid1/+vpVnqSfd6Uv8w0By0qyV1ExplJ4tcVNMGYZAEdbIHO
         Q7fg==
X-Gm-Message-State: AOJu0Yw3r+9OEpIf69lthvMkP4xymNM2IwZCNRHuolTNTriVlSzaOprT
	/COCJsIdHrjnowmVAeP8CMH66UXO/dGH7e4W98QMeUPuacrOVl0KOg7QM1XcUk4Frhju6Bccf4R
	DOVMFjZWENOJFr50NuzhOl3eFgfZSoQ0cZWTSSzQ9IHHwI6MHxuiPNfNiVgAhKkBrpr7t
X-Gm-Gg: AfdE7cl/tN1bN3A8lkMXiX/rmU6NICpJJyvwzq5qjYIHpphaMzRCNHF5B4GUdWQIEbG
	Sh0NY224AsTwHpvXHjTaimsGMbHrdNi/LmsLlTMiP0wSS4XqbKqnZ3/hHoJ1GFVYFUXVbmeUqzu
	qf63xAPrQ+QV5KZWXFDPfoJljI8vh92QFD7q3w6JipdPgU7qkgPAGTw0zcrOQF3GdBE1mwsEs4v
	fWXzkBlsyHjlo8+iXs5/TdaxFAmQlTHr1gkk/PZnclS4EQ0izLf6QvAi2l7D6QVUc+PT4t7SHAI
	I/cPCaAVGj2KnrKX5tWFL26IRd2KfK7S9NKJRbd5rFT9kXPdgHrQNKSytvnxj7lRMkVTHqus5G2
	xoCysjXl3rgPoJTPkN9VA7Z7FAIde8QoySg3374vIHFKMEmUpH9+fXmGIgQAQFYswoMZcPAmG7A
	==
X-Received: by 2002:a05:6214:d81:b0:8f1:323a:fc45 with SMTP id 6a1803df08f44-8f1323b0825mr19720606d6.15.1782739025329;
        Mon, 29 Jun 2026 06:17:05 -0700 (PDT)
X-Received: by 2002:a05:6214:d81:b0:8f1:323a:fc45 with SMTP id 6a1803df08f44-8f1323b0825mr19720106d6.15.1782739024922;
        Mon, 29 Jun 2026 06:17:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:25 +0800
Subject: [PATCH v5 07/25] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-7-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=1019;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=hs6YElQtz09tmRSdX6C0+/uz+2FoQvn4lT6aOIb3i/U=;
 b=reb60TxU1bvgNegAvfCb7OiaNN4Sn8GZVf+rYVuwoznWl6OFH3DpNLQpBi6suoqYV1kP9wqMS
 EifVdezJJlUDGZt5qlcrw7JRZzoTZAC6M/b/oLYSJlpaGVQFLrFbZzD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX8AJ8+Oc1ywVL
 vw7wrzjnmV7e0xuhAFL3FJGPxQqSkwXO/X6xmUJq+CrRgvDf/q8v1eAWWwm41GRxG8rj4ytWsRV
 6LJ3MjqgwGgvc+ArcoyYg9irpab558I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXzDGrt2Bi2EhX
 xliGZifQHpRCnmt8/5u8UnMMS/Gp9vMzU0M0w51qwi1em3DnVk8IjpcyKldK1Yf9hYx9H4/V0l0
 APCXENa/hNuJKp+lYBNR1dW4xmWX51k/nme6xF1EIaNzbRF/TjOihlWnioaeMHeHgT+a2LYN5ZP
 /xhiQv9BpvbxMaB7A1lFV2eIz2o21HlHdmRxKu40zVW7pooMmDBtXPquiYaPReo6Q2+o4oGZVKF
 Iu9MNVcitV0dNEPf9v5jDs+cvSv9JmsehvRL3pAVS2aI+os3m8F7PdHowVpPs+doq2n40d9T4Lz
 8x2pk1pDtdx+TzqkLqwOM7fykUK0OMI46zRS0FazDTmACfZ4gJ0jDWhDKA1lZ8ZwsiPJ6fJcu7t
 lIUkaEsTNvpePVKZTyeSed8WWjT+Rd+W+g14DlfiT4vsfto1EO7XeS9MEn3+ISO3YFYAlj9Kudp
 lvoYA6xuN74HGopcbbg==
X-Proofpoint-GUID: J_qcY04LzZ8PTqsMNh6-JhvRsYXYQRLx
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a427052 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J_qcY04LzZ8PTqsMNh6-JhvRsYXYQRLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
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
	TAGGED_FROM(0.00)[bounces-115090-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 1EC556DB3AC

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e9aa0e254234..5b5149b160df 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2705,7 +2705,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0


