Return-Path: <linux-arm-msm+bounces-106543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBztCDoX/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:50:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9424EFE89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DCBA3016D3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2623D3CF9;
	Thu,  7 May 2026 22:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCQoeyTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY84Ia4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD45B3D349F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194214; cv=none; b=FIUgaRlMp60JFXBYO/qeSV6A2LbOS2zVJQja17zgdGr2UtTWkIoPF2uY7O/LGNCK1/UsLSp/h9ZOr2iviM3Mh4dXZ3xWfwWCoYzG6109xgaTbW/H+3r49T3yAYOvzMGrUBT6Tqc5iCzM6dn7H4KSGYUV4CBB/V62fDFWoC+zJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194214; c=relaxed/simple;
	bh=DeoGvIk2JM6d3iYKy2epXQEX0HxjaKrwSQKtJe5us/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMGcRjb6vsZlGO1P5cS9rxwqEdXnJ8u371jZUo5BEM+IEOUdsJqLMI3qSUMrKjFBY6h4fAHizOq6lIvWQnupdKUZqltDFD6TANCEZtjiqbjfLQH37Q2IH+AgQr6s1Xj826+Lbt/CZqhP+QJItzX+XkmP7bBpk14QunWtvPKnMPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCQoeyTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY84Ia4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HVCAJ1971666
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=; b=mCQoeyTpvVA7XDYn
	ZJ3rL90ZeOGF12kxncfq0nwsHq0+hl9jeWIqVrJyX34O39r6SHIQuPGMBduHpyeQ
	uV32k9OdLE91iCmWbyfcEgi7EQnxrBHnynuYk2XknEWh9EszpJgM08yjF/BVDW+6
	nLsHvSLahnbyUZGVpc/9qsrv7lUr5j/9RxW2vZxlwuKGOTjknbCQ4mkfoO4E2QCb
	AP9PMNeNN5mgW1+xhf9TPCwYOcwZN+Xls53EMqkDBYDGoGM913ftm5DNl7xLBWam
	E7jFutzSm4uhPoc2w2Kcr5hYr7oiZgRAb6coakDzXDhePcAjZsoXDcd2mIsdIoV/
	uGk1OQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tejacdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62e94ae0479so5172642137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194211; x=1778799011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=;
        b=hY84Ia4UACwUitlRjctguziFEGWLtwiJU5yxbCZbmLM3QIHWabZ9D0m2oO+7u7Yqcq
         fXdEcXDqM86PCWjjXvHakGpxgWPYBN5jCMQ/h24ef1gadthThUfBLDZOszeW6NVs0qvu
         PnbhfDZIOH7enMVbYtMEcQrNbrOjSoYGmhWhKyHw8eWZT1QsN9Nflk3Q/yy3/9NAtEIy
         HuF1UzN0RlZICpmEplkKm+XqMksPkaZcSsKeuDyrtuzuPn4VcjyqciCHtL+t5km914gr
         s/2rB8hWAw/wQ4i2LOn+jIlF1xwu1NCxWhfLLdueQY28jP8MY3wC8BrlUtD+YHwJQYNS
         IuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194211; x=1778799011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=;
        b=BWExqx8SidCM8JzjE1xaHe4Dch0KKli0ENaZadm43tLDfXvxQxYOcw17ds0fhevTH9
         s5Ebq/cTeMXGhelx5BjS/HoAg1TpY2OZhDWNghvHaITxmnqGDIcIQDosIB3irgtiv0JK
         P6Cn1TMiAU41U6TjreUca6BKZd28ffqSXN3u6P7m18ur7VF+mkSjxddEWPSGk70JrEiI
         FmbUNykSXG7Mb8CfwL4KKyE3DEtVsaHes2eHFtdT56LOUPLtkMVm0KFsasaPL9r16xVM
         zNgLzA+IWnCHnMYFAIyaEgwv2RPxHEFt6CiygvltqI1VC5uqVWJfv4fg+efEQrcEbIMm
         QEbg==
X-Forwarded-Encrypted: i=1; AFNElJ/f9j5YCc2vkl4o11fEGd9Gei5pRMOrW+oqHDQ8TRpwojskUE4B3LfJjny8IIZIFmb5C3tzQt3ETn3jtLvF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6F5B1xzESOvNWgCXrHPxRwwab8Cpp2NdWdK3zOycgZoeF/Tr
	ZXQlYtWSFtLLIYJrscAVqa/Row9VTES/eMlZ2QBHlUj86bx10aPeZXSTTEeS8y6Z3Uti9ibiZZX
	2F7K1qKUIa/NYv6eaiMXgooOr+cnZBgOMHmMvxS7hCZs1Fu/Fh9+EfD16AKZeHl507NMa
X-Gm-Gg: AeBDieudBWKctHqsDD20IxvvUpTIl3Crf+IY5EBP9I0cW/HZeNIa6oQlv2m1mNeaw6E
	nwn+cunuO9c0LmZj4nhp+gpRoAYSyRVx6/faNKmGCC6Du+LOn3td8s//SRy/GMfXF6n7D6lZTto
	xm+QYb+n4Vz4hTRwPGuwCbtCvvdZ8fnFtpGi7soBDxACim3H1suWsv8CCTewknMR+inKCzjzBaL
	kgBJLjZ3gTh9b/h08IhE9oENVCwqT66UP2KMrErZWIOELIjWht0w3xwLM1xl9Uq99HTMnyAwqi6
	lbqLfrad8uNadJM+8oTnWyDtk0ACQXIsu52ZfHhWEIWMCPMlxL2754lA9D737sdUyl+sMCHFvge
	afG/jh3ltHWNbatlW254VTbG4LFY7vJfhOQGE3Nu3mYQFD2K1nI6911bsjWuXm1Mj+CJwdmt/y8
	l6XBRrUpEs8Wut7PuB
X-Received: by 2002:a05:6102:32d0:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-631160350cfmr2101559137.20.1778194211131;
        Thu, 07 May 2026 15:50:11 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-631160350cfmr2101543137.20.1778194210720;
        Thu, 07 May 2026 15:50:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:17 +0200
Subject: [PATCH v3 02/15] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-2-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX5Ozbp0VFK6RF
 MqMNeqsIvFscEuDdyEFMH0FBcq2IOfUdmscRFPT8iboCrliCi36hFr+Z3llUNr8NzU/6A8atfaX
 JM0l1PyZyQUUcSFOUK38iVgCi283kEvhVRdsx0Ehtd668r1lOEq5v+ET2TgbC2GXLP2aEb6aglv
 nvpdNnMFljRbRI0Sq22KtWd6yJORbWfHK90N0veINUlkzhiUokXHqTkjnIa2JeA4v0OZV2UHKB7
 EsLIh5Lgp0KUdtfjtMXa6WOAkfprC+tJ/+CwGwU5+diACbFb3TpXpOIlDX9e5vteX9uaGvJFtX/
 BGepN8PqU3CZOBNpKi8Tgb3zPLQjtDY6NsfFGzdmLFV+JfbC/k80DS+RDhC3xgDnY5hKKNwivzi
 QvWfb8yHZB3oNtcYx9aNUvi4sRQc8p0uitMEqvYJG+EzJNJD0Gy/V6MJIRaoAW5giX8qLiGswHW
 CiXTI+/OGtJqUFNKrHA==
X-Proofpoint-GUID: xuhxlRqYh0C-KmDCAS5lR36M-C65MO_x
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fd1724 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gZ4aIBoJpEVIEF-KsNAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: xuhxlRqYh0C-KmDCAS5lR36M-C65MO_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: EB9424EFE89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106543-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb and axi clocks with their appropriate
nominal rates so they can be managed automatically through the PM
clock framework (both are part of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c37d5bfb4072d4d94a8abd453b89c9aad7e15001..3bde26c4750ea932ea69fdbf5c5da9f959e5e5e2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4830,6 +4830,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1


