Return-Path: <linux-arm-msm+bounces-73935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A46B7F9B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72A31755F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8E132899A;
	Wed, 17 Sep 2025 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctPjgPV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3E2EC572
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116691; cv=none; b=MWLgWAVvoyFSICMq+uPaEz/9nikuLulwLf9pK7LQ6lxx+DFy2bWRxJgchKLP8xzSIvmOQRbUuglnyHfWlrIOy7ZAa+Ijzc6I5b6mRqzCkSju5hC3Z6PqYkfu3WYImpiKcixXLH/WmSU55Ch8dJhfxKbN48elblWMjBMFh7hcRq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116691; c=relaxed/simple;
	bh=vUQvMzwQ3ZD1hwhkE21bB2D3wf/HfeAJ/XRGoPgoT50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jepM7DprCNGfCkoKGip3364GMcWAiB8Y+CeR3SEp0s/uEUtC3xY+FGNR8PvmLgGNnwAfXwJ3hAj7mqlBlYEPQw0wCZdjZXdZWjMj0INjUJ13xq9dj3Im1haQhvQ1mv8v8IOKtZZM7UrL7tVZ+7/HEJkrGFb2OGq65VCg9LdPccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctPjgPV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XixA029779
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzSq6p8Sbr7XpckIwbd1Ueyncy25BkLwVzaplFhdajs=; b=ctPjgPV/kwfpsGp7
	EVBu+xn9lUgayfxTnG+Qe6j2XX/MPJgu15evRp7QuwSwjp21zwuseFjptpJqpqez
	DOTEmBZe4KyqQ20zgUEF5FORo+XyhyI3OdxKC5iVF7OsLVRdP1/IpE0XFcHSlpTy
	6J4pIdR8WyJXbKn4IOzE3E5RGmt1pBVltGoyfQ7VVm/I+TPFjb9RzJu24b0+okn2
	zc+C8kgdX5BPXPcdsCYVRKZOBAvOpQ1TJ+9WAVq3nzBvvPhYOv0nDZ+KehrZn1sU
	yoYGZ29aps9OM9MhU2d7jJTrEhSiILZ+Dh/ZU4yVgn/igeTOADQNSIyrOJ+2ZUeD
	JKvsmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0tj1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:44:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b7a8229679so3743891cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116686; x=1758721486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzSq6p8Sbr7XpckIwbd1Ueyncy25BkLwVzaplFhdajs=;
        b=cvFBm3CKfZPrCajwyjQRk4s1pdwHs4Svnk2OTj3/N6ib/UDggm+BVx7QvgxIOJGHNJ
         hghJgGti7XopfJYK8EMr1ryUt8ldFfLE/JRh9joBZ2yrgIsxZTFZorwuz27fO/Jbm1N+
         QNKETw2zpqAde82mkEdZ+xxA7cR0SwcsiX3I0u7lrkJZpNCXcUmCzRasSXaWkvXszO8q
         wMXz3erc1jtnPjFswCXi04mI5A+QyqUQQzECRWhcAcmkz9TiT5qX50uhgOyuslHG5bem
         sjCoWvPfE2hmKD7mnxETzKTX3UVytuAS9MdgWYbIjwCMurAVic85eOSKQykv/hXtLwU0
         RiXQ==
X-Gm-Message-State: AOJu0Yx4XYbCV4CKfkLumgOlIXEl+Y43gagN5TvPpJUgOmFKi9zqO213
	u9+1JFnbSulpdR50jvU9mnygG3cuoMkHFWV2ueIF+tX31akr0mxKYLXVyF8RdrZnlRUWdooKm2N
	iLlTVracPEoYhxYVtQbKGjNK2osXskUKklq5zogvYdRxzHBfOOrUNkqpdU2BzRc+cFGo5MBZQxw
	w3
X-Gm-Gg: ASbGncuA/MWSN7Il8omIApVAeyXpPhIpYzB5ETbrbernGCucL72A6D6mrlLaExv9NoD
	u0ISy51Iw5te+m19JL15exm0y7jrVrhcf3tD4/NJeKlEk5SZzOHptWNPhskmzRJV+heqv+iWFyy
	HzKNCW1YeGRsRWs34x81UTx9k/NPeuSJOR/UYwLkS3WCGRQ2QcUiZ2jFr2eXQdBb6/htewnEH5e
	Cx7IWTRM5s+3+lVIYQzf/W0pGDjuH7diQAWj5Nguov8cTIS+Q5LI1x3ipIcyFlGl/fww9ubRFZK
	a88XVfYGAvqZglAQEq3RJKFsvT7eeKXsVT9V+gAEDPnEJ0oJ1O6lOACMO3AXkD4Yu/a3oPNDzv+
	qq4VXSTAo9nfLdXOHitdf1A==
X-Received: by 2002:ac8:7c4e:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ba6833f385mr16864931cf.7.1758116686123;
        Wed, 17 Sep 2025 06:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkIhr8rNJXDx1RAe7AAc2URQZK0PBlD1E0CbqMIoGy9FQdSRFRguiWp/NEMgT3vBZtYX2NZQ==
X-Received: by 2002:ac8:7c4e:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ba6833f385mr16864601cf.7.1758116685387;
        Wed, 17 Sep 2025 06:44:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f2122sm1376734766b.85.2025.09.17.06.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:44:44 -0700 (PDT)
Message-ID: <04b9140e-db90-472a-a550-b369670b02c7@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
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
 <20250916-judyln-dts-v2-8-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-8-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s8QBB85c5OSNbl-YShzIIqsC1yYF5wfJ
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cabb50 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=xpcYJZ5K4HInNErYrfIA:9 a=QEXdDO2ut3YA:10 a=IQdlk4_VRkkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: s8QBB85c5OSNbl-YShzIIqsC1yYF5wfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwfOzkuQixPAX
 GyY65b7/Ek4Ep9WzXxhxrPiLy7a9NUbdlHi8gduvpu0bzpVrWtwJCdE8fz/2ggVqMOBLqoZ+l1u
 CgGF9wmKL9yQAUyxDNuR69THVgB5jxG8t9P+EQgw0EHbHrm4U3Gh/XcH3IaOSlC+Uj/OOqIKBac
 J7ZJXjeN6H0cwtwBzNIWYjVwQGfMQ3kuxJVWaH8vSzE1/eSzNUdnk6gKYItXM+HlJ76f7mTzTKU
 4LedCnOmZpJEVfVC10/QRhyEggZ8L5JgNNn6kQBJInxzhsd0fjO6T5FpA6E5xBh1GtdDw2BUyam
 IwUOLtu4L7a/wYcN3k8SWcm2XaszSx149lnF6cAPc3SbAt/l45JUSZiUj4R7qddWtWvAzHCUEPM
 +4RlwE2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> The sdm845-lg devices are all phones, therefore handset chassis
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

