Return-Path: <linux-arm-msm+bounces-117050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BYqkD04hTGrGggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF92B715CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:42:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="o/HVbnMK";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="i/edT7yB";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117050-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117050-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F23523037D52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBC71C5D72;
	Mon,  6 Jul 2026 21:41:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E742F712
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:41:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374104; cv=none; b=YBsLfBf9YDor1IIBBR2F3DKzDqtNZowpa2uz4HmIS4c/xWd53LVMa/0PVlby+2vfGfEHgQLxh5Yusq4Q2UPg5NtD2Ojb4ot3yIRZFnamQr9tcxu8y9USfW/QCN81STrypJ5wbsff6rZqcq3C3KNoZyfhe2vgephxB/ndRNlw1Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374104; c=relaxed/simple;
	bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiYwaC9dLYpEQPepvX8yiCnAWejEIV+O6YiLDOTY+dNM2cvlE2+tZ2vdgL5JeJWxF/T1Y/zltCKSZytcGEraVTfko7joS7ATuDnlFOuVwa/7CzlhN2PPZf6ya/QhRi1dpqYCO2sU44JT7wTyvbh9sANoRnm16zc+PjYpZBn/Olc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/HVbnMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/edT7yB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KECXH1504991
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=o/HVbnMKBfWdPeGE
	YfYaoyoYMuON7hNNIrCJ4qeYkqm+0GAX0x95cvU6wFADsAFvB14Fg7zY9I+x8Kr8
	joP6cPJGyqRiA2M8kFUUJFkdngGFLDD/FbnO5iF12K0FrpsN328ZKuLdRNaAmppE
	Lk5BNaJEPm9ZNgfYqd28qCKnJ0VssVdquZ3ULhDf2f7u2NutjYXufb0qeY0r7OfO
	2SUgzOKo2bCWgmJUOh94Qae41HHid8+OyPNjuFM39zDUfO6vkNyzabNEfS1CXJ3A
	wnVtwXbhmXRg9vnusIQ0vIjuEzzoi3Vv/2JBOXKeQS9Scbm+TNTayATWFB55E2Ua
	VJnhZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jwtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:41:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86cab84bso25664335ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374102; x=1783978902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=i/edT7yBRHYN/tlgqO/gg6NW72vy4dKATPNG6lFHOIiTLHg4nBX0iIzsRfjKeA7VUG
         fe1wP39G3sPdOsiwvxf69rzAQXVDehjVEI392iCklBluPezt/7s13Ob3f5NZVuIypz16
         egOoVQkRQMaCTeR23tY7TSWWun12V4VaLajOQRKkiYq8BGBA1Ccc5HGuHNVdZ4FT1ma4
         6cj9mIwcCzrj+LMsyopOhjathHUATsQd1xDkgh/ORqaTkNfTB0bvebb0s1UhAXcZ40Gb
         xHAvO/wT35b8H/LCEyDr0DfdC5xXO3EZ5YxU2joIoqlZpc+zkVITVv1mNNUWUe3QkAJT
         WKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374102; x=1783978902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=I/vuhHr59N3BrW4uNxijfO5bC6ndr3Ke3L5DSyEWBh9iKsLL3dN4LgZUG11HaLsVrw
         KdrmonK+t1rPe7JN7ozvP92RhPflkDuEG+XSP6/+KY/CXdTXkW8t5Vzn2qgpJg18JHIW
         nVl43hxzoUcr9mADr1NPCUf092rRhloMJjg+6vspANJae77zuz9W5qefTm0tvs8VCnSV
         JstAy0D8WoVSv94/IhwR2sux1USX6CUO4TsbkJNYXAOtUnhRx9h7eOWsSm+0a1NTOkxd
         29NoOsmfD9u4SqxpJx4JXXPS9ZtAeOKogEBAk0bidMk4GXu8aWDtyc9oMDNKhcF1mE2J
         e2kA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+R2c16y/waTvYMatHufBWrOSzGYyOI/zRn6JQ17xJP7p9QGCXASSB2Yj7W/kLVQGAkAw7M3McexXPB+L0@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLqdhdIcv84xyUPscf80GhR26tC7vfoz5EKLmRyFZGnsAnrSm
	2EFrcyNouc0yPzaeihvRvwapvRtKDSZAo9nCckyLUbs61r+jIJ2yeMEbdQqdDEhBuQ7sIMRtxwA
	55e9JlDQiRm/UBNw2W837kIP1pmhGnLOu9aslQuNaNpiX9DzxrXKNwqIBXPSpbt2bvgnJ
X-Gm-Gg: AfdE7cltKSY7t40MsO+8Na4wce6qXtlNiBFwxAurmexTXGIR/aP++GH9NXu3847mWD2
	ktKNHl03i8x+JmUIpjczJe/Whu4hdlncY1i/KZRzHMWgg1OwJkhUBZcEVN8a54SnVxxqnlVbY7R
	XfFYSLILYgm30tYvE3afUq7GQySNSqrivYuc8ff7pGeVbKZtM1J8Klzi9AfgpjsyTrUQCamrXZu
	EunTSOgHkFPrv5ewMU+ppeETBICRauYHTHUKnVEbahAYrWZaLwo+tcUCAjfYVv7VSD3Yn8VOH54
	UuOHxG2qppylV98wkY7JTebVYAgxnD5Ep/86sa/YVHGOlSDsJzhkcCf4ohNHrSLkrqkwHCcZomM
	Bcrush8FFOLRmOgqlnUjDOq2OKAxbi7HAGfs=
X-Received: by 2002:a17:902:db0b:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ccbe6134e8mr22172685ad.13.1783374102106;
        Mon, 06 Jul 2026 14:41:42 -0700 (PDT)
X-Received: by 2002:a17:902:db0b:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ccbe6134e8mr22172395ad.13.1783374101635;
        Mon, 06 Jul 2026 14:41:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:25 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-7-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=851;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
 b=/vxFPiWhExDAZrwWpa9l5y1Vh5+B3MHCEDcTetW6Rnsi8OF+RTcQYPZQUwPmK0SL7uCCDX+zC
 BZENeY9M3FPA6/x/6kAZHbvTkjGW6EySXdhiV8xYjlk/ovPvpLvmdhJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c2116 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ckKq4DLX54o5ySWhiFgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXwZ3GfkimFKw9
 rFuKInAIeHT9051MJ1Ua0KSwSI0/byrUIWld0yej1ZHKI8npHiHx70/JBuKlHYDU5ieWgwGSCrS
 7LQtZz8nELMApebQswZWewkiRS1ilaPAlNrJVrlqXe0kOZI3GW5pMaAK1KLPDuODnT/qH4ui6o4
 1WsWoYTqS08TKjn0C562pcepeYQzZTXxjvTNfro2x5jA4Fz6gNhkEcVvMuVhurLXWj0q+eTsUx7
 QIPSAOSBDKJfEODEfsfLC2EWUrYaIUxl+S1U220LYGiO4it4wZ6YqvriV7+YKyErdT0sxjBJuWa
 bDXmPU63New7XbGZWGQ28Ckst/Zm3jveAkouwe1sf1aaplHY1meXijN+FKI7KE8GLhYZB/djUxZ
 i2YiCyxZ0rSrmqUjD/AlYNzD6j7hDkflCLU13JwtGcGnHMOP4wzXD2vBXLG4ZG0QEXuN24Az7Mr
 mm9ot1QRV0IgkouYsEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXwG+eQHprjCjy
 Uiy0f9RKbpfDAZJRsaEM49wUjunpefDwL0umUhne0ivcmX1/1r4i1+a1aekrPnp6ab1SfUYCtFu
 giSrKHHmnDxFjMntkZYQKOqN6Xk4pjk=
X-Proofpoint-GUID: k4YHCUNEC8nwzhFnpg2zciQ-Z3RL7cjs
X-Proofpoint-ORIG-GUID: k4YHCUNEC8nwzhFnpg2zciQ-Z3RL7cjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
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
	TAGGED_FROM(0.00)[bounces-117050-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: AF92B715CEB

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.54.0


