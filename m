Return-Path: <linux-arm-msm+bounces-84275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F91CA229A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BDD8301D616
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22635257854;
	Thu,  4 Dec 2025 02:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/+TwLwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDfuxLpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537868632B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764814905; cv=none; b=QV2954sjuVejhcOLDl5UIcpkwz+r1qWA1QYJqAkle8xBYw6MI/YO5X5838Ly/UkHrxhRu10FuwQQ83yDodOelUPbmiBluMltydbiQdi7DFODFxUK9TLjw0ciYYT0SrimxcXfnMa6Wu+nKjAgetj3enW8YtcanXuYp7zVHcu1uhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764814905; c=relaxed/simple;
	bh=8P/Q+GPYuxVbIPDRfThuXmXLyDJdi24C7r5GTdmlSbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pjCHD0lPNG7xn8+s6UAPIfWHVxXQA9dq8uZda4xwSFCfSzoAbvgX1ZtzsNi45mUSPtjgIwAIhspc6lnJPV0vZFWKsVYgGGc8nynmud5CNudGxQc4o7TtSjEm7MNl6MdDVHVeZbALoJK6qZESMMYn7d89h17a3bcAym6D/KFPPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/+TwLwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDfuxLpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3KlKYV1536211
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QWRGmGT2+ktSsxmrxGCQlKq8R11jVAXhtnH
	ETqtAwrE=; b=n/+TwLweNxSpmvaStSX8TU5u3zq5yxEU8Ba4Ilnc1+rTQeFKEva
	SCC7o0xC+S/QuXYyfZASDuDEgFuD8kJu3Fl7X0VJB9keEjluHqJdwVSyBNWqBIJF
	LrjFjoSzmJ+NXAhGOoGIJxfLgZxz3NiohAZKvWSZntTzQ4oBY2j6WlJNvUzjecAV
	WNJCZI1hKz8V5FJqHAg72AKKXEaDKLETpnA0GCebKaIcYcif0doxV6enBMTLP5uy
	nWMrf6S9U1KqIKNGE2dDBGtXGQXkKG8zQOeW/kAu5iMVHUN3wcACW8xco+qWqDTD
	6yV8y3eD05pq9037MTqLai1OLtvVARbM00w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hth90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:21:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29848363458so8706495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764814902; x=1765419702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWRGmGT2+ktSsxmrxGCQlKq8R11jVAXhtnHETqtAwrE=;
        b=XDfuxLpy9nPmhwmoOpsjxKOUd/zNxG4PD8xgS6oakVZB9jVdJblZ/0fUy9XTfOOqjR
         MBkrXPoJIBdSSfd9CRImbpLS7IIbsWNtvAnRUvBcZlP2OOQZzUrKDsHV4+YpQscpk6Wm
         xK34Y4QCip9OgRjg3o1WYVhP47/rb1yCOL0GatWHe6r+9TP37ceNhE3RAOUwLkBj/swI
         mkb40baOGjhOWkHsXgRAkvJhTEAits3dZ0+q3xDXFQegwjnAri255V2XIopXyQS6SiLZ
         xsDwn4h1kx81PKE9zdQlp78Rciig0/Qudly8eHtZ8QHRudnhuG2DEbd+3mgrvYOjwTm5
         ag7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764814902; x=1765419702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWRGmGT2+ktSsxmrxGCQlKq8R11jVAXhtnHETqtAwrE=;
        b=G8oCgwbCN+owXAABWf/EFnGr0L4N1eAO2kmTdW4qI2uOzjHeJGcFkZcOew+u452Zef
         UyjIQ2XoAIuswR7DYsfLNZtsjYKrSnrewMXdn4qxII8pzgkZRC8wASDx5WTO3waeBvug
         PUMe87bcxTUZZ2lWUkMR7cTopeBYwPi9qnSyRjaNRUQTrI9f4Bx0H7drtofvc/eHUIPh
         3DBv9pMJROwucQejQPlGN4VUoYWyihIMUrUfrhyuE2ZhNaCzJH7H5Ap8Tix/Pm72WQus
         uG6m/g8OS4KCQg5PBxdtqpi1mP62/Gw0zppFWxNDE02IWVqVY+VHATmAQO3eNkTtxtQK
         CjIg==
X-Forwarded-Encrypted: i=1; AJvYcCV+9XuWmprMib5j+vN4YZfu7khzbGKEbOdEyfRZfl+tKp1V8tt95ieo92GyunAbKxaBGl3AW1VhXzHMIGm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWTRAHT2sSgdZYTyrvvqnS+n8KFWaqQhNKBUylypW8fA7sN5L
	W4msMJh4UGd9iXrxMlbmVxY1pQ99JBGmeECiJVjy9nGyWF/htF0R/HKLk6RibVe3ciC8HJpTK+s
	04cZOaZRRWSlofjEdRtGmlezhTwjTdUybpEQqoE90LBb8ieOOSLjt3itazdMWyABRCaqK
X-Gm-Gg: ASbGnctoes++tdXmiZ1hd/zXVre/uk27ILSjO1sP8m+iB5gH7A9zbmDqj7tOKIu5CG/
	1TH/gJm4AHckjBmXoGCaXMJWwQs7t96rFYs2f95jnRy4Ci7wMif+c2OKC0apn93OLqEfTH18tV/
	/oQhM3biHhGDbjO58wEIyVXWWUPb4glNXO0wshR7doWJyyv/VnoDB+HP0wgQmHTS9EW/UJtksYO
	eUEEWJC2fVs1kj7zPb5YA9M3g3tTan9U7YahaywcouBOmLZfRn8iCrmn+VIE4gHUcgqgBQPxgp+
	zfn180ZrwsWFBvWybPSvr+GgruMzyTvJgcpy13pyRCKPmlzbsh852bF0S6wjZ3JJAddCppZ7Qha
	IYxfK5y7/7pdjpuADwV2RPUdnzPE7Rg2KbkPEn8BNjDOXdQ==
X-Received: by 2002:a17:902:cf4a:b0:296:4d61:6cdb with SMTP id d9443c01a7336-29d6839a670mr58551465ad.27.1764814901702;
        Wed, 03 Dec 2025 18:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc/QaK8m+kCRwSkMpzUw6iyfejvPsaFck/kKXDcvSh4A5sfyO+W6OoueMto0U0Hqm48Kz3Pg==
X-Received: by 2002:a17:902:cf4a:b0:296:4d61:6cdb with SMTP id d9443c01a7336-29d6839a670mr58551135ad.27.1764814901212;
        Wed, 03 Dec 2025 18:21:41 -0800 (PST)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a2d19492sm67418a12.31.2025.12.03.18.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 18:21:40 -0800 (PST)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, krzk@kernel.org, geert+renesas@glider.be,
        bjorn.andersson@oss.qualcomm.com, arnd@arndb.de, heiko@sntech.de,
        ebiggers@kernel.org, michal.simek@amd.com, luca.weiss@fairphone.com,
        nfraprado@collabora.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        trilok.soni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 1/1] arm64: defconfig: Make I2C_QCOM_GENI built-in
Date: Thu,  4 Dec 2025 07:51:32 +0530
Message-Id: <20251204022132.287243-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IBM0Ot8J8AxL4Z6AwLCj2DnN6P2d1Oto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAxNyBTYWx0ZWRfX+APVOI7Vfe5G
 Rhv+b9pCW95VxqA0y9vZx3q+tCAuPkmMRri51krH1M0Pk3JKXH0YRKlA1gp+1pCkwn/x3oAEjW5
 qU4Vp/LtjNyZcn2rSekdgeh1v9l5LRrfap1upjYyoaIwXH/cBXo3jl6Tajb8SVAbptSXa1olp5f
 196lfhj1f2Nla5OKQuhoIs+iLqfhQenm0NaNHeiiX2AJTg+MA0n9p44HxS0h3p/mUCh8RWsCh+6
 LWLbULUzKS13vxGpXXh6ZenL768Iz6JjRFa7376Q31NRQAgMeA0uYbD/mMQu3uMnTOwi2ZzGzSU
 Q7Lm4u5e7VrzkF9Q/oN66CfsbRsbziPXeaEPhaAqhP4ywV2n8Z7vaYTIF95l/S3hfwutJA9sPUt
 P09fEz89t1fs03S0hhRuh8YFE3S/zQ==
X-Proofpoint-GUID: IBM0Ot8J8AxL4Z6AwLCj2DnN6P2d1Oto
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=6930f036 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O3bDgYkKVCYN14Zw2kAA:9 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040017

Require I2C over GENI during early boot on some Qualcomm platforms to
initialize GPIO expanders that control SD card detection. Without this
driver built-in, the kernel cannot detect the root filesystem device
when modules are unavailable.

Make I2C_QCOM_GENI built-in to ensure these systems can boot without
an initramfs.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cdb7d69e3b24..8d85a2255b07 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -562,7 +562,7 @@ CONFIG_I2C_OMAP=y
 CONFIG_I2C_OWL=y
 CONFIG_I2C_PXA=y
 CONFIG_I2C_QCOM_CCI=m
-CONFIG_I2C_QCOM_GENI=m
+CONFIG_I2C_QCOM_GENI=y
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RK3X=y
-- 
2.34.1


