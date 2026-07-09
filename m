Return-Path: <linux-arm-msm+bounces-117852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oE4kIBA/T2owcwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:26:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057272D1BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="D/v0rw55";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ireZlc8P;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117852-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117852-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7DBB3045A9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EE83C1081;
	Thu,  9 Jul 2026 06:25:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5AF3B95E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:25:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578337; cv=none; b=kEEidKyyWMZWixcFoN+ZD5FAGaIDR5wS1YuAu9I9QV1mfJJuD4jTUpWdwFOoOkEjtmdg7hUAi2Gwpo0yCpLh2PKGxku7tEb/szlxfC79kKOoFm/rGskdxEIm55/pXPnX//6/fVEjrSlefZwn235w5+YxESebo5n/BwMzk6376K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578337; c=relaxed/simple;
	bh=xaM/hVUjZo3snEyz/S9bcZ/H9ysyVZEXqq3xmE7nNZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X9KlUBCXctV4oueRo8dxwbGnwnkX8+JVAOCBx9qAnAZPqJAqg2IBS0jeX8Ublyvc7nwNljmKAm9DDgYq9Q+yArJ+wgUGbp8nr+SPyEtpW/RaOIioXtiSIIFDERF4clQWBK2B7OWf5vdVl2wMeT9ZCwJ/duqjSqGVEWya77NtTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/v0rw55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ireZlc8P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961CTS933499
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1YqnzWWYNh3cmaUOCZIRd7
	TUov9rA8o7dhqsYSUv9m0=; b=D/v0rw55N+8gvJL2TPFvB6q34PLe7kK4RaJT7w
	WP+mnEBmSOe1UvyzcNS09krx6WOLlf917tXVXnLRrcqAZxP8cRhOA47mW8XnGn1Y
	k8EsYaxNhGsMwsekKBAPgGT4gJlrVctubMoBKyx8sGsn6O5JrKmWfuMdQ9dRswdA
	8M/rOYfeXhKrS/v68WfvkoAcAfdCDSWCvm5SD7xtPdVgnmucXbdeuCqHeUUxIXjI
	bX/2LsSI2Jd0Uri3hT6vNvPCna/B1Qh/GGDh11crLaDF8M4WTbVq0ekjC/ow18Bh
	hndVNiQFktdwwNs0LdMntW5URBp/Fb1Q7fgb8PTSRTYzfNUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6j7gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:25:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc77a6943eso35062715ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578334; x=1784183134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=;
        b=ireZlc8PjfbsLdSO2j9msA7cd+pg4BXEiVQvg9hJhhTqO+31w01kLLRabzpI8AVDRF
         coI64uMsurXf4j1ExVvpZgP+YFmEh4OgddBsrPToEVGi35o05r9jhqstP+wKHQ7MiG6u
         4/sitbqNKxe/IsTqeRPWpQ8ksunyMdUOtQ3chPqdu1w/NP9XQ1aBlsefISG9UZycdEwa
         8YHSGd3h05BLKTAhGBfKhhOfkrMk42Ef/wO6WxQT1xvt89/RjH8NDvToC5fiHyyrr3+c
         JUDr1NTHEj5gx6X7bViWLVU8XdZ2lhYefc+TpNiMPN3NtMMzI3gzu2R5kf6eIa849RcQ
         vJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578334; x=1784183134;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=;
        b=fxSKN7uIvYYtEVB7kAefeBRaRRkjAcuMe9nvAQlFJkYeXwKe8nR+8N6lZa6CObqW+x
         5CiUU7CoRlRywk9fW58Hqw8YeUiHC/9BTnxx96821Uij8wJ4XTd8aYK4J+Hta2pxiV/b
         EWwfsXv0i03cuKYYPvGg9FfUwax3RFrqOQ3djALx16RlrjTuw5IKLs5HWfbk9WDrYEpf
         RDiVxzVPYSswkBecm8LGH4kvGT8ybsaOIfmupgKElfxtC/5kBErTxJY8ogSsgkZp6jrt
         iYmuAXVP8r7yhte11Z7tgkE/D0kUy4oKoSBcjW+veLaUaaQ0jH8S7qMasCOqp9zkXWVn
         x7Mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4uO9z3mutTj6aFHdZeQORJOUz0eTRN9KbJYOQ22kObmJaSUBwbRV8alvLplQsokxW0aasJb8CzjjE306j@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgQflt3DDMpIVAFKIW7KGOL7qw06XEMsm9ifoJqtAQ3cdlx9o
	t2JHtrzaZSrWACpOoW9GTf9Hl/3tvJ9gScXUN03WZM4zvsG+YFXq4XcYrsoWs/Z+OO/eNzZiM1L
	0ZEya2A3txXCzkU0/DT6KYyqz1LwAy3decJFysIZ6gC0f86KwcVnjC17K7qlctvoPCEo6
X-Gm-Gg: AfdE7ck3UUKIf3Ezz9jwWzyOd/rcXCsYyXqgruFL0B9plLan7tz4pfENm+CTq00luWg
	QXVSBX0SiXWMcextT1CP/UHxpFHtPjW1wi134NRHbsEAyTNMhCawb4QQd9EPpePvCLdkrl2Kobo
	avE3mQFR2VLuCjgKiSXoKVKE4ec7e2CTYLqs4JUYIiJ1HcSqXxRdUxTKSDCh2s79Jql7wCda3J+
	QA5HM6REmK9rsU0EUpflRgytX63ljFcoEz6IxGOqxkfsMt6N4cVwTOutGoDekzhpMOHmOcwVyed
	mKW7aBvC3Y0VvUJ09ZsdrcPnAcnOntB748xCvSicwRb7+nhgdzicGWA32o4zBicgqlvp98Yw/ZS
	H+QyPSkvYMdJC97YdtDvgDsD6rVU7ZUrANiNcksAt5LqS
X-Received: by 2002:a17:903:37cd:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ccea2a571fmr63676585ad.7.1783578333359;
        Wed, 08 Jul 2026 23:25:33 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ccea2a571fmr63676155ad.7.1783578332723;
        Wed, 08 Jul 2026 23:25:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:25:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Date: Thu, 09 Jul 2026 11:55:12 +0530
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMg+T2oC/yWNUQrCMBAFr1L220BMaQSvIrKkm42NYlo2iQild
 2+0nwPz5q2QWSJnuHYrCH9ijnNqcD51QJNLD1bRNwajjdUXbZXzHoVLlYQ0Mb0wzILVScHDx+W
 tvKGxt0PbhB5aaREO8ft/ud0PznV8MpVfGrZtB+rg+KeHAAAA
X-Change-ID: 20260706-add_return_check_for_uart_change_pm-d2cb365202f3
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=4632;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xaM/hVUjZo3snEyz/S9bcZ/H9ysyVZEXqq3xmE7nNZU=;
 b=xstS7B9zPIQfwsEBA4/XFGTcfAsU4oB4GSGJzY7XzF/v3xKj/L2hg5jibSJ09Rtcp/Zvw7q/a
 rKqBeBXhUaoCx0C8rUDinlyefoUSLITLDPzV1Kykv7lFa1T2iyWiUtz
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXwAfgPULg1k0u
 EQ3RVEbEYR6OjsMTmm+orffJkxOC1Bon8gNsNbIcPlRaVKHPauD6i4YiwwGDxvjgdnBP4sFFttQ
 +66dp7mqMw/vIAF3ZmCFoZ2ck6/R2Qw=
X-Proofpoint-GUID: Tp5KValxMlZnmeHrM6_sXO9R9kILRkYw
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f3ede cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Sp74d_8yOxMrUkFL1bcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Tp5KValxMlZnmeHrM6_sXO9R9kILRkYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX/kyyeKbLLyxA
 CRgbnNqElkzHCS65hyYShCJvbWm1vxPlpWcD6gJ/q33WZBYVBco6iWdTACGtCFlW2eWwhFCQU1p
 QSyHhjfquURGz6LSWV6xRXZwY04kwp6qM2rtVwSUtZGywlsxedI+xTpigNBKguu4kZRCJwy41cE
 8a2hfYfsfF2PFDCaUdjZwIJ+N9eUjp3RoxyTSTK8tfW48n9/gpiZUwKN4uzh1RQjgyBxCLGOO65
 gt7QexdHqvCpOKxIXcefhjllTPGcE7eo0D4wmOZf/s3L4OxBIgY1cV0Rr/TAwFpzZKqkbe8MAaM
 6KRgMfRmoTXxnGb+He6pvMuOEKJL23yBv/IB0MNWNdALt9LZYbKMbDENiMujsEX5bK4s4+jG1Dm
 TsFMS/O/i7OmJXxSLeJ/gH6VqxIv2zDiWX9UMdY+5y7peQ+XhXl4GdCoYT4Hd6+ySQ1ONL9Mo3Y
 oA/yw3sytSyWH3Ig0Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-117852-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.or
 g,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,uart_ops.pm:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 3057272D1BC

The uart_ops.pm callback has been declared void since its introduction,
which means any error from a driver's power management implementation is
silently discarded by uart_change_pm(). Beyond losing the error
information, uart_change_pm() unconditionally updates state->pm_state
even when the underlying hardware transition failed. This causes the
serial core to track a power state that does not reflect reality:
subsequent calls to uart_change_pm() see the stale cached state as
matching the requested state and skip the callback entirely, leaving the
hardware permanently stuck with no further recovery attempt.

On modern platforms where the .pm callback performs real work —
enabling clock trees, interacting with runtime PM, asserting voltage
regulators — this is a correctness gap. Failures are invisible to the
PM framework, the port proceeds to call ops->startup() on potentially
unpowered hardware, and suspend/resume errors are hidden from the core
that needs to handle them.

This series fixes the problem in four steps:

  Patch 1 changes the uart_ops.pm callback signature from void to int,
  updates uart_change_pm() to propagate errors and only commit
  state->pm_state on success, and handles the return value at every
  call site in serial_core.c with appropriate policy per context
  (propagate, log, or skip-on-failure).

  Patch 2 updates the 8250 driver family: serial8250_do_pm() and
  serial8250_pm() are updated to return int (with the exported symbol
  declaration updated in serial_8250.h), and the 8250 sub-driver
  pm callbacks are updated to return 0.

  Patch 3 updates the remaining non-8250 serial drivers. All .pm
  implementations are updated to return 0. The sh-sci forward
  declaration shared with rsci is also updated.

  Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
  OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
  MIPS/Alchemy (alchemy_8250_pm).

All existing .pm implementations return 0, so there is no functional
change for any current driver. The series purely adds the infrastructure
for drivers to report errors going forward, with the serial core ready
to handle them correctly.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (6):
      tty: serial: change uart_ops.pm callback to return int
      serial: 8250: update .pm callbacks to return int
      tty: serial: update .pm callbacks to return int
      arch: update uart pm callbacks to return int
      tty: serial: propagate uart_configure_port failure to uart_add_one_port
      serial: qcom-geni: check return value of pm_runtime_resume_and_get()

 arch/arm/mach-omap1/board-ams-delta.c       |  10 +--
 arch/arm/mach-sa1100/assabet.c              |   3 +-
 arch/arm/mach-sa1100/h3xxx.c                |   3 +-
 arch/mips/alchemy/common/platform.c         |   5 +-
 drivers/tty/serial/8250/8250_dw.c           |   3 +-
 drivers/tty/serial/8250/8250_exar.c         |   4 +-
 drivers/tty/serial/8250/8250_mtk.c          |   4 +-
 drivers/tty/serial/8250/8250_omap.c         |   6 +-
 drivers/tty/serial/8250/8250_port.c         |   9 ++-
 drivers/tty/serial/8250/8250_pxa.c          |   6 +-
 drivers/tty/serial/atmel_serial.c           |   5 +-
 drivers/tty/serial/fsl_lpuart.c             |   3 +-
 drivers/tty/serial/msm_serial.c             |   5 +-
 drivers/tty/serial/omap-serial.c            |   3 +-
 drivers/tty/serial/pxa.c                    |   3 +-
 drivers/tty/serial/qcom_geni_serial.c       |  16 +++--
 drivers/tty/serial/samsung_tty.c            |   5 +-
 drivers/tty/serial/sc16is7xx.c              |   5 +-
 drivers/tty/serial/serial_core.c            | 104 ++++++++++++++++++++--------
 drivers/tty/serial/serial_txx9.c            |   3 +-
 drivers/tty/serial/sh-sci-common.h          |   4 +-
 drivers/tty/serial/sh-sci.c                 |   5 +-
 drivers/tty/serial/sprd_serial.c            |   5 +-
 drivers/tty/serial/st-asc.c                 |   5 +-
 drivers/tty/serial/stm32-usart.c            |   5 +-
 drivers/tty/serial/uartlite.c               |   5 +-
 drivers/tty/serial/xilinx_uartps.c          |   5 +-
 include/linux/platform_data/sa11x0-serial.h |   2 +-
 include/linux/serial_8250.h                 |   6 +-
 include/linux/serial_core.h                 |  10 +--
 30 files changed, 171 insertions(+), 86 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260706-add_return_check_for_uart_change_pm-d2cb365202f3

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


