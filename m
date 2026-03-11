Return-Path: <linux-arm-msm+bounces-97071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGF4FunNsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:17:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E236E269D89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93C6F3028B5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FC438D69F;
	Wed, 11 Mar 2026 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaO/vZaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkarGq51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1A38D018
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260258; cv=none; b=Zg93xwUgfIqQLmR4g7AnW4oD6xW8puCrRd/O4pyTYRbZIyx3/04tWzOLJwZBOQf2w9hk9yBtfzykGLzJadLTuT/mqvKcT7iqpMFrQsfLpC/mnlWIMjI2KI+lYAyh5fitIkOC/C1JnRFgm4F5SjrX6ldPj9lMmLTaFlYVJsiBi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260258; c=relaxed/simple;
	bh=STxFEgrSuuw22UnZhJgi75pSMHcmeyDIbWn/h7WGFpc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DXT9LylPWZcHOX0ajUmB5n1IJButbEHej9CpBxkPt240xPf2EvULzj8xJVzRSF7svBSn9hNlsbC6JtOchjTYMV+5pIx7TSVDIgKiIQScZMtPD3yYp4mViSEd1kLWC7fj1/f1SaDbU+F4Rr2Ow2QASG2zCybK63ZqV7yzyBWRD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaO/vZaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkarGq51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BGF2YG294248
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2BdXU/WOuB3mB5/QB/GyBp
	P8o+X7QKGxC5njXcwk0BA=; b=JaO/vZajzwSvK2AxEbBf6gIuWzEvz+n0Bm5f8U
	P9R5XBPVOO03MZWPNxsEAUVkmulNQbV5EC/5fG0Z4sgvbNE9F38dlalEN3L4wX0A
	P1HjpvTPmEhvZRF9Vi4BV3jfXcGnbFnGqy7Ew1vBMrQomW1OdSVTEkVWcVnpNG3z
	blablE8bH1kZxCpOcPNX8l7OVDEju9DMgLZKGhdLNQzeXYAWD4pXRyu1BxwDedJQ
	BWxgqDWDzEbKazVtam4aESj+CFZS0fuQ1eNhgtB9k0vJDvdwItkdNsmC9DevBv9W
	tPPka9rlsKLc4GYGs0w2wuNezuux+a1G6nQ85Mv2geYMzkug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bba4sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7774be64so142789485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260255; x=1773865055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BdXU/WOuB3mB5/QB/GyBpP8o+X7QKGxC5njXcwk0BA=;
        b=PkarGq51vqYxBbPY6LPzNeKI049DfSNHgbc12SD7+znhbO/z9ld8pmdJxSz7pglIEw
         3f1lEuRQoWvQfjvjnGPTr8AHu0l8fQyI0jE9GJw6JXWOYlqOefIo6t1NFhdk2tnanz2l
         E22HJuf+e9eyEi5CqJgXy3gw9GXrPVyEU+DpK957WM4fZnul2X8n+qHFq/1em0YSkVlz
         GBFVYkafj9srGqkX/qMmhHW6PCZfkVlsRCpeOagOO+Prq77h9E1wYHf4YwMNAEbhcWly
         COz9WWobWfN9pTxq3sdbUSf3hFo3hr4pyd9yFlthHJNzpHTbVe9MeZFRy90IHZaf9YrR
         JZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260255; x=1773865055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BdXU/WOuB3mB5/QB/GyBpP8o+X7QKGxC5njXcwk0BA=;
        b=Cm6GNX+LpcIwOaemRfm9V9a+rpDFpQ2cd0dmTSCnEzfDunr8Q6zoVjLJwkkNT3G27x
         qYWNeJfRWlNZrEQjLgdJCEFqA94qI/nMJv2jwAJ802PusTUHUGvuCGgLzXTfF22rsn3e
         RTRrqF9KKeHH1saM0V0leUzTgWmIikdUMAf4M565GlwFN2gJdN3Ksmhc+UtOfjhMEP1/
         EL7OeC0jLEJa0iRfArFNGqyXq7729in0kd1w3LNAdFU3Xj1L3WaoRitoAWjLjI3a6Jnm
         PCVCaW5AShLpqxHFIs884VNm7spscX7zxPP6AxZHxItLceE4LzwG51uQqC5ugjSrQfCs
         +v0Q==
X-Gm-Message-State: AOJu0YynjbzadT2T2kIKQT7FHDa4dL0k5GfQojc+QNMwi6CcI/hMY9y+
	v1p0OXFLnGGUpuW9AP+5MXInsV2cid0xyREIYPP1sUYw91e0Vab2wa9KczO+5gZax/J9XKX6Ola
	8rj2Bxd3hqi1n+gtSx//II3agscmzrbXjPmSAbu9FInvwfNpM1QLstPs0i2uEDGknp/5L9lC/Gd
	6D
X-Gm-Gg: ATEYQzwcl6ZcWEP745IU2kzGQTVaKaKEKi+IjBvONIp/hsMjf7/NBfXD0IYDPBEJcDx
	0VaNbcZGcuskvoGGkE2OM3k5numN/YTD72PsGF5xbpmT0B8vy4o67WKb9fHzQFzPfGwT+PoeOfG
	BsGS0OWKrU8tlC2E2QKqFtAoZhAmNbUgeId/EqPcOVOZ7JKIIt37IcSfpTKR5jYwMgjcPITFSZ5
	4+ozwmwSmQUmo2srV5pb724W1U/Jsbt8tpherkZ9dJwbk6XvEPlfIUH78zuvBltY4CASB1sLc0s
	eWUYZn2sMeJ6EmRStL6HDLVrFCiJRT/9SLmaldcDNVzqbhssehwkkE6nu1rvF+rrEdYpYNFHuwp
	Szx6wL0+nDpjEPvlXM8CZKEWgcRaNWKqfySv01oL4zzmE
X-Received: by 2002:a05:620a:46ab:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cda1a29234mr523946485a.36.1773260255571;
        Wed, 11 Mar 2026 13:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cda1a29234mr523942085a.36.1773260255115;
        Wed, 11 Mar 2026 13:17:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm/hdmi: Simplify the code
Date: Wed, 11 Mar 2026 21:17:24 +0100
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTNsWkC/zWNyw6CMBREf4V07SVteSSw8j8Mi1ou0kCp9oIih
 H+3QNxMciaZMysj9AaJldHKPL4NGTcEEJeI6VYNDwRTB2aSy5wnQkDtLViy0NbWgO5RDdMTeJL
 VXKss10XDwvTpsTHzob1VJ3t8TcE+niWzSKQOexn93aIQueSxTLOkSEFC55cvLaNr4s4tvftQZ
 66OKH5NqtfO2jjE/nZXhLAXZiyjAecRTiPPWbVtP7eUkjXjAAAA
X-Change-ID: 20260311-drm-msm-hdmi-cleanup-035d0ca56c9f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=STxFEgrSuuw22UnZhJgi75pSMHcmeyDIbWn/h7WGFpc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3WGojYaI3aUlXQUDlh960/HGrwXQJpJdVwX
 vZ0utPICryJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN1gAKCRDBN2bmhouD
 11oTEACTnJAOlqQ6AmwmVtkeX+PlnF4grmqqjoBckxQvzZjToACnuwWzenT75ndM2lzA0j+2WcS
 MI+s50nJ+1ZLxW+wExK1vYX3e37HipEuKv9P5j7uxrWnXpGhEsXt6UIk468HonfHIUQVBR4GoIT
 Ib4yM3uSnwNIq0oMx9eQBs3orDSjjTW4atLe+89REen5XQJHsWOQLg17YSuF+i1zSNKlGdUdFUa
 Yyn/tU1CkU+uQEZwQlWJP8xxS2+5coRAvJKt/olFFrR9NgRGh2Dxy4YYxz/8KUO3fhJ5/hZe4mo
 jDwD/nK/u1LSbMQeNG9UP7mgrotSWzgHH+VhhWXFQytaImU/YX1jGW6H1E8Rvv1sOhj55b8m6Ej
 LVY8KUxwSdxkzc0P7V2NJPWRd1mGFDE/lvAFX0lW2fKceSxxk68AUc49fw/PwQNXHNPztVIDLno
 ch3C6nQlJKWVW7FrdHP/nzMb4453nGJqVtMd0p6L1GVg48iVU5W1ewQT2aF1FNiq4HSZE4B37yx
 SAk5R9qZhdf5TxPLdhL4hR9Bi314/NvdD9FUZD5KCaz4+XkzPwsRNIeUYA3hEtyakvNCsWivt1u
 qxuZ8Ge2CDAuMwsHMS5YM0O9Lf//jjQHSsFo3mXeuAvKreVZvQAVZGnVEFGOhYK2dPDUJkH1fao
 E4ZDedeyyNkvG0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ogbpOLsaISZ4UbW_SuoE8LG32umb5W2v
X-Proofpoint-GUID: ogbpOLsaISZ4UbW_SuoE8LG32umb5W2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfX+MRXh4lfC0H8
 O0huN3PXRQ/UKMigURsomc9iKrZTQ8bhpgcO5U0loT1jcwLdAgzXMM91xzVqoAcSslgE6IvHx2w
 09klYjFezjAc1yDmiNcPBvu/2Vs+pmsp5Od9+2vnGWYGkAsQAfQvJEqoi7NFiLnvrmKfs/nMuYD
 4NjyWrc72PFKnw816uH7gmi3L5kXMGB3ixP2D/LWCmBRYqsJy3rxkwMgjY+hap7ukEj9RSittJd
 xewdS8IRH0bJJUrY/AmsJa1pvfxa8Hpd+IGAChg9Q48hfi1PakO/AxZR1cxORTvBcVE0nE1Eav/
 GZL2yxQLa87AsaZHknhpJrxJQALFNK3oyqonUZ4+YeQhD4OTXSWGCL31nryoSuwbVLNig4pJNdL
 UUlBHOl2dG/26AQgMaEj410qd2auw9UuwaXeKUevBKdtZP+IyW467LWY+zT9+kMmbO0QMZzvMIE
 7kMcp87y9RpwHCgKD5g==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b1cde1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=awFhw4JYPemOKMTIpBQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97071-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E236E269D89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Few code simplifications, without functional impact.

Context based (dependency) on:
https://lore.kernel.org/all/20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      drm/msm/hdmi: Simplify with dev_of_node()
      drm/msm/hdmi: Avoid double error print on msm_hdmi_get_phy() failure
      drm/msm/hdmi: Simplify with local 'dev' variable
      drm/msm/hdmi: Consistently use u32 instead of uint32_t
      drm/msm/hdmi: Drop redundant 'int' for longs
      drm/msm/hdmi_bridge: Simplify register bit updates
      drm/msm/hdmi_hdcp: Simplify register bit updates

 drivers/gpu/drm/msm/hdmi/hdmi.c          |  32 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi.h          |  25 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c    |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   | 102 +++++++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c     |  85 +++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c      |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c      |  12 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c      |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |   2 +-
 11 files changed, 121 insertions(+), 152 deletions(-)
---
base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
change-id: 20260311-drm-msm-hdmi-cleanup-035d0ca56c9f
prerequisite-message-id: 20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com
prerequisite-patch-id: 2720d6338c556d78897568eba7c7f3a457f690f4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


