Return-Path: <linux-arm-msm+bounces-97072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOjGMPfNsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:17:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9C269DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A15C302BF55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBF038F62A;
	Wed, 11 Mar 2026 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRG7rJ5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/+3FaRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BD38D6B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260260; cv=none; b=KFOMpFjG93WY2oZN00/3RXhJYM68xvr2VTLPL/WBd8prSdIx13DCONpVs5e/CrsZvozTPPzh9dbCbTycde9E9C4fwla7Y8hj+iJ607eLQK+21sXlkxwdcMlrga2Mtee7Nx8SfTxnMWF9P+DLsGlOzaCKIk3SwD2EYvkOxHpQ8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260260; c=relaxed/simple;
	bh=SuIG30M1F+1ELAgyd3DfPWYTVsyJfh1hmHgcFeXxAaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UneEkzs5mGut4zglDXEMkASfMNEG67q22ura26hn8YGyEMrcBkZJAtesIqOKIGwdYPujBhlkpq+YpFYRqG5NQyrgMawpGrqfGEnt+CkJuzW5T1FM9HEHNZEARKREBIbATckg8h2f2LxMCcv7SyD6LuUeJX2milz5+0StTEm48Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRG7rJ5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/+3FaRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BGbDQs2038133
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mb9TySrdLQeg4V7+6CbzFDqF2iSwdySFtwsh9Sd8kL8=; b=TRG7rJ5r28nbWiLn
	ihCWjTY9RUJtvjX9m4N6T+DAnwSRiX+49opCFnphhJgjHcjlBmI6rC7ZgWEpCjGE
	1D/RAiCqe+ae7YWzVh9RLG4R0oGNcHc9ixHXXIykkVVdhkRUDi7gaFArCYFSc/aJ
	UCPU9pdQkP53hpgZnNeghpzgZowPmYgqvEdjUPxSXd9PGGd4SHUcobwnnaXUXPdd
	GZif4Qm6HuY9xKBrnTiOnPRwkdnPEqaei0pxVkFqHyLfnGExj1y+k1t2jZcATYWw
	MlTaxCGmiCxXg4PTh2I7SS8/PJGZ2GGpw/2Gzffc9wh2XhBYa4ZOkW0pdLvEaHJo
	9wv3ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6a5j57u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso132470685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260258; x=1773865058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mb9TySrdLQeg4V7+6CbzFDqF2iSwdySFtwsh9Sd8kL8=;
        b=g/+3FaRf7LSO/SNBHgIlxkG2RK+vqYEzqwE89e616mVbdd239YGUlVB5H2SRmZ9GJl
         I8yWl/lcb/IYHPsSnzmch2InxyI2oAD2PjrSJaZ+DQfe0NseqGRTsA1EEV0enFhBiDC3
         qEbo2IyuM8jA4a5uTybTpjMHvDmnUuPA+cQvuBqZX5SSYqZaaFNx+zA+upn8kkhMgKxu
         38szcugcej7d3+1HM1mSBuUKVc+rxS4qBNB4obgM48C6nsAAaTPBb9+a4fh5BemdGtEl
         AIwRhW2BfFg8x7mbIC7Gv8mBbyMIEyk7gFeKNeSDIOyIejlKLDx/Rsx6io49lurly+OS
         rLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260258; x=1773865058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mb9TySrdLQeg4V7+6CbzFDqF2iSwdySFtwsh9Sd8kL8=;
        b=l2TmLqBQNyr5ULocOBfXUY7DxaxVY1Pn1DhVkccGS/twb7jN7pcW5ZinYe3dN3HvU7
         QpYexI1wFwLsQiyH9SjzOoTQb1l9l8us2ITZoG61rIfd5znbK/PHy/XOtY1f8f9LkYPU
         asfKy3efgXFRYlMqNypgaCf3LMidxJb+4ydxDC/KLM1BSre456WGSw1BfsM3Ea7WTVCW
         lcDVDnKvdjfIPUZ8oHWtPAvjdxUFPOLqguQB2tKZtH7ffeX6FXajxHHGEcmVdzTGj9I7
         A6hHV0/79AgGKntFU7kFP82Wx67OHM++t+p8TKZVyhnoFTOfEqxtNZUaS/ACe8vtxcOL
         ayLQ==
X-Gm-Message-State: AOJu0Yw3WoTMXc1msHPSorGDNsP2pe6XEiQNftFEZYaSzx3cW2fPB/jV
	GG6wVAYVPDxJvy0himDVPbT9lx1uvjAVHDuopKtevqxHcB/736i3SuLcn+urkWdBrQXJ7BxN+AY
	8hl1yf09xQoZ7X9/NtNi6y+S4AxktlWiOlCl8nYUMRsJpv1CfRGxVAb0p+STc/QZJl2fm
X-Gm-Gg: ATEYQzxG+DtbYz+MYFUrqHYOJhQHxVJfiAL71G292i/GFO8ar51mSHG/CWVRc+0XZwV
	c4pzJQccKsBlFL2m0NMkBhQ5zRDfOcIkxqWkEEq+KhytLyIPmVe7OL/P2ACYqFMf7nB6vStvRqb
	viEYQNbqXVM676r4iv3y3wCzhoPbimsg8LmlGovXLw80PHduoAVc1AJfc4fU8UsXfmP1ytgBWoU
	Fz7/kih8ryGvJv5Ex4xZUsS+x0IVae5dMCCiWVUXojC9oFKT98qjDgu1zNQbFlLchzBwZCgWM6G
	bE82bvuU3C7A3igFPvbWv8cnnHg3AcJgK0t87k7Dq0yHF6D+1TFrNn/zm0cVgblEdkudwOqkAZS
	0/6P+VjLmfLSWXedj9lUXUZQxWgsZbmBGe2WfFMXvKq4L
X-Received: by 2002:a05:620a:31a8:b0:8cd:91b4:8225 with SMTP id af79cd13be357-8cda1aa47c8mr569400085a.40.1773260257744;
        Wed, 11 Mar 2026 13:17:37 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:8cd:91b4:8225 with SMTP id af79cd13be357-8cda1aa47c8mr569397485a.40.1773260257361;
        Wed, 11 Mar 2026 13:17:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:25 +0100
Subject: [PATCH 1/7] drm/msm/hdmi: Simplify with dev_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-1-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SuIG30M1F+1ELAgyd3DfPWYTVsyJfh1hmHgcFeXxAaI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3XesVhtgT5ZKH68ke+cEZ1kNtjE9iAbqLpP
 8CQbzxyVHOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN1wAKCRDBN2bmhouD
 10r8D/4iaIi1RnpPmRnl6o0Bhqlb3a9HonKYDrne8s5gvD2jT16wX0d5s5lDy+59NA1Qko0WSYg
 TWOpPDJUTWFeopNuSWo0kwPRdWZGIMOSflf2CCShlr9Lna0XFRQJABSvjn9qxe6QdU/2WHAfkgl
 B4vueIUd7A3Dhyb+9lxaR5ubm3tfNDQ3atZZ0T2XjAUen9ffZr+cRIQo9Dmugz+9ZSIK3q81IeX
 95pnn7UXwmKYjJYX12Fg7yRjs+2D8FYitMpnjFGYiskP1FhzJUtZZg3UAti/tySibOYyvJaNut1
 aNgR0PIskwWjlJp4YV3BqGY/LP3yN1ipxnhrHG5uHLGjnP0B6VePIDFA5sTkUy2+6ddw3XVF3w5
 mcU/xntnTd9jBlRPSIFymv43qcJw3fmV7nkO0ObztsxMc1rZvaLKJfvkuPJ61UA+ao3/8pO6soK
 ssBa20oTVlIkk88d6wBlHBU9oJ1Dm+hY9WilAbwp16j5121ebazeYHuzJ/5WIY+7A2mTxuE8TXb
 d/2RphSczfQGkq2BkRjEjfFTL/duZkmv1KvNukyyzRli+9eiJ9eLpaXitJ54f9jbbvktvnDBcic
 7y1SMkDOMeC7GrLiCgaTtE0obBF05rmbElUWb7CV1yO/PmdZvy4Hz9pVeFcP9xR3sch/gECdzjj
 a7A4n2Te0UT8i8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: l0tV8QXu01ZR-3mXfp2MUUagnu3sHPZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MSBTYWx0ZWRfXx5repsvMwESv
 t353zjVuVj+y8f4ICpgQYASagxwWSPX8OiBzrnz3/q2lSTwc2NFtg3KMfcTCRFcrB2UlWCuziAl
 A7eTB6/wF2RQ8cHEIVoZtyFReVdSZORKuNAVlUCqIxMIdcAceaOsGDSt0YCYuNV2sTbvB52A4NY
 y4NwHDCSnIpzRbp8UWUACTI0b2rzFhGrkAxOj0wWG66umrll6gHiMFruFGL+NnBgEo9ZnSIFHo5
 vJaPdNoN0yhwBBaXanhxb/0ABCmUmArfbAWt9R9KTybZjAQl/U+sLAtiKzJpKks1gowGS35rcC6
 U6/HffRgI/sdEnmPEsBemlP49k8LHS+Rup/YjO2F2XTVDsGXHXnULmvvThc10Poc92KGj1ZaqXv
 RWyWvQyPfXZ5h2cC4wmV7q4Qt8vPMBCv5sLbCStqfz1BZZ93ve2XylDNDpwIMhZd1Np9J7wARjz
 QVnWkFS65il7CJlQqNQ==
X-Proofpoint-ORIG-GUID: l0tV8QXu01ZR-3mXfp2MUUagnu3sHPZd
X-Authority-Analysis: v=2.4 cv=TtLrRTXh c=1 sm=1 tr=0 ts=69b1cde2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=a3u9cgIM1-qt9aQBqfUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110171
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97072-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3A9C269DF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify chain of pointer dereferences with dev_of_node() which also
checks if 'dev' argument is non-NULL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5afac09c0d33..b1db1b597901 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -91,7 +91,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 	struct platform_device *phy_pdev;
 	struct device_node *phy_node;
 
-	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
+	phy_node = of_parse_phandle(dev_of_node(&pdev->dev), "phys", 0);
 	if (!phy_node) {
 		DRM_DEV_ERROR(&pdev->dev, "cannot find phy device\n");
 		return -ENXIO;
@@ -287,7 +287,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	spin_lock_init(&hdmi->reg_lock);
 	mutex_init(&hdmi->state_mutex);
 
-	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
+	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
 		return ret;
 

-- 
2.51.0


