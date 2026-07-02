Return-Path: <linux-arm-msm+bounces-115828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UuG5HqYARmrlHgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:09:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 082736F3B1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:09:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YF8umf35;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ill/3Gex";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C089301B5A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11965375AC6;
	Thu,  2 Jul 2026 06:09:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACD3374E7A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:09:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972552; cv=none; b=mh9eAN8oeZ7E8f25rVENWC8p+p8LEiQdMdATfi4Pcrd0qrszi5L9u7FZnIDnVpEqA+UqGGrJNVDMn0zXNsbFWk49T0aaGSRnU9l1EaGl2ttnDBRlKCOlR5jvR9db18rotgLHISksKrZLQZpxmVHS9PadyHXU4fZWahTa8Yij4O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972552; c=relaxed/simple;
	bh=ABJeyst78FLFzl9Ct3p5szQOsed4/LKHB3A9jqiuHok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MA8xrsZLVIP5PxVmEQZqw6HV3Jkwx6jUYOeKMKNOKijHU1WuYiFlNju0iApkqdvviuH8JNkJlmyFlzZSMNNGC0Dt3NU/E9m7EKqBIWe3ST3EuJLVKDQIi62vumLwKxA8sIG+L4YGqosPoUD22LMFjo+5/RsJ2opdLKG00iwsWh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF8umf35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ill/3Gex; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KSP82957685
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 06:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4c11rFRRdg9DIaHq3/L5hXGchxFnFdVy3MEIWfSpE0=; b=YF8umf350ugwReW8
	WLyKw1fYhj7iweUtFyEQGJfItQJwpaBqBEi8dPBk7p6eoHvNVqjHsFhFBaFz4NUJ
	mSvlqDFgnhiJtEsgZusvHdtSeU4hUc4ZQWdQa4rUx5fhLhPBqTy7ow7NkQQGU4os
	AuOXUNvTAKBJ3hDPRVCEGqb/pMiYJaLFNwdOWiW75cgf0f8fd9YxfCSThh3omQ0F
	MP5lK6PLNDjyWT+tOeBapcu6hHByLW7+15T36451FsT9P+TJ+cgB+l7bMNma/BBo
	cfMbJL+tuHm1qkJ+Yvzq/pG4BPDSd69MXJMgPdIoZEml8xRGV/vCEhxoatiUk0Vv
	gS8lcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630aqts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:09:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81db324caso24819895ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972549; x=1783577349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4c11rFRRdg9DIaHq3/L5hXGchxFnFdVy3MEIWfSpE0=;
        b=Ill/3GexwTi/ebrAcAeaPTwczPP5VvnpyXEGZ5DJegVVH90oDb6KrRzzMVVCb7YLdi
         sLYdjhxlRK70oQybVre871exLJ0yuK1lfTmyh48QGTGu9M85EurgdE+fFj4G8mg+5BXr
         HfNt+GSTfHNaE+l+3vg7NnOdi68/eclFzCDTNl1ZNTcbNDTPuyXCvgAA3XJiceUj6ost
         VHwWgk6jOKuSQ8UWt2DcLxz8+6rBmpAfvUqnChCtY1+TZXNXhG736eoW/yHt5GZEW4Vn
         redPBePx894xMni1CpuE4928l6fFjRxNMDNPWmMgE0QYOOcbNgHlJbuIGAFxuJw1fO/Q
         aE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972549; x=1783577349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z4c11rFRRdg9DIaHq3/L5hXGchxFnFdVy3MEIWfSpE0=;
        b=o35p09tpXJDcnoTfOKXcmJhHuYfnygkXcL0QDOzspqWy8GhH/wY2q1qx/YF3CfhIAD
         78mmgEaZnzdpPiF++yLcTL/3mV+Mgyi85LLskNWYL3AA7zDGp84cqny6Qy8aqN2FkMHs
         ZIUiVLObQkCSVhTbDUZxLRWiqmUg0T/ePw8xDfoXqULL28dOCtEjb4mZf6EABGOGmd5h
         4yJGySIU5ZZzIXQ5BqCYVozgzdnwArelP5XFwzLalTzUVJQaAw+4L3Ds/RSC3UscOSX6
         g1i96N6XmjcLgGPPl3Xv2ZKzTtAh2lTGB3HCG3pPPTlNfphOOnpsc/DyCwGK8wKGrPVO
         aUEA==
X-Forwarded-Encrypted: i=1; AHgh+RpKwmt+bL0d5NQAp+pSs+ZZsXhO5eFr06MGopYrpwlaA6FEuqQPF5dvME+IJa/0JUIlFoImVd2KlCPRlPKv@vger.kernel.org
X-Gm-Message-State: AOJu0YweqdGwJ2OvVRwxGzXN0XsTFjf+WkIYFg+LDnxFxQrGKW3ELeD6
	PO96+B6zL5RVtgLMp3G3l26wFeBO6s0CtIrojRQfU/03yf+stAxRAQ3I/WZYD+QH9zTQ11U9Yah
	GlGTwZAaw5Op6DpfXMgy0d9nKnWXXFpKKOxRvP9GxkjUnUxRTB5Qg8s3Ec73+J7Z009Kh
X-Gm-Gg: AfdE7cm6FGxt3LDd7am367HaUlUA6Nsmz5PkcS5VL0e6WLLnqPk9yLkyOl73lOfPuts
	eYKosL6AOLhKTvmW9jTakAjcLpNk9+5aE+KxQWU3n42cUDGFdgSvzRY4xKywKvxR5N8i1tKNOs7
	blihtbzoj+JHBP4fkIasF96NIVnIng7oTQv+I06fa4OOIW5gw1Ojwt0cQ5bg6pK4bzY48PExBh9
	kyJVntEey7/OzgNx4qujx/5pfbWcgyO7Vtz2LzMDrspzoG72LyecHGLTs0u0P+uyTNhpa7X2gNT
	dMTxO/TFze0/vUb2W3UzcsVPQ87rCgMEZBvlMY5SLv9UkNo2uYQVQRCmwR3jhNO8FbZQ+3sexbK
	u2O1NQ9c9CfOWoA+fY0ejcAYhti68dserIAOzf7gT7iTW
X-Received: by 2002:a17:903:944:b0:2ca:68b1:b64c with SMTP id d9443c01a7336-2ca7e75d694mr46456155ad.20.1782972549327;
        Wed, 01 Jul 2026 23:09:09 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2ca:68b1:b64c with SMTP id d9443c01a7336-2ca7e75d694mr46455805ad.20.1782972548669;
        Wed, 01 Jul 2026 23:09:08 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:09:08 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:23 +0530
Subject: [PATCH 4/4] spi: qcom-geni: fix sticky -EINVAL after PM runtime
 resume failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-4-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=1226;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=ABJeyst78FLFzl9Ct3p5szQOsed4/LKHB3A9jqiuHok=;
 b=pTmMgvbP8fxitvKl8gNaFpnEQsYhWQcIaXWMOE1lpf+pt3wEj/I/dPGuaDCXim6fhgCF2LWpC
 gUViEoKW7tJDmktroj3cQarFJG9LkP5v+iztS0gK1GCq18Nn0VBrgrG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a460086 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r-mwoWhorYt2bIR64zIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXxdcfXpNIpjr7
 eeKWpMiA6uMKEtVnwsl+Eh8mYqP2uQ4usoVuPymxaUsUmHsxizr91HzKRXZpFhTkfhHDZNe3vVB
 UrXDoucO/FwDBApi0HihA/wwStgsSNc=
X-Proofpoint-ORIG-GUID: JNL9qFELpF_NGcgTde7pdXjo9T8KuKOi
X-Proofpoint-GUID: JNL9qFELpF_NGcgTde7pdXjo9T8KuKOi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX8xc6ocZIjbhD
 gVaYFnRKpkN8GEdzhj0RMTkXTKzmkH/kaqUxQUJJvVvDDomj6e6YX25rujHldbYAvj4MlBHfCvu
 jsjTh4fcB65uHEuQRAeP78ToMjRmX2T4IW4LdyzxvCD+F1ri/cwJfjNr/DEEdO/HPpfTaZNUh44
 WlrI0qFTSe2FJn4djbBAWG2sjUWa56DDKiwZDwVXYsiBXIEjVoC7fjcPb6qckY4KuGmXNR2hEY0
 DKiR6gVRFtEpKkVNep5xgb8JMuCVxq2MfrkPV97288qeZ8mKDgx0ss0qRZRoXZSl1nopURsuxCV
 NKe3tzzkhbdZB/dBxJ+c7+0AvsfL9LLq3oN2BSDkD7VeK67IKGVZNydYKsuL2iyS5HNCXcpv9T0
 RdkEKW4VsVvIw6s9REk02yQMbrEZ6rw9qRSK70Vlf09Tdkef1NCuQKcJrxwOK3yUD9u2S6HX+tV
 wrSnuQl58cRe0fJKD4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115828-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 082736F3B1C

PM_RUNTIME_ACQUIRE_IF_ENABLED() in spi_geni_init() calls
pm_runtime_resume_and_get() internally. When the resume callback
fails (e.g. -ETIMEDOUT), the RPM core sets power.runtime_error on
the device. Every subsequent PM_RUNTIME_ACQUIRE call then returns
-EINVAL immediately without attempting the resume, permanently
blocking the driver even though the underlying error may be transient.

Add pm_runtime_set_suspended() on the failure path to clear
power.runtime_error, allowing the next attempt to re-enter the
resume callback rather than failing immediately with -EINVAL.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a55a3afc0ebd..5f65e6d0d08b 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -616,6 +616,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret < 0) {
+		pm_runtime_set_suspended(mas->dev);
 		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
 		return ret;
 	}

-- 
2.34.1


