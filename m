Return-Path: <linux-arm-msm+bounces-106587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGdPDzSP/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:22:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 965114F2F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F49303B4F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A12C37F727;
	Fri,  8 May 2026 07:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBPAc+7h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWfc5nUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2F3537C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224847; cv=none; b=VkLLiaTt9pwgLgSHv+O1d3rsuHWgNUgLDckKXgwtZbgXv230rHBv54QO/dSp0gdg9vpX8zE2W4XQ0oDejFcRe+xqKWNIyOz6V7IoQZAoJTQw2AK2uLHDSz0Pyw+UiuhOdcDD07KsFGYTDXRiRlNQPM7NCDP1uLgHK33eH2N0z0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224847; c=relaxed/simple;
	bh=u9UYAcBfPm+Cjij/4yHsiT59K7r+ruo3k0BHpFBTT3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7SmV5Fq51IDW7J6+wJzUrUurWBwUzJXtcTDabT1h1JGba+P2YFww2kwmddpBrT01WD4ycMgMqmd9mPsuHBqMZJddFOIA7GD5ct93DRLKaWoVxz3S9JRv5/MpUqda8CgZCpLH4Z+Sz9o7zmYHtCktaEJ+Z9kHWl36L04gocY3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBPAc+7h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWfc5nUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGhM257892
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 07:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=; b=VBPAc+7h/Sx2KpVC
	c1AOX2zwrX+UavVJb/7CiJoyy36KcMqyViGhYdHGLOy/Xfx/SK+IiJHyUFU3D4xA
	uVYmV617SNPSF1N1f8NoKfJ7Taq7q9NSRzBtbAfcEizipnCKKxmBZ+ObXaXMFw5+
	NUqwweKNgjDGxxhQ2BcYoNmYhtTfF2MFbS0tH//4JE8axmI56ZUuKAFfOVdt4wDl
	UpKhu2tdAyDkOIcmtlEAbHTqGHa9dWKaOxAjt2YH4s5HePnRm95KmOL9WVsVgFEg
	muS4JnuulMwY8hLdfAc4GTM/rg/TiZ3qqJR3lpld9PXX1zgAdedyvmGDEnonwzt2
	FRMl7g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueg468-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:20:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so1880297a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224841; x=1778829641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=CWfc5nUCyC8RaOXwteEEWSeDU2sw6nqjTYaquUMDp9mhzyDR8oMgeswx9Stm8zYyhr
         apgzTMAIkUr0CswWSEq3wCfETHJZbQdRrsnuCERKctc9LXtRAXejgA6ciAA+szm50koi
         B6SLSzNpiJsMJdXHa1hL1dQ0z6hakyK3nMF16gCKYF1olK50VNGo0C7gAmKxwAFzS4qO
         KHSvRXTW4UNO/qeWRkOR0dZazRHG7KFHtZiWg7fEaCIg8Zna6yAaA1pJIrKVbnRxB9y4
         v2q3YBklGM8mX6SLY/eEci2Md87mdaQpJl0jziR+5Owb+C72MNf3t2u3kMrmMLsRVCH7
         LBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224841; x=1778829641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=I5jU+jFsiJ7VuyF1JhDTPE9fn8zFjCaZA+0tDRufhYZoHqL3HYM+24XdP0sMsKlOmo
         F8xtRjCiMhqqy7+nEa6bD2vgY/YvLT901tSvs8/wbZdS7Jaep6DPrJbooSuz7B0BavHZ
         FVWmAPkCY9UI6axk1USPZ/AMVL0+hKLKn9MP3VOOMKyMyThsBxrJtB93AxLroPpm2QMI
         qoNsQ5UbZnKUo3vMLOx+C0ULEdbtVVy0yVxNlMJR0hYMureOV5KxGvNe/T710/ktyAsa
         2czR3KtiyEIs4eJ7nLo56So8UgeQkjE9mhnCYU4uvzbkAKi+iowRhb9HlnQgjX/WPE5s
         cJGg==
X-Gm-Message-State: AOJu0Yyy7yF3T4nusI/D/nsQVZBUuhkqDCCin8qnF74dQpNbPxay6K3T
	U5kZEKmJxElzJxv8KYrDxhCGTusuCquJwtUrDuQbteIOGJetChHIkxyf7QC7ociPa7SdZQ6Lsyj
	c7tHL1Oiv0wHWuwkFGYkGW0u1P3VEw1dpPZIu2YOhOkb+3H2Jr41CGaZw5WlZUbs+jd5y
X-Gm-Gg: AeBDietmRONfHyPMEhXDceohFw2xKrYKikIjP0VeeBRpO1hRieTCT7eEj5MToKsRLt9
	LbfCkn1cynwFA+Uf56VbhsN2O7t9G+WOJPWON5jIGR6g/6I75l3NeYb6lQdZQiTxzluWSNLMTX0
	KCiSiSeTTSAnxhGZTFYrERn0C1JsEXFaH3NCWf5YAAJT+cRCqEOfJMz6NtruvyLEVV7A7Uc8VLz
	KZBYNTNp8xOFQ85tqB/3nkVWHKAx0LFoRHp/j38DFrcTCIYleRTa4y9lNsBoyXexpaLCKXmExAx
	auw1d/ovvsAzUqY0vI2QBipM1yJRv752emPF0RXmNXxdJWTlt65nb8yzd63XwvJJGTrVQozoXM5
	4P2NniaornYiYFzF0ZkOY7mekPY6eytqfvDEPhuoGRaOE4PpVdaE=
X-Received: by 2002:a05:6a00:1ace:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83a5d873226mr10911685b3a.30.1778224840152;
        Fri, 08 May 2026 00:20:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ace:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83a5d873226mr10911652b3a.30.1778224839633;
        Fri, 08 May 2026 00:20:39 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:50 +0530
Subject: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1107;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QPOvZ4FdMA2wnx84lf4VqyIVMhJ9E7QIKahaQXRd0/E=;
 b=82mwbwOr0ZKBOub5kRgRJXn9IsEfwKmYiz5+sD7tYbxZTcQyYwvEdscH+tBgld5nw6LmwxhW1
 FDTx/jmeahiCMiCrcsedzSemJKuw79zp0z59UNIybMKRkrrIgF2nNyR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX1jnJljLPfgus
 Mes/zo8c3I9vCDKgdYUmoV81J4he1+qn01l7hyN3rciuqR1Bi0LWALMxt3Kv4qZzy6nrVUzBeAR
 a8Q7TyReUetZPmucg+kZiY1hx+8xUHYqH8aKSaobNcrKV//zg//Pi8TbtetZXz20MahrTFDkq1k
 9QBrOnnPSDml3x5V4llU1q8ADOfaZhuUwYUl6uPdThoOb3qAsdgtRYe3OSgjka+9QRyeImqU4+g
 3tpOAdztOpe5zJIldy05OWnpujcCYXumNbb2CW9sIWvuEibKDgjUiS0sQaqYjHthO/3DLu7uLnD
 1pQpciOirtQN1DBx8ywGuUfQiNO9MOHVfmLd8eeBO42qEE0TBTP6gySyR6hKzs7Vs2ShpD+Oiaz
 /sKjxULfqD5pkvybxKyToTAa72r7zI124wNKX0wfguqX4gN4dcen85xmcAn1l/dyW/HMCOBxPgI
 Gdq9QytAUtNQlMe2Zqw==
X-Proofpoint-GUID: ZrcSqGibtMZKVpR3OyGdCV3uJrv3E6Si
X-Proofpoint-ORIG-GUID: ZrcSqGibtMZKVpR3OyGdCV3uJrv3E6Si
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fd8ec9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3n6LiYR9N_aqWDaFmTgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080072
X-Rspamd-Queue-Id: 965114F2F2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106587-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Enable Shikra APCS IPC support by adding the compatible.
It reuses apps_shared_apcs_data.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };

-- 
2.34.1


