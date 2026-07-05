Return-Path: <linux-arm-msm+bounces-116516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ppxeELASSmpe+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:15:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1A709649
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:15:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SLZNNmCl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HNPiancu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116516-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116516-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D26A3005D07
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB81836C0CF;
	Sun,  5 Jul 2026 08:14:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722B36A356
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:14:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239296; cv=none; b=Z7kcSg7C0SKxHBzKRls6TzYvZAxCDlxiwQlBJjp9SIR9jKU4W70eoODXwjNX1PVyMT2axywD+hCVTGJv4nQu2G2eca2ghU7bEUlLAg0bMD2wHTHF6Nj89tTMeNtluZ1Mg38qNwHH7HxjyXwosHTuxyYVKORuBVfmb0SZFiOa0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239296; c=relaxed/simple;
	bh=ycJJry48vK1w/9pKWHhMt2Pa7b3Ht8W/8/Z4qRb1cBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3rw1Z1F6MemPU8PjCDr6nE9mVqnKquF3lJOIHVIipb0p0b0zb4UE1xsK4jdS3/KsU62x53naGq1PBrY8eUtSbR1ysr4+Lqgi/KrdYL9tCBF5n9zUHWEeoQ0cQUYZf/k6GMRDl3Up6vK/2xzm83OdoSyG5FvXJzsv77Q0oXezuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLZNNmCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNPiancu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Nt2T3157149
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=; b=SLZNNmCligj73r9a
	HmTSVxVWqJcHqpk5129dmpy7qmKlR3hvUrApOZdaL/B6xsrRis07VNYTQb3NuaiO
	E1V7NU/NgcStSN4LHLkr6K43wagLw1Uz3I5JcnoS3rTHHSm/IudS+ngwDC2Pvr8d
	qJjX6kuo6A1UuSChmy9ncv0KL50r6SLdjvCyeQ7hbS66oaOsZ4khPDchsMJmGq1+
	xAQxIsqsxDgVnVZB3KLIKCW7m9WWwhrVZbK7qWZhcT/4R1PvMGXu+kKdOnD59gYx
	vF39FU9+LoYsF+cnyBpU+lEWhh2Ikb0vCoWJwtxqcfXiTGObZxASozwujX6u/dp9
	24bQ+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8ujacu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:14:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso23659895ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239292; x=1783844092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=;
        b=HNPiancuPcFH656fieNHAmZ8QWfcSndYeyvWj2SZIDl6FnBbGTQJuouiivs6NEqsPk
         yyuX9YB3BX18QLb7ikgGRzySv3BWzSy6KnwiUsOqfJM5s7Gy/UOwAwp1ReFJPPNPtWIc
         /tGKq+ycmU8otfnDh7gfnVE/Io2RIJVvKK0h1pk5Dvw3iwnBxAxVOm1zu/wp3wXnRRVZ
         S5VKswPRMs5ybS3Drp9WIU5qMNEBv7HdBsloADau2GSGdCbSPeWpKuhaQM+g5pM9RRMG
         J6SrMCP3TGEuTd+hcJPtQmTeLMX2u9dRFII6c0pLcKHS7O+n68g1g/GuUo9anfgRzAe3
         r+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239292; x=1783844092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TkRZqzKaTEbf88oqgt4IklNVBeRmMVYMA2DtoASnZk=;
        b=jub/amrzTTrRDOo2vznelR4whqBuCU/cYdAKNQgdJmx+D2bYptjabfhSVuCn8lQtjL
         mnxiXuUW31fMxoFheuUjL1HNL0P9cpBM23UVk7qp19bj6HxKMr47RdALlKM799qo39Ae
         Rv2ixRWVMtZRUi/E8ZJSXfOrNXTpAKkWKoEiME2uQKoEetcsrkrSjJb+OdU/uEtPXn0u
         ery8w3jAZ3rFroZYM57Ln3Gw4YGBhnV0I7b62p3qDJ28kZ7654ldZCMHjdYW72qlIarg
         3om49v2nStpWKhd3r0CGIycSodb7d7jpAGkpi4TKccmwsJr+p7ww7Co2N2anfHwGpuO7
         b3xw==
X-Forwarded-Encrypted: i=1; AHgh+RpqLt6mq3UXOu7RcyfQH+y9TeEMhUPhPdFhtXL6gUQbxiJtIwy41WgbqeKpsC8AsKX6YHeHrQlgUWJfUfte@vger.kernel.org
X-Gm-Message-State: AOJu0YzZlg7xKLq7DzF/uApc2gxb9OdfY2ax0VCgzkC5mAn7opHL97bG
	BPbpO222492mNQyJznT8CD8rlD/VF35dBgFkammOMujwxHBurG/36TClCB3fU0Ym8GQ15nVt7DR
	Ei7ClHImw3c8fF6XKUlXOF91vT5kjRNDi8RjQGK7X1XlW53hxGLGj4ATBfJVc9hHF0wh0
X-Gm-Gg: AfdE7cnDVV3voWGBD4XHKvZXibV/EysU/ohufkQIDVt/brBVEra+RyiZ5Ud/StBnZm0
	fdmT+El7AGKtGHVtreXI+obg3EcHDjDyeIdz+gseGtGCUatoe0ss2tMzTib+xEMqQWYcgDoNAzs
	lzHzESamQt59S+BNkEiVrRTq1Q4hi9r2rEO8mSDp603A1D2SJqATTV1/WQYNbPuDETJTGlJcCez
	hPISHVR2AKKu7/TqiUTvfBtm8jyjsj+75+VfxSb2IenJ75hhNqxy4g98dr20JkA+G5yQhnEvnno
	B/ZMPunFg77ALj0b5p/JmvzktDmSwcD8G5G5O+2HzC5XgN1v7ph/KO5PNNxb7/7HyLw73qufOip
	+vyIBHNYA7TdH6jUgHkZb2TKEtoQjBn2l6eo=
X-Received: by 2002:a17:903:2b0c:b0:2cc:5fae:cc36 with SMTP id d9443c01a7336-2cc5faeceb4mr48253265ad.11.1783239292347;
        Sun, 05 Jul 2026 01:14:52 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2cc:5fae:cc36 with SMTP id d9443c01a7336-2cc5faeceb4mr48253135ad.11.1783239291889;
        Sun, 05 Jul 2026 01:14:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:17 +0530
Subject: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant
 register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=3102;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ycJJry48vK1w/9pKWHhMt2Pa7b3Ht8W/8/Z4qRb1cBM=;
 b=RzMbhCYJ2ZVJ46j3xP2zUIMGGw8WVIy+lZYD70YsCCbS1sIJXmkNFXeiuEyreMuBB7MYQZS1g
 RXh6zlYFDeoD3GtnpNrTlKyIUkDM7BSY1PSqKYgqQVY0hbbpW7vVH5g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 5Iqn_FVQnfOHwYCUTZIX0GlpPgclNea1
X-Proofpoint-GUID: 5Iqn_FVQnfOHwYCUTZIX0GlpPgclNea1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX/LfVzjaa/YkD
 oEoeYLd6gBepgQTZfoWJhqlehNRamwKDoWGeMqVbzpdgR2Oi7tSpCaHMGZSMEqG9EJX63nuL/zC
 BOiW+2nnVq6W3zAt+e5SzWvjDoOegM4=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a127d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=W9u8H8Hp_niEWJubwdoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX6RmvBBeaC0v7
 LOa8+sN8gA7vhyjKanAABMHkNyHCY8/avj5xlWhQghNc7B/bCa2flRMzA0oIAim+QpVrPvsOJjW
 IEBKhAy84QoD1qPp11M0SOxVX8GPLWoNaiYmnyq8/btquiDzZWwpLi/hdS5PYEwmx7k8BoWqT9f
 NBuvF8mFDdIXOgOWAESpAMfn1LGkrPZNt+4YbPT+ywQJWQeyhIjwN0BA5/iEPigViQxVSXuPoVd
 +WmXaRezqN44CEZCvk7b9Y2IgUjXqEDbnMdy8ulimGh+UUdoCpXcDicwGWJaItHqtihKV2AQDla
 gArymLwWdbgfe+oGHTU5vPo2Tzcfkj4WDSim7zI1COuPMTUnDuGQmuntxh6VVFEhMUl3F0hkLpu
 P8ZZYyce9MTV3QO7pPOkXRnbXF3ljwduENDJNFtSB1Zh8Khy06MkCXFTwfbXOzy3OOVe15IsC1V
 J4JWt/wNiOnT9/Iy3gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
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
	TAGGED_FROM(0.00)[bounces-116516-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 83C1A709649

The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
A722, for example), so it should be tagged as an A6XX variant to match
the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
register XML and rename the generated macro accordingly at all existing
usage sites.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index a98d550b72d0..4b68416e4d05 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2180,7 +2180,7 @@ static const struct adreno_reglist a840_gbif[] = {
 	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
-	{ REG_A8XX_GBIF_CX_CONFIG, 0x20023000 },
+	{ REG_A6XX_GBIF_CX_CONFIG, 0x20023000 },
 	{ },
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..4a3c8dc8bb88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1032,7 +1032,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
 	if (adreno_is_a8xx(adreno_gpu)) {
-		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
+		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 9e44fd1ae634..6a75bfb6cec1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -228,7 +228,7 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		 * GMU enables clk gating in GBIF during boot up. So,
 		 * override that here when hwcg feature is disabled
 		 */
-		gpu_rmw(gpu, REG_A8XX_GBIF_CX_CONFIG, BIT(0), 0);
+		gpu_rmw(gpu, REG_A6XX_GBIF_CX_CONFIG, BIT(0), 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..69dd0446f8d2 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1268,7 +1268,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1" variants="A6XX"/>
 	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2" variants="A6XX"/>
 
-	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A8XX-"/>
+	<reg32 offset="0x3c00" name="GBIF_CX_CONFIG" variants="A6XX-"/>
 	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
 	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
 	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>

-- 
2.54.0


