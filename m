Return-Path: <linux-arm-msm+bounces-104368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAQgA45Y6mkhxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:36:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D845593A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 19:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 771CE3023DB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 17:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F3B3A9608;
	Thu, 23 Apr 2026 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfA4OaE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaxZt9Ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD873A872C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965756; cv=none; b=WcivqrtDeApyKHx0Fg3kTuSBLI9Z+8ezBfndY1G5MUYalSNbIRFc9fgXjXwkTQB8f07+p0IZ65pI98o/fOlCSzfigMVu+Auyl5rrHp1qc3sVn4K5bpT3MKK8oq2Hb/QH2sbux+rsx2ZAhzt+NUb7R6GBKGwdoMeWQasVzGTtzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965756; c=relaxed/simple;
	bh=Nevy3ShXWYVtplz3FpmtjCogr8pPD2uB/TXIwaI0LZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOl9ur9RQ6HByEYK9Zd/Lz/TFKqd3TCJ9BrXnHf3T/OLhl01/3+50GA3OZmSEnZ7axocns0IQ8roYcOxCWx8Tc7aAaZ2WAKzXgpdRSa//MWfYuXNWz+ieToU3c7xbMVmZNvba2gJLFs5K/kYFsQRtenMDPKxETNlAyC7gw96Lb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfA4OaE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaxZt9Ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFoSpj180406
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LwKe9H0jDKItDh6x0PTGoS+4p8HWCjdUazD
	5Bx88C4s=; b=FfA4OaE3zsyEYMg+Ed7vgv4970lFwoee342mPnARGkR3MmcEHyB
	j6ew5mahkURdiAGBdqhlw7mGfa+d0qdDuiCcuf4PVz/gy5DqQvn96ARpZtOcpPbz
	lFD2cZE8FA1V+aGvB0fh6FRSXpijDu+1hEuXS2xmQtShz7fSo+Sh/xp91K1e2L4R
	L3ZX2ZsxSW6PrU3R7vXtP8ZW94LjjOyuhU4Y6D6Bw/VQ9zz0abyRgvBwyhIKJ3Hl
	S2FVe/9WUsButL3EtXAXTZqJ/ab0Y4krmWWpOMbl+W7Hq6J7IG0maRlWPveBCGaZ
	yUB47l+NFRiWa0O7LZYlcuzsptCL/RwqUSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62jr7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 17:35:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d84b5f73bso226085041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965753; x=1777570553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwKe9H0jDKItDh6x0PTGoS+4p8HWCjdUazD5Bx88C4s=;
        b=CaxZt9OlBILs1g7ZMjHaHYPVyPwW9zDp17ZJDmwPzPMl3m8XTX0mdcUATk2rr4+a7h
         nhWwhL9X8IZ0ja2ylUhBrYCzrUa/PeQoH97f88mXIGx3KpU35r195olkmAt8HoEVt6cZ
         FbfxzPt2t0ntaSj6Yxria1gTkVCJCpT7lsdbeuF+cjw/8PPRY98D+5bpNK9TGvCEr3/M
         hSMfPGqyCdXg5KZss3oGG9AZBHzDTqk/Q1DdqzXr77nvXtnUa3xzMkZfVwmFa2Gf1lrZ
         gAKOB3OHTqCx8hDXP065JCVHELo8U5ZcZg5glAJNp2dERAcS0k+wnEc8ZAYfTm+ETqXo
         yhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965753; x=1777570553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwKe9H0jDKItDh6x0PTGoS+4p8HWCjdUazD5Bx88C4s=;
        b=ojebI6RVuUmNKM1BQpBXKKukAFQXFuXhJqSrRLs6VGqNDGyAUf3Z4joxnL1ojdoyTc
         LaVSVn62LLsdCoyFMwALuDTOzrzVDYaSsItJy0TgAkZhV10IpeUa5QRMcVl+qvarM7X4
         anrWaM5QQl9/Pa416oLi7J+/YJYodXfkx8R7pJxk1XPg7/3JIeVGw+DCH5XbRpfirX61
         3QENmSaffKGqja/LaLWlfcIuA1riKwccv9EiB2vh3Lq1CctN71To3JiYn7zu0de5mlY6
         IuB7/YuWksGMfP9jVcqR9zRsJbReFlqloCZdAvM0HiMrnoBzsBm1UAUL6n5IKShP/7Y7
         mMmg==
X-Forwarded-Encrypted: i=1; AFNElJ+oyMpLKxCa8IS2l8AnqZVXcgdMuAeNKnA7Li1S6yhk4o3NKCWZvbTETfghTkcOtm4tjbjyaKd6tSFZ0/OX@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3fqd+iU2MUPXtpLhxlTYfe/O1cNmAjUoTZS9eNfoMtG6uvFb
	c+1wiKOOsl3aHfbAqQbNqq6/cU6Mbd/cl8unbjgL0hlvQC0tYzQHap8Qj9cAVisYpuexiLy8uy6
	hPG84R9SV1EcKZbSLxo0Ly+g2CROFPgDFrf9fmL+0C1AKHryrzD5O1p6I4LSIS625KPTO
X-Gm-Gg: AeBDieuq+VUmKe33X5nA9QdFhynOahc6Ia3ujBUuRTH0oRbFrx23shC0AFGzXe/2Klr
	gwQA5oTiZIECJQM19F2s5RUaoDza6WfNna2DsQVjGJrH5twzyrSj0T8dZ1722Hzgk7ieD6pHSJ+
	g+CqoXbiEFKMPx8iBItuiKubdJ8GgSeiemX5HLtdBwuf5FhInOZwhMDZIJb43i59vp0BuIYa0OJ
	UtJ2+GWDbmnz5kE5dKClYTbi7MDE8sNwbhKxLiAOHTM3kdPDKHBNQW+h7ZfiOYkLvUn88TuoxRl
	kHYeUrIi3+PMq1zpKlU9ET4N/p8738/FsNB8gAj3LcZWDx5+A93Yzv1zCDVzGdCO3fbJ3kfYHp8
	RxdEUxUrDc+fdP+EIpgs9o9xcOQE+5honmnTMeOwZ3BT4+tE=
X-Received: by 2002:a05:622a:4f:b0:50e:61c1:685f with SMTP id d75a77b69052e-50e61c16accmr249940721cf.50.1776965753553;
        Thu, 23 Apr 2026 10:35:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4f:b0:50e:61c1:685f with SMTP id d75a77b69052e-50e61c16accmr249940291cf.50.1776965753157;
        Thu, 23 Apr 2026 10:35:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1405sm54380355f8f.4.2026.04.23.10.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:35:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] i2c: qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:35:50 +0200
Message-ID: <20260423173550.92317-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Nevy3ShXWYVtplz3FpmtjCogr8pPD2uB/TXIwaI0LZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6lh2sFP0JSP8mNWa6++MOYyAcOYB1BfUzArab
 d0L7wvhFOuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYdgAKCRDBN2bmhouD
 15+gD/0XttKeu5vDSeXwEOa9Wnyez3938VcNRZ3JYKzmAvq1gQula3sKunvJTXnkQ7rb+amj6cM
 GqKRSy16wSUcUB2pOVk7V+hRD2Y/2NXhygIMrBt48rBhRtx3prQj6Zj6gqUcSHbIG5RylDVinf2
 IhRt9OYc88dDhf2j4PLh997BfhuIl52taVSbkeA+9x9kSmTwPVbChTJVNVZH6HvZ+Mgrt3w7h10
 uvwkbPjx1T/bMgGkAkqNYZXuCdNh4IVCTS1RqzrDwYQfV5HD8oBYfrwQz2XPQq4SExDd/k6BtZ5
 C+cPTRZZloJOovc1pJfJQT6sxkibo9Gbi3h8/4dGRx2SUnUUiyObMas22yhf0AkhOmCwdDW1bnH
 +6yBQSfWXRo05F3uaod5GYeItPAy9kUnAyNHBgxWBOHrFvTaew8j4EJM3Iy2bFFv+7/ZPadsOwp
 fzDxqO5475CtunNR+LctTyLVd6t0UKxJUJjIx9IlTJfOpkqLssVRYayKHL1HvEfLrggsk6irQqD
 FxrS6k1ZoZXQtleapGDOMNc3eDSo3wzL5QdG/GUCOaAeurXtLeOhNeE5PVu76EPrD42BWnLf4Bj
 Yq7+sUPyNrML+OcrXjGVxc4qaYMvHAg3Tiv/SnZB1DSs9+aF5xolQFvCYWJv4uwQMoqBWP4f8/S Ymnqqe3vr06v1rw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T1urZhtD0LKpGWA8bt_77RWy7oKGSYbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfX6og+EqAF9EB9
 oCbs/qhB3HUt+twz5MahLT2aVsj4YNBETu0IP07etXsL+BdcQXbwQhBXSZeQ/9TBAITOHbTcqvx
 ud6lE1mcZaHMG98A8XOaPC60zdXtTsfi5A30XPVIuUIjT2mFSG3Dkdesewk9C8tIT0Czje/MmGW
 Xz1+ZeiyC1CuzkAWvcRX+C1roDfDiH18sMhiiZAOywC2EK9iNsOibcxYnMD6MqmuV7L9uyFyaBe
 VAnt2pDBvUhNdsUy5he4wXgaQPYffZJkupmY0C0D4RF2+pcz57Z1xXp5SXRRe5pyAwyX00A99my
 UXAuryBrnUEPRaM5QZ16AzX1Z+HCgu9MQQureCDxyUhe1Ss6otj7FvraPgqIu1gnqrSB2H2qfkm
 W0hxlb2zN3EIjoAqea21rJbWhR03TPv1BdJSCjn2b5/qKbEKKQZrFk4A4fPhSD2q1uokLZkYK1e
 8DoCiOJdNnBggNlnpbw==
X-Proofpoint-ORIG-GUID: T1urZhtD0LKpGWA8bt_77RWy7oKGSYbC
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea587a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8Z4SLfNuI_jz2Xzq8HEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230171
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 902D845593A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8c935f867a37..cdc2fa51fb90 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1046,7 +1046,7 @@ config I2C_QCOM_CCI
 	  will be called i2c-qcom-cci.
 
 config I2C_QCOM_GENI
-	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
+	tristate "Qualcomm GENI based I2C controller"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_GENI_SE
 	help
-- 
2.51.0


