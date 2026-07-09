Return-Path: <linux-arm-msm+bounces-117858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gjgpFhVAT2qGcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:30:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C228272D29A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:30:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TO/+YiWH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BvQFJSxS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BE523099F42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EF43B9950;
	Thu,  9 Jul 2026 06:26:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1B3C7DF5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578411; cv=none; b=Ta2wzF8tSRjOhV3GhlF4B/G35QUjq0Lfai4QCfq85rSQLqo/i5fbLJUbS/lfOQAfmSM4CtJGygjCscCX+4BibTROARap37bmP4BfsQe0BtH5R7lp1zewzVj9pJtZ6mBafosKCcN+ALFlWr2b7+35rW8ks68Azh3WurpLYMYeoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578411; c=relaxed/simple;
	bh=aLKsWDAwz2GNv0and/N/QxAf4HluEjygqicLIneo6A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IX3m3opkSnzAFPWwEedk94jRnry040IFba2NGS8ytGnnz3HzCWvt3QNesydsBTF01JxuUMa6XoE/XAvBFcJkXR23T+Ky6+2rgm36cT8eoW94nVn7TIGsiLbekJSVElevxE6vPfZZaKB0WHUOUCCsQPJLfKiFYgkDeZJmrKSWn/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO/+YiWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvQFJSxS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960OrZ916763
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=; b=TO/+YiWHz6cxuFqq
	qzv+0B/gddlxjqw7W5u6QCi1+Q5k7D63FXxoFjj3t8O5SZsGfAp8aaF/BMzqjznH
	/0XgRQPo8+dmjJw6HU0nFMFl1NGXVT/G+NG6pAQW7ZepcQjzKr4KZI/cmcxp/3z/
	URT5MLHK4BjfJR0WyIzO+4iDnxM/yxuDsXKDylNQlXfixTpLeIT4Qi5M5YiiWdxB
	q3p0z4G/ZWfnUmdky0Elzu6CqhWcrdafuMKBiH0UzjXrMBF1WsSQV+aDeY3hzKVO
	xEXKkRTV6KNjNkAA+Tcd7H4+mAM7DrCWVvRm6E85kQrm6DeB4uDJrBJ1bKiCV4b8
	7aXVVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv57sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:26:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so10976825ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578404; x=1784183204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=;
        b=BvQFJSxSvhYnyTc71TMsJ03yaggkDLpbcsC2+XZwCU+yJMJ3lh4WyaCNkzNNFspLnV
         LnuJOB2tlkYZ47Slx07OycRZDAYuI25CWA5aDmswbkqYZrgQtXUVCLzRB+GuSFfQlKUr
         mPfZEyXduxod+cgPqBN16cEeA6mXcVBkMBHM7S8hsicyaCSGmjbH9+KX+xOm93ELg/dL
         2DltPGrUY1QFcyBJ412L4wZK56NwYweambtVgR1oAtiMgQK2ekT2p0HBX+1aZZbVumPw
         8+cSrGMol4PpH4sOk3tBNiLQlRin9m1WWNS7/dy2EMRq1Ia7RnoqVUMWoE8fXp6m8xO+
         S83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578404; x=1784183204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUNYYkOrLEAjmX4TG3ez/Z/YI7BUz6Ijll5yCR5/a/M=;
        b=fUBglr2wWlpjDdFOZdlsQjwhTv62N/NI9fBMnup+H60WflZcHnP5oqEoU8gRDwAHke
         bVa4ikjAC3CzP+XR3MPEej8SdaqAtqCZ1FfZawonh54bw9MhyT3Lvw0dKfsaFIWfu+IW
         l+35BJNj1OUpzIFI1CpK7k6sbtEyWw+jl4q5DKKcb4ddaB7FSb76f/JvJUDtirsyGXzv
         Ar0B3I7MbRmd5VXxAlUJWRXGEI9pqc2dqAvgUHh/aPOW3MOC+Xekccyn1RW8RLAvWjTo
         qs9Ck8wzysePmJ+EjdJAeuGeNZ7xxi/7Dn4k2JRarfGEZ55Ri7MFCgb3TF6AorQn7u31
         P6VA==
X-Forwarded-Encrypted: i=1; AHgh+RopbTpabzthOW9iCu5kkpwzPSKgj41sf2bnpbntuPhvCjsnvtdNufOg5Kv5hDZXylpMjnNoIS8QgIacGNjh@vger.kernel.org
X-Gm-Message-State: AOJu0YzaD8LkNSafEJv2EKxd++yh0jEEj6+rkZRQWqfSElhYYStAEKjv
	2BkJ2lMJcIdf6IzM87UP5joVFQCOH2ghtG1zIpj5qXie5TRZXWECO05yHq9aMoY+o7QwxdLeQiw
	IPE8T0UX8qlkyoiYv66Rw02YNvaKx5TWyqSspQE1bg/mDfW8snHl6wkkGjyxmXD4HNKU2
X-Gm-Gg: AfdE7cmKoHZnSPFOO1DllAYNa6pQofY3juM6EqJvBkSOyaWm8NlI9BNjumRswkKIEqm
	Rhdkoktkki5KaAnVK9OSSWJHGGwrbG/PMT4KiiHZBK1rI2T3l+Fi+8eOPvIAJAu8tqc350sP+t9
	jDHus6Wda+hi3iXp+CDCvX9DLOsCT+DTnUoxDLSM0Zt/b6R44BAfaq8Dr3rq4bk3HOZ6RUWVRm6
	KBlMJr+AwgZye76ALzSG7uGz7RNMt/H9lGHJJOe6L6eR/cGhuEc9HwRMsW4bSCKHvLYMbgOc9lb
	Czf3muxhZVECsuDsSrdSmfSagJNWNfbPZEkC508lHipbulU61GqWCQG8hpmyQoUfEMbuE1bm7Zh
	HdjfjHBGVyjh9udkAKWxes7OchEevDork/S/BOwkRC64Q
X-Received: by 2002:a17:902:ec87:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cdd8a8446bmr16030295ad.12.1783578403731;
        Wed, 08 Jul 2026 23:26:43 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cdd8a8446bmr16029695ad.12.1783578403107;
        Wed, 08 Jul 2026 23:26:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:18 +0530
Subject: [PATCH 6/6] serial: qcom-geni: check return value of
 pm_runtime_resume_and_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-6-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=1832;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=aLKsWDAwz2GNv0and/N/QxAf4HluEjygqicLIneo6A8=;
 b=Hx8QUSLFIpbdbLJRMgaFZQcfWKI4SYHgH+sbG/r5N+1eUuprXpiRnOv/uNONREm1aauXqcg5E
 vvr6LWy+bUWDhuqdCnrvTyC5LuYYyp0okWLAMvA7Bc49vRU5kMASEqP
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4f3f24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=f88WUc_itYv57WQCX9cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX8aRLaTA10PqO
 12iowEcGYc1Jf5ALixy7Zn7Ke3T8n76CbCvV2KV7y8ljMCxruOWomAbU/eY2hPefF7+3LuJgA8o
 3hFxdHjk1/nH9ygTkjAhy0w24kQMPq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX2xsnRcswpOpF
 J9eOjeolxELTwXITgb7BL06yl+zILTsyYwNKeIOhhfcOiszClbr5rub0FpHYi6RVJ2+uR/qISTr
 xLYs6dKAF9IF9DFhE36HIk+OK0ZTS2E50oCZ+17NQL/X65+kqQCsgx4QOkEzUYwPjzqK5bT5SkW
 sjYgl6LcungCS/vwzvyIsbVGfdWlChk4ScxJLv6QfgaLqvtOEebNUsAI+G+9r627bmazqqBEPT9
 TI5wwQtyWnB3SY20b1GJYSo0FRquChnFZgHW/LSobVvO9XBrx7PrSseXonttOrfrtxAPass0yVD
 RsXvuhdHf5Bz8k5RsFhubol/Ky0+XjUImpzrycXTqPaxYOBoVcvVWlnq8bKesjHeBM47OiOpxYy
 aoXhNJBciy9tWgkPBiGrOUAC2JdqlktBRg/8HsLmDTtbzLtsS7ystjOh+QGNZjuchZnpBqdfSgU
 OaCF3hqLaXsdT2am5SA==
X-Proofpoint-ORIG-GUID: yB5ieqvhliePzDXnHdsTTJLlSfhEBddi
X-Proofpoint-GUID: yB5ieqvhliePzDXnHdsTTJLlSfhEBddi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117858-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.or
 g,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,uart_ops.pm:url,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C228272D29A

The .pm uart_ops callback calls pm_runtime_resume_and_get() but
discards its return value.  Failures such as -EAGAIN or -EACCES go
unnoticed and the driver continues as though the device is active,
which can lead to register accesses on an unsuspended device.

Check the return value and propagate the error to the caller.  The
.pm callback now returns int (since commit 6ffcacf023cb ("tty: serial:
change uart_ops.pm callback to return int")), so returning the error
code is sufficient for the serial core to handle the failure.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 17ab8acb3b8e..1ed09ac0af0c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1727,14 +1727,19 @@ static int geni_serial_resource_init(struct uart_port *uport)
 static int qcom_geni_serial_pm(struct uart_port *uport,
 			       unsigned int new_state, unsigned int old_state)
 {
+	int ret;
 
 	/* If we've never been called, treat it as off */
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		pm_runtime_resume_and_get(uport->dev);
-	else if (new_state == UART_PM_STATE_OFF &&
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
+		ret = pm_runtime_resume_and_get(uport->dev);
+		if (ret < 0) {
+			dev_err(uport->dev, "Failed to resume and get %d\n", ret);
+			return ret;
+		}
+	} else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
 		pm_runtime_put_sync(uport->dev);
 

-- 
2.34.1


