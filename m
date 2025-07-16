Return-Path: <linux-arm-msm+bounces-65262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78971B077C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0D2A40AF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316D572606;
	Wed, 16 Jul 2025 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQisyHV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018219066B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675341; cv=none; b=sxdRTNQkygeS21X0B8L4K4k8BOU1JofqN2sby+FxN3IidqDKqOMKn7bfx1XCWsOLFH9TZz6VnY0i+uA+kRjpxTdNEKK7pYRwwNJJ+yoUbpJT7EcU/VbCsuWhe2+XZ+c8hA0IsRwhjv5l4wJFNP1F6fB/XuJAVqnrfRlcbUuk1Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675341; c=relaxed/simple;
	bh=JM80pgGqNSa4r/1vOHTvUpEsPtwkf06lWm1xdCxMrrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I05v2KNXRBDgvc0wskDImFZ+IZ2Jag946npmKMZMeygLunc5Hb21Sb5HOK7LUKNMe/vRJRIh2V7Lq0Yp/o+AIweyG4kfUsYAYSCIEtYXkg79PcScVOzm8hYR8zIvbJ03ZaIVk75jDvXZz/14LHQmt+5Ft1dn8kCWD9ujP8tuOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQisyHV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GClYTb014516
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9zjZD1JwF29X/cyV1Xb+ZjTmA7YHte4xWXBEMM0XvM=; b=UQisyHV+KqmcFjSl
	rCLcayOJFkx46Drbo9MLTLmh5/9XeUyiYU/SlSOQrIHDSoAXy/H2e6dVGEX5ZCCa
	FkI7RvNi0cyuc3U3QtFubBUN8gLQ8L/L4QeuGtaqYQqduf1mB9fhyW3kNyhhA8YC
	xVgaQ07tTDSYuYNQty1ssLfQUpbp1/9o6jOz78kBhDST/jiFyBqzwDblehNwjBfz
	rfj+oqI6kpjkaQjeiyN7+dzUKFxzfBJh0u0swye7BaZoyVAwhgJaawmXF4aw9/Co
	o6Vd6TvHX0dYXJp3x2BdmxJC6Y3VsSCMI0i6rEKUkYIkk8FPr03yUdFFMRt/CJ4S
	n++75Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyq4dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:15:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so64407525ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675337; x=1753280137;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9zjZD1JwF29X/cyV1Xb+ZjTmA7YHte4xWXBEMM0XvM=;
        b=Zb2nD3ADcF9us+ManTiY8m4kHN89CtK4iA7L7CNLfZxxXFF58nLNWdyhiSKFOvHz0A
         PLgHhorgF7rV+QowBxViXOZzFeRmaXoMmreVT93wRzcUFx2W10KINXH0i0ArkPQYRUKa
         dt7zOjYOB9E68Dj0mv9YnbMi7SiFdtq15mkvQveaE9X0FYZiVzzlg6C9ahyRwfZR0ipg
         UHkRtqztGlAcECuU+BpiB3Taaph7w1Vv8aWUrwxzcdbgYeus29bsMLKnHZq4x0GuRaAI
         4M4pQlXyvOfXzWaS/y5sLUApNx0Adu9SzgKQtvznVC9eHN3w1H8s0URNRVTlOHVr+3D3
         y0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKFgJk6EGtBjg5Kef1Q636y/V75lA/5WH/s6URy/mKMvXDobTbDRhbk8W2jEFGphOZlVyBvqmzucd3Cwo2@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzUfXGQ2wjxvUsAJ0Yq/xgoK1v6DoB7238aWsFHid94CAq3zH
	EeCZz4MJdycmw0QFaJzK/RkRWbxhWDLUAvymSXx6yD1Cqps1Kg4+YLlQ7+edNwWAzzf1fBGojnr
	/wCP16qvrWAODBq+CeCQiaC1IGIsAiZ1LHYKRi8qn6EtkN7wftu/ry1L+ZqLL48F7a83T
X-Gm-Gg: ASbGnctL8ITJYaE985Uaw6eRGX2ccojoZy8Z6/4vnYS5m0c6QJU1DpPNg4/IVioVGku
	Oue37T+1aqP0/HbXIkD2wrBKDVN6WBQfrxj6hJ5RhkBc42Kbb4UDz6uoilKssC3pherjpYK6sCg
	tlf1rbuztyOqY9PYtd1PrJsFaHh+eNzUHOHGrox5hWg54iM8p8vWTvMhKQPsxoE2EfvMomEeJvu
	lTaafYi0/2r+tYdJKItuiAp4JJOJC8XOUwPfnBx8hRl0yniP1w+s+LhGKdw2YIWXEk/XKsFWhAZ
	tJr4JPy8G6otPa+C0f1Eyv9s86z/c3Ix6OocTvxApFpFYWoMWD3Vv6plJchqltMIBv4f
X-Received: by 2002:a17:902:c94e:b0:234:ef42:5d65 with SMTP id d9443c01a7336-23e25789acbmr47265535ad.52.1752675335667;
        Wed, 16 Jul 2025 07:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74Q3jl1MnboneV64yqd1rgw3JWWP2KPimRq5deOkhvtbRiElP1WmxRnvY99cP2KO4ZvLKGQ==
X-Received: by 2002:a17:902:c94e:b0:234:ef42:5d65 with SMTP id d9443c01a7336-23e25789acbmr47260985ad.52.1752675330552;
        Wed, 16 Jul 2025 07:15:30 -0700 (PDT)
Received: from [192.168.1.17] ([117.213.98.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322dbdsm128971105ad.127.2025.07.16.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:15:28 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20250716091836.999364-1-dnlplm@gmail.com>
References: <20250716091836.999364-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN990B40
 modem support
Message-Id: <175267532620.8017.1596070646216091764.b4-ty@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 19:45:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: T0jvX7RL0Sq3mZK-I_o3oub7mv8KctzM
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877b40a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qwM7zxNKp6jzn47FiYk7ew==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=J6noarIePAt8HtWXbDwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyOSBTYWx0ZWRfX6fSZIe4e5ano
 gEGyJFL6QemmChH3IDChzGOg76hYp9M1mEeRNXZBp7QwmNl9zksPq8DMY1GUCLveHXpZrrU/e3N
 uBfpy5A7DHcBQaqirLZMvZqwr0HBdsIw6udGKBsp750lDr0QjL+PE+GUt7HcqKRqmgBOZdlEzjp
 bhmxhZX2GnJ/HXLea2MNZ367DQi7SBBByxzlSCK9UPaeotHZF8iIAdPgkLX45YNOc1r0pIDdDs7
 6sYAIhrAwySWYtJ6+iFqBJ/MCHuyWYI/GtkU5UFBWsOyGw8v15PJNqMTMSx4JyaaNGRkWop4oOu
 FKMitE7knWx0QpZrzv9tF1B7Pqpjbrc5HzsAa2hkgLM0FKmj0eqnGj5olTVK0FWTP7Ods0AmpnI
 OpFqPe5yvf8WJlxl08uu0cRGHPjMpMSzSaX3ppWityUthq4u+8kcAnhmVw4pXmrUpvsS4HKb
X-Proofpoint-GUID: T0jvX7RL0Sq3mZK-I_o3oub7mv8KctzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=905
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160129


On Wed, 16 Jul 2025 11:18:36 +0200, Daniele Palmas wrote:
> Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
>         Subsystem: Device 1c5d:201a
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
      commit: 73d370ed82381428d76d602d74f5806c77d25b09

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


