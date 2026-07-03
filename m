Return-Path: <linux-arm-msm+bounces-116288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 25HiLtGZR2rUbwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:15:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D22701B56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:15:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=REq2QXeA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UEQB5FOm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116288-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116288-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D818A301C59F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1103ADB98;
	Fri,  3 Jul 2026 11:10:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A75375F83
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:10:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077043; cv=none; b=EZC151NOeFe8wZjbkMTW50ln+3KgT2/U6e/bDpcD2XQRv8UL6AA68qd2I30/+n98+huDFT8lc2yOVVV/RI5VsYGKZ3F/eGV7G3Ppbbnuv/ScrRPl8KiUAYi7NSoA4Tjq+wTiq2NAxjENth31wzLBXcDwX1g3miwjbcYLHqqqxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077043; c=relaxed/simple;
	bh=6Kne9SHF5TgjE0VibyQ0aLbJJjhNGSb9bnFsRqFEhuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IYiDErGgDI36TnmRNWT7pDUZShdYoz8bd0P+3kI3eSUNp3tDgAlspEOsBMPMVYeAm0eFAGnvahQoxZ+bCeSonCBOQlWci7s+IsBjErWzm0JiBEUs7M3cl9FAPERzOqTh79JxI4R5j78QdizyvL1+aNr8Mt2PgcJH0muA0sBqAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REq2QXeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEQB5FOm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2wr83772893
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXvHOt+3maIcxX/mM5iThF
	59AG57jKAB1ekI7t7BEKE=; b=REq2QXeAashjPtHHDTJOqBjLDZzP2rzBa9ykrn
	zqUJC/JYuciTvWoMPWI6DdP+USIQO7hI29lGcvQF47k58aG0cBmsa4bp6wIcgNoF
	Kty+MUIxw8f6/fgO8RsRHP+8h++gYwnlf9cAiwEp3jW/yLUcx7jt9QPUcos83YJD
	zKFemrjLZqkVcHJV5zhkjO8uSdIBuImIUACpNYFAub4ETRMYAH/8hya1n1jYWDZu
	BaXy/TPIkgOAc1Y2iNOTrBxKb71BgkyFIcAjzJ0yQdJ3Hyq0wwNE3CqPYLRVW7aN
	qQXGliBku1FTLbvk8Aenja/m6mV1iyEfCXrMNC+KJpp6UO6w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b0387kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:10:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so915140a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077040; x=1783681840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXvHOt+3maIcxX/mM5iThF59AG57jKAB1ekI7t7BEKE=;
        b=UEQB5FOmepapjrIZZj6tAHPYjBQFgQRXThBjJqDgtUTT30JZ4byQ8xvA+CRUwgl8Q5
         cQYCCR+wtKY8YgdH19PZqhgIK2SyXGfezTBgpUwvc5yOr9e4f9KyCeM3+HpEQ2cVYpR+
         fIuX5qwkInh9IFSL+SlhcU07lkAtdOLRgbOh5G/vp8pwoeEP5MjeYm6om7a+Uxu9XTQw
         oVBqCE5lVChZcz6p84EqpvnEk1xsYlayR+KSDeX/+wwo3XHLrUe5fe0xPR81uyLQP/d8
         KzMdlSo6CvkvKctchgREtOTvaicNDUvGvdVc9WjJUuvW61s/Av0lhxZpFCSGhLyq7NTN
         0jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077040; x=1783681840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXvHOt+3maIcxX/mM5iThF59AG57jKAB1ekI7t7BEKE=;
        b=dCIwBie1VUTSipsf/NNkwu4uvR561uIi7ICKtj5Y3ImTqTFqxtpHnU3UOeR7wRBEuS
         4nGS2B5wcdKtgYMPH9MuVnRFMpyswdoUymnmbdXHNX5oIFLbw11sFPAY1WKYwN54htOS
         FdRVW2uHKnvYbIGkf5D6pIItsrXpOCM1va4bG7uSBAyX6tDUQxYgfCUPyMfrXfJ3RvkZ
         oIDFmyWSW3E1g4JRJAnfwK3RUCp8TGdP8tBQ7oln1zEDWuuFdYd/C4BN2eJIRWMn5sGX
         hrurluubEzEIyUKU+6JeL3XaLpEdNy9DqTLWOocoYc5b/DeEY9mQcoPYjHgo+98JHKa0
         303w==
X-Forwarded-Encrypted: i=1; AFNElJ9qTijGb0dMTbEoLMM5kAKm/oSklkW7+CDYW8Sd4X3qSOJ97/GEnhAIgUdQ5LB5kFaEQdGinEKBJP9dDEmj@vger.kernel.org
X-Gm-Message-State: AOJu0YztbqA1La+4H1bWBpW3IlLBDPpCnVATkCkwbqoQP9+W+nh56CSX
	Zz7KAgovJKyH8ZOfDN/UGW6OgDqLdj9+ZKUM6Czz0CL7svYU2aTjECafckp83Z5fXklQ21a+y2a
	v1UQnIvcwoeLy0b5qgjUqsMvYMDbf7PYWKnG8ZxNHTRDpLvU2NhNjSi63tS4rrPjvZlOT
X-Gm-Gg: AfdE7ckG0NY0txFoJpwqTQOkjbJgMY2XliRzxe1e7Wvz2IWtZDwgqX4sATse1HOAaMr
	Or+AN417Gp7hUNVk7GGVzYfTsPhBSHJbZwRt2xLLlL5DfhKfQGZDbNxAKCAvgDJVFQyMnI4j8J1
	8y6CZw8z25tXklIDU9nU4RRE4QxDyjk4tlTjJ5XZGzr8H4NHyGr2Dd9yQQCLWDuwLOuRs/8l2kh
	D4/WNuqWk23fHbyO/tw9O2QTeETvpWCwEXsnOCAIWWVq1sXXh/mMlNiYwbZeFpyKT3sV3JXS/x3
	lrmYeS8dIFng5B0ZenWMKlvhSnzyMPEslz6V/nvXmmP3OI0sgATAq8AI2SbLCr8M6Dhi+rbNFjk
	PFX4SwXqa/0RHO9kojD1c6mkJv3l5hdYMP2HTMzU=
X-Received: by 2002:a05:6a00:340a:b0:842:6849:2180 with SMTP id d2e1a72fcca58-847c0988a1amr9359612b3a.37.1783077039677;
        Fri, 03 Jul 2026 04:10:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:340a:b0:842:6849:2180 with SMTP id d2e1a72fcca58-847c0988a1amr9359579b3a.37.1783077039181;
        Fri, 03 Jul 2026 04:10:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm2836444b3a.27.2026.07.03.04.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:10:38 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: codecs: lpass-{tx,rx}-macro: switch to PM clock
 framework
Date: Fri, 03 Jul 2026 16:38:50 +0530
Message-Id: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOYR2oC/yXMPQ6DMAxA4asgz1gKgfJ3lapDcNzWDATFtIqEu
 DuhHb/hvR2Uo7DCWOwQ+SsqYcmoygLo7ZYXo/hssMa2pjM1poDqkYJnwi1hTDg0t7p3llpX9ZC
 7NfJT0u95f/ytn2lm2q4RHMcJSbPVq3UAAAA=
X-Change-ID: 20260703-xo-sd-codec-tx-rx-94538a2c6a18
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX/uciC/mjJRtP
 d2VZCrc1IsSszmB1+iqYTrr6fGD+emmtGEHj7ifZMWbL/Q1rOE4agSWmoRGYlMjU5Wlo6OMFARF
 LdOD5Wkz9iM2F1ue676QcNqcMliRwnA=
X-Proofpoint-GUID: VQFQAI4BbUq-fUZZNR3mQXymuTSIMKUH
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a4798b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N2Be1dCzRr3-Ybzih1kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfXxp61OoagSbug
 HBLomCgfqW+mvDKLfZz3cOaTrJmDC+l9DQwzo2bugah3eczdyDiB5GjMHUTNCATyrFHnlYzxt4d
 1OwcPwUbra1W1rv6tFdcUVoUVaR8zJ2MjXIftoW5k4UGY+Hvl+Bsqdc34FHyRUC+GLW6/nvJRfd
 bZ5eCOhqU6i+kGCFF9zO5dVyGT1aBkmN6tknYAL2Ie7c6Q95H7cXf7BSHLI7EmkeXPp723aPu28
 0xG0D/uVFjE4fTO7McvQ23OLGhXIA6rzUPCIttt+idM8VAPVWQWySTg1nU5dRK+6KqLjFR+Gpdu
 LQ05cynTyMD1A7upAF19RQAJFx8LfJWJQUPGX7oM5qRcQIkJ2YXF8UmseMngApsdTpUax/yLptL
 AVZ+fuUJupzTBwX7+a97AxbOPEK++Qq4lTRWKyHeoLWZks2F6zNfmMrwlyLcWgSZBxgjVx85AVf
 3L10ch9+yDmuJfeTZJQ==
X-Proofpoint-ORIG-GUID: VQFQAI4BbUq-fUZZNR3mQXymuTSIMKUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ravi.hothi@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D22701B56

Convert the LPASS TX and RX macro codec drivers to runtime PM clock
management using the PM clock framework, completing the LPASS macro PM
clock migration started with the WSA/VA macros [1].

The conversion follows the same pattern established in the WSA/VA series:
- PM clocks created and populated from DT via devm_pm_clk_create() +
  of_pm_clk_add_clks(), inlined in probe (no helper wrapper).
- Runtime PM enabled via devm_pm_runtime_enable() with 100 ms autosuspend.
- runtime_suspend: regcache_cache_only first, pm_clk_suspend, then
  regcache_mark_dirty only on success; rollback on failure.
- runtime_resume: pm_clk_resume with regcache unwind, regcache_sync with
  full unwind on failure.
- SWR clock gate prepare/unprepare routed through pm_runtime_resume_and_get
  / pm_runtime_put_autosuspend.
- Probe error paths tightened with dev_warn on PM put failures.
- Empty remove callbacks dropped (devm handles cleanup).
- PM_CLK Kconfig dependency added.

[1] https://lore.kernel.org/linux-arm-msm/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com/

---
Ajay Kumar Nandam (2):
      ASoC: codecs: lpass-tx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-rx-macro: switch to PM clock framework for runtime PM

 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-rx-macro.c | 114 ++++++++++++++-----------------------
 sound/soc/codecs/lpass-tx-macro.c | 115 ++++++++++++++++----------------------
 3 files changed, 92 insertions(+), 139 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260703-xo-sd-codec-tx-rx-94538a2c6a18

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


