Return-Path: <linux-arm-msm+bounces-64276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEEAFEF67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 19:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D5B171F0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 17:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2071B22687C;
	Wed,  9 Jul 2025 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGtx7E7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331BD22425E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752080817; cv=none; b=nBIFoVCDJYvuySrUVlJ+EJBCyg10/fasGnVOkgaIeT7V0SaKTuelYqZIxPmiuTnNCotIwGPdFcP8a/B2vvV/X3GQjTW33xRaUw8kzT3gJPX65yneGGQvvP6stAutL/ciaZKAROIAA58Spn0fBg1F6Vz9zRzEflg9q5fIk+/mD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752080817; c=relaxed/simple;
	bh=Dd21ohWnuUTS/BXEfrNOepJdRU2lCK7un9IzRE42mpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0FpKzZ5QsQcBnIcODvwMAokoWAdXVvtiqN2zLIN5cTLR6fqgLcGyzK1XInEy3YZGcrBBcWjoVy6WWCqeV7O9STCa0wIkxvyL1YE4XSGZnkA+dml2ImiD941hgI5OJedwVqBV5MfgErh+RwS4EtRd6reOnpPOj/838EprpLfYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGtx7E7s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Coamv009959
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 17:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wh8yuaaHqpeTognyFmCrL3eiw6cJgczdQVoN39qvEms=; b=MGtx7E7sFI2v1NhU
	9/x6p9kRuVLvZS9Bgv+Y1AVL+bl8gQlirZkBOqoD4ZaItkc+J8+ioyES2sM+XPmO
	cmNne12dEhfxazHku+TMtcD3QGnVRoB8rejhzCCmjhVdOwI5E6xO80Sg1zZkL6bX
	ApjCCEP3PInBtkNqQ2l563mg6vQjKPepDQsyLK5qCqvn9+PX+Hs8bs7MTcuZypzu
	vBAyhvfUyDxO1tpGLxmLQeptUUl7sp7MNwy4GMWVBN6ZrThpQyu62ndb288Jn24X
	WBjpzBrgs9+Y7f9DUOQp/8P1+sEByaL3UpfVSOv9tLTMfQFMcb3WQl6vQUYWWHfZ
	55OtWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dswba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 17:06:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979e6263so43085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 10:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752080813; x=1752685613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh8yuaaHqpeTognyFmCrL3eiw6cJgczdQVoN39qvEms=;
        b=emeGIFePRzGps/xuMSzwAlYLkAhpqQUtkxval1OIMARUh5n3sYCLe/3CaqNCj36pg3
         bsul6ceDwLJdo2pPP7b2vTL9X5bwlzM2iFjHbMlryWhmbHDfAsj4HripyDEhSNn5fLSH
         jbqEG8pJ74VaAA0CRG9278qb9Kluh8Deg2sZbfwu5syCtX+6af8Wl7oAPo8hh381Iv+E
         UfHI38kwNsq6DXStIsGSSznlYfCAXQr6sCWCvEQ8YT+iFVqpkLLj972lx4qTn2GktEE/
         nuOjEeR/ITXdUfqns3jfI8Rs2ticxsKnwdGiSJQi/8JGrk1w0BM5n8raEJfbPUx1eKoE
         TFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRs7MYqYTfj/PH4kReL/eihrTh3Q9IeuFzlIOI0W4fWRvgZXlwDuASTSAgewYl0jKzrxczGL+otDDnnEoH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3jayun5EuagpLtbN9Qpd/o/ZlKSzuz/2RHR2tyJVlJAxTvJGa
	G1AATTv1qP6j7Ug0PHcFATeOHY6I6M94kQMtYZyRXhJWqX1o2+24qwj6UxsfIRkAXyD9KVgGgh5
	U6Xy2NyWKfwv/avGRXLZP+wjXzgaJUtsAXuUpAhqa/yKVh1qbcer69NDV9JoRpv4q13sB
X-Gm-Gg: ASbGnctdIcysi+TaYTVCU47I1HXb2e1lQgteuTqhtbPSKBoGm3I2HnmGZtD2S6yJDKJ
	FoFf3qLkPn+10F8OldQJzq9/uY+8+efuGa+zpfFBf/SliErX+OJOsfA2Um9fWENGPeKVgdU9z5V
	VT0Rxh554dst1jsqVyLHVIiXS3x8HOiFXi31LywLxJwuNgnvRVifYYKimHUvzvV6qzAAZx7VZ7p
	s/dgnPOppDtcXEd/q30BdbAxBwdrKvsWHN94dfWIiTYLD+XeFpxZi8VE1VE4d8Abbkj0TeEwR/m
	hlyaoisONEWyTl4jDVVV/NMHohT+yZwTfgqE/oeV+QzkBqSmJp+KxTLuabxLq/PyTVM0QAKjo6e
	LFv8=
X-Received: by 2002:a05:620a:318b:b0:7d4:5d37:4169 with SMTP id af79cd13be357-7db7dd6a732mr172205285a.15.1752080812941;
        Wed, 09 Jul 2025 10:06:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlkcqXa3BSEjEs9eL1FjQsITzwJ/IuC4Kr/+Nt103WxumFedL2DSA4y2nT1n/tQD+IDxMScg==
X-Received: by 2002:a05:620a:318b:b0:7d4:5d37:4169 with SMTP id af79cd13be357-7db7dd6a732mr172202485a.15.1752080812237;
        Wed, 09 Jul 2025 10:06:52 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6abfdb6sm1137405066b.78.2025.07.09.10.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 10:06:50 -0700 (PDT)
Message-ID: <141abf1f-2739-4ccf-8a2b-3451c299ef49@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 19:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: add a sub-entry for the Qualcomm
 bluetooth driver
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709144728.43313-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709144728.43313-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -ZwAo9wqCnVUgXZKDWTrA_qzARJgQh-i
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686ea1ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=rZnPLpBaAhPpgNZSqhoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -ZwAo9wqCnVUgXZKDWTrA_qzARJgQh-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE1NCBTYWx0ZWRfX68b+H2SuE8HI
 LbwxrGx49PY7+4YP/8Ge5dFeDRIbhFZU1gLnc+DlnzHVHi2cgbkmqH2hH+oys7Qs02qEsFz/VOa
 hDQr0cQUJhhs8yc7bAOtqKHNMIus+ObM5vkFLXunTnTpxojonkZXi6sgWdTBii5bLQRY5Wef1CB
 lj8YmV/p9extrdviB6SlS3BWGbv5g3YLeiP4jCUQuWdNMAlWxQ9c1h85LMMxnpy7S9KoM/HLD+p
 xf/1LLXc7iWdLqeMrXvAKpATEG6qjLq64lrPnHmfO5zFVGg2hhCK5xiGobFJ74MviQqxdUFsFZy
 dX4zE550j3fr6PmLQxqPtzSjU2LKjEeYHXNgBcl4XWw2fK9QHZdqHKSyiYVBs+FSF+AbIdRgqcf
 sTNYn0YFnCpYwPcBqM45kpnD9rvgbaZWnbIyljog6WQiHI3IVsLdg5cRRi3gWmy8rpKFjVMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090154

On 7/9/25 4:47 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
> linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
> can get notified about proposed changes to it. Add a sub-entry that adds
> the mailing list to the list of addresses returned by get_maintainer.pl.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - add remaining QCA files (Dmitry)
> 
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efba8922744a3..d018923ddd3eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20464,6 +20464,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>  F:	drivers/net/wwan/qcom_bam_dmux.c
>  
> +QUALCOMM BLUETOOTH DRIVER
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	drivers/bluetooth/btqca.[ch]
> +F:	drivers/bluetooth/btqcomsmd.c
> +F:	drivers/bluetooth/hci_qca.c

+ Jeff, maybe you/ath would like to be included there too?

Konrad

