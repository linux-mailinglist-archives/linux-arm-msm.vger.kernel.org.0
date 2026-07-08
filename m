Return-Path: <linux-arm-msm+bounces-117763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 24inIJR4TmrANQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:19:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D27A57289C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LI7jphge;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aEUsiwoF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 207883125885
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6698409284;
	Wed,  8 Jul 2026 15:49:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE2373C00
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:49:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525778; cv=none; b=t1AQuekap6XOmmQgcUjuqfwn0fIaKlvL06x1E4XCwi0y/ZeZXdP7Mk4zOU2rjlsxVoH938QvZoa3Ifg/EW89L5D7mRsuwOltmvk0L/KXIDcDY8MBn9/brR4Uw/zBoP7MC6i664tAAaUW2iKl+ySto8SwECbpP1CxXzS4LOEPc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525778; c=relaxed/simple;
	bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwwIlFL4rSnwXnTJhgvCgW0hx3bJxJjK9aUloE7wQ5t1PrX5u4aUe4cah1fBLxd5UUpq7aTd0qE45SroiYXXqNDzOtZDjiW4tM8jlrJ6weA6HzbA7MuF/Mw+SFkWpagpBcOygwDMSiePQ1TLREODDL7EjNo2IXUCRQF/QA7WYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LI7jphge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEUsiwoF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Tc32617315
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=; b=LI7jphgeQRVzq2gI
	LaRfuoXgCoyv+GLDfKFNuvTG4IKXZQPmII4lXxdlYBt6Sp1hUK9m3zCFGWutgkb1
	16Kji+880UZ0wMK98Ogzy8SWebl8XhSdHQom/xFwgRVQBzZl8L7xyvjfeeewNwTX
	ZYkN1PO2eHAeFiwRH4O89zDXqUw0Q/wBfq51TWERqKdHZ8ECTODdlz5GRB1d+4GJ
	1xGnZtkdJnnwiuObYtPMcvwqdffmTW0p1oMZXjvykQnJ3u0UFxqTFyDURw2YXmuN
	Y1pQvKh0J6GkUjka8NEt0j2yXYNl/+ilQsbAxZ92VSiyg7fM+3JbPsMYtyN1Br3F
	tNTIaQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqwad4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:49:36 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48f0c5d20c6so1403419b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525776; x=1784130576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=aEUsiwoFYOP7+N94rJxPrmvRU8raTeZlIhXdH/jJcJAYarQsGZawv1Jsw6xrEZYHJL
         LgVz4Biq+dFjFMJ7pH0KFQu7/w3jZ1po2NsxvWU1/HPti+hGUM/WT4Vn6ujfms24RvZp
         wueQsb8TDTL9ZjEzz3KvrAn/jPVIuQDgVv4JN1NvXLuZTzjp0CJtYCJP1EK+BDdqaDTt
         bM/9dedJgU8RogdPP1GONocgafxpRe/mJeco5zxvE+LduVpgaDTAGuancLL6lG5/w/Zf
         /s/QMVQjG//yYY6/yjl040GCe24E92rrri82crtXXVT4rKZJFEpxTUQFohYdZxuJCZGx
         dpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525776; x=1784130576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=BM0S00mbgFfE0twjLet0RsqoHMPyj4bZHIAsj2TTzid02CTkGx545S7Quh2zpDAxge
         65ar22C1RFvQQt5oPVGtHBNjV8Jm5byKruxN652qSyPxCqN7QEs+RGGD4zyxmnlIbaHc
         8xTOdLwv0WY9o4bnbpcH6ycaZ6+uGarY3AJ0rwhSZp6XCAFfDY9CnP7Qs9kP2mXxaCGv
         a3ILFvIV2mYukFPMFiX/9JwM2hH6okJbP6zWL1wF6b2IU17CnHqt1+Yiq+bXCTPkDTzS
         dcAKYi8ldsgOiLGCgdEINRaqzAHVziwmokJFHu1A2h/8/BAwfUlbJcpUStdpwhBYLC0+
         fmoA==
X-Gm-Message-State: AOJu0YwIjdVPL8//XqFV7qWYcaFsfQ67rV6qSQF8YpONOi1UqPlC5O7/
	0fjR47XaCpF9Lii4SR36H7U6TJlfJtHJzYH7Pu5odeuJDHwk8wT0bZuDVoYbDsPrIXACsEy3Wwr
	DOFOeqn9gW9M3nPs4twNAWIr550qrOcq/YOU4SEfUTaOyx2fvykq78B4z5sRzEJklU2l6
X-Gm-Gg: AfdE7cm7AkKtDpahTwiD2v8N4WFrEQ34Z4xR4O8SNwwGHimW6UtcasrJJ3177qFnPse
	Wvugj/G+dJOhRraf1uYJyrTrCx6izcNa8kjJrtilBvV03BSQ1I79SsdW1tjaTUsV8Eme8fF1mlr
	f+QNZHHTTbsykxrWUhh79S2hXdhU/W3tmGXlMVqFJXdWdp20uq0vcS39PJ9cXE91wA6cxIZTLPi
	gFsRm2jmK4fkmFpqhZTaK6032qGPMhGVrqgSSVx4JKQTx2O7tvyx1Qf9TFUkM0J6wUd80AKU8Fz
	Bj2oiyZOkOU5s3mZkJPpqgqFDHf5s4yqxc3ZZHHAiHQJ4UMgVexZCBqj8KtnpxSFvEw4wFt+dJY
	pOAub6oHpHqk/ipb/8NQcl7UQoIXW2gnuvBzbwxy6
X-Received: by 2002:a05:6820:16aa:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a36d9a0bfamr2346990eaf.42.1783525775939;
        Wed, 08 Jul 2026 08:49:35 -0700 (PDT)
X-Received: by 2002:a05:6820:16aa:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a36d9a0bfamr2346970eaf.42.1783525775564;
        Wed, 08 Jul 2026 08:49:35 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:35 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 21:19:10 +0530
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra_stats-v2-1-beb52f24f1fd@oss.qualcomm.com>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=1073;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
 b=IFQAEUQPS7bRCcTV48BO80qILcvhRzJe03h4RZhtLtKQjRRkz1o4dQvoIMVGnjkjSl2v37nkZ
 XCu81qOEzxzDD34+XZTSz3mcKTH27mYa+sR3AwUfQqlDEmhk8AWS16Z
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXwd3fL49ZsaNA
 CP5TlZBDIF+f0xUXC4qPvzqRKvVeOG1XEKP2p+7uXCwQ2CU3u0ekWVnCLRkoyilGriWHaYG4/eb
 nYljta3wBAgtCWBYzISAXpnme5lPSJIT3D11FciuXsotsU0nLt1LxHBd+1Fhgyv8KK7TQlckuug
 lONRYjRManLby5tJ9XAzF8qXwigDQXCmQ9fMoVuS1LRwntTEfYz02uFRVMWmRWAGm+mD5bjUYSN
 WOo97rd71znJRvO9NxHkRYxOOBLVW+p4afID7FdE/6ramBJQ/cnj7V4zhG5ffUVKXtXUelxFuWu
 MVpj/EL8qCFUlTbiTlTbrxYaCogudI6lL9+giw3BT3Yy2jWNCTcXDZTbdU7hD7VLRVwmQHVjc/T
 HdqICK4AyeJAdg0VndZxuYXbfgpAFkTD1okiuInRkNinRuKaY4UlH4vDPTTr0Tg9ORwZHN6wU7Z
 wX3bK435PDbr2TXLabw==
X-Proofpoint-GUID: 7maOZuNvdwvaOZt4dAfzr0r97y1-9B7E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXy+n0Qdzt2//E
 nOlm5xRwQ8zBi6E0gjMBFZW5czXFT/8mQUDmPU9BZaz3hClSRr45MXYketLC0WR0X9LNhXcmRhC
 TUjxZjxLd/pZ1UAU4djnZMx0yYrvDyY=
X-Proofpoint-ORIG-GUID: 7maOZuNvdwvaOZt4dAfzr0r97y1-9B7E
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e7190 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ejYHyDfMZPm78Zg7qAUA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117763-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27A57289C7

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
in SMEM for Shikra.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats
like vmin and vlow.

Document shikra rpm compatible to read subsystem LPM stats too
along with SoC LPM stats.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..43751115c5b4e2943c93d37d3e27c839b4057529 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8226-rpm-stats
       - qcom,msm8916-rpm-stats
       - qcom,msm8974-rpm-stats
+      - qcom,shikra-rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1


