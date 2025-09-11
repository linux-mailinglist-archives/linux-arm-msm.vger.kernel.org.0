Return-Path: <linux-arm-msm+bounces-73104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF4BB52FCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 470697BD9E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04903176F4;
	Thu, 11 Sep 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULTWsvUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C75C3164A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588990; cv=none; b=mAY4NBI9oTZzQazRij8IMsQUVD74FK2HZfBrpgClm28Wgw1s31y0f1RyZV1FA9xL3b3ETTPwxwFUFbFp3dgch+alyzx0qML+AdNhcl9bpNa4txTa+rzVEI+JtzGiAw+3XmPdMFTNBXW6Sc/OV2P3PLsbrl29LPdZjaoigcx2ALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588990; c=relaxed/simple;
	bh=0/1J8knevAynRtTLzFueZcZTN2x87PcDFIMCgIOQIoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C59uVArUGIDiMQPE58eltoZRN/KOjcL4MXMnKXC1YO4SSlfKB+uaP53u77PAZDkUyf9xa868JFyXhYHfWbw2np3rCodUj1cYZUn6WQJX7VQzWyW14ww4kzkagoeeQrN43B4lHlSUri58z4t7/znvlghNsl5z5ytLc/v4agODZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULTWsvUe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IV6c016084
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/eOV4Q3LLMIbj52JEQS5sHO3Ll4Cp1wH3qVKllN8Hc=; b=ULTWsvUeklBPcv1Z
	6sFM58wjhrVNU7Ta32QSjgahkwxI+PAsPXDRRt/FyOl9PC8RcX9dkfiR3B0le7r5
	PwMCxkLjjdNDgjL0PA7B+97hbbmb/qoSHds49FNDooOMNd9HXTPgonsOiXA92fS8
	9ONakanS+D381JIW+1rZ3HYNNw9ZDG0WzV4HEcWAt/of53wSIa/w9IzVDWUX3Vda
	8gUcccnTKl5FTQ/4my8M1Bqge2sTrHkn0DjNqHLkQcQUgM63MduksP4p5Dea87Np
	0hi/GzJQCNkP2mq42KZZSKn8YxIA2Tw7VjxH5lLnP57QIv1YYd7MkqV/n+87GW4L
	mX7Z1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t383t27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4fc06ba4c1so551269a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588987; x=1758193787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/eOV4Q3LLMIbj52JEQS5sHO3Ll4Cp1wH3qVKllN8Hc=;
        b=dmHvMn/qENU6bgj9mJP1l3ZiQBnbTtcHRcSdETBXHMrgre2bJ5g49+tB796UymrME+
         7CH6TUGefAnnxYVloMx8cRUVeffAln1cZJI8KIINdy2dXsM5MuETaW2O+BkIS8xOAqw2
         Kz8SXdz5DxU4vJUGvfFxdqqPB4rT+pjA6W6hnsq/v2mILTy0mkHZMbBfxDjAQq+AFt95
         t5N4VuzBhFwb37HczhT534d/R6CltEznV1LdqPa0gZ9noBonJRWjTt/19/VyX3n8XhsH
         Oy4pyi7SL9aMdXyzcp6cCR1zWt1FnQXDW9AVzJN+M3Za8qODnk2qzI/OKvRNKS5L2ZUw
         MKGg==
X-Forwarded-Encrypted: i=1; AJvYcCVlipg0wS7FKAuV3Wz8I59xoclc/SiagteYOdBEdpLzI7T9Zdx3Yeeu7dfS6ViSyqNc8aP3MrvAipiVqBuL@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ609tODzRN3Z6wh1M3GBhpFWW4KpsklQLcYW6cs4eA1cxx4HN
	eNklpWtTVVn4VuKMVb737VtwyGAC0Wrp9Euw1x+ogRXHbu8aGVNPfy6ZZvI538YC2I4ZnkD7Pv7
	OpXRcMRUXrV6nVDERm/uze90H1Cy0Exbqc5TynoeVjLQA5RY33tg4OtX0UNUnK+wEHPR907ex5K
	VS
X-Gm-Gg: ASbGncuAhCaNamNxz6K35KYQORqYbfBN9XY6PqNO0oRhkKl00HzTAtkoM5vxknQJ8xO
	Qs6jIVH2atXBBoHuxhkLCc7fiE9ip1+GHQ8Riqnmxuza+4SrM2bj4hX/hnokU8tB7yJXlDSUdd7
	qSru4J7hOC40kQxuTeIu67hSRZ25Z60s8K8+BAhNTZGCCCNcd0qAQyvlZ71jPPkHn7krFVjO91d
	JguyyxQVndtL1Yzr5GJJ1q5B9DI8FevsF/KN53thbYQwgfMoZSiM2EEvcPk0iokCx2hh98jELfv
	KEnWAEqsnZ0SlrauwrAbCix/6SKJQR+zhnEokVfgcguTj7A9zUP2VsTplDPInzNZrwkp/hM=
X-Received: by 2002:a17:903:32ca:b0:24e:6362:8ca5 with SMTP id d9443c01a7336-2516e88795fmr234910915ad.17.1757588987302;
        Thu, 11 Sep 2025 04:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUux29/wn3H5Xn2R8UB4E8/j+m8F1DaJ2P1mVSFqddPWnghx8YC7nsKPAyBp5WbsvJpoo4XQ==
X-Received: by 2002:a17:903:32ca:b0:24e:6362:8ca5 with SMTP id d9443c01a7336-2516e88795fmr234910735ad.17.1757588986872;
        Thu, 11 Sep 2025 04:09:46 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6d14sm16305935ad.9.2025.09.11.04.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:46 -0700 (PDT)
Message-ID: <e2cbf433-f2d8-4eb8-a4a5-d065e4bcacd9@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zX_7jNzrE1MI8FS4mIKBNiMdGaCADvWZ
X-Proofpoint-GUID: zX_7jNzrE1MI8FS4mIKBNiMdGaCADvWZ
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c2adfc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX7ZJGb1imHtg4
 tEgb43g7xDaWvW2t0n1CjQJuynFpwMnev7SLsoL2yXOiaYOacHKYppJWq/uf/EmbDFbV3HZKdcc
 KRjY8b3NS9+YJuMWIuB3YAtPbSc9ThYeV7B2dkIE/8QeSdreIGTNxQ30nRa5CdYidPN1FvkBcBa
 1h0z75adGLSG9J/4IFJKtOw/S/SIO+mEN7jW2o8GnukbuEO8jEgKpem3gosVvx01zaq1n0HPhBF
 ux4pc4kSb+5KNQrvIbV3fhZuAieahvcofsFQlAnHfaYUQbmTiHiSYxpMs8xBQkt3/hbalvAcqYh
 YvdnlsM3V7NRtE+lbb2A1neqCDjSQhR/Lp2jlzhwNbkNlYqVpYfNL1yeBmOA83Ps6y9VHVitW9V
 oNB5xEIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SD8450 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8450.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

