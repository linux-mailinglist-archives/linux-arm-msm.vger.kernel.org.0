Return-Path: <linux-arm-msm+bounces-117035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 923iCHsaTGqfgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:13:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D8715A7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:13:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XemG46oy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LVO6WAn+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117035-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117035-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 537A2305B3F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29003AB28F;
	Mon,  6 Jul 2026 21:05:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A6394EBA
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371948; cv=none; b=c7I2jDp1z2V1JK6tziTAWtyWfukSEDiOOMcvoHe9I9M5WAWtwDrp5vAlF0gYjASY+xeRLUQaLTLNNHvzITyf0EFlW3gwdekAxSPRQeMU3e/Q5ZGIrqyT83oEFMmijl35dAGEaviX6mdEg4hyBCmOwu/xinvK2mTBbVNEO3Y8+Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371948; c=relaxed/simple;
	bh=BghuoPAEZNaeJMJPKdJFsDVu1LM7cTUOvUNAAtZ7DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDuGL+t8w1DmRpuKzFrmL9ImEkgaPpyAOzp9NtJaAavondSX3oxht1dto54Uun9K5b3R1VdjNs74cdSM7I2Frg6FQo1Af7HwIA+yAgx93k3G1fdcXVB0TBbXwhnex+ytfyHTrPx0IzG2ftlHQGKX0Zs1mml+Ya6OR50JsNZNgbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XemG46oy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVO6WAn+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE8ed1654904
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=XemG46oyty96A3vH
	JA1v1oCMxOQ3cCOvgMFdMKkWjuBqWU2a9oT2A2EVwVQZ9wJxfXR0K2XjmIpasOip
	aRUY8tMCzmEKH4WtgI2CK9hM3JGSrbiQg4TtbA49/fjZ41NLRUtyF+BMdjxIQm0p
	eI8xYNc+LjBep57d3DBufKXmyiOSn4qRGP45N28rk8jRoF49vFkIk//tW5092ztm
	z2mJ2xXjBfNpQoHICIKkPg7VVw0azqteM17fEKQNRHtICQgMzp1cBRg6vNanNgE6
	O7NE2cxwuZEXBYycSnnQ5zw7E2nWFojH79aF2Xybym/1W8NMsBxOe0/2xDkTW+M1
	1sYbzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjy24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so32486895ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371945; x=1783976745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=LVO6WAn+pDEI8EyjBwMZw93MUy6KkhYghenLs3RKBYh7h6Mm664UMLH1/q4CB5mgGm
         5Ju8A3SKYO7shIPxiPiV6nqebIdf8bK80/W/iRBNiHHKRyzhx/caSYEER7ZwByvX+pLU
         YWSofGs1dIYYlBF3pQau2noh5BT6RnNSG3q4K3O8NSEmSNOxSZk6YzKEhWmEQcQjYwDr
         +JIe5OAansdUtum1No6PvUB6iGnMw5EBqo25V2RE6n1Dw4dfYL4qNJpzQGzatMZjlFWc
         hNVqWXUGCtZpWuWM8LeTVgtn76U6XRrY4RZZ6D2fJgGAaQg4dk+pbeFgiCe4fZcDl2iY
         fOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371945; x=1783976745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=jyazGBzWoS1KpJFIyomT7b7qg3AYS1q1XFkhA9JwlOw4NqrywE33Nbp6iAYAIGHD8M
         bi9bz3Rlvrnz0nE5iEMjPpioUMcRMu0lJ3fn78QQLzHwFuJ1sa326x7BbgkC69GYayVb
         HlQFo4qj8QngroLslukzwOEd0xwv0D8+73+IxtgAGEXP3shYMTC+FXFjcCYYnKrssreF
         i7HzfVzAldkwrclWF9O6+6SBDV6U1c8ZZyYOo8nCrQn02QVT+vUIkuf9B8djLbfBST1L
         VIgClM+fnpaWqQgILwsXOrmFfDoUBUlh5cnwA0O88eAOVPpGMlTD0KlcfDuIljgjYz3f
         5OrA==
X-Forwarded-Encrypted: i=1; AHgh+Rql1/419T92/JLAWGcYDPUmKoihlEwDoG91T12u7MM+QHBGLG8dhzLHznCZcUMkfyIMHird0COvlrXjzpke@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0xE9ZEmDbF5RvHWzlEw0Gjm93azndl3k+oxWqET+4YTh/7O0
	4EfyUVMq3qCRmpsTuAqrY60paOZ6/7RMLRxUeuGCtGe1wRmNHPiamtK9bQLsNrXGqVoep4PDyLU
	I/Fdg+AVq+30sBK4UOh3nYc2JHI+Ff6Vr05nk8RwfydB0ZMSmtnQaOnv7cnOcRjUw07p+
X-Gm-Gg: AfdE7clVWbCzEFZJ16z4CQ4Y1UDVmhM6iGEQPuUACXT72rORsvPpsSsMkF1nSytIDGC
	4aaUUIHiqSKUGLg/q1AiGiXnkSLjOBMKMBi5B+KfeJVCxW5wXrXDK76MD44RzzXta84q0ltlTEL
	PEJkFLY+wHG55ELTOuIuKNqq49uYOJVM1zVKxZ5jmCLP09esGSaXMc8LajErfRRkl03I99AJ73Y
	Flm9LqcIMUXBByLShFpJqZuOMdVLy7lh9217RgeGIGifFgUoxt6wBaSCm06ewSopX/ED6/MCBvI
	E7JVEcxMoutFn2Y84VSESFTtqFhHo6bQ5Ryn9+fDJobzKrIaBwvRQuyakJ9UvbceTqTNioMrC9N
	E3zs61WN6j3TaLjhihfiqE+9LH8Ibo63XQyc=
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr26646025ad.29.1783371945160;
        Mon, 06 Jul 2026 14:05:45 -0700 (PDT)
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr26645595ad.29.1783371944672;
        Mon, 06 Jul 2026 14:05:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:37 +0530
Subject: [PATCH v5 5/7] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-5-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=Hg2Kf+dWXJ+whlWJjf8ja7E8O66IAXgviTZ41pNM+vxeAaoMmTklSyb87ZwbbzCvOrJtjZe4o
 VVlCMvVeNWWAZQO4FGDVlUVdpIrYZG85JDUmqOliICPcLii0AxUVNsV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c18aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JKCCm9YjFPa5YPi-r7UjzYj-j0fblkL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXzwmBirbUylJg
 IjCibVJfdyOseh6PokVZmxHr3OO4HO8Fx89UJ/++qKhiSNDWXxuk3xuKvvk5KK8y2dMckM8C7+n
 B++ysEtThkGP7ThF6H2Ctj61QSRmu2APGJZLtSXOjSqNEQ/t21yBG3XUgA0pw6rWgNnIyF46BuH
 /EmcLjgoNbG6gEs8+ET0qhFePWFKfXmWpOCwcbCblRxtLln6a++ivaaEmS8qajnO4KON1Dl06GE
 coEb+07kiHWysFDcwxc1a1n37UVjgy3XpXufS3QPdZAqizxie9zttqZfAotrELs0ai7k+oE40ft
 5m/LKVLKR1n/PFe/8hBoRqfdA0xeoBavOWRJlUld5nu/XlvGKd/WeHr7f5mQi+t6mr6y0oCToI9
 R1dPS6M4AsIRRStTjMaQwxaqNjaPRy/RGLr/6nXnkGEl8w3oKHEvs5nv/RYVWKKqTgFIUo8EP8I
 8fKlEEXQv7poAxKxsRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXxjitZN8ACjcA
 8finw7AYQmawjDGkR+D33b8hEc8FK4paoCEXpzDhDL8AC0mkgR0Zpj8NeeCM3yC16CkSMzPuRXr
 d81Sfxu01r+UlPUgBJM/jg7Zs/Xl51k=
X-Proofpoint-GUID: JKCCm9YjFPa5YPi-r7UjzYj-j0fblkL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117035-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC5D8715A7C

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bb11e832d9a6..34261221664b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1992,6 +1992,104 @@ glink-edge {
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000400", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1142400000 {
+					opp-hz = /bits/ 64 <1142400000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <7046875>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6074218>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <3972656>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <2136718>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
 		gpucc: clock-controller@5990000 {
 			compatible = "qcom,shikra-gpucc";
 			reg = <0x0 0x05990000 0x0 0x9000>;

-- 
2.54.0


