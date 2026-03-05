Return-Path: <linux-arm-msm+bounces-95652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MERqCJOXqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F99213CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E52E318E5D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0B93A1A59;
	Thu,  5 Mar 2026 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLaQz/PP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOkG3YFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F0E3A7831
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721058; cv=none; b=qrUkpB8OR/Kq/kGQ+BSD6U2Dm8MFD47MDadtUSbUYlCNKQVa2KEQwm0IwGsEKEyKbgAUk1erbRiGCw1Xf9wGMxAmpu+WsaK0V0YpFs+dHHA4oIsaeb6jtFSlxBj7h7P4WP+6q1DQf0jIMdsQYGJvjLhA0UiyrmKMs6xtepsBIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721058; c=relaxed/simple;
	bh=hvUV50vOotIGhGSbBe1rDn0cVLNRTXQOwNKUgE/1HFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsvgBQJzm2VfkBYXBT2HYaCyekkGSFIpTuzQ9IRscnXj+CMwuNxrx7iGuVt5HSq5IoLhjMxNiFhNN0Lu5RIV8s+mQIRr4AaI7mDe3tmbPDvORLv4hw/KC1wLXiBhaImDKZ8phDg5CQYyjo7+f667YXChXPcK8o3Ay0y+4asm+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLaQz/PP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOkG3YFe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AUO47169388
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=; b=bLaQz/PPVqFIARsa
	0url4Jp5GX9nt9kBhR0P/RciYQ6b6kUHzbtgwMu2eGWlsIELFK44yzwJxvSjkGQV
	6DqRiaAgL8Nkuch2yDlUDdV0KVvw399gSFJVKAYvLrFNuzU7jhMfmMw/xUwrXfGk
	MB1TR/X1RDZSPUuWrhiHj4lVqrarskuqoqGEj/s01iqAk5qLi6zlJAGPgjoMPIy0
	pCj0DNiMhAVzvbkwmBpp5mMUIIknaJKrrwJO/T5R7GXqQa8KVPRjET0cZ1IjyQt9
	K4XBj23REGbt2NZrVlKckxmZO8VMd/pkw4orBG/1NJPSCTJgaJiMOF3sBZ82V0EV
	c8y3Uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84w8p64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:30:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1471615685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721055; x=1773325855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
        b=dOkG3YFe4BELj+qPIm0GSzwq5lbvrKapAXoB5CvSz1aXP9G/a2lejXpCkyltVH05Qk
         cJ0vQuwdlkoxUFVneSevhN78yx3Jx8KZNYFnAGaIauXu/zVwhj3bTC0BGiXSEbyGNEyX
         ewH8/1UtG2j5P9S+vsb7UERd+2L6cRUlqYN1i+Jqh828MNptuLWRkAKmD4JxiMLs0+pJ
         dq6G/zUWxnABRSbYZM5wycS1VoyF03kIigv2MeiQqYjeLaDmW1CVTaL5KU+mToFgc+DP
         e+8DfCI8YMwFTTAStkP2stbx+6Gbsqmj3eSeFsHHNPPwIVOOzM3Z+20PWM3BV4+QqVW2
         wnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721055; x=1773325855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
        b=DEjK9Mx/2blg+Ql8gdZB7jX+txq7r1K1z3yp2FqKJ9f8+Ck78gB7QN8jLJgZ0+J1lJ
         Vi4ghjdo5zwDnoiQ74Q6jgtIEM1jZ1UKaTR13aJ1x9dSFlhIsRhNIkYurh/xikRqfc8R
         Zr7WhIq4YTxT9Ahseo+sz28s3m/rSs49xvnV5Ku3q8lwZ05d5SdEj26BDhJigRpmKrec
         nPD4hg/lTuH6jkFvnoVAKlmAgqZaaSymw0CMvHkiYlB5qL8l8jT/awkL15kzTKiN/235
         eUWh5REpC/xItJCLJABdN/h6P85OiotXcmYShfujSmgE7GklxWDrlbqTLPw44/QaxaXn
         bFZQ==
X-Gm-Message-State: AOJu0Yx+1PU1XCBzckPugOJMZZYfyYUXMy96LyGvzYVR96tvW+G0x626
	nH+a3TILbrfk7bjHGIll0Aeljfc5o32CII8C6hpEbZrTNdT9Lde5qqqtZnXxwehaUDhLfJrqg7R
	IbBE0qXhGlpMOXNJO3fm1g+zk8UsqRAtuDwsWcncZRSe4jlu3fR85uPMsQtsfUF1wAh5p
X-Gm-Gg: ATEYQzxpjrxfrrCr2rZgEPBy7MRDoHAgZEr766AvxzEgKeph2fcDfXGkv3ha+sxbnZq
	YEpNi9JRU/sRvD/wEkWY8fteBWFVyhXp0L6jqe8pF+CLhVxZr1ffMCeLFEgve1/MKU1vWOeDonF
	whalZNDZyxopJAvy32YZPb4aOqgAtnzGg07A506wCI7sY799HCuaThYYr3NhlXKh+F7gkB52n9D
	Y3s8kiZ/3PezxBSV5CNHCGDMiQjfGoUZSoq3bquztChvBNMSFOJXQZt1xAnBwlYQORA4YnOS8Km
	+FyCSJlNH+QKomoCu8/JC+wlC3fapRCBzjaYSAjDTJUHCcJSnPKGvEx1kyIAYytpiVepkIZOCq7
	H8u/ufBE99V2HRVjLXxuqtRUaEC1GN9tTOu/UqzWd1bcDtR6tAtTqqFqVBcl2hVKqPKvHp8BocK
	QK011jVJYC/Cb76QwKddE9U3Ck2/uMrxkKOr8=
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr800440585a.38.1772721054677;
        Thu, 05 Mar 2026 06:30:54 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr800431485a.38.1772721054108;
        Thu, 05 Mar 2026 06:30:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:30:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:44 +0200
Subject: [PATCH v4 2/9] drm/msm/dp: Fix the ISR_* enum values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ww/3qknDh3ls3uKJd9KJ6MipP3FzUf7GXLi0EYvbbNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYBQIJFSnt3j4DfPHw9uvVAqVMJ1BsFnH65
 hO5T1YmymiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1aUzCACzIsi/nyt1jXaDzIfkKPhx3fbpgBMO2xIw7lATpx06VVEB75xlWiF+gGci7qd8bd6ZGS2
 j8JcZeH5FdkojA9eGj2unttjK+G9HVm98Sa5hjA6NEWNPBunexiSEDi5QzY4ovQX57OXSmpFBwH
 Q976srXY4pi3iGqHLg7JQG228y+Jv9YIkxaAScuQQQvoMEzNFgr5062LUzzYYuLbcQO7kyCd3i6
 AWHujAHI+F7p4CHdzlpOqdibjjwRimGYxGtpjpkjcToujA72cP0Im28hAu11A2vP449q6GkdOhk
 H16UKqbwzRHap5jVwOKRHCs7GI5cBAs4COxU+06K9/G4KErx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IbbnCytWfwtnufrd-h72H0h5Ev5TdkGy
X-Proofpoint-GUID: IbbnCytWfwtnufrd-h72H0h5Ev5TdkGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfXxm+wka4T9X50
 rsAlpRwDp/WKb0KYMqtr+yYPgXbUCuJLn5olxFu+HZiOtDZ7tNgVHk3qyMTg0KVSdG046DgvLz6
 ll56f9tkSCCu9XsZNU6JY5QfD6MLVZTvrK10NRL4+4q81VSwuxIb3Qb0S7spZ8jua+18yNgoTu3
 32D8JbDhFDH0YOLxP8lw4zsTiJaQMLhmeTMIIjsis2bdBKdDav9tvCEZfrCIZQJtYqrQTxTROft
 U0hTaiW+QV7y/2AzMmJQzCuP6ZIen6CrwXCAwGUyTXbRdomvHsotAn9zOpSjG3QVVgSItX3ghNb
 raGeZ6hl7Q70yhubT3PXPAktDtjtsjlJpHhyDb8Rug/ihbziLj8EG2JS9GQ4hCb/+U4fa24Rg6N
 xmjZ789ayKcTqs3ZFay+Vhw+tdKVNxyUbBfTnvmn0RM6MWG4e82KX8j3ohFxuhSlXjpItSAgf5Z
 Lrp7Dc3GCSVMDBNsKgw==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a9939f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aneus3DpQx8xEqIVSrsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: B1F99213CD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95652-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The ISR_HPD_* enum should represent values that can be read from the
REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
ISR_HPD_REPLUG_COUNT to map them correctly to register values.

While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..5997cd28ba11 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.47.3


