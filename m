Return-Path: <linux-arm-msm+bounces-117872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /jCNIjlLT2rRdgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:18:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C372D88C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p50l1JZv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wuv12V6P;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 612C93018BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424BD39891E;
	Thu,  9 Jul 2026 07:14:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC23DB315
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:14:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581258; cv=none; b=fmlDXCpeEizQIOizyXHDkpbRvZqwjumWekJroBXeNXQ9EzsY/4j14XB6DlKbbQ28gHq0LWwgEkmMr1NLL1FXF5qSgBmFdiF963iquBf03bCi09ohhb/Bm9PPIIXnoAK9nGP1Hox5Qu5ViU1P97i1OcekCzgOWcQYWs+ID+RhUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581258; c=relaxed/simple;
	bh=MSNGEhj8vYE9lSz0TKEjAT/qRyMqzPRzs6HOUMysio0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPXHVPRbVy5b79rCBKcqulfpuU55lHwLMEYeo+sd2nC6sK6IH6D8CYLLzF+V14wRAy0KATWGgqlPWtgCJFcTzRNIIEJZzSyRO34OjBqSzBU6Dsmv0tnar5RzmAd/bYf4m3abV3ER/FVgBA6VfFfLdm7KokhqdbKYSzgInGcLpto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p50l1JZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wuv12V6P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GiC931976
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SMUjuP1x+cOa3BLsYFQUebKS
	5hEQlpItYKLuhasrbQs=; b=p50l1JZvaBOSP2oH+L+MS6IFbM6iRA1n9n2W8qGX
	wqERij/2LZVJYTZCaxbWS3c6imqWd+9OGb529to3588YRzZJ+1KYLPIRg7js2EdC
	q+No46EJCRjeyLQyzAYh59MhdCybF9caYqv5xaYwT7Y00u6NPNCr2L0F6rffnoSd
	wLIu4iBQ+YeGkmgrYArCY6c8ySThQLu4IuhUgsdsT9WOFiP7YuNaEnCB8shpalVH
	L3nNuhpHK8Pvle1VZjKoraIwrtvNT7jGNgU7zqfutd7IoqgQuKkApFd+fTcRxB9a
	mdEqvyjZN2n8yH71MK2mAx0fm+MWHOcYSLoLaCAzk25RDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsavqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:14:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88da04b719so1647728a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581255; x=1784186055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMUjuP1x+cOa3BLsYFQUebKS5hEQlpItYKLuhasrbQs=;
        b=Wuv12V6PA7nfDF7MpJi2R1ouA4Q+QWwCSWajLGunFYmLS2rHF3iwxY5lGBoLxY3XOU
         stX91UKVq+QGE0soXR/SGMyQaBQsy2LYj/frNiaQmvVO8vGzQDCbr0WuHwWCn26NDMAP
         BGwZfdm1tnhV5OTNCzgZQFHrhtEUl2VcFd4OCZaUf/3rpLY8YKfpXE8gMA0r4JPX8t9G
         wyXmD+GnejtwXpF5VcqcJOwDQY0o7W77O7Uh++8pKxJmO4wziYwn4ahuzpTaPeNcs4Am
         N2+oNXMubRdkqDTEnLlyiiFbT7oZuWIL82lZ8taCrXYz9LT9H6xvYsFYULS4LMkMhWvH
         POsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581255; x=1784186055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMUjuP1x+cOa3BLsYFQUebKS5hEQlpItYKLuhasrbQs=;
        b=B1byjeR9xAVIAQgZGVmbJRlPkQmWXgwC9CzHRC3lK9DeW0/gTRB3OvVKWhTNH3RLQY
         5rhTow/XgyZ3VdTMzgRgdMuNNERp/NRBvZn4hbtbQEbm9AcaertD/w2Q2WSwS0X84gdz
         JK2bX2BzqDsvNz9/b9/D9pmCRc2KmOsCfpxPooCM5ONZRVjs8tXRoEeBtO/JuRveGVeJ
         TzjQTFtCuvKtvv/aZFA5L2taX6z94cYPlax4vxLC2IszLzHlr++km1VK3yAQLxn1Y3O6
         7OxvUbWxD+4ng24L7Wko8IH305WzYhZ8Lj7id1a9AACgwqtnVWArUp+6CF8IKpPVqYLI
         pCoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrzx0LMcTeARIACi3qUQYIpQQ+g1HxyzhVfF/F/XWJNTee504dCK6n53MO+Z9B9VR04Jbquy+qEmW5eFSV7@vger.kernel.org
X-Gm-Message-State: AOJu0YwX0rXySrWrlPWoYNqdkBcltsR616H0OcGpfvAOtT6u4rvDrfLI
	e9nq8Jb5t/vXL9Rrma6QIdcgJlS0ljEOxviu9sx6TXIAO/JLbZgcR63tXos+2I8rlqHaHamEXfP
	D7Tpwje5RewM7WzWWNTwhCYDYifRj9gQg0Qf7fSnX2Jjd+wzzZjsSg+vINIfFX0cvkhlR
X-Gm-Gg: AfdE7clPZ/A43PeCHuKLtFPjegOkxs8EiQb878/kG2L4SAu1rUzram0ySCIKeChnTpm
	SivEbmi0KPVvqyIjWT17mmm2auE1/dnwWQlPMeimsyLPBhTDJppdKWEVIo/MO8cDET6y/dv0Nh7
	X6FXVcAnA0t8Pbnjj38lsHu8xga3igEJLXuGG91v3eKuLyXJZIqe2SUlITVB4OyBmLZSKwSINEl
	30nh5R5NCoxY4XbsmBeAdsq9+8Q+9Kx74jL7iaH2cwiqsxNCWCddoxo/rJphYp2D06gQ8YajKsY
	0LBv10EgSlRu0DwfyM6F3+J4Se6gKBpo/SMRAzwR/KzGPdJ00VUFvwAVsuJurXXj6XJ5pixJLsD
	5U78L98nf3MFmmyu00fzVL0CdhGKvkk3U+vdI7g==
X-Received: by 2002:a05:6a21:6b02:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c0bcb7e330mr7464200637.48.1783581254541;
        Thu, 09 Jul 2026 00:14:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c0bcb7e330mr7464160637.48.1783581254000;
        Thu, 09 Jul 2026 00:14:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm28740179eec.13.2026.07.09.00.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:14:13 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:44:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfX5diIR1wbV9S8
 Xpqpf6mQR0adqd7mkDTKdo16cxyX4j349/nabr823GJ9gM5xV+7ig+Ar4UHzmHTKS7+9Ou7RpUJ
 ti6MjFlqXaeKuXkXeqv6i5htDHuUCKM=
X-Proofpoint-GUID: EU41tp09-VUUNXC1Cj0ajCoadZ7kRh8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfX3SNmmiF2MDwB
 zWCXXp0y7oO9W1HL+sKRBTEvvSOWfRLFtVhcFb+zCMLIvDOWeoX3dYGhaE+3zyZ1lYzwKj1AEBK
 7eonaknrVTTQqsFweO51qXy6wsOPHhv4uOuDL8qEe/LCZurwfN+/dR++z5QPPY91QkHW1+iVlwd
 YyjBVVPUvI+9uowzyJttFfjqy7Bdd7roJNMHSByT0InaBrDSpG7If7Y18HDFZMRrUIFqVkaCqdk
 1+mtbHrhFxzLyyCzZIDJMO2IBBUkfJ4rb2Gm1ETtL+gBsYTy5TYApMW/XUu3RcZwkOQ4dI/Jh0/
 YVdF21stbbGUEx+0d1Z+0s0zFYqON2mEItlghIudy+a5cPvezTCdctBAixCYDLAmBDIMsel0rb9
 qeRrpzMrRFHhxPsvlJmsj99HKWxG99vpCnjxqzd+Qhztn7OhD0lmfQ/Rfc5/4a+4Fs5XVMYt3DN
 y8NEz5VJF1cDpek7pew==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f4a47 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pV6Zj0bAzI97IrYWChQA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: EU41tp09-VUUNXC1Cj0ajCoadZ7kRh8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-117872-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ananthu.cv@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C6C372D88C

On Tue, Jul 07, 2026 at 03:12:45AM -0700, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>


It should have fixes tag ?

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..9ec7c256b80a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
>  			no-map;
>  		};
>  
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg = <0x0 0x892e0000 0x0 0x20000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg = <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		soccp_mem: soccp@89300000 {
> -			reg = <0x0 0x89300000 0x0 0x400000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};
>  
> 
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha

