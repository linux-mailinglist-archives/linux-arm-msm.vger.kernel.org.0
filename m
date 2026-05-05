Return-Path: <linux-arm-msm+bounces-105993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f2TPHrgO+mlOIwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:37:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E27EF4D04CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26CCA3019CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73675481246;
	Tue,  5 May 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLjZqamn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgFPaiUp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A6156C6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995445; cv=none; b=T7FkjOIwYKoG72IIk7fvlo7RTNOWTMJsE67xn4/b5edxMFiYY+nFeJJ+eaQ7zasqJ3oKeTn8OgkjvWdgCU40DJQmLncN5BD9oFLjhveOqFQwqFWXTJZv71a5iEETf6wD+GHpYB8p02/tj++bMfUs58gkILqmIuZSczTaDp0sQIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995445; c=relaxed/simple;
	bh=Y8wFckoK7TOel4C6zawYi8+9/+CHXFWPohzFYsuL/5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuezK1+8Bgxypy5t3kFnNEvoRHWWD4DP5o50Bo3/56j7V9CmhK8iWcCxUBaC84+3zOt9YUbjeSUDyS2ctfd+hk4uHNxfDEPHd8Km9pCGgqmvT/abzS2iqNCarXKBHyNiZ5v9ekrlDsF3FUTLNSaTTop8Hst/QSp6dIVnTCPZpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLjZqamn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgFPaiUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Er7m0248146
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 15:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sj2ImC8vzJGHf39H6sT6DlniZJhgy59BgKM
	TAr/2SrU=; b=lLjZqamnNyFaTR6GvFU6fnf65+pLgdtTV87dGQTt6nIqEiDaWJd
	ioYi+4S6wD9yt+/Ceu6/MGMz9x8fDYfgtbdALEimr99nB118tKLcMQ7N99PjaucV
	xZYB0CiFwIpsl6p8vZ04VCnGsNZID412RlmP/eDUzncWb5Kk4rZfQFFoMttrPLEj
	EOLKDNLNsTFXBwKaEdsL3cusHp7gBFuHrrlwKsFQDK6/PiZThhhtr4pDm4h9eUg3
	wsBDmLukFw14gwU7/zU0KqSduMpwSIVEtIFEaDPKLSlL7KCM1WSo3AROZsyvmCk7
	NhT5QmKRHGVI6PPMfQVcl1RNOo7VBuRiTyA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq405ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 15:37:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ae34d6738so10413276e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777995442; x=1778600242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sj2ImC8vzJGHf39H6sT6DlniZJhgy59BgKMTAr/2SrU=;
        b=VgFPaiUprVLJS9PBxXGpKBwiWi/fYUnKPg74GHSJPtOpx+NoKnW1hr5Hk04UiX8fK2
         jrvIgIdIJitSSh3qeFOFH4N1aeaFK1CCNlhM/2/UGXDCwKeHWFCG8KGKoevG2wU7DTFO
         fPgnfNli6laTxkf1qQLvAvutr5jWRZ1DkGaKcqfFzGs+mWr/QefWMVJuC8r2dBcsEOjF
         LFLmIdnnwyDtYEFw2sCZd1MbMXtueKlHrfpGlqed8CrTH0yjKQNDQc9e/YicI/ZNDhly
         BMdcXHQKlXXmn10os9Ck2XNlz91ws90equpo/Y5BW63SPGnk4vqqBL0qs7vj94gGaBWy
         FLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995442; x=1778600242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj2ImC8vzJGHf39H6sT6DlniZJhgy59BgKMTAr/2SrU=;
        b=h/wovzPaTQzkpKPKLXPgUbntqOs7QBYV4KeK148UX9KXnePgRtJMMjDB0siwdUQs5z
         ePp6TDzUpDIqUHA1mEx73Fp6GudoDKtQgX4A2IzsHAZKunm5f20ztGRIBvcmRaJSkYVV
         fRsNxI4lbeVw1ZgQx4YFV7n0wrl8ErhGTcM9yRkLv5CtROPojKxGgOh0CcRRoZYT5I+d
         7XOozqTwdS6z5qkGofmW4Mm/SZg4vg3VmMJp13wWjlBdRTYRzP0OaOMnFnHZxeQqVcBv
         Mx45WqHks08OnLnVXyCdz7gktVUAUZC65BI3m5quvB8z1bUegLc+uCtw7HE/M2CqFok2
         9pzA==
X-Forwarded-Encrypted: i=1; AFNElJ+Pid5LVSIPQxUmuDbGweV9hC2XX7brsPwGySmj+eeM2w2xHK+Keb967sxEIWgiRUyTeA5i83sfVbvjRlQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzf1PfvelPmYknRh2rCEn1BtjkPpYyvfY0h9QYbXo+FyiTl+v4
	UjmqdMCeY33QjB8PUtce5ORHkoL6ExZiIN5qXL8vh6AznGgDqSQoChfyfRs6k+sSzkw4n6ERjUI
	6oMKNGbXOLOWviiEnD+s+naI1gzTudb3CTcoVR5hV2b8bDYrTR+pnHZUWYRK/st2MhJ3oYohq75
	PO
X-Gm-Gg: AeBDiesJL+MtJXqSnz03AE/zqjdUXbmA7VdA8XeTWXwwvoqk3h6FqSAGOilipoRUK9y
	B3U+HBNLEjHypuhbBEEtYXXXlo+2x2f4sVf9XaQ2RKp107vrFJxGRHjkiToXkMaqTMwo2i+vVfN
	c3LqRe9rFRV7owjqT95Ln34LBuGLaD/dCPFoAMcbur3kHc8TS/DAw5/1Y40VpB9Ryrvp10PRgPK
	1Rfsz0Kih4aldWGKnTVRWAcgiYSd6mzFkThDKa6U1Xsj2EcBWZCcVr19nzpTeOr+nr0tet+A3ml
	7odtdR4Ec8/15NPy+yzi80WE09YN0cWEQGHw8sCX06afWeWQCeslSS4nU7Gk7x/OsMoa60twicK
	7W9s3+c259Lk7AMxMsZhuQzwbcmhQSUcuC7LfyJ0+gv73M+A=
X-Received: by 2002:a05:6122:298c:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5750c562655mr7381053e0c.4.1777995442333;
        Tue, 05 May 2026 08:37:22 -0700 (PDT)
X-Received: by 2002:a05:6122:298c:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5750c562655mr7380992e0c.4.1777995441944;
        Tue, 05 May 2026 08:37:21 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm351141845e9.2.2026.05.05.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:37:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RFT PATCH] clk: qcom: dispcc-glymur: Fix (possibly) dumping regmap
Date: Tue,  5 May 2026 17:37:18 +0200
Message-ID: <20260505153717.303414-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Y8wFckoK7TOel4C6zawYi8+9/+CHXFWPohzFYsuL/5M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+g6uNcG/zL7V7jpw0+Q79/UyHf7VmJgGcactc
 LT3egAAv0yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafoOrgAKCRDBN2bmhouD
 1wmND/9gPF4p8EX6Nz0/ZcmRz4gDWzCJ+ExajwwFb0e1SMowg9UwOHz+VCstN+e/xnfR0JvafB+
 jI3b+ppF8Og1CCCWJKTvCWiJpDGgNrgIUVPcQZIdH2gMndLt5fImsaOCNi0+IvJBPHkrFh9KOxj
 FMsiBylYByjmnrob/pEu2yD+fKGxNCN3v3kM3ZT8nGWnCyCvSyfys7XFvD509jGRYGszO1PTk0L
 TmwpuxNDex9ARm7COzCMa8PSvYIO0/HGok0Df4h1hCYAM0dO+DetLmU9UQyfc4HzTLOvpRAuCQM
 2YC95fL8lhVQCkEJ2ip4sLFB2N2L0YDsrom6J0ec21u/LSv5R4vo9MvWRZhPOOms9OTsXLvc5zh
 CXkme/MK6AQPJNunVEqCkg1T4sGATcndDyoJTBTiYjlrHig6P0BYRGeAmb4nCcB83NcwljxvbEa
 61eZMGcWevdwJTwy/8OD3WfcTP2oS3Abk4A6hJsDlbWyiUMsOcgECamBMNSPQadpf3W60hTvK9X
 qBNoUk4g/3WyzTlcaMifB/eogZK6lw2mY1e4fPo3rKxrHgVyYgfZyp4QBgrPWOp1UdlJwerESME
 Yojt5BHUbfgun3DdV15+qKVR2YiWVsBL4VG18St4hZfOnk5dJ5TRdemj18VmQct/px7ICQoTRTj rzikSRHxMJ3Lovw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fa0eb3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-rrMuzNktfTFCj7_FjEA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0OSBTYWx0ZWRfX5NbUVHUOoecU
 7D0tv6/gP6FSN4SpG6oLdFnhgTXuSh5qXWXqjNnjx457vWsT4gW/Wn3m02LtFvfW/H/g6oTdBdZ
 YAIdlE9gACCJ5c3S88dhI742PZH7delhFW7Tx25qAoZwLhn0DJwUFJjDeRMU6EVegfPmjcsK2sT
 3DAIWgsE3YTYvd131G+4dXqDrhXE6ytPOaFtjvmnqRB9fwI7Lj+qwvwX2Nz8V6VP1BPwA4+bAcB
 6iTcDdTOB20HHdtAlBKydb587BLC4EzeOoxYuprpkib+YKgbU2hye7n3JSjCrnuMGcBN2FqKRCs
 3X0T/IVLIsIpALx3S3iw1/c49Fy0KsIlsciUh9sUmNu7qMeZcQ9nlYQCr2xFic/VRJo8mW/zlSx
 I5G8e7viU0c+9h0xz8TJw6d+v1uJIwF23QefME8EzGUaDjUUVoQIA2ZAqvTSDKsW9bdjQiPU8O/
 DT6OCz9vXcuawsI6PNg==
X-Proofpoint-GUID: h5hql5aSFPZfFqvlDGDlJBRfAkGqN3av
X-Proofpoint-ORIG-GUID: h5hql5aSFPZfFqvlDGDlJBRfAkGqN3av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050149
X-Rspamd-Queue-Id: E27EF4D04CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Reading few registers at the end of the block (e.g. 0x10000) might
result in synchronous external abort, so limit the regmap to the last
readable register which allows dumping the regs for debugging.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Register map is the same as for x1e80100 and sm8750, so I am guessing
same problem.
---
 drivers/clk/qcom/dispcc-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index c4bb328d432f..412b92e227d6 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1930,7 +1930,7 @@ static const struct regmap_config disp_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x11014,
+	.max_register = 0xf004, /* 0x10000 and maybe others are for TZ */
 	.fast_io = true,
 };
 
-- 
2.51.0


