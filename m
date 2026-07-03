Return-Path: <linux-arm-msm+bounces-116418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id usMnKrMdSGr9mQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5370589D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:38:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SZxb6vtT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iBV8DqrZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116418-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116418-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 246D2302D500
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7440D3546E9;
	Fri,  3 Jul 2026 20:36:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1881D30C16D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:36:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110974; cv=none; b=sWGS9LYp748V8o1JThoyU3OwCSTf6jQcw1GT23ju2sPVzD6swLJOo7h8y+VcGQBkHcFJPGMtk3Po/8S3vGUSq/xfxa9F+8qQ9zUPqrS4GXY1M7F89YyH+OQ9c2ZJFX1MNUKnnUmdKEi1tOVjeOKTdCgvyDChvfI1W1i5GoTvLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110974; c=relaxed/simple;
	bh=uAhue2+JbkAQvny1V8pzrzyN0/Ln5iCfI5DeJLdWexM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZM0eZT1m9B08DoHnFC2AvsMNO1eUjPVcOjJ+fm8zNtlc7oY1Upd9cphaB/77aWOuMKGA/3UyK1BYZZJdwz9ys15KkXvt9zHynsjH7rO7uEUp8DAO06NLMveiavOw+HG7vRA17WQQnP6+kc5D6eX9gHRjq13zxi8CB2c2ASt6T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZxb6vtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBV8DqrZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPWkg871831
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=; b=SZxb6vtTWsuUX97G
	SzcIb6CGjrgSesGPlc/VNJiwcsqrxlLNsVGeFauhYH4fgRIVWmV25pfpcYn284Tv
	L+NcnawufYpSOTZOWtrx2/CfO1xWv9FPBNaN2FHzkDg7NZoqqzikRV261dd8c4Kb
	IG5lJokMeN8qBCKeXLXTEO8PnABy7osOcXKlQoKbyhwHU80MqpcpbjYogTf8lAM+
	XAerE8rByHdKnfMafJ0YvK/gwSzl98V1D0fvYZFpGL4OqGlh9nTIXstlBMJNqZOe
	IsyZMKeq3MLfXDSwwU4zKpAdMXLFqThg/rnCkZd+nnUpROlaDI2SOygyVXKoQo9I
	l/CR+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3wcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:36:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478ff5d801so1607548b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110971; x=1783715771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=;
        b=iBV8DqrZ54mbNmAtsTcDm+Up1pUW3WBNKssybEN+sbVFXrK194uTgMIEHA4MPrvmN7
         D4AkCNxYZSMv3CVhEzWrT2KlFt57HlhbK2+ltBy6an9zKQ2bZsOBVkeDF5oGkyMY7bng
         3xZf9LsV8/NM6U6Yc+bv5npWBVV05kYng/28htqZIAMkomxPH1EFMqPog3eUYgkFyMsd
         YA1FmOtsaQTLkcgmXzuW+IDsJH1FlWBGQ+m8OVDSaW7/ULbBRY+Yw8liJ7aU72slIJni
         Vn1axE2MG+RJ2HllPJzkESYl8tla/RjDliZJcaFV/jWdCbIOd0upayeAAUTxexjIB8Jo
         iuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110971; x=1783715771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=;
        b=T9Oq4uod2cF9l/rJHwLSB1VYa+W9EY+4X45/a05n83sjbAu3M/bRWz8SjYR1z7z5an
         rBemnp3vmfv3FNg6s0ZNZxZXFnh5hkqVdOl1W8OAybgfNunT0wAWY+MlAiR1mH9KSm3g
         0u0xdTzw5PJfC1jqSfV/pKXH/Nbx3YzNb1IXOQwxcqDi84/kyutq2/OEx+qbEXV43qY1
         QIJv2okodCppgBbpaYIKSYLao7zi9knSYZf9wXVWHQ9IZ9J6oSkFOw6UY7OrfO+tYxZ7
         1p24lRJ2cUHu+m/vVwE6rMzhhOI4K3PbczKJfRJxuCUaCBKR+/T93zGlYaueo3TrjaoY
         LvOw==
X-Forwarded-Encrypted: i=1; AFNElJ+VGX/JjE8JIvgcE5nb/Pcziu5ZhPMDoqhejNxMPTGxTtENGBDnAKKa8eosSH4I67FYVLZmvEsynHfCXa5e@vger.kernel.org
X-Gm-Message-State: AOJu0YxbBkRpV2/IeM5JN2obvV60uj+Na3Z0M93KhaSIbg8r12on1xeD
	TFMzzvwGB6j2NKMZsw4YciJpDRa6B76R72bucTXxG98jEJVWxS4au+aYPWYoF1MowSmUQMjntx3
	4jj1j0bpzLBWEPuG2fxdIkQl6QQosU7tXcXJsb9k/6rdXLYAH14mJGI7UCwnPpfKn8Hqr
X-Gm-Gg: AfdE7ckBNvJkKTen7ytg16ItAlYzl1vtZVy+WH7puRFKWHMsgoWOotJ9p0wMnbjx2Dc
	vA2k4JINdPB1I9OROqykJxjKJLWl7zsdcexyIsFr/KVYfb2EdZGazz/cWrC9zvR67cQweXc8jfu
	1NABGfjP3A0r1rxBI73+AtSxmfYEwn7U3U7F1hPoe2Ifabbwh9dL5WnlZoBVpGieCRtDKdOJ0wb
	9dpuoqjxdOBQl82YlCE5UZpidyKkRkWnmv70w+hKR5LKm2miR9irzVrHXPb4vzi39sgbAElT/HY
	eH38PK3eMts5H3vg7SKhW/adtXaShumeRP2JuPc6xXDZpm1FM87IToyRqRa/MWlp3l8ou8zbPnK
	CgZ+84MJf0CQvyNOJJ0VeI9tNG9t3MtjlBFA=
X-Received: by 2002:a05:6a20:2447:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c03e4a33e7mr806117637.32.1783110970891;
        Fri, 03 Jul 2026 13:36:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:2447:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c03e4a33e7mr806080637.32.1783110970442;
        Fri, 03 Jul 2026 13:36:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:32 +0530
Subject: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1335;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=74nTS/9j7but5S78vS03fz5EaK8dfgZpR5pvQr3ISuw=;
 b=fhhF8bApESeoCdnsnhF6TzHQXTVfkzqJcFK9FQLBZgaMco8/KlnHfQggBrdsaT5VC2tQRhWNy
 UjnSFkiDIsEAWy1Jg6evvcA5ibpUHPzGK0ZoBVjfcDENiYdb8fIeL9R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXwMa4GGoz2xDX
 4T4fzo+El1QqUiI2WOub9/guhCZHpLifmbdnwryxhUiLwVB9dRdDfP/fzPKMjH8teUrVIhCJhaP
 OWX4WA79tQpYc0aRwyH82WOb1CID7LM=
X-Proofpoint-ORIG-GUID: 2iA-lduMNyAmUATmfhGsJZm5_9Ysco7_
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a481d3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 2iA-lduMNyAmUATmfhGsJZm5_9Ysco7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX3wzRXifysN4g
 uAXixdRWECv7yt9jO+bYGzvbp5XvCktb7+mphIdTP749GTedh2kRkFy0O5Qx2i0szdomvnQYaG3
 mkQdrX93Nfwi4dj+2egQcKc3IxXxD4/AqqEuuONAT9q+ejcEoaKvMEXZWNhMh4mBSVt3WZfLvqW
 WuMFddVNA2V7X2LQi72kR1Be/JkOkQEnWqKWtWeL08nP8dGlT4fPlANoDrcamQKtv/MB07I4SmM
 iZkpdmPSsVKPHUx/26FaePXlxZZ+mU83OzwvpTHyNlx2z2Bd+weAJZEK9iChBO130fYOPbhkSw9
 K7wCE59eKw2Bs6BWT2O4QdHo3sAAf31M5egjqFO8sTWDWVTVBIZ/qwaLsZRZJmUb8IjvK7HWVjx
 FVvy/XZ40u7otSHNHMHA8xqKDApJ+NiM1kVaSsDcqsKiWgjkHIoiwfBNEjDFpMn8yTKsyamAxX4
 wrojpB/yZ5gbRrYsw8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
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
	TAGGED_FROM(0.00)[bounces-116418-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:aastha.pandey@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 0DC5370589D

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0


