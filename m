Return-Path: <linux-arm-msm+bounces-86501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1509ECDBAED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 103553018306
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 08:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BAC2D24AC;
	Wed, 24 Dec 2025 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztuwrr25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blVSsJEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29738220687
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565374; cv=none; b=IddHbedFfBul6LtGOy2/83oFVt2ZcTEBs7vsS7dEbUUEk5Gm64nkATWHx7Qtprck1lSWf+T3177OEDBNpAAd8alzjgSFQryvk9f+qL+/c7/jjkzU0Ob4cRrust3SF4MpCc8RYEsrqXSRrljcHmpShicqe82RMSsxiKK0s7+YJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565374; c=relaxed/simple;
	bh=XHBKHnnZEzYTkHB9JgONtynkb7j/32ppr/tKZ5hBlJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ta6HQArIFqTOQvhhlWbc04j3nYJrXssMu+Payj4lSQC+ZDgFnpfsJanCm9Ow5f6G/ZpGyg38rMd9g4P9gFtGiB4fYQUYSquy/YXlbGywkqA/K4q/IqymHTJZxASsmOdjENyTkBNo+MkQ2oAreRlSWx8qgN36rRQrSTVMq7kxK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ztuwrr25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blVSsJEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17ZbC1597861
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXs5FzhQAnjXR+6G2SMJXmif
	FDe24dqHV2KRrcnEULI=; b=Ztuwrr25dhrVv1BahCWqZ4PWU79t7OLCj7sPKsKS
	s6LzElpfZtKQllwJjYmTpsftcyDT6MMxsvP+MFdP0UDeHfzza3WFQQ7JlkDLdhZe
	gncfFbZTzUx49MhytU1jexTV6rgTo6c7xkthFVvWtAFfe6CKpGrhyssN9ME5g8Eq
	NeY4tTsHQ9egs0YpZKG+YwDhu+g2xK0Nsu7ge0ZbhZjdkwBFQoLERQJe6Lms7I/k
	OnHboSHqq0Kd4C3Gb6Y819JOzoMFK00VKQ1GihNGLu1adUhvImql78NBuatLQYdE
	eMXa8tZLEu0mqc27iUeIJTUJMEaqLGqeZy6cZorXAEiN8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h1av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:36:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f47c0e60so142952935ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766565371; x=1767170171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXs5FzhQAnjXR+6G2SMJXmifFDe24dqHV2KRrcnEULI=;
        b=blVSsJEQ/csGRapYK9D3GWKmN+XVleDQsxUyGS6VFK7N0bKp/cPzKpNQ4ogILik/Pt
         vd5ZDQokgWAPq/aK5uh6UbGDAAwa0qbgRf8Zuf1qsr4N+8FTv+MXQlWQU5KBaZbVKP00
         qtxzf7Tb/0DB5WdtXeRXTqPxkbE/30Cvw7OGyUEOb5Rh1YEsvbScRFTvGlM/gI3uT+xh
         yAimUxj0m+GiRj/F6K5Vtq88/d+MKkP7bMVdgc0sJ6NS2IewEYgDFF1ZjgicHGsWEX9M
         1ar61bIBXN/oUQ3XcLxaSIIt0SB5z7PyLDUzTaDbGi6YDNnQ2d1g2lwxdyM+JMw+2a0J
         jF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766565371; x=1767170171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXs5FzhQAnjXR+6G2SMJXmifFDe24dqHV2KRrcnEULI=;
        b=BDviHerd5J0nve3aT4oUONlWyhiAj81/ZhzUAQQgvF34Pz0xiMDumYMp3u1/FDO9aY
         BNKwe4i7BQ1laU8TtW/u1ZH7U4sc8n16CQgnm4IMdzyFG7+BFCL7SMSNDVVLPlBspB+K
         eJp3ZEQ4+ml+omm9+fohdRq8x209emucXfytW+wYlFdd/NInS+bGV42XaFMTtvqqgPNG
         stf1uc52E3k+TrYoUSnVHCJEcfFteYpqr5W/RnPS1krAWx0s1xyr0eekrs8SabI6AQJZ
         bB7ejoVDsk+MHZcDk6wxsFSPpFpEUmY44k4NP1U/4Mi6ZYo7Cg8+nFsPDXTEG3ZqQn6p
         FHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIziGpA+40ug4BfjsMrtByUtnwhWQYbBUwUvXmxlZcu+bZ/c28zxTviA62rGz2rb3SubhxdcWe30lPbSQy@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeAdOs0Yqiya09JPA1b52WagqSyaVKTDkcwq99ssfWGIzztdQ
	ArE05hmh1Ou6uQGp6DiRLcG7hxyx6lxfjf8cSanRIWdp1NT0Hv0jsehhjAYQYTrM4TGWZ30QwEq
	g7KB/vkUY5cJzT3c7BjbQsTRWyeis7Q+qUvF1iN9jjK2TaAeemWXC/RWc5Vnr6QMS1XUT
X-Gm-Gg: AY/fxX6PGKlZRrEzeV3W0r+lf3QTT9x8uvg71TcLSJf2PNOvzBruMsmcd34gouQ9iew
	yMxo4viMIz+PCywGnMDFJkAG4A7auy5NgINulV9i7D4Z//mKNyAzdglgFwcDHiYFmQm1aRoDbZK
	GbsoaRN6eTdvcMrOhZ2ard2d5NX9v8TW1/v6wozepy//l8sxa4QvMVocaeQKhMHdrikFWRD8qf/
	uSl/56B98WZhyc0vWf0WAuWPMd6oUxhEf8gZ0eEImc2YW1aKhgXh8lygEAY4e2T1lFvgARFzYJe
	CbRMs53V+ey08U4tzYijwsD7EO1o9oIP1wWGxy5G9NbCOQONFUNhJRPtl074i44wtTvLlcq8w9W
	Tvq0T2bOcQF72oSQGN5YCwvWWmDOM7zAM/TB0+MhpaHx9TMY=
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr172625395ad.44.1766565370773;
        Wed, 24 Dec 2025 00:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMl17mBi0hsdESnNqw35un/TKkSfrxWaGopzD3e4rHFh18vvSMKpYB3p8rKQZ/Rn4836ZOqQ==
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr172625195ad.44.1766565370347;
        Wed, 24 Dec 2025 00:36:10 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb30sm151195355ad.66.2025.12.24.00.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:36:10 -0800 (PST)
Date: Wed, 24 Dec 2025 14:06:05 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco: add QCrypto node
Message-ID: <aUul9RKw16+JvR9o@hu-arakshit-hyd.qualcomm.com>
References: <20251223-enable-qualcomm-crypto-engine-for-monaco-v2-1-6274c1f6136f@oss.qualcomm.com>
 <ggcuy52ishtss4xcghigxlrkgjoc2ssojdm7xx5chkmdpnp6f4@6guglelys4u4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ggcuy52ishtss4xcghigxlrkgjoc2ssojdm7xx5chkmdpnp6f4@6guglelys4u4>
X-Proofpoint-GUID: tl_eCimrV5anGx7ccEhNtzdECk-hcKZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3NCBTYWx0ZWRfX/RAyPAogNz09
 nQrM6twFH+lCYZ3X8N7iudOTcW53jJRk93SIgV4mrFHOrqLZiEFZUWmv0Q7FjpMi/MDbwaXkCwb
 pb2m3OXCiE3ir8rX+ug6VzcBJvsFZpjD8gXravXY25J7+YA0vXLdDZBUtVrMTIVEK8mORjcKUaZ
 QeD4Umee6YfABGbJlJo3ZLp+hoCtJHf4apC58rbkNZ4sn1tgzGdsNAFXhV4SuF9JFANDIuaOg6J
 Lj4fhuCm9Y0KAzUuwZ+yYdlbQq7dLDTCwqOOMUvX4ACPiEBJOXj13vWHzdUUOAsQX29zRSqTdT9
 /ikP1sUUxk24httq3V9UvGl/giU0n0elXL/G13ct0v7eCfCtld0CraU+TDqB69s6t+IGtX6aAum
 A+6Bxy/C+tgEhgd0z4lcEL2PTwVdFiDZD5KdkSfEJdfSeSbPwv4Tpm4DZ7Xa3G6HhkqYo0jN/o9
 YyNXmG9bKsFB0KGq/zQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694ba5fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uPlboWb8i3xBuZE9GFAA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: tl_eCimrV5anGx7ccEhNtzdECk-hcKZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240074

On Tue, Dec 23, 2025 at 10:23:43PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 12:25:18PM +0530, Abhinaba Rakshit wrote:
> > Add Qualcomm Crypto Engine device node for Monaco platform.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> > QCE and Crypto DMA nodes patch was applied as part of the
> > commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> > however was partially reverted by commit cdc117c40537 ("arm64: dts:
> > qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add
> > QCrypto nodes"") due to compatible string being miss-matched
> > against schema.
> 
> ^^ This looks like something that should be a part of the commit message.
> 

Sure, understood.
Will post patchset v3 with changes as mentioned.

Abhinaba

