Return-Path: <linux-arm-msm+bounces-99205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UExACj0dwWlaQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:00:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8B2F0B40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23772306309A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC5392C43;
	Mon, 23 Mar 2026 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ml0qEZ26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPEUlz/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC363932C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263049; cv=none; b=IceL03HsS1QYdg4a08Ux5WAI4SRWyw383N9D+z67fwsCp85C725VgHoPAQP7AP+qiqzq7cR8eeMIZw4d7+iMpN1g4ZFKLPz/fl5IrM0YINWFD85vZC7L7psu3AYkR7L8h1DjW/N3Qody4HeZbRbi299b5galZy6yCfW+PZcwRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263049; c=relaxed/simple;
	bh=ESQv9swMgF+A73SZiIV+mK+Zcl4cSN0aeDo49vaUpfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkR7xzMsNBz6eBcEhcR95QE8puFv6V90OPK2UGQ0597bcubL5mRzAaW7XZIirbGAJEFViVoMPnOcYcayDga7soqwTLesNrgrZ7uZlK9HuDLyhV3/XqZXYs6Y9WbdNa8NFGDRj5pXDDDOzsUKCoCsz2joT7f7cU6qAtDPm3+b3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ml0qEZ26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPEUlz/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUUt1627059
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS3W0Qutu509HKHl+odXAY9S/E4l//j+Ms9boQGWRs4=; b=ml0qEZ265+GEaV1x
	E8Sl+M8YDBpFj2z59ALVEPdaNaawHA2foGbqDhyA22jUD4Sx96+EXEiAiDzgAp2y
	8lxH2snVfnWAx+vyO1VXPPVKFaVZEiN+xkwCAeLYtlXn8fOAsOzc4LZBF+UZLpaU
	PLfOsxh+VYUOUXCs1rQi8QZB3mnzgXT52euB3HT0oTAdcxp8MdY0wsKQzAgAQuVS
	a0K0q7mz4q69pvbfL2XCdyYOQqgNw5DbUPP2LLxXc8xcShfwKDtOTyEICT7zLXei
	LRsl50Nw249aBE542Ll+2Bkwi1PDKq3J7uljTqcBf8BReYh19p2O+sxRW+/hSTZr
	M7paPA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0mc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:50:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fcb63705so31649316d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263046; x=1774867846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eS3W0Qutu509HKHl+odXAY9S/E4l//j+Ms9boQGWRs4=;
        b=HPEUlz/CuWYHtUe1e7jXb448ku0pVng7tAhNjz/CUx6jcUJlXyojx/BOuDwkfdwUMq
         5fR6oas8voOEA3vOqH9sACbiyQWJxUxcXaEqEiEb4xljQ8FMUnGowl5t6LW7M4lpJOYb
         CrJpRCvHgmI35z96wO2a/wej0tCc8eee7y1Meb0dM/RcMMEDrE4c/4xWAX0Dx3YaE8ub
         Dm9XTrMX+8vp6/ufUz936kGICp5iMDIH/G9iST3w2rFErooLTQWPP3DKtVzxWyoBjHO8
         oAsqcmgjTLi2+TcnVsDcCihKLullKM2OOYTXAW0+aPmGfFzOO95fAGXV0gN/RoookAbU
         oaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263046; x=1774867846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS3W0Qutu509HKHl+odXAY9S/E4l//j+Ms9boQGWRs4=;
        b=amiYsjXKiW7wZcoTLDoGaA7D7sBKQLol4QNqcJMH8OJP1Hed+fc5pJ8eK37u+qSDnv
         Ro2yt9wle9HcrSwqzQ7eh/IDp/1qexhfp4Yh6+CJ3ImkdnDhHdbrYnLkE8h3LIWNzkxN
         6adhnzoKyc7kV4D+z6pd3A+penCt8jdJAGfymqoSlEaDR+nUf8KgpwbLE6mjPrAgM67I
         wLyP0xv/JneHQP7u+MyK3MNoKU44JtgwgpwSdvh+i6ldJ78ExvzmbXyd1pXqTqQFzxpG
         sxZH0B62Hfy1kpfnJxCQVcz8biSNAKwTu7PEHFTixIvCyL1S2JDvs15tutFXTfW/zU5W
         VDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5qDk81inq/7QBpZpNiR1OXjS2sbyD9zBxQSNNgeqaPma/DrX4bohWTcaPQYg3sEyLiwLri8jkWTRSWljh@vger.kernel.org
X-Gm-Message-State: AOJu0YwLqd3AUwo1iGe3phYZ7wg33lmJ05BMwtsTjUo18qMUL1p41uU/
	0NwPnJMf8g/6pV2c8n0L3SJaEZSTMYzctgpLNkRXCCdh86WnsKobcGA94/rUIMa+keghdagjUT/
	8orCfMA36xn2RKqnsCkxsT2ju3HKUypDy/nm7IbZQ13Ztt0aQk4Sa+HTNuKyHmr9bPTPQ
X-Gm-Gg: ATEYQzzQVkGxHocjVuLIvxtHoOC9XaOTu2XOKDy7ixhP528/25b2hob5mybCuQsKBCg
	HZcJPAZnxWnI/4U7rqpoy0I//jjPDTofxXXCR4U+00X893/u8xB2Om877BcnqSqgvJ4WFyg+8qR
	wedxMKzTj0wNzgU1eU9C7vg/A+pmbNkXccqE9qM5mkXk1HKsQMxmtY0Z1C3/+eD8XzyHW43+1BJ
	MXTE79jICJYhSRve8cBar1fE3N5ffpYkGbkp6d5kZMsUD6GFs1ZDO4CTcSnw0Xq9q5vyKF71Fle
	7hVvrWT/0T5LJZUbf96MXax2Ad4+5Zie2xPewRiSfxtnZ4T4re3DH23jjrpddMYf4Itvu0yD4GB
	TIBMZoYY9k4ksxIUjHngKXOH+N9YBA7sYX//DVaics2pYnaDXApi5qTNzsXTte6eLW09BwabGxF
	1OYuU=
X-Received: by 2002:a05:6214:27c9:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c85a3e99emr142461466d6.5.1774263046226;
        Mon, 23 Mar 2026 03:50:46 -0700 (PDT)
X-Received: by 2002:a05:6214:27c9:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c85a3e99emr142461196d6.5.1774263045823;
        Mon, 23 Mar 2026 03:50:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm469525166b.25.2026.03.23.03.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:50:44 -0700 (PDT)
Message-ID: <3d3d2d1e-e286-4234-84c5-97d93a96b504@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:50:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c11b07 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aS0zzyRBlZboKq-MBaYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: JLFuiglckmviYpH7LrVv6B_Puev0oEpI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX5zEQiFoAW6bk
 bnIj1PY2LCNGIILR1KYx+A2EU3xKDwVKrYGFGhxkrweeKLVxWBl6fWRkmPYVJBd5IP98VxcqZ60
 HVS0sn3G+R2aZBgDHSI6tGWINRADQX5eD0RZtRCwr57PTi+tUveUyV7SgmpDL27cmgZfFn2k4T2
 asdvu/d753VAcut8mpc7QQ9CtjLaOOCZyiJzaXIdrWnUT5w0uykc/lWyQQ1UJ1FDU2mzXvjLt6O
 FG+I9fGBue1kmMsmUS6U7E4QxDXZQ/TEiB/zjt29ioLV4mPSq941Azsjdzxcg4DHesBhcAIN8GX
 5lVoYeelmg10p7D9uT6IHcXiCgsYBY0Yi56f62a6K0vRD8iw/9saFM/kvg+RZmmsK22G2YrWI2A
 Z36UQT3sIeA7vbDN0ZaTfpxLwoiaWsvkVABuQ0mHxKYuqgvZ7BXYWv+1+CxOBpgAoaEvY83R3uB
 sESIn9oqeTkJURL5D1A==
X-Proofpoint-ORIG-GUID: JLFuiglckmviYpH7LrVv6B_Puev0oEpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99205-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78E8B2F0B40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 5:08 PM, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> aggregate the correct load for the CX rail, potentially leading to voltage
> drops and system instability.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

