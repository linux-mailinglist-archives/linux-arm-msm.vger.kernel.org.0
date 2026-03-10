Return-Path: <linux-arm-msm+bounces-96729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Iw+H6pDsGlLhgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:15:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA082546E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5CD0321400C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8165B3AB26E;
	Tue, 10 Mar 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czXtQt0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCdI5WhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634423AA4E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157504; cv=none; b=t4ZXn41nG94LHsL3diDPWxVjSLVM4Qgz/dypK5VqCCrorJKCYQL1rwPYO2Dba2TIOO2OD7/QVBvtCGVkYs336H2W4pj0U9zmP/sXobGvEryVl5DHcFzZmq3TpMVjPZE+3nqQ2TD2jO2BsLHZ/MQICEb2NA8H1iamCBCdOIfdpc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157504; c=relaxed/simple;
	bh=H6RGZzI1m6Hy642I73fornlozWd6x9hkPKo2H6raYsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oh7PrHNqqIkTF+Bjz8tGtsRKVHMY4IWF47GiUu385QX1Y2WChbI1Z/Zejz1tsg+EnmyCA682BpWO3HakKeMUQPDR0i2YPxpjpv0SutqTJAx5YFkfWWif5ybLuJ7WayxyrPAfVBz74CdcJopEAK/WZB0WKC8thNa/OWIrJsWPaqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czXtQt0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCdI5WhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACao5N024877
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=czXtQt0kMql3fO7S
	bsg5gPrIzRdWbhOrP1eV2eOHWzDOi7vJzj/5hJfSE3CjDpRcbiPEMoJsTzGMhbYw
	bPI+oCn1ciuvp0ldliJcEJ2vgwXO+7jZ8ThbJQ+/GyBSB9qmZv5EqAosvIHOd3+Q
	7widN5YRCTPDTv9EzAnFpygK9O5jGNYM6MTzYq7ZbcSujWXPeMQpsNJIo9CayXzz
	vjNdlFxbt8F+yc9IUizIMFFPlfmcXw8B3gQcwRD+wCzttPYip3C10qn37yu8qC0W
	TIB09fTvM/U56zwSDyYzg2Rw05heGsKnOQ7N7pwcUv7ebubpjNOBZqbOyaWWDk6c
	d7aLXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5nhk5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:45:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd39bso2268427885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157501; x=1773762301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=DCdI5WhK+nfyxUyaq9LOWp33RUK1UhYgQ6fsfJ9fT7G9F/pLEiDLc6fxVpdaR8sp3Y
         RT+2CUEl/kVgGozSLRKC66NNLVtWk0AQPr6GnzK5Wp/OJj1xy0uUYXPodagOTneDBQDP
         CDechCNcqfdct/tVUEsUoD+hABVyygkHEVjCnKBU/lq+UhcjCsGIi4/q9pgf5cN3YWhS
         4so8rgrUjqTrYqlgqDYtrS6s5xu9w3jDqVDBxbchiuoPm3DdN0dRlWStuQcx5hxhnO6K
         vXq7ZoEyqKE1LqCXnFz29MIco8GMJ817wowzpnhTewQDqlUYPd8YiyLcs5CNU42bTxLo
         9N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157501; x=1773762301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=a3jp42RvcZn5SYhxTMPsgNEVSq2lwgBcxkbigHq5k7pygfemDpqQWDj9+DZvi5CgX8
         6kLF36bmY35G0mbC2zywMkXaH6+BJ0U9qLVT7Dl394gD87jplWsxDtPwWXpAo0hVdirK
         ElrnsyyZIUU71Ubli9TFJKecw5XH+HwustfeC8DDD52qFyduZR1XqVHWF1/9W+g5tMu/
         9oXbfuoJq8NoFYq3GeeXjOnl6nooYovWkIe1NIhGKoYG57D3zkJ6tOtd758ZKr4LyhXG
         LTXy5iC/cTHlukzsonvH69m5mW/T1WWDEETlHrK0NHrmZtE3IlK3broFBtDR2pNrUyGQ
         jk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN/Xcr5gHK4mFdbY69BmPumProMgCay0L27InMjhOq/rfxbIOSrp3PtcM2VxOr8W1w6qOylKx9YIgYnp2y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2iJvjfUVv78Yti1o/zIQegztcXYFgjc5qUq/7rfs0D18dwD0
	OSKM3gkGiij4ZabUD5aU+tArI5/U+1Wm/f1xTrwe2z/KLAs5LYVnAltvHDsP/z7+M2WOT2L0XKt
	163J2qSeOeyg78937fTdAfeZNK0GDV15obGs/468eTlo+Mgxnn5aeyL35YCOMjb08UC3n
X-Gm-Gg: ATEYQzyy4wwCh9E5Pc2jxPdGcd+5MYgY3MHOpOUc/0bJdw8sJtDvzfnPrtrs+VKN7Fg
	2rseXOidY5Bu8qecIRPVmbERWajpOpOB0gznpEwdkQ89a8nvPnuknVbJfk5GOGiIQi7HU2TowJU
	iLer1Hl0KynAm/Q4tz9LVvD/9swIdnYJUGzvW1u5JyVdYSXyEm23oLgeekSv4HEx5t9pwd0JUsI
	+l3RG62PtIOsY1qsqzIXbIoGYSnZKIHQlSCOeSMzT/5FF+LkBEUULrkZHS7yFfnioaku1+o2Csz
	DwUFUzozoDNDF+8pzpG2kZ5NNwvqVegy9jSEFKBnn19evnCbAkFTTjPKP9IcFjO/LQIZhoYIMHf
	Gw34m2X+yLhjjhvEmbc/7dH3OWNSHTpYKEkF8K35oFsq72AJL4E4b
X-Received: by 2002:a05:620a:45a4:b0:8cd:99de:6b63 with SMTP id af79cd13be357-8cd99de6d88mr203683885a.67.1773157500835;
        Tue, 10 Mar 2026 08:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:8cd:99de:6b63 with SMTP id af79cd13be357-8cd99de6d88mr203680385a.67.1773157500334;
        Tue, 10 Mar 2026 08:45:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:22 +0100
Subject: [PATCH v12 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-8-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxnBmZidtWMXZaPT3l/WWwZfRhiDNpJ+gEit
 2sntl26xc+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8ZwAKCRAFnS7L/zaE
 w/T4D/9bHSSLSAMvxxk8JrR1ox+aKXUbGDDHdvt8QiTysFu6u331mNL/QlnmNHXdpXuJVTIpPP+
 JyVAb3tqGwkOqyJQp37nBzsJLwglR7wWDtlVB0RtaiUX2qYSLwaicI2se7XzaKcLBLdyEhm6xXq
 HLC9owY0i3rnANkUM84NdpWXfLEx02god8obx+gDVBoB9VKJfinmQOcHLpCZi5BcUT+PMs88IXL
 YYkukBOKM20jiMGFWCvObLN3OU9VjOzHjUxj58RaidFp8oZaIp2gSMaBN2a7H/+hjyvHc0X4F83
 KFP5Zj30OMNHP4KaMob5DyirNFVXKZrCouEliBjv5eZfk3IQ8MxZHCfVKcdGIKPDE5g6W08mwDO
 ynpDI9Y4/fZFY+EQtjT0WA2ZzmCCXjfj4R8Flr4/85+Wj4EmZBto1x/uoDoItL/OsPfjKw1XYYS
 lMrt1n8VxfXcOs4wHJkDibD8rXOgcOk3YxBWPGqXQ4YQr53kSUT5g1lKz352oVqifgEJqnwA137
 ScstXXmJkzf651egLL/dmhzrWGCMHMhG/2vnwL/9cxG2T7ppKhJdJ8rHmdF79eaadapLE4+14YQ
 n+APwI/CiGns90EbALQWxnfZ0o5jeOPAkANI+rvTol0y//KwN56XPP5vl85fqHZ8r9POOOrmyoM
 AlwFNVtmN0/IW2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qUyVzNPzuHcxH-kOBOUTl2fQ1jn5ejoP
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b03c7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qUyVzNPzuHcxH-kOBOUTl2fQ1jn5ejoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX0u0EoHQoj8u5
 x8xxasgn4lDpTCqpeC3XZO930M2Pp4x66SJYFz7/dAiD4LIsI2xGBwWXAP9xXNo35U2UvejQPEG
 3RRnvPWT8XY6F7xDS0NCeh1YNrKIqD1NmLjz6OoCqUmQPxcHFyhjbLd3a+iiG5i6RBkFlTjrHn+
 OA2Pbw2qDgEYFNCitD25lY1VFqp9b5QK6GRUSpEa5sgMA+1zVOY55kxiP+6MKuQx2ExWJ3dAb9p
 Jz6nu7Bv0OZkDKFHY9GPd7LMlNjAQbjqbwOVgdA1TfhBscukHA4iPGVRkOT0prvay3qtA7xrEv4
 DB4DwEjk3+R4EucXkqbHbPa14sBFMz4WuUj8s1cN/VZ6LEHfTFsgycXazOZaRb5ZYYnIljNdhdb
 IXXh46+EunyGMfBV2Iesp2mQWZD78u9UtW711z6WiCXQ9nCPbbfrXCn3bT/nxpg2aqN0yWCVmUs
 c+9fCLWRCy5RxKl3ylA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-Rspamd-Queue-Id: EDA082546E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96729-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


