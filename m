Return-Path: <linux-arm-msm+bounces-97223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOveA+m/smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:30:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF2272996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF81630518C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF943C7DF2;
	Thu, 12 Mar 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxS9q/7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea/196sw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DA3C73CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322179; cv=none; b=g25YN/+1r8dDWUcio5SgzIYfECqYUAAazwcg7rrIobk/27tR0DIall+4EBxAZo0Q86XKf4pP0uhylTwxSz/pv7OARAQNVpgTQOLkkiGSF6hZv0Gu+qIS3gZk5/NIRvdzE6mTBQcoJe7xIc0Aql5uTlBtQXoUm0PNxiCSs77MgU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322179; c=relaxed/simple;
	bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNkLKeI0Vhva37JQfsB34u9O4TkEE8LyhEL4HVe3ON8vWZ/uQPekjGHSHocQDjimJdi5YB0+1QCBoUuG9MJw0jSv9ejehLJN1rDuJNWoyvwx33XrhFqZFlIOpVpopM4wbijTvX5Qn+dJbzPraNhduBHOGJLPmilu5A/aF7usJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxS9q/7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea/196sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7e2QZ509786
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=; b=TxS9q/7qk+t4W/H2
	ICWcGoKgarAF3G3k+38xKi/fIWqo0UHNdLr7Cbcq6tz+eNEGNHUZZU1ECgYNiVHy
	+3kd0zYDr2QMWPX06Fk8HOPGsovOfzjTrpWnR/tC6BSLBh9vmaokznaXcnUUdJKq
	osPgJ7lFDXxRCpPy38rQ9Ss5txGFRQyAUbLltSsFAhPiDfFFe+OB4T3vKS1E9lpA
	45TLMZzPCmUwd2dIDg3eqYRdJDeWbjsEBrQNQreAQmMORrfHNYBy/MovXXy91WEZ
	43YRwXGLaSZAlRktekj7VrTfJMv0Q12Dnp/T7F1T4kJXTmuo0gCfPoirVjdSemKR
	/0TrJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w0vak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd98d96382so120157685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322177; x=1773926977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=ea/196sweJrPxcRQHliXpy+hLDsQc4+Cg80VyviR7APtrC6zOsIyLSfM2wgTeTiKFU
         pUG0lQtfXRdTx0bmg6I9YBhIARGU5ib02wZ7m9utc+Wat99bWNBUcpNtDfe/t0by8EX6
         zpLA81m47lS/w70FEkyWQ46LLc4oJonMo45/g4kIW8/qiwIXU0l+i/vNI8kQguD41CCc
         ERTmD69EJjympmf+96PuHa/FM9Uj+NPQvSZjmw4e1iJ/IzmfPWkhA4QfQDUJMheD4AGB
         s2O2rLq6dvumwyOuZYoOFwRR/kWGh6GQkvheei0tlp7Z6N3oubWRGUj+YyMOmcuhV+cZ
         Rymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322177; x=1773926977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jnv3IJHVveO9Wr2l9i2vrKyKNiwoqkqE7X6w0Obsuxs=;
        b=TvY1rGeiacF07zqnem33D7PwLVj8QoMLrqYXoHYr8yz/9kogdtWhgwijd2YRdAwLtI
         KY/+UJxIhZ+XvOMjVIH38w5Omp4gJX3lKkzkzV0D4lS4JmHlciswbJL+IVM9pWhAAoGY
         RXmIhapxTTxRv7Yz68uDz3HGiN+gWdLNNadYG+P5f+R9O9wbpvPp787Tzrnc48c63EjO
         FdNFWPIWdRwd36Tfwi48ZIesInmICOsf+MtpKxCePAzqIGvcoGqsxPxwPaj8okS2qYV/
         KbYq96rmZzXLZHiQK/4sdtpJ5kxIGQ20CKJK9bYFWRfKGDwAbhezpffCHwwxHt6jcl8c
         CPQg==
X-Gm-Message-State: AOJu0YzJxgYW3683jGehV2BWsWmg40nFMonJoL4ExjTNRm8sGtzfMVUW
	fh4Cq03GncYJRvtwX3mObAdUrog1Kb1zFSEcju/qSAV6aH8fMksCwC4EIE+PnuUvUMzNo9dX2kD
	OfS1XHlCZ8U5QmVBKym7dI6zJmXdoP+s5jZM5KDHNna/IHAU4mJswCc/WQX5cUUpnFGav
X-Gm-Gg: ATEYQzyhmLCrSp1iqAZPSEv+buDCbqS5jgLy5BXRsGSU6depYaBBYmEq6Kj7CkMDZF6
	615jisTf0QjgIkTF9DjGJK4St8dmbNeX3niBk5/2oh4JEOBWJpf6AcObq67Zz/GjgXVBxsmzEZE
	REndLz5wG+xoWa7EnN2sxC9GomkeIvUujkVnM6haAHGM7UImij3og3YjGMDoNJe4xBzHIRnWA6A
	y7JKqDb1v12FPH9SbTyqWGjvbrMDC+qj1gjpV8wU8wRpugF31xjn9g6wmRorC4ZiXBVmDpgRhtX
	IW9xRJ27gTrhkbxoO+rOrczTJwjPmFmDKiW6rgUQrPkez5mOECls1MoePfd0JtrgfvCxDE2lkPm
	2xS4OlC3iq2Fdea3NwBoBMj51hdhcC4bcroO0fdwQPfzk8MjGNXcFI0tFiO8wZnUMYO4wGpUz6g
	Usob/iMdZNjvMjRp0pfUM0CnYz0/gcAvD06ws=
X-Received: by 2002:a05:620a:28c8:b0:8cb:391a:48b2 with SMTP id af79cd13be357-8cda1a8a7edmr758765685a.79.1773322176743;
        Thu, 12 Mar 2026 06:29:36 -0700 (PDT)
X-Received: by 2002:a05:620a:28c8:b0:8cb:391a:48b2 with SMTP id af79cd13be357-8cda1a8a7edmr758761985a.79.1773322176278;
        Thu, 12 Mar 2026 06:29:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:24 +0200
Subject: [PATCH v3 03/27] soc: qcom: ubwc: define helper for MDSS and
 Adreno drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-3-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJiVsMMKzJws+Cks3lRdvlT1mL0gwv+c/6r+WaGQjLw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+0jEsZup8bwLf4AYfAOUkDjBlXm56HF+8bb
 L0ifc678fGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tAAKCRCLPIo+Aiko
 1ffQB/4pkEP5QysPU2WXii2L7BaLj/kfMFDQykhYsnigr8VVstqvzWNYWDXkgQ1UleXcBnFCBq6
 +X3uHskk9PTia16oZqI9g3PVG13vrlJcEWx4z9HrTbPEQa526acVu8rpv3NpZyL3wt0/jDd33bs
 7jLwtKfzrjAvXeIRBpsPnMcW2MYo2GOSkaW5oPax4meGtssxMLAaxlEk6+AbmgG8RkDNFZl6a2S
 zp9cIOikreDv9BH+ZbgDZg8tE592khKXI1mXTGZQFfNxoR0256R8XZdnqCJrwaEQuE4feOC0bZ9
 r0f1xP3fupvOQYMyZp7k1qfuHA3gOFQpDzgEXvlcGeojgUZn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qJNGnQkFk-cNFn7onJn-t_Zr3WEKyfa-
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2bfc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TXJx5zmxIxDbTTGRO54A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfXzQ+f1dxJyT16
 xj9CPmvIAN4XxRvYiMM9WsrMAcD567ccO9NXM0hyj0Ay/UPGgiZ1UNoCL9WIKlfQXlKqyIHqI8b
 Jp9UA7OzjpjWT5pAZHfiBkRBgQZOnG8wUV6qUgL1+QrzCSMPn+/oshGTLnIjf94gYD40pedRXZz
 K0oAB12ab4lwGVQul79tuPP8W3vNc6baaDzsx0gfTzP+MZEX9T4lCxjPLIkCpmsKeyygutQ5GtA
 wsnGQ18K6tco13fTcNL9V18m3rl9GC14Tgmjf8rXbhvpjrFNaWjeft/VpW/r8b4lAXU6BKAXJtr
 2MIajqX3+rYBqfa4rvjio6E8dIMFu0C1b5ooqFTBUEeB0URD+vUz8W6+PhF+s4V3oPd59cjuWS4
 9qVPmaKD0As17SCuMDW2/b7Aj8ODBeqVegPudI/I7cOKyxCzg5ffwRL2Ef9VX/L9zkA+fJkfK1s
 7c80F3RiB0o6BRRjJ2Q==
X-Proofpoint-ORIG-GUID: qJNGnQkFk-cNFn7onJn-t_Zr3WEKyfa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADCF2272996
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define special helper returning version setting for MDSS and A8xx
drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 319caed88775..8355ffe40f88 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -100,4 +100,20 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 	return cfg->ubwc_swizzle;
 }
 
+static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
+{
+	if (cfg->ubwc_enc_version >= UBWC_6_0)
+		return 5;
+	if (cfg->ubwc_enc_version >= UBWC_5_0)
+		return 4;
+	if (cfg->ubwc_enc_version >= UBWC_4_3)
+		return 3;
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		return 2;
+	if (cfg->ubwc_enc_version >= UBWC_3_0)
+		return 1;
+
+	return 0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


