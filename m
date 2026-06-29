Return-Path: <linux-arm-msm+bounces-115092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oq16Dvt0QmqN7gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:36:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C09BD6DB4ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:36:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DABwoerj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ENFt9BeE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115092-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115092-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A078D3189E0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3351D41325E;
	Mon, 29 Jun 2026 13:17:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813AA41323A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739045; cv=none; b=ihJG5xQPnb+zi5HKHrFjhusDWBOEIV24nSaY3JAraaIFbTePRpDMAAD9UX6z+vMvqBKvDe0gp3sTi5DXsXMnu7VAGAX5LzeGKor44SBB+hIqgqcmMmwoYn7fs+J06Kc8e39YQS/IPEIBbJzoN8spv7NtSIEvVGzheF+Ec0gmDyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739045; c=relaxed/simple;
	bh=lQ8XwqN4jWvRNOv1dfCYkUO2PgqLEmLGJMFc/jDV06Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yofug5+7vBjpRDFb2e3QVRmsQigAtvObSwwikh8Bl6Gc6VvCjIEhC7x1vgPbuYFJB3wJc4hh7h2LrwM/jTcQnOwE966N+RGoN6qOoYaNs8DeL7eVspOiPn7m6XvMxhk+vno0WNqYjVXwTjHAxjEZKrEvsyk4OH9v8WIJ+d/rA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DABwoerj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENFt9BeE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuBg2603455
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCpD6xAZSemtTL+9Sj4aRdpF6Ft4cWCqG/pZrWlkyU0=; b=DABwoerjBbjPHuDv
	UPF3anrifdMLwkqRqRVSUCoy096YMi6/Rhe/nE9IAbqfsXimuL/vPA5zJLEvQsdq
	vhryENNW9LsSf+ZHktG8Re3EIk6OHAQXHxta+hgfJAMKbI1y1SiC3SbsTKrLSCSS
	TvhWfNfpWa8zqWw8WNSnjCifK0BwSb/KSbvcqD6Fp6yyBAh0N5hkHLJL2zv7Q1uQ
	pa1/PnlXfOFl7B++XgTfPxjzHM3W4Frn0KbXmatyfhB3A4QNwxfWe2RmbC52pqzh
	XYYQikVk0yyuNfttrraNeBjqs2d3g+nSBDwTr6bbdTxDUssvW49s2ygAP/GBh62L
	dCAX4g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88xyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e97889ac8aso58492026d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739037; x=1783343837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCpD6xAZSemtTL+9Sj4aRdpF6Ft4cWCqG/pZrWlkyU0=;
        b=ENFt9BeEw03saH4xdm6KFYdJW2vJi8HoCdvRaxw4o9mZTKmAu8kx/I4qJeSeIdsFHK
         jHJAyE0b6BkqEVwJOcZTdy5CuSvJ+t2S61KWegBguzauqBZmVWC2+TebcBiBaLjk7kJI
         DP/N3a11zSd3dxalSMxQlhpZHvhOgWZLP/8LDZFRi9IlKIh1Nw+eu7r4KZEV01ewdIIP
         FqNPtiBN5ku6NEdP0k5wUHQ5S2jJ8jVdHGOGC6d6MTHyIvgLUkrC0D6s1LxA7Et8WuQh
         x1tOyq6o4oI+lws7pyF9tdm0Q4JuK9wbga7lb+9hY5qcTeg5ItJFyH4v5lwJgHKa8m+G
         feBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739037; x=1783343837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCpD6xAZSemtTL+9Sj4aRdpF6Ft4cWCqG/pZrWlkyU0=;
        b=AEV1TiHoLrHntZBRPpTXf9lGQ6dh8Dq19Bos9HyHAFbsHZRwVcsQTTRyre8pOsesSB
         /T2Zv/50j2lxLv/8BM8uIghas/KOnq+dqv5lI/9qThLJi61sHXY8qq8nFm3qEs1f8kYX
         VG2a5ZmOFvF6VPL4cFydsyYgIlKGxmcZHHToczC4e8ZfND0QFXTxVvIfsIF4r4adoDPl
         Of3ctaWoZW9xK9z2xe6wdPmy4Eq76FZ1VmQw2KsSHqglv9/Vaj6AlrXdL3WNhl3hVVb8
         aShufiFeVC7zEbzj6P0qvYj+mVFlH0dpUFIy7D2MQJdkv0wVk6xJrj24Zowudybvpaq9
         U90g==
X-Gm-Message-State: AOJu0YywzQ4gAhcgJWvHya8Y4dACTmM5VlpUDkYEBZM5qc9GI8+lGedR
	LejT0SLPwOa317aLkk9z/NwD1Y+yUYjbPxgGwdH05TMyWkok8jNaRlj/DLsRb6/VMq+z2gTbCin
	LxsiF2aki73IYbP9zgocTw8ozAMTk1Qmd+Gpp7xAte/8xUSM/sym/6x2vqcOUzi2j5uDr
X-Gm-Gg: AfdE7cmj7eaVkQMkMSDgxPfSDPBX02hx9Ws03b+k9/buewU916QA/dneUwEFRNbrewN
	JzghSYq7oPomQVxTnhg2HUQmvD9R4Gidd920vnblBWNf2gMlDhEgrt6v9y3R1prOIqU3ephJi3J
	AMDjSuCosnKYoGpZg7nA0+aMUb9YUhsE+F2gsv5FT8qzW1rCLRwg7L1RHLwej8JKO+vfXqR3kW+
	s00UVYZJSYhdBDFQ1cz98dXN3mJhl+DIoABpoDiEsxdu8W2syHkFX2rNuM4TdgjTstmT9z1ouEw
	cefOvNFNIeZLyU9ej7qyTs8pfKXZadSRzqHv7xNDxhFFl/oWpUHXDk5GD01e2qaFGshjwvlfCI8
	flA4n1jZg8w/GeYa9wSemNPJ29JKKbpbCPO6YtFcTN2LnXCbwBzd+5nZGuN0Vzdzgjt1ec6+80w
	==
X-Received: by 2002:a05:6214:212a:b0:8f0:744e:5692 with SMTP id 6a1803df08f44-8f15abb40b1mr10159086d6.56.1782739035872;
        Mon, 29 Jun 2026 06:17:15 -0700 (PDT)
X-Received: by 2002:a05:6214:212a:b0:8f0:744e:5692 with SMTP id 6a1803df08f44-8f15abb40b1mr10158236d6.56.1782739034943;
        Mon, 29 Jun 2026 06:17:14 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:14 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:27 +0800
Subject: [PATCH v5 09/25] drm/msm/dp: Add support for sending VCPF packets
 in DP controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-9-1d882d9012f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=7616;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kb9DHa7CnMIQxIpNCRuaqgUzGVz97zztaJU+4N6igXw=;
 b=qBt8aAHxlHzwW/GlsJbLILJeqblpEe9KUNGkItVOKRW39WrBRKv1ZrGIu4FikPbSXGk7h7sWw
 6ua9I8uLPbXCxfWJ70cjehma1OZdbUKDivDIsHr68cEzdp5k/DqVcPF
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: kpssW2g_b5e6MCJQq6mqWNzdiXC423uB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX+EOBWsd05thf
 YxkvHGQsRDhNkrtNPU0FpeGgDZhPxrWbQePxPjqV0W8rDrUX69lKzsq5muUud5JrX5W4r3Y5RJl
 pVrJwmyNSHJe+0Sv/XDIuIDjbiV2Yog=
X-Proofpoint-ORIG-GUID: kpssW2g_b5e6MCJQq6mqWNzdiXC423uB
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42705d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=unrKvF7sv23klRea54oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX/jjRxbEcJIXK
 XbVbNfA+1W3Fm/C61+vlvUbCn/eqbNafKIB0gUNfiBSjRnVuzGVecYiJSYg9gc9bAzG6Hs60zxo
 IzRE4U3aEeLttTmXJ/IYvLNkx48hSl2avHutJ+4VaSDGjXs/Gzn2XO6i6YYe1Q0W6d4KaTjFyDi
 C5KejEHS1RLCKcDCmsXveUi7rnTKIS2kA87g4tqJaLVt6+Th1bgVWGq8Sawv0anGlZzCo8inXGw
 DDimvIEXq4mC/wzDLPu7I3qSszQ7TB1ZcC2+Dm4iFzLqBL/cbBZkdnzcoOC89JrnCTBDO8kJGO1
 75vDwdMi40MW3OWw/OegS8cFsKKN3nsEP4xO6kEfyF1gvu/dwgb1ExwPV8wi9PoHHkRWGH5wzmI
 g+s+CQa4xpLJdjJqSCaLJ9ysLjyD+IYxNC6jwT7a8FhB+/xqAm45oK61yNcZMNsMwCYSI/i3utu
 crQqt21wvqjRuanoVMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115092-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: C09BD6DB4ED

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
Add support for triggering the VCPF sequence in the MSM DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 ++
 drivers/gpu/drm/msm/dp/dp_reg.h     |  8 ++++++
 5 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 15df82a0caca..c4f1a68b1210 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,6 +65,11 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -398,6 +403,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 DP_INTERRUPT_STATUS5_MASK);
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -407,6 +414,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -426,6 +434,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -525,6 +547,34 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
+/* Must be called with msm_dp_mst::mst_lock held */
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	u32 state = 0x0;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		state |= DP_STATE_CTRL_PUSH_IDLE;
+	else if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= DP_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= DP_DP1_PUSH_VCPF;
+	else
+		state |= DP_MSTLINK_PUSH_VCPF;
+
+	reinit_completion(&ctrl->idle_comp);
+
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_STATE_CTRL, state);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_VCPF pattern timedout\n");
+
+	drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+}
+
 static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2994,6 +3044,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
+	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
+		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index e1d10ae20f70..88a02d52f61c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -27,6 +27,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 36857d6ed313..1af56c84b82e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1524,7 +1524,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index ef2ded8ec4ea..cbbcc0dbf652 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -39,6 +39,8 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
 		return reg;
 
 	switch (reg) {
+	case REG_DP_STATE_CTRL:
+		return is_s1 ? REG_DP_STATE_CTRL : REG_DP_MSTLINK_STATE_CTRL;
 	case REG_DP_CONFIGURATION_CTRL:
 		return is_s1 ? REG_DP1_CONFIGURATION_CTRL : REG_DP_MSTLINK_CONFIGURATION_CTRL;
 	case REG_DP_SOFTWARE_MVID:
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index f2bd96f3bbd0..ade7b362d650 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,9 +42,13 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_DP0_VCPF_SENT		BIT(0)
+#define DP_INTR_DP1_VCPF_SENT		BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
+#define REG_DP_INTR_STATUS5			(0x00000034)
 #define PSR_UPDATE_INT				(0x00000001)
 #define PSR_CAPTURE_INT				(0x00000004)
 #define PSR_EXIT_INT				(0x00000010)
@@ -143,6 +147,8 @@
 #define DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
 #define DP_STATE_CTRL_SEND_VIDEO		(0x00000080)
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
+#define DP_DP0_PUSH_VCPF			BIT(12)
+#define DP_DP1_PUSH_VCPF			BIT(14)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
@@ -368,6 +374,8 @@
 #define REG_DP_DP0_RG				(0x000004F8)
 #define REG_DP_DP1_RG				(0x000004FC)
 
+#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define DP_MSTLINK_PUSH_VCPF			BIT(12)
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
 #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)

-- 
2.43.0


