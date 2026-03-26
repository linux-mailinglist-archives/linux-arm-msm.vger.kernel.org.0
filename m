Return-Path: <linux-arm-msm+bounces-100125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFIPNw5XxWkk9gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:55:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADAC337F17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69D003203FB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B87A2C08AB;
	Thu, 26 Mar 2026 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJr2l14T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TT4n3Gql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85349221FB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539493; cv=none; b=WbwpAnNkebN1bb7Pi80YO+w3i5XYdX0TtfFrEN3PWQnK4FOLn4zIBkTKOyMJpebToySV2OnZiInhCqe+Gl4n0cBjxRTR4Btl6HZi2Tyy3OUoLqmhIbp6b4NBH9G+AEdq/MyQAjTEUVvS15bHekQzyLULxJwJsbRUOEnP4QQUVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539493; c=relaxed/simple;
	bh=lLSeniYsoBWSndP75E4zyqs5qfewY+ASCyHOj1CT8U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMMLetlg0u8+QT5c9pT5n3TccqbKeq7uZKP4zanw6/lgr5QYf8wVCGxdR+oPRduPgvW5FP/DbdqV+jzRIA4OzL0GFUCoS3aJN0adQAuoTn7Pxh/9SUILKMJ/b7OTcXaONzjXJh+itNsX7nCxIlZvunqSFBVX9wTD1DdUoSHePj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJr2l14T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TT4n3Gql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9nZU1658576
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YPFl1KJhjzK3rxoLoSivtVJTdJfjHKNGOAignUCRoY=; b=YJr2l14TYxduuMEn
	/a1mL1NhjtrlkXCweoa+FA0vKAjJPisdslUIEUsmX/NVoytBHrSrn2dmKwfQqM6q
	pIEj5mTPV39/2L5qr+ABhqoSblO2HDm60V8tXZZ8uJYq6lNNVf4RGlFfbSmfzuIE
	k3o4Gtij56snABpnUEaLKR36d2s+cUpruP2IsUGEFlEz0NaN5K5LRjkz4FoDg3qm
	VQT2nUnot4qDO6i5XGQoXwI/aez4TJVmLdRM90ZeEzYmZpiah95S6xbmwPPDFS73
	IJfjBG7GugnTFwJggCKOllWhXfMTAM+N3iwPgMusOJ+eUXF8TLuZq/b6TBEwjkmT
	sJofkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1qadad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:38:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so36438991cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774539490; x=1775144290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5YPFl1KJhjzK3rxoLoSivtVJTdJfjHKNGOAignUCRoY=;
        b=TT4n3GqlnRkA7AeNSNNeJmkF3VTwmR8iubo6w9tUMV2z+3APNfGQAO1AdnSRmioku8
         hk1d5eBGYTM9CoRveFRY7jAdvydeev1tyz+aWyPfdU/eNS17oQEM9FEej6S2wJTja/pP
         L8epo4yTOh6VEL4/xifb4RMcQSO7obTKKOXbK3uW9723KoyFiWWgmRoC62xcDyqXivFR
         ISBr+MBClcuDAXUVSuNRsZ1MwtiLTpgI/Gk7PJqVQm8ZwJ97EyXP9GLiqXkDKtKL5Sx9
         Rf6O2npEME73VoVPkYkTWI/wDmOjEUAmq1jTLgWL9kmBiKh9mufNQ0Sk4ts24DFJvZC1
         0vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539490; x=1775144290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YPFl1KJhjzK3rxoLoSivtVJTdJfjHKNGOAignUCRoY=;
        b=RoqtdQGMWEErOvI142aiNYiVAO7XuI8TGimSWpFrXOkRy1bD87lwGLTCQSI1wyvcD8
         NLAG1/6taPUQnXlMnQFdcZh74Kj4/F3p4uiEpIdd62s9Me0SxeoWRL61j7yB1OBziNH2
         3KcRoMlglGHszBlRC01l1s36hK1TdozS8v66QIQxD5TF7Sl5qAeL9IvHfFmdYbLOIMp1
         kPMb3kDrEIZrk/zv65r7TsVs6ze+Z6DiQ/z+a3w31nn8MNs76yNcVp2ji2hA6cWJit2p
         UxuUeHe+iswcm8xB6Yl9awvXsuIaM/Lo/dmcAixIEzXMED6wHs2JFj55uZCqxe49c/9I
         6VbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj7QHomrRPbL8YpdBL70Qi0K2614NrioCHOnr7NfP6ZaDncUmkDDcOH/SxDRlzKzYlT2lkd6ly7tU+IjaR@vger.kernel.org
X-Gm-Message-State: AOJu0YwsA8FCvrMryHHjAgNhhZYZ4Xf/E5gNL7ug/55X76bo0XneeBhb
	Kh6uIDVZgoUCjVv2Br9Djgmn9IioXO2fJ64OUpBwRKNyvASvaED5x87/q6ln/LoCxbzDN/lAHDN
	xwAq7spXCFu/GhVHJZDGX7a2VGY2tss3fALJLs7hjFHA3nfYKfglO2kfjQ4w4A2+yRZDs
X-Gm-Gg: ATEYQzynUWDKbPdm0K2X9nIhZBA+DvREe1jDhLvrD9plWxGh6z7weiy7P6U+DkniXPs
	ki0O6wMyOSWLsTF/9fwoynTUbWWPOJ8ZI4GZoLKL0ltmv7wvSxT2J7QCpnlgX8GGA5Civ5nyqY4
	hw9niHOzLVa0TmY6qNCJuYMIAM1yPSNKtYZg8WoTY6+sOUt4To0FLPMdnfll5RyCjNrglEa91PR
	KjBAoNJ1pV6m9gBOzN1JkW0gNBUus+8dEc5hCXIewcqk2tevQlrEkG+CN5G8WlNDgeOD18SFwG7
	hBPUIyQ/HvfOUvswCj+QC5mC3VkmK6HX6qbnNgaC8IOaxZ+aBcLfXt6M5XNCF8VVKHAKIQU4J2/
	FEEZYDNvrbVKq+Gr48Q+/UngqA3jYRZk5eM/icqOL5nQT4q6V
X-Received: by 2002:ac8:1108:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50b80cabd6bmr88375691cf.3.1774539489671;
        Thu, 26 Mar 2026 08:38:09 -0700 (PDT)
X-Received: by 2002:ac8:1108:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50b80cabd6bmr88374941cf.3.1774539489036;
        Thu, 26 Mar 2026 08:38:09 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm9457599f8f.8.2026.03.26.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:38:08 -0700 (PDT)
Message-ID: <fd537c2e-3ae4-4c96-bad4-64f846f2f17b@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:38:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: extend fastrpc compute cb
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
 <acUzKYUCbUOIOrw2@baldur>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <acUzKYUCbUOIOrw2@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aJfiku7JdCydIKlH6DChgypcrBwhs58w
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c552e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=vFMI6QV04ZLWi53vWY8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMCBTYWx0ZWRfX/c9Tmz/j5baH
 bLwKVjPT+KnFKtlaWKoEJTl4sAAIW9YaaYEK8ot8vaOoXBCOk2jG7UxABCo34hPhJLju/uxff/R
 y5wIzMhWQ6G+5dsHSUXPxBJjqC+Jmrdg7ELCguw/a3XuSHsl4s0YP3s+jNYz9JFsjV2TuS8qm/v
 t2D872f9gF2l2JLsiMum+dPIZOLU7PCUAAzsGT3+4ptpr9ziKaoXhLuhtr79zsweoSik3XuaeKs
 9Nf0mo7sPyeWZz+AUHgMX6XFvd2mpbha/MiBHIsVxPvlhg5GQyffHtTJk9PfgF3p/NzJqWwRvxN
 vnBhKXDIIF3MR4If2ByWPtld+Mi0i1LELiEPhZtpVre5qlz6+htf9n47ZozStpkWVKRxDap05Wp
 sWgrGwYQOImIvGUY9aJ0BTYm4oTQqkX4P+kfQ2fyeMA6fw3BzaGgQWF0llEHpDpoDuVQEXb3RKb
 MxuivP2aNBRrBc03FIg==
X-Proofpoint-GUID: aJfiku7JdCydIKlH6DChgypcrBwhs58w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,c:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100125-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5ADAC337F17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 1:24 PM, Bjorn Andersson wrote:
> On Thu, Mar 26, 2026 at 12:58:34PM +0000, Srinivas Kandagatla wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> [..]
>> +
>> +					compute-cb@b {
> 
> That doesn't match the patternProperties "(compute-)?cb@[0-9]*$".
> 
> Is the reg an index, or an "address"? Should we use base 10, or should
> we fix the yaml?

Ah.. sorry for this, will fix this in next spin,

--srini

> 
> Regards,
> Bjorn
> 
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <0xb>;
>> +						iommus = <&apps_smmu 0x19cb 0x0400>;
>> +						dma-coherent;
>> +					};
>> +
>> +					compute-cb@c {
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <0xc>;
>> +						iommus = <&apps_smmu 0x19cc 0x000>;
>> +						dma-coherent;
>> +					};
>>  				};
>>  			};
>>  		};
>> -- 
>> 2.47.3
>>


