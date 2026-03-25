Return-Path: <linux-arm-msm+bounces-99877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKdBJg7bw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:54:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE8B32540A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B31430764B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763F13DA7F5;
	Wed, 25 Mar 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGOliJPa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrjhjCA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192573DA7D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441040; cv=none; b=MvkdJTPnMFMNyUgdBx5cXXskahW+1yxx96WGGB7npmdBbXQqhNLhAbz7Zu43mtPz7BmA4oFtXuGjj3k634D+6p7RKkEIFzwQPQ+T5cWtoAJgyVnn8Ey57DePKrYHdC3X08J+Fnk3DYL3O774znD8KNqElcnT6Up1oznLGs3VCi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441040; c=relaxed/simple;
	bh=dV4c9N+VPGpt+iF/Qhlf6YTdOXhS50ODX2RZxCnCTzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VY0fmsCt56MsU/mQ1w7zcfnolF9NZB99oQkjapyK495njU/ltYO+3afjbsuelUbJ9wRldvtE/x0omqfe5Vzv7pSHZHhv/RZYWg20nernEyj7b0Vz/7YFGUtK7x9I30YYBheNeSOAd2IhoewzSXhVJML7r54SWcsvUjrCdFooaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGOliJPa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrjhjCA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG2fR3090924
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=; b=OGOliJPa4YiTJreq
	IF40yIMHdaV674yaQ6/BCUgtkAdMw/AQkSgEoqFZjXwQzyjgZAjOkK4HtOkBTXry
	gCMFMAasvo6nNSSH6nD76mxfB+rBcI+QoRt7nZRJ+9Sn+hfw9FCObzXJoELMasyY
	A+e2Zk/cj0lSCb7e65ev1Mxa0crYT1ieexCE/5nLzEw7GoQcexZk07GyKrVFeiaw
	PF2qCc/8vYo9prQedP4+67mVDEWTJRg1P7Rd7u4HTNUKzDjexqUfdkxoO7Pze3Q8
	Zakah/3TsjzNknJ/s5N4LfD79iwQ6g5fJ3Q1TFSvsmeF1/zFUOHAwnoT/mWhthYV
	B5LLyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmprfkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so443938601cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441037; x=1775045837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=;
        b=WrjhjCA4fKsGdYOOj0nYYAHLPCgw8IOYEoUMiekQ9USA0t0cIH6Jhf6+bxhudFsaCY
         z5LpkkoTjwH4h4+iTdaBhjwmOoNuctu2lzag6UVv5kwOyICOiTl/tERDKJtZx/jzQpC3
         4eGYBa7TlFxUWOkI+zeO7d7R+4ul8L6mD2L6dP3J34sBEo5O/eHb/a9TCUnlK9XP8puO
         8ZGrJFtsInKm08IowUUKPjWR5Aeu6BlkqR2Z1hx0MYEZAF4MBBE9QWl2qnxLNL1w/hY+
         +LzgKx4skoO3Z6SMIPmvaTipUpIgavZz3cEApkbG52mD8x3Be26uY3wqatprlObmlHZJ
         pavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441037; x=1775045837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=;
        b=r3RM58nQZZiHIVpKiXcy18oNfcd9vZdsiS8/fSGK2x7UvF2gmXhOFkv9kEVj7JrCg0
         aBJCTIdiRzYUV8HNpLK78dQk3PEtImeN65WJP7CgnncKBxydXVmU5szfPCSZbjoDRchl
         QXxmzkpw6t3mrhHKlwURPulNNqzED7v/sb2fP2UT6bJ0uovJKfgex5vP3C11AAdESrAu
         3uWUEaFpkdV9nzdgeg2SQ802E9gCiyj9hSRK/N16KRdQxBN5vrPlLeQjSitHEf2bamIW
         Wmleu+Lj0vuAz1FNuBGINyQZxTUNX2MOicW1N0ufv1wXHC+vit2iag0sRf6tERkjS7m+
         4WhA==
X-Gm-Message-State: AOJu0YwISP8CV7yotWWVXqTEFbUIse8sgLN7T73sWoIh3O4dLUDH/QRn
	yRj1YSv0V8D/c0a2uVgCiv4DLouI3t/t11KR0USvZdvQPsDWNWRfVtZuo/CXBwHVHzUqBqBceVr
	Bns/kLQ7ctwwcdfVo+x5apzZbC2iLJWidXlbONUw+RvJP/cCtpJL6N0ecOdghFv0iW6zQ
X-Gm-Gg: ATEYQzz4H4I6dziEOYzsfYGzr6zdOna9sDyFvAN5FFaR98uYXrztruZwgqEeaUcYMM3
	7F11xnyApw4WjgGYG1y7YzEbDnw3WuyPOiOWFEAaVfppmhiAWr83XONFQpvkdQSxDLkn6Q3nYB7
	IvMmuBh/yukp7zG/u5/yCPmqgj6CJtXY7tFSiS+NWDylMN9Sl4GufrXh433vGNVg7xcYvS3czLD
	2yeK83Qw0iWRFmzXKYQEz1vFy6wyoJIQVrpK9YPkaMRWkvGReWMHXsxZB5lys9pR1f38mnd32Sf
	+4vlWUTbkTL+hEc/fSDbBOV8TIGEYdsK3M21LJCjXebY99Vy8y+JOTsRQVLlkDdijRTIAIxs6C9
	btFDbZ9UsOiQibQhMzStzmbXjW/wCgKQoITnTKhCOB+89
X-Received: by 2002:a05:622a:6209:b0:4f1:b742:35c2 with SMTP id d75a77b69052e-50b80d03dc2mr44208371cf.22.1774441037350;
        Wed, 25 Mar 2026 05:17:17 -0700 (PDT)
X-Received: by 2002:a05:622a:6209:b0:4f1:b742:35c2 with SMTP id d75a77b69052e-50b80d03dc2mr44207501cf.22.1774441036612;
        Wed, 25 Mar 2026 05:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:48 +0100
Subject: [PATCH v3 7/8] drm/msm/mdss: Add support for Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-7-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dV4c9N+VPGpt+iF/Qhlf6YTdOXhS50ODX2RZxCnCTzs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9I1HC8/lE2g52henzcDN/LUaKGKZ+lhFYvzu
 G+qPcCKI7iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSNQAKCRDBN2bmhouD
 14wbD/4nCZWhtKQnQsuJTn1BK2Yk1wuOUUIngkXPuaPDaezzzCI44lAJSkODp8V+bxZPpO/MyMK
 6Zhh8xP+mbnlT/xTWgljgDmYWK18MmdXL2LTdslHCF25LyslcyWH4UxvazIXnlKDWY+6DFxnJyD
 3QUyYasFV+46WkRUv2QU7Q3W/mToiL89Gn8pXL3WwR8yyNqEBtBMe4l5UtAEUaYjOdB+qLD3HU9
 Uj+imJdakiBI5RbM/4ssa+JMQ+kY7NMmIHc9/KKq+izO4y/1g4d2+NPI83YdgDjUUhgEboGlmu9
 w9JGBeKpSykz0Not4z7DNpmVg/XuOrw0OY6daehDEswf+BJ5TSi614I0pL3+NNIPSNEW5UoAaAV
 Y4Ar6D0Mb+1kALO/bIpod9ESXqOJzswPuAQj3iUHjRu36J35ykVrhpSca/cxAFC36EEvaFX24x1
 UzM+61H2dLxsbgEFem/NK0aLBX+LSb9c3rKflxK1uPDR0i7R5wyxL3OPrkDtqrpyqxmCyD5GE6M
 otquOOxDqD57AY6IWmGHwUlSZAi80eOUk23gR7+b8eO7G7zU0lJTkMcHNc2S+djKHfhHdcccshf
 vQFnTk2ZZ7SP/5OEtkZK3Le/e+ZbkUt60m7o0fLzOETls9xl+OPgWfL1WsJ25LCwLaV4ch4CSjM
 /Jr3XCq4JA3GUuQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX5S8WlAhNEGhL
 eJVY0XU6Qy0BthuJBCPxQAi7qpJdGZutpvkDwBCx/A5vvVCzR6E26TPn5DxSygPgEbsXlaLx6Wd
 nzUZ7/zSkJifh7gXmNHoQEnwF9YrRt/FSERv3G8PpBwGk9sCkh8+KSSIn1pHYz2GXqFHSxmQC0q
 b5dtYMiTHdFxbpQZVBnxa6n8VlITTcK/zqbD+mc92FMu7IxaLSfr2s2Zq4AduSFTD+ceuzDHzLb
 YvSxB+EUnz2unjOc9C1kcn/LX8Kum/DflmZGRcZByVdDs1ywSa12Vxg7dXptRBi8R/oy57JASU8
 VaF1MOgDPpa+PmHr54D+I5iuXzQPS8yDX8Z4y32g5oemBAoNcyvLPay0YSM4ydlnNB/I9g1IEXI
 0drn8cnl2ugZW4eJCOw1r57JxIOzNA87PF2FEIAPMxs+QahV4/yNx4a2IsGN8z7GlsHfrCGoJnk
 LQb3KNLgCf7cjGHqDQQ==
X-Proofpoint-GUID: UNw6FVW_7HZXWsWJY92jXy9eGUu4h4rK
X-Proofpoint-ORIG-GUID: UNw6FVW_7HZXWsWJY92jXy9eGUu4h4rK
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3d24e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KosifQuNy-GW_fqSRSEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99877-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FE8B32540A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Qualcomm Eliza SoC platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..a86776425f26 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -560,6 +560,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },

-- 
2.51.0


