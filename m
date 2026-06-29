Return-Path: <linux-arm-msm+bounces-115027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CDayEKtjQmof6AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:23:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0CD6DA022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hpl05WiU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UhN3psH9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF9630B79EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA993FF8B0;
	Mon, 29 Jun 2026 12:18:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A93FF88D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735483; cv=none; b=QQdQGMGhTZjfn2jOZ99+lZWYksM/dZNeoGMnJOYZJv54xS80tjk8eexyBlRhuQ35ILTK6gdD1CzJG3ORrpMy3fAqaJerVsJWLLP55JBKHaFs8UKdtCNkA9ND+bFAQtIOxsBELoFzS7wUi8OML7kmDw8GU+mqxflDuW/7p8IFgOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735483; c=relaxed/simple;
	bh=YPiRE++Xk9WeQLGVF5f+RdDBM3jN0yGaf8JbvVGMio4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jyqd6e96EyuTut1FHn0JTwihoKH5nOxZ6i69HIYMK2z2CPmHcWGGJssdnQOdP3bFwFH0S02B3GnQN3dUYVcG4Ii58LzN2DYqnuZF9gUeHWLr84lYmUMEExbCe1L6LH19NQs18870rfVtfbp/nqTP/dCUVQu10kM7++V0SWHof/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpl05WiU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhN3psH9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASper2601110
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aIwkYnmZmvU
	g15BijNLEtvo8nMrIKYTbp3+qEXthK1w=; b=hpl05WiU7t9GhJCD8c+3RS5yxEd
	lRl7VODxVcxUw5QaDtQtjHOJqR9L+PNnrG3vxdCUY11OrvwYA+foHknROENAjJdM
	G0V72KDu53oYbUibpYrkJp7soMKlf8cSGpLuWwFsqJwkVC6ElHPf8fUBfpwe+1Tb
	3OX3ZXnDRhjFtP2BqFCDXb2pTzKyqJFWsfLmLexOxwIHnuy3iDyTPvw6xhBJ5B2Z
	XUOAl8BMGEJvV42pZHy4zffstCUeuScSJG+RrFWYL3AglPFPlmoSGu5cMeRuJ51N
	Q8TJPDSV567W8VJ+T/2an+EDcQnP9ra6fyXM/SX4XL7rJ0u73SmwUcQNr5g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8rbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso2046267137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735479; x=1783340279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIwkYnmZmvUg15BijNLEtvo8nMrIKYTbp3+qEXthK1w=;
        b=UhN3psH9DFB2ndbutuCHUSgqLfLlJJdz2ktOdx4w9k5i7tYB3KK1CSqWcNC9iYS+dH
         df8w6SQxKNbHFsWrNm8uB4YiaujU9fOBg72w8qimAEyoxa2qu+/a3/AK9dEaFbfqv+bZ
         lMRx1i5cGrW+veqUitCApBaens0kiERwHWzj/0Zwp1vAYgjTwm+FMLyj+sUldn1rFUK6
         Egyq9SZ34LH778xm5WiTmXQlG4kUglZU7sS2spkMuiDW4vf5BLXibISMQMBzUo2xmo52
         PyUAw0x3JDaSFqpYjlfOS7gXb+OpzxfgWd+iyw0GXXjm4gZllS78FarTPUzEd9KL7B33
         6oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735479; x=1783340279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIwkYnmZmvUg15BijNLEtvo8nMrIKYTbp3+qEXthK1w=;
        b=S34OlBhSe2sfkeK8kH0+tVbkFtzK0or37yYkqwRIspELFjoUjKbZGYRADIuJURcvQN
         9Zmh1Z2Dq/vjo5Wr6zAHglSbXfJm4RDKPbD25Cgsxn8fwHqdCE9zH51nRQmCD+Vv7hW1
         FAY2ozmMw1KlZq/LXskP2UJy+4OJhVo1gySOa9GI/mo2axb/YOvKW176Y2aQ0Cu2FLZt
         ff90SCHRm3WWP7Sgoh7kz5wPeqw46tmdIWFWipLHLa6zWSLM3iuqqVPXkJVgqbZLsQ6n
         6xq7VmCbMxDGNGax5CDVB9FjEUWs/5evtWoIpMYt7i3sjothghln18lo3cExYnSxTfrp
         pfNw==
X-Forwarded-Encrypted: i=1; AHgh+RpzM0I2e0/588qhOvMEIy9IhXoKfC08p6JjNUicOrx8u1sUJVxLEB8HGm3MNSIfq8c7hfIYyrsBL0oh3STe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1RazOW0NdAv60qjITLHXYflKdC6a4+Qw7PaHuUd7UoxJxySa
	Y22+i74bz6FAKnytnesb/eY1mXV4ICtuUr71xBqDo36rWpNMUY5QgnMMtaheafCTLzGZktYUo7i
	6ockJp+Qi7Hw7wzljTHyEenyZoIhHAwUcgmzOlMV8gt73xuE2qKhjrkPshOQOBpF5d2vq
X-Gm-Gg: AfdE7clBjYvXnJZS/qMs18fsCmFeZlFAHi4ilQ4vFBekoYkXCRYiPhgMkw5Hw30dSNs
	awSp5/NPVEVYyyl/GvHJoaFQcF0DZEudv1Dbl2iM3mIDsNgTnaaijOoSSV03k4vCvewFtksZJrH
	7JE6EuKeSBtWI8Cux0me5TGi69BNzEgmQB0QbEHuRcavD8nRIkoujXI/WKXLQwsSfQ/5DJbrTfS
	/oSwSqR8jLlqltc5ORiFfuXhjLYHSaE9TNTiqkfUVspnLC8oggVtbLCOZY49HsLJvqC2rXfwhll
	aBq5WlXpCzxGvWf3+huWRhoGWyN7nsrqF5Vny5kQhUj8+uew/j2iL2WLI1H0l6d/eVhRRggUA/Y
	nB1g/LL/XUruDzDC8z5MmVsDryol2erdosEE=
X-Received: by 2002:a05:6102:c4d:b0:737:2ed4:352b with SMTP id ada2fe7eead31-739f9922697mr182168137.13.1782735479235;
        Mon, 29 Jun 2026 05:17:59 -0700 (PDT)
X-Received: by 2002:a05:6102:c4d:b0:737:2ed4:352b with SMTP id ada2fe7eead31-739f9922697mr182156137.13.1782735478825;
        Mon, 29 Jun 2026 05:17:58 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:17:58 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 1/4] media: qcom: camss: populate child platform devices
Date: Mon, 29 Jun 2026 15:17:47 +0300
Message-Id: <20260629121750.3469292-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX0Krz4vFwnQDT
 KklGRPoCWgDY3GQ0kzpdbXiikpJYe16nD/H0doBjHtgrrDCBwr9DS8z3oGOXi4cVQZgnfmTiVW4
 AF1FUvBnZb770ZTKjJKNdYCPR2GkmRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfXyg4npqswaqRk
 ju+mfaqmGNck9pU9CPuGZHUmkjxXfky7NMR0YZMNRW//McujlVKmG1AjICzw3yZKryyCcs0t0um
 dbremrZ84jWx84ivpgGn/cmrWeMRVE9JopMWMwIV2qwvAHEO8kEtDhgKyM5Ten/OXiUk1GlSczB
 OIYkHsuHQjbY/WfmVSHpkDhFwNci1ImDiuZ7GgQcUt2dkUnfbsRGUK3qX2P7d/QABeLyYmcGxI6
 6R166VXelacBhlN0RA+A5WGm52uVSw6O4d4xIbzAk6nSmd69QxRdp49kvuTWE1Cr8AwmfaA3E+y
 b2Cqr1LeSqJUha1d0zQW+MalpY1wdzX7YPBpmU0FwKpEPBRLjkuYc7WZUxehTI22rt9aVBJFP2L
 Da9GrnPkW5YFZZ0tMV8DsfYr+lbhOWpSE2dAToqZeCCj/fI0WRDlT3DY8b7lBCQIJiI7RvUME2Z
 71Reb8BGRRRgzrLRZfw==
X-Proofpoint-GUID: d0C4lF85aLBR_g3yU7Zy7X-2Z_97uAu1
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a426278 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=xq3W2uTSAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_YjTttfaR3rWa-AA7hEA:9
 a=-aSRE8QhW-JAV6biHavz:22 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d0C4lF85aLBR_g3yU7Zy7X-2Z_97uAu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-115027-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A0CD6DA022

Call of_platform_populate() at the end of camss_probe() so that child
nodes of the CAMSS DT node are registered as platform devices and
probed via their own platform_driver. This allows hardware blocks that
are physically part of the Camera SubSystem - such as the JPEG encoder
- to be described as sub-nodes of the CAMSS DT node and probe
automatically without any changes to their own drivers.

Call of_platform_depopulate() at the start of camss_remove() to tear
down child devices before the parent unwinds its own resources.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org/
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..d2ecc79d5269 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -5460,6 +5461,8 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_media_device_unregister;
 	}
 
+	of_platform_populate(dev->of_node, NULL, NULL, dev);
+
 	return 0;
 
 err_media_device_unregister:
@@ -5497,6 +5500,7 @@ static void camss_remove(struct platform_device *pdev)
 {
 	struct camss *camss = platform_get_drvdata(pdev);
 
+	of_platform_depopulate(&pdev->dev);
 	v4l2_async_nf_unregister(&camss->notifier);
 	v4l2_async_nf_cleanup(&camss->notifier);
 	camss_unregister_entities(camss);
-- 
2.34.1


