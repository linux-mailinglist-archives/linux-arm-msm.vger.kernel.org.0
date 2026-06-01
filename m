Return-Path: <linux-arm-msm+bounces-110573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OxHFHRvHWqWawkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:39:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4161E701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4D983052478
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86936355F35;
	Mon,  1 Jun 2026 11:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkbJ8Sh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdUQlsCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF62DCC1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313558; cv=none; b=BWZ//N8D36sWi0a46zOyXM0YHmNk+uJ/UQNQ2OiOcroSvUZxnv1ANT4z15XhwdlbGbU34nZYjxmu9MQb0dpIV1nqRGNiowIi6FhywhhLPO6CSw2Wl0YXlY5C0/PKYUKvpx/vYlKWHy6EALABYuosU8+2B7bJFpHcjlNtzK5NmDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313558; c=relaxed/simple;
	bh=C/oJL4OXMPAkCHROnwSUjkyw0/H3oVbBhabNzweM3CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjQ1I7HZeNj/aW5+HrufbCWg1js6bTXxMPEzgNGQCfXXrMO3QXx/cUTJWXT7wPiaGtBBc/RXJH+1nI5FvgMxNm4l7uFIAjP8BLdnWowWMdrjB3mE6JhOdR95+GFG0Otdz6+Hw0eLeJe6Eob9+NpuyVc+he8nChzcoY6y2Z6oI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkbJ8Sh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdUQlsCe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eP7i1214378
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4k3hU31Qwy98Fe3cp1M3dStfljplsWIx3TYT5kKMZUs=; b=YkbJ8Sh0wzPOhfx0
	4qVXBegwBp3Vq26ZiDVuxUQNQur7AoT85bcqNcV3V+TtzROwcM6XbNoi5Np1oKE3
	MOvyc8fXBu/U1wyGLvowh0OiEbUNJT7S8TpSPd+4QDxBAXfjmHUq/+wHV+lN2uqP
	FqFkEO5VbYhXgFbs3vDZzsXtHfTYR7q9pSsAFE3Vd9egJmHcOguM8FGLKbkRlXVe
	nZn8a/27IlTpGEXVECVG3BUztp9H41gUuO+k2G5+ubWshkI1MeLyvjErQig1/dtW
	k67IUqM9N4uRBoTPVtYp8ys8/fQa9S2kIG2CMAZfnbgU9YFNANvl5jxpK2BLsPIp
	zAUfYA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98pj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:32:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8f6373eso133744eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313556; x=1780918356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k3hU31Qwy98Fe3cp1M3dStfljplsWIx3TYT5kKMZUs=;
        b=GdUQlsCe2uLmvmoK5CCHsPedXY+JI14Axu5x3h/zEvYNK5WBRghpHMPNrgyks7gb78
         1in6XPRHt/6fxjCnux1vu4xlEzfslE2I7W0YYwfNs1Ofh7jp9NmmlaWk2t2sO18ffEPE
         A86pevng1Gw+hH4kmBJEUUTtSghC9eqNHArK7hKqMRL1Rora7e7EHogjYOxN1qbZA1th
         5jQHcTJXem4Mq91iIzMSomj7sgaR/Ug2UIp3q7keTkRm7vbgMlTiAzceZAQZwna8KEA2
         S0zCQ/YHrnXYB7cYEmPNL4BHPCV+69wzMNeaxO5vSkkt3K49Tj+ZDsJZ1j3+q6E3KnW5
         nLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313556; x=1780918356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4k3hU31Qwy98Fe3cp1M3dStfljplsWIx3TYT5kKMZUs=;
        b=FDt6RSmwnPYqQkmcqeUXm9h+cu1QP2i/2m51c+42GjVkoXqeYH8q2r3HMk1ksZPx8t
         mLfUohvbwoT7IIuQr/HZTZAq8PyIWtpE3hqKukumKcCcmwjyAoYjybaWOI/E5oSq5qpA
         OejJzeeINNDg0dpLoi3ksBq/MtR2flV6D2MUkBR9PZm8wHa7+AlXzdzOhuCbEvR8t7Te
         7GAqMD0VjdK0yJhZuceUmKlWdekWOfEwFaTjm/RikdIvrfCWukxr9o+e8Dv02Xg5RPoU
         lzU3xLRoFIU/5wSMYRliPO1i3OQjQvs9Qz72C+1cKZGLnDqcuKp9CKWSxiwJ+qtTzXDQ
         /ROg==
X-Forwarded-Encrypted: i=1; AFNElJ/SMj2KXAoYnZP7bmk4Ma2vsdqGsOnzBge1dy9/thwSAIVqqrNZhZOi2r9U/tMAFAWix2AO5qggDR1EYmS/@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQ7bA00uKInN0kuhkgTn4vN04jpegeL/oLMuuup7eKeZioMU8
	h2wQI6n0orgpC4wKKLP9f7lcKnlRG42hnhCfcFmXlF/tPud0btf7yXbjxoZRKCaBY1U1/fywQh+
	Qf4qmVxDw1j2tjVDE1w4sJhhdT2g1EuUYs1ndqq7wZilKHQR/kDHbwW6VJAbTl6pW7KSC
X-Gm-Gg: Acq92OHwVsBSpOC4JDjTBWL+jcXwBYzobZw5S1HaHoSsj+6VDhOnMfTvKNcpr5CBkcY
	qOob820IFD291QB5HhvuzFqyo3S80xB0DJzCUA9S3dd3BL9xEtFBkQb+/PyFixxUkPqEuKF4YtX
	NKGixMKft6MdKd5G/07hNhQckBaKvkwDCtdmeM+udV1/OOS5jcdP3mCrfplVEyP0KXDuyDiOQTr
	ruRg7UwbW2Ek0pHVH2z8jdYRuoma4sVlA9Y8npQhbSzRxcZM3kN95te6zswRkkK2KZgDNzOzAnO
	JvJ3ku+dvRPWPZbbO40KWC1QbYxD+4/ZPGT1t7o6LNWAqboRlz+sY2BA/XmvPOsk1Rfv5Z2NrXQ
	+FD0+N1UYqlikdEtIrC2LeibOscDJqBjdcRWI7HvH95VofVfiw1n4v9eU3rEb0SKPg++BC1LubM
	tZtsU=
X-Received: by 2002:a05:693c:2c8c:b0:2da:b05a:5a7d with SMTP id 5a478bee46e88-304fa31c4a2mr2203656eec.0.1780313555883;
        Mon, 01 Jun 2026 04:32:35 -0700 (PDT)
X-Received: by 2002:a05:693c:2c8c:b0:2da:b05a:5a7d with SMTP id 5a478bee46e88-304fa31c4a2mr2203634eec.0.1780313555333;
        Mon, 01 Jun 2026 04:32:35 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2f2904sm8667431eec.9.2026.06.01.04.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:32:33 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 04:30:56 -0700
Subject: [PATCH 2/2] Bluetooth: hci_qca: fix NULL pointer dereference in
 qca_dmp_hdr() for non-serdev device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-fix_none_serdev-v1-2-8d0497ba83b0@oss.qualcomm.com>
References: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
In-Reply-To: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sai Teja Aluvala <quic_saluvala@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: NC9lUsx30vqtSvwru5-U9QrNwyfJdq6O
X-Proofpoint-GUID: NC9lUsx30vqtSvwru5-U9QrNwyfJdq6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX5a62ojy9uNyx
 lFl7dCHGQ1QZWrU6KFy+RDHJ6ng9ipZJkMWiDzQAxl2cnXx8ReSgaMzhoLQFr8dWp4YM0G23AzN
 WU4Vl511vRNbyiF75BHzsy2UVV2Jyr2u9fEjSonzTtU+b5UfORLiYAScGucOKcawOa3C6pBTJe/
 I3jxnuNDypTBY5ksz1QZfLemVAkv5un62DRz71IOj9N0Sf0URqjaAXc1tvXG+76txrjo6RhXSut
 0kaZjaCxg0E6u4mkE+CZ9FZZ/0+HeADjIrWRiOyvY/rKH2HA6agxUvMe4tgUJZ2wNTk5XI+M/2F
 r6sWScGck5f3EHTNYDgfVybUqpu9dR6nhOX/0TiXGl+lbCTsTqrfM7oO76NviinxyEE3Ns9wJIE
 2EwbDQ+5TIr66Lcj9Yu+a4oloyQ9oeE6uv2ITiX5uvT3AvFpMfJX2fKNObd5GvyadAGZax5LLZT
 cbjR9hpICzweg4jHQBQ==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d6dd4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OD5Mg_is9F9GS7JlITEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[icloud.com,intel.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DE4161E701
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hu->serdev is NULL for hci_uart attached via non-serdev paths, but
qca_dmp_hdr() unconditionally dereferences hu->serdev->dev.driver->name,
causing a NULL pointer dereference.

Fix by guarding the dereference with a NULL check and falling back to
"hci_ldisc_qca" for the non-serdev case.

Fixes: 06d3fdfcdf5c ("Bluetooth: hci_qca: Add qcom devcoredump support")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index cc7b34a61fa7..244447195619 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1028,7 +1028,7 @@ static void qca_dmp_hdr(struct hci_dev *hdev, struct sk_buff *skb)
 	skb_put_data(skb, buf, strlen(buf));
 
 	snprintf(buf, sizeof(buf), "Driver: %s\n",
-		hu->serdev->dev.driver->name);
+		 hu->serdev ? hu->serdev->dev.driver->name : "hci_ldisc_qca");
 	skb_put_data(skb, buf, strlen(buf));
 }
 

-- 
2.34.1


