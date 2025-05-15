Return-Path: <linux-arm-msm+bounces-58074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F328AB8B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A72363A9186
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6444620E716;
	Thu, 15 May 2025 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4+44zPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA9218ADE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323296; cv=none; b=l4ja7HCGtdeY5glivq3sFAyia2IgOyr3+0eTlXNyU3pdE/2nKou/88oj0jvpo9Iz/HUkLzlFl0UNFq6a6wr/0IT3Ng9evQgFgSZL+BG17ZEU9pkmYU8xUrJjdnaKTGdzUzA1zb3FjdhtYFufl4wTHZruAnCBeHzCeKH7KX209eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323296; c=relaxed/simple;
	bh=ixVP8pcTpJz5v3f3CERMJ2iDXMg23OMY+fwNf7RKcvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVmnl2UmGsoGtSf4PQE68cK4b6GGG2erpZFkB3zKI8MXk+iugudqhq6Kjzs0rSkPzrPbFuWaduF2DD3MBtNxewgH+AgUI6M7+q62EWVYbtnbc1AJoKnqRsdW9SVjaDbrOs/zFBvjc5CBe+FA5S471MU3Bx6jZ5Qmg2UKM07FsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4+44zPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWRw007955
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lA9ROa+Fk96jm+RavuSIENPK4Ma/Qw8dY3SARVyTTk=; b=W4+44zPrmFJUOxF/
	czpMNUl51CcT3hnQTqrrBvdxEbXdOCejmvSrIRDIbanB4oBwECKYLtPESVUqSBbC
	0EmLRKZcNc79jVRTdP7eI0+qPpdIRhQBAIuVGYBBr12+NTb0OgfawUuFeF36hVhF
	MG/kr/39YPtCFD3e5m6jn9KqIlz3gDvTQML9OGQFbU2LAAmYsa0vkoDXGfHxtZgT
	tCCfsHtZuBFbFti8OYo0X64ix/CjnVEImunXCfaKOWsWKqscK074hcap9RtDfH3u
	wnsfwtgyWmlOvcZORlEAN++RAzw0Dk7XtjTyWkdSySHAPxr1+Dpn+QBmSDWIyFIh
	pgm0QQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxnmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:34:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f54a16de59so1901896d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323292; x=1747928092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lA9ROa+Fk96jm+RavuSIENPK4Ma/Qw8dY3SARVyTTk=;
        b=hlfhbi5/UdVgIjeGxX1WgaNC9wnuwBqA6qs1VA8qe50KvwX8pV2EGx5UbLQqXUKH9z
         5nqyUs3Dvau0DwQ60U1JHqXugl0rl0Hg6EHxkTul3FAaE09Bal+TzxNLhm+Oui5n3k6A
         qpGcdPDJnSJp4RW58QyBwU2+iTjwW/WaU3q0qUbzqU2cO7ukqdE+vxHA3JSlHZxotEDs
         +kMrr4qT+4JdhiryzE1coxbnV4ostJJjvdZ/TKOqX0mQqUIB6DJdV2JKGZgbckl6DcJ0
         oRA6hn96NxV9uUo/fcZAgL9zzZuf0zd+eBGOc+ung87xpV6bheYhgA3iV7q4NtI2fj+M
         PDfA==
X-Forwarded-Encrypted: i=1; AJvYcCV3jcfvfiQb5wyLjy8fYNw/God5jH0otVH60HRGgh+jBjnnfHicGlGvRvCZEhIwpxMqqWk+BuRfq524WMwi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4H1JqyIpE4J3Ks9rEisEvdalYzDdi/Jbn/o+1eKiYBj/7wdRo
	NXT5sao/IQTEWZhCs1nuaa61UYJOXyHElxXrZduB/O7PWOX7spPB3bjczH5PZt7ouAFaCnqPgxH
	tdjUiO4uflWu6HhrJt9nh4VUCveFipR91hAYKcuhcAw8wSbz7SdKnT4dkmodRbmNtwioi
X-Gm-Gg: ASbGnctzZEgyNDvggMmel3wmeUMc5yz3+vun2miEmnliVDkCSD9NdRAZY8FSiLz2P0i
	6LlJfG4gDaZMz3cvp5yHARymEM/P6twoMgqxU8ChDYo9QC9JRzcBQT/zNM9z3DwMyWvwzuYGwMe
	pD64xq36hu2z8fmg68QFQDqP2QBvbNKNrUpRQ1JKMx/+ugFQ+xuLQ7IfT8UHDfBt5/2nbJ9Jisx
	0pm+0X/FRXsy3EbmUGV42gQaLvyMyc22NPCVTHgrFeRdtWuQWVXc291ujy72IlFOqFmikf+4bzI
	8auDMAqzzQdIV3qpcUcdFEHiXlcLlz6D9oTlX6x17O3TiWQ1F6sCZOS44BUqHpLZxA==
X-Received: by 2002:a05:6214:dc1:b0:6f8:9c21:5ad with SMTP id 6a1803df08f44-6f8b0864435mr966836d6.4.1747323292574;
        Thu, 15 May 2025 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjj2ZZDhYRB2enJaHEsOmAOykmUWbJUBTlc1NNsNBnxb+VMUfOdfTnLIoB9XZCg64ElxHH4A==
X-Received: by 2002:a05:6214:dc1:b0:6f8:9c21:5ad with SMTP id 6a1803df08f44-6f8b0864435mr966716d6.4.1747323292181;
        Thu, 15 May 2025 08:34:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04ef59sm6102066b.36.2025.05.15.08.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:34:51 -0700 (PDT)
Message-ID: <4a5cd51a-b88c-4ba4-a8fd-d065f9b9f113@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X8od5Fd7w6O3AMmc5anrjXgRqWB553Hk
X-Proofpoint-ORIG-GUID: X8od5Fd7w6O3AMmc5anrjXgRqWB553Hk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX9z711syG67gH
 qO1j/aa6vX17rDUjs5i3mmP6wCmm1IQWx5WgbaA1pMD7Xfxwv9isezH+WdWepIJhhDvQKalIjzX
 VEUCICvcnuWdWOrlRCDTwm4OGxNaBgqyRuWli8LxLPEmKb6GrqkcgsmxCw4YjDJXqqgcl7WgX3d
 nb4qDbZxlZToqvU4FIXDi0A/otdSPfGZY7o1m8fKZPrx1H1y2xyzzdSbdMOA85o8oVa3wAn8eC6
 yUe8zD2jiTeVsaL9DaqR+oVU4n5eMpnEpIAhHEWDLpnEWrEZQVP26dxO4TBA6YN2+LK7+0IJj+X
 eLrKhZZ69Zrcwlt97wPwd0bw9PiQ4nWbmPST4EBvYy5mTcvpRXyYfCW/+bNfs25v9SlFcfFuS6J
 ZNVPPktr82MIUaS4Dcyh6L+vG2HPwMTxLLX06Yy/YCDQQg0piqH3VepW7u1x96sC9zMUjv2+
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6826099d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l4YKJxAlfa9iYSc-yQoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=658 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

