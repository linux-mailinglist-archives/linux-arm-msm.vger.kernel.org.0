Return-Path: <linux-arm-msm+bounces-98193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKg0E89huWlsCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:14:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C412AB973
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69C8B31480F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EBA33556B;
	Tue, 17 Mar 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liKAUSj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyzkXwhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C330C61F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756334; cv=none; b=kRZ81pMqkEWdNq3X6VSrBm15ZmvmwQC96fSl0GhDdYaw7StLJ9aKX77Zqr3pqcvTcpcHlF5yFSIglew1BXARmQmPGro591l97VNc3awee71ljEBg1JnXrZQV2UWjtrKeQBDjhlMEPF1KKEK7ADil0xgwu/GkxZJbbl3chdg2H1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756334; c=relaxed/simple;
	bh=6dN4XjHr+6OQnOzxmGwMll0VZH7PW0q5aNlxk1E5+Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/OnWIbZLkA67SHlE3w+6EyWmspiYIas09IlRCDcVZNXHes5zMGjlwIWMP205RsJCjRhDTJwKhziytA/oVvaoAKj7gUq9RX99mYab+mLwnBY+OXaBvc/8wUy3ixoxJsl4tVHJc2Q2oe3VMFF18NywBqZ86vDp6UEptOs4JGnwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liKAUSj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyzkXwhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA39QU2071568
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=liKAUSj0fGhwnrdz
	tyZen0SYblevWbWtazQX1DnMSZTXAhXUXUwWWOlmvS4oQBzMlB14rIHZVQE7sFrj
	hD2nrkDFohSZZxM/7a57YJMXtujybwEw6LDfEqSvKZ1GOnVd90Ig5F0/933LjkET
	pOGASoW9ZTP5O9ABV1rETkz2CLAsZiu+nrc1UXSRRucdW/ZE/Jop+EFVFukqYOs4
	3bno5WTqr8pgWVTsdXK6dgluusSOQjPVmkhqdUKoTkBNGRD3vX7L0bJPfKFHQ6/i
	X0J+sGY4k8kqKE/KEEu7NI/eANdT2GjWfS/XyxdGCApfLUTZy9CGW6q9s55QhwPj
	IxHpTQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6rswb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:05:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60271a6a5e8so627512137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756331; x=1774361131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=QyzkXwhOks5JsU5FY4JjKNY/p2TNnxHYZMNrVMkK8mqEPQNSAqtT+VxZvNLsxV9bB/
         cWlc1TTDbQsFj8gycgAv2DG2BnWDsu/9EhB5rWCgqvYMbgkuCnBKeIYlin70M7O/8mUJ
         /jZKF+5AaqgKR9e6bVHh1/l313/ZF8v401o81rUmePVOIuU4o1VtfAaMn4B+oBNOl47T
         KwBtWqTAIQFO0YVYiyL3I0rtVPppcbxTV2KIBQ/xVQHc2KZSn8OAgKQ8aiuEB1qE4xnE
         yFMaJply5QXTxeRnNUrp4/xdBcYy2zwAb9Fo1fgVSp0XFofdg8XCQFNZV7wL9jDen3kv
         X6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756332; x=1774361132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=s6wXO4c4xl74oQP+OgwclGLH7bFo1qDi5obmXP8Tu8o/kIOtMMjvdN8rfdkCfkwGtV
         L1dj/m6Q6UH2wuCGmdP3atPQb9HxmNDCc7UtVJfKc9X/9cHykjh0OrqWMU0Ia1Jl3c0a
         YMy+u51zmNteCBhqa8AT4TUCJ8wL4w5oemiSx5rr+QW0oLvCVoKAfEV/L570uAZAAdpC
         K5EFC8gmV/++wVLGvIwmYHOL/GpCVysh+0VbE2B/9b2iM4U45GvUR+4c2FOHKAK7zIhz
         s5tEXcUDiDxb2EJgXOBUEespLSU0BCUb33c6/xGkPFbLQ6yl+2RuNG16zgOEnXZDHM4c
         vNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg/bk7Wwl+xP7mFCjxr6QUsEDW+Vp74xKCY2PHVRr771agpBuofNvijVrYSwFnappWhSIn8pd5CiC620QU@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFGOLIUZzCsJfkKUR37XYUq15Y6VjRatrNiDhHFma+txAyqPC
	fV/H7eqxUZCQ2BjfdetkPD/ti67ri3+MIYTG4e/BZU5LDuVn56ObOIuVEkwfq3j93UoEeBna+PJ
	Fk6pZqimGGsOILQCEz21Bkrhwwmps4f4bsEMGr2foyDZBkCcl4FR8LSgKYYWx8rq26CjN
X-Gm-Gg: ATEYQzyOAmyMh8ZlaSTNfsWbrLCje3SKDf5Ph5dJ/RTtftva5CD4RiDN5SaxlinBIr5
	CEmtwXLQkFpUXFSqrzPWy2ymudzeHTOVmFfXGFQvht9gub29ryF6L06mIw3+/3icDPUcxYLNBuk
	EKucjMgMuHG2ECpnGCaiAlLqctjtWcbEeARTbUyWrdzPYZi14LGvn7GylfxxlG81LBw78E1qnwu
	CYlf5ovVp15jsnb26taSMWjyewpbfgZDf8ejcNy2k1DiSBrJdzwny+vz1zlOefUkG77HMUdctKu
	Upy5XhTJdGDkjdTD7dHUcj38UyGpFNVHqVEGHabn2Iwf0cMeEzBICNpujFWC2+ddPJCIQxllhLx
	n0TWi2otBgNRT/swPQTCqrF41W7/b4zyRtIeenxxlQtTulBF/XLH4
X-Received: by 2002:a05:6102:1626:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-6020e220116mr6681441137.12.1773756258904;
        Tue, 17 Mar 2026 07:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-6020e220116mr6675040137.12.1773756174174;
        Tue, 17 Mar 2026 07:02:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:14 +0100
Subject: [PATCH v13 07/12] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-7-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV73iujZQ5OmYbLyGhNvpgHfkyjrM4PJIPIUX
 CAKWC4U0W+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9wAKCRAFnS7L/zaE
 w+CkD/46HMPC12W0V4MTUjE7Rk/IgkkBeNhNdo/H3IAMjUsoEi7JvMB4HcgQgD97k+fm29N59JX
 aR46Vp6Z5XGMc8x4qg5SjywfxX/wosezI64FMejNfgWypWlunTqo4Q5EoEcGXQQV3Cn3G2KuReA
 GAkucWdzOyWNm+mhxJW+QTIazutS0Der71WjtfY3DJt7b2ts7IGKqINU+gmNOzUHMfS9tM9G+KG
 ENczoKR1rdTX+tUx5T6MaLirm5YOMZQhMJk5pV+pNjpTdV85MyPoL0n2WEpPaBCtMOzl6amLI8s
 1LmcSKvdKjwBfG4ckHRQGyMv/yi9m30GNWdno0b48+qBe5UG8krkd+c6BXvVP8qXDVEjmB8ljBi
 kjeJvZsANSff142+RajX+M+NnkFB6Feoj9lx6cBwB0EuQHwQF5NFWznzcQmlDvfTfHN1bNl9PfS
 lbSl7ygc2fBRQP0gIMvlrebG6YBL7SirsGgi/2cGmD8rchSa+wISYcGInFSPjQzPAoqkY8qoYc5
 YuVXBzHSRFd2yUJElUxCcgV14jGksbPVLzg2bqXHtNLeZHcjZuYM+b4nWAtNPGWp39XE2SnrYMn
 MIyilz4aIrmfIHg2KbiFLMGIB/yMrCDZ/YpJM2CXwlVynf74wjunpjLAONagl+SW+5JE296iY6I
 igYbF8oUxNjwwWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: uIrfz0sxnOExIpTs87OoSI156ml5uMoq
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b95fac cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uIrfz0sxnOExIpTs87OoSI156ml5uMoq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNSBTYWx0ZWRfXwxD/b4DcqosI
 e+o1qSRuUxfFs1LLxuLdevY9B5rwRMpKepJe5SGRS/KO7Wy84G4NcGyXRPaEtFlIZFF7SvxfUV+
 8iRvxZ/vs0Br8iKHIUszsTLbGXVjmXOVDQYdZvkLtyZ2/lpEhnIba1VqS4LA8O70H67wn96FLsy
 +YB3sZI065z7BkWyZ+/OQx3wIkOPv5ZDS3G36lcwo0uOgZqR5Yfw67xvakmioSwptwwYTeKjs7M
 nWHuei5v81DjzRg14RCWikbyV/0Po4nb022HdRsPw17gJx3BGGhldC7M2Ow1/FAAFAzml1bwwJY
 vDK0O+kQyphjUi9wLfsVuP7IYGG00qnBcZJ9LvRv3yqjUubvaNA9s1jI9iQA5ctm+NUs+5Kpx5M
 58Otm8AYPcI9poWGMLFc32FuIGM8ukOd+6vPg5fwk13fAYtiGMxXFtb/+jktu+J+/ADNKzmrsKP
 Q/D8uB/NvJIsVyzClOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98193-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A1C412AB973
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


