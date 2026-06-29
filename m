Return-Path: <linux-arm-msm+bounces-115104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z8mtLLJzQmoi7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:31:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C06DB3BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kiNKbYht;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fe0b3Cr2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115104-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115104-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E01C330F1536
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C764218A9;
	Mon, 29 Jun 2026 13:18:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98FB423A7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739099; cv=none; b=I1bm9Wo9Ym50abLoQ49D68N4SnpyyOo13ShlklbaG0LdTvx6O2BAQ13jc16N6DuVywu49Ec4zDg2TCjcO3SVxtDbKnY6oUN1N9uNYAbUSbVaL5uVlw7/+y4kUkAfjheUs5BsikKxbXXKZnUSHTwPpW7FLEl/AVnZ7sqDqd6UusM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739099; c=relaxed/simple;
	bh=Nu7YW4TXEkufL2/VUa/aa1d9ExabRLDcY0ZzM8BCDDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVLkae8mMeUfDF1jE2jaGIzwR7UVfZljAN0/0tyfAQV/kIXlTzRiXBDAhqChtzKua0HaAg0bXixLUvrDfLKQyrpkNMkmL+STraYGPyJdebOO26c0vvEZlIEafIOvF+KZ6nQQZdUfrvG2CKbPUW8rL8HHjAP+0o+MnO/bibxf7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiNKbYht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fe0b3Cr2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwpU2641471
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9GXCpGI2FZ2U+GAfjzoSbly46KsmEpGgfcu9nwsblA=; b=kiNKbYhtGhxBSb+a
	LyAK0D8gjvIY1E9oEIWWvLrib9LyR25oRZbjc75VGbGOQ4UnYmz7rc0H4BYgKbhg
	zKN0bnwA1Jy2rSzU6e9rneYE4c+INsZ9NrYsVJC+7NjqHhztO0xPKsjled6Wu/7Z
	fMNOrs+gz1C7Chcg3bW/QvoiGlHtkx9DYnOR87M3zcDL4s9hWAprP1dV0VnZeZWL
	sNeciUvmrrR2Vk8bPpbrI58Kkqbggc+6l/igOhZrK2icS0OLPWxYDLZM5D689tXm
	X2UocKFjVIt8w4HtZU2yLQstFXx38tMSDbPyAKqfWkz56tgxylXQBvRYOZGzXB1F
	M3Fo9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperyg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f73fso34843246d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739096; x=1783343896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9GXCpGI2FZ2U+GAfjzoSbly46KsmEpGgfcu9nwsblA=;
        b=fe0b3Cr2O7lk1JhvLek+r/4lOpcHuVqp4Ve3JDGrGIO54NPNa2qBJymuMCgi9ZQ6y+
         1h4T4d1g+Ozkvd7Dhr0v6oZSVsVH+sXPLmIYlDvkJxm3PL1Apx9z0kHYOFL8Jc11Lorv
         S0DFCL1YZAaWy8DI99tLqV6+GWnsq6nH9UHF4UKj5K6pD22jA2oigonHnd+9YgM4MkMR
         y1mEOXmaHZFkHu74gJlg/prUPDX5UP/gmGo19m/tO0J3/19OKja25N8/0KKzAQj51XbT
         IC1i1AH00uCQvgw4Un/SzY/eh/vXatE+S9chqBbcfo/cony6h2RDrZUEwEuMk9qld99H
         mQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739096; x=1783343896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9GXCpGI2FZ2U+GAfjzoSbly46KsmEpGgfcu9nwsblA=;
        b=Q8lDmlosZPQg59caFfOEFsixnZOll1gc0A67rvNbxK/2Sdw3WG4hV3DniCvrDrm/oL
         20Dn+K3opetMcsOaFExi+xqt95ZTLhYFMzN97G1ImmEaTgq5w6xfbrT6/2/ITmbsrquL
         gCvCaoJNGAV+LZLebDHOJMa6oKCZGi1ZhSgXkpgxE6gBm/Nflf1lUY6Anc+wGW7jcQKz
         1GJabMfxxMMOCVB24pzppuqz4VBoBh1oXz9CVqMUF4x/H+2uUIBSQlf5pHTB4nZIHwrF
         F0tP7aw8xXhPo61so5zVSuAT/ZUkrEKWlvMwNOdlgxmeOC8MvYgs/+d0N1hTiYzlhWu9
         zQow==
X-Gm-Message-State: AOJu0Yws3iLbL87DSGVX2uwKx6wqN8/YyZcWWlVnvdmeEDTH6zzd+cEF
	FikVTroNJO3CDU2+tqhd7qYf7iUuz3W/ndK9W+kI2ke8CRzwR7RprlQfXsjSbvEg+boGmqKFqN7
	2ul0BWhFkWr+mgmbQYDfAmW3p+OXX+yfXz5DzPG90EiSOsfB2J14Tn2Es9Od77AW9FMuS
X-Gm-Gg: AfdE7claWFfptch3MbdeLRnYeaVi2knnovWEhIt0vNaZ3vGdUdcRpOSkX49kY6NTUdy
	Zx+nW4Ayi+liBzR74Cukv4HDT62sKyrbKFXLBB6Xx5qws2VPmTq34DPCBnJDx+BgxHoHwHQHdJy
	tUa6gR5UPx0QDrYwsQPHjtj2ga17Cwr4lUsYVa7WsX9QyBfDSetTtHzfG+GOpyCOi654cBIqXVo
	EOeIfPyyzDYOvJRY06kCKEysamhiPnzN7rAQybCYkIhULXn3WogRY4JK4tSwWW7tvdX9XHS6r99
	2OCm1FC+iGulZSZE/9zv9iTzyYfqmp8D2AK7AFxWQGVXbnX3aaM/W8PC++LcD+Bz//IoSTLGLmZ
	XZL5PObZrOnYwiJ6tHq5RIMv4hYDXKnnNM4Akdz78c1EkOYxyjzfBXv29NRuS29NZ9NUHPMEyWA
	==
X-Received: by 2002:a05:6214:5785:b0:8f0:2c80:caa5 with SMTP id 6a1803df08f44-8f02c80ccb3mr56994306d6.23.1782739096005;
        Mon, 29 Jun 2026 06:18:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5785:b0:8f0:2c80:caa5 with SMTP id 6a1803df08f44-8f02c80ccb3mr56993276d6.23.1782739095378;
        Mon, 29 Jun 2026 06:18:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:39 +0800
Subject: [PATCH v5 21/25] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-21-1d882d9012f4@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=4713;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Nu7YW4TXEkufL2/VUa/aa1d9ExabRLDcY0ZzM8BCDDg=;
 b=ohb3WtX07SqjYmO20l2UfR1xpcCRG0WO+ep7uEdGa4OsS3EK1uZpJZEbExSPOXNC4QLvR5bVf
 QNiRP7IYn6PASfe2bJwNAhfwRmRX+nld/WsdOPCaT69gM62o66KpnCx
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX7x80BjXkBMqe
 ZHyAebKzfI3FmAwu8dKBVCMYxfJk8Y5uEFPiBEQnTXt0TenOdoyHhQLP6qyZoWUNLR9b6TYSz2i
 MrtccFR4WWBBnzQlRAajGyJxXqVX3Azcc22RQ7INWXA0OTttGQrKhmGAh5MuxmAGcso7pDqdTPa
 jXK3BZEAjOktplqa4lLz0whwzUiFB8Qjvt76ilJqBWUP4a9RJupsNxis063MiZZeDWiU/1DWSyB
 sf+4rJ4ov5oer7j3yRnmTRYNSHk0E8hJD3sD9ieDSC/QCJOVp+zifh+RW5hTI+eVPEOM9aN/zgC
 D5E9KSN/lKgZygvdzWzSi2pk6I+5FXv0Z9kqeyHDPCEi5DCYaYkK6H62l632yxWTttdCoE50Nry
 oo9GW6LEyMsHRSFpH+sBw2ERya8bK7NCs9XY890hOoZHXRt4Yv2iNFqB3lXnc4WDKD4nHwJefFk
 fk/UGfr9/B+CHur48qA==
X-Proofpoint-ORIG-GUID: sg9GLNyavwIajfqSZfbiHzFj90yE0H68
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a427099 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xL80pz1hMqKSlDDrj7YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX30P2aWMEH5bA
 DEaoOxOhfmBBFa1hLtp+1FFeIDj7Gl+Z9cOS7ncWLHJLWHRrqFXC78hdjZjkshwh2Z0HlHXdNK6
 2cblSrrDdPYEnsUAZJU+3Bz/3OH43Ck=
X-Proofpoint-GUID: sg9GLNyavwIajfqSZfbiHzFj90yE0H68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115104-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: DF5C06DB3BA

Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
controller as the intf_id is unique for each MST stream of each DP
controller.

For DSI/eDP/DP SST, the stream_id is always 0, so existing behavior
remains unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c74ff6f0dbd..3adfaeaab71d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1438,18 +1438,21 @@ void dpu_encoder_phys_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, u32 controller_id)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
+	int stream_id = disp_info->stream_id;
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
+	DPU_DEBUG("intf_type 0x%x controller_id %d stream_id %d\n",
+		  disp_info->intf_type, controller_id, stream_id);
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
+		if (catalog->intf[i].type == disp_info->intf_type &&
+		    controller_id == catalog->intf[i].controller_id)
+			if (cnt++ == stream_id)
+				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 	}
 
 	return NULL;
@@ -2675,8 +2678,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, controller_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 25ade3dbbeda..861d69afbd76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 91d33b432427..b32ecd5b0777 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -614,6 +614,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
+		info.stream_id = 0;
 
 		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
 		if (rc) {
@@ -689,6 +690,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			}
 
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
 				if (IS_ERR(encoder)) {
 					DPU_ERROR("encoder init failed for dp mst display\n");
@@ -716,6 +718,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	info.num_of_h_tiles = 1;
 	info.h_tile_instance[0] = 0;
 	info.intf_type = INTF_HDMI;
+	info.stream_id = 0;
 
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 	if (IS_ERR(encoder)) {
@@ -748,6 +751,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	/* use only WB idx 2 instance for DPU */
 	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
+	info.stream_id = 0;
 
 	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
 

-- 
2.43.0


