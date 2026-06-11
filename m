Return-Path: <linux-arm-msm+bounces-112637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fZhJHTVtKmqtpAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:09:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C452B66FB6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:09:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FSOyVnmt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g0M1DOGB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112637-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112637-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B77830B73C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D674A376463;
	Thu, 11 Jun 2026 08:04:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9432A3C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:04:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165087; cv=none; b=TcQ5DKpOo7JFfZHKlzfMrLtkeCC5sDMJ/IRjdDB4UqoejgmSSDwZCYBuGXEncY/cSbmRl9OLhNTHsc2QdNhhl6Gx7fIOSf0wRI4lXlEm1Q4uoyZHxBkLOkfzXyENMKtenDBZzZWHvkAMJID5tlUWDMhutCFnIaJolsD9RMYm9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165087; c=relaxed/simple;
	bh=+SNiFYWYeunpdTDNpXz8CiAxvcMkNdwYzUo5XyecIc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reIPPZtP/fJHFZa7Z9YZlTjCccMKcTy5O4wJZCCnyEXj6m0BvALRJePPqJe27BOUlS2QUdmHBfe1jwFMtdFjsz91O50iO2KkurI81FRzBfjOsIOcrQuirzpjpD2dG4cS/f9gLdAc9tgdVKTLEFpKwJXyAGRaG79B63U/Unn8sV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSOyVnmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0M1DOGB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GUf83846382
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=; b=FSOyVnmtaK8OqCiq
	XgwVJV/fsPgqUQ2Zjls4qlq1ShFeVnieq2s2vOhSzvBkCfOTGjjAtGiIJ7So0gDQ
	3MVndu3dMgiawolPs1ovDDI7FQtD6gzIYQ58gebHB2yLcpMkh6cC1h68240em+mH
	QSf+rzr3O/mdCK/j+/5/CY/UXGMGGvLJ8Q95MORIjWu0qhibgjhmx1UKf1Vc5JUi
	JgNxr887ZHEFLKU5Iwjsz7uTIrOzM11IBrKJEWQPeFw79KUzSb1rVquxc0PJXl99
	Uv4o11XTx3UJn3Buikyx0NDVMcmDbJOxiB2+xzRYCd4gisgoboRGFjeD0mdpGrzm
	ruGw1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2bge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:04:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915732517cdso100834485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165085; x=1781769885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=;
        b=g0M1DOGBl9W6eq7I3WNKPoLSCB+/FN8Yl41Vc2MtweNOrpzyjwnljATe9kDn3Jh6gZ
         X/S61qjQlesOvl25RTt6MN6jp1Gp+3XI4Pcur+3KftrJykFLS8GqNYABLS/juqijwyuh
         hF8mp47P7x79pCk9nNeNsnknGCVh4y+nmN/1o+5ozbFDhntfYb9A88CbYfGfl2HAtCS0
         yiA7Cz0i9Zbdt0YMe8e4c7KFcbRoMtsXSZXnVmJK6UsP0FbnSUmXVzq5R8cZCOy+iTjF
         +GPW3ztnq4UCHGLdTwORTkhCNVeUQSRMsbabg1rtFQiqQ72Ka5GhEwwYx9U90feRmJ2k
         cGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165085; x=1781769885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=;
        b=SlgR1Jcq0xlidOdcVlHaNKyPMyptpp0DNvoLZ/wdDPZYdmsyzxBy9migCmMLRq96/q
         sHhWvDbGnk8dIoA404SQqp3F+PokFuY8feYGLnZZgvzVdq1iJi8HVyt8rm8Hr8nGwwbJ
         yU20yYeQzv8xG9YwTgBbOPaQEL/Kx/5NCkaSIMXNgP2hwG9YuyHLOyrHuteIJHswUMCP
         gfxiJ6TV2+asE2eaHa1uJWXhth5Edq3zZ4zFx7nFNoic6lZjHqvtDhhw74ISjY5cchap
         4kyuMGmW0Bl3TaOBstsV5J0OYY5oLFZvVAuEI1aJI4dfKy4NJJt2wTFvtheLQtJLE365
         C88A==
X-Forwarded-Encrypted: i=1; AFNElJ/OIgs3p3P9OXhBDeLcPpvbI9VE+xVY7jAEva2FXdyGn/eKZNMOr03NyLQfMveVimZxCiulOKSistRA9eN7@vger.kernel.org
X-Gm-Message-State: AOJu0YzckMc0vrqGn9appKTC9D4GzBbrQsB5icyltTjopQkcn+IEB6Jk
	WRLNb4FKKuWQqaGdU/mEAEV4b40C8+3zuk8FkQ4M2vk/YL5ZlbqJjER5qdebCc+1L50O+5t1Z4g
	aTCRmnB33uml5sFP8QJoYECw5VI3b0IDK/53nybh44uKSvfuQ/pCgkw48vFM/V9E16DrX
X-Gm-Gg: Acq92OEgik3u0CUHfcN6p1pYqYXcVuG93HlKHO/vtQKRHISIde2tfGT6yoQpgpfBHtk
	XhSwGniROfntP+dChlS7g+72LaUPTRF6iBH30AVQjPUbN/ZrxjaXwcEe38XNkT3qTGOSSnLGKw6
	VH6v5Zvlk6pqozpNPlMudE82ckOVjAUjLnagX8srgj/2CcEvlTNZTyTNxgRa5G07Y6L37GUSZR6
	zbW23czNH2FW1mHdZFX7a5uFnK19zFV3/nO9jyZMAFoTM1i7eFdFy/Ze7K+5k4ZyL2vPiROo+54
	qcjl6kPC5wX2cqyftngLXtOmN2uBZEGpCOI4a2MlOof6oCbbRHYMgpZYOFj3+Nr+cyRUWhSPtU5
	7UMJi2GuKZJ8WAYK1ApqtUgMjBp4GnhS6DOi9JJNPINkmfVvBC7kTzd82
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr16745551cf.3.1781165084857;
        Thu, 11 Jun 2026 01:04:44 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr16745051cf.3.1781165084377;
        Thu, 11 Jun 2026 01:04:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abeed8sm24972066b.45.2026.06.11.01.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:04:43 -0700 (PDT)
Message-ID: <c37b4ba3-c629-42e3-ac35-dbcd69cccaa0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts/media: qcom: keep PLL8 out of Purwa camss
 hot path
To: Ramshouriesh <rshouriesh@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
 <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a6c1d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YywNEx0Wz6o6_ceNSdAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: h7N3wqcW881llJ5mZVNAD-pWTjA7nwzQ
X-Proofpoint-GUID: h7N3wqcW881llJ5mZVNAD-pWTjA7nwzQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3OSBTYWx0ZWRfXwfE9MQuuc5H1
 VPmBuIZcNh6D6L+gqLsTJWpufA9GZB9yLfzUHgMj2AKjhWIY5WfCSy9Ex0+BQ2wIdqLLwfLdQ58
 nbdbh4+ks24ILy8Z3BkUYBBWf1ih5sFMQ8TH1H4esjS4BBvOkIpto+LKYZJsSO7Xc5NQXz78XDw
 9ZzywgMj80BiHoBIDOwB7FkmT66yFBBg6tUQEaxN11nIJ1FxA/1G/7Cm9q1FdsT3gFXS5OAMZIz
 Y5qecRKM2w/cGjAp8B+3d7LcirUNcd+OFITh3XGvTzQTaPUVKXh5P0F8KPsntxlsg6cSDVQU19S
 mmy8fK8IZ17Zv/rURqIeOxHX8IkvjmFwDbXvB1U81Q7H+iCgKrQRSQZaDm9NqUn17M3SEK3IPcn
 seaaWZD6SnxbkvkdDUGIg1cngFdDgc1rPRsiFTDZbbOcQrXMb1e6msAEjtKZpMkMyFwgbGcOXzv
 rLPsBEbv3vc8oswBgKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3OSBTYWx0ZWRfXwulpehWMBbz1
 19ffQEV7/52ywsfOK8Ys/Owhjd69BLeBTH0j8apK+PVWySBJX++Ck1wXDXxE2KVjI+9Mur8DjPh
 aOaWYi1g5ZxLlp6eViocdqc4CDGN1Ms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112637-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C452B66FB6A

On 6/10/26 1:09 PM, Ramshouriesh wrote:
> cam_cc_pll8 (defined in camcc-x1e80100.c) doesn't latch on Purwa
> silicon. "Lucid PLL latch failed. Output may be unstable!" fires from
> wait_for_pll() whenever something asks for a PLL8-sourced rate, and
> the camera pipeline ends up dead with "Failed to start media
> pipeline: -32" even after the qcom,x1p42100-camss compatible is in
> place.

This patch is not right, seems like you're missing the hunk to override
the compatible for purwa, the tail end of:

https://lore.kernel.org/linux-arm-msm/20260507-purwa-videocc-camcc-v5-6-fc3af4130282@oss.qualcomm.com/

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..25cd547caab8fa64eb1a134068b77f5178f5c248 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,6 +38,10 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };


Konrad

