Return-Path: <linux-arm-msm+bounces-105372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC6XKxtg82lT1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:58:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D64A3C53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2950301FFBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC3B429828;
	Thu, 30 Apr 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw5EZk+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOBTv7V3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A042846D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557476; cv=none; b=Ylo9kkDQMR5Z0613ThXI+HN4OZKu/q6WrFL+tJIpmKW5q3l/GGiXr6sEU+zHAF9BNgUw+QDJrjqGvhLwLdgsIFQXY54WFshyCzzhuPo+qPzV0RaPE60m81SCntdCqUeHi3OIczfTuIWxZ9d5nBzgvLRB2M9VTr2LIfY9VtrElcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557476; c=relaxed/simple;
	bh=fTxKIYzBNQgc7bk15MwsEQOCtxVJZwEdP/bFVuwu9pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaVydSEur+LAvf5/v8NDfo1XMZsFbsjAkOQnum6cp6pNDmAz4ozNDJT+MdeCIIXrdTn33YQyZuGoNB3SeDUZyv6QDKgw2Cs4FSi+xsKJHrobsXM4XmI6PO8XWnQ8Dfe2ap0gqyAs9/ZLlkFTfALY4zS2Dhu9KM8gkZOU+YzXiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw5EZk+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOBTv7V3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBv5qT3885212
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=; b=dw5EZk+1sIDgkvL5
	d6+34W+ajkbgrOIGcUOR2hFBaNE5BRoflHK/PZRwv54wkB/KovgGNd/8Qw16LyQM
	KsSQG7DYgF2mSm21lArz4LSzAQIjuzc9Cfk6gva1/U+ncn5hdY80RQNflqkM0V/x
	oPaX3AMDpEAexC2BTxwlEfnMfzTN893M+FCf6HLw1haxU92VplnXQBABiUwKYmDH
	0zY+apOrc0DAh1BwJTWYSSaRYHpIzYpmH9UEu2De2ahnRaTNmunByvkCaMNwNvRK
	BLmX2A2UP6Tju8Cqyry37nMVpTq48Nms38ApD7bUj7c1/25PdEOwqBuGv1HJWji6
	rGY6SA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmakg64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:57:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95687296dbcso60729241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557473; x=1778162273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=;
        b=LOBTv7V3U2K/oZYTOmId2OkWpzVxYEb+m9Bn4SHyvwzi7uKPgvwe9uto3WCwDG6l13
         8ba39ozlqLXd8ARR1gPHMUOgYo2raFoKswjhEtnG6Aa2atpT5GMxWyVOOivws9aoOkbd
         5SGWR7HcpHkCOmtA1Fzg5DlgVhkJivi7gorJkLkHkf+k6DEVNyjdeGhYHoO2H3oTWYPh
         wtkS+OSn1gtz9gF/LGWORhn8riOgCdqYFqbdwB42++QsBUC1xQZp3K26XHXeOUmXpcse
         gJDTzSvz99rIeuYSgFZH4sD9j7+F/umwWAXlxO7LAUi07mzGHgpCgfgqAztMh6jKXl5a
         mb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557473; x=1778162273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=;
        b=nMNjPjk5edDbaEUP93M8HmMbYXkk5phtJtnOefftx1JOYjInQZGuoF6j/xmrzkummM
         9CLAWYdd7dnpDxoFDzs3NRMJPuATXIOx4tOF2l3YjwIuyPZF7x2r7ef/A5fvYrqdMRCm
         acKpzDxnPZmdfPFZEupZofNHABlJ92LWL4JBISW6NZgJzSUt0SStxNo+1vDMClAin6Xh
         thKfI8MdixSGD+gwsbrx7X/xK3ow0Thk7U3w2kWkLzBA/fUJS+16qrjfbEYm6QGjIA5/
         f/mfadXbHas31uxkWYhOAT4jfsIMPh2aRPmFpe94D2zVpZFvKFdXBfX7cY7tc7u3bp4K
         Xkaw==
X-Forwarded-Encrypted: i=1; AFNElJ9Zsebv5RewW1uULFKcbTztHgw9dUmHIG4qqEuNDtLU7b7zTU+zU4ImXzz0+nXTp/GC4CXi1wz7QZs/Jre4@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvDLDbN0Fd5mpbGf8I3oW4brhJLpJYkXQNlWOYx+WpYwYfD9L
	l8zlV9habtdxKKVPu1uGlsIyTwDAIIPflfR9YxdFGImIt6wMmXanKWK3J46ypr7eIVJ4rM5CJSN
	9mgh94e34n2HSy6cFX9/KIgdLlJ2A7vp9oLmwOh95HTpF+OmI+srcTIh2NljJszmbZ+Jm
X-Gm-Gg: AeBDietj4eDZpp0BOcW3GJeT4eSqx+Sy85NFoh1o6GgI1D2ReEujmiONainxsO11JfJ
	qqtQp0g5XmAA9Nrv/v8XXR9Kzcw+0PEVBVnkt5hdbJUDRMHSvNGDLSia+/P5OKNujzO7PMYwHHv
	5GIieiMpXjnI7UgAN/0Dg5wGMrnlLGQIqu5KdAaADYJT7/VEAAkapc5YWIhRTNomOCpwp4xnfey
	SvjO6tdpp9TLYI4u1hRA6cec3mmyEwIcCM/t0AQnQTHkxojhLTSxw2UQKPjR4ReFGRD6uNb1s98
	/mB6g6eqXKDXG8S/4nHIwWB/XJBHKmhO86cVdIOaHZfliwwemp9z87hRgc9tOiIInXBePhSkaMV
	OB7cQ6jpMtcfbcG4/6dk00/WCFecR6xcc3shmugo6a95r8Yj5dsFH6ck34f9cqhFalJLh3aVbsI
	kBNTJVjiKyeLb7UA==
X-Received: by 2002:a05:6102:214b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-62ad2e4040fmr440904137.1.1777557472794;
        Thu, 30 Apr 2026 06:57:52 -0700 (PDT)
X-Received: by 2002:a05:6102:214b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-62ad2e4040fmr440894137.1.1777557472265;
        Thu, 30 Apr 2026 06:57:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm240296666b.41.2026.04.30.06.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:57:51 -0700 (PDT)
Message-ID: <05b25bc1-7590-49ab-abd7-7cf587845bbf@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: qcom: agatti: Add dai@3
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BUbVwZ6_mlmOEBtTYhuGqtWF_cy-l6F_
X-Proofpoint-GUID: BUbVwZ6_mlmOEBtTYhuGqtWF_cy-l6F_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0MyBTYWx0ZWRfXxVvffG2keJ7D
 XXtR3P5FU/2tMgbROJ9K+A20BLpgaVD7AxRxbx4wTyxQzjDVUMI95o8F0vFgR0lRrw5SJ7GF1tu
 dP6Vrda3sBv4uL+b32ZZsr5cdIZT7wklPlFfcN2gIz9P7Tt/HtCF7XnovyyqgD9+PcKSxYhLT8e
 gQo2R3SeFpqOux4g7gMrDGoJVmtFuEmTjSULO7Ju0XtD1DpH1wctoH8Bw3uu1HN8b4T+YWH5Zbk
 OlOVoEetGaF39Go+NSiNgwHIB7+QvtfiqqLTh+GVd6ZNebZ/jClVZXLjU2iytjxeQq+MH58XRSU
 JUYnH+L71hS4NHKWU82Z6fRmwHt/9fMSWI/5uXVGzRrtQpIFpvFTfOHPKzZbUyCHF5vUfpVfgYs
 FMNtQ5Yx7dwTUnR98OqkQknXkKKuDbqrfnqejN9Layka3fc4M6mpc+8xTX47yF/OlmhAaGj6y1/
 uNYwgX70KsEKs41JP7g==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f35fe1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fu72_7R4e9LhwPiyXh8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300143
X-Rspamd-Queue-Id: 466D64A3C53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105372-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> This will be used for audio over USB-C in Arduino UNO Q board.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

