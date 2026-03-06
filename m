Return-Path: <linux-arm-msm+bounces-95894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC9PI20Fq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE7225712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E6CD303C3AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6A5430BB3;
	Fri,  6 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlT+Jjb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdBzwrxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E440B6EA
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815669; cv=none; b=t6r5sgkyEA8CS5oDw44DEDOan7d8YzcD6hGY01/N6vnTogF92khrQtoz6/OKFzNdeDEWcQc0uxMzfUpa6GI0SK4PHKF0iod68rkNtNUNknoEdybB7tosB3SrTKw10HMvL7+J+WizZtf3SZx+E+5pxClF9zWgaK+HtzMXcpWctsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815669; c=relaxed/simple;
	bh=2LnoPNi3lG29ZP56cipc86DccHTmRuMtPFNBgsiCAGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUCM09zVYCJWR5oSoBPBxVS7Ftpxs0WRJtMhU3Lv1K/rtNUShELGzTFOwwJXwpeRDdl1POrXRtyHx0R+oFUTr/5cAhupISXlV3RzTKSu0oDN/pIEblXplNzZZDT0ihail3Zq5b1V5FapeqKiFJcbL4ZjnHTpwKkAEcLfh7bAsIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlT+Jjb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdBzwrxC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr2H31743010
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=; b=HlT+Jjb9QWfBBkkR
	VaO3WTUceFibqyHYE2cGZx6cyhAVHlg0vCoorfDSiZsWmF76dvLI0TX3OUJOURR/
	5trz2GS8Ax01CXT81e+oMxTiUqx1TaUNDYqyMH4rOKgnFnNVad+ws3YEhFYqENYQ
	e8KBfYsTMhS4XucWSUDZ8C9zU3vAn2xXgPxywFZ2Fa9gw+d+RhXKqtZo0c4Qgj+r
	WMJbHe4fV2xilyoXbfp7xJtPS48mFOgzBVw2U27bKN47ec94tHPm7EupV3/8TEEp
	aRPEkzj8yyms8bdIP33qBrGVdFUasUR5tHEAsRc3Vd54CnxzrZRMKAdU4XzfpvuI
	C+9OzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14h0bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506bfff75edso787656401cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815664; x=1773420464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=;
        b=LdBzwrxC1qobtHMWqXGf8ejGV/zjwspnop9sePWogxzMSGZsb+KYw7amhPo/FrS3BB
         OWEyKWshY9RhFhCl6aFAK80i04XQEP/0TLMYhdbnDh0aHyCF8aogLe7E/cCYwLtNwjL9
         OsKu39yLW+a6IKAjdFpYVw9pWy2AYLa9cRF0sbu+KPUhWxgA//LWcAu91RNf7c9yzsgI
         ltF5rKGqnlO2IIF+i/6SZv622dDESNoCMVZnoYgOQJ3kbqm8foBVjNh6RqaZv6Eenp/h
         Mf1ikYxPgp3WLB49qVXTRzYsnrdiKe1lX2dnu+Nz/N9RU0gFfFmSZAzew2TR/dse3xH/
         KufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815664; x=1773420464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBxlchdjbjF0eiY4KPqTod21EA8PMrHUqOAvrBh9nVA=;
        b=KM2xmwWv4vLrCg49aL33PgT3y8Lq/P9MKPTNngZV3bVgbp5nwZaRyGpUx9ImozncM9
         jrvw2bvJjxE7Chu1Dtk+86rYGds/ayxqsbq3Knx2WbvwXCjCgKwfQRztv9C87SCl65e0
         juw51MiZRIfrn3E0NTeWsRGhyEAyycZF4i1Nd97ok8TExqF2k0HMzrNznVz9Xi5ve4fa
         A/D0YKa9xC9OpxtOTeMplO2i0fabmVVBytu2xf9qnrngTqDG3fSKQT6b5xJ7/pyQyKnK
         P6mSnWn1p7UVyPk5UKxI3Gp7i19iLaie6zKYwQRfh/4+VZHvIzWCFr4buTdGaoeWvw1F
         vjLA==
X-Gm-Message-State: AOJu0YyH5/8i/a6BwXdORA9tL3B4wNF1w5uyIWCKKOW9K66bRPUkFY/f
	KVPNLOhJe1xqYHt6bevjqP9ITRaRc5TpActyHns8kti23vTcjD+LsbVDTTnTWkckwvTMqJlW0gW
	Lk7xMhI6XeXDNPUSJ/uSm9W6oY4C87k4TQPVu/MLHPTREobm7KBlORKbsFY4arqyaTiDU
X-Gm-Gg: ATEYQzzVvtkQ1Jr9N3A+ncG/Bo8LphaaG86JuG2y3uyMwi5HXA8mc8H+IWc3YF+m6TG
	wSTp62WC+WC4Pv6PSw22RVkw0hCU4IowNxPoVxrV/FWKbbQr51bQ9AZ94K4VwXap2w81sVA3oSU
	ZPx3NeTdk4tJit5fm8QeCgLf7T4Ozz1Ol6JEc6MJuQS3ggFra6OhHnLPjHLYz0nN3juPRwscULn
	5cu4Kgf+ZitoxmTZuvYZYXpM9lXzwr+pP1uxr39XGnkJPgSPkxsf7iBD4TxoJQi1J9ZyiRcDuHz
	5m0Rmp8ERlmlAn3KMR/W/oZsErKx2sCRNBPeMGRW/Q0skLo6seZfJLl2Yuvtn+S5gT0uqxsksMF
	jJ4aff1ZqW+f4MN/+mqWbbxQd+ZjPqt60ZnlcEKc5ZLDT+8xGGdEEWi5ZtM3p+LyjltniEXZSwV
	BXT/f9Tx1Ea5Cf5yH1VzKZUAdVdYDot5jetnc=
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr332129385a.5.1772815663688;
        Fri, 06 Mar 2026 08:47:43 -0800 (PST)
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr332125485a.5.1772815663109;
        Fri, 06 Mar 2026 08:47:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:24 +0200
Subject: [PATCH 18/24] soc: qcom: ubwc: set min_acc length to 64 for all
 UBWC 1.0 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-18-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2LnoPNi3lG29ZP56cipc86DccHTmRuMtPFNBgsiCAGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUP7fAZuZ7ND3U+/FN5XiQXOIgBgLaDwD1uB
 +sv993BXuyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1dP5B/48lH/bJArDUccceJfeYEiOGLwGTQVVIQOUfakt3ewOl771WXgXe8a8uKwujZhZ8kDQ93k
 FW83HP4T++VRJXLt3PkHjI5ZN09Libr64T0xwVWix6PxGrmpnFY1VJ3NrfCavuHs30Qmf09OmCC
 cmYirAMMIwZqdiymhHNHSd2yEYMhZtM2fgzGBkXe8IouLErStgIfJ6DRkx464ianFIAw+GzOOrz
 xdaQ8Wfth34N9BkIGwFCl/cOJ16INL/3KZ/lKvoyfB7AOsKRnBoe9ImOGg8duam7OhRZn3eYcSo
 fBGpn8uiCW7nQQ1yxruRWcD5L3AAr/MBoRIvJmbi1XFGYX7p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX271SbZgoM4Wn
 /BqDlubuqfGzSTD/WL5wwRV1C0GWzpJ4sfEDtp37erY3wffnyZruyvEv2RL+bETZ6iJqlzyoL8b
 gigMPf8ReCHOT17WtawqSN1V/WxuKpUscKSpZmFK5ZfnNPW7bVq6ix8sXDPPCQ//he2j+DKklVK
 sLntm6Tq0lC5XjGO7yE9cAhp5/MikGPJXkTs79SqtzvOmEsX5dRxkl6wXBv3kJQ/OzlZh274hdD
 uUyNijk7h5Jq+oIUPtuI4hhwt4bFppqeN2I7LoSZaTyNsUhTfmB4BAbO0chRC2jGrWN64ONo9H3
 SYwQqD/wnAtn8p1a9t7OhHhIyWMcZ+e4dPdcQZpu05ldw/gUkGVCWN2c7CNoVh0nc40NUtAtHFd
 GOCXfpdtPdnl8EqR+P90I2K31ys0a9VWMyE1i9tm15HxqfpoWn0+4n1+Cg0cfpvSaZ45e+hjTMV
 CYXOf1ODZ6ei57qG/ww==
X-Proofpoint-GUID: 6ufsT8P9mfgf6P1qUIR8G7XmhY9PhMfO
X-Proofpoint-ORIG-GUID: 6ufsT8P9mfgf6P1qUIR8G7XmhY9PhMfO
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69ab0530 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5ZsywSmvcCt_NWGkcqUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 37DE7225712
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95894-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

According to the documentation, the MAL should be set for all UBWC 1.0
targets, no matter what is the version of the UBWC decoders are present
on the device. The helper comes from DPU / GPU world, where there was no
separate bit to control MAL before UBWC 2.0. As the helper is now being
used by other drivers too, correct the helper to return the correct MAL
value (Iris doesn't support UBWC 1.0 devices for now, so there is no
changes of the behaviour).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 8355ffe40f88..ddd7b15d9ff1 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -80,9 +80,7 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
  */
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_enc_version == UBWC_1_0 &&
-		(cfg->ubwc_dec_version == UBWC_2_0 ||
-		 cfg->ubwc_dec_version == UBWC_3_0);
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


