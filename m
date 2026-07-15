Return-Path: <linux-arm-msm+bounces-119184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TFHQKhZFV2qQIQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:30:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918C75BE3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:30:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V7DfUdVw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U2ADEX1Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 371D7301453A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381233CDBD6;
	Wed, 15 Jul 2026 08:30:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8F3CDBAA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104198; cv=none; b=iRylo2Pbt1XdRhIFHGjnKxZbNgxVqknD7kJrNz9YSi97QCeK+eqXhpKNLSAMFsc98iWbT8IWDMEdKLc3Cmq5eEAiOLcTI+FgJAEer6ZxYVX/h9DdStXNLqJD4kvNIu4ZawxMHndwDmCPP/waxDWQR5GY+iWtfh2Gaa92aEOQwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104198; c=relaxed/simple;
	bh=TXKndoG9/ZhPXg6naPWiyrq5aSp08ozw/Uehu2DgDWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlytqBC04hjYFbSWaLou5vJ+uY102Sqp2i3zTYE1yd5knQd3yRQPFnudV1WY7AKMDHYb4LGPB9EBjXwsXd/xuiLH4IbEIyo75xZS3Yzdum8kQ0daIMeIOivy7jIjr+eQkzzdkyeoM690s2d7HReEzNAZR2v27HoIK9xkSYv/cM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7DfUdVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2ADEX1Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7mkdh3143272
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQlEDvb65Bh/rY60bU1eTX6ID0Mrq0HBhxgNwXz2HaA=; b=V7DfUdVw3S4PKgIP
	S0NHF9DgEj/TzOzrll25oLFLA0W7XsGgAq+iTwKRYUmQ8ou04+1Msm4SHaH+ZZxF
	py4e0l9O3VeuX6YOpY2HR5DmVtCRGRI7mx7ot5OfoFCGIn4w/W7bhGzBol5jvzTb
	Q1u8p6c5fFlQuET+1/tsfd98AEMCcalYDC9CBym+6hBV7Z5VFDtqWNyTgV08sMLc
	tJN7ip6qdIk6Dgu7ZwXZAxFEV3xr70kreHbojCpw89poY/5rejp8Y/Xo9qNX3dGb
	24ExKjyYXq/EJHWR+VCg2kIm+HTQK8ps8F5VA/UyMytD9i7/jDyMGy9YVTmroVWk
	Kr4nfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe65284w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce406883eso16826925ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784104183; x=1784708983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQlEDvb65Bh/rY60bU1eTX6ID0Mrq0HBhxgNwXz2HaA=;
        b=U2ADEX1QviOFgWZ8Uxwlzs+LIlNhPdY/g9jP03R5ECJZ1dahAsQpZIOgsjT5kKCh0w
         SCG6uNDS4mkGYXi4CRwEnVBPl8VB5lViR6vUVIjopZmjpXqUBx0xhHa7Mkp6G6eh3Iia
         mBz8yJ/v84tiAzzzQ3wbp+jz4jjvLXgFw67xvzErNdzODA3Xt4ljR/rcQfppW7hbh4gK
         r4nLv8gGFE1gw4E8BXD+j/E7FqeO9XOBRgSqP0uNaowCRcodqnya5qoCdnBX6ISpKmEp
         CjOVKt7EMqRKGBD7jq9qXcw4rpUBAQ8VHV4lTBvHpVgqm9mkkEvspJDMIlnqwzOQGZwz
         Trrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104183; x=1784708983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQlEDvb65Bh/rY60bU1eTX6ID0Mrq0HBhxgNwXz2HaA=;
        b=hHn3brveWRmvo/QRmiXD069Hqx2DKxXA462yvzpoMYBBuE5BxSXznPiEY/ibuvGpi3
         L4Yn31wkB9zu7zMEG53WB6Bfn43xX3NIsamPo69n+F+6ONkUe3NoQXr6p0TJsaiCRgZo
         +6oPr8iIpqTAfI4lhe5lw7P/JJ2OiK/8CZ27WKBvsyCYnRIszXAYheaBaQPGc1VedKGh
         pnavQ/BzogFIoYb/ZXvJpNWtu/i+p1h7ZnbTlS728xv5gP5kDiFsZ3HrF7io1paDcexI
         q+0WFuLvAk0UAN+yIRt4PX5aDqo6FlM8XKcGDNtJb2Lon8ESZM3jc+YfGyRy9DHKx25J
         vrnA==
X-Forwarded-Encrypted: i=1; AHgh+Rrohl2tjoeKYQrEY3FDQn3UrCXlr20meGRQUNRRnerI5zUKLT+G8q0/vvfNVzxCF8S5ae5DyyDP5bKyEbsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0VuiANGy27tfwefJgW88Fw0WYIsFVDK1WReHt2tmL4v81vVq
	K068JtfeOxqecgUYjzWaj+9eBtDfbYqwFZvfouvA1CvuYhs3U5WlmTcVCEacA6mqxov3usAgdWl
	UWN2JcMA+4muwmnJI0N0RzW7VUIbucl7yscxkYB5d5U6KwNCx6OJfW9gIbjZy3f4nLe6ZUS4qb2
	hn
X-Gm-Gg: AfdE7cnvMFU5UPJ3t2WBxi1egKBgDnttDKBzALEFQhEeQtIxoaQvP7ugzkxwE2XsYtY
	ceLntJ1xS7Dz+DRHC59SNlD3x6tQ76RRBjqUwsjJ6Ec2vt/i8SMTJf/u+lrvVCITkAvMVEb6LpT
	97EGgvthuAFW0zGMbAZgCDHOvdnBvefHbtaNaq1EJ388EkbLG5lBE3JR+vFusGrSOJulv23TFLH
	KNTPjCOFKhgiIbjRb3/BTgcOqoZ2K5AswhK3atZQeyWbBi06XGFiXcNVnSuwgnBknw5PHIB7BQG
	r2Okr3v05QMsf/4jvPez0Xgg2T05+i6t66PKIHN8SKg0cW0aghQzCqsI/KxuxR3jUXKBX47K32R
	VA4u9KtuBTk2tFV2eYfibPL/eypJvNDDXbTThxOA=
X-Received: by 2002:a17:902:e949:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2ce9eae29ccmr149870935ad.7.1784104183586;
        Wed, 15 Jul 2026 01:29:43 -0700 (PDT)
X-Received: by 2002:a17:902:e949:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2ce9eae29ccmr149870745ad.7.1784104183144;
        Wed, 15 Jul 2026 01:29:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb75fsm129260715ad.8.2026.07.15.01.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:29:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:59:23 +0530
Subject: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX9/yZpDubNBRF
 3e6BA+v0+77el0TTOaSaHRl18TfPftiASl0JC6M5Rsd954VSduYF6Tk7gyjJ6DLDDkUigEc0Xx8
 QwXslDEczkICdiiTULtFCIJFwzoWxr7znx8EsjfH2C/0RXkCjx3Cr9FIZdWE8QXk0oEevEBaulP
 dnWZJBpXYnSX6ehKsQaSiLrD8B51Z72PUKHncp6DCBwiUy2B63q8QD8Z9AL16hfFNxMRnpTezjl
 lnBiYl7KaxmA5bJs6AFucLOuau5oLYLvQx62vprqYCABZJGvoDnnrJ2X8jm6cw7W51h7QlHjsbw
 yg6cN2iz7u5WAZHrbkhqzHfZjSQH6X558yXSII+WLX7jb0lDUgHYtBZJb87UOUYTugbEl1r5h6d
 h9FZvznsJ2JmdCrIVD5qbTkyKaHV1lNhgUzYwD0A7g9booPdE4yZM+a+q04166+GMs5ySxFy2zM
 ugUzwLbDpI00tdktrDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX1Phu8+sqfELh
 X0deSf38RiPKtPM5QjJf14VvKgs0c9y94M9o8UhO4MTBQ+2bZf63G8qvADEojCY0hUyf44xMJbG
 p+72k1/b5sI1jlgF4SAznGh8iJqeT7A=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a5744fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fYNuJulPh_gWck5KaocA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ZBsz9OiihdBzpA4QohqfzZ00mO1WPYrK
X-Proofpoint-GUID: ZBsz9OiihdBzpA4QohqfzZ00mO1WPYrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119184-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2918C75BE3C

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA macro probe function was ignoring it. Check the return value and
bail out of probe on failure.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f511816aa4a0..fc9e0a37c042 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	wsa->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)

-- 
2.34.1


