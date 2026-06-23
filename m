Return-Path: <linux-arm-msm+bounces-114170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jB2gGFJmOmpL8AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:56:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880066B66C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:56:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BojQtHcE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dY9VjcCX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7605030B28BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CA53D0BE9;
	Tue, 23 Jun 2026 10:54:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6223D16E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212087; cv=none; b=flAgTAro/20TjvZk8+r3Zt2Bkb+OPHmO097Et9rJsyp9uiK8qwAFWUBeRTi91vFauCt0yMnpsNtqM9NeZkzkSFw1PafF/V9kIOrzRfNoxowbSrcEKr+A+Y9atBhqKn+h6jaegrvO/10JHm1RidAZn4V55WEtM50CCVdnql700GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212087; c=relaxed/simple;
	bh=Tg+vN0v13juIpCqsYK73L3dg0uZriCOvSK9cptsOtsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qi8nJVnxG8FbK/o6xV4bjiUUSdrH6cfNK4UIycQHQZF1EsSyN2SoJPKPNlV+uUoxGEqVBdKj2XaHn4VCqeQ+AYEt9PjryTZXekqfBtg8cBYFu/+4zs7i2sX8S/RfK/jS83Ju/oC2QnZBLwKy927UdU+VX44YM5JtdEiHzNZmm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BojQtHcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY9VjcCX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsQI4042212
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jue6QmxKNF7b0alYai/0GG9md/P/r5w9Vy+FBH+2DW4=; b=BojQtHcEzWd70EsJ
	CdYdLq3Fy2JLPM8pc2IjO1GjV8dz18XKCgV04frDPaW59ArpOYUpz8O8JykvVblm
	jKq0fKgrEdT9eei2Ce4+CTgPzkecK1Q42k1MAJXLTol5Aq0ucp2ZOnsmk8WUmo2Q
	rS9uXHdINykmaRy1ufwEMrFFcavkhWDgt1LpGoZoYXPf4qv6/0jAU4/RN9z0G1Zu
	7tpIlBLHEbCaQI8jPJlUqRwjS113uQRrkQrA+4KPupyXLxAQ36wjeZTGpoupslTX
	6c6k5V4MCZojNXZ/JHheEqqHfbZ5YYg9o7G0wRrk0hkOjajhv4/f3PQqdB0r12fu
	jGdMwg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr32069r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8c7f6c6069so645491a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212078; x=1782816878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jue6QmxKNF7b0alYai/0GG9md/P/r5w9Vy+FBH+2DW4=;
        b=dY9VjcCXMf3ejXp81BrWKLJiG4YGA70Z7DFmb6w2jO0l+s9fZy0a2DPqJfMKwIEom7
         /g5KkhVg6/IWZylRUC4+QvSOkaqKvyiQWLAaIx4vNKT3VvEIy1TBZAzrowibtvTCfXeq
         zD16LK60SjuwdgZ+I8jcxlcRnSvvcFB9PO/qxAcs/0JA3v0FFsL2Ej+YQgMp99BcZN5r
         hLBPha7glIfiQqsU6fueeOU3jX2EkSV+h9I7Uk87iSy8U91xpTytWqIB9s+xcoIuRKdR
         1R4EHKOiSvYwInWQklulgsQVQ+Seb4kGq1q+1zRWvU+VkgbY+7lwIQxlAXs4GWPNOHA7
         Jt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212078; x=1782816878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jue6QmxKNF7b0alYai/0GG9md/P/r5w9Vy+FBH+2DW4=;
        b=ELy0GrcJhXMVo4+RivGvjfKhs7iSBrRipHnxiEU11tGkJMIy7M7fd3NqOtYLhb3A4k
         tqdGWBaIM9CeCOEMGlLWZcTmROFjnkbgajxIMFCrdAoFAR5ABiBhyiJf9zoAkrCBJztc
         XNS9PYu07wNrUeAIAA7u/3IJEnceqJ3+Ud+fyN2jnz7W+zutuTpjjOCqqxKqGzjbJJGY
         Ej1vnoDXZfrKtn4Jei8HavQqqDAlnt0NVUDs5XrTj1ZxOuntXvZyxJnZQtGl6gOaK+1A
         zvoMjudKo40fJVbFXqosP0OI+h/baorrUendMVLmk7i2yjh8QN1Hx77rr6ZTR6fSWmsc
         IyVA==
X-Forwarded-Encrypted: i=1; AHgh+Rqgxpm1fAndlcvzTlizLji2iMXiTLxcLYoZv4GJpdPqzBeRVb9lhHUi3XepCE+mp0ygXPnNGDYG6RmvxE5q@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCEkRvdkSUEqrhFlGujSAam7Rxc08XrbjUBKtK0jxMeDRDmcG
	8iaLCbHUXwJRNyYjvf7X6Nw2RALC5OuPSERw8mI4TsZQ9kyxDstF/8tsDWoAE/+plp/6yfNkjAT
	2UvpR8H07fXnCqmPBbZMIYvwBJDKibBujono7373J5VJzdv7KNMcEIMywlsbo+FDqrTgr
X-Gm-Gg: AfdE7cnzasvfsjxZB3LBC0i5ltw+5U6dA6r7ORy3gaHskzsryv4oWoiok3qf2vFyv6k
	ZjZ7la9w1DzcacELcbcRIWMiC2NAVOvOPggZzHYYJ3Y+frS2E79My0pidIhBVi1FwUjSrzVIci3
	lJTORoIfACGNA3haHefBKdtdSqyzF2HozNIvasxggsDwYuAlk19peUKg9FdW+RrnlUZbeDHZfrt
	fpL2D2ISy2mXOPQsR250NWGBNTF9uxNrk/cvdAPB9OJpsEe4Aex8+9aXhOYZloBIt7KreEJYjmd
	AVfoNCkGgOJHXLAsNSkPYtr1HAWp/A10aNgjfU8gyHcrfgqOfii5WNNs5BN5Zo960MxdiTPglHX
	o3h2fyg2eHZpgMTix0XKfx8ipdwrxYBhigiM=
X-Received: by 2002:a17:902:f705:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c7c3d409ccmr24628585ad.1.1782212077060;
        Tue, 23 Jun 2026 03:54:37 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c7c3d409ccmr24628025ad.1.1782212075903;
        Tue, 23 Jun 2026 03:54:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:07 +0530
Subject: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX5Xd8TnX8iVD0
 qHteBr9ux3hcNbMnmOZOLumYizByw8pE2dIvmzD0Rz9x/0z1Dcc0IaSES47eb060wiU6eBoQkga
 yzasgKCfSxduaiIw9GSZ5tz2zJX0Xpw=
X-Proofpoint-ORIG-GUID: TYZ0ASUOKERL5A933ilC54KmQ4ghsaX1
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a65ef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=N9uIJh8cW-Q2sVI0eSAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX5R9ngB9oI1Jq
 62iQE2Zl0H77YEeogvuFyfQuj8J95BNhb9qzkV5tRKYRyUjV6v8JtX6tP5GUz681wihIqVFwEIB
 ioCVZzwgqLo/xwwSg6/n4vKW4wGjmu8K+cSBIApgw1EQRa0MPQZY2yq23JyfEW14bJAfAp5kgbO
 mDvG2jsGvfUhXn+cyOccdQf27wlfWCKEV6C+EAgT8Jw/uDMSlE6Q6Cvs7AM9CCA8gLtjihZCqux
 GtIIfsrUSAtx/i23D0pi5/UD7KnIoH4rF2qnSYmUvmCyYMvy/A+gWXsfgK9F3xh/ukmoqwnuxjt
 gfqae7FhTosHKTvzFL/jOnbgsgYSCtr+RJ0h0P8jrbnq1hTmN6MzHMH367GMmiIZEvtbBF2ewSi
 k80JqLlpPWsfxb/S87K0eJIKw7WYBJZmoOLpDzKRtKUP6J0isJOQfyumUi9ebDIU5CfJk9bfXC1
 u1aY7MqFEGpYrJq5afA==
X-Proofpoint-GUID: TYZ0ASUOKERL5A933ilC54KmQ4ghsaX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 880066B66C8

Add support for the display clock controllers (DISPCC) on the
Qualcomm Nord platform.

The platform includes two display clock controller instances,
display0 and display1. Register support for both controllers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   11 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/dispcc0-nord.c | 2006 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c | 2006 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 4024 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911a35430bba7670409f59972dcca0f..874136a2ad9aaa117df2c7ad5c8abc5280b76339 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -145,6 +145,17 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_NORD_DISPCC
+	tristate "Nord Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the display clock controllers on Qualcomm Technologies, Inc
+	  Nord devices. There are two display clock controllers on Nord SoC.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7fc457607a179d8bab5623fedf706..4282f43e7078f1fe0dde6f942040eb6bd122d7ce 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
+obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
diff --git a/drivers/clk/qcom/dispcc0-nord.c b/drivers/clk/qcom/dispcc0-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..c0097482a1a94a99a05767726b5a7405cf014fea
--- /dev/null
+++ b/drivers/clk/qcom/dispcc0-nord.c
@@ -0,0 +1,2006 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DP2_PHY_PLL_LINK_CLK,
+	DT_DP2_PHY_PLL_VCO_DIV_CLK,
+	DT_DP3_PHY_PLL_LINK_CLK,
+	DT_DP3_PHY_PLL_VCO_DIV_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_MDSS_0_DISP_CC_PLL0_OUT_MAIN,
+	P_MDSS_0_DISP_CC_PLL1_OUT_EVEN,
+	P_MDSS_0_DISP_CC_PLL1_OUT_MAIN,
+	P_MDSS_0_DISP_CC_PLL2_OUT_MAIN,
+	P_MDSS_0_DISP_CC_PLL3_OUT_MAIN,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DP2_PHY_PLL_LINK_CLK,
+	P_DP2_PHY_PLL_VCO_DIV_CLK,
+	P_DP3_PHY_PLL_LINK_CLK,
+	P_DP3_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 900.0 MHz Configuration */
+static const struct alpha_pll_config mdss_0_disp_cc_pll0_config = {
+	.l = 0x2e,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll mdss_0_disp_cc_pll0 = {
+	.offset = 0x0,
+	.config = &mdss_0_disp_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config mdss_0_disp_cc_pll1_config = {
+	.l = 0x1f,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll mdss_0_disp_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &mdss_0_disp_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1363.2 MHz Configuration */
+static const struct alpha_pll_config mdss_0_disp_cc_pll2_config = {
+	.l = 0x47,
+	.alpha = 0x0,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000080,
+};
+
+static struct clk_alpha_pll mdss_0_disp_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &mdss_0_disp_cc_pll2_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+/* 1363.2 MHz Configuration */
+static const struct alpha_pll_config mdss_0_disp_cc_pll3_config = {
+	.l = 0x47,
+	.alpha = 0x0,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000080,
+};
+
+static struct clk_alpha_pll mdss_0_disp_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &mdss_0_disp_cc_pll3_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_0_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_0_DISP_CC_PLL2_OUT_MAIN, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_MDSS_0_DISP_CC_PLL3_OUT_MAIN, 5 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_0_disp_cc_pll2.clkr.hw },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .hw = &mdss_0_disp_cc_pll3.clkr.hw },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map disp_cc_0_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_0_DISP_CC_PLL2_OUT_MAIN, 1 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_MDSS_0_DISP_CC_PLL3_OUT_MAIN, 5 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_0_disp_cc_pll2.clkr.hw },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .hw = &mdss_0_disp_cc_pll3.clkr.hw },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_0_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_0_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_0_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_0_disp_cc_pll0.clkr.hw },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_0_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_0_parent_map_9[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data disp_cc_0_parent_data_9[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_mdss_ahb_clk_src[] = {
+	F(37500000, P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x837c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_7,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_0_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x813c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x8158,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x8220,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x81a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_4,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_0_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x81c0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x81d8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src = {
+	.cmd_rcgr = 0x81f0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src = {
+	.cmd_rcgr = 0x8208,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x82b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x8298,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_4,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_0_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x8238,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x8250,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_pixel2_clk_src = {
+	.cmd_rcgr = 0x8268,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_pixel2_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx1_pixel3_clk_src = {
+	.cmd_rcgr = 0x8280,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_0,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_pixel3_clk_src",
+		.parent_data = disp_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx2_aux_clk_src = {
+	.cmd_rcgr = 0x8318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx2_aux_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx2_link_clk_src = {
+	.cmd_rcgr = 0x82cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_5,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx2_link_clk_src",
+		.parent_data = disp_cc_0_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx2_pixel0_clk_src = {
+	.cmd_rcgr = 0x82e8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx2_pixel0_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx2_pixel1_clk_src = {
+	.cmd_rcgr = 0x8300,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx2_pixel1_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx3_aux_clk_src = {
+	.cmd_rcgr = 0x8364,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx3_aux_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx3_link_clk_src = {
+	.cmd_rcgr = 0x8348,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_5,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx3_link_clk_src",
+		.parent_data = disp_cc_0_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_dptx3_pixel0_clk_src = {
+	.cmd_rcgr = 0x8330,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_3,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx3_pixel0_clk_src",
+		.parent_data = disp_cc_0_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x8174,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_6,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_0_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x818c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_6,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_0_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_mdss_mdp_clk_src[] = {
+	F(300000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(417000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(532000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(650000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(710000000, P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_8,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_mdp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_0_parent_data_8,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x80c4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x80dc,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk2_clk_src = {
+	.cmd_rcgr = 0x80f4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_2,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_pclk2_clk_src",
+		.parent_data = disp_cc_0_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x8124,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_0_disp_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_sleep_clk_src = {
+	.cmd_rcgr = 0xe064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_9,
+	.freq_tbl = ftbl_mdss_0_disp_cc_sleep_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_sleep_clk_src",
+		.parent_data = disp_cc_0_parent_data_9,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_0_disp_cc_xo_clk_src = {
+	.cmd_rcgr = 0xe044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_0_parent_map_1,
+	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_xo_clk_src",
+		.parent_data = disp_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x8154,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x8170,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x81bc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x82b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_dptx2_link_div_clk_src = {
+	.reg = 0x82e4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx2_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_0_disp_cc_mdss_dptx3_link_div_clk_src = {
+	.reg = 0x8360,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_0_disp_cc_mdss_dptx3_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_0_disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_accu_shift_clk = {
+	.halt_reg = 0xe060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xe060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x80c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x803c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x803c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel2_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_pixel3_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_pixel3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_pixel2_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_pixel2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_pixel3_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_pixel3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_pixel3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx2_aux_clk = {
+	.halt_reg = 0x80a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx2_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx2_crypto_clk = {
+	.halt_reg = 0x80a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx2_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx2_link_clk = {
+	.halt_reg = 0x809c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x809c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx2_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx2_link_intf_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx2_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx2_pixel0_clk = {
+	.halt_reg = 0x8094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx2_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx2_pixel1_clk = {
+	.halt_reg = 0x8098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx2_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx3_aux_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx3_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx3_crypto_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx3_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx3_link_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx3_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx3_link_intf_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx3_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_dptx3_pixel0_clk = {
+	.halt_reg = 0x80ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_dptx3_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x8010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0xa014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xa014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x8020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xc004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xc004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_pclk2_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_pclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_pclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0xa024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_0_disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_0_disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_0_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_0_disp_cc_mdss_core_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_0_disp_cc_mdss_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc mdss_0_disp_cc_mdss_core_int2_gdsc = {
+	.gdscr = 0xb000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_0_disp_cc_mdss_core_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *disp_cc_0_nord_clocks[] = {
+	[MDSS_DISP_CC_MDSS_ACCU_SHIFT_CLK] = &mdss_0_disp_cc_mdss_accu_shift_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB1_CLK] = &mdss_0_disp_cc_mdss_ahb1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK] = &mdss_0_disp_cc_mdss_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK_SRC] = &mdss_0_disp_cc_mdss_ahb_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK] = &mdss_0_disp_cc_mdss_byte0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC] = &mdss_0_disp_cc_mdss_byte0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &mdss_0_disp_cc_mdss_byte0_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK] = &mdss_0_disp_cc_mdss_byte0_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK] = &mdss_0_disp_cc_mdss_byte1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC] = &mdss_0_disp_cc_mdss_byte1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &mdss_0_disp_cc_mdss_byte1_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK] = &mdss_0_disp_cc_mdss_byte1_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK] = &mdss_0_disp_cc_mdss_dptx0_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &mdss_0_disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK] = &mdss_0_disp_cc_mdss_dptx0_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] =
+		&mdss_0_disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &mdss_0_disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK] = &mdss_0_disp_cc_mdss_dptx0_pixel3_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx0_pixel3_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+		&mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK] = &mdss_0_disp_cc_mdss_dptx1_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &mdss_0_disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK] = &mdss_0_disp_cc_mdss_dptx1_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] =
+		&mdss_0_disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &mdss_0_disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &mdss_0_disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &mdss_0_disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK] = &mdss_0_disp_cc_mdss_dptx1_pixel2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_pixel2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK] = &mdss_0_disp_cc_mdss_dptx1_pixel3_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx1_pixel3_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+		&mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK] = &mdss_0_disp_cc_mdss_dptx2_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx2_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_CRYPTO_CLK] = &mdss_0_disp_cc_mdss_dptx2_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK] = &mdss_0_disp_cc_mdss_dptx2_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx2_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC] =
+		&mdss_0_disp_cc_mdss_dptx2_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_INTF_CLK] = &mdss_0_disp_cc_mdss_dptx2_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK] = &mdss_0_disp_cc_mdss_dptx2_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx2_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK] = &mdss_0_disp_cc_mdss_dptx2_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx2_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK] = &mdss_0_disp_cc_mdss_dptx3_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx3_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_CRYPTO_CLK] = &mdss_0_disp_cc_mdss_dptx3_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK] = &mdss_0_disp_cc_mdss_dptx3_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx3_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC] =
+		&mdss_0_disp_cc_mdss_dptx3_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_INTF_CLK] = &mdss_0_disp_cc_mdss_dptx3_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK] = &mdss_0_disp_cc_mdss_dptx3_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC] = &mdss_0_disp_cc_mdss_dptx3_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK] = &mdss_0_disp_cc_mdss_esc0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK_SRC] = &mdss_0_disp_cc_mdss_esc0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK] = &mdss_0_disp_cc_mdss_esc1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK_SRC] = &mdss_0_disp_cc_mdss_esc1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP1_CLK] = &mdss_0_disp_cc_mdss_mdp1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK] = &mdss_0_disp_cc_mdss_mdp_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK_SRC] = &mdss_0_disp_cc_mdss_mdp_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT1_CLK] = &mdss_0_disp_cc_mdss_mdp_lut1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT_CLK] = &mdss_0_disp_cc_mdss_mdp_lut_clk.clkr,
+	[MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &mdss_0_disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK] = &mdss_0_disp_cc_mdss_pclk0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC] = &mdss_0_disp_cc_mdss_pclk0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK] = &mdss_0_disp_cc_mdss_pclk1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC] = &mdss_0_disp_cc_mdss_pclk1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK2_CLK] = &mdss_0_disp_cc_mdss_pclk2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK2_CLK_SRC] = &mdss_0_disp_cc_mdss_pclk2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC1_CLK] = &mdss_0_disp_cc_mdss_vsync1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK] = &mdss_0_disp_cc_mdss_vsync_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC] = &mdss_0_disp_cc_mdss_vsync_clk_src.clkr,
+	[MDSS_DISP_CC_PLL0] = &mdss_0_disp_cc_pll0.clkr,
+	[MDSS_DISP_CC_PLL1] = &mdss_0_disp_cc_pll1.clkr,
+	[MDSS_DISP_CC_PLL2] = &mdss_0_disp_cc_pll2.clkr,
+	[MDSS_DISP_CC_PLL3] = &mdss_0_disp_cc_pll3.clkr,
+	[MDSS_DISP_CC_SLEEP_CLK_SRC] = &mdss_0_disp_cc_sleep_clk_src.clkr,
+	[MDSS_DISP_CC_XO_CLK_SRC] = &mdss_0_disp_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *disp_cc_0_nord_gdscs[] = {
+	[MDSS_DISP_CC_MDSS_CORE_GDSC] = &mdss_0_disp_cc_mdss_core_gdsc,
+	[MDSS_DISP_CC_MDSS_CORE_INT2_GDSC] = &mdss_0_disp_cc_mdss_core_int2_gdsc,
+};
+
+static const struct qcom_reset_map disp_cc_0_nord_resets[] = {
+	[MDSS_DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[MDSS_DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
+	[MDSS_DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
+};
+
+static struct clk_alpha_pll *disp_cc_0_nord_plls[] = {
+	&mdss_0_disp_cc_pll0,
+	&mdss_0_disp_cc_pll1,
+	&mdss_0_disp_cc_pll2,
+	&mdss_0_disp_cc_pll3,
+};
+
+static u32 disp_cc_0_nord_critical_cbcrs[] = {
+	0xc00c, /* MDSS_DISP_CC_AHB_CLK */
+	0xc008, /* MDSS_DISP_CC_VSYNC_CLK */
+	0xe07c, /* MDSS_DISP_CC_SLEEP_CLK */
+	0xe05c, /* MDSS_DISP_CC_XO_CLK */
+};
+
+static const struct regmap_config disp_cc_0_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1a00c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data disp_cc_0_nord_driver_data = {
+	.alpha_plls = disp_cc_0_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_0_nord_plls),
+	.clk_cbcrs = disp_cc_0_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_0_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc disp_cc_0_nord_desc = {
+	.config = &disp_cc_0_nord_regmap_config,
+	.clks = disp_cc_0_nord_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_0_nord_clocks),
+	.resets = disp_cc_0_nord_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_0_nord_resets),
+	.gdscs = disp_cc_0_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_0_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &disp_cc_0_nord_driver_data,
+};
+
+static const struct of_device_id disp_cc_0_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dispcc0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_0_nord_match_table);
+
+static int disp_cc_0_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &disp_cc_0_nord_desc);
+}
+
+static struct platform_driver disp_cc_0_nord_driver = {
+	.probe = disp_cc_0_nord_probe,
+	.driver = {
+		.name = "dispcc0-nord",
+		.of_match_table = disp_cc_0_nord_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_0_nord_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC0 NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dispcc1-nord.c b/drivers/clk/qcom/dispcc1-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..29b4497cd336127be06d074e83d68e0a249a5ad5
--- /dev/null
+++ b/drivers/clk/qcom/dispcc1-nord.c
@@ -0,0 +1,2006 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DP2_PHY_PLL_LINK_CLK,
+	DT_DP2_PHY_PLL_VCO_DIV_CLK,
+	DT_DP3_PHY_PLL_LINK_CLK,
+	DT_DP3_PHY_PLL_VCO_DIV_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_MDSS_1_DISP_CC_PLL0_OUT_MAIN,
+	P_MDSS_1_DISP_CC_PLL1_OUT_EVEN,
+	P_MDSS_1_DISP_CC_PLL1_OUT_MAIN,
+	P_MDSS_1_DISP_CC_PLL2_OUT_MAIN,
+	P_MDSS_1_DISP_CC_PLL3_OUT_MAIN,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DP2_PHY_PLL_LINK_CLK,
+	P_DP2_PHY_PLL_VCO_DIV_CLK,
+	P_DP3_PHY_PLL_LINK_CLK,
+	P_DP3_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 900.0 MHz Configuration */
+static const struct alpha_pll_config mdss_1_disp_cc_pll0_config = {
+	.l = 0x2e,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll mdss_1_disp_cc_pll0 = {
+	.offset = 0x0,
+	.config = &mdss_1_disp_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config mdss_1_disp_cc_pll1_config = {
+	.l = 0x1f,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll mdss_1_disp_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &mdss_1_disp_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1363.2 MHz Configuration */
+static const struct alpha_pll_config mdss_1_disp_cc_pll2_config = {
+	.l = 0x47,
+	.alpha = 0x0,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000080,
+};
+
+static struct clk_alpha_pll mdss_1_disp_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &mdss_1_disp_cc_pll2_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+/* 1363.2 MHz Configuration */
+static const struct alpha_pll_config mdss_1_disp_cc_pll3_config = {
+	.l = 0x47,
+	.alpha = 0x0,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000080,
+};
+
+static struct clk_alpha_pll mdss_1_disp_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &mdss_1_disp_cc_pll3_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_1_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_1_DISP_CC_PLL2_OUT_MAIN, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_MDSS_1_DISP_CC_PLL3_OUT_MAIN, 5 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_1_disp_cc_pll2.clkr.hw },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .hw = &mdss_1_disp_cc_pll3.clkr.hw },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map disp_cc_1_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_1_DISP_CC_PLL2_OUT_MAIN, 1 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_MDSS_1_DISP_CC_PLL3_OUT_MAIN, 5 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_1_disp_cc_pll2.clkr.hw },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .hw = &mdss_1_disp_cc_pll3.clkr.hw },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_1_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_1_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_MDSS_1_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &mdss_1_disp_cc_pll0.clkr.hw },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+	{ .hw = &mdss_1_disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_1_parent_map_9[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data disp_cc_1_parent_data_9[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_mdss_ahb_clk_src[] = {
+	F(37500000, P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_MDSS_1_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x837c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_7,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_1_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_mdss_byte0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x813c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x8158,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x8220,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x81a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_4,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_1_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x81c0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x81d8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src = {
+	.cmd_rcgr = 0x81f0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src = {
+	.cmd_rcgr = 0x8208,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x82b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x8298,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_4,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_1_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x8238,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x8250,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_pixel2_clk_src = {
+	.cmd_rcgr = 0x8268,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_pixel2_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx1_pixel3_clk_src = {
+	.cmd_rcgr = 0x8280,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_0,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_pixel3_clk_src",
+		.parent_data = disp_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx2_aux_clk_src = {
+	.cmd_rcgr = 0x8318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx2_aux_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx2_link_clk_src = {
+	.cmd_rcgr = 0x82cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_5,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx2_link_clk_src",
+		.parent_data = disp_cc_1_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx2_pixel0_clk_src = {
+	.cmd_rcgr = 0x82e8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx2_pixel0_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx2_pixel1_clk_src = {
+	.cmd_rcgr = 0x8300,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx2_pixel1_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx3_aux_clk_src = {
+	.cmd_rcgr = 0x8364,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx3_aux_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx3_link_clk_src = {
+	.cmd_rcgr = 0x8348,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_5,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx3_link_clk_src",
+		.parent_data = disp_cc_1_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_dptx3_pixel0_clk_src = {
+	.cmd_rcgr = 0x8330,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_3,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx3_pixel0_clk_src",
+		.parent_data = disp_cc_1_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x8174,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_6,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_1_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x818c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_6,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_1_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_mdss_mdp_clk_src[] = {
+	F(300000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(417000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(532000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(650000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(710000000, P_MDSS_1_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_8,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_mdp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_1_parent_data_8,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x80c4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x80dc,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_pclk2_clk_src = {
+	.cmd_rcgr = 0x80f4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_2,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_pclk2_clk_src",
+		.parent_data = disp_cc_1_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x8124,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdss_1_disp_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_sleep_clk_src = {
+	.cmd_rcgr = 0xe064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_9,
+	.freq_tbl = ftbl_mdss_1_disp_cc_sleep_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_sleep_clk_src",
+		.parent_data = disp_cc_1_parent_data_9,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 mdss_1_disp_cc_xo_clk_src = {
+	.cmd_rcgr = 0xe044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_1_parent_map_1,
+	.freq_tbl = ftbl_mdss_1_disp_cc_mdss_byte0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_xo_clk_src",
+		.parent_data = disp_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x8154,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x8170,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x81bc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x82b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_dptx2_link_div_clk_src = {
+	.reg = 0x82e4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx2_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div mdss_1_disp_cc_mdss_dptx3_link_div_clk_src = {
+	.reg = 0x8360,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "mdss_1_disp_cc_mdss_dptx3_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&mdss_1_disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_accu_shift_clk = {
+	.halt_reg = 0xe060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xe060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x80c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x803c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x803c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel2_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_pixel3_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_pixel3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_pixel2_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_pixel2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_pixel2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_pixel3_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_pixel3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_pixel3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx2_aux_clk = {
+	.halt_reg = 0x80a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx2_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx2_crypto_clk = {
+	.halt_reg = 0x80a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx2_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx2_link_clk = {
+	.halt_reg = 0x809c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x809c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx2_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx2_link_intf_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx2_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx2_pixel0_clk = {
+	.halt_reg = 0x8094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx2_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx2_pixel1_clk = {
+	.halt_reg = 0x8098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx2_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx3_aux_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx3_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx3_crypto_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx3_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx3_link_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx3_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx3_link_intf_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx3_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_dptx3_pixel0_clk = {
+	.halt_reg = 0x80ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_dptx3_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x8010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0xa014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xa014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x8020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xc004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xc004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_pclk2_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_pclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_pclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0xa024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mdss_1_disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "mdss_1_disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdss_1_disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_1_disp_cc_mdss_core_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_1_disp_cc_mdss_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc mdss_1_disp_cc_mdss_core_int2_gdsc = {
+	.gdscr = 0xb000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "mdss_1_disp_cc_mdss_core_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *disp_cc_1_nord_clocks[] = {
+	[MDSS_DISP_CC_MDSS_ACCU_SHIFT_CLK] = &mdss_1_disp_cc_mdss_accu_shift_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB1_CLK] = &mdss_1_disp_cc_mdss_ahb1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK] = &mdss_1_disp_cc_mdss_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_AHB_CLK_SRC] = &mdss_1_disp_cc_mdss_ahb_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK] = &mdss_1_disp_cc_mdss_byte0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC] = &mdss_1_disp_cc_mdss_byte0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &mdss_1_disp_cc_mdss_byte0_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK] = &mdss_1_disp_cc_mdss_byte0_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK] = &mdss_1_disp_cc_mdss_byte1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC] = &mdss_1_disp_cc_mdss_byte1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &mdss_1_disp_cc_mdss_byte1_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK] = &mdss_1_disp_cc_mdss_byte1_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK] = &mdss_1_disp_cc_mdss_dptx0_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &mdss_1_disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK] = &mdss_1_disp_cc_mdss_dptx0_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] =
+		&mdss_1_disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &mdss_1_disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK] = &mdss_1_disp_cc_mdss_dptx0_pixel3_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx0_pixel3_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+		&mdss_1_disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK] = &mdss_1_disp_cc_mdss_dptx1_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &mdss_1_disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK] = &mdss_1_disp_cc_mdss_dptx1_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] =
+		&mdss_1_disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &mdss_1_disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &mdss_1_disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &mdss_1_disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK] = &mdss_1_disp_cc_mdss_dptx1_pixel2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_pixel2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK] = &mdss_1_disp_cc_mdss_dptx1_pixel3_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx1_pixel3_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+		&mdss_1_disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK] = &mdss_1_disp_cc_mdss_dptx2_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx2_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_CRYPTO_CLK] = &mdss_1_disp_cc_mdss_dptx2_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK] = &mdss_1_disp_cc_mdss_dptx2_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx2_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC] =
+		&mdss_1_disp_cc_mdss_dptx2_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_LINK_INTF_CLK] = &mdss_1_disp_cc_mdss_dptx2_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK] = &mdss_1_disp_cc_mdss_dptx2_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx2_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK] = &mdss_1_disp_cc_mdss_dptx2_pixel1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx2_pixel1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK] = &mdss_1_disp_cc_mdss_dptx3_aux_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx3_aux_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_CRYPTO_CLK] = &mdss_1_disp_cc_mdss_dptx3_crypto_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK] = &mdss_1_disp_cc_mdss_dptx3_link_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx3_link_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC] =
+		&mdss_1_disp_cc_mdss_dptx3_link_div_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_LINK_INTF_CLK] = &mdss_1_disp_cc_mdss_dptx3_link_intf_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK] = &mdss_1_disp_cc_mdss_dptx3_pixel0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC] = &mdss_1_disp_cc_mdss_dptx3_pixel0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK] = &mdss_1_disp_cc_mdss_esc0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC0_CLK_SRC] = &mdss_1_disp_cc_mdss_esc0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK] = &mdss_1_disp_cc_mdss_esc1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_ESC1_CLK_SRC] = &mdss_1_disp_cc_mdss_esc1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP1_CLK] = &mdss_1_disp_cc_mdss_mdp1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK] = &mdss_1_disp_cc_mdss_mdp_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_CLK_SRC] = &mdss_1_disp_cc_mdss_mdp_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT1_CLK] = &mdss_1_disp_cc_mdss_mdp_lut1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_MDP_LUT_CLK] = &mdss_1_disp_cc_mdss_mdp_lut_clk.clkr,
+	[MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &mdss_1_disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK] = &mdss_1_disp_cc_mdss_pclk0_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC] = &mdss_1_disp_cc_mdss_pclk0_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK] = &mdss_1_disp_cc_mdss_pclk1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC] = &mdss_1_disp_cc_mdss_pclk1_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK2_CLK] = &mdss_1_disp_cc_mdss_pclk2_clk.clkr,
+	[MDSS_DISP_CC_MDSS_PCLK2_CLK_SRC] = &mdss_1_disp_cc_mdss_pclk2_clk_src.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC1_CLK] = &mdss_1_disp_cc_mdss_vsync1_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK] = &mdss_1_disp_cc_mdss_vsync_clk.clkr,
+	[MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC] = &mdss_1_disp_cc_mdss_vsync_clk_src.clkr,
+	[MDSS_DISP_CC_PLL0] = &mdss_1_disp_cc_pll0.clkr,
+	[MDSS_DISP_CC_PLL1] = &mdss_1_disp_cc_pll1.clkr,
+	[MDSS_DISP_CC_PLL2] = &mdss_1_disp_cc_pll2.clkr,
+	[MDSS_DISP_CC_PLL3] = &mdss_1_disp_cc_pll3.clkr,
+	[MDSS_DISP_CC_SLEEP_CLK_SRC] = &mdss_1_disp_cc_sleep_clk_src.clkr,
+	[MDSS_DISP_CC_XO_CLK_SRC] = &mdss_1_disp_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *disp_cc_1_nord_gdscs[] = {
+	[MDSS_DISP_CC_MDSS_CORE_GDSC] = &mdss_1_disp_cc_mdss_core_gdsc,
+	[MDSS_DISP_CC_MDSS_CORE_INT2_GDSC] = &mdss_1_disp_cc_mdss_core_int2_gdsc,
+};
+
+static const struct qcom_reset_map disp_cc_1_nord_resets[] = {
+	[MDSS_DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[MDSS_DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
+	[MDSS_DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
+};
+
+static struct clk_alpha_pll *disp_cc_1_nord_plls[] = {
+	&mdss_1_disp_cc_pll0,
+	&mdss_1_disp_cc_pll1,
+	&mdss_1_disp_cc_pll2,
+	&mdss_1_disp_cc_pll3,
+};
+
+static u32 disp_cc_1_nord_critical_cbcrs[] = {
+	0xc00c, /* MDSS_DISP_CC_RSCC_AHB_CLK */
+	0xc008, /* MDSS_DISP_CC_RSCC_VSYNC CLK */
+	0xe07c, /* MDSS_DISP_CC_SLEEP_CLK */
+	0xe05c, /* MDSS_DISP_CC_XO_CLK */
+};
+
+static const struct regmap_config disp_cc_1_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1a00c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data disp_cc_1_nord_driver_data = {
+	.alpha_plls = disp_cc_1_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_1_nord_plls),
+	.clk_cbcrs = disp_cc_1_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_1_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc disp_cc_1_nord_desc = {
+	.config = &disp_cc_1_nord_regmap_config,
+	.clks = disp_cc_1_nord_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_1_nord_clocks),
+	.resets = disp_cc_1_nord_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_1_nord_resets),
+	.gdscs = disp_cc_1_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_1_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &disp_cc_1_nord_driver_data,
+};
+
+static const struct of_device_id disp_cc_1_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dispcc1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_1_nord_match_table);
+
+static int disp_cc_1_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &disp_cc_1_nord_desc);
+}
+
+static struct platform_driver disp_cc_1_nord_driver = {
+	.probe = disp_cc_1_nord_probe,
+	.driver = {
+		.name = "dispcc1-nord",
+		.of_match_table = disp_cc_1_nord_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_1_nord_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC1 NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


