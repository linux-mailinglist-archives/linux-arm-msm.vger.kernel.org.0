Return-Path: <linux-arm-msm+bounces-95870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEltCIv7qmmcZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:06:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 562832248C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C56AE300CE40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA0F36C5A7;
	Fri,  6 Mar 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOE98rRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9wEQFHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477336C0D3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812839; cv=none; b=KOnI9y6g+4zsWnVKUfhv93Qba8IAOrrujSD/YPq78biwbjr76mgx1B2IyoX9gjF4s0e/lHjPxMeoNYHKKwf3V3/4SVGgkCNP4MQYMCHqHgGgdW4nrfbZoyvLIKizogTsxglqEJaQwDsKrRxerrc0dBZ8SVVyQYO6RbliMQ1xf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812839; c=relaxed/simple;
	bh=qHw42QzdkbYlWdlV8BZtDYHC/YbceO2kwTKx/pPDr2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jUyUmJVIFQnOSiGSYhpoLRfonwi8VPll4VBBdqGF3FldeHF+wZssE9QKtJ0/WR+SID3GLCMyfDQOW+tu/hVHj6B+7HjUSEBIxukoFx3znCSgL+ELUyTGkhyg9fEHmHMLjAosEayxoWOvWxhHF+gNTNl4oCEC6Z1Z2pTvv8nUAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOE98rRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9wEQFHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrIdg2577844
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kqir2XdaR6T
	WAFYABNEF5HxPRzOmeGXDkGpKShWXLjE=; b=OOE98rRK8x/kbMhcFB9gLRxvENn
	JyVokUVLrnPy4095oCCEbsLzi0+Z9bqFuIxsBdGwR6HRFecIOBx9BA+G/NyGemVb
	522JnLFiXGp3oe+1jF2IBy8dEVwg3g38dlX0gtJibP7fuMJrhzu/XgdKJxpymae9
	kKXvk/X7lHfMDcsF7Wx/n0nDrOPv1kpMAqvFpCrJ6Dd++jdBIk17YdWMDr1J2wLK
	wGix24QEdTnKyv4q85W8NIQeZXguz6+UlKxsdmx5ZNygnpP+b9VLCUj5a/bi/aWK
	BtZhBT4WGCeQv++pYnC2wACKqeFNZbtRlAUPNt2yaIL8zJTskRNeIHVCgsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6bt2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:00:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so5909788885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812837; x=1773417637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqir2XdaR6TWAFYABNEF5HxPRzOmeGXDkGpKShWXLjE=;
        b=N9wEQFHcjznLTkHooqL/esU/0Rgk11dfrcpAnq8RZHEmcDD7NsilT1g9PSg1gfBtFX
         0msM0dBtv/lMVgdl7adlo3v4nzcoA6ViLIB/QaWcVoMt7iGH9rKnnRykKSYUNYQttaBv
         9gZ/AO+BGAUQGwKTaNhpxvVh8CHs4Tkl/kwPKjd/0WHDprLB+DYjSSCWANPZ4R49FQrp
         rmfNqAHfT55K2avmg0K2CCbDqPeuVPQab4yQXsmRui7W+we8kWeZQBz2Vg0aVemHBWQe
         YCibUf9sQUKnv4+h2XmXcJkCZAESXos79lCP15Cl7vc4ZASFqEnpd3OUWlMtyvFuK0nq
         Z+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812837; x=1773417637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqir2XdaR6TWAFYABNEF5HxPRzOmeGXDkGpKShWXLjE=;
        b=PMhioQrSGhDrA0HekiUwrW6akiY4alCC414kZiNWrBzUYuIqhJOS9h720HixkSI+zV
         npMHMBdZOOeJyliZQoByXQ/m21fADnQ9pJD+rlZ3CGogePomDZMYwZFCW2qN2dWPqRIa
         hw9pGz0Uhswsqh6o6rGguMvPot56d+DQxJ+coZRoapm2jbNRnV6/n2ou42roX/VbL1Gd
         1IgKgETj9XnBiQcQbrjEcw4V+LNJEkU/lszIYdeMD6ygT8bDvFmV/E7nS+fGBwSmDhX5
         FYyKcpT5XABslS0M0WI2X0TDY2M83WwJcBeG2Qzs+qDnyWC8QI0t419psw7HFdEFwbeG
         712w==
X-Forwarded-Encrypted: i=1; AJvYcCWwAKDm1F6USWVWZtWV9NCmkQdsyjb6F+mo/o/YXsYVOXPsknTzG016o99XBnF1Loe/w0Z61l6N7XilKZjY@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9U6UMCH4itTYMzTbrmJ1bSTpT+y5DmkD0O3UfJsW8xku6lH6
	1SwuBSof7QGK9w1I33cGLaKyIWLPm+neszSVIs5hptlGb7KZMYYdcWeoXDcGLNFrlIZ/gVC+9Zv
	XVLLq7Z/lw9aXGtEQXTBrbGGKxvxU5X5W7cXuSNXgpUSseuIEDwnb52kEq2oCGINr1q/U
X-Gm-Gg: ATEYQzyHC1iUO7PyIqx7p8H9ppvHMvYB87GtxDuJnx0VsbwloLsTw4wVt6nYsk7eBGW
	VpoWsxQ0x3BBwDxvCliogee2r4G85s3J5TNnvTYD1/W8Fn4GD0lWTA0G87U6AjM85nAaOtkJ3It
	A4RCfhj0jN0Rogeo9j0ThFwUNgwx155Ruh+EI9nsHmH0rroZpk1lGouq6s8gym3kEJkCqEh5rrL
	TrDNUnos8z2SvosKIZiJXeuJtlL3HHD4H6Lpw0PDG9Ac+mP8wG7l86CQ2UmsvgJQMKoBKRg6Wz7
	Bh/25wAl1zoCCkgfc3L/VzkP6oGsSNj0cehjn+pFRLeqDMz5wqf/gm3b2tUFOu+f9RzV1LQ6SpM
	6c6mnJ3nM7bRhkVixyb8VMOHjWOAwGjmlpxnZZrIicBjk8sL9N1FgNsu2Bt00LB7ugY47R0JTj7
	OwXA7zfm5D9QM9RptONgNFiAo/Zd5kz5FMv2AgxRhv4Q==
X-Received: by 2002:a05:620a:269a:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cd6352e2a3mr721341285a.43.1772812820689;
        Fri, 06 Mar 2026 08:00:20 -0800 (PST)
X-Received: by 2002:a05:620a:269a:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cd6352e2a3mr721251285a.43.1772812814706;
        Fri, 06 Mar 2026 08:00:14 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 3/3] media: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290
Date: Fri,  6 Mar 2026 17:00:06 +0100
Message-Id: <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9XouUm1zKhaL_7O0tASjDvsX24lwvNiH
X-Proofpoint-ORIG-GUID: 9XouUm1zKhaL_7O0tASjDvsX24lwvNiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfXy17swql4jHXc
 c8fSCgeGmZVrKiYyBXgMk8LCiqchwl7SnI0dmAG/bxF4mhYIfl08kNmoaEVy0vo0sIGqYHl36ln
 h856AdvndwNF7NjqsGGqQ4KbEOVM+sy7TxvLXtd2zeZ0fTrmE1F/KKmMFcA1pnF/JPBrPKnMJtS
 e3CFExfQtB7wU9vWFL6pz2xBQ8nnw2K5NJnOc9/RHbDCHU+mweRy8pIRUp+ceNKTbxI9tYNxgVq
 OX+VTNJ6N9d7CoiMSVbQR28akqJP8eTV6V2SRbeXmQSJJ+4zXL4gHaxk3W6w3XjCMqFgUSciLAB
 6SCGnhdqGOwjoriofunsV1Cs+97bo9lvPi8uXobJD2rCKIu6j6jV0UJLmibEgdK4/9X3A7fCBC2
 MgzPGS8YYF9q1/Hu00xS+cDIjvlqekNUUeON/o4CcA/fHk9ISbKaKBJ9Nojm+DMVpiST8RU39hn
 HXyyqshweW+OhfAq37A==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aafa25 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=d6NsCnqxkaT3_V1LjFAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: 562832248C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95870-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Split the VFE bytes-per-line (BPL) alignment logic into separate
helpers for RDI and PIX paths. RDI is usually aligned on RDI write
engine bus constraint such as 64-bit or 128-bit. But PIX engine
is usually (at least on platform I looked at) based on pixel format.

On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
alignment must be derived from the pixel format. This allows the
pipeline to use camss_format_get_bpl_alignment().

For other platforms, retain the legacy PIX default (16 bytes), until
PIX is properly tested/enabled.

A future improvement would be to remove platform-specific conditionals
from the VFE code and move the alignment requirements into the
per-platform VFE resource data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9c7ad8aa4058..c174c7d706e2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static int vfe_bpl_align(struct vfe_device *vfe)
+static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 {
 	int ret = 8;
 
@@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	return ret;
 }
 
+static int vfe_bpl_align_pix(struct vfe_device *vfe)
+{
+	int ret = 16;
+
+	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
+		/* The alignment/bpl depends solely on the pixel format and is
+		 * computed dynamically in camss_format_get_bpl_alignment().
+		 */
+		ret = 0;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -2085,11 +2104,12 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 
 		video_out->ops = &vfe->video_ops;
-		video_out->bpl_alignment = vfe_bpl_align(vfe);
-		video_out->line_based = 0;
 		if (i == VFE_LINE_PIX) {
-			video_out->bpl_alignment = 16;
+			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
 			video_out->line_based = 1;
+		} else {
+			video_out->bpl_alignment = vfe_bpl_align_rdi(vfe);
+			video_out->line_based = 0;
 		}
 
 		video_out->nformats = vfe->line[i].nformats;
-- 
2.34.1


