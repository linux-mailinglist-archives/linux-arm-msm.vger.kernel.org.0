Return-Path: <linux-arm-msm+bounces-111903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ucdIEnLJmq8kgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:01:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0BF656E37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:01:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WUFTxF/c";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CB62tbbG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6771E3043458
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FC03C5826;
	Mon,  8 Jun 2026 13:57:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F713CC7EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:57:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927077; cv=none; b=pvx/3ejhXo/nwFbKpe2wB3xZeKaPEmY9wbgHIAeE1B5H2Y/RIIVPC37LTe7chl5Y2AUKflJCwVDW5FFBR+egKO/YmGSm4rZ01h7SvUsxfVhe7TjaCjxliZd/rzCv8vfKWTr7qsnJAdEmtevzW7EGiTkToCZq7wxY4kieitFRANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927077; c=relaxed/simple;
	bh=2iG4kOLG80lHNE6HN05CA2qQtIYYO+IFPRLCITgJYKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao70RxayNtLCMfFZU9ne/g6fl1yLkfNAjYnXpq0X7ziy7hCxf/TN1kPFQpTOw6IajU/I1zbr9N04nbDbh6aIrKAQUuOJl3k4j5RAgoJkTVgGCe3hZ8CYm6nCVUr/8jpyUURMOp3ytLWMEefVkFw9yD9Pse9E8g68bZZ20irvLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUFTxF/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CB62tbbG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR6ed3789177
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8cPA997XuE0awkGepna6I5ww
	w79fUhweZMaYVACJLoU=; b=WUFTxF/cBaRxHKYXcYN/1Q0/mU2fDC0l+9YpuUW0
	Fo1iwLMnUV0E35L8ARdTo5f0jb6sqlHJx2aV+375s7XORA/9/gmz8pHq2s0y51ey
	IWy0vVxk89vcAL0M0rBrW81qeZN6yAuCgU1UrW88wULZYtRzVGVCS+/ywUbb5jjR
	uiBM/bWx2XcrXelhI1nQpYgsjvpZj1njuneRDN5PSfwWg1H2RitPOwlrxJcrwCQA
	AZfv94gauqHTaK9U161ueHLvPBgOXbWBlZ64ndbfvL8cHVz4NhyfogDIRTF6yieM
	vTdPFwKw190P5uykNJfCnR3XZmJW4Xd+4+AdaemUc2gk4g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8egm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:57:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so1738676241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927074; x=1781531874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=;
        b=CB62tbbGLGv68bCeyJLfNj4E9a4wlQjggfPFuxiJ9zXLorqSfa2R/jaQvird5DHLzR
         eA34XjM89C1mZq5VW+eXaBZ71qYr0nOj2BM3fiGH4fcw0cp+yuyGL5q6HcMr0OkxVbpl
         Yf8UsMi/PwYKYbeTKYClF8C8R6eONOQ9TzH2JOpky1TuA4UcX7vZ55EhTJUZeHtnem5i
         4DRnCeuU6D2MUpzcatgSk0JCnqzqiWj3WMAJEgCv91jteeEHa1z93LDCUjCrsMcAkzm4
         EwduKdH+0efhzFvuUjYwhBm8ZUN0WL8xSxb+wCc7QQ0LhA2VYTVOlEtrH32/YjOVa20t
         FRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927074; x=1781531874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=;
        b=jhx2dd/rh+FlP7NhQED5z/SoBYCm+KtZnF7ZXNeOUW+oyjdjc1NQqgGN0YTF8cMx68
         zQUDgJ4lS38GL1Gox2vB2oAAI/9s5PrX9PcZy5NwdnVZYzfbiyWoi85SqQoN+CPSUkwW
         azaTywnB/qAbEPKx3Uehagvxl9LAzZcbec6N/gC9i2U5DeUIyRAf4o5sktaRoBVHzUmd
         rbY4CUi+XPwxOrDuL3KxxkTmYpP7+wA6skDpPvxfMASGKo0T+i9ucxKRcbMNlxR/ffFG
         NKE3avyDObxgxWa40Gzn/G60H+yaCz5eKdzLd6C7WT2EP9RUPzvSTszZbW0rag9VxNas
         Wsng==
X-Forwarded-Encrypted: i=1; AFNElJ+3egYDE2YZkw5gpUjPmR7xksJhiKINACVDnxHkha9rPS4Ukf0+6iNJQDN2BoUrxraSUV52P9DiQaLExvKV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZf5hzClW5P4E5eLwgs0a6LXYgYnLXwQxwTsnv4tWgZKRbg9W
	Cu+FhrbdNJt0Aibb8V6aXlSh+M4R+ibVmMsNT157gaXt4CcDmAXeYmHFTQlq2jIux+l02jWjpBd
	vtjhW588zMUXN5AL5m9GEUxOLG20kkxDJ1DvjqQrdCkPq/v7xTUp/jZiKnZLfINJCaB0E
X-Gm-Gg: Acq92OGgiLitagPtQzQCfkd7gwkFr1v6EutLIa6cBbaqk+Ep1Jbf80oTP3xE8hE0VQ6
	8aaMhx+e1a1yRURHZDuH865s9/z1G3lQrKojxfZIFpWhvvjjOXPenoaXfby36YUdT4Ho1guoGmk
	5nJOUCTU0B/NvkrpVR03eHtSN6MAd3oAKmTWdpYjHjSOq2ACPd4dDhDtOJPeUUko+IYDqRjhqyp
	qFvoVvLRRQVAB1UQ0Edc/EWYBEVVGL7dxUAB7R0P06EtWKfw4eqDY+NbrCPXPx6Nvbl58n7Hbu6
	/XIrE61ssP5eaQuCSGb2uPpcXr3W/gXMlkxYI+FbFUApu8Fktn2LAq1HkRZ7SYKyo8SDyrvkf4d
	ahJeICYYMq1MarRtaqa2zWOO47xRptdNvSAGSFT3uRv5F+iukxynQuummKNgZBQKMCwYcyKtpDy
	I5oEBOtDBVjQ0lF1TY1TtwfPRimtO94ZwteDmvMiRQ6NI+AQ==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr7169180137.24.1780927074485;
        Mon, 08 Jun 2026 06:57:54 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr7169160137.24.1780927074019;
        Mon, 08 Jun 2026 06:57:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm3867106e87.1.2026.06.08.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:57:52 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:57:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-GUID: GwG0SVnBtCr6-5rpxVyBHdbHBgbLwVmu
X-Proofpoint-ORIG-GUID: GwG0SVnBtCr6-5rpxVyBHdbHBgbLwVmu
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26ca63 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LVq_GggcSHk3DsAf1gkA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX7a/yFju09Hlc
 XecgbR8tS3Cp9zUW6B48RX9upGbHXyAQSC7uU02U8RvF0KqHq+V1rBmDyZkNApMx8P/r6dqLaPn
 ej7Z5JRJ9HfUN9JKeaGHK2iWI3REZ/Frovit6EKJwUjkzQX4nKD8XJm52v8pNFpOw86EaVsm62z
 PUcUiqIsIcy7TFvDT06xPSHBGwdC8DU2g0wrJYmg3VZmYq6Y3MZdrA7tmfyvnuakLDuGZAiz3gf
 wHY2DEP8GXXa4JNgq22QZQr6bAVo6yxoNnv1BsCejp2sv2LW42H761m7r8K+Esoxn+iWf92vk2E
 z8a7TW54o68ZwIOQR20K5wqUsLCrg9nI6wc/E4G0/ow17GD4I5zDRDvt6IZunsNLQ6pDL2l/3Sr
 1SGGuN22uKpqiBNN0lmIWF3dX1zrgrXluDMVt/q8IEmEtKTUZVYAutJVVSd0JglCTn4EDEnWTQ5
 7OtEO+FBEz+mugjXLzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080132
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111903-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,jfa7sgyzot6j:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB0BF656E37

On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.

Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
be voting on other interconnects too? I guess so, because currently I
see that TBUs vote for various interconnects. BTW: should apps_smmu also
vote on the power domains?

> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>  
>  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>  			dma-coherent;
> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>  		};
>  
>  		gfx_0_tbu: tbu@3dd9000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

