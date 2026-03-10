Return-Path: <linux-arm-msm+bounces-96608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LulHsIAsGm0eQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:30:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF624AD6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72E9330152E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC08138A704;
	Tue, 10 Mar 2026 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku1uPC/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG59ZxKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B33389477
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141773; cv=none; b=NMi6vuy6FgRLtuYnmytF2hzQ8mkWljSWuScZoGjG5OQLucWaQYtcYAd4k5HB0k5m4erRm8pu9qp/7QzNeaOpvx00vpXkvgY0aACVPYAGlz2V7ReG/zqzs/CZcd6mrv/LShl9IMxUQa6RIAYWM+Hr9kOm0isYoaYWDNJqSh9F2b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141773; c=relaxed/simple;
	bh=MhZZXUyWfb59oILbyPbh6LcS50AAaVQ8Jux1XwFcQ8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fX24vVh06yOjbv23HDQ5uGcm+7aj6gZyNnSLpiGEvQ8C3u3auNjTBN/Un+qiR4RWZSSlkizt49wN40DZNwsOd9jwoVaXDTxrB0hhDuaeS0QIBL5hnlBNcEw3yBAcR/zBSBRUVk/DXF2xp8gRlfy0MBhByehq0X8lPlc6mPG+v7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku1uPC/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG59ZxKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h7pX2754160
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=; b=Ku1uPC/IZy5e02N6
	j0heH1khlSjCw6iao/7RiS/0xxvM0oA7s9rjq+PgLKv+MtnS0j8T68outou4DNJH
	kuVceTvx+0FXeHgCwD204top+wTclk0G7mp7/zKtEF5W140RvXkHmJQsgtwsOlAu
	wW+beES46aAYKxQFudoiZEPcbn4UTYE7VYMRfpB9DWnJ+1Y1p1q7LWY3IfnxwBy4
	5igK1pRpKs0DJluSIriODadG2wqCk4QObhwheFLzsL4l9wlYNyjjs8qg+x1cQnwJ
	HVz0NDJWs+3V8tLLdp3cCOgRvlD/izSRTwfvP6jIvVAAGfRvLrziIEY/Mla7sSQN
	VsgdMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrmet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso10191182685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141770; x=1773746570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=;
        b=NG59ZxKFdNxco5+Y/u4on/4Hxu4Q7Zj+Z79FzJrBEJeGewdG3PIbePf6JOKv8vPp29
         jGcpMsAo6HDu5ALzZR1K37CWca87kHljOqKP3+8ZREWgJJwmayBSWpoTkeQUW9fZ2rrd
         8jdjn9vgXt60/294+pzZfIBlwbGt9R/bKzE+zXxcJ17VwXbILvshxaR/ywDlsaynBhSA
         rHImPmVPG8iExStMYBs91DIC2+IQH5Z5YpuX6d9QPunMV+pRlArDdY1mHtcolc30sLmV
         gsBdlrKgR/oZfEPR9grkw3UTZrivauAFB6B+n4z70KUn61C/qfTQ1ilg8S0g6EpPw1lN
         VggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141770; x=1773746570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=;
        b=AxNgv899kGZ/T6alDlBzrpGCwb6D66wI1BJNtDNaNFtYUHRACtaLkqOFXL6I2y3g5H
         9X847otf/daGvi3dD6KVBtxvCF3Cut4t2hmS7qklOUSvptMBrQPO0wiWn5skYUb6AM0W
         cdt5+EParxSipZeiWjmFf861TPuCc27E0cvbbWyX4p8wa4Zvvkv1sUxDRiFUG6MqU92t
         MqrVuE8XfToS6xD8e1aN1eGpkB5TwGDnnyCKuuWGD5o32lud49YFz1YxxWzTHiwIBeiX
         W6+QbYjs7/OeQoMvMVdxzBRKYvYqLWq0hLSCvzpbQhnumlqLgqapiBU4wWs4ivWoquFY
         6eKg==
X-Forwarded-Encrypted: i=1; AJvYcCVx2brboV9RQhqpNAMf2L/HeCgq/6QQgA1YnZD9noca/bVUmIukLKqQV9/C40latFuLv6YeQUWGTGMKlW3t@vger.kernel.org
X-Gm-Message-State: AOJu0YzEIUGdlDXyMZsUOP4PxYUC/MukpKide101mS6Ax1bhtFkOo1DA
	zjTQeuF3Nc5ezYlb2hXdbJoijg2/xroYdruG1BmRCxG/yky3tyIXRYo+m6MCqEA1oBz0XIt5t3T
	D6er2hVRlGKY5AN6Tl89LkBhPtD7Ar4G4KZODAD/L+9sHYpEPIegOeoETV/RT4V/Ko037
X-Gm-Gg: ATEYQzzi37YZczNo9rmRp1FMvn/MC9jRy63CnziFSSR6zlCSnqJXmFWN/fe2WjNJyB6
	IigXqeduTzlrL7mA4uCffFmZPtnqV8vBrKIl8+03x00KUZQAKWeKKKk1gN/veon/hC5Lv9oy4yF
	tAkBnv/4Aj/fQ/hucjKTSsh0S/Ni6dP3oR6jBWZLaLvcULbDbdDl9alvFgNFdt5or8/nYDQxdHm
	q5NVWH67tx/x7XfKxDXx4A1yUw7Q6gST88Pxaqcx1P1fC6sr7FXNuQIN4N3sevR3bqCSmfG3YYn
	AekZFDeopT5W70F5TUFqFmS+YGGQ9ZENTwk8VjEhrFA/ptwIXFy2dSefrccpS9/+bJL31soVz9h
	uAFHBEvCem/2LTsnxsNn3MWefvdIQ/c5zZop+MHtFPoFj
X-Received: by 2002:a05:620a:318d:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cd6d3eaf48mr1956315185a.6.1773141770389;
        Tue, 10 Mar 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cd6d3eaf48mr1956311185a.6.1773141769971;
        Tue, 10 Mar 2026 04:22:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:36 +0100
Subject: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MhZZXUyWfb59oILbyPbh6LcS50AAaVQ8Jux1XwFcQ8g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7/GykfeN06ugvQtQkoDM6PNcDwvBeH+8Dt3
 FPaTV7303CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/wAKCRDBN2bmhouD
 1+InD/9J+1xEG6CF2PZMGQySQThP0VZ7hQUI/UT72YfGzryRehuNMY/eZ31woOO2Vu0a0gVzdkV
 efLQ5HCw042qUk5q9JJSAGuRt0G6tBH4bZzi5ZoyTgythpFc/MdY2HF/A/CwoHyYzqBafD+TYRl
 K6F9tzJ3lvA45lkSkeDNKkBgXmR5ZS2Car2ShwTUaoflGU7Neyz8c0bd2sD5u0uQwZwxDgsGOzf
 2uM3gRe8DRSav8N/zQQjnMbr8ous8IxoN5D1QFHpzrWCuFlI/J3Ce52B+rkkXREtuDBq2iN8RHA
 n/LsgVhHbe4oP0X8J8cXyBPaYTUQKcx3Fbq9bemyxVaFEa5ZXEih5L8HMAhb6V35QwAHsAkZ6x4
 HbcS3uUX8az6sMR16tNZ9oHOc3fVHGlcAtub0mGwbi4l6Po69aRWa7nu8MDYjpkyPZzaeBL4W/H
 +40L3j0GFuqbARddLEwBoSs3i5VOHmEm8o4UfLWsmd1lr6dP1hOQVAzo/8tJXiKglh//taqgDRH
 EdigPxJ9TOu/Ey3ozVyP1agqBCvyFJUcDys3Q13/ESZezgipDuHYeSRKv/ahAI5h2pm3NKEJ2Vb
 sM3s8JvQ6bM6k04yN0bb2tR+bej1HZfVaiZCBcRsSYyyKRlW0Q/VXtYMIE+eGInWKVMZOj+DPMW
 xxExYfX+Hg9hlGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afff0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: O7hBwEm15yDIr1LCzordTcstJFA60Il_
X-Proofpoint-GUID: O7hBwEm15yDIr1LCzordTcstJFA60Il_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX2/dQd5FirZDq
 ndnh4Www6T6H6HUWdpRi0HVSTBP6zokqL3QESXXccZjnyMuupztqEz8r4fi3RscRpcEj1eJixCP
 lX2Ka4xcb/YhC/bYbZl+MbYswfIt4fxrdu/13aOU4Y3h7K5Fu0Jj4WCyWOWBLJwjztq59OErJRZ
 Y7lIrrIgIM7jqPOYY/qifR83BmqYD/ulmh/jZGswIxHg3RU74rwvJpfIalQiSINlZhlC+BJs/rP
 lxSaPhpfVGy+6xFbWpJqwoItEq45SpN6PIJep7cnynM+tv6bmRTuYhNRU3muG/tIjnS2sBFtDVu
 z/ndJkQ4ynlCzFrcTkPILRJCp0rVwM2XnIn4TtIepPyF81loQHzEiISj+bNqgGf9yZhS5OTsu/B
 LC0fo18xIcOZ90FHWYuqe/egkpgkkY47oCBvFYw1pLkxAwvhUhAqqd2vLdVvQm/MWYK7AzipkUU
 Q+tApNfepBzB3ItJ0XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100098
X-Rspamd-Queue-Id: 7DAF624AD6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96608-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bb6f6a16d895..85a74c9ec521 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1078,7 +1078,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.51.0


