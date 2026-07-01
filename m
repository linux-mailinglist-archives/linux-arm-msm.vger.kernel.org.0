Return-Path: <linux-arm-msm+bounces-115779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AnMFOyRrRWqG/goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 21:31:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 852586F0DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 21:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RCQxhiih;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=buA5rVAf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 906A930597B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 19:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF3944BC9F;
	Wed,  1 Jul 2026 19:30:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7543DA5A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 19:30:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934224; cv=none; b=h+evLwjm+E1Y6I6JVnHHiISFF5y1hy/ceRgBCDfZl73vIKr69b4TMl6IzktWGOko0YLJGKPNhCvG5EmCrKfpLJ/15RYNtLqaDdAKI+lskEnGs7DSaXEsTNO4hE7vmpzrCU0A+xbsDYWaU+QKTTAAcuKNQcEKUxYMS0jPdu2m0e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934224; c=relaxed/simple;
	bh=MYPoYRF0x1RELKNLtMu5ZwrPH+l0mMKrWn8KMLIpN2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7No4swh0MSdnKsurL15Cauy+lzeywLynJ8YzHBS36s4RipNp/mmwLDHdyxDUVj1om+dzngcwP9KwcmST1qUAtXFIW9iCTBkF2CjEb+6jscef9e4JqjqozQzlOKEwCnd4zHpWtfK6g8IdRwkMlGdFM1m6ZI03pxu0K+mxpnb6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCQxhiih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buA5rVAf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmaI91630466
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 19:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rnPd10WcdOH
	mEsRs91BWIgfBdXahim2EReLYaWIIX84=; b=RCQxhiihEw7iLyfyd+aKp8a75ge
	XYHeicJF2I3IBzh+wi5xH6597HOtoMeKDcO74pCUIFShezvLKpmLY0xQlpN7A6PF
	R+gLQFqInT/Lr9eRWmzBjXvVf029PiZ5cT8NSXAZHYovWrk8FZSqPcoUtsVC/p9O
	8inaehoFIlT9bL1ciFF35LxsGxUwb7HyMX0xRoWYI059cd7IAfMZ1KlgpMxHalH+
	F/3F9BnpIjRBAJSRIPjNgBmAK/cbRCimXRiVyyX9hPr0XTG+/1+WFXXQp11nPIlh
	q7MZu88eHWFCLrE9LTQv9uDZMIjX2OpayUZ0lH4JWvM3ciqGS4JMFBd5M3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mgu7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 19:30:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9203d077d77so175382685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934221; x=1783539021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnPd10WcdOHmEsRs91BWIgfBdXahim2EReLYaWIIX84=;
        b=buA5rVAfepzJ9DxQkRfLH6dI+WDw+GPfhtEF3efEqBYMDrGCmlxViP1ruYyPtoPGUF
         YhBjdSVFis4bD9JsrcewBldiqhnzCCuffbjIa2xhKaBkjEFzinlTRKX/dLfQnHXakzsA
         nq5uV1uCOWLhB55Y/s9l1s+NgJN79ACDDmLkHQHZnI3cQJDzhP9oFMesAbqDIaOXvmzR
         hwIYYNrw5Ox5OtizzIuPyVY0NJl/GW08wS2rQtieWNTFSInUKOiEcmo5/b0m4mr8PlqM
         QGUNFJtC3FriJhjOt5sRRx3R7OYhSr0qb+fDJYRRa0kZahI2zxx7JZH6Rc8V38ywnuDZ
         LOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934221; x=1783539021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnPd10WcdOHmEsRs91BWIgfBdXahim2EReLYaWIIX84=;
        b=IB3v5zXpSsn4+oR2eDpmbH6aKRw2jvGT8ujXTr84yEyqUqEGnbYRJMqa9Da8MabYIq
         lYd0kAXpsfl6JZ6a46H8EqAPhzOCqyLaXgLVlU905/HKmDgVZL99/jbcMnezweG0pbSj
         NY01xeD0eaey4pTbOr8Vea5gTrEDuNCRQYhjO5ciNNY5/8f3tgrNWFajFjuuyXVTpjZR
         DS3O2Aju8XOPAnOsvWsKzlMP+fN9LBAI3oLDaCKtP7jSynlTwlmNTEUkePT/dGotApMV
         pNhekfF/7Zbv4Nynr4yinaOOzVlYjzPhlhRG0TAV90bHvftM58smpS6BZ49EC5PrBhbT
         +hlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rulvN5pLbmEkzklbSh2VZfKwI0S2PhQq4ZNpngsGyQOP1rH3htJV5mAlI91zw9OJiirRR0q05m46b2ecH@vger.kernel.org
X-Gm-Message-State: AOJu0YwukHMfha02q9lD4LuXSpM2AM9bZtSPTZ7Ibq9wNSGIEUm8auOy
	JqeuMn8naTQGiGYXG48gO+XsB2FbwVK8r+ci5M7ylR4r+pQl4/0uSdLPHNdxp9CiZ5cICSZ53ig
	eTrGiliGWIbReCBrpzQApbXd36Cq51F3khXolHCf4Le5yooFM9YLMRAn9pJ0SnbaRToYm
X-Gm-Gg: AfdE7cmIIBOHKONBiOHUdJIbM9aX/ZQbAOsUPBgFlldyNZ8+4q40FVV8LmRQctNwWir
	a1JI/WIzJtMfLLV9h6QFJ6GNpqsoahPOAJ19ydn9y+bH6wn5IvuWTY4KWRvv/3dw9N2EkcqbHx+
	3eYEJXEvmwOVRsdBYr7WX26GPM6r4D9gqQCzmrGrgpspruQwChIXPiLZ63eesdsH08ZLNQNtjcF
	oAD9Se9tDp6W0N1aIbnmr/CE3RXD71Cgu6bAkI+Jt3kscWIiUFSCVky9KaTv8B/cXMwSecR85xK
	h1EkUPY+RnmBcflCW7kXh0jbyh21GaKO6E/cT1Um9gG3qM+j48lkTXi5b/WGOgnJKNksGhtwkE0
	SgdqS8cJGKb1cemF1n2q1bYT7
X-Received: by 2002:a05:620a:1794:b0:92a:3679:7978 with SMTP id af79cd13be357-92e7afd903amr344422785a.18.1782934221249;
        Wed, 01 Jul 2026 12:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1794:b0:92a:3679:7978 with SMTP id af79cd13be357-92e7afd903amr344415585a.18.1782934220725;
        Wed, 01 Jul 2026 12:30:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm78261885e9.1.2026.07.01.12.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:30:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH 1/2] soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
Date: Wed,  1 Jul 2026 20:30:05 +0100
Message-ID: <20260701193006.4113-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eYNPymhC1-zn_ZqLiobnC5Wk54lbtdNR
X-Proofpoint-ORIG-GUID: eYNPymhC1-zn_ZqLiobnC5Wk54lbtdNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX1ZYJ9zNUtVG/
 1CCiw0yyKiuXdiEdUUaMrB5BINrqMKlDXng92OJcPjfwTw0sJmD9o/KcJnk8FdvG4yIVQF8MChU
 QfR/QiDPLBMS78eSnZSsLhsLVSaqlZdPl6tujx2DcL92hsMLsa+3jVqyDRIz+l3Hm97Sr8KJek6
 kYAkksVviHknGtwQ0XBtNLGe4/VSupvhG+LhijZWt1kTE+n1qLYVX6ca6DJ0B39r5CIxx8IFaMb
 LVFZKgvnwMqlfRn64WXH1YBu8YzfwPJ586rancvqU3moGPJdi3Up/vDaUpbNpNsh2UchHkcCuyQ
 X7yxMVzkNtV967FqLpGi0y6BPBt/ndkGn2e3MxakXckFldptCGvxSYkJagG4yvY2AxUURH/BenF
 L6xlFtJFY4FZX1hG60K+htA+Jzc9EkGP01LdCi2QNq0xlGmvSZG62xibAzqbb4CwTtk0TBVCI27
 eqfIyYAN0R3oH99S9JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX+dW+UNFckQNU
 P0o6AehNylQWwcWpMM4rTaarWwVHdNOJfW/9Ln7MSbb3QRjnGonIIhWjboSx9n/hXzLlT4LCSlF
 qxNhq7vj8nLG1n8Ot+RfHY4tlCwTYk0=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a456ace cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8nePQdK_g4Z6DuqQSbIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115779-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:srini@kernel.org,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:sashiko-bot@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 852586F0DD9

find_first_zero_bit(mask, n) returns n (not n+1) when all bits are set,
so the guard `pn > maxport` is never true on exhaustion.  The driver
would silently call set_bit(maxport, port_mask) and assign the
out-of-range port instead of returning -EBUSY.  Fix the comparison to
`pn >= maxport`.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81eff1..b288218f64b4 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1271,7 +1271,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				else
 					pn = find_first_zero_bit(port_mask, maxport);
 
-				if (pn > maxport) {
+				if (pn >= maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					return -EBUSY;
 				}
-- 
2.53.0


