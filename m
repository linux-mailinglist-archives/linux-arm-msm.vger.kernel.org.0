Return-Path: <linux-arm-msm+bounces-103799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG58NOJT5mmwuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:27:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5531642F7BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB201309D403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C5C3368B2;
	Mon, 20 Apr 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmkyS6fn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/cLgjB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579BF332EBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699117; cv=none; b=JYI7SQifs2Mii/vahf9dnbvXxeUlAORAE6pP1JDfonyTB8eWHAw2mRrJ/4J794QM8kCfln+u410jqj/05ixLZvi82H50K7pMjy0M1NBQAYS2seQoe/V400vFKYX3dcehdn8aPZx/W8rEKOPOEi7ApBhTmmFiR4F0v3cOtLIqMnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699117; c=relaxed/simple;
	bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5zJIRxY5CBQkSrNtD1iy9Nl/OyeO1dJhQsyqkNrotlxpqJfeCYSTgSSnBT3jjA3ASFXI1LIGYb2ly9sX6eP7kN71qMdn5qmeBiwXd/GAnpUMJJEPTcLFlHYLflGeeyHaj5eMFAu1ZuPlaBZx1m1qXf6GSRylvsLT7iX4of5UhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmkyS6fn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/cLgjB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCOQYA1532135
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=RmkyS6fnhb+Kw7Cz
	CHA3bm4xEZvLa67Sc7VaByoq1777MMO32UoiFTCX9OWYl84bQUYSUt5oiuxal4+t
	Y5EjaMT5Dl60Zqc9cnFtdpSqrrXt/Hq1Q1gJ2ZTj5efhBlyqCoDmo6GXDGMI7Ly1
	wF+BUTYzGoj2FvjH6kNVWk2Zwuf0aIRQjO4vHjmTZjJjwQsYHQCJIkwWUgK64xhY
	AAaJIEKog00iwU+sBfnxn0QYK9FacFb+525cT8XdaTQ2UxU7Gze2/JgUjJaxX/EO
	nzWgfUvOT7pye2NzxlbQvMiL6wc0h/titHO5Dy0JcW+JIEu5tAw3o/AyaFwaJJxs
	gK0rlw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus21kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:54 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-479d602f184so853568b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699114; x=1777303914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=T/cLgjB9g89XLQ7mRc7VrvKDimoraL4B9BGzqyWzaNRpBi+j6vdxw4Z0Qk0pgVpLw6
         x/OfQrX9TzT1zZjqYV/IaDYwAmevyJgQL/7LDi/vDa6wSpIeDGHbI1r53WSdSTqiMpXy
         0frAJ/8HunfM7BvsWr6V5QIwfRrORZD4asuNM1eTSK3pe5clgbjF3lyJp/FE/qoHRPMG
         llvkZwM2Bq4ycrUyRUbmJT4RFVXu+n8aiopgo3V3EBLgzfOeyZEunZo/6mLxKh4Gc07p
         DF3Sq8MbhjoHq7hfSh76hE6k+IkyvKblbS1+NT007tVtfdd5HM+2cfmrieGQJjCCENJx
         LCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699114; x=1777303914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=rxUw+kMSsaDEmcQl8KbNauiN+ltoKCH0iA//1v98jkHBW8dbz+hcXsvmUlYsFdeeDa
         APr8HmiDKH1MEwOGLDJl1E7D8yMKQHi9yBQYg7ydJ4pyPonejBU59EWGWP9bxoSlG2Mt
         t+ASp4dueE+w/Ex6nZMaVo3iJWiqM3HVHkBp+ah5ezBsZ3TTkKOKu3GcTt/z6G7c+79l
         aVgZqscDLgbj4bhZUkupMzl9aewNRO5A8o28Zy0WvY/TE3mvEzkFxj8IZrNMD2emdhxS
         NH+ALQ7OTKbEwvTZkH2K6Nh4tdyZkGrWkkMhRc9TD4Eld+sCn6UfRg+tEEZd0VfeH1FA
         iTeA==
X-Forwarded-Encrypted: i=1; AFNElJ90dbYpma9vUQ79qPLKkIMMiIrUdj1Vn+fY9q92X0jgGSfe1WCPbYhH0Yge0haA5IXd8QEWf2DwecOMWQqY@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5wiCmfW7MNRHa/qOLUIaFE+PSzI1hHx+5syi5kyXN7QmWnxZ
	gDpk7wWT80ShitQ+364+xLn4P6plSMMyhve6pSBDXYblTB7v0syxiZVDHADu9PX01syatm8w7Qt
	YWvkzpXpmkIfEp/FEOtG/92MLgp5xs1nlI6b459JP5wgLFIfCDyt8GnqBvP6i6CRZu5Y/
X-Gm-Gg: AeBDietqwIWOdjxEfwutDwu3rg4TSFQOjCgJvuhUC5WgPO6P7FlzLoS1KZZYtW7DX0Z
	MhZ1k4QOs2Nq9z1X748oodjhpROZE1YJ6Nqo16KOGqM6x6LY9lGKapF3bIv6vNBZ/nemB6vCrdk
	T2Fnx8OKjAtk5HiRjF8DwX0qY6gd6lguc6lrQAthlKouo68f1C0qQvZKx3X9aR55ib3IOLHmbeU
	nygIJ4mwDTqeMpVme+HY7czJtrvPU3iCzgfvrt7vDgPbCvMoWY1vXcK7dbDOnT5HjJSi8p+fkTk
	7DLAeTj0YmMWHKgTOvCMiI3Kn6hS8Qw+XTVpHFWJbLzqOPbr4zwQ3LEmYyoPVIPZi4UWTmv6jOB
	l7kOFffFfQOwbUWPrWCVD96YDoqBBgwTATyYEsqQNRL0uGc8hr1mdf9PBgk626u3nfSndoB0Kyt
	ouUQrs98B+5fIZB5OzXyQkvl0LY4sqeXzL8wCTn6kTh/XeHg==
X-Received: by 2002:a05:6808:130e:b0:45c:85fa:5a3e with SMTP id 5614622812f47-4799bfdd9c8mr6136753b6e.25.1776699113584;
        Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6808:130e:b0:45c:85fa:5a3e with SMTP id 5614622812f47-4799bfdd9c8mr6136710b6e.25.1776699113069;
        Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:44 +0300
Subject: [PATCH v2 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-6-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbdKgPye7XiAeoSoakScVMUMjCOu46HRvpZ/
 8qrEonxwheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3QAKCRCLPIo+Aiko
 1Un6B/9Xc/mQPkkBXKR61XdHwQ1fxJIryoBdS++LX1KT0pEEYteBKqRJ/XSYQUrc+EPfqLU9PMe
 H5fUvSJHLdqvfoBUCUEQk1YTcGI7SpMzLE8TkrLZ01bkDNnf5fF1nWJ2jeH0js+HhXpHXNYwq6+
 eMkODvtWK6jOOzLJVIWNEp1Jf/1Qo6CBDpX7f6O8hgnOauDvYkX3G4NrCVHZbGnvqgxwfoT2Fmz
 XfzV/uRG9TPUQ007KR6NG8ovnQVsBtzYYjzGiMZtRYlCbgMnemhbOxWRCAYGadr/D7zvREJKKaC
 /KB3r6hKi8dNIA7osaCTEBo1CdUrJ6ljvRhahpB9mb6AkOwp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX6AZ6+cxk6Qzm
 lOEeFiXMD9OajWqPJLMmjyfLA/M9c/n4By3jme/5bE9n5DckUWVQIWotaNyPAgt9T9CG5PidvBf
 MUtJxbjR9TRUxgqIAGXrCNQupB1kr8Frsoj6rC9oRWyH4exaIqXKIeULpopBbplu7SgMlExngkU
 RlvaWXQNa/3tkybZyHi7K/pZeA4OzoU55hfQ5YL5uTsIUoF/T1mpTGQgVyq/4D1rzqFZO7QrCwo
 RiM1TEgJ9iNKVyi6f6G3hBXnZV8z5N5vzY5hvgjHiqdRRooojZaTfb8u+8GFCO+EVnwAd75uDdQ
 TQMbBB7B3HIrr3rTs5by6ryl8ePM98AfyJHWyLdxNLesfS8nghlX9BWakDSQnW/ZdKGPD3F4nIT
 mULyorlWf4RAdINodvzOCmHKvjdIv6UXaxrHQZjIM73bs/bdc7fZQ8l+zz4ISQUYyqE+nyJJ8zD
 67IJPHjxgdUOdMzloJQ==
X-Proofpoint-GUID: c8Mp5F3rSUdWPfWxTpJ4K3NHqnrew0IA
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e646ea cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: c8Mp5F3rSUdWPfWxTpJ4K3NHqnrew0IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103799-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5531642F7BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


