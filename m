Return-Path: <linux-arm-msm+bounces-61635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A65ADDDE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976B33B29F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F292F0C40;
	Tue, 17 Jun 2025 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgXIPI6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F982F0042
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195694; cv=none; b=I1foG041bu+umq16x/IPzXhtMfEh5JJAfhSqHNPC0/hNmgWsa56CBHPGWgiH3M3+mdzpX4OPdqFTN7fcU4oYAymibZb+guRFAYYfhtGqksbsLPATlKGXMzUS2OU6sXGm+aJSw6mht9DnUVrrRIX4ppLaTCkgQxUU5SOBsI/kk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195694; c=relaxed/simple;
	bh=K3Rbkpbbmv50zU+wBTjmxAX1i3UJp5nwGfq7f7SR8+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I51jmP59qWMd66ZElE0avmp5hXVoOZG5gv+i6RPQxo6Nv4UhK1tZu3VVG2VLvoA7/7HqCIkJ8tdRl7OfAzpMcjHQA/0RLhMSvm4i26rXs9dslhQmdBBjeZGIn2lROy57p4p8oDY1J0gRdE38qu2pUTdhWdWaFAznxkIYQS0PjA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgXIPI6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDhjGj028015
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNEZ7C8YHGpeeltsPa4+wuCabkqTlEwS5fdzn5tK/Mg=; b=DgXIPI6VKLBrpwEN
	iY4T0zBc4RypKh/iFoDABekZHMO/Wp2GBgVz9GO8g1ebFHYRtVkqUcedVJ1KVhdx
	xYwS2nfENApUzk3UMMUcRPOV3y2d1tiVmzC0oJcjcX5P/6fp5fNv9ZfgGVeyFyCM
	rpUbP6W091GerYDP8p3yJzxtWtbNdeMt3EZyFHx/o8cllfxkST+9h3PhsYwn+vvu
	p5oc8sYQ46by2ohXYUyZyyPmlDmN7R4i0EwSdDQxQmKSl9OcOJT0d26rKwa0/Qt6
	qHtjBWphmlhPzjNCr8f2I1fyRuwwbIH5/Rt6RSqKxG9QM67O22D0PKsDwgKoVY9q
	eiIGFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f79rde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:28:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso154415885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 14:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195691; x=1750800491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNEZ7C8YHGpeeltsPa4+wuCabkqTlEwS5fdzn5tK/Mg=;
        b=tbw4ZPMs0i9+o5jz4F/hckdpJZy7B988dp3zlOqgmR9pLnWK9LifkCegoWUNmcHm2i
         jSjyGi9tQs+tfb6HfBw8WCLpnhHdDZPZylMCGUIHw3JeyCFsrKuFVo2ddkbm77rgd8B2
         OxTBTZ3rb+86dHpj8HvDhk+JY8D9bZDrD+OgRtLKnaRC2rFr8gxYYY/Iv9RsQHXrziH+
         7z+wopAKyMeNJHKIv9pmnVWfOLjs6c0vPMUFkN0QeWtnfL2v6nHGYqzqD3VP9EYnXzGa
         1nT6VEDSLyu6JRlrK0iCJRr0zi8MUh/X6hR5iArxOeFHcJufS5szNZ1W+LASWyRwwxrl
         vb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8YIC4sBGAakY32/IPYTQZfCfIXxKi2Oo5SPK3c+AhQXhLutiYExZiC3Gqamv77gxO8US/InPISIU5gWsA@vger.kernel.org
X-Gm-Message-State: AOJu0YztF7PWqt513i9GhbkI5375AsaJ1KvFz2fuPMJAqU0gssWdAf9j
	6JNF0q2EA8fwIb48NDNW9R8Pd+5NEbB54YOO00P90eX3hSufzQcN2UsvNaruGTUtUjZFVP0ejjH
	zlkomvzsiEMVFiBw2YA0urX7aQj4KXqeYrx+uruMaQIrChQKU9uYrisG7ZpfclXtwI7Cn
X-Gm-Gg: ASbGncvgViQurFaUOTtFwAmDXjXIwzRPJNFDJtiNmPA0mj1sn4+5XABzTtrxWZdc19y
	cAgnoonUpq/5JA3Uu5DR947q/4SJqX20u+U4fPU8OuBy1+6apkiUYM36r+4uYlGakm+n/biNQVP
	QiRVrsxKePJeD3ZOPv/jFnLUAPg8IuOwh+h0sgBhQpNbSNVt2XG79t9UqrtkrDRFSD+ePJHOgQW
	yvPMocHZANjVUQg1dMndGmw57MJuqLVbbV8YfYspJQcOHqq2YqGGsB0tNBB1dRqQvtMlZvUEzUl
	AjGSzy1R19dBy4RMsPcwtmnGx7Ju42dI1eqpfQWFVm0lRtLiJ4rXXI8udtD8CKZRtdUMnonnwcr
	JPpA=
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr305912185a.15.1750195691117;
        Tue, 17 Jun 2025 14:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+9JVqw+7sJ1yLr0TsiHGtmuvpSxCBi5IsiQMqBr6H0uMPOHWLaMsMFaud7fwVkOu69cbpXA==
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr305910085a.15.1750195690728;
        Tue, 17 Jun 2025 14:28:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9d8e1026sm788094766b.74.2025.06.17.14.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:28:10 -0700 (PDT)
Message-ID: <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 23:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
 <20250606001139.jaods5yefjccqni2@synopsys.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250606001139.jaods5yefjccqni2@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3MiBTYWx0ZWRfX/8/P81VQzHjr
 XTNI0SVaLweEmOVCGjjfBvlIHHtEJASyLZpM0RIRRc3Hb0paRU86oYjKXAXHGLUDO+VkTF9yQlL
 7gxpJ/07XymRgjoHZpHA5CvJRdkwg3Nv0dusqRkVQIbCn1LRNZ8lJZ8xvyVX29ImNIvbzek13zb
 vpVoGauIzzHwCws+hG6xarbGvs1e12y+Uo69adHFTmXU0864kks5VRsGEKe6RsSsprkM0lGfYUl
 4Rk//F3KWBiezRRThHgpl+/gwyOOb0Q8wDwi/NhXc8CAbEEBPcfppeG+j4tnoxibT8MIQMKXEE1
 i/KLli0j+cjdaELU0urGKWc/5HsZH7I3HQR1ly7GJEYkDcVqRbGg1VO+M/g4nUBxDpVykVF7d8j
 /nIH+YsMf7MNfW71i+S06G2Q9HQ+ZGbA+46+Ox1WxSt8VqhDAFixwTH2fQ9KUcp/+GvlP16Q
X-Proofpoint-GUID: 2HKrzHqOjCX7qg1cNvUVXYNU-6g5iST2
X-Proofpoint-ORIG-GUID: 2HKrzHqOjCX7qg1cNvUVXYNU-6g5iST2
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6851ddec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NlVYDTfvjE4WcsnVEWYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=671 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170172

On 6/6/25 2:11 AM, Thinh Nguyen wrote:
> On Wed, Jun 04, 2025, Krishna Kurapati wrote:
>> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
>> blocks any subsequent attempts of probing the device, e.g. after a probe
>> deferral, with the following showing in the log:
>>
>> [    1.332226] usb30_prim_gdsc status stuck at 'off'
>>
>> Leave the BCR deasserted when exiting the driver to avoid this issue.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Is this a fix? Does this need to be backported to stable?

yes and "might as well" - this file was re-made last cycle and this
patch won't apply without the recent 

e33ebb133a24 ("usb: dwc3: qcom: Use bulk clock API and devres")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

