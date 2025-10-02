Return-Path: <linux-arm-msm+bounces-75770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2BDBB26CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 05:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53152188C2CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 03:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D59A45948;
	Thu,  2 Oct 2025 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOyO6eeJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F1BA34
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 03:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759375265; cv=none; b=eYeHK5i5NZFJD/bj1OkJ5BtHgrFbkQxHchxFWpENlVUbTpbaUXz9JzPpl20PKG8LB4lGi3kB8cxiOHg/ZwHx5iJBNh60RoJaxf7KPN/KhcohYR7/W5IJz/v8nYnGHTVNfG+5G1MKYbVe5PTdQOYykEfaHzJqvktronkGE8hbSys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759375265; c=relaxed/simple;
	bh=4OB98gy4e2/1rS/SKiKX1WzaFtLO7WAftK7JAWaM0DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FE3U6O4OeawPd7EqmJ/Elvyh5W4sWSNWn3accbAPA6GqjiOgvihtPw8lYeZDrhh6AFY6gkKr06/8+u8qzAQOcok/G+Vz6OM46tlHYXb51xJR0Qi9ZkuOuuR5GY8ueK8kn3YqjLTm6xrCIaehwyYOqK28sgKRjwNDSgzLtO2541M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOyO6eeJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcMeR010597
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 03:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MadjmTlGyYj9vNqf7FS+yHZf
	TOeoUTWW+o+zA14y1nw=; b=QOyO6eeJhYeUSOYQXBuLGyU0HOrgAnoCNQByx4Jr
	aKyoa7j0shTN+8iOxcTC/Sof6bS/iEAF3sywu+fJoJhkURssGNfShWAxkV2mTBYt
	eO9uZ5iXdX9M0a3/32hjV5URbND8b38gpKjHAUXdrZg65kLNJzXS3owewbGnPMUy
	1NvQKwxSjeiarbT5EsnhCM4uQKBqjwx3vzQBxr2QaIjcCai02HgSZedJjvGsPGVx
	iwynO3huDsJvCJR7MYGo84JK3KX0cE9CSJTXYZriGBldfeqmg7IEhS+w+V7DBoa9
	NETXPyKnkWGfy7M6EeImtiD5ga8yDCvVG4y8RjDXx32qKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hp9nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 03:21:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-859e412f2c9so92696585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 20:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759375259; x=1759980059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MadjmTlGyYj9vNqf7FS+yHZfTOeoUTWW+o+zA14y1nw=;
        b=i+2N6KOKJW3B3T9l292V6BPqeFMK/MBaJhKt8Sm6ubOxXtopEhzG4ZJzTkxFHI6Kdg
         vMvoVxZVKWhL9ecQtJPEqo+5yJLI9H4VrUksPYdw/5o4mzDPHDO3dj0YxDX9LWA/4sPn
         gWmiTKrFI188nwZfc99jNi3J9I2z0cjcRfW/Mm4X3sqH/TcvBQtF9nGg2N+m6dpCRrod
         z1+4zyDP5RRUh07gOrbIzYA9rab1aS6MMi9ssYehuVAXaT9aCTSRYLnwnvVZAo/O4Bir
         jBahXLyuFMgu0NkKPwi6N0YCcn/EoTL+rhleiCqBWxBCmADwoZoTrU4nWOJCqdqUr0y4
         QjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFUJgmD48DvsKC3XPWAcCRBSAsviZqO5+JtQLa77wl5gazJHHkbeXsP0wY6mP65WBb+IUSFeIHUQwl4RKK@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDpkUguVkGbY5C7znjwGstw+Vb/m0ehSKJFf86baSlR/A+C7r
	H9XfAh2pGHk0CQVhUQVcz8D1x6G8kd+IXLCwDRe54bfWbv9Hg9obNVmLPnGNryAJh+SHnHJWgOw
	3MGwXpTW3FqfRApTP6GWHTYo7E+5aAjTHjUCYqcDLO4rVz2HFCtU8RDOoDUKMNoFlDMx/
X-Gm-Gg: ASbGnctxuA1BYSwF9gcBh+aCCKZ6Lho9xdakIggXe13FSTAvbRa5+4R5uH3jc2GG5pL
	N7jmo6Owd3h4RNCmd51A1ndbCrrDI5TEY0if+pr+a2/orKC31V/WrfClaN+lneH3Y2mYdI3JcTi
	wJEyG979ehRG4PDdFiKPL2ZM7OKYOhyFoJLYXHc74nHA3njZcVwYiyVHJ4AfrQ886r/tyYnN+SY
	B3w5DhzF4a215WCbRFpnL+amPVE+3kazSgTel7LDs6exfX46NgBiu4EcOdDdaH24c7uYGnzMOuW
	bcYljHQ8nVQruczly92mqxPOy6SqMiaQfVTY7w+W2dMuvn5VdOw/zL3c6lWdldYq7glgZZFPyOA
	X/VmBYzvk/XchpWNPGI11ZyjuynvOh9sRTF/phtiNmWS5N/iPwznWtiO/WQ==
X-Received: by 2002:a05:620a:28ce:b0:809:7ac4:e5d with SMTP id af79cd13be357-873751a3f72mr827104585a.38.1759375259104;
        Wed, 01 Oct 2025 20:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+9KdqXQAvgAy91aCrCBMNPDEVwnU2TL2BXZwwnc5jZ0pwSHdM2Q9U86P8T0TmsQ3kUHLwbw==
X-Received: by 2002:a05:620a:28ce:b0:809:7ac4:e5d with SMTP id af79cd13be357-873751a3f72mr827101885a.38.1759375258476;
        Wed, 01 Oct 2025 20:20:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4d4ca8sm3459121fa.58.2025.10.01.20.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 20:20:56 -0700 (PDT)
Date: Thu, 2 Oct 2025 06:20:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 supplies to simple-fb node
Message-ID: <pbu36yoruuqmik5pzpk3jcl4a4kpatigrrkoco3ikf4npvm7os@soqqf3j3m7yv>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-1-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-1-5a45923ef705@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX7lfBqIymJAXh
 EUyyNY4XOJdbs+zUyCmqP1epBO6LOtKiUrAN6yBXIJTEVG/zQ+eXyNTh8fUmBp/ek60Z2ltmK35
 bP7YWtqzXlkz94Kw5D4PqmnGj57qLelqlMjDGzLZmiyVFsnreckrXI0ww9JI7pd8qz9fwgqlcuF
 sIi4thqeZ7amVv/P7opPCMDwS24mm7Ijl0jeRPZ319n6KIKA49IVHTA0AeIaVnObvWW3hMnOMwz
 9oRS12J+6O+9qqIGryXZHMJoMN9LK74CTSbrGw6NnoCsDe822BjY54QgY3P1+uGk5C5cnbRE+VI
 h8B1zjWybAqWRG79Z5TUus4uca7XKHQxlCOcmlHkvPSXTytB6YGW/mVISu/pIkbVtyLIHIkLQ16
 o/vgZ7OC4IldbHCUgqv0cH1Dths+ZQ==
X-Proofpoint-GUID: 15UM4RAljz_7P4oQ4UiyCvGG-2kfi9_O
X-Proofpoint-ORIG-GUID: 15UM4RAljz_7P4oQ4UiyCvGG-2kfi9_O
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68ddef9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=4pzNktNMXXEreR8vy40A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Tue, Sep 30, 2025 at 03:57:01PM +0200, Luca Weiss wrote:
> Add the OLED power supplies to the simple-framebuffer node, so that
> the regulators don't get turned off while the simple-fb is being used.
> 
> Fixes: c365a026155c ("arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

