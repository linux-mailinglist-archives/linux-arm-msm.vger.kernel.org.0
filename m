Return-Path: <linux-arm-msm+bounces-98686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP48DSHBu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:25:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC172C89A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45088304EA69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243CD3B95E7;
	Thu, 19 Mar 2026 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVxwYM4Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKuvNBfw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266C3B8BD5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912255; cv=none; b=T+DB73Ur0J03cH76MP54mHlyZW6HzSos1oNlVpaWU2JRdktON6yj8+46vyc1X7tsCcMGH6XPxZ/w74rK4QQanAfVfKYiEaBvZa00O1ptgtR64AXOdUnlvomaS/JLAgEeZbTdTIvnFBV77lZnmT8YJERFZz1qzTAV5yB/1Dqd1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912255; c=relaxed/simple;
	bh=KRymRX1QuZjNQ6hpNIelP6wQnSQcuOm5wBCio6j+878=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdHiNOAaI+et1Bl/56O/iIAxJYs2P/0I+daluFnuQQ8x7F9lvysVMTTjhvtwK8XiHbcoFR7dZ9Ilt2aE6aA9ldiJJX+xe8LKxrvFayo2pb9qw+6DwaOy3cTQqqe8NsG/uiHHzaf6ABOZ8KpeVYI/iMohxiMRyaZuK0s1dKlaekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVxwYM4Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKuvNBfw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wPK3927148
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN9UY8WGdjtt0KwTxQT8+oaWR/pF6nmPqVrzacygF4M=; b=dVxwYM4ZaP2sWH6q
	FCD38VF5xGYFjUhB2Z1ToGbc4QS31xN3rOKlh+KNQfIs9y7uIgbZQVMQoHyEGwrE
	f7e+uEt8jmGqmrUT5oCcr9f0kPNddyZSwt/aeGBG5d3WLf2iemp1SaqpVX6aRuiS
	fbSXHTpo+9j0Tz9SkjdORZDAvvUmMGaxsfVC6y8giVMib44hvaneGorIDD5D9E1J
	3hRRWRUMQV2/ce20xSKHgDKea8jRj1gdEwJAcQjiZW7lxd0LmWG9+v4Bkq1JoYw8
	fWvu7siGB0HrCsKGyJvP1E2U4mfe7I5hteSEj0nm4N3c5s9yWdUvzf9a80dLmdJB
	z26Ryw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1bu4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so8297875ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912252; x=1774517052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN9UY8WGdjtt0KwTxQT8+oaWR/pF6nmPqVrzacygF4M=;
        b=AKuvNBfwmkahRvTFJPN24Iszei9zB6Dn6NVphdhPmd13Y2MXTX9zTYGaNBx6GKNzve
         3pibkXwfwSOgZqVld2WUaG0NdFEYWnpp9ezAFq4Vl5fWHn6dGEiHbexObfnwTcR1XSQ5
         u+inTJwJjL2eXFEdawKOUIZYt+BwwhCL2NOapM9zsRtIb7f+xfBGAvIKWleR1q/yqEQc
         E31tzpKoWelxYBAbe7WLyXJAmRtuvvQYrmp4V4VgH4+GSnKA041H5P3d/mjY3o+4/mlT
         JXJdziqVBLV3+1EnptKKGvLeQJsfHE6NhN5Jyz7WgKqCGgcoUOLLoKgbmZLYmc2e5VW4
         /C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912252; x=1774517052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QN9UY8WGdjtt0KwTxQT8+oaWR/pF6nmPqVrzacygF4M=;
        b=ZxX5G11zco1kENjfsoTf5CrB8RcsQmVBcgzM8NJ4JoF6nf0E4cVJrHk7znsVlNjdMO
         5BxlDtVTwGTqyT73lNfbL3sLrNFZXyXTVXWP9aiyWIWdbRACuXST/yplMt6Uri96DmYz
         2yFIKSjIpvdf8V7f1IHyzzMYXIsd8xRwpvnvW+LYewPFZAo5t0ElM9EFWkHBlL3iWTHK
         /BrQ9dxAuL9D+L3s3xNYwH+kSz/eaCbi41ZaGu8azP0NeuDgqAxLEB2NkbzJ17fmvP5v
         9ZHizUsFxErEg1ZGmIwfpeKqPETMsJjYy6RVrR89Jvy9RRZxP/YjYGrYHxzf7gqnlJyt
         MEPg==
X-Forwarded-Encrypted: i=1; AJvYcCWmrzQHa7d82jexoS2tmOpJi5rRtKdnYWB8yT29788rN68OfUy+JmcEFZ/V70fxWsin6deQHWUaqmdcUMPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3h2WNESSAE+IIXPm6o+KnqTUkBVcadCZLZoLaP4OeSQAutDyy
	NHcbPmcVRbWrRddM2AvSggOVHEFO+5uebWIUTCRJYZhliII24+NFmaaKbh+dbaJDya2ivaLNV0G
	EJwpbQMeDzV5fX8i+uCBRZaXw5NlcDnJ8htk10yYq97/RVjv3PZJ25gnSTN0Hv339RYlE
X-Gm-Gg: ATEYQzxbd3HtmATQf3MTvi9rHIVRPpKhW7n34N4E1vtV1voLrQDB/zw9pNke+QvT6eN
	b9mdQgp1bvUerLcJpDZI8JGHmJiujiLZqH8La/tJKBoC7VjY5cGmEh5s8g9enU/I4ksVPYn+zGp
	E92emPIRuR7TlwQ2ywW4VE0pXVIvekKDlmNMJq4mNkddEtwGpCijH7WPN/Y65Xkm7IeJy3ubMDn
	3dgmjGywpUPwHQr9Ro2lYzUU06hPRXbOkD3QFOmCCo9cAnNr6aAnJwTM0/ZjqedibbEHXneUHOy
	5jnFLsVZ8HquycjbIc0lbF3HGFAw28k0wbp5gQ0w3pcl+1BJZ87QyFbxqfjm6aY+alWBParfpxt
	Ac/1A8Goo+mUBoeEhTMtxw38EzQFiIcKR7/Mt9pF5VufCZpfmkdG7lYwP9h6cqIJ37AHShK/sK5
	xX8ByEu447c9wBzgwFFVEI
X-Received: by 2002:a17:902:e947:b0:2ae:4911:4a52 with SMTP id d9443c01a7336-2b06e323bdbmr56352595ad.5.1773912251510;
        Thu, 19 Mar 2026 02:24:11 -0700 (PDT)
X-Received: by 2002:a17:902:e947:b0:2ae:4911:4a52 with SMTP id d9443c01a7336-2b06e323bdbmr56352325ad.5.1773912251033;
        Thu, 19 Mar 2026 02:24:11 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0704ccc67sm48391035ad.15.2026.03.19.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:10 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:23:54 +0800
Subject: [PATCH v3 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-enable_iris_on_purwa-v3-2-bf8f3e9a8c9c@oss.qualcomm.com>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
In-Reply-To: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773912238; l=4948;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KRymRX1QuZjNQ6hpNIelP6wQnSQcuOm5wBCio6j+878=;
 b=D5oiUNg5947RsAJYUsAgCr/T9agudeKxNvbVP/TP6S86W+GqkRmIiuvx+aTImorZ5CGQsSg72
 eJPxbl9Gq0wBcts5uJo5DCb67c4r23pwDNIhWKi+oFeUthMRn4fr14r
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: SoZJ0vL_5b0akcnr_F9HHSH6sD9m6zuA
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbc0bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aVJmGZMIucSeeH-qYSoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SoZJ0vL_5b0akcnr_F9HHSH6sD9m6zuA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX/qc+kDzI7rqM
 vYo5/YLl/ld+iisuiPBo5N0MLJng0nzy+CA6vhfFX/ItuNosK9PVVMXmw0017QkJZn961BWHeIK
 gya87Yv0lLHqRIvT9CCRJ7rYtINRY8I/RC+Ff7yhL3V8/mKjg7E2hdsqpwq/QrnXt8+eBNPFG++
 BnvCFA6lssc3RNJKq96Uy43PHe9hzMdILvy28cU/Rhppza6amjAWqssL16L3N0vjTQWVBfMdvOS
 hB/e6MqTw/ey8asnkK+pQtMBPh2W4vJQoP08ijgsSH9zGwh4FIUtslOpAODLGlSbTLkSFT2E/3B
 k6yF54vtquQcOPtdMsmK/mBLvyrG837b2t4Ph5y0rodh2XDVe4XiLmnW68Aw15VCEZ0Cf8YBJH5
 0563MoXmARRqyBoeifXJ5zWNlFQqsL9FXIAxl/FDrYIsJHpjgECydg+JhxLEPaiUjWpQwXfXE3B
 okowTDv58l+J0CjOSkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-98686-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FC172C89A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 87 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
 2 files changed, 88 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..b641a7ab1a5f9051573fe8900ba01aaf78603120 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -71,6 +71,85 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
+static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_bse_hw_clock;
+
+	return 0;
+
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0, value, i;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core))
+		goto disable_power;
+
+	dev_err(core->dev, "video hw is power on\n");
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
+					 reg_val, reg_val & 0x400000, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 reg_val, reg_val & 0x3, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 reg_val, !(reg_val & 0x3), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+}
+
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
 {
 	bool handshake_done = false, handshake_busy = false;
@@ -268,6 +347,14 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
+const struct vpu_ops iris_vpu3_purwa_ops = {
+	.power_off_hw = iris_vpu3_purwa_power_off_hardware,
+	.power_on_hw = iris_vpu3_purwa_power_on_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+};
+
 const struct vpu_ops iris_vpu33_ops = {
 	.power_off_hw = iris_vpu33_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b822341fb21e12de6b1395202f62cde..88a23cbdc06c5b38b4c8db67718cbd538f0e0721 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu3_purwa_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;

-- 
2.43.0


