Return-Path: <linux-arm-msm+bounces-108011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEkbLQuQCGptvQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 352DF55C766
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3969E3014C63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EAF3E4C79;
	Sat, 16 May 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZ5l6RMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ew2tkR78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B333C51D
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946054; cv=none; b=HZ7h8yURiV9OBoIoYT8jPQoaGaxDijdhvws8PPGhTXdMI7t/WGf8Z8dcX74OaCdXjinwmtTkvJzYvwvGN9JkDctaoUXhJXWEoL8d7KclrfSdDAcd/hfiSPsNZw47wLW74/6WJhTWbACW/Np/e/wwvL0kBYW6CI1t+QU/fVvFLI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946054; c=relaxed/simple;
	bh=e4lpZ96MbcKu3Vtw+ft6xB53V/umB4l0ktDpTuQGmao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0zoonIHtVe0HienSsPA8I5E1Fuhu8vIaFdhFJcY9tBJMcGs9r9AQxv7oHPcmsVf2KS7TjxWI46E8MsTvhszMZcsmDrFMYp4oFHwL0TERVwCZbuLHvK6Tq6p1Glsf2WooHoJOZWU8XVvL2tLDXqmynJ/MaXM7vLyKi0/oO+7er0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZ5l6RMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ew2tkR78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4BaDj784766
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rn76R61KTcsXG+c2wn8r5Z0X
	XD86Ov/rfiWz4zx/264=; b=QZ5l6RMw+5EPYW4IE+H1iuCxp/CsP+ewfYIBp0e6
	q7wluKOVyD6NO9FkLUix2YDA+rNwDRPFdD9GSJBgcNrF4I+0SIlrCwyEHOh78wBp
	AwJsK/Do06yoimwHkTsvw8ioCiBczJ2FOREAqrfF0prjhyYC30Yz2SFSp8FQIuNK
	SiVn2n3ss3vtjTZofCLccqoaw39+WvARL02ZKTh1PKshGFtDdqG+3pDd8Px8k9ar
	liSmLV+dw15gpKkt+HCZ97TPhY0o+XA/hBI34xW9YzuUfw1nIYf9EYLlH6lA7ldS
	Ydp/mEpHxHRgKYSJAENomAIYJXK5k+i8ftvFFTnk+nZgmQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbc941v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:40:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514d2b22e7fso5292681cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778946051; x=1779550851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rn76R61KTcsXG+c2wn8r5Z0XXD86Ov/rfiWz4zx/264=;
        b=ew2tkR78SFOUK7a735+jZ1bSzr7cSfSLh0HVAdtRYlfh4uVinIg1xEJmKHKjtINJQe
         5Np+p71fJQgo9chNJ8s2JAYMRyshW3XT62pQu+mLLKL3pqnzUjFuAUiVq8z8aN5fAC/K
         h1XkDuCAGddP0EQHvADOFfqKrOQC718O5wtfX3ucKk/COV61NsXupdj2ANOCjcz0UuKM
         9tOmrYp1bLD+DFXZhdPV936FtEy4IcttTEklfte98WDEcU8u6yz8GdmmjZrWy2ATFkLj
         yflzhSPaFqdbSAjHH9SJe5XUkBlM7GluNz2ceKm3Efr1fer/JQ4ex/Tuj3VEyJrYpukc
         Jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946051; x=1779550851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rn76R61KTcsXG+c2wn8r5Z0XXD86Ov/rfiWz4zx/264=;
        b=KLZeoomD9YTV8ByMFJUKGC04SptON6oXyZIfpnPcUMVQpR+I8T8KFy88O55yeQ+Lt0
         E8cvMRLX0YpaB1HCdZZmAm6yp3OWAvi9224/IABcpMXKYHZGTbHLHbLFzdfNe5qrohbi
         dNHvBO5COxsbD3lPT22Eb4aC9ZTqfCvhuGLTWhwVm7q4dsECP7IGTHXx1zgNwnMLJatJ
         wfGzRR5kJUafy7+xRZyKCNvTlYFg4rPlg7oj25uKd3iSsGHlEC+tNhC8tn8ZoFneIwK6
         GBRmThgGYhwFatJ4ACwtiC0eCE+ups0xUiNkKwIXBtvSZGpQ9XY6duVASpu2sVYHhqVP
         ZhWA==
X-Forwarded-Encrypted: i=1; AFNElJ8kqNGP9PrvF4h5C+IsIO5XkBn6h0got51xuL5yz073Nudz1Qz9I9vhDr/KZIqO3BCWBVpw7O9SBU0awhup@vger.kernel.org
X-Gm-Message-State: AOJu0YxH89ASzPl/meeO2kG4IryRFALUKoPGZoVwHUaA/IY8g2+YE+FV
	lNrSe2UmoxuSASXJY/phGV0uqfqNoptlokYCbIQ1rngbt10zICoOuDQeDA9aeUquixeJXOct0Yh
	ajuCgu77DYZR0d8udLr8t+DCFP+iU2/cTY5c0TK6sEaxLoF73s2fk74M4CT1DQ2QCdifX
X-Gm-Gg: Acq92OFCYhNak2GB43IYdvp0rOmFYIQbheKqJ5N4H+Gvo40hjgQQZg7zUbhTzsG6372
	Vsl75rV8toXecdsT3oFlWHi0TLDwFnIpYw9jCEaEPoagh8Wg/weZ8eSD35D+o2+YS/KGW821wZt
	H/8e0NUz3RuUbkHNxN0SV9LllteSHyzi0cTQsxg1Cn6teXpe5m9HD65ZAEgfIbx+YJM4a+6iUPW
	VwGJgM7p+QwUKthAv0ShVeNPfYosjcT4r/WLEe1E/5YtXCS1T4UGzNS5hvGX3fdWTGegBjT8i5q
	1YH8cq2thUX588XdgrxVsKeyCoco479yVU/nipZ5qVEwpLsdUO+dL1uwd176iYjh/IsjG6Qq9R/
	ozmYRYM+XlwSjUxgjvDFvezRqOPDhBkhpQ62PoGbyTWMk/i3VsM0+JDiWEorIAJvzuTAonQwirg
	CakmcSVZ6FiDmYpdDtGZi8LDHvXnE+Sf9ChGM=
X-Received: by 2002:a05:622a:1181:b0:509:3257:c050 with SMTP id d75a77b69052e-5165a0dfe92mr121298311cf.24.1778946051512;
        Sat, 16 May 2026 08:40:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:509:3257:c050 with SMTP id d75a77b69052e-5165a0dfe92mr121297911cf.24.1778946051057;
        Sat, 16 May 2026 08:40:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c545asm2088981e87.56.2026.05.16.08.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:40:50 -0700 (PDT)
Date: Sat, 16 May 2026 18:40:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm7325: Move common IPA
 properties
Message-ID: <urrhdy6esy4srh4hh2ebqvk75z7xjk37n4nyaybaayitlnc3au@y6cm4y3trvis>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
 <20260516090853.2873223-4-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090853.2873223-4-zstaseg@gmail.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a089004 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1U3QSdD7kP3weBaaEWYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1NSBTYWx0ZWRfX3yOCwPgP5d38
 xP3WmmaHcyjd3K8dsz6voYY7FBnfZhFYBvjdVG5B6D/63UfWyFIEi9NXh5NN8l6T/SD7ewenZSg
 /qfHLoNHvnZcPrruttVnlvBi87CF2+fbSsbn5vk1P2vHmO8ngpBvbGPXIJuJnjW0oVTpZvW7qRS
 LC0pvAGRhRgEBJlqtD2QUcgZaqevhD0fPdikwjHeZwATUSP03oqTYIhvyRirMKGhyOVtVLycEC2
 eThvJliHPTR0XDkF82ss2Bx+qwsC74XzsZc76lFkS7ISwOgD/ILJcX5okFKYweuEMg4UOa4tGyr
 msXxsx+dh1pkO8n+ZYGMxVNgbT3EAgzp8NKZyWKg7Ujzsl4qevU+y7F29J8rL88hc1CPTUPHHY1
 it/PzE2zLNKaBnVlc8gDcHkhVUuDxwk6U/uC+z3zjbCKMzIu+YziA7T/hgxiW5MubBs/7wyoO2Y
 piedow+fZ01B93xiMTQ==
X-Proofpoint-GUID: u5banZn-K4pzrkKuPSjBb8obvRo67xR6
X-Proofpoint-ORIG-GUID: u5banZn-K4pzrkKuPSjBb8obvRo67xR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160155
X-Rspamd-Queue-Id: 352DF55C766
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108011-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 11:08:53AM +0200, Stanislav Zaikin wrote:
> The qcom,gsi-loader and memory-region properties are common across
> sm7325 devices. Move them from spacewar dts to the soc dtsi to avoid
> duplication.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 --
>  arch/arm64/boot/dts/qcom/sm7325.dtsi                 | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

