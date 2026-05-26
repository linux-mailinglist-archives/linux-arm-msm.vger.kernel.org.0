Return-Path: <linux-arm-msm+bounces-109829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOsrDM2eFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:23:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A61755D65C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 792AB31A065E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5433FFAD6;
	Tue, 26 May 2026 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVQAAu3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASKVkKTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC23FFAB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801111; cv=none; b=VtN+5LfnYUn22c2r7uL6riFEtBfkSo7db2YkVUmISPmLFrLgGWb88wZdDAy/KvDtBirI/gnJvHLP5Kp+LyicBRK21gHlZzUpiZybgHaAGG5P0INzrJ7eRnFa6DiB8zTlmTZ+V6ZDZcWcENKZ8b2zBFepJxPYPzfJ2NeANEyaJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801111; c=relaxed/simple;
	bh=wYb8hULMzww90PvO6ikCdSc5niQ+bjPp5Yt9PZ3KUhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhEI1b8NTucbH+ON8gdMYyvOHM76yChmi77S0kym+WVzYUSVAkBGEs8EWQJcBulUV01JjO+SRaL6FRYjdeQaqYEZX2vBVytBK9xaj3/peE3/60FsmdPQBsvBRxbgrBk5XggV0klA0xj5c16/NJy1gz2G/wOFR763mXeCzt7TQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVQAAu3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASKVkKTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsi3v3797213
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=; b=LVQAAu3r4aDq6EIQ
	7bR/wma6Rra4RG5Yhk+pjblvuattCKxBpprJ/R9sku3jK0CMH5qP8Y2j+YlnWWmp
	E5WWGqXyM/G0tbrYFxQWkDrLMwOTACv0NCFDA6xEARmf0ba/Px6nSY+BjU5jZ73o
	h3FRnAnBsaMxpiFaXcywmGtnXDymY6wayor66LjQhEFZxTofhZrII04G7spZfvfH
	Wl14zwh8c3fISM21okivh5RHUzZOeH3ADHS08Tg6729xt9w7ipgWoMaqckON7+/L
	YDwQnnDvwSKhwNmhkg0sflb3sSpSbQvDYYdNQ3mZ9CaP772w+OVPCoM6EbTPbP88
	WLu2dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2mgb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313385ca1bso4688041137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801107; x=1780405907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=;
        b=ASKVkKTtzyGz9Yzq0i9+ymCNWhXovR4l9Z1BBiA5pRJON5yBFmIVX0Uxo0a0Ief1sP
         tUmHpMRRH59Nk/QPNrbx6PdgHhlm4q9QWlP9diizZQpFRt+XP4MiRnoktl4I1m1+wTeT
         HrEyZVLR2EOdAQWwUqE+gE3DpNX7jBeKiPukvIGCRZOFPp7bGa5FgcfkqvRrfKbLS3iH
         h2hmWV7ui71S21D45rM8MpMJz/Upf92H6QU0GXapBhI3oZGTQQV/eSJmzYnEDvp+7oX+
         Wrz9CSl/Nh4c1bImDbPeqRaS+ISgnPCkJQ5xW+khKjuy3lfIB4Lxf8QBxPlQSyrb2heM
         umFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801107; x=1780405907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=;
        b=RxH0UriRmYApAk+6yTNqNt/5kXHbKt//VbYdrrYcOJ/p2ZdTNuGbclv201YTfQvT9c
         oHQs+hGjKJ+HqRy2qJjqPKrFGc4htHrxFqlO3AbdARBUrUJ4es8essQ3NVrOcHE08Huf
         tUvfrFS23vFZkZJ6VtGigTlY5dijsgXq/CS0aw2WJiObI2vB9RJjKlQWvMkxnE7uhA9j
         03ySjCIg9wBRCn8MxxUOkSkaSswRt4oL4PxxlS22XXGKwEl9Kd8IJ8Pj7s21D+r/zNBq
         OxIHgNjTshAkb46Qc3rMU4e0xq/m7jt7LqqMV30Uh1QUU5DIs1HXDW3kQiP6UnjZjl3o
         Stqg==
X-Forwarded-Encrypted: i=1; AFNElJ/jy68Nz3abL/Kv4f9YjznO3HjDu8aJHVKlqOhl7BXvOMTx0z5CJCyAYcMYQCcIwAo2tpPWNtwq5djI8nVS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NispwkfSbayvr3za/avnY6qEOdIU69REGXXWko9ci9x2ddqj
	tClITLpSpNcH6yt9fiuXYSRH26tJ8gKMfzXJn2PUauAXZUfHa9Za6KVfmZGMcUi2Wqk9ZfHoNHz
	p9iqEz/bNhHW9JugIQFoi5M9GW3gyRF+b8IluwV0Dr+ltdyDGJzPed9USFJKMRHBcKp1z
X-Gm-Gg: Acq92OHb4Ih3VrNsx0k8nhPcOYUV/dZCYoo8spc5O4LBq0wlcld82K6SQnQLGx70O8Y
	yYax3Oylt8L4TrAKdpwvhaSoCmF34pBj/FoITdpvFv/gS6goToij0UATsGeq3EbnOKMYcr/eRz6
	g+h1WNAbK5VJIB1Nrv5wweXFM0fcIMNtGP7QqNEKZSiAipc9wr0Kvnoo33JsLnu5Y6Yhsk6Y/vm
	g1heYM9UU1LNP/f8xhTKKZlX0KCiHc95AZ5o49hMxz6WsP2Rymdiw5YOHV/M9CVCVNW7+8oQv1T
	m/86yT2FYWcvZzSAlLHnQSeI98iDm4yqD9zNF/T5BFAM46Ot1e8pO6/JMWvbZjN4ySYbQjg/i9J
	Wk54fTEq2MOx5S+MGoISfMkQ0GvCTXwtDY2gX7GhW+YPhB/YiNLc=
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr7519335137.0.1779801107494;
        Tue, 26 May 2026 06:11:47 -0700 (PDT)
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr7519273137.0.1779801106934;
        Tue, 26 May 2026 06:11:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:11:02 +0200
Subject: [PATCH v19 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-14-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wYb8hULMzww90PvO6ikCdSc5niQ+bjPp5Yt9PZ3KUhY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvzxsEoOkXKERoBmJ+YvCvy9mO2/ZVwzzxGW
 SkD5+eOhNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8wAKCRAFnS7L/zaE
 w01UD/9Qd52H3q5VW0VL6E7KzqRa+d8K+Y+jYtcVKzVY5jLZ4SyZVi3tVBOS1l4w573XttjwpQ9
 bLmG5wgI9YwBOYEKor4l2B4NV5r1RTzWWYY8kkHZbY2pR5ot3GRBk41IHrFkKqJtLCUihkZyTM7
 BRvxv0cDH07RHmyCDeInlnwULWxqvKJtnval/yE78/Rv4z7XOflmK5RLA/3E8agAXFd2qK+EBSI
 HCHt+oBWXtmabclRSm1us0rmipHIsMJu/GXiKVd+Pwl/WF5N/cfq3SxN38ttYfXKzBv3RfSMB/v
 OTK+WGPkOU5rs3mWfHtvQfbArbPnV786v5NWONXLKaohikx5KNatccGpQ5aeQ/WuaNLreW5d0CX
 d+sKayWGvRazJP5WhH7iaw2NE3Ik5X3/AbDFd019x5fs8E0IeQX8CqZvFFQgx9GwYVKh7m8++xj
 eCxrHcDnnjwKXMqmRLUqLEDmxt96FpTmSrvubr3rO8WmtR2K1Rr0+il194IajYmFaXto42h10+P
 J99xrA80QX3GCp6IAOIQa528bkuLn//rMcbinl9x/FWfJN8PNWeyJLTgC+FViy52icXv9KcIaIR
 739qnqXKU4sjQtDrC9EjPhGwzEJJIkxAReeSaJ/bI50Kiy9PgYV3iUz+9wgtb1/+x6A5iHcgS97
 3TG2vGnfRcU3DHg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cS4kbwFI9dYAC9wxaEdo52SdJUZZIxIJ
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a159c14 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: cS4kbwFI9dYAC9wxaEdo52SdJUZZIxIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX09I9QzinU2gC
 e1yNh8bTvwLunkYlnGVwJIpsdGcNxPyFmgbaIdPOtEAN9Zhe7yB+LjZRFcgd3ZcxQ0I48SWSUoY
 pdnXJcZOHitCjgZRSXN8oEWQuqvQCeKE2YCUo11iVuLxwMTuDoQs4vYvm/aHtNI1roUzYEArS8Z
 rsciS4ZeJjwhcXGfOe8GhQBR4XA3zOTjhz2k+O+8+aYZ6nXkWMfeTd+IU4IGkngWE3Nfwc9w7qQ
 gMnhGNX0bvl0su55zk9fP7PrHyfQ3RBa3Wj69RPZ+ACAC+HdtPesCNb/xzsw+BGCuZwk+vvaTBt
 t7gOmrZYuib4kJpIlgMUuaQmdtXUX8ydly+WTMjIBD6IIJKsNAk5+6hYkzHW+TQzphqRDAJzgE4
 pikGNQbcbKqROnRTBrEDczCW9VFqWtIiZaFwHNZdGtgWyRwGINauDtpO+mrxuZltnPZGJK0POgZ
 4zXXhnKO3mTxC/wft0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109829-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A61755D65C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 769cc71da90076be446cbdf7ec7db27f628fa2ac..349c1d9ce9a2f4628087aa4ed5f8dda2bd9eaedb 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -41,6 +42,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -60,6 +65,10 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_unmap_sg;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3


