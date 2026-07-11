Return-Path: <linux-arm-msm+bounces-118451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3WdNHdEUmpwNwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:26:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE11741A98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:26:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h77dVIVY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pm6rRv8k;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D0A3035809
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AC53BF667;
	Sat, 11 Jul 2026 13:25:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFCD38D6A2
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776334; cv=none; b=dXqF8Tunt1n6tyq6/rAh4MWGd1fQg7tnPvn22MjT7/vr7Mu+fXx7+Ia/H+rx1hoj+pFqVWdSx+ed/x7QBnk4OrSIRA38oIKIASw9OKfZLDC3+S2CuCtM1amuRA74ZbEfeDQvUeiBuWYDKwf9RWkdlpPpdpfNMV2KBTTShwOt50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776334; c=relaxed/simple;
	bh=EkLipRueXJUHKJXq0g3EN4lVQPNdcpx4M11gIrvYJDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTootU2TiMtUBTViaIFIvZ89/ef+owLDMLc2RSqrWK7ALUdWorAXutEmJFLUJ+6j2kEog13RGdBWjgXQ2+pVpyv9/SjsAtL9+dG89VcsL8PvSKCLkeIFiJWeGrJPzjxhFlgTZmb2GumG7twjebQ2mSc4Hl9mE3hGEu1PNoLvyDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h77dVIVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pm6rRv8k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnplF3668657
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=; b=h77dVIVYK5i8kVCu
	NFPnEnY1lStwk9iKe69ow/P74DeK+fUnoAc59Moqcg7vrSzTmcs62ZB1Wu4VnbTu
	JIAlQwjjpRw8+AdRaRwv+7y+cgyGlC16UFaQ+1C/wEcCw3F7MPxKgXx601+gCLmE
	pUo9vBhviFPnoAOCsQSur0wZPkqXjHOfmLnfLRhkj7T6khINuvYhd6JTZifzwoJ/
	42ta/XR1Mh1zJIYXK3OTfwr5mtgEqx13m95XDv/ESj3tRzL+mp30q8+aVIp2ltM9
	04D/VdcLXuRzVzKgKq2xSGq4GNSsQ6AEefzFQHENBJ6cGRvuTxgkFx2GGcZXuOF9
	A+zT8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v8u8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so19901321cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776331; x=1784381131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=;
        b=Pm6rRv8kXmwyF9UM0djzOPmS57tb84HYID8d5euVr3hip/HhiX0R6Qxf0sPdAre0Pa
         HfO28/5GXF53AF7zmUNjDTEkoYoBPWy0E+ju4C+9GBHVU7jz74MVHfQz+M68pstK5bkv
         f6ssiTz9lRixJJqbimQSzovQ8rDCJElj519AoSSCPSwPQUxWzBOg05HVqSWvsiY5+U5Y
         nOdVPexisDr3SBCyjcshzjXUR9P0N0F3qQzF/DOyCjef+6IepzgLR4Erc+EYUlNcNLY1
         MeVdCYufNcrJ7KHS9M7R1DC+UM1+dRnsCxuxS6DeHfgQ744gD/IKzBgw6c02VB4VE/U3
         73oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776331; x=1784381131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=;
        b=d0STioC1++j+uq07/kKcZpxCIK0UUUttM+79fN1QQFw0MGu+hSk3Q8k07W0+Pa1j6p
         WebYtqepmaV5kNgg0ntRGapTvmCZJCKeI4jG/H3T7fdexVn+xS/7im9BErHWnM3ddrtf
         afUmvFt86+eWHlUkIjU4A2h2mg35QN5i62ORUXPWXt9ZiVBzCblw6dXFcEBR9ouAMzq2
         vk2LAuF3eD9PMIFlsrG+Gl/lta2qb0853OmHODrnyBWrbCg0oOjom40rHB61p1W2bi3d
         WIdkEEnuoFLEt3GVmX2XxWF+Lg29IYIoibBQpXzxJkYyWB+n+IMiLqvOh2PbCaXyn/Vl
         18hw==
X-Gm-Message-State: AOJu0YyXQA595EMlv2VGAhwybHWQqOU0YFYPCOpXmL3hid8Szptl0+yJ
	QpPGhgm/egYNNbTqX+WU9tDxWKf1m2msRn0zBJuFaDFU28zTaZSVY5Fmt8UJZzYM/broPGeZb1s
	Cz+6ibZyMAnZyO/Ilu7wK5hUjIrLkOwq0HxiMBM9KYhYNHvJMuuDM/OmjaFP0nuMlJJF0
X-Gm-Gg: AfdE7cnU8+sxsQWcrPlR2V4RCqxqXz/qINwvE65UO+cySunwAkds1+jmT2R2AFrdn2p
	LFY4CqL3OieKsEGn4I080FX4WuViUXC3p3YPimoqcwBJG87tI59QBSk8F6vZ9kTkADSaV51kroJ
	0AQyoAgNayghEsYrS6DC8hP2CB7u9yCuxuLqEd2kXcXjpvTMRy1IdrI2FUGGguYeLo033IVuaRL
	vqJv+i5Q06DztCbg41g8Kb43+WQapAJSg1d+ekSRuyUJ/rTjnXgOxayjR9Xw8fJ8gC7HhNk+lmr
	B5ZJid7UYt1jP/Jsd2+UNFoVjlRzUTIOf+wK6DeJTBg3KXQKsEkhjVGMDAcdmwlQt3SvaOfNPac
	v7zcPm+j3UCwjco4F7Bfp5VROIfT0riY7lDU=
X-Received: by 2002:a05:622a:994:b0:51c:7b13:6300 with SMTP id d75a77b69052e-51cbf3800aemr27714071cf.86.1783776330818;
        Sat, 11 Jul 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a05:622a:994:b0:51c:7b13:6300 with SMTP id d75a77b69052e-51cbf3800aemr27713861cf.86.1783776330396;
        Sat, 11 Jul 2026 06:25:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:02 +0200
Subject: [PATCH v2 2/5] soc: qcom: Restrict drivers per ARM/ARM64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-2-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EkLipRueXJUHKJXq0g3EN4lVQPNdcpx4M11gIrvYJDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQzPZzW2S9+7bCciPPKrpO20kz0faDdIIWbX
 nGnmpQA21mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJEMwAKCRDBN2bmhouD
 13WXEACOQxO5M5Jg10KOjiNPgbJKw9bq31KJNzteK53hRWH7+ZWXSthj/cIjGtJ4XLnGPPLga12
 QSMju5Zi3sraB1cbzNHmaWtEpi438DPG9aqRgxYi0RvHDu5rn11R621ijeO7XNf3YCvF8BttCda
 K30I7C2JSOWM+i4azyz7BwLa2BmebwLIpNHE6T492z6soaUheNbJ6XY8bYmikXtq+KBkAyWKyww
 d+WPk9nmu6Efr3Lmnjnoaajp97zZH+Wm/qNS5ZseH4bv3BVHeYgvcUrNOfiR7Zirnvh1StEz6Zb
 N/8z7iX1NqtsOizBrlbJ5QCCX6yLN4OZ7ly8FMKEXvshtMJijaFkRY/ZdxNlLFS2au0yw55giCl
 s+eOxdgdRVRTpYw49IkiNOn8S1An9wDP0t3542peahmUDeGQHMrOWFjueMw0jMV5pYlWCTTClxk
 pU/4yOu1OeqTTdrXTrA6CBR4bbTAyBGL6beT4BYBeemF3aeJOUxhs8qxScaKMT+XDzv4NEf8cXW
 inyrFEw1ES3r3zil0O3PHlGFQ6xUh/Axuwli1vAOEMenQwvYg/o0RjeJgFEKvUthCEexDylC8rc
 T6dozFFN7d3vWiDHg7L9/P6e6dzMHqIObNhO5w6VPNkfFMPa3Muh3xIMh3jjNYKShFk92Gc9ku6
 gcM9mA+NuIiZAxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: bSsvqx8BMJi9PySwY7kOk5XurWrckMY5
X-Proofpoint-GUID: bSsvqx8BMJi9PySwY7kOk5XurWrckMY5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX/VIsT0pvTYnl
 PnnkNarmLayfvfMDycx1xdrAJyT/qZ/4z9rDDMbncRV2h9/grINgE4v9JuWZJoBphh+MFvcN/gU
 g/RChgiNWWdSr25V2D546uowD2ju3Xw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX9XGPLe0RzxWu
 4/i6uEWp9Qr40c8OeI5xIQWPbO/oPCyZW/iyPovxlHILdlfCMVm92reaPJNch6LTQjZB3BhQ+2d
 3IF0uTcRTBJd6mPj+1Wq9YWlKxi309mTNUqoQWpbrTcaMKdR7TvGDCbM2JDNwXj42tDsT+auSlf
 sXXe5AohrBBOWuNnSmAd4fv0NnOArc8x3lL3DbhrO69qi5vUkWSpepR1x8NIlX309P2PJJkiIS9
 M25rzntFhOF21PbCJeoywLEIDfGk9G4uAAkhxmP20Nrs0EoOGha3YOHLm8xTMs4y07Oa9ue+Bf1
 XNv37IPJfgKBMALATm8iKN7VXt6AKH12ywjs1S5h2h1ToTzLkOAWdQ8tu4ocMTY0ymkU2uICnIz
 xX3IgYNyR70TT+8hPWWqK9y7KRQjFJKTcXKY+u3lByLRAj1C2RwmU8gZ+0dhi/88gFgaU9GgSiI
 d35O7yJy22bzjs62d2g==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a52444b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_aRwxzdhAbM48nF2t_MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118451-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FE11741A98

There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Do not restrict per arm64: QCOM_PBS, QCOM_APR, QCOM_LLCC and QCOM_AOSS_QMP
---
 drivers/soc/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index f3d9c9d776e5..7207814cac85 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -37,6 +37,7 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -45,6 +46,7 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "Qualcomm General Serial Bus Interface"
+	depends on ARM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -104,6 +106,7 @@ config QCOM_PMIC_GLINK
 	depends on DRM
 	depends on NET
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
@@ -247,6 +250,7 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "Qualcomm Interconnect Bandwidth Monitor driver"
+	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help

-- 
2.53.0


