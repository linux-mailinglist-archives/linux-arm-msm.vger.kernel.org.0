Return-Path: <linux-arm-msm+bounces-92229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCIHMB2iiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:00:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AEC10D4B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50CFF30053F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E7E32692F;
	Mon,  9 Feb 2026 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuCMAoeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N40S6BwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D075325736
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627381; cv=none; b=VrAhnI1nQik6zLlG6qETo5YcJJi+FKQTCG09qtuqjXuoNfLppDYgEUbRV4LD5l+SPStMNRH3daw6x/Lwn8OLGpkRd8+z/5TGB0Pav8TZOIdnLmryKIWw+ZG38aX57cAM+2iC4cG3447akafrGqH6bgb+5H3VclLDEdLNJlIifhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627381; c=relaxed/simple;
	bh=M81yOMe/ql8emTWtf8xb8pxbk7FyZcQ1d357gyQHBX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUqsXmxLCFQXaLZbVhKZLnRzYHk14GCiEdWlvf1WEKUEcy/BfdJtswLQ8/t32yB6LyVVSoVs3hVm+uc1UWyS9qKgfNuAXzPKPkfg0hUrDey1XzjHfWr95BsNbvwO4LZvs5YQOZCrQ8QEVrMKl3U+J1e92JTi1Ohzngt42cVqUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuCMAoeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N40S6BwZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619534bE2587329
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LpKAQSkO59uWb8tjJzAB49a/
	bWC5Eiew8npHmf/ENl0=; b=cuCMAoeLaHIHDbszqQDZdR3HYlDJBUjyW4ArZqPA
	GqdKlq/W9xqW6DmaZj1a/kATBBU0Zw4MTPPIS52pHo13LJBw3W91/DGM5yAyiFie
	YmLjdTB1fGO6nDwlHmlKvIauG74Yq//m8pCXtYLJRGeZBAvUbKJsuIjzw/vGL3OE
	LJsPk8RLWNHnk8hqfm8cYIC2CTL3uAfocwTqTFyM7p8VX7MV+dM4RdlwLDuZ6eIC
	Hw4Y89U5RMUZnuAOeHEBTcBs7eIgRRgWT6NzUDLazJ+yHsUBSUQSdAa12Ul+6biW
	DGZgj32m4wo1rIhd6MgSvkDBnz3ztkDmWpAWayGwjVaGIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bgrks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:56:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso1280978185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627379; x=1771232179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpKAQSkO59uWb8tjJzAB49a/bWC5Eiew8npHmf/ENl0=;
        b=N40S6BwZLRxXaAX0YSyDF1aC+4Lru/gKotCu4dUXeqKQCuOHzEAlX41BIENHzdRT8z
         hpV1UFEAVE5uXWUZl3Pjno4O/kTTR7vYHiv+ipdeHjiOGveLqPIo8TNvu1IXyI6XmqWT
         MwL1iOrmzRYQwdCFq226yTcw65zkIcO3BWcZeyyVEcKDxA8j4Ervc4JuICf2qTmollCx
         yzXhOtIt1cHaMTQ7aXlQMBPixn2UvgTtgVLcfxZFRtrEqGxsUh3FOOIdHMzXfyCcLEtA
         IXKMzTKeD5T7ovhaCMxKuWJ9OhguJBNll3TuG729WU5qpBzsBnOR075tYRgDyBvNE21p
         XFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627379; x=1771232179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpKAQSkO59uWb8tjJzAB49a/bWC5Eiew8npHmf/ENl0=;
        b=tJECEPaP13R2KKrfyv4TXptQxx9TIa2Mclli/FPLI0KrIEcNmQwhHsb6SuLouTEDYr
         vz4xS3bpKW3fa4k2NRPJDuy5YuzNpyA7mzoTy/Pw/sbSgyubRHtPHGZx6JEsuaS8d0rh
         XIncGiw+5q/KEP84Gy12QEI2Jix9JMqrYPDPzdzMvHtxjJsx67sEnmUoGGKP5RT5aU1Z
         N+ur8D0CYG1tYqWzERHeI1TlKqoq5YhReEqZEaFBhOfW6oLf9ka3VaXv+aBREu2L11g8
         tuYmmzPw2+9dUeCcTe0sa9xubSZBKimNYm1MPhMrD8x3VtSgQz1IxsBjdesmTJtxrimY
         Sp4w==
X-Forwarded-Encrypted: i=1; AJvYcCVxKNqIown46zomQ+to5yERXGOqh5zqGulpqqU/XauTS8OlBEgY664pHmcBtTZPePFAxoLQXLG3+WvaviP7@vger.kernel.org
X-Gm-Message-State: AOJu0YxRvpp423GldLeJhEvJaH6YrczE+GO1H2xEevaLX+uIrjMp6Gtl
	riuewSRZGQhCL0PyNuaHOqHG/PCl4YXY6oTtqvM/txniJdxzkkbxedpEnPrmhhrUFFtwUHp4GLg
	2QGCcXEFdjjJafFCRpMrsQo8Hhc9FpfYrwUQZhbUGvIr9iGfc+RLhG+ZDxEoLkqmgLto4
X-Gm-Gg: AZuq6aIJcr33uiE5uy5MLTISqSAWDvzLYLvkBd9YEb4VOfBIKFCrPqaEBotAWXU8pMe
	yP1m4M8qG/HseBTgUir+AU2D/JSmh9ozXrsD8Ofx3z8WJMr9d6Fcm55dRc+jGl7Xg8v0wFe/M0E
	755fAEzfXYAml0NoJkKpiQtMXc+2ZFfIeO6afXheRJePFMICdpIgb3bDiYTu0by7Axe9fniIhPK
	0euIkQZSc6gcPSr7w9eLGlDsKqLAQcbu81sr7yuy/tS+9RJitLHtpMl9Z2ezIYueEXQ5GNWb8eQ
	+qA4PXDrCceexo9H9gjcAasso1VmHlm+WizD2GiOa86N7qFH1LBwdcpr76NpL8rmGW80uf95bGv
	JIhq/IQcJIs1Z/JDIi3Mt673Y/beaHIBtvupmm/p3DpY841lNu1warNaXSiydKFU7t8iKrs2sWu
	wpSSMACk7uZAWRea78yfsUQlM=
X-Received: by 2002:a05:620a:1714:b0:8c9:f996:8207 with SMTP id af79cd13be357-8caeef2c3aamr1416280185a.7.1770627379391;
        Mon, 09 Feb 2026 00:56:19 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8c9:f996:8207 with SMTP id af79cd13be357-8caeef2c3aamr1416277685a.7.1770627378980;
        Mon, 09 Feb 2026 00:56:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b641912fsm24325151fa.45.2026.02.09.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:56:18 -0800 (PST)
Date: Mon, 9 Feb 2026 10:56:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in power
 on/off sequence
Message-ID: <kbcqwqzieeawdqpiatrz3i4xnxkntvb2rusrt53fknnsukjclu@bsrjxegdwxa7>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
 <20260209-enable_iris_on_purwa-v1-3-537c410f604f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-enable_iris_on_purwa-v1-3-537c410f604f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989a133 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SXwshJWtf2gqKqmXss4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p__tsn1kEvgAK-coxZgiRmO5uGEyw8Hn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NCBTYWx0ZWRfXy/p2OkhaP+O7
 6Bd49KaFu9WMEoFN0x/5CdYBvDAXCf2q+w+dq0itMF5AI6sppT5YLEO5EZ8O0H421OIrVlTv/iS
 yBqSasXGEgl9whW+7mYF3vdwNPNXQH+Jx5vXjFbGfEDOe5sf7E1ZPxtklOSarIrXC40UW3nKgG/
 w3/12ouTnQeiJhybuAG+3eiM9B4Zoc7An2EzCzCxZyT0/6R0Mwlhl+GfQ8va7ULZaIi7A7n9qaE
 m7QMpSJmR7pdRz2Vz+KeDojRKKVHq2VWm/kaHJiMzoKnrQkGJdoowLelr/Jr8BiOJzJ/DrF72Ny
 lvpP0ofymDqDBD9MrgqXsLzPWK11VM1D5DNCB7MfIaQF5c2oMEuV9+IQcSQWXH+aBIMK9ELPDg3
 wFkGiHh3F7PGFA8zJQ0r5eMlkp8vzaAa41LP9GyhTrHkfjGoOSRGr7DbfgjURrlXZo/7hLbOZV+
 loEtKISJeJ1lvPkl7nQ==
X-Proofpoint-GUID: p__tsn1kEvgAK-coxZgiRmO5uGEyw8Hn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92229-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5AEC10D4B3
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 03:39:05PM +0800, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.

Is this clock going to be used on other platforms / VPU versions too? If
not, can we keep it away from the generic code?

> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

