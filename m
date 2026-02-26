Return-Path: <linux-arm-msm+bounces-94269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBx9Az4boGmzfgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:06:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8EC1A3F59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F2073024172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7333A0EBC;
	Thu, 26 Feb 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arHk/4FQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TL4t9TZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D573A1D0D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100292; cv=none; b=LH2SxrR7k2ADR9zYVNNQ24H9pT4TgACmbf2DfigQTqbBlaNhXDOLP+2XE3KLqQp+SbXrG4JuqDA2IfUuece98ipDERggAZDM/K/nnxqBv5zRIR2D9IgDlne6wH5Q2hiR+PRj1wCKY/ze9PfG7PVvx2H3bfOa1ymqZCra/XjE+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100292; c=relaxed/simple;
	bh=kOU5poz5yLRuJkTd2NcW92L1X+Ukntwd1PDRYso9oL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aqe5/3nT+MwkKh6gz2mqAAR45edp/DwXo+Bi8Gj9rWN+6TDREy23Vt6+cAxGfc8SBHoiurP8JgBrQ2L2BpjeXLS8qnam31CU002glOyq5AHAwpJJht7MBtGzOcvXADu1gkS4+ecqLiH4TwZUphOAnJkzx9Vd8QFZYuPVhQuXffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arHk/4FQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TL4t9TZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Us9e3433639
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BcUk38MNT1oVqnhliDjK+1Sja7B3Y6t5eoa
	JgAS9dzE=; b=arHk/4FQ2AYAmRpe+QXPtAGKYEa7Xi8HF0g588WrdJk9tkUT/us
	EoORwIPm7XCXm0ppT6oNYmucPDFQAkdZVLPhAWebT7sJMEjJh+riyeZdLQYXOxfT
	AQr5z5tsJCf9Wbm59tE7xFon2nITeAS1fEDwgC2/tUxD+QamtHJ3sVQcOh71xdKR
	TN0Nl0eT3wxuJirbBM+uz8o+ANSSdivQAxYv0xCPPgX7HYhhonOlr8NCGodViIDc
	ZKkAK6+rzPOXP8riX1FUbrwbu5IHpcs/ua779OGOw8p61ey3YQZFJJKjuu/hUUVo
	W+2QYS0j1CBX7ZHcq6bZgxB5OaQKosOyIug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0g9hr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:04:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899c3239a28so147181486d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772100288; x=1772705088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcUk38MNT1oVqnhliDjK+1Sja7B3Y6t5eoaJgAS9dzE=;
        b=TL4t9TZZTpYMOiFA46RM2x6C+VXFRjWO1uY/9NDL6ecEzVnpOVUp6R19IauMbFf0Xg
         HQXlWOE1A+x1iii4TmrUKyWuRhDZl1S54VfUj/XRZMcQXkXqcNvQtf+BIJ1M7WQmX451
         IhzH4g0kOZix8tTI4r07CbZ3t5prCPY8vnR835wBW0RITgOItkA02PGHCtajRl9Nji6M
         h0ineapGDnpz0N5kw2GRkzY3RKuRRkGWPU5j1l5slmOmPfb+qDnxHOceLMWDeYj55KqK
         V+i9BZYlLsgA0f+ADaEB7pszOn9XNyLBWC4C9j+QXs0/hQk6/GmyaIHIyTNhQfyk5LXU
         +PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100288; x=1772705088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcUk38MNT1oVqnhliDjK+1Sja7B3Y6t5eoaJgAS9dzE=;
        b=GQpby+e/ZXGUqoDMUOKk+jm57TSjAMghVUfC6kY32ezdYbDfN5lG0kDs8QJ1hNReCY
         2+GpTta6PhApJTODjjghVTFOLM/ZiCjnwLZYX1Mrnldyec/Na06WZS1gIGKz/yS4emw1
         o/JTrv2eyil867SZ8fz0rlS02sAVnPKMwTKBbZzz335vSdDCypkEEaoPGh4HODuP3Ime
         Ny0uOmA27pZRFv94gVS7g8rS70HTy+cr2295isoeKQ9KN8KwdAPbdJ0X6sABrl+g9KsH
         irClIUk79tmW8hyrxBYh94JQtzv6ztbNXebZCSS553f+6aNNn+kTslVC6SQzNR6Ud5yv
         mMAw==
X-Forwarded-Encrypted: i=1; AJvYcCVEJo+vnuI0aLmIkO75bK99TJPW/D+KDn1IZQviAkGfSM2Qx2JNA9VFVjeAuxA8f8nwTO4wLHcTRLUOwB2/@vger.kernel.org
X-Gm-Message-State: AOJu0YywoGRdEGA6qgOgePqjW3C+yB7B9AQCSC8TqbLsqqiVNFIz8cbb
	9JXc+AhEPNLKm7m+3+CRj4NwtEzbdjoa+jtrsR9Z6YgVcZaZY06NA2GO8E8ZPfynzloIzAPf4hV
	MgzJZOZqIRxCr4fPtcr0wk1YR9TWcQa038vbU4EH4QMIQLzySLesjEJaGMoQfjlVfwxZ/
X-Gm-Gg: ATEYQzy5PV52VL29Wa22mx3f2h1+iyIwNK2zj5Fd3FxNDcmyHGG1macSsrcwCRVhaaX
	RvTeCH3jSmzj/yw/2WEKcSdxLyLS02qbO/YAb/QDE7iHlbID6oGln8B3YVWHkgrn68rp9l8Gmja
	9cDxY5DT9psjS+7r81ZCcA4CT61zCw4LkyPmc3jkToaFvTIqlkb9d2ixlyDZGrDampW+fMEMPha
	iQ4OcTBSPeEp406NABkdQPCGEacnqsM9QwFW13hyTX9R5EVhMGOy1UrYvAIaUJzJk1D72lKEEKn
	/XcFt88VKixFQnXPAblob2mhXpyB1xuRS1bWPOyTbwUFFw04aXp74ZFhMSi87tNCGEEdwvmWUaZ
	MaH8ch9rhRrkjk30FHOPMnMbP8RRdfVAo8DyUQ8G8Kfed8bv+gwhViHyc5HPFttVlVVxNuEuCEI
	MzHnC+SNgfsGc=
X-Received: by 2002:a05:620a:3185:b0:8c7:1952:789f with SMTP id af79cd13be357-8cbbd07b64bmr448675085a.71.1772100288474;
        Thu, 26 Feb 2026 02:04:48 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:8c7:1952:789f with SMTP id af79cd13be357-8cbbd07b64bmr448672285a.71.1772100288060;
        Thu, 26 Feb 2026 02:04:48 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae93357sm43853466b.48.2026.02.26.02.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:47 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS resources
Date: Thu, 26 Feb 2026 11:04:44 +0100
Message-Id: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a01ac1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5MSBTYWx0ZWRfX4xFpdErG+OQ+
 w1sxNwhSNce9cvf2UcgT9PL2JMWy1ipBEua0tHs6FTE88Emlt/S/7+zrnhxn7s+mCYM31KFr1pA
 EpgllwLwCMWwIAHBR/eb2i0xlr3vf7U58vrSPXBZdo4lYQd8dLlBCvL6JIbBW0vy+SGK9fugL7f
 z+uY6yFV3Kaqg0/rw+8EcWoYiQnQaEoe27x/cSSPn5ZAdLqEVZkdIZ+Pt2tcR2BTnMaFb8zx43p
 TDSmWS1mryydRk5uBNI2blNGO3Hya76CfAx1ry7CG36Wk/L7EitZjvV94/oZnbiZhQRslrJhNKi
 qYFVTgAxCR0sBOreJvGLTDO8I7w2as5WjpAIZqHW4NkKUo6aJyRZ31eVqGH1oJHoCQFEknakbFC
 5Lzpl8DH+n0NraM1Z0ZXrpxuqyPLVP4uOE+M60ODBWU74njSAR703UCmarGyMaQ5f+laGh8wqIq
 h4KYhb2AdtudPoZFXCQ==
X-Proofpoint-ORIG-GUID: d5T43VFYBtAsUvfj74c7vrI3wOtVir9Z
X-Proofpoint-GUID: d5T43VFYBtAsUvfj74c7vrI3wOtVir9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94269-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D8EC1A3F59
X-Rspamd-Action: no action

Set media_dev.hw_revision using the CAMSS resource version so that
user space can query the hardware revision through the media
controller. This can help identify the exact platform variant and
adapt behavior accordingly, for example, allowing libcamera to apply
quirks or enable features that cannot be discovered through standard
V4L2 or media-controller APIs.

Reported media info on Agatti/CM2290:
Media Driver Info:
        Driver name      : qcom-camss
        Model            : Qualcomm Camera Subsystem
        Serial           :
        Bus info         : platform:5c11000.camss
        Media version    : 6.19.0
        Hardware revision: 0x00000001 (1)
        Driver version   : 6.19.0

Note that this may imply that the camss_version enum should become part
of UAPI.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c16efd62defb..499994775da6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4657,6 +4657,7 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_genpd_cleanup;
 
 	camss->media_dev.dev = camss->dev;
+	camss->media_dev.hw_revision = camss->res->version;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
 		sizeof(camss->media_dev.model));
 	camss->media_dev.ops = &camss_media_ops;
-- 
2.34.1


