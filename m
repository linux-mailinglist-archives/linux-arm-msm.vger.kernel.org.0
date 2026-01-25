Return-Path: <linux-arm-msm+bounces-90439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P4hBTYAdmm3KQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:36:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E28055C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C62863071803
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C328B31A542;
	Sun, 25 Jan 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPRczrnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUoAZrzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA9131A551
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340643; cv=none; b=GVxeTXi08IfQttE7pn7EvQNwhAHJTRi9bSpPsmjuuHsaRdR9AjtUHEb4qbYWlO5Ip8UftKviCx/KYWwNLBbEm6OuaoirY2la/6lQZ9j7nO98i9wXtKK0qPGt/VS54gQ4BoXHaEUSvMq8rH87ko8ByHEtzIM5t4SG1Fch+KQYbJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340643; c=relaxed/simple;
	bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoEu9VKatllNjXMpfyIGsas8ks+5dyE+o2jT07z98k8uwiSjZ52dNZTMJVBKgR71qle5GlZZhlh22Qjr/BcJbX/x2fsU03em6KJfSA1RDs6+hVTujLLpOa4z6u9ZibO0qTgRPCTvxJuTNEnD7ZR4DKviG2nm/fg0Hr/aMyJqlNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPRczrnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUoAZrzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P9qtR23387389
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=; b=KPRczrnV+oICXGre
	/DrF3ndbq2RfM8w/pZWsupYBj1IAQ6rZZ68kBQkydinT2AsyEjv13VIoGDYjXUyy
	iNR3bxCca6vFcWdtHPcbmXn3K+ybDDrff401OYE0b9udkR+CwH0JZfM/LKHbeKRb
	8B5NHgbv7ivylRMRgYZKFV+u3Fm/m5E6zJD8LcvcE9moTFbHJTlKdHBrYkA2UkNA
	l1vKqioshrSWQwBiDVWRRwyPaEmG2jMzfAo1Mt7ChJuKkHdUygwSlX+ot7ugP2B4
	66mosvVlv1uv1jHSZ0TbSw8sry0WezppTdXkSZGxsZlJ0Ny6naahKaoGonz/+xQ9
	BCRxhA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9ft1ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so41541786d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340635; x=1769945435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
        b=WUoAZrzYiWAUcDAZ44yqvBRpUXXEBXS+LC2prQSicpajj3AlVf2Vz+vJSMaBTFxtcN
         QcGL3B8LVIHcRwsSIdecrcoay9vwp7/JuhntuJ4IRoVLQzUZG3U0R+cIuo/UQGsBQQoY
         xA4MpMYb+13iJh72Qn2ZBwy6aP04bByzlkmCZwk8yNUTtDsfT83yVMQZKiBrHhnBqoqu
         nSt74lLDcEOd/5EkzgXCO6cbV1mXM30PGysw/7mGzpTVExPezlQHwkkVdTiqTIzL0V1R
         zjbgWS9iT1abdiwn9ZEwUhqQTKZU5RGPmYrnKzwpu0TNcZRhlMIQ9YXXS/YCWrThWbGE
         CYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340635; x=1769945435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
        b=JqsP0NEXhQ8xvnA820Dky9YZ+9H2XdfPLyGh7b8ZrbpjvTLiyebKB+qZTLpPzSUXWv
         vFFB+TB201B5Kqluj2lhOkyiHsfXGovxm4quFCI7H0lRvxr6yjbjFJAbLY77Sf8oaULt
         hd8bbV54n5r+c2Gf4NeHHrsc7f0i7qGTvXs1UPV0ekHX0DsNhSgyOxE7VIb5u+Zw3/Ez
         IkB7BB2JHKvH7NvFi1ncovKCHrYvLgEvEruJZFBt31ns6CQUj/szfTg9NjXLfZQDNXS3
         LE1t6bHxgH3kXiqNwfQqBD+8Yn+3ZY4CCcKv7OPJU9162rX15wVGawdZUiTUPHDLnLNK
         uepQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH9DSXxavgl+BjTj2h0+TDo/Ip5kXo3HQdy2pdUtNdwYNE+y0OtVytJvzXDk33Jxq4oNxS7MfcO0tKHlWv@vger.kernel.org
X-Gm-Message-State: AOJu0YxjK0gHeyN5OptgvghzP6JjM6GfuvYw9yygrw7ao4YY8A4qPTLK
	XdvuMaSSvWH/QyXC5xxDlj3RRTEk9jmPTUlMDPYyr5pBTGJWaXvzTn0MyLskQTZS/TV5QM1PLev
	+OqWYk15b35Eii/+T8uVIPIKgQre9jwic/EhI7LIPm/TGkIz68Q1a4NGCTVUbvdpFthzQ
X-Gm-Gg: AZuq6aLgK6zxuQ9it+sHeqB2ZjPFLtG1Lxw2Qauucb5DPcu44qQofLzBNxPjf6kKwMc
	ELyFMP0m2nDA4ffPxiYz1UPVjglL8uuoB4tuhzRcWzjTBkidjGCve4qBY1VgaxYPe9hr4mll7WR
	Lq39NwmMiYJBco3jXVcVu+1aiCxXaBLZIiFG7VxUt1GF8db75NM4/isDQWC2JHdMhPh+84aJPeU
	ziE612Sn+rI0Lus+tOOjScsW7+2isa637jm3YLhu0SGtd69iGR6tGMg02KC0xHscwzPyk2NTkL6
	/lU2ad/1HvZDQm+/oQjTyhgKt0Sy0aG2cf5xoJIWa8J/fD+YQ3jnjsBd2jziBtp6Z3vKSx5Ca/C
	gFC8glnKbapVZQs3I7fHYOZONtQkDO9wn8g5zo9H4AyWNDo93XhljrRKrz7IM+WTw/61gUSHF0P
	Ir+Uk+MbIQGj4gUY9rqxCJjCA=
X-Received: by 2002:a05:6214:e45:b0:888:8174:5bbc with SMTP id 6a1803df08f44-894b05dbf24mr12272666d6.0.1769340635403;
        Sun, 25 Jan 2026 03:30:35 -0800 (PST)
X-Received: by 2002:a05:6214:e45:b0:888:8174:5bbc with SMTP id 6a1803df08f44-894b05dbf24mr12272316d6.0.1769340634877;
        Sun, 25 Jan 2026 03:30:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:11 +0200
Subject: [PATCH v4 9/9] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-9-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/ashi/qdiuGeLL32ceRnKUHTnGuZo99BO2
 zghxKQW6t6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1RgMCACc7Qbkgnck/W7AQhj2sxH0m2vrJSNQyiJHi78KV7E/DEvYsUYPBgWy0jiBSqrhoOkZqSk
 +GRgr2r/sP7cG121FwQO2Aj/I9S2f+fg2jbWUlNQbZnf6O4QJmspgQPThVMFyLcfHbU8UR+j9b9
 mN9vUTqsopuG7bpx6S5kTEZaxYsfwN3M2UOK+j93CkicgrgWPBzT/SQUB/hDtedPVDLW/NExzc3
 XtykJv2g2P+h/y9M6s5WP1YN87vaO1WC3UiMwvEDoxnPGBBiGvPUB0Gi4Z5h0Nptqig4bLDTpWI
 pXTUbz5Ij56XkPvTKfdwa8YGzM/npwN8k/KQYoJaJ3hrCYff
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1TCRY4g-sW4CH4ljtC8VGnPTvzVEABGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXxwUnpv0pKBWO
 7Zx8+V1yEzkUr/fc9AspztG5bP0cZZDUy8zuXpUt8WUEyZePQXnTszrq+6XFwH1v2BMSwPXpfVL
 IrtE6z+HRjp2KLt2HQbtf1kkh0BkhtcofEMIgU1Z0+qfIwYq5S63YgZ1R6R6w/wPjgxHMepXTYl
 +L/3SQ6ZhVU3cSh+O15TKWCXa2a2BZkPe4UmrEbdN0r5qo0zUx+VLA7xKUFZ4kpjvYjlakoBE4d
 cI3tddMBnc9Q3WNA4H7MZRMBjN6Ig8aKJquUNYcF31AWhWQw5HXqy/qlGKmuhMSE4G6cMai9fam
 qNxhXI3yjSI9BEyhnMh0y6RMyVo1Ny6H0i6QpUB0QSp96bBFm/S5r7Zf2rw1W3390aVmF6vWDiS
 AKj8lLqOVvhVkMdXEja3Ld/heSEkEFKJorwWQgNJifvRcTqjfmfbqjCr4SaCKyUl/SRbpOZNRkN
 +tJ9ZdotG5M71EwojkQ==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=6975fedc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=0TfDEXg-tPZCovj8PBUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1TCRY4g-sW4CH4ljtC8VGnPTvzVEABGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90439-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 606E28055C
X-Rspamd-Action: no action

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e8b5446dce76..f42e1798747c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -75,9 +75,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -241,7 +238,6 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 05b1dd11abce..a526b50a1cd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -790,9 +790,6 @@ static const char * const sm8550_opp_clk_table[] = {
 	NULL,
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	{
 		.cp_start = 0,
@@ -949,7 +946,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1054,7 +1050,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1150,7 +1145,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1250,7 +1244,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3


