Return-Path: <linux-arm-msm+bounces-56264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84CAA4B67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808B79A7AE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D42D25A331;
	Wed, 30 Apr 2025 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0iMH8AR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C083258CC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016790; cv=none; b=st2TBIIzKE4NE+LBo5EwBVdZhPXy1Br7ESp43SZ103+NqdZKkWQq/i6HXpIEUfxRkIABbSBA4GmGjnj6TSUQbESlPtY+KbYw6xAgIfpJnlI/fNS1jewml34+P1KplmOMTzkxK4M9+mRDiTeboQFuIEthhZiz+yqeTpKVFcxUENU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016790; c=relaxed/simple;
	bh=EPNKpKk8JZWaARHFAYyvjGyRCL3qGuhrQzvghiPj5/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuAsNJZLImkqdJjDHLkFW+S9Z3O6TaWkfsVgMd7n5HbNP02MPrrAoa8QJwrcTmJ65Ci26qZgy8508qDS86mW21ISO0GcTKqMSKO9RKCLjoIS+67hbbdIOFA9bAStN5A8TDN1Wv6x/xBG12WYOPI1CuROhmealmfHZ7S34wDZWH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0iMH8AR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9ME7Z018968
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFs068+EJ0khJe1SOIZavrVMIyHZZWaL3/ptb8Omy90=; b=P0iMH8ARfBEGM2/N
	xQIsqOy1yqATbwMeMf8+4UsH6jqJOqYYmyiiO+qz/Fe7mpnv93aA6e+IgaRNuYtV
	9cAoOTlGL8eUqOpCGEfQ2dlf8+ObYzBSWfklyJZPLbSaCivSPnVIxKsoPsuvkqdC
	c83Py2UKCVzvnBAfoNLq1GKYFPB+FmlHMAw8S1hkP0KGXKjMMm8waqKZsrF6Mrqm
	ZpopmUFzazgswNPDrL7C+AQ22NIFNgROkwj/RH30AEypefJi8Kpd+Ng9bXhjXnbR
	x6e1iQJS61MKfcqkOgGHSGXTNR30d14JtT+PUPpEArMimXLsajQJLJLmIFPbhTAi
	DKO4mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaa5av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:39:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ece59c3108so19106896d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016787; x=1746621587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFs068+EJ0khJe1SOIZavrVMIyHZZWaL3/ptb8Omy90=;
        b=qE5aPAa3yrHfZ9u1GkIzilwC95NhlN80IUAw4e9UZ//v4N/FfVyYDRkzPChwNRsc4k
         ADU7BOT30NRk+6mA/0dsthA6QjJWA7XKi7KNja1KUr9t3QNpNRY39oXqCw+vNATk960M
         QSLAkiyhsXdX76qWQo+nTroBQI+pXAhaLD3C+nbxhfj/b7C3VjyvrAD0gOzIkJd9Ty8c
         oHPfvW/PaRg9bWMfwshXpMpHW9VctLcf3S0d2kOVIHJs1K6FQx5Kb2UEZVl1wbnylk5c
         9KAgjmQSEgj6N2Yc5ziyQesHp5NMSzheb+e9uXnL8n5Mq4t+SZlgetveIoIq6Pseims1
         cIDw==
X-Forwarded-Encrypted: i=1; AJvYcCWdDvV9BMXZns7Xu77+Jwd+33ZgLJ5jl/530j/YQYFZ2h09/Fb7BFq7uaZuicD57RpwI57IxWp5OOgPd5AZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9FUA+l6nymVm83lLsTMy36yRks4rlvu3zvIIZGl1MfQPVoeP
	3F+cfLB03U9Xzczto/dd2qFOGgIzyRrHXaD9QU05OpRvwstfHPGLNgD/fYa3gaD1nB3pLsNnby7
	8U7haKxHuhDBpNZxVHnTY7WdWeoJs9XiN2ws9qkN63SVVRYV8R7HhiaOOCA7Mx6f3
X-Gm-Gg: ASbGncsabSfzcaupW7d3jUCzCpsG7eqbrAxJ3BDxPidBIx4rK6lh3KwMDDayTs9Qpq6
	u9rMbcGm7pyJNaBTMuNgiUNBvAnt6dfXSusbERaRLZE6rnCHubHFiVygsUdnRn3NmGH8ZE0OfDS
	K3sCzSUyBgG22/1h0TM9pHplukGQtbATPSowIm/Vqy05B3xxrKlHEQJTN3Siubiufp2rDl1lzJT
	Tjo+fxU/Z9TFgs1k3yI9g3v95jp3RZcjGi3J+ZUirHZelFD6DAXZvhLm26zd6gu7uvt1DYS4Wik
	agq7M5eEU+sHluadCY/ziFfGa7np2NZvVsx4JKIwk8Y/OovpH3Jes8j7z301X09Er18=
X-Received: by 2002:a05:620a:2544:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7cac87ed1c4mr109531385a.10.1746016786844;
        Wed, 30 Apr 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzy9QmlF3UAfzA9JatwWwapnmKlyl6GIQvIPJ3qNu0J5MVk7h7Gpa4KEY9LvySiGhpANkstg==
X-Received: by 2002:a05:620a:2544:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7cac87ed1c4mr109528085a.10.1746016786250;
        Wed, 30 Apr 2025 05:39:46 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f8814sm935494466b.69.2025.04.30.05.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:39:45 -0700 (PDT)
Message-ID: <5086f0d3-d097-4668-b195-5ee00e84aad5@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:39:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: qcs8300: add video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
 <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68121a14 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=aRA5hjehiSxC-sjywyUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MCBTYWx0ZWRfX6hCgV0Yntgut /eJ6FOJUnsCRieR9YWxZ2vGZhcNF1+tdjHfuKoG/6DjhqGvboRWuKzwCmQOdFysFANV2VQ5vQQS uD4tbc60aTjHTfh+JFyk3Y+YOOc3fy4KPATTxbtXWf56wUA+0S8p90CB/vL1RsK12HrtNC9XmEm
 fEv6PMUW2OaiP6FzTnd4Z8lknBcCiyuyCXS85DfSf/CU5kBVVTyCBLFgd5mDmUT7BWIIK+ljPMO 9KPZ5ZjoFcj13+l+J0ax0r1R7QqHj+gTSRSKVxTD6eH7p5RA+H+6P3ryQHMrakuVrSjnFtak9ZI o1yAHWFK5YfF+mYWooQrXLVN6D9fzaHT0nZv63DUoUVs5RFOCIRxwrTIBuVZn3taURcJktpef3p
 puXkHp+fJvYclfsAyuztXfdUtxHEABX9ztUpfJ2HtVX8Ly0lSY5oukjEQA+RmKYXmvgYV0Hj
X-Proofpoint-GUID: 8sY3GPbvQbyZZcPlxBw7bz2xOIGWxdsB
X-Proofpoint-ORIG-GUID: 8sY3GPbvQbyZZcPlxBw7bz2xOIGWxdsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=822 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300090

On 4/30/25 2:17 PM, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300 platform to support video
> functionality.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

[...]

> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {

533.00 for this one, 533+1/3 for CVP, it seems

Konrad

