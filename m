Return-Path: <linux-arm-msm+bounces-101727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BMJON4c0GnN3QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:02:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D3C398041
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2292300645D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98BF36164D;
	Fri,  3 Apr 2026 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX62KU0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jETuYKUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFC72EAB72
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246555; cv=none; b=gg9oPQjGzYSZZSbKG6/eLG5vrBs7lYNYuNfdyHoR2NRmYAqE4S3F9wkV/NdZK/88NQ7c9fGvsutmnsQQNm0QSbhrOUMqwnRLVzfbiA/tG2OrIs5xY8hTAP8evCWzyLijkwL1Up1TyKOoalijxmDdCFFwrDNCtk0saCR9d93QuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246555; c=relaxed/simple;
	bh=crMzeAvRDKSc+oYzWKMBeU0u1eHcNkl52DqLw8sUBNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB4k5F7/MoJ6YApEVFM2dPiNJrd3tHK9WUeLcSfto48VEcuJmYjaTOcHU8/JighYdtD2HecCVI/It7+rIfiHvR/mFDu21nu8m4OLXQ2iv+vf5s3SB8p5qNs5nzLT6i3O9OCLMuPQycQ00I5ZxZt2eMjsU7kWCW3v4ulCCslQXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX62KU0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jETuYKUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxCDX3803282
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SBF5UL6FbQfto/4s8YknHPL
	hSX/uFdWPyfp8iHTzv0=; b=AX62KU0Sn6FDkeYtRGyaADed8cM90clzxYajwt99
	Hi6N7yFfwhWio5vGDSBjlfMMzMok1Kj6XFjezvhQb4VmWQTJY+3FMn230Noj92Ux
	M9DZkRh2cjWidCGlJzxwz0D/WqV1Qjiis/0czp/gxyH8mEV3SVux2hqLbNnFzjjf
	X4cV9S2ZD4ZQOiiphdbKfTNaL0YWzmahnmyYPCMfddobDqUac1jiWUeJQ+5A/maN
	OIKqP5CN40x2O0jwMIVJRd6KZQnNwrfUbwDCOSMs9stDfNeA4oNr7YvOq8TfiIOJ
	QfMCrbH++etGq91UlUynhfsU7hpnsWrVr2Hq+r3gxZ2Y7g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f9fuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:02:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953e00e8ea7so953548241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246553; x=1775851353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=jETuYKUcx8YPZf2kpeevCrbpZ2X7WZu27r9PKyhV93FCkqFUqERh6mejjYhFKSgrvT
         TrQRjx5sjr8QWI0GAo2NsjBjA8AKZr7PaZih6LK5O3HEP4w17qeoH/5Joz+/VsoHS59Z
         uV2i7OAlcRVbr0pV+KJ2t4b9wr5JrZp+nwoMx/h2lpOFHG9Hww5F9fN9o3j5t02UaDEK
         uNOvG0xJgicPW0ryVTv39W3N20t625Ic6d5gQYLU4G3UBaun0tYeVS4LiCactDAS1MTb
         rQrdZ4BUewIIawSFX2PEuK3Vt3GmQpLYiw8R6/Zuk3lQg0CZkyHWiXjDlLDQmmHTuZRi
         MD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246553; x=1775851353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=NfIgK+5u/8SjpPUHprc8s9BLnjBg1wif4rcpUwQLI6Dblzah42vXzOFfwCkWSNSXdD
         SroW54nfgujWzUQGWJ+RlziaWp0j07NVLm1HQ+kOsMp+R0tGV8DVZ6Hj6gZGXoyq3xqy
         jXOsZ+pBo139Ohb/BwDNDzWk9TbI5kCq6E1YjuoZtFwyMi1RUE6AlrYepfhPN9jaaQYP
         yekH/zPw3PxcesnaJxbFY4XnsHqy228P3T8QWW404HfAK1RKP1DBiCcMPymIo8HVSNp0
         0ddcPcFTxQTKF/jGRf0PnJo5jJhdt6zSVDj1kG/eVehDvowNFZtlguFkDWemXQB34kIj
         KTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+rHxLMOovaAr2kuMfHzIYqzDJ4NQCwBB0tNcCRu6yCM45c3HRrg6helCA9HxQlMtD6Eb0Eq0oqGkWfbfZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDm58ZtcXElO1wlbVH3c3Zuc+9lh2qqzJBfDraUztdCYvroBv
	VT3ehbuYX2zdey5oTsqdOGBU3A7PhDKIi4ivrbnG+WwZkU9hUEBb5daHRFw8JEFlAbeg7v+t+Yb
	H8Tvt7Sqb06jRL9qQH/1ECVUTIXQBy1gAGJYdrEgKMnAEklnr6KdhRKvCZftMuLyHjnO0
X-Gm-Gg: AeBDieuA82sRfMDNLUpF2uNuYh8+lGk16R3bGcV8u2T6ktGULHKCwCrgOmmLqHYaxQe
	pVa+cYOGizlMfwfgbjXiq0U4EtvlemOXcOW+1FJj5z3s9o7acv/VXjgWySwq3hPDK6cufjOck0F
	z5HpqV97Cc8Xr6vce733thNIklKs7YfoEh+DxYdi8lcDNijjcBQPAOKHZik0c+FQOENMHSdpxJG
	UGeeqJ9zTa6Tl6+XpQ1vaW+E+Z89TSVzv1CGz5IGIhi1FJ/38a9ZTte+fKKWnMEeJYtT9HjIaGW
	L8aiPdGhvZlqWNbD2pMSOey5bjVJbodmXx9GO0GPkEj6ZL/hOPO6r78HlvpEHwbIjZtg7SHTfoq
	HDKECtohukurrAgxQw/+GylBkuH8v1IeU9h7yBIHesA4LtGqIIbfxVDbd4MECMziG0XafAEsUe9
	WcTi6v7LV2orhgqX+pUIDhjtaIXyr/v/3Eyiw=
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1470002e0c.16.1775246553094;
        Fri, 03 Apr 2026 13:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1469977e0c.16.1775246552613;
        Fri, 03 Apr 2026 13:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6033sm1700350e87.48.2026.04.03.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:02:30 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:02:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Message-ID: <nxeer7565nk7mcyqucak7cetdgzsueqpvvy7hj52al6743qcox@yvyb5ixtnzpx>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
 <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
X-Proofpoint-GUID: b2OBHzv7IaFPnhmO2PnsCF9Ix8vhh49K
X-Proofpoint-ORIG-GUID: b2OBHzv7IaFPnhmO2PnsCF9Ix8vhh49K
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69d01cda cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3OSBTYWx0ZWRfX2zmTFHkhT7sT
 e1e/v0Bfh9YXYkFCHdkKktQtS6tdPKyn9jY86gHNuemlzvf8tnbciRYikrWMOeTCuOFC4yH2GFp
 nc31le3yHRfXLzJ9wBvVh5NJSstzqux9s1fw1zKlEYtbbnvw8o7yzE0shGNJkMBElYIYxLXDlhG
 vwWj0GU1xlVvMY7e5PmdR2uwF//4RAW1qd6Z7YgmM5G46AOrOC+Zwdb30nUYdiPZUyt3G0uQask
 +CEmtDay3wAaCIDycB0OeeRvHPhEkOOVwKP0O07AOc3t+luQy5aEZHDeVBiDqgT4+sLPMfn0iAC
 Yxf7vIXxcodunFSCmevrUxpPs8kja/sLoSyyKJjAaewPTmE4Zq3ahW/EyhT9oR+KYgE5N8gBiJ5
 HNKA2lLP9g+Q/gdGRgqn473N+GotwjON5R3UuwxNF90a0FvmJ/8r3eVh+38rl2Yg/OJjxJMD7Mx
 Lzx9uxnyGO5otEEIekA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030179
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87D3C398041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 02:03:47PM +0200, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

