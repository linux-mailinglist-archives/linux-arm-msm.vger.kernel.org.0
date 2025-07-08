Return-Path: <linux-arm-msm+bounces-64040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34679AFCB35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12ABB1BC67A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627642DCF46;
	Tue,  8 Jul 2025 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3Z7WCht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39491F949
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979617; cv=none; b=trp4I//WwEjL6/A7YOa+PfbMMcjMDW5l/k3H8UNtAHVmtOYVemSl9WzAK4e45e3jH65RkBWYKpDub2zlt5sbNkQr0NvlZq4UZfDnIhgVsk/jbp7GeTinFhxc7LNZ+C6UQHTzXyW+ZWrZmP6HrscRrcgkmJoGvZsuk1pB7InjzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979617; c=relaxed/simple;
	bh=zQXHKtgpAU/Cz2/90XNDOZ/2DON5pPdweIU7vev4U2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ks36Irjw82KDMXzgPPCK5VTenpWXrbr29LVprwp/ZxfGbpbXUO1zZ7FVP5OXW0B/iozfFbNOYbuGnlxDVNRCeh8a7z387Ka1hXW67yfKrRaVcdOCxziMUPBTl9hT5qV4R8GjSL/slmZVtpE4wvahyPbDSN/HSBjEXLUUsu1DhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3Z7WCht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAXfv029220
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 13:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZ7nQ9K9etHDUg75souiQvkrDKhzX8ysd2chrySYPb8=; b=g3Z7WChtPvkD6+Kf
	UtEsgALJRRLZyvLm8daLuuvak3X0J35m6mDyYitbXbM2RgUhtvN+dRkemoHwH36A
	bb0nRYIhpLoQR/cDI7dTgtOMazU7aAihsnkPX43752zPguzLI6dCQ+CRqQS+KCoi
	xlf31LRetsLZxT/iCwp2eH83goHZB0oypNJBaxtwppOkDjMN/BhA4eSJ8iLgplyW
	dEI4O5mv74ffY/JtRgLHaD17wQMM9tZ8/0vxbNgaS6IirQ/0lM2e59U6Al/gXFb7
	1FdmJWsLl4XH8+3sFvw3uzoEzhLSyzTU/VMlOrF5oC/Ffya+uCrilqllOkL6tf/i
	cu8S9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b5q18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 13:00:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d41d65f21eso29432685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 06:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979614; x=1752584414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ7nQ9K9etHDUg75souiQvkrDKhzX8ysd2chrySYPb8=;
        b=sgfCJaiyeaRnKw+e4MJ1T+Tpsx3GfdzRGh7BsfxY5vwFAnfZkghqxlUxthZRaJ6eEv
         CatdgR11syC/IlMRQDjpDH8UjNMh2Ljjjbnbki/X1UQSUNlCPvMbadTJoxMdMrTvLrm0
         pBbb4FTtlFg0JfkaS+mkULG4g5h/6cCJ+wXYpWA+kGNbV6SVWqN4q+WuDfDjo6i3+pMF
         sYznz1bkcjafRyWzTZg8xlw5DSTMPrldroGT1T+4lrUjG1J0LZrOj3eWfzAA5rIylx7n
         bzuZ1n2ZJIu5dGX5vIuNOW59aoztF8nOvFsfHuFLUaksMYg1G7H/SeCEsGgaat+mT7DX
         mlhw==
X-Gm-Message-State: AOJu0YzJLf7btFfbWjJDQPXdRHXpHmCFoig+S/F2ka3UYaxthzQxg3WR
	Ds3011uAE8m+VNU5opv9XbgVPHC2MAHIk/6LpGilkZO5iYvhQNWlStu2HLRaRR7H5tJc51bvGJu
	8yU/RucYz6wP6mackGrt/OJOmMg/RV0R9ri9TLRRsDk3HJQIV5BvCENJDteif0bpXW3gm
X-Gm-Gg: ASbGncv22AGDPJVoTDMlSEubXgFtYybC3pfnjAGVv1/62NBDOEzalRR70ckg8cZqOR7
	ZfUmlPy5Um+aWoYbPao7CYG7fBy5rjykJI7QX6DNPfVIcar7fW8QF9cSFj9EML2jANBK7p8pfpJ
	+nzGksrhoMd25H1LTeKZKnvAeXYeJTbWzq1D2rRYlvxW+o9M+Dh2OhZjXSpJhzziclgTgLfue4M
	1R489eTCxNsohf648si6xzB5s+wrwT8cuVYIGJWsydqp5J++OJ/PQv16JuVUcj2ONuUHjEL24IO
	GETvytmaKPV/lhJmgVZvs4JcbOaHRdt4gP80cLXMIVFZPt4S8KtIKCkdmk/4twqth3IuozfKPhp
	qpkA=
X-Received: by 2002:a05:620a:1b85:b0:7d5:c29a:b41d with SMTP id af79cd13be357-7d5ddb72e87mr894471385a.6.1751979611972;
        Tue, 08 Jul 2025 06:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOWeCg8LWYitPQYk8omBFmESpVhxHV/1NeuK7QjbwJP3U2bGrlO4pmbJ+4ikK1Q6UkvlaRXw==
X-Received: by 2002:a05:620a:1b85:b0:7d5:c29a:b41d with SMTP id af79cd13be357-7d5ddb72e87mr894468785a.6.1751979611416;
        Tue, 08 Jul 2025 06:00:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6949fa6sm901129066b.68.2025.07.08.06.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:00:10 -0700 (PDT)
Message-ID: <b3074aa4-6898-446b-87d4-de8ba2346ded@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/28] interconnect: qcom: sc8180x: specify num_nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-2-875fac996ef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-2-875fac996ef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfXxf/1Dz2a6fQd
 TcaW5A8FZGZrcsBX0zuc1CUsNaa6Pg9Ktx5HkBzneM1R5NQcNbu7fsgzeAwiBCTLNhHQrDHdnKn
 sKZUC2qnt/pCOFc7bfVKkftlRKNlbaWlHpBtF25vbhcW/kM4aXIrPOomT58yazJg+meYO/qMQlV
 BE/q8VgWelbfUhJfWPVS+gj2n2tFEIhhjNcmAmJsSPstRxTc+UdnBAN56IVgRvQIPdkNXz0hTcR
 aE/Z44Wm6tUl8Px4liyXMEn2E8tQMw5ecFNPL9ABZqC/OSkRAqAuwzEdK246lrvFurS+zx1phIk
 /ZllBXxsFsQi8eh/Py2h7rAZsXAcXR7+dQjj/FBGH5pbhbKVBaItINKIFP23iBlpX4AL8QmTwrj
 fbQBzKLIy5udhnNzs1ftobM3OmxbPhhBhv34Co63Kh+mHfW1Wz5jIioJRIMIFRgz6bxVKsNU
X-Proofpoint-ORIG-GUID: b4LrI00YMsbfWBCJqQwGIpr6E47YmPkg
X-Proofpoint-GUID: b4LrI00YMsbfWBCJqQwGIpr6E47YmPkg
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d165e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=alsCV9giXxwD5S6y2l8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=789 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080108

On 7/4/25 6:35 PM, Dmitry Baryshkov wrote:
> Specify .num_nodes for several BCMs which missed this declaration.
> 
> Fixes: 04548d4e2798 ("interconnect: qcom: sc8180x: Reformat node and bcm definitions")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

oh wow

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

