Return-Path: <linux-arm-msm+bounces-112919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7CMxOZvRK2qdFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:30:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E354D6784A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:30:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jEoyOJDH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LJroJU35;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B81953036DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90083B8413;
	Fri, 12 Jun 2026 09:26:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441283B6C1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256382; cv=none; b=iq4pWNQ7JO33vtRMH4+VWZEd73s4ndi9LLJtBuWB+GZPiL0xNolBv0JhyBSklXSwNwUymg+Jmanvb3tYsby8NlXFrnfFj+woNfzgJDSIlMGL4GF/qJwMqnUg8F0Nl+ZgcG1378avD+laxDapjSfLmVTfxHKDPOfefw9LolvKSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256382; c=relaxed/simple;
	bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkbCaIq/3KjXoFKsLRKW4T63A/N/oPZYyYCh2VN36qsBQHH8lQA7lYSujOnQKPMOR6oeSy0CAP9fQO0Jt8JDucmxWy0SfdZkrzmIBCQONz8WRL4w1CHUBrexqzAj4/BBFpiZexMzn5esuHsZ7pwFTuUZdERnRmmxynzRcYpDFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEoyOJDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJroJU35; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39RFh2502678
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=; b=jEoyOJDHN0EO8/hx
	w6E148r0dqO6Bb+rCiSxsZsaepidMz/us/AekapUeyX1i7jGbxLU0/yuheZeZxnR
	R2ALixxmBiw0mMbnf+jaDKLbsm/FI1Jti+LEKhA8TssZmVYAcsAEtCRLpGcFilxT
	Un5S3IbptSUny83tWmI9e+NHmlk67Fhw9PksB3IbBd6lOmuF5Gjq9D5UHDEyfK5A
	VgKnOd49wgLIo9cNA1LpqpP7IICVvZ+msGBOujwuTIB8ReQK3vim0yUST0c/HvPr
	JKcg5TzyyBM0K09MijSqfL23tFd7XMYjjkpjWg/68n+QgqkM4kXIQL0ttDWuA+fc
	aEYJcA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd30rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:26:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so829896241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256379; x=1781861179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=LJroJU355FTdHf1j04yITrQanwJBiy3Ka74vvwpjiMLGYhcWgLQk9cYq4b3Xavjtum
         DGvKx+qI266slVoiwZbrpdCpRRT86w1JfUyMxdik0IAIBgUr1rW7Jycu4+ZnJm2a54vw
         bQiJGUHiFnYI1sBi1LElta/qFR5wCc7r7TSQVTd1VgE5u/MbQ5N/34YBKz4gD8mz+ilF
         YyKd8nVhseMTeVjGt1K4Aehxd2pvG5gN9eUiokzBSmQa3/k2IdJhBg+QPVdiV1H1sWSX
         WrPtlZEXHXJfc02jC/oeg5rD+IF3d1Uu6Upcqx2xT0Rhew/FbU6eZzZNM4ydOQNc04A2
         Ea0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256379; x=1781861179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=elWx58VQHvNIn5WcJb7SDYiVlqWcs6cSRTFh97UT3gBHNAmj7GbNdf2I0O90GHs8Gi
         DW55X7vRAyOqQJ/ly6uqQFFVNhrf6MbYnnGhZbHCzhUYXGCy27CEYODfHDz2RcHg77Eq
         4l+PMvxJsWZ7aN29zRr3ifQVVmx0rPyVXKmhEGdMpPHj3qMRM/WNSicZTlwSkMuZIFFG
         j8NME6rbSSaQokUxDsKh07XdFtsybiQ+KibKGFuzPU23SszaNrplx5OGfvH+NkbAOE62
         MwCfNKEc7bLqtbxmpW8rgcOH51+f7LdTZZEVpeBbv5wpV3nNfvcxs+fLL4sk0W2ZMgS2
         HT2g==
X-Forwarded-Encrypted: i=1; AFNElJ+kmKtJhTABtopqW/5jtvUJpfpjjVYGnZ1KDOKHwjSpk3YJWjximptHO5cuc6reyx2+4yU1Qa4mNJPlei3r@vger.kernel.org
X-Gm-Message-State: AOJu0YyfLfiIwLNnvCIKiPebBjZXT+PmmMLJrml4xgJ3vJ5Cw6TsaRvE
	nK0Izc9GDVjL4npHl0iohj1sUjolZGojtIp0Q0CSxhG5Gf5zq2mHRAFmN3I+mUMnQkG821N9UoT
	g3a6Lxbu3vL+vBW+3eUFbpP3ya0D6atp+xNl6x4fPcmNgJCjEvr6ZnfXuzuxcBUYd6Tol
X-Gm-Gg: Acq92OGzY6JpNK1FtFMmdF2Z9Fn0N/p4Ew9yMPPQHmhLznKxQnFKbbctKIwXYwBWLCX
	7o28CohFxOJibHUE+6mKvDW4jZGoXKpJH1PkNUQ2v/keKBPhEPxbEGWDeB0mutDcJF/Suwm/P1a
	GMPcal5h5Rcm3rU/dJoYLFegjZjWUIDzPCzQngGUvmej6hCxGWjvUTPjsv/P77c52gsnpuRDk2N
	yzj4GuD0NT2FHYcY8+nQeNNvXYHqC6ceHLxXWDCvPWoLjRp0pJtOakk9Q1JXfM6gEQUyx6XlYvr
	c7e9BnXFHtw10tSHVbrDzMJ2ozuewRDaOEExsimvVRlAF8SnZnnBCeVrzX13SbCa4IyXawbggW8
	u+4rkeq8FtfUZCHqdXxK/3xh2qjhDmGLA8WaRGtZI5kHS0U0WyA6OneSnDGsavd2Eee6+GwKSEn
	WcRYHzUptmDQE31EP/JNbWbxMCX9I4HTdKXRk=
X-Received: by 2002:a05:6102:4411:b0:606:49d:1861 with SMTP id ada2fe7eead31-71e88defa04mr800931137.27.1781256379450;
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:606:49d:1861 with SMTP id ada2fe7eead31-71e88defa04mr800914137.27.1781256379062;
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:47 +0300
Subject: [PATCH v4 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-15-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRp+CyWaKMZ8ieN+tWwPl8UwjQQ+oM9UB8J
 Nfn9Mlty3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1Zk3CACEsFPEBtMKsMHfoihEHxXN+8cDUYdN16iK/PcAiGmnYum0B3GhT3MpQDTzelkDKmRgVgZ
 bdqp4UedegHV3yyPAaq3QrrACfs4uS1rMYJjjIYhixDk4K1HkzSvew0Fl0OB4UfLhcASYuFvMVv
 yw3LXf3TOyLoraaCk6Qa3fZ/SNds7/c6AsnQevKeAD8Uo3/n0RZt+owytCMj1gZ0NDFePzYw6c/
 X22mMSebEAvnYzKfAbMK8VkpCr+MJYmU0Q/YD8dxl8/CD1ufWPNY323VzBTLpuYkBL3+V1Lkf0u
 tSOcv9uv+RmP8A6hAHSs4WP+rb61qfJq7zs+ex3MIcmBawYg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3UmjFx8gRaeFuUQX78o5AAvd8G83pqT_
X-Proofpoint-GUID: 3UmjFx8gRaeFuUQX78o5AAvd8G83pqT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXxPIFbduqVSEt
 xNdDzQFOj+2S6HnniWMerKKmn3ksZfgbz1n8m3yz+uT2/TSnIwPjeLIvGlxsHgM9aq+TTMd/7LH
 elSUyQrD5c0uONJKqbtbuKIdCDgib+sdnu9gMoyBDNMfyvjV8AgV8MEdRnP6/vSgAMlBQX28flj
 GFIKbsM/Z+RbObb/D63kA4G6ek17kujiGow3k5W+QxJWjZX+0CrnRod/kZgCanKY3BWMlaY0vRa
 43Q4lAafMLZ1D3b83TUSSIUSCNeYLVaY7FfsjK3HNvSRcStvnkxmd7Gf1PJSknf771jKxlgunZe
 rKVTDnA8ZD0MsnFvTaQRu0ck2EwVTtaVlLrqTQJK7EN9E506u/p22PWRnecvAxJ5skVpgicwnPh
 ipoFKNQ2Ye9AeGSGQGAEQLjyvbtx9z1XK7HMwa7ln63SxGNpv6wyuXn++5Iw1IPt96wXwbT0wgg
 6bY89dQXwcAyjVV3atw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX2l1G9wLw98lg
 pStPOI0mi2FFzd9DjAuXeQJsb2BwTj1Re5/llIq06Wpe33HlQmFq/j8ZiboAgh9T3hhdPill0gE
 mdBnI/AEut2QNzu/Z7sxEIAlqtfrdRs=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bd0bc cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112919-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E354D6784A8

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


