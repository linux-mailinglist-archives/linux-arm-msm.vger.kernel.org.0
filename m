Return-Path: <linux-arm-msm+bounces-59953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD92AC9C61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 20:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9019E3BD26A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 18:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A08192D8A;
	Sat, 31 May 2025 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnZK+hfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D91624DF
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748717325; cv=none; b=SP9XG2cnWgrNl80oY85nzFq6YIVSTeVU7dBW1tLL+9qQdxXZKmlbJVPIoc0tiKVdjjVrNARLiLANV7HLD9bv1wLSXuZhqymfpRWZGkjQzUH79ktiz8httX7zNWoOBxsulCRX0GuKrPuEzxVVuYWzRghdxxn75voMpREDhUwV+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748717325; c=relaxed/simple;
	bh=twnMRSAjtTxRsTLOV3TBRxjz+geOQMUR7QVp+z8lBDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umk1jDOMqaGZepWxWxGuE47RLYeaUclizgR2PKxTi7xZNFalpzDM7s/gTviH5jvxDXHrFHuhLPjNcsB366jBQ14DRytVN4915U/mHRUM5nNgHFtUjKS8JWtUcXEclCPCXEMe3MJwradmFL9+LBgAZIofLMM2i1rH/+mxryhUok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnZK+hfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VF96o4027119
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 18:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=; b=JnZK+hfyv1XyuO4x
	5QKELThanYZBqy59WIWL1V8nS2NJ147LveHw+6bJ7QutoL+kEqsqNzaleLRzpqFm
	/oAepbXDPLK5Xl6gHfRVnGij5W2VJn1QPY0TUmF2s0rlm1lpzVb4nqtwSLndkvYg
	B3hWGLJfteLFuEjt0ZJ65U7FfiMJsd7WZHOushh1sup2Ck/eB2rG0jsPgDZDkhys
	y2iZLOkitIUEvMUzFzhZJqmKRBWF+BL5pRlSxvI63EESPg5T3l+pVaj2WU2G/U4w
	0LbyDISVPzIbsADafH6OooG/BcyLRcEpggYdCHrmWGrWrDMiXWOUxdKx9wFq1nMf
	jyOfHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yu2a16mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 18:48:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a58580a76eso258161cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 11:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748717311; x=1749322111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=;
        b=YP0x5lio3ToUBrXBMVDMaFf0/8gtz6FEzb018aCQPI+l7tu7f9j7ylhuVFcygn+NgQ
         C7k6jYhTfjX80zdHqGArFXuInT+IBRLmVzvJYYS1vn7uCHYYwNkgX1Nxh7qSB6JvH0B7
         1tgjhYpVFwQXPJAVBUEFkJ9kk7kicuv1PAKHmV4wwAUPnBw1mW8Ce1yS/CvqluoNVS+V
         rNFN2a4OemP9CpHV6N6y894eC/DXVdBFVsicmaRsFuCIvgSUZ/Hm6FZNym2Kl88uUfud
         eQS6gmb3k+3rixlHcYZLcm5OAIBqD2MyBnAzm4MZXc91i9k5Q8xdXA0FPlxBCoF3LqD6
         IjAA==
X-Forwarded-Encrypted: i=1; AJvYcCWqQw/zR/DfWqhhsy8FOfpmk9Sy+rBTjli7ZRBiPHK1pSNyutR8KHKRiCiPn3HUgNWbDrElYvDyD05BOwOx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqvu0O6IaJcrdldNM3hrBUhxQIdjBufdry0KLCLe4FkMbXEfbd
	qbHoFvGKE6xS5+81hJVRQaimBOzPLR+p+g7gL8Lo8ySSTDAs6/n8mYMkWBO+OTBzwUt+nZb0mgj
	4/Z43jieMwOxqHQfciHMTemxkzfCOOsAAScKuEGekSIzq/2YFWaF3CFJkwWH+eFvXD8YE
X-Gm-Gg: ASbGnctq8LcrCUeUglwYormIj5bvssw49URqG9KQYdxW7zPmGgmVJx+fibGLQBXJJaO
	fnoOJK++9Qh+A2eapmQPmjV7k0CsP4BxQHNvwvlPO4T2nLCqJ0hPHF9r87L3P/coq/FunERVyXP
	o/lW1elh0VrPU9jS2Qx/fwCAYZr2Vz4Tde5Lcg2OLHQKbyb2Pn6y4vyk6bmJxJB88gvX5Um/weM
	tvsk45ER474djs2zsD7lxzQ0FEZZaP3ksf7XROQK4QYdWMZHU645TrD52UdiamKgWMMVH4kFkgu
	BvU5yUqtFY8xUE1RizHkiPfhhP51dO6smQzqBdTCIExLTwJF8RxIEU6R0qwXl9G+pQ==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406841cf.9.1748717310673;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS50jxW6Qje29AU0C9sBepph7zG42LOAm/3jLmwP8x0sfmPiEZkOM44vaelCgiKPREG+C6ew==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406631cf.9.1748717310234;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c756d2sm3678883a12.43.2025.05.31.11.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:48:28 -0700 (PDT)
Message-ID: <4b4925ce-3a01-4295-9864-a43c65aab530@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xkx8g6noh_tLa5tXkjkvcZmV1LbHV5f8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3MiBTYWx0ZWRfX0Xjx09siI5WX
 lWxcl2EBbcU2XkUZKrUXT4BB6ndM165zo5tO8s6OMT9aoaOGorCpJBG84UYap54Zo6iesArOd1T
 LsA3J5nSVcG1UBVOZcK5njnhkhm73HIT1/PUP3IbNnLd/6LfQ1IhyUWMZ6kkfBxzVp5Hi6CIK6w
 XLAYxK3KLeSyyhf/4GXXJ64Ta62NTS4Ri3rUmLQnYEAnybW8LnIxE3SYlyEKnCD3cc5qG5RPvC/
 XL0IdhPqcIyOyli9/Ry27pqMefgy3Pr/5nls5pVT3sl2rnasIG5b5boVwO0L3RrFudZS86YtE7P
 ftiKEpsN230SzlI8QpqowvHYNjBel1sldhPy7sX5tL3zrbjp5fuchaij8Co7W3DjOcXiifVWZAL
 CFAnE3GzYzAtVG3QuY50ecjVxfBqnS8oba6XSus2CjD1LrWEI5rZC/ejELnNUBwErq8P1x5C
X-Proofpoint-ORIG-GUID: Xkx8g6noh_tLa5tXkjkvcZmV1LbHV5f8
X-Authority-Analysis: v=2.4 cv=WYIMa1hX c=1 sm=1 tr=0 ts=683b4f0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=EUspDBNiAAAA:8
 a=siKOB1rTJ_YAM3DqF24A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=757 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310172

On 5/30/25 11:00 AM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

