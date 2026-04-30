Return-Path: <linux-arm-msm+bounces-105319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHMOBBYm82nIxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:51:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1DD4A0329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E6E03080AB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC9A3AB28E;
	Thu, 30 Apr 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhuSz7nJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAXpu1FS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD973FE645
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542345; cv=none; b=uLuDeDIcbvPdLnD2OCg3kzMKqRYXWBURXrt589+wPNr4AEvZmh45u2aRAuFiurHgVgvBCInzA7Du2rWE0m/1DhC9AFK0RPppQFKppURrPoh+syDnCifeXK5xS88BYxOQ+u4OzM43njgMdYOT5di1Bv1sjL2Y4g3yLrOEGmINEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542345; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIuOyd219ONn6GmsC6dGsC5TjCWD00w7EBHtKh5zCDnlRYZ0J9iggeV2k40IuTfQndzcU5pLnP7JeIXDYp9bXLvSb2fa/vLNPs02QiIFeZwNIdFbr2ZgCRz1cQ/2s3Gz2HrNPnOwSUTNZx/KVSczkjaWnZcyRlrw1C7xERIMQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhuSz7nJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAXpu1FS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U73iqk3884903
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=QhuSz7nJq1/8/kZF
	8M6T3pbxeRFBbpm684o1jf3/6WZcJQ+FgNGAhxFXVs5xu7TU01S2ANj8idUPTUtx
	MiPjxtel1RsLktjnkjxNn92X2Du8EZXa7Es6j9x5Y8tC6SDCTcrrB0PIP6c1I3Eg
	DpfBjju5HSdNWBYyP8SJEhfCwKEBVXP7Iap96pRAewnySenXPOQzyQKDGhvFqyid
	23u/y8WXnEmFZIhcs5StOGF03p5Tbn/ftn6JeSpACDQJ+UCZO7XwpRgDf2/cBAnC
	SZu/2pOP674KGT9pcXpgjPFPIXm0VyE2qJQTLpjUOejQx+SLYWUjVnnc55GXQPlx
	TVQMfA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmaj3ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078eaaso660357b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542328; x=1778147128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=bAXpu1FSdZUj3n78x8KLFM/KyF6yDKvCwjkRjdLQmatyBkEawrkUl32ByHHv/GU7Q7
         u1NV/7eAOdxSvZWOraEjnReTsHldgbzxY1xTqxUlgr9eEXg9zHNJjKV9WgOgCYa9NNX/
         WzkwVdDFeri65rHkP/m8kuil0UxPw8Av45l8q9zm6SHnp6Q+TRm25+gPR1fGi3tlYIaY
         2eojgtTfjUhlHSUjhutqCmHE2eK0VwZvX9jEpQVjy8wT+cXIwSAwuluU6OYVMqpaegMc
         8Rv2/3JAuz0EsAOMHd5k5RZ6K0s5PnvNuishxfz3as5Y5lMoJJNdGJnDWzV9Tv30ZK1D
         72GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542328; x=1778147128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=PrHngo6RALDbVhVLj0Y/Ou0MzKiGfffFVW/P7fF6UVzbz2mYtnmK/HlP2Vhhktilv/
         wv7eEsGCQoJbrpaNFwtpWrVY6OTfIH5gX+I0VlvU+trQ2J38kwyzbWw2fHReyeKmXy8l
         VG1G8MFdlSygW9xYMxMCZe6frsAON2PlqNqRtz0zPkyd8cYQtE5JZlUBFceSnGyk2hHM
         bOC1uP2Ngsf0Q4al0kepIaWIhWssAmdGOjF3YXwXIIPxWkhlDKUB/tyOSQT2ahHEBpXZ
         RowGKHU9Tdi93rlZEzCfZuXexlPBvEsnrmEVwXT+0sdBE5qSKkw0nbHM5zIBOKxSF2vk
         1xsA==
X-Gm-Message-State: AOJu0YxIVEH7Xi7FWIozybnDr0tcsNIG2NPypruOlPvUe+HvW28Ly/mb
	LCWClpFOyTUOKuyW3bIB5Px4lqA8WP5Uhaz3RRfO1soerwxT8SrNes679lNHAfcEM7oXk/L+PjZ
	X6P8CfwPvJuvBOKScedVLqeQD8wRZ5+/P//90IKEux0w2dCEfl1IQ688PuryBfaO6JxRm
X-Gm-Gg: AeBDiesHG8B4EcL3vPf9zrJmxg1PrCK5KnOrplRh48lf/jNfTTINqCgN1CDJpbT7tlx
	AcMD0r7Iwa7+bOeaXSkGFhRdKehqKFexnBP6ZhmXrj5o0Mu2K6cT1iuI+5vJkpmH86BCFhj9pq0
	rnAAto0AwjOqJj7vuGYQko1Hw78tzT71NdRfwGHUL7a1gqIo+81FKN7HAxkWCHksaKIWlRMU2T+
	ZdkjMf6CQd9gPSsLphy+DYdQYnag6UGN0+y1FydyH+BxCXUAc85kLsNESvLeJYUczMrCJjKrQ9b
	tXWPuxkzslkLhJw8Ir0nNtNO9GuVcs83LapfqdgFlTLh1cHcBVUALS4o4owvsn3HCYfAcDDbEhD
	o7GcHf2TXilK+oiKoRVa7jY1icXslhbzWnTsKA0+bi+LvW38hrAXVgsM8QHIFeQ==
X-Received: by 2002:a05:6a00:90a9:b0:834:e605:9927 with SMTP id d2e1a72fcca58-834fdcb93b7mr2542994b3a.37.1777542327742;
        Thu, 30 Apr 2026 02:45:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a9:b0:834:e605:9927 with SMTP id d2e1a72fcca58-834fdcb93b7mr2542954b3a.37.1777542327293;
        Thu, 30 Apr 2026 02:45:27 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:27 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:57 +0530
Subject: [PATCH 2/4] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-2-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
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
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=27W/Z2UdW0YDQFgKsxIdINiG+aZwf4yB2XLE43xdXAkye8TFtIT/pdcLRTm/BlTqcM0boivtL
 XA9YeAR0nwsCKG5i0QA/eOy4foCPFgeo1isf8FY/1Jgn0DU30yY+Egv
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: kJ0FnSR51heGbCbZF41fQC6fpeBcPxjd
X-Proofpoint-GUID: kJ0FnSR51heGbCbZF41fQC6fpeBcPxjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX0Rf5braENYyH
 gCmB2Qcia32TfB40oej58uWTr386kq031FYODrKWWI5gl+qur+uBNdb/vtve4xn7Im0Q2rbmaxg
 FHLLx6KtxLkfDlXYGWeKRZDo6tU0DkDIV5apHedwYpN/26TrYuYXsyjvukHf3ENQzMmv+4+SWWP
 Vnnq2+XKKFFGrR/N9rNADOE9L/q55uthSSnR3/KzGJ5EFYhQ+n8cnD4JvN3GJXMoFk8H5x+7guG
 wMoSkHvsJwfxCOgtiea99Jh6BycZCP2sAPoqsuTbE+gj8PibOYCvE+wy2SkQnsjhTTmFTb9Upz9
 b5iV8xP+mEwB2c+SbelbcExhM1NtvsJEbYV7OLsz040TYEUXwlEYEA2VqK60DRKRVA7zpO5yXnN
 D7VUF5ffMAKQGNkqFHKlyYOT4HVpbjWvKIUdtd4kfX5qN42hK7Y1NbQdAPw6eu9kee97c07/DtK
 7zH2kFoI90u+aT6xNyQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f324c7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096
X-Rspamd-Queue-Id: 8B1DD4A0329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105319-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1


