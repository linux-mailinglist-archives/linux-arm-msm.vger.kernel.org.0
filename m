Return-Path: <linux-arm-msm+bounces-88817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CBD19F3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98E7130519F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BB030F815;
	Tue, 13 Jan 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVAg5nl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P908fXfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A092FB612
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318588; cv=none; b=Oy/fXPFtlSMD+lnmMCM0brq0COoKs27dhPwfsWNVzAr2Y/xZ13su2VQ5k+M7kPLMQ/smbZig2q0HUOuXfA0DMtcn2JSqAj1AILH+QTM+jVXgMmw+h82PSR7eIm4gb9V9Khc1HIy6bcnb89uNBAYPH/OO5xQeZLHbzRDJ5RpVAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318588; c=relaxed/simple;
	bh=m9eM7lrEF2v99gMzQMLE/BPwkN5Wc7QA9E+PDtK8y00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/aPngZpC06Z0rDqiCy8CNyAHzfO/JazBd636Cpvc0fzq6BvJ/toW2APLfzQwtfmMlhL8MDJHlX5QV3Qo0+DY10qGCAh3shSWNPShfcLcZ8FvPLPUkNJKrVJqT7ASY6WN2QPcncnp/0diV+44CdWLs9XUukejIo2F4EFw1a9bt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVAg5nl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P908fXfa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBsPVe2865805
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=; b=HVAg5nl8cM8zVS55
	yzTwaJZofsza0OYMHTHTAKvCUU8PwAc/De1TvXO1ZmV9nkOPOSeTH6bMSxP7H2WJ
	o7D1DcsNroLmWfv7RdYZPOHZCynwKsBEpO+Gs8u1DnP9h093OA4GGM4I2gWtjt0p
	sUvkKsgalPsVQG1miyVlGLl25lFud7Ow2y+TJxrg67b5CrMM56JF+6gTMtUxCoJu
	rqypROXHFElreUUe1o7jip78/+JEhWI8Wi60Zii/nXcHaSW+iZaTaQfi/XcrVrCC
	BLTd926XILVDqK75JciZnD+k5DReXMxXhj51ndYCIQgqCCbaLsjS3EeqK8YruFz4
	lJ4vCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh9yen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:36:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so272829685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318585; x=1768923385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=;
        b=P908fXfatM8251S08TS5ZMJQXrctNL6O3j4AJIG9wkrqu4mFS/3+cC5RE9DpBWVKsN
         tHehZGT/qt6Q64SEHl7a4Rud/Us6cGTWVtnbsv1kNyGsYhV69UNudP0cnTf9volbf65k
         1oI+6zdGop6XLBGhkleB5G/kXpBXCvet5i1zu47qrcKBEVXlcB6PUFWlUkqcDw7yTUny
         OBpTREBhnreJUlUPGsIjjnAkczf+gq9ilVJcsaRtvV6v8cSQt56MTnPerH5LB4jKiBSZ
         SBWeFoqV5UuNmXLIcIIl0nG9KZryVbBQ+bOE4Lip/7CSmbgj7EkvBKS23tDLEHfPGMgl
         53wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318585; x=1768923385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=;
        b=N/xOWyOb8P2JU06I5kWk6rE2sJediO/w/I6VECd58EGsVN32K048QFpoGpMfQ7KecT
         x0skG6sF7qUTARe59jENNSPYJ2NY9FWdbVvHcJB5bbVX4NiVu6+eNdHJB72GMRyV4AQj
         BuODCTkW+1mdqAESHPtN6dbMQBD9L75sGqDN9nydSB3zs7h3RAXflkaHYpFF5o1+JPzd
         8CccxRgvNBb0u2qNcfE9io6ejbHZUMPDFpIjMoz8LkFnnb0ItcBJxiUzPFFGUPtireoh
         srF07bkvdZYVjP/IfBxGFaGEH7rwIpL61qWgwlMdmKBjjBK9gVF6n40dNIOCTbPEPi30
         FOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6e9kGqmsh/tu31IQhKLOH/7BID/qW2H6nxW169sXXupHXY3cBJyOLJsEzSUn00rGPCSufCYrYPA/uhWYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSrRtlZYMfkTl6zvUupWASdtfGD/dOt+0GIWvoyhS3L+fkiWt
	DZDwa10JLUpOXIpN1JiLqWIE9CG84nlO+KPkdJIXXED1UWyoaUVd3mJkGFYGC4+t0KuKq6V6pzm
	mmsiwBRRzggQvbZS0j+iWLUA6wH90P0Je/rroqwMDMtk8j08gfZAwLGj5TourqRf2F9an
X-Gm-Gg: AY/fxX4EX8bHGVubfucQLDBSdnDj/Vh1bGzR2M3UlHPBjGB8jXgXiPydKaB/4EV34Ee
	g/Sgymgs41HLKkmOtL7DlY2p2kN+Qg6a7zwZAJPbXhPnfKh+cGws/rdMnJpyTJbdRY6jYOi5XGe
	4zNmYtnVWSE30Vmet7Sk78BhjCJQTIlePgtgV13I1o+ltdMxI9VbAl2xHWnbslC1Tn/FHMRTpMf
	ruXuglQbdXIFMfGqBMFVM/0HhIdWxul+puIccy27mRrqzkKvqUl4yRFD8eRGO1do0XWNOV5Dftm
	NV9s4YP+B4KKJWxfFl2citmhMKmhia0KxO8akC5i7eb4JuCzUvGctXEZM5U9By73bP5t1EikNDU
	GSOkILYbQQeVK/DbWQjs0c5SUFoQQeyieCQfi6dcFGe1pIwN+apaY3MBRnCAXNET2ekw=
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c389410364mr2118450285a.10.1768318584812;
        Tue, 13 Jan 2026 07:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMLwqRlVP/7fKfi+RZDpnX5OZ7Qgk9Q1gQb/STq85+GeJMS+CL71WIBqS8kpTydKMXpn6Oqw==
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c389410364mr2118445685a.10.1768318584257;
        Tue, 13 Jan 2026 07:36:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870889ac26sm819561366b.28.2026.01.13.07.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:36:23 -0800 (PST)
Message-ID: <40193ace-36b9-4e05-83b3-9539534bb1ac@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:36:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzMCBTYWx0ZWRfXy9flfC8mgEIo
 Orn6BaQQZ/Rb59/974DZGQpDtNXw1hjXg8BAA8goeCQB8F8b1yTjOQJK15gBxsLFArastlM6QLs
 MdqANxU+1k+7g4gOB+EJYAXLbamtIB8yARyKfDdOsHa1p/jNn9KlNG7xufeRsRe1fUTjwb3kHAP
 dp3D04hnmophndV3yOIj3btw+BE3wa82GbqVtPJMYFDPxsIAb9nIHhYOXao8+gWr7f+dDPGhntn
 Pu7Kx9yGCJvpokQBOkexXW/89dNvVYYpzR98/0Jf0k9wJDA5nR4qVS4ZfU5czpOta372HxU/hNk
 Sao+j7GRpngt9P4569T6b3Q9K0vyynLE5Hr3eVyROQABb+Uc5UjFMw+f3Sn3JdL+xuEHRVcw8ln
 6qlR4fWAWoE9VMB+P5nWd10bWXBjIDTp7RO1/w0/4W1a3vwjQ2wvtn081618m2YoI4RG+f7o1WT
 ey2VHuZeYtPlyqrwwHA==
X-Proofpoint-GUID: 9eodkI4AA25Mype4Ya5SL3mvdYKtvT10
X-Proofpoint-ORIG-GUID: 9eodkI4AA25Mype4Ya5SL3mvdYKtvT10
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69666679 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=egEcnhzrLz9U2KnhiLcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130130

On 1/8/26 6:49 PM, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> To make sure the correct settings for a given DRAM configuration get
>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>> what the BSP kernel does, albeit with through convoluted means of the
>>> bootloader altering the DT with this data).
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> ---
>>> I'm not sure about this approach - perhaps a global variable storing
>>> the selected config, which would then be non-const would be better?
>>
>> I'd prefer if const data was const, split HBB to a separate API.
>>
> 
> I agree, but I'd prefer to avoid a separate API for it.
> 
> Instead I'd like to either return the struct by value (after updating
> the hbb), but we then loose the ability to return errors, or by changing
> the signature to:
> 
> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> This costs us an additional 16 bytes in each client (as the pointer is
> replaced with the data), but I think it's a cleaner API.

I don't see how that's much better than

static const qcom_ubwc_cfg_data foobar_ubwc_data = {
	...
};

static qcom_ubwc_cfg __data;
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
	...

	if (__data)
		return data;

	__data = of_machine_get_match_data()
	...

	hbb = ...;

	__data->hbb = hbb;

	return data; //still returns a constptr
}

Since we essentially do the same thing, except we save space and rest
assured the various client drivers don't mess with the data they receive

Konrad

