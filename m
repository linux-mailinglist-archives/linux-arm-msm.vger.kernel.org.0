Return-Path: <linux-arm-msm+bounces-109604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C8eAyMXFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:32:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D93B5C8A62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59591300A611
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32303E6385;
	Mon, 25 May 2026 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3F+DjvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTIeABVk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177823E5EEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701354; cv=none; b=jANEeLjPhuMh1YzBdohiEw8vkz9w3u6wwK2n4Ftl4R2MKfvAzk6L8dS+trfFw5bTZrseitYfV6P4At2O5WFzykvu1WYM2csFmXj1i+nOQ63ix/tEXBzuJa0BA08gHTtLrPnPOYiMDNTlTHo+WnNzvalUzvTPFllqgkgXuUA5aJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701354; c=relaxed/simple;
	bh=bgx0puC9B1x58t89nsIA/Vu0Vaps99oYM2U+hYmCYMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P418MYkNy22dGrfCZvSN98lF+BDjNkOiuU68spBpI26A/iIS/lIcutscApvdGO/alZvLTpS+Z9tg4pt/4wc6PDhkWRMNDoFsF78EWxLLu1tQ6H33AJvwLDeQGkbt1iNnnEZ7IOn4fJYvv0DoC7nix9Mbr8UHldw83h3LMXlVlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3F+DjvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTIeABVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9PXeN2573613
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XhFILbTxtLrUyeqKqIsvkPpS
	bVh7DYMyBkYHZMO4Wj8=; b=R3F+DjvRnhsO+sq4eitp+mA6txC1Cxi5Q482SZbH
	5seK16JnJ1HEiDONWx+v2vXBvr912j+xfAsa84iWzzacHcW0IZFIBtoLisa4mqpl
	yoDh4gSwBqFy0+jFZUJxcVpccCyfW2h+wAPE/+1Xmqsk18I+W5+754gFr5y4Fc8p
	lcm3JyEDRaG05Q6wWbFjN9NuIYtJhtrVMr8vlEXy8DFUcrNwl9SuOYIaN0dzYQed
	1YFj0HwxWisZT/mLrg70h2attw9Gk9U5IUsc2n1Z/nmZBEE1kaRHjOCg+848303Y
	GQVEkqEnwa7lhocFPEPZphxctkmeZyQWwuvkRK7cQ2KVsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3dyx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:29:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d51ffb59so26225051cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701344; x=1780306144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhFILbTxtLrUyeqKqIsvkPpSbVh7DYMyBkYHZMO4Wj8=;
        b=KTIeABVkWj8MA37U37nXBBcuMGlhAPptDp9/LNqa+cEsSRjgt1QTEYKXNDk+/7zark
         A4ZvCeOGuqedpjZ5yM3CjJhXJldJMPb11ASWZW5mEXXUNiT8Gu+k1UvcGbhcwOctwah+
         gs591tERPtFEKiQOLnNPm/rQgWjDE9692C7BGL5oLqub4fod+OlYa6wBaUhNizAz5/dk
         8WNu1h2jgUD+N7/6XuY+pWZcmRbfbnTWmvfzXcOQYLDuOrM0xqAaSFZU/PDCn8V7vhsx
         DKJ5jTeu4KdcW1PG5cKFoDSbPNq031dXQp6zXDLTuRZrUPOBVo61ffbTOrk5/SddHevv
         nTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701344; x=1780306144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhFILbTxtLrUyeqKqIsvkPpSbVh7DYMyBkYHZMO4Wj8=;
        b=k2GQswJOd/KOJlNL2n5bTq85ez+68dnO0fn3Hcf2LrKu0TXDovhCPSsrUqwSeL3DUt
         fof/7rhU6m8pf5/UbDYDvVxqxF9+0aedfBRn6XcyBlFvkGpCT1ycRj5jDhw2St5QwL3G
         NzFNIWOlveieZEZbd9Apzd9pfSu7gSuR3daF9j5MAJOPCnJdjxRByEHVcW/lvge7I8vy
         Q5P42Cykel0wpkNdj/XQaxEPq44LfHbUYk0xepvS5cxs6J8HYRPs+tgMu2+lZZtnhwHj
         BHT+vD4OBGB2MWdKcM58SZbGWJzErOpAhc1CqEH/FWwVpsLPgeadHw/OqEWN4nAliwDH
         WRzw==
X-Forwarded-Encrypted: i=1; AFNElJ+xghrFnLXBBM9zmlVPmivX9s5iBp7Oq3aANhUGxhum63gdEUkBlUgi5A7+9AuHFGg5o4UFoXyOc6hOzA5K@vger.kernel.org
X-Gm-Message-State: AOJu0YwcpzqfekYoX979m+KK51tW1FoexMfJr5s73FP0tbICbcO7Xj8P
	jcz89vKgJgOAdORI5i+xWpvCG+H2ofycI7HnSobQmaYybfwhjuTo/1Jl3z6Fd7kwQ4EMxNbzx1i
	BDLUxCK7obB15OmIOP08Yh9CCK5ZjDUixBKQ/xgq9S4Oin8m8C9BCP7Ru/qKqRxkf4vqleC0EFD
	CGA7k=
X-Gm-Gg: Acq92OEocNDB/l8ghBrNis57G5yiLtcYiQFZbRZA2+vnmkmx8cpHie5sJqkng4kHoEv
	wIU83QZ9ccopJmeklfqCSiQbtaMw3FFj9jZavPkTGCCE3/d4AfYRvEHArsdavI7ajg0hib+AJPm
	8YdTUclsK/NHWHZ/mTWRChXfl35zxEHECCxrHj7T6i1gVOJM7RdCQ7r/C21/dl/f+Axclx9w/DD
	LtuNVY/07MTTcQlda2oW1+E9pTpVN1R8q8bhWBcehb0E8RjkEMsfsszpHGBb4eA9wZjhEjydyPO
	TdhDUYIfDJa+dNeDNZUHGFzpo0kqtSacaIkz64R372PsCCvkBw2mDlLRuQcgUaGqzZkTcFJB/3S
	eWIJbUoijD8Z9CSxth+rPiFOMslu+bcbJKS6Jpvg79j62ESHYcQw2Uf0RcLPrl00alJStaL09U+
	C+FWaSMOo7/YttAotlGSG1Vj0tYS3lWT+dGbo=
X-Received: by 2002:ac8:5912:0:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-516d4376f00mr168713781cf.37.1779701344175;
        Mon, 25 May 2026 02:29:04 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-516d4376f00mr168713451cf.37.1779701343752;
        Mon, 25 May 2026 02:29:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7853esm22438921fa.14.2026.05.25.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:02 -0700 (PDT)
Date: Mon, 25 May 2026 12:29:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 10/16] arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP
 and MPSS
Message-ID: <xq6vkeer7c32fmmofhu3yxnwxns4mn7umzwjf6k575m55s5mek@zrjiuo3eiq37>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KNip0Iz1vVakB3xR3pd7JD6nJ05azEjk
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a141661 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sdsj3k5SV4FyJC0wfRUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX/+3oTjbe5Ppg
 upd58GBYB+q5yd9hpJ3l0C0yxqJ+xsm+zeDiu1gyhUYgJHnkrkuA1a6Rjvl1CwmDCKDHKQIyjRR
 Ry8iiTkGsziklLMXSMqsOqPtyDJmLgJ/smivyoBvX+5K1vtl37isLjX1HxrWOb0NEC21FJTHfxw
 m/DnSYFz4hPEsF+GKBh3OCAcLPV7rIc1o01CA9cN3PNKVLzgpGfN0zMG6N1sOdfkfLY9uFJBMRw
 1LmDYe3NqRFQ56JsBZX1Y7oJ4lZBpnoYtd6A/+rFeO9NubZfUdBJ9EmsQ0M5oagLs+ywaNM1aeu
 jrd7mcxvXS0y9SUvL+D9fwZtYRJkhTYI6Y4ctpVqkpolxCWpVNVZfYdaS/pfjyInN0Uj2eMt2mp
 veMMkwwNfh0bAn7/OzEe7IA6oZbyAivCRZYfPtrrd7XcCMiuz92NKobX8h/tAzHUgPKrY28ff4y
 A5/s1XrGMvNzXOP5n+w==
X-Proofpoint-GUID: KNip0Iz1vVakB3xR3pd7JD6nJ05azEjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250096
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109604-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D93B5C8A62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:19:14AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c..b112b21b1d79 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,25 @@ chosen {
>  	};
>  };
>  
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/shikra/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_lpaicp {
> +	firmware-name = "qcom/shikra/lpaicp.mbn",
> +			"qcom/shikra/lpaicp_dtb.mbn";

When can we expect modem and LPAICP firmware in linux-firmware?

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
> +
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

