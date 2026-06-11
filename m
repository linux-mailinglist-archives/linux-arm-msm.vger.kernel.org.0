Return-Path: <linux-arm-msm+bounces-112732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qTa9Ll+cKmpLtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:30:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A955671557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:30:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KDW/fS+C";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dFG1qcpS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B09C43250B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A94733263F;
	Thu, 11 Jun 2026 11:30:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2222B3E3D9C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:30:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177411; cv=none; b=ucs5YB9Qwyyi07N4iunfmukuuOxEW2svXcVnFaH54DQeLVYzmcqTTalVxiujBxw2+OfK/89XmxqkXAQdWIAt1EqCcUvzbHUb80FSWFstQx1uAcgTiQfoTswvGSC8H+7MI5tY8n2c6YrZ6IVeiCtBuxa+RYHt4EguODrTiS+VZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177411; c=relaxed/simple;
	bh=DFBGBI+Fb4TWrbyw8ZhZzKweTDZK+wYo6QnsOwCN+0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sspkUBsWBuSV/hM/pZgp8cFB0FHhp79qn7ba1LcGIGWfi9/WxUyL1W/JJOUI+6TKSw+IKtqNuFaMuM1bSNL1Iid0kRiNayJnDeBZLaaDzatan7tj/VjJm7Aea7HVTB6gdr8rkuZMzKoQWrk+195S4THSm7h3UOKqVJBwuNkIUEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDW/fS+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFG1qcpS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0pB8303967
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VwDoNWR3cgc
	GYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=; b=KDW/fS+C5icZv8KjpUzm/iddFJQ
	VHXCmCrIXb2+5myqa/5XfktpZoaAtWKEiIbPq1Bdm0nTg9X3IZNL+uxMR0U0HX/U
	SWckIWBn6P+iEz6sLAe3XcueGqjRRBAX0/pV1qTCuiLsocAzX11m3v37yLucE3gD
	kjsxtFAyFCe6bJ6FmYcdvEWuT8FHSBMPcY4nz5F4RQyC5iJPWHo0EtczrEJItII/
	iHLsa4EjHqLeHMWO5IMm7EXTj2pGvwlmcBXq+d24reEibbwDH7NQINfHm6bI+UP5
	pmlc8oMGDB9Aj7dLkPx0qhUj2SxfFAtzYusR1/DdJGSzrlJJy6qEeQ34QRg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5geuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:30:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f3e4728so5323220b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177408; x=1781782208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwDoNWR3cgcGYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=;
        b=dFG1qcpS2cEjoCqwMn9uTxRkc2plmV88JCeQaV27/Ek32UARQnq0w/zPTRexbJ8VNe
         NZy52SUrG/nK664SY+avM64cuy+Kvn53Erte5OlYqY8wbYlw6PkVGWUqKv9XeURoc2VL
         JQJrf0zb9itWmBWC2F8JkE7QE58/xwAh9a+O3l6beyd65f0cJojmf4YM7m8+dVB8OURx
         cd1nV499qhkwq6GYXRJUn6zOQX3Uu5YHQHiCvvIRNHKAA7rwZbq+YcAjpK+NXEZe96ZH
         Y96PKTJPCiixfZH6f8jERemEsI6l2LzaiNkVwTp0EKsG/CFEdz5vObpiRbBe5zp7R82Y
         W+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177408; x=1781782208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VwDoNWR3cgcGYWF1y/EBG7TuspUZSqg9iMmNPihXvNs=;
        b=UVrop7pklua95UGm5E7IIBCLyKCnY3Jla85tOiMpIPFTyOb1FqmZKD3VVuUiKi38Lw
         DezS7zSI1IdYWfCcINtQagU0vn5M+W9gkkxiPUv8mxsWwW2xuB9HUIto0tqBKMo4G8iC
         zBUgFpt/VTXEvtkp7R0rTTDifBRuEJsN+6z1d3o40nM764PWIorwM6wo53FD0leNhFhA
         mtsamRq5dy+dh0ZrzgCNsZBsMVRBQlPrPwtsOtW0+ITP3wx6/i+m41lDpsCyw/9ZOW3u
         j+0ReHUl8W80pm+8i247XPbT8b5zowka3ScRKsqpD4mKA9p+OwsTtZNJEyK40zaqcuhc
         4E2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+PxeIC46ItCUpP3Y/omQPMLE0hLic32Qb50Fh0Ed9MT+QIDd7Tfe4IZVnQNHmU+46rIP6ZO1KMcMBtI2wc@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTj+JQyZ4yHihI08DINYKsMV12b/+UOjU/bdp4iqbxLb0+EPy
	OOZRbIK43OSNiJxLc8KIPtpPylBYDnjE8pCDL9DE6sCCLIQcsAtUyo9i5wWfEatHM80xcf45E1y
	re2cozl2E/KxV3P/nY7Rh7FPJ8EcLer/1cM+ojBHHCjRIAnQv8F+Rh4QCH6o0OaPdYuRE
X-Gm-Gg: Acq92OFe73EffL+YVD/tsv3jBDgB6Ksf7aJfx09JmQh9c2Os8ESEtW8uczXqg/vaIqB
	mIeuKl0VYrL31NlImyxU4kSlTBqefRf6oCNlLpbKhx3G/1rKAtp/q2Z/HEvv4t/3vHEYgRPD0bl
	YVD3Dkk42dH/DEkX76o7hRBcpOz2AivUmh+YKgXG9ej4WHJW20/8EJK9HUS/MZymCOC3HUaOIdD
	l5A9rBVBzWYBXVpo7OndSfBvZ+DJ8cq7R4sQpH0XwyITvbMSZXrFYqngtUc0QP36aCW3wc8MpA8
	VXRKHNNaf79cgOLEKFu/+nFJ0/HgRoqu/Lb0zIL9J91F6aKLue0U/yaOFfJ1dZBZ6B0yNMBYQ+z
	pDsWN8euuHMCebfUsDGGJ4I5A0a2XVBjj6CVa/IjGVevJygbBaaUbueldbZf+
X-Received: by 2002:a05:6a00:170c:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84336aa0882mr2718004b3a.33.1781177407352;
        Thu, 11 Jun 2026 04:30:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84336aa0882mr2717963b3a.33.1781177406887;
        Thu, 11 Jun 2026 04:30:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
Date: Thu, 11 Jun 2026 16:59:45 +0530
Message-Id: <20260611112946.954172-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX82dKoV9HPD6l
 RI3Qeq4y74xFNsAEHjDlj9/BlhPXQx9fKVAm3VRlBmXAo7cpubNsfGPbAu/sgPdknnOiqF94SIg
 EDR/dKWIrK5zT5khAm/WDISZfFHtVe4DCkifzH1EdXUCGvAgoj5hAXEawoozLX/gfxWlBfdPsE4
 82FTQJn8tPk3OW4IWx9ghE2OjUvTzhCZz10R++gwfQm1oogZ2liID8L6PIhomyJCoph7OeqSFTp
 TRnX4Qf2Afc259+Muk3k8ne/HURwN5MlfukxJM/wfoMQJ1u8PAtVtFPriQbbAVzApWKT0BQQ1R9
 WOIDYLipJAmEW/NzX9KukOijUoVzCSv6WqGFKcGhIhIgOC0DEBx0LpKD+Tsn4TfQF8J7/j0wepd
 1+t0yh/1sHNhCWjkY8Qf4VeKWHyaHRgwYb6rG2aDF3TTDXLL5h+0FjTWH3selgyQ74mP4gUcM/p
 RdsF6sp8fjBw/EgGPXQ==
X-Proofpoint-ORIG-GUID: lMuydvDaxe0r-2RrVfvTI-c9HCqqrDmc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfXwcyaeKIvOsI5
 oFOAaPnIArrisj/HFGuKUjZQs81ZjN+SmRPKMFLr6ho6ijGm1N11yXQ20Gcz+qvcvA6e9HWdkcv
 fACd8QbN13XdDXpzQR2igBAPiSpf+9I=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9c40 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IO9S6bmGf6N6HOI-BKEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: lMuydvDaxe0r-2RrVfvTI-c9HCqqrDmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112732-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A955671557

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b..c5c7284bf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -45,6 +45,9 @@ properties:
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard
-- 
2.34.1

