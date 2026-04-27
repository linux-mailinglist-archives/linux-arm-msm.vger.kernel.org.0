Return-Path: <linux-arm-msm+bounces-104657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFIvMpgp72lE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:17:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B746FB4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5360300DECD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F563B0AF8;
	Mon, 27 Apr 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+v7DjpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzpaYRHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD713B38BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281373; cv=none; b=I3QuYIQ42on8Wj6iYuif6/Zp/O6iXPIu9d5sdA/SIJ1Jp7tlBLRUfps7QyBfBFJzxKvTcb4ZmgCzsaWIWysmYBSnx2hCxJ2A4JgMEHqJBiBxwd1BvLwAxS89eyGZMuM30WvR/znbzvIkzfpKWUQFp8TklvIKrnd1Kh+ctzcSgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281373; c=relaxed/simple;
	bh=D/DbbvsYNV6WfJJN+Y3qtsfzsdueJP3Q7cdgK44aCk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZ4tqtEVlVK/SxaE2ImUZqhp+qKwBAZPh+A2CmpYiHemYKLjYqY4QHouUf1fOSxuPGDZzS9YN9jbb06uhxDzGT3dfYYzdW1R1RsnRlNLQ8dB++Prg/djosuce3LASOeDTNro9p26gq1LdNv+38rxD08lDE0VN0s2RwYyzraIDxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+v7DjpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzpaYRHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TLul3681950
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=R+v7DjpM08+VfYYe
	DvlbCzMwrLEpzHZnl5Al6qc0t40P97FFU6xI/9E4QoAq3KnHxmgfpg27qYuOmBxo
	OOa7zyswxeUZE+I12hssbqfgHajbiqVhal/ueXQ+70V//PrUYKzWvKAjS1VQnscO
	0H+t/5izpRpn2PcckM/Qw6LA/kZ3MdfpbQWaDpMGTWT3K+OhA3Ro6QvbSDnqM20R
	IfUiG29/CqFdSr/5ZunEkOcsHS7zt5FpIzrwsd+X4pBoQ/Mfi1/7smS6NSgFoyVS
	wxpfcDn4L/q92cyRkTeyQhjX78n1ioegvCiJ7tbfw3ey907cu/aFI7RPfQib86kB
	aAUtXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgwadj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso126744791cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281370; x=1777886170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=fzpaYRHdhMspOmjmgmeoaRrLajWIKqwtOsWKXHgVdBG3xY5Gc6idlrsILiNiR6h0nF
         R2PT3d3UavovCmRmZh6x+jB+elKsxJRQIxxBu1lxyyDWo8BcTTJsHGFvS6qgZAWDW6lo
         B/ndpIC2X+e1R7k9+5MJzE8mAFN1MHO4ykI8ISeYIgKYWLR+vQylGMN3Wy0wAA3PoDEJ
         VsbwSDrYO3zFnpov0Q72pt7vLPHjnAAu/B1JKiQC+DX6wc8BqDaxht0i9fRxithQ0+41
         9XWefSEB1ok+Y2leFejrySh3Efn2gAqq3FDafS203YuRMEx7eoRGMDVHTBwJZLOV4bxu
         QhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281370; x=1777886170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=F3cJO9Z517dV92p29xAVVosIDMOIhY2lWUE1w0WW4ou7nV/Gkqtib7oRilbDVPrJB9
         HsyQW3xESN5RQ5g9oJvX5DeBEno6g4RRPXG9ya/9EncBa3HqyENOpjb44xPtZMWyWsFz
         QPuDNIlodaydJdEivKOV3d5fH6nB0eDQUkYBpMDsEn19r/02yEKqCIQ+8ZYyH9SRXx02
         9sHKNgi9+i4/Z1YiO658MLeIT0BK6zeKOIC0YkyMiAgW4Vs+G448K89Dq9mjf1wt9QzJ
         cikw4tWjgurxbYNTRSTHdimc97NTcOwJi8j2kayUvoUnCT5cmNdTk9g7C9aoqMwKhFwV
         MBrw==
X-Forwarded-Encrypted: i=1; AFNElJ+51U5VE3Ud7MiRrjScs3e6TpQiuN5Tr6AroxM0en1MYFVU7H2zYBZzEhpeDAUYG7xdfzI5hjSl2juGCIZu@vger.kernel.org
X-Gm-Message-State: AOJu0YwccUdMzHwJvOepDTuDOwKWK9xuyAwcs607xDvI8duq9NYaH1c2
	Nr9evZdJ4pIRNI7UA7rAVnzeuQZADhg+ECjdyj0fWJnYQMAkFOfE83qrHMhZy7xf7XP7PzsqDbe
	t4ToXwszDBkViYILfWtWvu4xX0SlFayU0w7vPUQKPmC90k/vnJhj1FlDin8mnBhdOq5AV
X-Gm-Gg: AeBDieuNkBqJ4ASVcd+J0+mLt8aw1jEjxsSMKr0WHHsU1l0PV8llv4wMjgNL4R/0yQD
	egQ+8QKc2ZsyKDY97Rtj4NOYq8HSEYcpIZMp5oX3FVmDGHYWpbN3lz5I4PxBvBiACc4boPfSa62
	Kg6L9YP7QcUB+gdrqRGh+N6dVzFncK1DoLpfCPbMOMPeKBzTI9FwnO4dm19vd5O2T8cHFVGJZ5w
	JX6GcbUjD7RsW9xsm0Zpb+utUHoVgYQulOKCzh6P6PJ7UnGJu4bBWkXB4gccOy8L5/CE9pZaN+5
	8O+8MGQCrgR/s+HgaYQDyuNxRX8+pj1madvne1SGDfu81yKSASyVc+zGOZ0/sAe6VhAMW0pgV0V
	Wv3vK10ODnQwXu8RUB8PnLkaq+dOx7yLU779P5ffG2x++xODZrcTFnLzADhFfGw==
X-Received: by 2002:a05:622a:3d4:b0:50d:9174:cf33 with SMTP id d75a77b69052e-50e36bd1596mr641063981cf.16.1777281370319;
        Mon, 27 Apr 2026 02:16:10 -0700 (PDT)
X-Received: by 2002:a05:622a:3d4:b0:50d:9174:cf33 with SMTP id d75a77b69052e-50e36bd1596mr641063091cf.16.1777281369336;
        Mon, 27 Apr 2026 02:16:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:39 +0200
Subject: [PATCH v16 06/12] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-6-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylCsbY62JQL78TQ6pa7tPcwWzVMzgWmfI8mt
 neuwrXBYoyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQgAKCRAFnS7L/zaE
 w8GeD/0f0hGSRTrxbft+ky11wNOHW6gpPsQUMZxchB0jlKZ06wEuqPjrZmdzeq+eFBN9PavylCt
 2MNzx7fi40kYNwqJ3ZU7eF808EBXT1WsdhK+plZ4zsg0u6zYoa2WqRQ/KZx6ED+iV5qDs79L+/j
 Mv+BBesfRJAMPzZhSWCx9FPsdPoaxXa3C2jchI5FFLjnS9paJsdyyZAEV2F9mrQAmZqw+gGaSx2
 iHgY8CAfTIkOzIKhxx1TMDvnk6B16lf1z8tc2T8xRZj+96st4cD0rbunTmtnh26mjKkAKEuDHXG
 zqryNCPVQesibGbyDEsCNgPatTUxvF70H8FF410ZTbApyNigXMvMfPkrPwrvvh2rWCCjk8ZcR23
 HuOz/8sExodRlzZli0bLZvKZ0GHLJdcHKKqvYsUchm233e1Y/xauvgTduCdrpGGiQf3foEm99wA
 +y6BteSGDADA65/leQTZO0/Z5m2v1x5XLLo+4yIGiZc7nftUdAVxK4+ZT4KudGm4MMl5MjQ/+0m
 kvqsMyoIJBlHhHwN0eL1ODj9pQT8g5CJzM+F7SYWGhXV5nP4KxRp/U/qJ8jy2lWy5vN760hSLhR
 QwWaoZc3l/2FNDTuAjNeMf5SftLEj7NZYJpaH/DtfWmtARmll7laFLAwj3bmLoMqDbx1JGtnB30
 Y4KS4Mro9F37KwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: F21yoK1CkeoLbhMzNcXDbxP4u_IMsDlI
X-Proofpoint-ORIG-GUID: F21yoK1CkeoLbhMzNcXDbxP4u_IMsDlI
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef295b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX0Pt99YHf8HLn
 EuwhqsXIh7Ol1/XOti6I5rhLwzTmfEeNMcXsp1IcNxUiLFNwtNKb51YkDhpzkf67oSnjaOZjaT8
 WWaF6fUfUyq7h+YroWvNZQXiQcnT2HxVVsBG52TChjodGHnbwV8P+vbJVRO0/bap002+ZVVEgc2
 4pKJ9YCpjIWbr8A4VfPiSTKD+t/GGnnXrCTdkRUAMWImibMvjp60iGW+5nRJrh+MdGKumoRLFuk
 iENSmrYQdg5uVhjU12GCfBs+nCdlrkEfkFZJSeyw7YUfa9ZYl3roUp69x381AA/BQkXMxqwbWTM
 ak9ISvhxK3KP/1H8ss5uutj2wuU+0SkpFLhW5w9cq33ftWA86glBsLQPhxMNkuG2yZrvDCaTuFe
 LpQM7dwFs01bvukJw/AExSQEeykOWxi18J61f8kTqQdfXyL0X6OouCGvfFEfFYZDrvOYyArafrH
 vo58H8ISwGvlPVXBc0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-Rspamd-Queue-Id: 8E6B746FB4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104657-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


