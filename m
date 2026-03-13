Return-Path: <linux-arm-msm+bounces-97560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEylJScztGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:54:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D650286678
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB82032C5338
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705C1218ACC;
	Fri, 13 Mar 2026 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0/f8p7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvdtu3gE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA28635E959
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416975; cv=none; b=CKPmVRjfkboHOpXaIZT4CugyPY54QAZqG1E2rfCfn24s2IdxBMINYhheQHy7yJnClJiAB/xCERaKgDFURExrUIpxv+8B0ZoF5ws7Q85ndP9ESfjZVWaysKTwHKKJpZrS6pEev+S9zloZf3yP+ggC/6M+QEvLHzSojB0eK8nQ1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416975; c=relaxed/simple;
	bh=ZM52gofR5yjzuJ3AdMUfS0gmcKkKJxWhjvHVfvQQZMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfTXuUDynacQ8Ii0VSCb1Q/2dfD+jU/gd2GfCb8D1m8wUYEhVCqQs510Vz/D9iZSkHYGOJ6+jjUgK6+TRtNj8B2swA72nWNUXUyeDZ/Fx8HfgQNmeHxu7x8brOlRsdbc1uKlPI/v73txLC1l4xbFknfu2G31hwyWIc2p3zQGomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0/f8p7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvdtu3gE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCtQmA3230023
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WSj5lQ9aMzbJTDFdtGczs+50
	8xvStrruA5rEQ8Dn7dY=; b=F0/f8p7aHq3CCWMCaYqM2lm56MD4XMrbfrUWztRW
	NhxldCZN3+ppZwERE8Qkn6aG52O8wkNJNyKwUjTyty1ArRz+TeohzAVBFhzvU8Yt
	uOqa59RX2zAIGVWetGck+4A8/Uayk2olBETL2inXopLE9UaGarmeIPG+fkZUl1y2
	zzCs4rT/cyz2/+d+CDin53TRZ/99KSqkYIZo1mNGrUJkX0veLG/tM5zQdRowqs4t
	fZKJTm81AbqRZP9GUY+Ry6yHnpTDoSH5IXNX0Z+8Wr3mX5GASI7AG/NNPMc7PTX7
	14+68Aai5Twd1WlAHqlm/YAgZEuhE0ejMZ6A2qkF+sAIPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7jteq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:49:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1567205285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416971; x=1774021771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSj5lQ9aMzbJTDFdtGczs+508xvStrruA5rEQ8Dn7dY=;
        b=Fvdtu3gE2AjE051u5zlP97migIN0GgxMM6UzfniMWQvZknkbLsGbqfi0NnPfCeKc5q
         Qd4pEf0pzo9Q4l3H6U2ahbKe0Fc4DtwEc+2xPQK2Wjm0g60K1NAjzRSwLI+wCnu5pTH8
         H72ZWFqt7lISHmV4ld6xZ//FbZB9GIUurYKh8LLV8W2o58QaP78w+HMABZq+6PoTFb2n
         b3vWwU5zE1pJdnZnUZYsdbz8SLcBvJIwXMxSCPidVsySTgJ87rDaCfTcAqdKGbMheT+1
         MUoElfhTrDKX8X407M771Z6fg5upfl7sTM9Gz1hTa8zvbfVQkJpVaAlsiqYREiWLhuCT
         cFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416971; x=1774021771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSj5lQ9aMzbJTDFdtGczs+508xvStrruA5rEQ8Dn7dY=;
        b=O8OjDI8kYoMQbxC+fFLn5NxAyO78hphHOzeWbu5B006b7rGoRbY84SstS6r38m+Q+R
         2dzWS7ulfBda+ZFJgdOTyt3q2tqxh/obPpWiVupLEeF47gsAIulr5kd9pmuLw7J2qCBS
         UrVfTPV8QQP8RpubPQgfKNmQ1tUC+X7Jsj1hdURqWCitKJVgpcTJ2Mb8MyfXCcVAqRGG
         QdZeClh1ode4kOExtuY36CHdqODoh1tHiEFvPQuEVNApT/fh+SK/3XutV9rxMXLmxu7S
         xtM+FtvqJVFyg/xIQYkBiY+I5CaqORZOqfqYWUvO9fJyKWksG//XDpY06uFPe4yx9G82
         IKTA==
X-Forwarded-Encrypted: i=1; AJvYcCW7GDsNn6twAiuFQVwHt69SOeimxSVD0R0YckRJV4xxKpbmVjtugYmErxlMvOLUKhvh6QobT5+0Icy8giYW@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhDoN4lRjnhhQzbRIimIVVCxSVkzkfcNhgfH4TcbETumyAZHm
	o2t5952mane7yKJltRKddmFtJ2emueZgUVm/0eSFO7XPOy/pnmmt5eW+PY0Q5Br1lpbzVADo5eL
	SQmos7Z7BbSeGp9YRShMKFC57zDUc4BC6WPzHAcZZ3bFU781kaFw0V6Uk2pCDfQZWJ48l
X-Gm-Gg: ATEYQzxe+HNG5iUK07Dcs2xcaikDdncdO6pXnRIzR3mjzEWL1C98kNnWazhkBwFgdu5
	2WAEzn0Jo0FoZT2B9EgLZW8Q2LG8Q4fccMIxm5Vr2ECll91QkLSw+h/SL/LKV9iZpu8RLIYtzc2
	JKzthCdDi/mUHA4xfmD+MTtENlTMM4DlgcxicMRQqGK60wm+e23awwx6jHtKau7V40w0eDi9etj
	93WK/Ud2GaknqV9C3hZYGf2iwhQ2AiFKRmEF16Set4hXsTxuVUBYNMrkT/WBJTkaG3pWNfsC5IL
	YtlRO4/p6cWK41NOZqI3XBJkjIhTG2nCWIbLWIhWPxD4zxQUuSpxMqv0jyJIMQNeij3qyqB82AG
	d6hqJZfEzO5bFBxbDmFfPYGG0+3ePDFoO/gwenherJRD5qgI4Qf/ptnQGLkHOmgqqy3eaaVQloC
	o4n/HyEt8BotUG0KS+A0t8XqKK26jdHuTHJjU=
X-Received: by 2002:a05:620a:cf4:b0:8cd:b60f:9ef6 with SMTP id af79cd13be357-8cdb60f9f68mr362760385a.16.1773416970999;
        Fri, 13 Mar 2026 08:49:30 -0700 (PDT)
X-Received: by 2002:a05:620a:cf4:b0:8cd:b60f:9ef6 with SMTP id af79cd13be357-8cdb60f9f68mr362756085a.16.1773416970410;
        Fri, 13 Mar 2026 08:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm1613682e87.18.2026.03.13.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:49:29 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:49:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <5skljak27gm7io4r32l3hbhrce5iul2bp57liujvdok7aswyva@z5kvdb5b2n7x>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FaBvsw19f94kNT7jEprfPxZpJ2-c8wMP
X-Proofpoint-GUID: FaBvsw19f94kNT7jEprfPxZpJ2-c8wMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfX2fCqf26iCDtR
 A46svf51kTZiRKQ9+8k11E2EqX0BlEZXT9cJQSF7pjBqUEgWfPi7pfV+W5D0CUr7SOeJK6ZPtwU
 G1fcynDNqfAnGXuKgETdT/K4ZTswxrOiaquq8saOuZl2P8M4pv1Lrl+njf2eOqS8LyzPKFXexdn
 f7iL9UI0TgnEEws/O6ozg5x9yj1XjFQyvjC8slPhJInNkbmWVxpTFPIdAXadhWnmY8NpDNE1pfQ
 eeshJpbDD3JqNOqta1rvUap0OTImXuR2MFUv1VLwus0YamE0X2+5gcefdTghpJLyFH2wnMdL6ui
 Fbsw/u5nTov5mlQZDwOSH4P3DBu12ecsF0XEYFk+4wk6sAlExi7k+dgoYEN1Z+tBOcBZ5+VKJJH
 iqLqyAk3fmK3WLBx3nbm552JvPP4GVLKCmF1vpvtg5zQEk60wyFXBn6IVsBfoieg/f9+S9Yfl+1
 SEW5Lqkkk9s5cx2mzVg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b4320c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97560-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D650286678
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:59:54PM +0530, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

