Return-Path: <linux-arm-msm+bounces-116587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R49DEoWzSmqCGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:41:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEAC70B0F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TLn6zhut;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IZG58Ff4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41F853008D72
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558083A7F4A;
	Sun,  5 Jul 2026 19:41:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CE3A7195
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:41:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280488; cv=none; b=Ia8C6dm9f8m3b9ueNUt1xiQLYyuuZ+4XuNDLXgKaHbMliRVDabOCNnhGQi1/xFzlCGJ1kNhaVJr63d4swF1Um/wM1M9GJ6KofhdZkaHT5teY6sdjRo+6bZs40DsFzfQetaoftCfrVPU248XgkHxgOyLVAQZFtIQ0PtmwB6n1FsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280488; c=relaxed/simple;
	bh=GVKkJosfWbaAfOvliUHFeY44e0c1PSKKGH2GQjW/JNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoexCSu5gezKOtkTjO6Fm7PvZ0vtCkKRjW2yUBBrI8mApGhtLs1PxNYSvFCQJYMBrdta/WPIJVpPexMjk2jz/n74K5nTM6WMB8AYzR2lcBPCV3uBn5S07m6jrHXQs7VufQJWlFKR9xLyIOs55vd65ULdGyPI1kKO33HNBkQHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLn6zhut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZG58Ff4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiVJF2201609
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek775-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b719so1526548a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=IZG58Ff4FSz0xPAqXt1O0zOxFaAtOJZN9IWe92nAwZiPZFjlqg1nbrFbHttEcUNU9h
         6jNoGhV+J/yNfrzUEPILSBDguBszwwFjfNnFc9A2XxM81pxpNopJp3YJAf1MD5JDgCEA
         qc9jZ3IetpNBJ5FteRGNGtBCi7ieYp/p7vcP9Djop8UiiDtew+Pqv+RLVKdAcanrSLVR
         ax8sD6c2p2BPl/cpPFDBJPPaEdKa1ueytlXTK7L3e0Rs0hjwC/qmQzpwmotWY1vX3x27
         L3Y9n969UKSZ9fVEaC9VZjmXEyIueej8S7mRzFuGwKDKJW5BD0apojcOkpFjRLvynm0X
         Hudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=bdXlbGbzrEGU9g/oygeiCBrWWtRA0iiYy9EuOf0brFpurYJgNz7E/0EPzIpPAUtqSI
         kClZS3wz/V8t4f0sdaMIvoeIitVXIOCrntGXaGVxOKcuECcnJnWAvCs2/8bAEj6wCu8d
         dPnrwPcPe7XFijwuCfwx7WwD6o9wYODSA3JasWzRdCt4Wdizjd834Jo+PeGifmEeJErZ
         dHfR8KudWfxlRNDWnPq4p9pIow2+3FbcY1RXuQccDZBcW35MGQ25kZTp+Q0cVnxH0mUA
         hp9TOKte2aXStu8sm0Oyvl3h063lz3+1KPEsS07dRGJCUcs4fAzTF089Y0eh6NT9XDzU
         gMUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLuYjAksd6gjgK5SFzjqZZarSSKNoT9JQo9dTIKIN+r2tWIf4t8jYNImvWBEC52EJmrgkJRZ97huLkq2lj@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjEJ6ZkIfsBEXWbEaQmz7EW9qV/SCIET1XZkoACHSiQvhwQuR
	/r3N/uziVdQgvon440RZ6MatgXgeZ0/eZeMt6c3Rz/pwgynBXkLYMWE2EJx5/8bLUAWM1KIyxVq
	SXz1KlSSnoDE9Tx5QsgMwInyanTqOAM5xnRrzJAWwK5z6QtmgH7PnbmI581ZvifIsy2Yd
X-Gm-Gg: AfdE7cm/PcuDx0StKfeOGBEsoY/WPF9S3zY+5AuZmp6zZW7vdEIb743bjms96sL03D+
	2HWUK3c/qfebHdAsqBLbUkyY70P+kRLOUoTBXF2w1oqwUqPtIQWSPEFXOFcNDyX1prdxdr/nTZ4
	GO+rTgv4g5JeeHMkwXURIVAsksozb49KB80hdpFmf0tnjtIv92tXwR9EcjAR0cvuTCRqDT2ZZVs
	uADwZHCLJQ8Sf/XyiUPeX2SSmcm1wDD5SoTQQqLjsybupsd46x7kV7L8Avu5hruseWaSwrHx6fo
	ddvmVvAMWHlKGySAOsL8nHKyzurd6be3lubrIqtulZhqo2/KvNf7Ahs71xaUDsZa/L14q2GB2Tr
	bVZXFa6YW0WuTrxKrkpo15YDdej1gScRNNBbbPA==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745232637.15.1783280484466;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX2uHsrUqV2eHN
 zNvWdPluN9Wvy4ZTK4/CIcAcCqmrxfthP49sOwpkCTdC93mOaCeIqJ/qltMTlA+QLhcer5VyA70
 xC3BwsVjIg3evBk1/12lOeJogUUnIjk=
X-Proofpoint-GUID: _RnAtSJO1jHkncCCmaoEbU7YMOyj4V_E
X-Proofpoint-ORIG-GUID: _RnAtSJO1jHkncCCmaoEbU7YMOyj4V_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX66FctvC5O0fa
 bsU5nQGYMtbkvxvLEjJOH2zgLYJcX1/gVs3O0LU6ig10IJxAc3jTeWzBnJkFqAQWShMgHrmM8/J
 tbt3h7ZlD7xsZG0VQf3O2fMDKeuDjYZdctriBC2h/b4WLADMvP/4VSB8nZK9qVN/Ul5jTrFVXUT
 A55WECofMDgQANCxM0J10IbesFhDyr+q1+qA31PJ/Pq3PPup4WuzJz2DPB4EPw7PQnIDNbeqf9H
 3aBpv3cztc0sYDsIMMiiyeSVEd3a9630+8l2S9p4J9NRqOamVrscibz0QHYUy2qodsY+ohqOyhr
 SdfGB4gY6wM3Rkzz+Pne7yYwRXeOToLD54Iio41ba1mp3eXzqFulNszBQxgh1ZoBslWd4/v24x+
 ohFPXNbfNGF0a9/dJy0HRgQJPxaX8ZxLpzwJIVhuzZrhEgs+6kD6Qy8Qb4CijM+X2B5nKp0IBbJ
 Cn+ROg/8Y2geENODVyg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116587-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CEAC70B0F2

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0


