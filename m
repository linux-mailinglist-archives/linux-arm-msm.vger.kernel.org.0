Return-Path: <linux-arm-msm+bounces-61019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 609FDAD6044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 22:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821EC1893ADF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 20:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9872BE7D2;
	Wed, 11 Jun 2025 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UibWW5dJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C6289804
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674616; cv=none; b=igtqjwvT2/CSJs4QbkWPbDD7lTFxTMLvscvpd8OsVuSUi7gwlICQV9QAnrJF3yZjxufrTHr8r7VQxe3ottifMMoPrC04NBWvM5qKWpacOsbfKvw7UCo/l9wqnw+VVyLt4TH479LWX6vPQ4hsCv5t4HnWgVBQYMcZ4cWqXISAigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674616; c=relaxed/simple;
	bh=83yv50CaBfMFuVTkj7A7SvKe5M5x6OmGdAG5zdc/yns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scOenNcVMNDoalaaovhqnSY1vDJ/poSpkhSwtGk7QBuA9JfaTJVDqQONBGn0GDdGai+HKJsqKv+acpNoEZpDO3z5x08b0pn2Gn8owEcrEKKLMPnHqFTQZZxvI1Gb3e8VgD1+lkHrSLo18iSC8oubtiEP1PWCs0CowIPxQ+o+NiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UibWW5dJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJ7rvt029627
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 20:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVs4TGgM77zmRwDvs28CfyzU5Glz56xefxXn8V1biV8=; b=UibWW5dJRRze7WGx
	r4Njq0laImJAqWZH7mMDnJ4cde/eOATLk9dppsS++0LzUDEfDwr1nCa3HBnc29Bg
	pqyksFNACzTaIBH0NeUgaUo+AMrTS8qzq0M4oIrrPlfjUtSy4fo4jbu58XcR83yo
	LHr9fk9HMtuaZ5lR14vwSaQ7++8yl/ZNwH/KIaIa0FSuNHBTmb6KuvxzBiTZ8JWK
	C7PxlhMCyhAem2+Br8Ppj6FVeaqylicy6ysNKdKlBgJ/qtZhjHI4oVZBZFUHq07R
	79lEpriZM2azbqj9Q16PTkp1ycRDyyY9N5/y1k2kzRz2EgDaFSWWWPw6Lv3ENZ53
	NcLIrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1268pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 20:43:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979e6263so5914385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674612; x=1750279412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVs4TGgM77zmRwDvs28CfyzU5Glz56xefxXn8V1biV8=;
        b=ZDq3LUYqomOK+LKIqBolPX7Dx3EKZCgVKKvoX8R0DYNjCOWgjJao4VwWqg6SU5H4ro
         S3DH7pnKTj4gcrgYusNrOUIugdDoEW7mHrQD0QUu555dxXtkbCYs4VMnR0Yd5qycf2wo
         xI0wV8agnNnipsvhSS5cpddtt6va38jtl8oxvhI9epkw1xlWSIQp48a5zoTE+XM0f9Ek
         6HiyducDN+nRqDaf/85HlpNg8UXzAIsM8th2srh08+g6Dk5iD/gwzURO8hSp6hVVQSSg
         e6+SUNOX142x+IxhqE2CU5AV82Bt3EZuyX5TLR007YBQAo0CRyDP60vMPf+w1vF9+ADS
         6CfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuOOsFt76hM2t3HkQkVbglsieWnBTbvfuuVKo4xGJSM6EaZZeg4BLqd+MlI94obAcakd8xl5qFNY2/UTla@vger.kernel.org
X-Gm-Message-State: AOJu0YygrB2JJeokhCS14Sl+du8V3w4e5WLKAQ8GFiMVJ4vtCe+lXMcT
	xWYm8lih0H51lg+LjIjxznJ/qV4V15LB9MD8bSSF9gRB/QtOM5NdwvRQWdWDcDJqtFp+rrYh7a/
	ctH0m2BC8F5CSH6sw+ChQDf+X5YzUweGdcYrIANuYHDuCKvQG4yemL5uYeykfQ2xD7076sgbOpc
	aS
X-Gm-Gg: ASbGncs8S0k6kbqe5qZc0HgheXw+p6juC3PYp6GzbLyjbl2tMBzhNkmM5+g4H8vVtQd
	xpASp/CzGZALhfQvzATwRZnwIqnOriGMS5uk1uisdzi6t96puLfOdM6pmwSGrqCYTWLy4Kw7Yl2
	1FlJiMJWZ+Xn71BbbcQAQsfDWac8RWaO6Ou+ljmq1CxZkmWxUgcmHJDIR35lRGK20muuX3rLAKQ
	qk9PC4TjHWxEkvGvYni/qGZoAp9qJw+nEEEUCULXLwWkFo426jRA0Sih0whsDFaCzHpEZS6OzBx
	cndxjMgcikITRaFh2RmKy6/JxPy+GAN+bvG7Ow7BIxtzyqg37k37YYdjVu80Najwq4r1zDNbGHg
	b2Vo=
X-Received: by 2002:a05:620a:2a04:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3a87d21afmr284959585a.1.1749674611688;
        Wed, 11 Jun 2025 13:43:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqjdJMZ/RTfJljLe8nIPKV0DFCWgHhDdsqtHHOy25gyr/Gl8/60xzpenmgHhiO9jZcC2dhrg==
X-Received: by 2002:a05:620a:2a04:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3a87d21afmr284957585a.1.1749674611217;
        Wed, 11 Jun 2025 13:43:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb21656sm7425066b.108.2025.06.11.13.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:43:30 -0700 (PDT)
Message-ID: <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 22:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <aD1cUF56-IX_tSpp@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aD1cUF56-IX_tSpp@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mAG0JAb6prIO2aeY3Y_Ie3eyWGQ3D_6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE3NCBTYWx0ZWRfX9BF2yHYwTBRa
 FvbzIGUHXed6IL6VJZJq6M6e32DLTId1tHDFgAue5YNOvTskhZW/CJEmPMzvsKEyJGlgqfk6iCN
 6r4ELHivMXJG5UKhKEK4F5fdxdODlTpyVqJpG3aoc1AetHLYCbjOZzZq79CleuQ1tZJBkYFCNZC
 xMjiAjhigA0L+LZ71XoqBOas3xbP64IXqrvmT4rb9+O0UElLR06oomMK5WOqZz9Uf3IotYuLAV3
 Pj6zh6lqiHopaM9Hll1+uSm99Rrb+NIs9HGIBANhKkOWV7wCiRar3WpVNP1RQ6hNwCYU/Qum1AK
 FhAX0oF+0Nf3GXtQXMSRBJYB1i4Qpkvl5pUUYHMByoDFcEIPwslIcZ6jqxzQRQD2IqOvGAarpMY
 5j7jPOSK47CkgIB89/yuzRBqlTxmpt21sJLEsJJVPzQLlINTa1Xj7WgLHLUsQ2kzwNFwp59v
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6849ea74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=FvtShTKF05C0XPiHgVoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mAG0JAb6prIO2aeY3Y_Ie3eyWGQ3D_6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=953 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110174

On 6/2/25 10:09 AM, Stephan Gerhold wrote:
> On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
>> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
>>
>> No external dependencies
>>
> 
> Are you sure?
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>> Konrad Dybcio (5):
>>       arm64: dts: qcom: msm8916: Add Venus OPP table
>>       arm64: dts: qcom: msm8996: Add Venus OPP table
>>       arm64: dts: qcom: msm8998: Add Venus OPP table
>>       arm64: dts: qcom: sdm630: Add Venus OPP table
> 
> None of these platforms has a power domain that supports performance
> states specified in the venus node of the DT, and the venus GDSC does
> not have any parent either. I think you will need to update the venus
> bindings and add
> 
> 	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },
> 
> for all these in the venus driver (plus backwards compat if not already
> there). And then add that power domain additionally in the DT.

Making use of these tables would certainly be welcome.. This patchset
was aimed at pushing them to fdt, so that we can debate dropping the
hardcoded values in the driver in the future.

> 
> This series is also introducing new dtbs_check failures :/
> 
> qcom/apq8016-sbc.dtb: video-codec@1d00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                               
>         from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#         
> qcom/apq8096-db820c.dtb: video-codec@c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                             
>         from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#     
> qcom/msm8998-lenovo-miix-630.dtb: video-codec@cc00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                   
>         from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#       

Yikes, I didn't check as I assumed the bindings would be common - but
this always seems to bite.

> 
>>       arm64: dts: qcom: sdm845: Fix Venus OPP entries
> 
> This one has .opp_pmdomain and "cx" in the bindings, so it's probably
> fine (didn't check if the current OPPs are really wrong).
> 
> Thanks,
> Stephan

