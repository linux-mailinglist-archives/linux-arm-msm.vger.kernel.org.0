Return-Path: <linux-arm-msm+bounces-73928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB457B7F787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AFAE3B498C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6F932896D;
	Wed, 17 Sep 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1F1gnen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3432340D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116340; cv=none; b=Dz9pOS012hZsRRl53EePK6VR1Vc1ZCNeDyGZKjEEVGjW6EofrSZg2Gqtr8nKruYHOSHOei2Zzy5kPXFcEKiEbEm/am1EzmwpqmzhsVO7TBqpmkb7wnjAUfVuvQ+QoVnwyRu5H4FjBCISHjs8l33WgffCgGFRW6JdcuSOAeISguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116340; c=relaxed/simple;
	bh=wmnaUoeLg54xR4kD8RVtS7d/+a4+fnfXhWXtZ54xcWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8SfURZD8Gj1omI92b3VbS81NN7F40skwc+BCuX++7aTY/Yu0hFWhe72G9XHpGSfVebDDUndhM+oM3jBqEc1MzWZYvkE5ns2IFf4xMqPQ46dpx0UrWIusD/VFOtXgwpwjyIvGt1URZh2azbf0oHjrRRo/6lic0zDRRa2cjZDs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1F1gnen; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDG35F003343
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FR8amwe27Ylu/pUP+vY72tN0Ut6/tbsNkz8y6d1L3c=; b=T1F1gnen/pG2HG6Z
	EKF3zowmzP0ugVBn1c2uzcxqi8lff66lKgjVIFJK62pTeSOPXR90ohiYIl6/Hnxj
	yQHrtzv24MnltrHmmpmYy/pSB8+DHtYbrVKAVMVlT9zt092i5DERdRZmsqSsoqVZ
	XhgsB/ro8WrCGujQ9XtCl4pkzky+GWJ5MBclBZpxGRo8QBEH3mN4I4ovwfR/vKk6
	jWYdXgt42FziZhR+GsBq+mNaaaLa78R/MlIa0ZIt671PwvBdHccuWCn5+nD2cxj1
	Ohjegv5Cro7+P7obqgaa2vuCHfwaJPZwrUZXUibOcz3aIbBXYx7PsGaITJ4ooCyF
	T2qpbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgr1v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so4652771cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116336; x=1758721136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FR8amwe27Ylu/pUP+vY72tN0Ut6/tbsNkz8y6d1L3c=;
        b=M1SGDnO8NaR67DFOKYDgTuurvhmQ6f+oAtFFWt0f9Qx9kTrZOUtlnpD246h8RQE4x+
         +ujVOSNqJyAwV3Gy5sQ9QTEXbxFAXtTRq+3ePfgpzGNXrh4pKoYTVZBeXVp9HcEdeOg0
         HnOMT8Q6ehzUv4uX/dhbYyHpKoik85q2MX8P21JXj1rvddwZyNAj+nA3PqNPMOKMX+/L
         DFV+Ey5t3osr/uGL4U6lDQIDdI8WZeN3KxsZ92ZnjyxbqNwP9EMip58IkDF4t/VcxDgI
         bw+Emi08W4m6tX2NdgDPIYIHpjMtbg+5W9o9HFt0lsCn14QAa4OG1U0VD7Sj6WP92+Yb
         LvpA==
X-Gm-Message-State: AOJu0YxyF+gGi8/oGvu2nipLIhlYYQBXJGZfkBuufKS1s34QmZRc/wbV
	BukwXMD8BpCtaiYZDEmP48SlRmSF2/GkWV1+FXVQffIuttMUklNrO/etbIIEDST3Td37PkkJwrU
	1tEleBofCOhYasnwL5i+Da5E2yoDCQN3OG91PdXAH6paOS7m/vqXpNMBvS4zWJ2CfpP7Z7y+MGp
	2j
X-Gm-Gg: ASbGncvwOAnPw4wBsl5zQFGEwHAqGAYmmDa78sdsEZGrJvcirbqRK/jsnG1KCWOHpJr
	kujvOoecfcc9/WUDZYj15kYCqLDrN2eZEPi/pxu+mG4kEgjiw7oi+cks2Rw7KBa7Sq5XQu/mbLY
	BIHs13d1B24NJFXve3qcaOmZe+s66Cf4/gfvCQc4He49TzTwV7Ivsc0qVT5R/cAliNM7bjgfQV0
	BCoFeNqQbMdruCYrIuE60Jb7RzH0NBqwKFaxB8dwgIRjdhk3ncCDaXGxZzXPy/zXRMPWrKPOksI
	pdTFJ+McFxr2BwLUmXnqJt1Xb/8tBLDC9HLg0JdQdslInEvDDk7y67L78EUn/XVKpp+HyAJWxDE
	J21HluBlM0MJhJwwwbKrtWQ==
X-Received: by 2002:a05:622a:34e:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4ba6a201826mr17337501cf.9.1758116336305;
        Wed, 17 Sep 2025 06:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmQ7zvxYEQCcz1LV/ubwUUWJATtIDKSxIlQFAS7llfXEprD3GrYMvTESV9fbgINseDhj8YWw==
X-Received: by 2002:a05:622a:34e:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4ba6a201826mr17337101cf.9.1758116335644;
        Wed, 17 Sep 2025 06:38:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128506sm1379313066b.28.2025.09.17.06.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:38:54 -0700 (PDT)
Message-ID: <324327b3-7773-4abe-9628-c191685ea646@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:38:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pqVQOumD4Ov0J35tgNfQR8toSTvGC_fT
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cab9f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=JkoFm2tBDPzt1COVDkcA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=IQdlk4_VRkkA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: pqVQOumD4Ov0J35tgNfQR8toSTvGC_fT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX+6MyR4/8RzQ+
 U/m2/wsbPiDS3m2NQrER9Ac6cLuCC/eHydYDKg4kb3tFwOna6CbTQoNe9tHA4QMOhIP3Kcbj2rB
 fVhjUttQv/xcpRZaqeVrVSbUJiiVIjV+bq67ClUb0adOxSLJIdhfGulE79hoWnzIoEva6m50Dje
 EV1f03sbA0cISKzW+vIM7h58VcRiqQmSfaxbvL/rN7MutAxy7Jqt2dCG1RcJ7W/7oP26s6Kvsch
 UmCoekFZpTIzX+Mp2h65IKsQ4M9FDYkCnEQX9YAf3KZKJ5p17zgpG/JXDJpu8GchWEYLZcEiMlO
 NzVkDuhf2fBuMseKiOxdB7WUgHQbKZPwWEieyrgqp/dN5AQnOE2eaWp2sdqVnSkFZPXNhYY+Ats
 gfWDT5/A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

On 9/17/25 3:09 AM, Paul Sajna wrote:
> in accordance with:
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

