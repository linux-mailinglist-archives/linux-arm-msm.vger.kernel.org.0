Return-Path: <linux-arm-msm+bounces-110295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGeKKKClGWptyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:41:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C09B603C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 018DE30856E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F125E3EBF01;
	Fri, 29 May 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfPDRtQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI0OTkJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627D3E63B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065483; cv=none; b=mRsPRdIszRxIfPkYSfij7hjOkp1b1iCJggH4xCei7B6SvZweFNGK9+eN+60DaeeGQeAXit66S5vIuSoS0tNbmRz+OKHB8K/qrX8dEqGeW4CqH7kvUhecbMwDzNKgyXn22SNvc8yPexiScM9qCAtswN/cAsWgbP05PzmkBQqB0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065483; c=relaxed/simple;
	bh=r2fiEN0lX6+xiJIlqbZ/NyYeWC2GmPUInxLRy8wHsQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9ZvebmuDZBhasJIiutTxuIMNgFdRbF5zxx7n131wRq+BjZrZ4jXyhSLi2oEQVaBDTf2TRNTQvh9Mj4n0afdR/AMdta8WwqchxV8Amh85eikj6qAqTjpj3HUXUqkgCMbHLZKNDeXBb0VKKL6g4o5ps7wxKrbsCbOX8n4zUTAuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfPDRtQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI0OTkJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL2os3249547
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=; b=MfPDRtQTH/Xu604d
	ueoXSptQbqzX/KJh+1NR+JgpPbyRR3wC7Euf5/g1Eo/W2D9PT8MkhDcZ3RxlFLjm
	oAfk5JwCr2A4hP5M+jyMN8g3hB00QDB+fyYDnrAzjtQQxVv1qILn2iEmUm7u0dXk
	af4olwCmG1L0UjEIcV+hvGmiqPzWUO3M3SzibS2uowkTVtc9Bk3yNCnXm5+Ngh3l
	xynJWJnItlO3k6QNdj8eBQUOUT34wczj6/TGIJVIG0055tic4vtgbitJCTl6yMus
	n1KgIf151uXNGWYgMgbcK1neBLrxicDg7q+hM8Y0Nvr+P4QN1XdLpGcfxP4weB+q
	prCU3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015b46s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:38:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso159669715ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065481; x=1780670281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=;
        b=FI0OTkJ9dB3fM1RHSHzN/eXvhrApsQTvdg4xrgCRjKLdXAwmyAcZBCn7o5qxZgF59a
         cMrDkKaPAuOuTWWrkG+TK0jetwGemEv3/AjbaxIrEMkPbFDYlWVh+gEcWFjScsN1fMc7
         jOkCwlqJi1ENl6lxkP9cgZUBeDP4DIsUHlUPZ833dyFxyfGkRbyeK708tZC3koodVZYQ
         xdko1mvXRj0G5ocq6sGR6bgZNu7IN1kIlAfcUrtJwMK97oa6YC9ZGm3v5pJbQCVcUf/r
         Gv7HJVB+gQ4/T1qY4ZXwA/CDd9Bq/hkvDfJFzPZRR3du/6cDTgbScswJCf20KM8X7XA/
         BeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065481; x=1780670281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=;
        b=rK/IDGKAMlA/zZyVN/JQrWCxfcDFmWhRyukO9G8f9lFClhkpDg+YfDqYDggUOMhgBR
         re9VwlZoaxyB1B3xTNpPgmDAecd+k1QY4XKyA5hnvmBNx8+HZeDPWBeDHDDv90LVoSmF
         ufITPKpeTdRMQN6ViXFP9Tl5NaiyxdbAX98cG2nbE8TFpCBY5vPHF+SDvDIWK+/FTT5x
         67zxjhoUOAxBiepJc52e6/2bol+jPoVt7Fploh2LzcwbNKqOKnQx+Y+NepLE6D7Cw+UI
         /XOdewHNDUrUJPdb2W5VZ3kucwlQbP+g2xJgvpLrYYSPLksCug3u6xx+zOd4K7diM2za
         XYDg==
X-Gm-Message-State: AOJu0YzZHuAPSqLLUQfFtTos71C3f1tevNPTP0EwGPvtd6GCM7rXslKi
	UoGCC+EpDVf1Cr7nWbVA2jlrzFZsronjnJ6YXe/UkeYwPX+7Rqu+LWGqjU9iTy0yT1/D26sHBd/
	W6JGCx8h7BTvplHwf4ZlQZWVTg6Su406/+oQ4pn5iDV2scq+tFjB7yzkx+gLI0pwn/X5Ro+RTUE
	nE
X-Gm-Gg: Acq92OHu8J6gZ+twrRI4VG3yAwPESs/9qbzOKf/ddbkFAyvXvEKGZxS5RzDIbhloftS
	5oiDSV/lstBZY+Q0UiiLdDRB4cixE2f4gnfXyrKzWQpw04H/D0LgZZfcDbKeiRdHWZ2rPaKaHwz
	z+0+QhIQUSQHti8FQjFFtevkuto7UUGdoXh8+XLXSxv0/gieBAckmji67ObSA2PqZZQVwUQXC1W
	DqUYmhF7mNohprlPW+KaZ24+HgLfGjQcjNsUHqCu1Q56jMfBzlfx+npGiuorMLW/hv2tBEUkzRj
	NjymIn3jZoNw+0/EyCu+aww/FDsVY9bs6AZMyeD9WJjMlyoNbs3Qjux+hBii0WRdcsJLqVSfFRv
	LhXoZuggtT6IY/niuuex4gXrfW/+7EqUqSeH/N+JvM4thoVCTXWw6RhY7J3n4b/uyZA==
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr790705ad.22.1780065481347;
        Fri, 29 May 2026 07:38:01 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr790235ad.22.1780065480858;
        Fri, 29 May 2026 07:38:00 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:00 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:22 +0530
Subject: [PATCH 2/6] dt-bindings: i2c: qcom-cci: Document Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-2-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1050;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=Kj0qls3u7hmCqRFLqXAWh/BtkU3k96MxexEBHy6KH/k=;
 b=4G196P5UMnVLRk6IVeIsblLJ7Iv0JI1avhJeXvy5MumHY5XqZFCWsSHS4jdJ5lwUrDTvk4h57
 XliJ3VwUzn9CLdi0zLcQugqmWdTBhUYBPauv31yda9wrKxYiCSgPa6B
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-ORIG-GUID: r2XXAthZA0VhVVzUYmeXbje1TNyKrevc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX+aqqVeI41djY
 E1HLTvsJJJYgqADFtWztwiqPPrkQA9jdAYUiWPmGRV7gbUdn7KE4vi9Dm0/AjJ5G3i9owNBXtxt
 KW8NPd7mWz6zFtSWhl8FYpuCFvGNz/1zhdzmR3gWulu24XjdZ5x52cwVk1ZlIl7FANxc3XXTI4A
 yVUziK/8MExGuaYBjgWbE/jZDKmteyfVskt+954ye8WYndrjO99J5bMg46PITF7KzoMTIhYoh0M
 TiL8L1hDtWTmKwwpHzlUbkvfCbC5xhuxw+/owDnDxXDglmPFbLBs2XRBU3quokQXDZxCGLCwg32
 MeNmN18MbqSTdUrQ1jRvE5Ibzbjn+XVW2w2qr2FO5Nh7k2onj8t9WmI5ax6CLyyJeIX++61ZROB
 PgB8AJ8r7COW+Xzd5ENqL406Ihe1DMVvgZYFvfJPqzg1lNw3PdPDKNpG4wmXqu8JprfqrXOythS
 UJSxIhBjoi/vkfwGp5g==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a19a4ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: r2XXAthZA0VhVVzUYmeXbje1TNyKrevc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-110295-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C09B603C59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add Glymur compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1d..53aefebc02bb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -134,6 +135,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.43.0


