Return-Path: <linux-arm-msm+bounces-89977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cARwG7alcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:08:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31A54F48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F59F8E402E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079B2480DC8;
	Wed, 21 Jan 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoAx99kT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzeKQjcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8D480967
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989433; cv=none; b=X9vYl5HNaJKJ0oeyq8tjKCgXLOeJNxgZX7icJ/1mcr0iM5KnEBIWO9OqxDi4/QRZT4CkMblY7ahoOqVqJUKtNh6VCJIOIQATDfRjtDm1raqxbpHgVQJYPOMB7Lj81e+2MicC8CR1c+J2FhxiCxqA6R2l6wbeUUGBBL+8e165bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989433; c=relaxed/simple;
	bh=kwb3y/FdwrcBhxAAfQey0AHABNXVgwKVot625G+9RME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fq/groMfJN4fxiI/fctA61GYNex5mzLcZIhTCzryLSzPvz00pzMbTlBU1LitO8xuCkMWt+jcTIzcK7iQEPiLgMRsbnKyL3oV+2KUnUW9rZihVTQZh4Ytp8V/N3CGQcd2VsOvZ2kG3jPSuUO7oSoE9J1LmJ+WCspALq3/PwJYLfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoAx99kT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzeKQjcj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9iUm43481406
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/nHra5KEap/fFQTiNZsHo155KPMDC95QG2PRVp+dU8=; b=GoAx99kThTUykm4x
	tZH3DF8OCS1ebxUljbt/5rhEHBmoGaSGDvgGPEzQBEg5pQE0faUJ3hH4H0TtQpiF
	cTBLbVvANLSj/OTFogOtvCDx3TwFdGRZcpeZNWt5xBQMigIeFfNXqGvTbg7zvFlu
	QUiIHk6nOxUiuw47H1dfRI9DLSLX8KeOmao+vS7U2F70vE/RBtCDq2ZIkPqQPYTX
	+HMnlLD9ZNkJ/GKYrmv/+36WWAxhE5Ke5NAaVpLb8ETs/m3+3gKZ15wLIfDMN2wh
	a92/KkZDnICnUiwKcMslr4QF7toJ43F4bgDJh7agXOjE5KCq1cpwKa2YgfSuOhn1
	0lW4UQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef0410-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:57:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c921886so790127785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768989428; x=1769594228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/nHra5KEap/fFQTiNZsHo155KPMDC95QG2PRVp+dU8=;
        b=MzeKQjcjnp93lZ2bcHMztbksjuB/bmY7T8G27qGSYYwhwBFYPbM09Slc0a9XpvMe6+
         QiYG2YqvmAsOvNvRdt5adOiviRHEs+1jBJuLt/lUTNnOtajpaEPWy+ykqXRaA/lqFqCm
         Ty7Io+Jj42/v0aDKLMg0srAUh41xSfV5W4Z3GhFPIFP9dY+uoCmC7kXStL5aUAAbBBSK
         yHApM/1KD+niTDsNyKbJykPchYY0mI+zyy6iXjIhS9jmyaFzF/XEOfaw1qFFWsTnMxTM
         wQvwfOdxrOa6A6hZYG1cpmOWMktXbSJ2kFnYkplgSI1VB6TDFYHjy6hJVyVw1dHBAsby
         dUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989428; x=1769594228;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/nHra5KEap/fFQTiNZsHo155KPMDC95QG2PRVp+dU8=;
        b=HDdk7AiYYJgrZ7MSe7O/kK9zgs6sb4yCYazC3lDBHuHuJnFaDRWVw5n2KutbuRpG1Q
         ROAJCbStRSb6vjxxdIY/PQj0G7DXgahSyF3CHdqpcv1kKXwKqMfrDB8AafxPaoVCBARr
         7BXKRUs3NzBFycVl7X0Kf87yKqqizw+s9SeEQ0OGl4SG/D7bFfymMDdznKY+XtIxtyb/
         l7Pp/Hp1YvPjed84W/usMKjz7k8JOXQAg5YoK7+qlcufVsU1FxysP9+7nTW6mMUGgAQl
         KemMiUWskbnR2qJ+ZWlw9gnTcJaNkMJeYLtunh80IrAd7VpozCwToiAjw3Zd92jbgBuF
         dsow==
X-Forwarded-Encrypted: i=1; AJvYcCWvqirdoDTPI+yeR2JFO7v5X/XmcSkjQpDI5hf3V5HpWEpaT+rF1HKyxg3yGVdUtgxdLjGJGs5yDA+cf+0S@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4rOoWU7HDhHLgstTSmXt8UNyuPhog/ZaVNT2xYZuGjBIBteM
	yXRzZtBRtkt1xB/PDdsbcPkkA/cmmSl4NxfqpJ4E8dv7R+bnhnJpMi+JgN0ikagl7g6rgHj1Cip
	8u3Hs2QtRP+rHcweidGpePryp1XhyHJjdvg2nXkBPsb+y2qFKOj4GVGFBPYTxp5TBpv+c
X-Gm-Gg: AZuq6aKLpOLjWP910OfePknhMvoy4Ekui3Gv8uIJ8bCabbPrQQPmDi+e/cbRYhXtQom
	NMQY6rMOrqaadJJ14h+PMQG73kU483HxCA7nFTBOczE4TOEcofc0HS7W0gyr+wio/3VaK5Jjyzz
	HNGQpF1rLH86lUi4qkQzkprnKO4MDMWC3GO7UyM0JB3wr+UNhRu7HaXaZ8f3LetlhNRqNO5on9b
	CYgGzj7y9FkIHW0G9sHTA4DIPO9uf3hXCusTscz0b0HibWyartgBW3zH8yuW5jtkyJSFMWvIkJi
	IzZDpuiAZx/eb1NfFtV5YPdlX94ICk1kCCNIF18vAJj13N0Oj+sYcrVY0e/Ak36Y/UKJTFXTK6y
	qYXuF5rL3oLOc+eUH3FxdWL8j9+0pcl8C2Ec3GksFr+PRfKRA5Il9+RKREI2r0ZKXmilMm1PoEx
	PUhVY8StCGuRt/szG28zWnmD8=
X-Received: by 2002:a05:620a:7003:b0:811:f742:c752 with SMTP id af79cd13be357-8c6ccea9c30mr592048285a.36.1768989427976;
        Wed, 21 Jan 2026 01:57:07 -0800 (PST)
X-Received: by 2002:a05:620a:7003:b0:811:f742:c752 with SMTP id af79cd13be357-8c6ccea9c30mr592046885a.36.1768989427487;
        Wed, 21 Jan 2026 01:57:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c051sm4611385e87.79.2026.01.21.01.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:57:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260120234029.419825-2-val@packett.cool>
References: <20260120234029.419825-2-val@packett.cool>
Subject: Re: (subset) [PATCH v2 0/7] Add support for ECS LIVA QC710 mini
 PC/devkit
Message-Id: <176898942666.3623549.5303454776201288552.b4-ty@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:57:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: cULpONBOTx2cxg76GmkqkIIhrxudNqb9
X-Proofpoint-ORIG-GUID: cULpONBOTx2cxg76GmkqkIIhrxudNqb9
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970a2f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=BZ-WrxWMS1R5eIKT--UA:9 a=QEXdDO2ut3YA:10 a=UJEHjhcojRYA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MyBTYWx0ZWRfX3j6XhfUvXAGn
 HwwGk8C8/ci9F+v9ltMqGTbdo9IBGAJg9xUzYsaA4l7wKsik4rpQR7St3U5EynwSc8QEeI2hOYf
 s6LQvp/1mtouxDqIscVbhnhPErNquo5xfhzgcD3OdVGNvRIgL3XmLjMGNU8Eu6ilmM17yz5Sfur
 QZDYZ+So3742viExjeUXaIaBDvDeOBDaHx0kzhLnn5ZnjmrmksHyiEiNMadkXLarVhmWpTcObet
 /qyrRmBBhHN6t890oDDoPOEnpFKl8D0dwFqWzOZY08UKOYm1Mk0bc+KDdE6lN4FqNl475XssmmX
 T2JnY87pLxNao9SYYx4kiQb3kUsrKAQ1Osec3l++XAxes4RgSg+3avZ7I8xoztnMz/3ja121dEr
 njnFhThy4j/Xq8j+ZQPvSVCxOJKv7tXCzEFRq/gIbCdN/A/usMfP2+7f98BHGrJXDeRCzmA6dap
 Phu6CveXyrDceWnPoMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210083
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89977-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD31A54F48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 20:30:04 -0300, Val Packett wrote:
> v2:
> * Added missing dt-bindings:vendor-prefixes patches
> * Applied suggested cleanups and formatting
> * Dropped power-on disable block
> * Added qcom,uefi-rtc-info for the RTC
> * Added qcom,calibration-variant for the WiFi
>   * Board file sent: https://lists.infradead.org/pipermail/ath10k/2026-January/016719.html
> * Added a comment about USB ports on the HS hub
> * Picked up tags
> 
> [...]

Applied to drm-misc-next, thanks!

[2/7] dt-bindings: vendor-prefixes: Add AlgolTek
      commit: 00e6f8f60601b412e400873c8972f3e3802557f3
[4/7] dt-bindings: display: bridge: simple: document the Algoltek AG6311 DP-to-HDMI bridge
      commit: e58be49a9a09112fdb4e4d68b4653a2545746091
[5/7] drm/bridge: simple: add the Algoltek AG6311 DP-to-HDMI bridge
      commit: d51e390ae84857a999ad2046e074e97663e98e36

Best regards,
-- 
With best wishes
Dmitry



