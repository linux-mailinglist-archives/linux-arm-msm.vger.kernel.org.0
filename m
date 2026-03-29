Return-Path: <linux-arm-msm+bounces-100610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PLTLVMIyWk3tgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:09:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA0351BB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF05930054C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EBA31E856;
	Sun, 29 Mar 2026 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfcPVv9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjF3OHjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC631E83D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782544; cv=none; b=QxWzkgua0LF6q7H0YZTSMZbIukLbp2gM3mplIgJ0R69BQ0Tz43IxZxnAm/pQE+5J9+8YcTeXMHoOlcToAIcr4iRsPEWNBYCKvw2Tff2Is5Y8/htzmRsjFl18z9u1H7wZab0VnbRQVZ7BrtAgLtmJafHbGC5dz8jJDLgJq5B4hCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782544; c=relaxed/simple;
	bh=KFdaeW0ZlVAor+j9p5RC5vqD2rFrhuPM6JbqPJDcRTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCF+qqMXuwW8QJHWt0QjtzFL4n5vNcI3JFf7Mqyl/Xg5C/OJ6izlGWEiCm3xuxZaQi+MewUPg0/lWt5iL6fGjc9LrEnLRwKBgaemogONhHOetv5/imtEG+vIWtpzOWNx/L52bcJXHX8MT974fAsh+ALFNH3PLlyvORPvzuWLvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfcPVv9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjF3OHjV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhV0S4086214
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCjfDWTPSu7BA8044iKcVbUE
	HoU8+6VbM9W4QsjWKY8=; b=WfcPVv9yts14Ft+20iRLnT4rpEyma2BbcYrwjDbJ
	L3Dqe+FHWlp5QQM8Kd6Faux98F3MAE/qNe52c622fFaNbunkmHaFRp8aBQM3O2lJ
	vG5foEvnRRUsGYtcxOvhB8kQO8AmdpOcKiAtNcfFBQgsgwt2RFkVj2qS5XRx8j1Q
	636MNsMXeQRK8A6pluHs93ZHu0NF0F4HydlxqOjI0kqnuTNzHCyYsHb5QGLUppI0
	Va9+9TGFx5Opj0nnc32dKCwBmkotNypaXA5B4N0huebNF9KXNRVyeV/Cz6/twoXg
	bNEDT/Iclu37Q/cBNvdJKI3NvPRaQxOyuJmlkno+2V729Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67712kpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:09:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so92454241cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774782541; x=1775387341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=;
        b=KjF3OHjVrgPqi/1KfztjycwfU/oSfro+FL10POhaAXUdQG5hJx+pJArQ54Z1aHueic
         q/qbpYk4QAQqXMldH/pyZjENhwIq90CZkTlK4hhGdVkltU/HyA71qxKhiCqYNa/BEYxd
         zVJiWGWLhwkF7cUUoIj2/2jo/3CEwdqnaV9SFEGxalFsOyvLCnY77EYKVZFPI5zAKuRY
         7AQ6Bwk7RMOmS/DpsFawswP5lBGw6FjyH/sFFurHDXq2vklq+KcXxduGnq7Few5yib7n
         FiEuHqpo1M9zPtUA/ocMRDG6rSt//7bVJqndSqoeOdyEhUhCzOGnJcO4Z8JHiOm9gixt
         6z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774782541; x=1775387341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=;
        b=YdtQ+uaUkYFV9SEAcYkb4Sz0C9THkXGZX1Kr8QiQBg8p0ciaJsUrLkwm89qVRylafK
         d/LbA8VpTtE2h/3F8QkI6TYbBW/qcxtQ93qcuWnOdNQ7YilgeoWrdig0ynCkmZNjbPJL
         kKA1MRqFn3PwwCA+ylhaPlFntkFFWWV9B+oqs+qXShYUMH6QHYGz1JlxephaBd+UuL9F
         e598IenRyGUDeMAZLGtTfLfiR8b1Thf/NBCxho7Yc7Iy+7FrsQqLgC6Hsc09MjSr0VAF
         sU5uf2CtvxNSxR2FlLydoPd1d1ofY8D5OKFfGwn/Tnoi4qkj2oVnI5EjPdRe/AuLXaAb
         gErQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5tohHVzJzSAKS2Udo/0ZSJRr0atChC2Nuwwe/qpNSbtfJkYcxrXeHx++WXNWSmKMYzBRUzPmDil0DI6UM@vger.kernel.org
X-Gm-Message-State: AOJu0YwicO2TYZwAHkhWrdHj466x98TvkK9cLSuv8dQdNxgsi9l3FdSD
	qKJikGHYpnI20cx7OgTY1zUNJ9XrN/8HkMduuffE6kTgeFz11OSuoyBYn8H9Taz8V1MbfoURi0i
	BIQ9TIFYiYes7HAN1y6m+2GXJU27teRvLjf2kq/IQM4ezBTpJS0oUx12Q+KVOTvlJ3hBf
X-Gm-Gg: ATEYQzzZJTfzTbSfzk1czKPybbmTYUD3LTWZZ7aCq9Vhoo+oJg9qqj2kZ7aBaIwaAUm
	Jmu74bXrGUxG0JWyh1Rz+S+ROMDZx2q3UhPfvrG/JHHxSFQrVWqGim1HukOihqXzdlUCYQwlZaj
	7CBfJL6ZYwrtgWX4UyyL2fw1lfithxcAocJkwuqfuUEZJEYIdmBmdRxtWku+8w4YaeCHWRpZsIz
	OPeWdAkHQedOpxr1oCgAoUKgB/4+i463L5GxVM4h9yK8Gh7+8Ia6qN6WxKgqYmMm+NSqBB5+zbB
	Jv/cu+topOjjYt55P3agrHsy+iKU0LAh7crVeaMiKKZ8xmH2WrPAcqdpu4qiiPdclYNv+NloYUe
	tbRoPineT7itZAtKXiRKn/jMwtGP7yZ/i81WOuG6gXEu32L7TYFlrecUPFqEI0Myt0jX9Ms0hhJ
	msEpziiNMMKWF+kxEf0XVBsquZFXJlZx6Sl0s=
X-Received: by 2002:a05:622a:64b:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50ba39c1effmr120235551cf.67.1774782541477;
        Sun, 29 Mar 2026 04:09:01 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50ba39c1effmr120235211cf.67.1774782540999;
        Sun, 29 Mar 2026 04:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cc1sm987221e87.28.2026.03.29.04.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:08:59 -0700 (PDT)
Date: Sun, 29 Mar 2026 14:08:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
Message-ID: <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
X-Proofpoint-GUID: 2MnW_cjcNN1Gyk6dZ7EdQfY4F01ChiJ6
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c9084e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=S3gobNufr5BrtecctxwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2MnW_cjcNN1Gyk6dZ7EdQfY4F01ChiJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4NiBTYWx0ZWRfXxf1P0PMhF7Yy
 OC/5ZKs42+xAerbWqcjlSh8mdJOVYX6c1r7MyDi9lvvnDOUG+8Cst6ala3BxD/QdARFVvMnmgNN
 ZLPTyn6B9/iBppREsCvrkHVCC1KjDQbdRf1mRtYmwYZs8FrONST1juMSFrUXYM9FC+AMV8GvIHF
 036dvitzKrN+mr+qazU9eru4YHeUKp4S1MjHYUKi1SZ0LaV4OqnomKY6DaDPFzJKsSifw8lDI8m
 hMz2uEyx+rFkYGkrjmKvzuId0WB2xS/YAkkH8AinQZWRrMU0oc8eufnb7WrHDoJ20CjWKmlsDY6
 6OZhK9veHfxUhdqWfAKvU1SqTjM8sForwgJhb9jQ0Kz6q17/xMV/HFSR+iP9teGiePHI612FQWC
 QI+mZZULqA0g1RYoIF65+9yh1uLjcREpGm1lh0ZycOdqDiOeZ43v8Gxgq/gXe/k7EH1OV+RRs1X
 7d4v5ON9ik24qy4Z9Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290086
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100610-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5AAA0351BB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 04:31:01PM +0800, Canfeng Zhuang wrote:
> The monaco-evk mezzanine connector supports a robot expansion board that
> requires UART6, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART6 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..0b26861eac02 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -21,6 +21,7 @@ aliases {
>  		ethernet0 = &ethernet0;
>  		i2c1 = &i2c1;
>  		serial0 = &uart7;
> +		serial2 = &uart6;

What happened to serial1?

>  	};
>  
>  	chosen {

-- 
With best wishes
Dmitry

