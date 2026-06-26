Return-Path: <linux-arm-msm+bounces-114611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g4dALk5IPmpZCgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:37:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E06CBBE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NyyzrSOt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GleCb3UX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F263C3028663
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85DB3EA94C;
	Fri, 26 Jun 2026 09:37:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D53EA947
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:37:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466631; cv=none; b=QhjRulDBun/E4wZJ8rnh63UOFs6e3fBm38oijvgtwZmnNjkXPWxDo1dUnBW6XbfQ9vJByj76rJbpNzTpnm7QtS1DJQM9V0npKxMfaYcy1sVQpR4SplrH2HpUmJjAKNMlLkbmKZVWrSiNvBnTrf3JpjsiojY4Xt3i0ws/fhl4k8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466631; c=relaxed/simple;
	bh=3+ZXiJt5ajdmE0Y3MAakY9tFlGNMaGGxC9FsvSeEz60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r55eVQvxKuePAHd8bg2qqruhqcE5DvTb9CzY9LwJIN2dcPikV3RybF7rA/Pp7oW73wUg9/eje1EhttEP2mR9BTkHF6e+NJ2KaGQP1JkDS4CVE4HRYC8NBdzlviuCl5ypJ620CLFBswUjW75oFVi/rYWwN4pibRmDAlLL+MsJuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyyzrSOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GleCb3UX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VT8p045371
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HS3lnS4us89tUlYdSsPb/5aTrbLRnBMu++e5q/BvKI=; b=NyyzrSOtrGFA31Dr
	tYERWkvayJiyRYyXt8mg3vyELI23EfRSli2TonXF86HYP1T5D4xWPO74/03Z628U
	1Lh7drXZfPvbt3lknhJ8/ub5FjXlRSrFnI1SeJQA9g3R+SfQtM170/+nATJ4+IWN
	K47b7MHiPhhB1Nakh8AENGBQhO4JDFxyZyrAxRVB95zMD8gSLxlDLjnyUGkshG36
	qcMxZXHvXpjacbBlfHcexhwHxPXk/MVIgGuQqPRPPGwFjmeFoOTX940hOpwgqSxq
	JNEpsG+kPLdvsLoB80NyYh4D6wqJwHai3O0aY0gm9X5jHBA/HXmjLFl+H4FQyXfB
	aCbtjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asjautv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:37:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so50700485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466626; x=1783071426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HS3lnS4us89tUlYdSsPb/5aTrbLRnBMu++e5q/BvKI=;
        b=GleCb3UXhd45s99f7yVLQmUEu1xBx6TtNspUnTKTbuwZzhJy5x22CpUeOALhfB+Iz0
         uGEbwfsS04khZXHe5B4DKrUtnzP0d9ssgusU9Ee4SIUIc7cnAiuIOiERYwJ2e3OMUP2E
         YSOGyzTWzDyfj4pucNlWr83XOyiilyR5Q9SKmqiVpSRU3GvqghcKRZLC3ULjoe0jpJkU
         HLYAwh8/TiwfHaotRtJqZYF/f+OF4FlHb9kqHFr8WCpjWHor0augvOj8QcJfTAPaNlnc
         Tr3ysAGOGCIXaCqyHqm6JP5GPBbexgJQIsecE7n2iWT8HY+Qw17FxFj+iCtNQPXCuNCY
         dFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466626; x=1783071426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HS3lnS4us89tUlYdSsPb/5aTrbLRnBMu++e5q/BvKI=;
        b=Rfqy+ATmr1cP/n9DhHy9uH9yNdA2iRKlOzfiMHAKonZF1xSDWbXWmS0tCgUWPn/X2x
         ZsCdkHVwJAdkC3oYojtgw+5A6Om3WTM0bllhWQfUllz1UuIlmUCOPwvUi6RKSnIRZDFv
         fUf8o9MK7GRKoX5Oe9HCYLk0TqaV2dxDW9HzvkxKXENGmAp9fEAJT5kSXRnMemgAn5tt
         VP0mZrOdQ8xYEKkrurE6F5TyF2KRr6W1fs40m/FMaJkVAxetgmCSfexHAMZPGtPWhhP5
         FrS3pvUT3yeurAwDyLuLRnhnZx66X9WybsYDbvg0wVyLb17sLyI5lYra0jyhYMrSf3Yo
         U4kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S2gYfu7+S73vKWrW353eGDrsOhvzCs+uxvOQl2UT8YrBPXrh1WKzHmogqGDZNBtC8V+vVMOSf1OLexVu/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QuLLXdBfhRBoi9lxgrQBkXC13k+oyiW4BN732G1ovGer+/sJ
	ko88MfKiMm7zz7E8E9qzCH6za51b4brltoGkSEhVIuwYAsWpZS3has8Nggxm+/tw5a9b5NIAz0i
	v09ALeN6qARFV9/eD5T6qyfO3R1xqeMogx4Y5l3bcHL2zImki5RWCxyMQM0enDzxJEKvy
X-Gm-Gg: AfdE7ckGVttoWi6amEeiZCdNcpboDyaUHn/e8rgh1I7fnEXahml7+YvTObUtUi3h/l7
	VpabzoBkTLZoDKnJeO5ItAMK0e50tfePFhyvUR31GScJ0yMBiSZv8875pHLcngcZpvbUNkABD5l
	xSek+/E/boRooCvYGa9wD039Tyc9Mo60TY61MZIX2840WSUcv7wflTtU6UNYYaFCYtbB0x8524w
	qG42fbiJhiwMomP+UiMuDwysHbnHZwC7svOXNMKZrAGptxJAAYFhzcHYoCQrjKTtDJE3jxBg+o6
	l8zQqly6+Nu5Zf+POB8OnHZQCEJT0vHE/WMUiJ2Ewq4N8pq5BFeuXwMFHhgOOu2fs9TqNJ7kw6D
	ye/t4OpnLPLZVogtLI2Gx3kQyk8OhcCFwYnE1+dg=
X-Received: by 2002:a05:620a:4487:b0:925:c160:f3a with SMTP id af79cd13be357-9293c121085mr922515585a.36.1782466626425;
        Fri, 26 Jun 2026 02:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:925:c160:f3a with SMTP id af79cd13be357-9293c121085mr922511685a.36.1782466625922;
        Fri, 26 Jun 2026 02:37:05 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c291489sm33184815e9.2.2026.06.26.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:37:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: Avoid assigning unused private context in test cases
Date: Fri, 26 Jun 2026 11:37:01 +0200
Message-ID: <178246661653.12158.12258173453647424909.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
References: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3e4843 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BzM4oFbjeYHbzq8qZPgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9VuZeH_Y9MDDDRLZgNA1WFDqunz5Vrvq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NiBTYWx0ZWRfX2egRBQ/VdFKo
 qTq8E+zGxu/sIVWftUGOLyXJZBxjrrZA9TDJ0pXjz3Y8KpNMSGqP8QbvpF0tfb7MPmWg+UEDJNU
 tN7FdcySIa0vpIBGh4Wea6M0lJp4R/Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NiBTYWx0ZWRfX9a3OyuwS52H9
 y4b0akH7Bemh7wGkdwwaEszR7Yud81ft/lLEnEyY2zBoe4s2vB/hcppC1IiyrQTL8pL+0/DqnKD
 L82ZBNAkAkWEhADPGKQZK+2xnsFLZao1WXIyCqwGVEykvnaDTHW0CFQiNuqslk1B2quPIrWkuhJ
 5g3C45RCg/1lajl7x/Vt0b76hCYJv074N6S+d7FOiNZwNpmKi02UplZM6Fl74iYsgWVGTNoObqz
 NFlWEooFXUtxasoJJapZUsgoj/Zs+qAtgCfoLU35CWlR9qybNOwc9lhz+vmSkxhqHEsQNOvuiOE
 ZGAQcKin0C1Og3fFtHdFDy4eWWZouBVbbQLfZbYeNvcwTB7ziOgeKYonuo0oMAJVtUCWvh1Ccd/
 Cx+a0b1kf1z0crQEYvU3vEhAk2Yli2fTpI1YRivIpUz/N40JkxECGtPido9Vg1JnZEgYew5K/Fw
 SRQq/0QFg8CDIYwoFQQ==
X-Proofpoint-GUID: 9VuZeH_Y9MDDDRLZgNA1WFDqunz5Vrvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:sneh.mankad@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 046E06CBBE2


On Wed, 10 Jun 2026 11:46:58 +0530, Sneh Mankad wrote:
> tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
> variable is only used by the threaded IRQ handler to control the number
> of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
> register a threaded IRQ handler, the assignment is never used.
> 
> Similarly, tlmm_test_high() and tlmm_test_low() set intr_op_remain to 9,
> but the variable is used to denote the IRQ handler the number of times
> GPIO signal has to be toggled from the hard IRQ handler.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Avoid assigning unused private context in test cases
      https://git.kernel.org/brgl/c/62a3aa000055efcc86483e8953775943513fe44d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

