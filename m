Return-Path: <linux-arm-msm+bounces-112908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V47xE3zRK2qOFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:29:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F13678482
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:29:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YEkGD1fP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ImVs3Ksy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112908-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112908-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 906D0343EFD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D59F3769EE;
	Fri, 12 Jun 2026 09:25:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439D35AC2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256358; cv=none; b=Oi/Eg5I+n7d8IR8m1XCbTXEmqSNZkS2PsSB6Kbe+iQGuVN9/e3eXBNEwSA5C6KUqAr/YzUL5zykhkEe/L9mk27FILcgldd0iRlQVPb1S/eLQ/o2WmGdAn6NMSSEGE5lruDnrAfFbT5Yjylz7e3npxk8xh5+ytKMyfSTfog+OmYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256358; c=relaxed/simple;
	bh=yyIDQGnpqw47Z3k4tzIXofdpxVdasMXKqZZ+/KV+U0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1yfvWcn3jQITivlSEnTANr2YLA9xOirk+1cy4bswu8ut5PeBFgC36mLXvidL0k/spbHfHVuHvlTqlOyyefbvoT0+4alD8ugH/BZXMgrTa2diYiLFwLhnnu0uH1G9QgQCxMgqqfu9Vhm/UKyf6hMhhhsaJp+CL7DDpWtjXICIic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEkGD1fP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImVs3Ksy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39enH2516226
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvnF1OQ4GXe8rJfhWJK1UOc4dDsy8Bqru0sVMGkFW0c=; b=YEkGD1fPB/nIHnd/
	E4Xnb87WuOllAbN6rcVzeLUx1LfKtH1LQKjo4SxRK1VU8WSBmsPq8JG2Tr1+t/u4
	ozX6HcMiLxF7vMFFkbskLdSbyw24JKaF6SueeDu+x4xKVE/wyxJMCEAxZl4USwdR
	6iIbIehoj+8PUih7GeoMZTMoXvrC+hLN4ozxFT7cFltduMxUurGO3JUC3QE1wHja
	5r8V8oG1jeUACMSpP9WHKH32Fx0d8hZCvUwZJvl/GyMP6NqGi2ebp98rdbSy8xKE
	q9DNRnooDRGFm7nwig5FgTRhUoPxolG78CAJGJKkgSsbyd2wWSsMQuV2Q0Vy2zUM
	C1nxyQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72cfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 09:25:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so419470e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256351; x=1781861151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvnF1OQ4GXe8rJfhWJK1UOc4dDsy8Bqru0sVMGkFW0c=;
        b=ImVs3KsyCRCOe8iL4zauG0XYc83kLk/Z0t6yGeUXjaSbM0DfJSGnhzeNvUYNwwcQdr
         Q1ibNPJa2B6tbT5G9pwRlMhBLIEFp6CpFIyiEHUmD8930maUHBEqh6NduE0dNjTBvxEo
         w76JBWAQJ/iWLzYVeWnDAmrTTXkAdDZSFQF6YFItEIoMiaz0lXdscSKz6lUCssWGyxak
         36AzIeRBBHjFp32I4PvTulBrYuayzhexCOa/yuC3xta+npto0RnVjuukaMgk9POx6fH4
         6ym8GuTsGhRySAlmnneo7PTqle9egZO6vS3yVbODKn0i+2H+bkySL/GZkGg+fyahskiz
         g9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256351; x=1781861151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvnF1OQ4GXe8rJfhWJK1UOc4dDsy8Bqru0sVMGkFW0c=;
        b=RH4+HYesM5F9K+MJDLow7vrF17yfIgEUxLO83jry8Ae8VufLVzQfarZI3RA6TlFlzs
         BoGgvONqQwQFRxshf5AsCs9iPhgDDsnDkh5vqXoN6Pyng2cmTXx/PpK4ZPtHYN8P6+KZ
         YcqlxP66x2SgsZFFVVayaPIb3FDO1B45EnxtHb+VXYnVAAw4ZpZ0JjFA0eaDjZtLhCMQ
         gAD5W1S8AO/EH0zzuYxX7u51DyPaoKFRL5euyWAJz9AvNBBc75lhw0XQ52Tte8jdp01Z
         XJdLjx3cBsS8lg3MpjDdegLfXzWGyX8KuOFQsmchIHAtLM9n7kYzzeTh0KmCu1gBVft4
         9z6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/IH8vFPq1fJTjAMgpvo83hoSfRtpRGPJN0NMoKrrx9BzOAvR0pr/pbOEgEXDDVcg+pqFAhByVMWOdgiHJ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuy5FXIZKsJCT5iPoM7jkSd+bJmqlQmp2xXmcM/AmwM5hPDzqn
	w1bfkXT5aPBxAWEcspmg1FmYPTzroKyXwgX9XrbIg0GmHqetam33QMvzd1PtH1VsfVnMkJoryup
	EoZqUPsajT1fBKOor1s282P+o8Tl2FyxTD+n2ZHVTYe3IauhQlF9ab2ztRhW9HNYhbv/e
X-Gm-Gg: Acq92OEE+ucezTphvJos/oMdNcO+9h1MhcVHnPWuoQ6kGGCyy6lKziM5FOjNsDhJ5Mj
	hFJQpWy5GQB9OkKK3uk/VpGlUk5iVIYENlG4U+zLZIlWpxQwFBmuG8oDeOpHBlaLXGlv5OxxtMd
	Gn29Zqa0KyOQmXmJziOZwGhPpACAOAnpslY9uOII3clIC82+WBZhysTyLtuTl1/PL41xOnI9nLD
	PijumiRMnXQ2tiPLoKdOrUTkdSthPYeOYAPIxaMMfuwyrQRdohOjE3kbqBR272FFSmUAPJU53IY
	4zAT1GI0Xa96IsxHxwIiZuw189P6Q1SXBSPRE6p0IAiEi5DWF4OuwSTxLPpv1hbHR2pujJjlfrT
	gK/LLe/y+8uQUE6A3ahqvUlkAa4L8RBQBVydW5pIDEIfbGTcna3p9fRJBSFkvS44vL6kT5/UbpO
	DkjYhBeCX1fmWI3Fj8cU7O+gwGabde/pcEtJ8=
X-Received: by 2002:a05:6102:5e88:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-71e88ace141mr706709137.3.1781256351199;
        Fri, 12 Jun 2026 02:25:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5e88:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-71e88ace141mr706704137.3.1781256350719;
        Fri, 12 Jun 2026 02:25:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:36 +0300
Subject: [PATCH v4 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-4-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfYu0fyLLGbMbRpjIhlKmEvDl05nyaFsLxPi3elcBRk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPkGQ+TVPUvjX8IvaBOLqAzEX6uTsoYkcGn
 wtBW847r3uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1fN9B/sF5l9MAAlhCJv57XP+BprX7t5xFEDjNo2tM1mka2e2u1ObAp6w6ifEwCWxPTbcAhwecj+
 KBgMCxW5iKUqw2+6P0kBd9ZhHD7m9K42LMmFWKb+K/vtRUfeLQz0qShRT8FsgHbJwjDlMPFIulQ
 w/6GYsuZLo7Dgu9cWwm8VQ/ptnv/HpJb/yPcMyIjCm8pt80P6I9dz8ZXIjQqV+fmYzbB2qdMYiy
 dngrtExuw5AF5abtHduthzPy8mdaXbWMJmSDK+fbxxQ8/t8ob3la++os6x4OF3ZSjLoBxp6/v0G
 znjsEK3ejHrqwlTP7XKA1QWaOzIa+jnAOqEmrrDpqm5E08Ya
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 36FbVGg04TCpAcdCmBBaIozoCde9SPwF
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bd0a0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 36FbVGg04TCpAcdCmBBaIozoCde9SPwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX4K/JvUINoPrM
 ubbZZK9PPO2WPa6gFpVcgb2sYn8hcHtvyP/or8Nsrpb01F/r0dTXOYAErGZ1LsEk8ep8oms7srh
 919ydBGubmpVPRsDVIHrL2fiNixhRsIVWCMaaghPH8ffjy5o/9ZVBlNS4CfQGV8xuaqsSQ/EkbJ
 CujcYp0ajYtClpdivEf5dEpZIovZ43DE7KvL3vsMdmO1p+Mu3nuhBXZBRamskKXQurs6aw4TsAY
 ltJls0XKn8qm8NOltt/zyY+y009pjjjU6a2WFIsaKMZnhsVxKC8jo4QORyAFka+eVTnQvuUERUI
 FNu/pnVq2GuPi7hZxwBEP25NHzzoicWOTgAnVQ+KOFXlyY+MIrWd6N5yhyfq2Ar7S//IVAKciNn
 UWN3I+PReva8IW4oEGI7ArGBpuxFlQqo2AB6UrrnOvkKyDJVYqta84pcInZ+BEHJAQ3hkVI84pm
 FvACNL68FdgcxZ9+cIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX1wfVyJO4KtQD
 ptrRH8D4d1GhW8fB6hAZDum8aE0c0fNzK4lHwudWWPNbKs8PqloChtI7hVFxvPCqfQtcfvLv4Bn
 mwnhWxuvhjNUSmI+wfh1IIT7c25E+xI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112908-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8F13678482

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 2dc121a3f5e8..dd2eeae0d9eb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index a49113b0da23..375bcd923476 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


