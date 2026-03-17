Return-Path: <linux-arm-msm+bounces-98186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOUJJzxguWlsCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:07:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25F2AB789
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 437F3316DD0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A44130C61F;
	Tue, 17 Mar 2026 14:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzHQqyAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wmh8J4wS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FA3E1CE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756177; cv=none; b=o7eOwa2Qnr0dw6Dx80eVKjkzYDB8TyDN0unG14JKGJND1Vqcblkc5FZbqtKVUawXEZ9T+JRsqAOu3LLdznYHVp4OWAFGUf8Oc8a8n/NL62yqcLdVhzLCmQq4jiJ8/tFrtrTAE8Yy8GyTDOfLFqw5CF0HmvFa2G0UpvXsmekV3r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756177; c=relaxed/simple;
	bh=p5/Xkh9v/3vCwHzmvjuWAz1PZrCl432d7hL0iI5alyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuwLIT1cYwF8miQOksMmvzu3i7hwc1uNDTnZ804FoGvnCLrU8W6diEurTjzKmrhN5Yy9m3egAUTQnzcWqY59LNgTp0PJRqRXMoCTZF+Cmu583WhKgxmFYmJGZtCotbzuvJ3eHIOgkj+ml5iIbmBZJfbCBtiS7vvKBO56W+/5N94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzHQqyAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wmh8J4wS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD501O668972
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=; b=kzHQqyAFh37bfQr0
	sPNkqBny7OC0+Q5lE9zHqn3U9poNKBdtObHoPUhwQOPrCbDpDC/ntDKnkRgCANS8
	F3LWibfEHyW8isOzwM5W0R3zTAyWaR0BO/tuxqIoUSbIGGXtKQVd4tGcJP9LeRlL
	ZRYijnCQx9VIRtxqnk7/1gi6Q//ZW18kwGdUu98obmLmClIxNGfH8UU5Mmmue+Mu
	i6MF8Z4DNv19hPMAJIQkdLoYxXpbH+B4h0lfTdqvNtalEWYrh9g2eCqRqFiysMYl
	mri3Atmqum+72drasVls1e7NjvyUsb+jM0/jydfpPv9Q/FhhdkUVcSpC8LAuvjaI
	I6hohA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he06vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffad14cd7aso8540926137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756172; x=1774360972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=;
        b=Wmh8J4wSKlMapwUBcDMZTmXKnJe7EvG5o1RfxYhMZnVwTbglnRuIUVPBtp+wlhwTVN
         3eP5K+PrDhwvc/jVGXDnbfetOQZA1dzHgioypGjMsx14MC/GUmjRY9Tlm0IkSg6Un+GY
         py8UZfwgoCtuCMVD8PGXKHRpKGwPo2P0cwI+OQbWhXBjJU/EHZfTE/S6nrRfhjQLcE7I
         pm4MaZ7VfqgQH8IXqVXIX56JolR86/rJakLUxWOYLAtAo065HZAZhuFWBb8OU+OfrCUe
         Ja+D3Vw2l9ZARu3ih4HNeWEg7AL75ttwCOObohia+MqXm/irxOjjRtykavnr7cH4J28n
         5L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756172; x=1774360972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=;
        b=TGrEiUQD914Pez4d+yhvwaDLELAe7l5s57IDlHuPi2wi68ln38r8b+SHr2auJBLnyr
         owYwaUecPXMuQUGAyDFMcwz6tv9lWpBlZhaLdSddwMDhs8dvo0Hu10U25P8gQPeoBKTc
         ExTF3iGkwsDXGfoSIk98vNZcp6Ulf7WZE+4zS5QsO3CQZB6Wle45CX8qJPwx4psxzPe7
         /hAvnMZRxrQJwDVTu4WGvtSVMelTwsswqgxIiMsnepPETGhx8IsNrnOiZT9r+uQouXob
         qal56s5CMgvMu35d6OC+VI/HzEPeVCN5AYGvmsnlgfk96HqAH/oP5xxPS6tX/kpC0i3V
         d7dA==
X-Forwarded-Encrypted: i=1; AJvYcCVJEvOm50XUGTlG8S2Uh3/SV0nwwlvRNaJAtCzIn+lhbzLwHwb32RCNiRdrrqABDlX2agtd2bDuifZphYrT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt2N+jnLQjtGpnXo/YT0+ndk8ew2mrWW4TyJ1IvdhiV00ZolmM
	KIeHdaWexspDFQ3aU5y3qwKA1cTDPwRzAINh3bEUv1prxgUUE3an5an8obV8n5QKhlRi79ujn+e
	mSwC+UolCUKrv/09OCfwAdpob1GPIjvw4jkNCquMKav/M1a+9iHZzj2+Qh76r56fDk8Pz1n3IBU
	C/
X-Gm-Gg: ATEYQzz/uXuLxKsDk6H/LBfx4axNENlhDD/b7LTqM+cslbtM0Seoy8gxnmc2QDsLhzO
	p06LoNRdeZ0HqNm3vcX9z3f4+qJL9dIsBQuMBTI7P6KGapwvmbPN32pfGFX2bMYhnGcA8EHYYhF
	6CHRRc4YRCGZSJaVw7XNCgrEpr2YnDMYV7huxGFzDLaj+dfjqhAW/CZpTmTT6Y6GfWXeOPhMcEM
	i89vzxZolJ0ZBGJ28YZwSutLpM2WU8zQm8iAea3yHDTNf5IFnmanK+JRzPJotfyexWFP18Hda0o
	364cCMLCF/PlOolRWm9E9SCmk4ZbhvinI+XVTFyxvvSal2aK158HyjrQ0AH4nF2jZUwMsX1BE+w
	yglAzKMKhyV/7UEA7PTOTPae6CGIVZpItUgICKcu6zFqdSMroTIsv
X-Received: by 2002:a05:6102:442c:b0:5ff:ed38:187a with SMTP id ada2fe7eead31-6020e1ed1ffmr6223053137.5.1773756171997;
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:5ff:ed38:187a with SMTP id ada2fe7eead31-6020e1ed1ffmr6222797137.5.1773756169815;
        Tue, 17 Mar 2026 07:02:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:12 +0100
Subject: [PATCH v13 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-5-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8683;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p5/Xkh9v/3vCwHzmvjuWAz1PZrCl432d7hL0iI5alyg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV712xjHxJR+yrqxIiLg3sagzBxcsc4EDIvxH
 6S4CI/q1EiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9QAKCRAFnS7L/zaE
 w32jD/0ZGSzAuDMJur3nnXt++W24W5kPa3BzT/BW06FobMsPPvbNiJxXSL/T7+14et6DObEK/l+
 MJRifQnATawzICjOnJjpE90ZbsBT16pk4aOKQLJS62KWGOrBUOBMlKPzuW+apA8y6SZHzJmzdAc
 IDyh/Er8vgnEfuuSL66LRLmvU5/fgylESCxqcviXGngA0FJnnkaYZbAVtMowHvpYA1ENmyPHMRV
 SBm7RpIBLrqy1Z+yOnRNQgOsTpIgqkXo03aClo4zv32CJFrB/fze25P6CBaFsiOxeyk8/uxJ23y
 3PDJ9omoaQMbByXDG3r3bBNOK3EJNMpmYrtkIfy6Fnjzpb/Mh8ZCVQw33CWQktOW8TRYAWfBNZb
 kT9RSK6bj7aZAsiK4dqsCsC2oCKpXhE/oxgD4Ujoys8uN+dI4DqE735zBcrsgEZDk3f7vYduG6F
 0CfsOJrebcY4d4fB2nk1wDuUEqzLjSDTT4kP+37udDI65xnrUxxC3iET8jZtVBnh9c00ipwwJiV
 jeR/HJgMj9XRpyz6mrwOI0Lzl4FaHe4ZoC8OVzpdY9eGU30jfF0hay0UI8BOycJu2uZ90aG2hvT
 oydlry22c4zeH9Pps/4J7v+mMl84uJK+KdQMz3CAZnFEk2vF9vhcJyjXy7huN8G77zcca7is9v1
 ErNgXZl3gPWHZPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sRps-8-gVxh_0f7J40PzpDYArsvUTvOu
X-Proofpoint-ORIG-GUID: sRps-8-gVxh_0f7J40PzpDYArsvUTvOu
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69b95f0c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RdU2YfPBjIXQodyA8iAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXyvQyHxHNiiF1
 hkDs3KrQnxFsXFROkiavRqdC9fb332Cw8Q1LqJVnhUd567KJAL0X7vMGK/gGHC6pdzWhUKhNZdG
 5QO/VuvbDIqjAS6IENKxHUEpHVhqJ58VuDDNEm90Ub8tNb54DLnsrCV36NHZc+XOSJbsQFX9vzF
 mCNDyzt1bZ+YB39KKXa8Xd66trcKjIS30rjgP62yZllp/CY5QteN4v1shapIvb5IDWsm2f8RnBI
 Wzx4zl8WSFIycaXxlQpwLGholWxmnBw3fgDMkD999G7ffjEyupDQ0vVptblPyXCQh3Z/yjXe+lM
 sgndYh+0XYLLR9m2WsK8p+T4A0u/xzhWPQunER7mvyohVuDdw6+sMYesBt9oD7to47GZLtoqgLM
 R9QfDuFtQgYzsK2rqXQhlgaseTAYVVe+2Vu1uxjKAXPLxA4fMCeVTMr90TvFV/oqWrWeLTeqJpP
 ++OI6C6kiwIiFcTTK6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98186-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D25F2AB789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for BAM pipe locking. To that end: when starting DMA on an RX
channel - prepend the existing queue of issued descriptors with an
additional "dummy" command descriptor with the LOCK bit set. Once the
transaction is done (no more issued descriptors), issue one more dummy
descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via descriptor
metadata.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 160 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |   4 +
 2 files changed, 160 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..895286452c8b5e701c1df482095e5fe4a49f4246 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -391,6 +395,14 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	bool locked;
+	phys_addr_t scratchpad_addr;
+	struct scatterlist lock_sg;
+	struct scatterlist unlock_sg;
+	struct bam_cmd_element lock_ce;
+	struct bam_cmd_element unlock_ce;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -652,6 +664,27 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct bam_chan *bchan = to_bam_chan(desc->chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_desc_metadata *metadata = data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (!bdata->pipe_lock_supported)
+		return -EOPNOTSUPP;
+
+	bchan->scratchpad_addr = metadata->scratchpad_addr;
+
+	return 0;
+}
+
+static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
+	.attach = bam_metadata_attach,
+};
+
 /**
  * bam_prep_slave_sg - Prep slave sg transaction
  *
@@ -668,6 +701,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -723,7 +757,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	if (!tx_desc)
+		return NULL;
+
+	tx_desc->metadata_ops = &bam_metadata_ops;
+	return tx_desc;
 }
 
 /**
@@ -1012,13 +1051,115 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
+		   struct bam_cmd_element *ce, unsigned long flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+	dma_cookie_t cookie;
+	int ret;
+
+	sg_init_table(sg, 1);
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return NULL;
+	}
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(sg, ce, sizeof(*ce));
+
+	mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
+	if (!mapped) {
+		kfree(async_desc);
+		return NULL;
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(sg);
+	desc->size = sizeof(struct bam_cmd_element);
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx.desc_free = vchan_tx_desc_free;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	cookie = dma_cookie_assign(&vd->tx);
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return NULL;
+
+	return async_desc;
+}
+
+static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
+{
+	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
+	struct bam_async_desc *lock_desc;
+	struct bam_cmd_element *ce;
+	struct scatterlist *sgl;
+	unsigned long flag;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->slave.direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	if (lock) {
+		sgl = &bchan->lock_sg;
+		ce = &bchan->lock_ce;
+		flag = DESC_FLAG_LOCK;
+	} else {
+		sgl = &bchan->unlock_sg;
+		ce = &bchan->unlock_ce;
+		flag = DESC_FLAG_UNLOCK;
+	}
+
+	lock_desc = bam_make_lock_desc(bchan, sgl, ce, flag);
+	if (!lock_desc)
+		return -ENOMEM;
+
+	if (lock)
+		list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	else
+		list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued);
+
+	bchan->locked = lock;
+
+	return 0;
+}
+
+static void bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	if (bam_do_setup_pipe_lock(bchan, true) || bam_do_setup_pipe_lock(bchan, false))
+		dev_err(bchan->vc.chan.slave, "Failed to setup BAM pipe lock descriptors");
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1030,6 +1171,9 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	bam_setup_pipe_lock(bchan);
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1157,8 +1301,15 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+	struct bam_chan *bchan = to_bam_chan(chan);
+
+	if (le16_to_cpu(desc->flags) & DESC_FLAG_LOCK)
+		dma_unmap_sg(chan->slave, &bchan->lock_sg, 1, DMA_TO_DEVICE);
+	else if (le16_to_cpu(desc->flags) & DESC_FLAG_UNLOCK)
+		dma_unmap_sg(chan->slave, &bchan->unlock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1350,6 +1501,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..f85e0c72407b5e1a733750ac87bbaba6af6e8c78 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -34,6 +34,10 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


