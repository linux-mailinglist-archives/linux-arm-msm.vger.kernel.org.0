Return-Path: <linux-arm-msm+bounces-109827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFXND8ueFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC545D65B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E13360CCDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423553FF89D;
	Tue, 26 May 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cspD0rS6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwXukAID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC733FF1C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801107; cv=none; b=hfJN5WRFSsQw3l6H1J0eKHZVqNadD6roMrurLCHQ6MBedp4ivriMDsnxXDBLy9LbHqINztzSgn0tJR6lvbpJ09kF+UGZn6qrI22T0vFa0JECUDDrZL4p81ilnu8IgKRV/tCy/WY16x8Q2x8shdSV1viRopwMMt8bAW1TTHR3ecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801107; c=relaxed/simple;
	bh=haVTCoWg8OL+rLPtFm5RXGk1TNPHvQOhQxIunu3z1Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btKKXcP2dlccpRJfsfg9ddjZFvRO2JjL4ayb7EpnPUullDFoh5+qstCCs3oKOt1AzNncnaQT1IaWFRLizs/3MEOkJms1mpyb+KKuDxJnnvLBQe7EAUv8/A1wHeo4DVonYZgARFR8sHxRiDpq9sKXjLP1w70t4eG/XEUIAmpHRi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cspD0rS6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwXukAID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsBok2554536
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=cspD0rS6sTsjkg7u
	bfnpRSKD5iF0h0G7DucdneVgcRKFyG1NcCe56UvgrS0m3zfeUhmkoCx9EiPKsU7o
	0iQ6glcxxD2Z/JS7lRFH6XwLm/xO29Q/FrnWQXJiErOWc0IDwTX+xoLoK0TSIjh2
	hF3uzVEE6j0nsdJYODyPC+WMvUEQW4NAxZLJAPX3lxBk6wQ0HsB1TotzrSy0kuzj
	KkH1koxNG9gKKYk0gbLju5syns5Zk13N9sAb3/T+bHmS+Q4JHbZZmPcKqsWWnm4l
	+m6jlUoR21P2p0dmZSfZh/FGO/4QuJy6J/aOJpQkKFigYLweuxXPvWwpj4R+T2KP
	18DdKg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3sw1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:44 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fc24f7dbaso2847368241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801103; x=1780405903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=WwXukAIDiP/SOmc/+Y9p4JnA6ccJdAWPG2qQh5Pj0zyttj+AOMtlCFEi11vRGSOIIY
         99RZ7QAbTJq4lEBBQ0V97n5PtRhD/3wmP8GQgZeUDLTCwn93Lms4TwfxgbHOv3C6UrNe
         zTwuXncWmajY6Wxq8YkpVccSD04ZBAhTuUNkSamuUNPGl9lrk69y0DqtsXly/dZ3vCTC
         ska1caXrvJzk/FcqWpwmktprBkvu7jeNxMu0t9rlSOT2Vqr6ExBEWdfvq9BYNvl6et6p
         GLsidlDDy2OvolzpU3aPagBvLGJlObznitorPwAnCjFAyoXUc6zCxChai5OeJkibKCMh
         x/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801103; x=1780405903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=BOsRn4CDCKiwXgLF5Q0rE2AaIZf2jggKSb2YvohGGHNL9cgbN1kd9uxpfPDh1GpYvV
         shL4kkp8ql+wSSYEAQSvmm3A8ulO/87VSRjnM/8qN0+IeoocGuMWiw7i34d9rUZTPt/l
         t6z1Yf3GXrF/24v5+7OGhmSFx+vsaIGEYCgrMb2uaAAGVDLzs7pUbhOPfKrTwpfTTaXV
         IASv7iKfXPBc/GO9nxZFA7ZkgZnBfBshoXu7XJV08Lt7oLDCGkJef8TCLlNvbYYrGLOx
         BUrFYgmPtiC810YY76kPNcoAtM4/0hj+l9UthFerQ5cgwM1/xRpLSo36io2vcMFdnacQ
         xrZw==
X-Forwarded-Encrypted: i=1; AFNElJ9ugk9NfiSRt8tEjUW/h9rEBiLCmTgwOKZbFW+rEaNVMbsoaMyNA+VIlhptTUKuFH5XU35r4/V0JccGsuCH@vger.kernel.org
X-Gm-Message-State: AOJu0YxhG2VbmIQc3UADdf2/TkJLkggU4YfYp7w8ez3/1OTcHRzlKfoJ
	EOO7+djHBvTa0yNL1PjUmU6pqX/xAOF5rGVhTstJ1EPC/RTv560qAK0idkL85NIGs8ed4WSGLCM
	qg/gFAfqW6i0P2CtQ6PrqY4KKoUb9GvRkcIlbhtMNQ5UdPWgNshVDoRHVMXrDiPkfiJPr
X-Gm-Gg: Acq92OHeoWu8LWvyJUyJMQ8J/tmhrd5WTTjTNnG18zAQ6e/Iv4gkZS8Qvv1njMy72SY
	rsr6m+KEIml7kRVHZyzKOJNeqxGzA+cv0dyDWYC2GybJLpvykt5L/ac2l1x4nlH0Kq/r+O7+eNv
	S0Pq8IwryLysGEJbQIT8818t5DuJnxbj7VnmxsOVypG2aVfdrGQrmURoG8ZtKLOyZvJ7jv2TZsK
	ztyWgqUM7LuSgrSfxHoV80n/H5M0+BLKvhhFQuYTjajMIYNjq2m+pDTqZDOScgEhzmCNU55vdSx
	+fY6HCUY6DQXyEWMipb4J9OfQS7Ts5YJZ2hOm4UIhD+W3/CoXKyJ3Sz03+F9y8gqOZpLDMrS3bI
	2YZMfhcjA+6vxkNB3PEjb7s6EuDQLyXooTWwhtritDWOggVluj34=
X-Received: by 2002:a67:f0c9:0:b0:6a2:b2a1:f16b with SMTP id ada2fe7eead31-6a2b2eedf2fmr838047137.16.1779801103297;
        Tue, 26 May 2026 06:11:43 -0700 (PDT)
X-Received: by 2002:a67:f0c9:0:b0:6a2:b2a1:f16b with SMTP id ada2fe7eead31-6a2b2eedf2fmr837981137.16.1779801102691;
        Tue, 26 May 2026 06:11:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:11:00 +0200
Subject: [PATCH v19 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-12-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlCDdZs7gUpD6zwuSqo1JfGszglD6fOxI/qdoCA4A3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvyxtIGKA2Vmr0u0AYd8STPeppQGty0OScL8
 8apQe7FnpeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8gAKCRAFnS7L/zaE
 w8m0D/4mgvjO7Uz6sv75n83/rB+J52BwnHz0D5oCdqHB6tP58aeaPBALp4NPIhjYp1WXa2XOZbV
 z6Z1/3qWhI1PW/7xICXkbEPQUw96HDBvKO5hLpECMk+fg2kAx8SWXYV1NgS802BqvBzfAarZdN4
 rTsUu9TU/KvL/rQ+WKevWktlM1IU5+Ap3ptONJbiH21u5xG2LgGj2XsK4mTplzGDjFboFYHwYSn
 w2MMA5EvcUnKPSD6y+aqDh8KJ8rcW8xpORzhh1PYIg7Dmha6dwOVmGS7Lkho6qi6f65tT9ypEcr
 1wELkDhoRJWUrm+sL7R8NiH4hC5pZLRlNoB8IVC1h8rlKaflRbJa0YmLKnGSvgd/A+42qdz+F9r
 O+qO/vh03yWvwvhStIw8IB5/udkss46ucIycYZYaAWnLdFxTbeQNUC+oE4yhVod6zOyswGg7WzH
 UtvOfVk+/Htqtw5izaR9dokS6e9q31ehyBpb89iuKiDgoSz7QFbORavNzL1Yq0rap9Rgtb4LKGJ
 hYzrZzssf3KeMoyp226WK1En3/hffY7I72gyELAm57obdyhduc6GH+3XUxh4o25h4WGhY+NytTq
 aCtYWqkTX180KClZYYVOcaCGF2ycGKJxhL9Fis5S/Nsul4huqMqU7foj7xdrrFyUB3iHv9Eyt7q
 2OPn93Ny9vBZ22Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfXy+ZzwHgBFjvk
 Q/y0hrwwTKXF1javUObvAg3H5PnWoqrsY0ByXWrCSLG2n4YAO0cDoEcp4MkoYDaEIt6B9kl8dAz
 nL4kQGdb5EavG2cgYx/enwP+RQBm/mWB81eIiaXMt1zORG9pEieY+RHvc62CKWTqo4kdF/R+Dlk
 uzGzpR4C/CntjsWanSzp01WLh7zXOGFK2WJeX8CoefAx/vKA4MYprVzOk6Si0XjREXrt7WF1nqm
 9OtAw6xyl9Bky2w6YhlIM03MrvEeLs51J+p9csO1NqZS95DsACniUzx+4ioN6kOVqGRedIutIbP
 wxSEh0qqw/UqHlh36bJBZM2Co54WpkE4H+wmF6gt4dFkkuLCgY6+9hN4HcXYuo6mZoS6BeZPsS4
 DbsoH07ifuuh7SJZTgjz1m117RC9GU/2vRmACHNI5g/zpNHHORVmnUmKdCSZXgehXrBgE8qEPpm
 UJVUQUUbtrdvzv6k8pg==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a159c10 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0iX864IuwoX3viygfND6Z9QovXWyovfH
X-Proofpoint-GUID: 0iX864IuwoX3viygfND6Z9QovXWyovfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109827-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9EC545D65B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a0e2eadc3afd5f83e46724c8bc3e3690146b86ba..d7b7a3dda464964afe6a6893bb329d5bd5759dcd 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -192,10 +192,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,7 +214,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -255,6 +264,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


