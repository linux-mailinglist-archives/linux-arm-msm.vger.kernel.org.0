Return-Path: <linux-arm-msm+bounces-94990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENbrD8y1pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:07:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9418E1DC641
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8503B31B0169
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B32426681;
	Mon,  2 Mar 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATTOZmLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bgx0WFxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753742668A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467072; cv=none; b=bfz08vvmG4yROj9VVDIedCZxdsT3auCvzlUlQGEfsjfQsPguANcUm85+548MeoxBm8bezoGPym/os3UmuNrT8lKvTAaVDIK9thvZBg2ibXpBVpSayUGQQeEVjTnER5dk7Yu0B3CJTlaVOBL9oc6Y0gZSvogcyfS76i9NSio/Yi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467072; c=relaxed/simple;
	bh=IpyCcQVX9q9Bh7P2C71ZivsP1o69+7Z885fDtTkZvoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulH3N8KgwuHTRXSC76b2/aWWJzFf+mQo94BVHlwY6ROc8MPloz+wTsWWIqa9LmbWM7LZH/uDjPxFJ+QhPudhMMVhrwcOSKH5HD0ABtoXN2jF85BxyPUE/kuq/oqYYTSrUGlNMDgKQNaUSy8wdxSr+xjx3WVV/ML+piO4Zuk42gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATTOZmLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bgx0WFxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622E5Bxw2358125
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=; b=ATTOZmLiQT1GO5SH
	cZB4CrhY+q+qpHbkF0zF7nX1VZZcNpKl5pidNrRiGqs3xa4/mA4H4lQsmfrYqr78
	j2x4srbdQC9mUTWUP9lIjsnAHicU2ACSRCCqnhejBaoGkHxnafZ13F7fjcC8VJ2L
	nVASTDuvWshgv7+c/JFQDRNUlU4csK4ix/0miN+CBeYFibRT1BILlwbJU/tzu98z
	Ry3DfXoL7ngCcOGxbhHCguiLSb2VylJ48MtJlQM0x2KWyhUnqGIMTKKbzDXvcEN9
	oROrX1aVhNw1gWAGkgVCWiHM40ckXkd7zinVStnVsyaMJWX938NM8m0aeBG7o+Cb
	8HPn6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbav2gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:57:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so3373277585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467069; x=1773071869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=;
        b=Bgx0WFxefjNCqi7hDeZxVJDj/XHO8jDopZ6kTTTCQbz+FomH90gqcsZ0/wrszZJIDF
         iGD8nGd1Cx7H9+Q5w5pAOAl7QNveCJCWZQ0Q5DObMCgqsn0gMOEJusfwQpxI9vQbhAxs
         N8emIhkKF0cdnPCgnXw/rONm0ZXbLi6aKVkgkpnRkRZN5b1Wn1LAyxyLG2FA6duGj58A
         1gEtodO3Tp3kEuzph68aNj2zl5QQdZX/jPUG8HIvW9Urx0fvn6FiEtJh35BLcW9MfYat
         7M7nlWpe4EENkanme4zmHo/bVfMeL+zjAUMFqbvnJGq2o9iGjMXBMY6h45Vz5Tr+mJ6S
         5M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467069; x=1773071869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=;
        b=cLbqMwBsWQwmbCdN6I9+wnrEQwMzo1/i92ntJBJIjW8JDV7Yffe/9Upsp0ZvTAObcp
         fB/pNXq0zr4AoIRoppG9UNxfa6LOH9gD63tKn4cqP1x4D6OSMLJHMQ0bQ6qtpuI1pev9
         KwxzoCUlHACnlBBt/j0w2LiK8BHD+liDG+ofKAV1+EpwbcpnnzUqCkV87HAphM39Jv4y
         j6N1BQjHDQaqdrUgLAQMgqtBfAnlJVcRfuynPlFF39Ao32flbxQbadLbVz10ijxGCjIx
         5CGAKLBGevdn31JghGn1EdwTFIYJCs7ifAd3TniRh28cezR7xRpQgyQiB1Kg1GBDR2SL
         t5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyNEqlBaGDwY3kaZMslMw4+imGkNPmLNtseXtQHU1gyJAz7uPtpJVo2iilSQYWb1GIgpgLpyJl4WhCa9/R@vger.kernel.org
X-Gm-Message-State: AOJu0YxHDyXPPHRby2w3sJsh7GmUH/8p6m7eYzRRlKx7fVQ8x/M+AwPF
	zzH2RrRvemqCvRd2FSszos6JvPIT++BBnNw8v828AnmvE1mH76D1ZoJ6A62hLD1fe+fYDSfFwcV
	93+6hbiCF7aQCSP0O3d53hr2U6kgSMgnENJj68u6Nf9r08lAYWCVFhuOW7VQziWaNlyOi
X-Gm-Gg: ATEYQzyw9FSWYBVaHFhz1r22Fc2xLrJgRtWo0cJwm2a/5Lw3ly5nYNxKcJhUlwEP8+Z
	7v5h5/dHCvI7VToBfFNXMjh/GZD6u+2zD5cCIIu/QLqI71Eo3lala+OgNvfmJU5+cY6IplLez8p
	gFfIZdUBzGsXdv7Kt4lfEnXkYuBUrUS9LzLbGS+A3hWh+CcGAw4U6axe/CTwfMlQ/MRK9zikfIo
	pjvXpdv4gBxVLkioVsiQyaHhfPkP8cGyjpyGq3l+ncM+OCrEdV1v7yGfQjKCVkiR7/U9l5Dujef
	MmHCP5np/MXUx/IVmlnA5kCpXxsGKYK2zhUDxbQGF4T1u3SAPQiMrDNtbYVVzxgWRC6HJQA7aZH
	ocZnL4InzqGGaER26kOKkK57WaBgwr8FtQhXqqToeYuzfsz6BLHLv
X-Received: by 2002:a05:620a:414e:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8cbc8d9d9b9mr1676276085a.28.1772467068700;
        Mon, 02 Mar 2026 07:57:48 -0800 (PST)
X-Received: by 2002:a05:620a:414e:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8cbc8d9d9b9mr1676272485a.28.1772467068111;
        Mon, 02 Mar 2026 07:57:48 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:19 +0100
Subject: [PATCH RFC v11 06/12] crypto: qce - Add BAM DMA support for crypto
 register I/O
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-6-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10084;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVyXRxFp3hoaIPdmV5W3HruIHEbBK3c+oEfKaj3P3iI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNp3uL1qF09VByovmCxr0BrPF2qt0vumz3w9
 4VDWOB+XZGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzaQAKCRAFnS7L/zaE
 w3QWEACVBpmfAzAr7VheSYyio4m2cLxyZN0JpZvXOWcCmYcyKruO1ubprk1VjaXrtxmnqPkJFOA
 8Z2G2q0RWqM3m4FtgyR2cXgBh3H8mWh1N7HNbYfe4DXsL2HBwznabEZPjB5lcQNISfLls/a0paU
 Z5yygOOtjS2O75Z0Y3xqbKacBqbxCkRd5vlQSV9hdQlebDClRP5wZT32tytJzGrXUMK7dtd/eqh
 lHTjxyF9KIAWBLKBa7PPTFW9XMRdnU/BGS3hwN9G77cZ7vh0TIFV6LbwMpUaIIA3aHaltAO2TSp
 ufaNp4It7NI71cUM7S3bZgLYHnUvqKUBjNkiLCaeykIbiJflZ8IIACcnZ2xVRdVHo2Jv9sgB3kb
 UnsqQTh2RC3Pb1/RmrwaJegHk/XCTVNVoVm+zVkbsWCd4IWJx/MZ3M+uh95STXoNAPaCX0eoysP
 IhMrn8HlnXNt5MtoBfwCHpiwbrfmioXT/6pCCPdcu06zPkCcz2xl1ytMoQJZrJ9Zk8FGEevT6r/
 TX1mw84tUvo+l/0Iy+Zx3oCzB/k5mPIfR+Eo88IZ0svKagnxXDauKwFSabFLc+jKx1UCBo+QKNP
 p7qCAu6MWoIZykAmINl/yY6tYNJzo3aUXg/mO5EVEwsIne9FhKDH3RryvT7/Xbd30U41QLqIXwm
 yOcuYuvxgovT7pA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX8PHhsssDFnlc
 ZJtziN/CGweLEXquzkR3XBH2k3stScT26xwX0HhQk5o9LVe1VK2NQoLAMQsQD5tO00cc9PROmvk
 DOdVgEbKNUA7SArbxd7QbdQ84C7qQaId4gxXDjQcUBi1nW+GZl8YIjY39dp4CnaEeK6mtz2I2uX
 9JFrauWKkaCmYaSykPeZ8NqLPNDm3w9wzk99aEe1IepI/5oLLZmJlDr0TR4oy9Czwei7mpRXunv
 A0xY2yG1P7We3xZYLRGirUjy4HsQ+vpC6rrugm+T1k387R6AtL2Os4ciKT+vKht4QjIjfIUaSbA
 VCy20PozWF442SiRdRn3YxDlA3Axx4hseDyp9B67cL2kDMP9D2VdnXmSQ3sC5Hz6EiG/CUN7tWe
 Zf3ocKkDwET6t8iG4xRLs0kyqGPsxZPjVrXnubwRX1VD0TVcYy5ToqOux42z9UY/XqybfDJAwXW
 jh3xhnMiRPWxeY8xEzg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5b37e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=koLDk85rXkRIAoTU0vQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IN-NcwMyNeQXsZW1p0vg0VAUJJ4vG9ZG
X-Proofpoint-GUID: IN-NcwMyNeQXsZW1p0vg0VAUJJ4vG9ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-Rspamd-Queue-Id: 9418E1DC641
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94990-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |   2 -
 drivers/crypto/qce/common.c   |  20 ++++----
 drivers/crypto/qce/core.h     |   4 ++
 drivers/crypto/qce/dma.c      | 109 ++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |   2 -
 drivers/crypto/qce/skcipher.c |   2 -
 7 files changed, 127 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index abb438d2f8888d313d134161fda97dcc9d82d6d9..a4e8158803eb59cd0d40076674d0059bb94759ce 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -473,8 +473,6 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..b2b0e751a06517ac06e7a468599bd18666210e0c 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -25,7 +25,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
 
 static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
 {
-	writel(val, qce->base + offset);
+	qce_write_dma(qce, offset, val);
 }
 
 static inline void qce_write_array(struct qce_device *qce, u32 offset,
@@ -82,6 +82,8 @@ static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
 
+	qce_clear_bam_transaction(qce);
+
 	/* get big endianness */
 	config = qce_config_reg(qce, 0);
 
@@ -90,12 +92,14 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
+static inline int qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
 	if (result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
 	else
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
+
+	return qce_submit_cmd_desc(qce);
 }
 
 #if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
@@ -223,9 +227,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -386,9 +388,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -535,9 +535,7 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	qce_write(qce, REG_CONFIG, config);
 
 	/* Start the process */
-	qce_crypto_go(qce, !IS_CCM(flags));
-
-	return 0;
+	return qce_crypto_go(qce, !IS_CCM(flags));
 }
 #endif
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index a46264735bb895b6199969e83391383ccbbacc5f..ba7a52fd4c6349d59c075c346f75741defeb6034 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	qce_dma_issue_pending(&qce->dma);
+
+	return 0;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +125,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index d7b6d042fb44f4856a6b4f9c901376dd7531454d..9552a74bf191def412fc32f3859356e569e5d400 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -113,8 +113,6 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_dst;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 872b65318233ed21e3559853f6bbdad030a1b81f..e80452c19b03496faaee38d4ac792289f560d082 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -147,8 +147,6 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;

-- 
2.47.3


