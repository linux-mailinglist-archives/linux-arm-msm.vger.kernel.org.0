Return-Path: <linux-arm-msm+bounces-51017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1596A5CABD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15958189BCF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54592260370;
	Tue, 11 Mar 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDKKUUoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1A25F990
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710263; cv=none; b=XsGcl4hqFAx399TrLB+p25UeTQ2Mw9K9W7x1dWPlr3ljbs4myLlXd++HrxMIE4sBlVEh7MrnzvNHGb3L1d26tvJbQC0P1PBaz46NFJKfSYeQpfNFboIeMwkPwOd7p/yvSx4/NCAlgSX5VvyzTkVp9Qa1a7D/Wc8N0Nvw2B+iozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710263; c=relaxed/simple;
	bh=qgrBqQHmYtPZiDw3T63rb/+wAIHYgCe4MJOzvqt9Bak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZ1luNHYnT+fp7yl/KDY6QdqQ6Xf4x/ZTqvj0mtXb8Bctwh2T5arzfQEZp09WWHqMHDQbvGXM6mh1COnGrEoroFIviQxeBYKKfjN4DZcN58vNRstq+jrzUzZ+kIi/enLhlJeh8GygYaBt7A3ZZesLwMM7GYvb7bp9Yh0nl3yFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDKKUUoc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BFwncU024444
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxMkImD4XvCHFtK9LMGsOV/QwiwfWxTZdEB/IERfs4I=; b=kDKKUUocqn0ZCwsK
	+k2WIcc2pnWkHDsXwnvD7AK1R5kCHNgGbJD+ytIsxqXDIrg/FwhxBj+JOb8CQEuP
	+3rdO139ZQCiaRMPfe0tm1fP9ykw3zsYcDHTKBq9NJ2S/tK2bZD5RL6qQ03jN005
	gJtP6TXwKiKHn68OljPDUxEnzwKYFguVNVbNRx83LnkdrFHdXG8UdZhB5Ks3TbbW
	FauK++oetBi4RlrON3dLA+DPGkAInhY2akP0szs/t4ikeeNwEFlm141dZahuxrXS
	I07JIFR/lCQvWeY5k5bZOeZ3SyVEcyC18BICyZ07tCvF/We9p1lwzZjEVJJdHToq
	rDNUHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4t1m32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 16:24:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7be6f20f0a4so148764485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710259; x=1742315059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxMkImD4XvCHFtK9LMGsOV/QwiwfWxTZdEB/IERfs4I=;
        b=gUkoZYttM3JNCnCnq497d0W8v22VATfAGbabU0wPaV18UFOMryrVXBGoGzHpCt/kQ6
         yw9qqUCpmvdCP3ugrSs6M3Hehdm2KUyRQM5ubDDrb4qNd9Cu6Un2dtMuztoGdPRnEfCq
         whGInu3xfR112ELosBuhnNxYromoRVD6jOmdik5z+VQhuGaLeCwxZj+XbrYiTe6gVxiN
         sdhtMrWWChsSmrtuAAviLEbCUXgE0y82uqCKyCZXDetrvUD6d2KOTxiY7NgVmb2wTVOX
         +z3DfvN3BoeTUlZz1mq/sECMxnKwdWudY9w2UM4FyOnQOoEqZNqQpsUWwp8MYFHdggKc
         FOvA==
X-Forwarded-Encrypted: i=1; AJvYcCUlucv1Jr0WbqM/3AE/8nmEHRk+SSjCpk2m0FP25QIQAkdmVPn4P1+9AK4rmJ5zgAZ35eFb9FDF/zExyZWj@vger.kernel.org
X-Gm-Message-State: AOJu0YwDUDk+Sp0e1SXqyu7L4va8XhoCUJvSX8mi/T2+V85jyHR+Is1b
	QsQVAcku/srZU2s6bfOP401wesaJ52GT6skAnlfktTgZqctm3g6WV67jZSCtH3RHYt8jfIvursM
	1qZYoIyKszD3BSjGZS4olRtpL6UryXFmbRzoXsImBBcn+5TGDICmdVr7o5FLiRkaF/1z4LSur
X-Gm-Gg: ASbGncuNHGQ8zx39aR9ShFSN6+ct0TziGze4UkWOKR5skNVWTs7KJy7Zn/CCsJq/ogl
	6eactI3aGtz/nk/kfyR/ya5fAE0Y2WwvCJHC/1ERFbYYOkAtkMrZcxpNuApuKQ+uIrbtEA6zFzd
	cHNS0CYPBU86Esi/r4D7+dY6p7FCoSIp2mkT0bfR/3AYyWMas8Vx0OME6AyCMORnCJAPAXlhl7a
	c2C0rJQb7FQShwgdkLyq/L9Z2u3dTlUBjwsenhkAw/nhWlE18Abpc/ixZ5wi6TajNHEO0h5g5X5
	2FPpn+9RGmSgIPQw8nRkALrwyjyLrnevit+YvvF5cO1xzxTtMjgWhdK6M0cAuzpNTjp3DQ==
X-Received: by 2002:a05:620a:1999:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c53e1f1620mr660772685a.15.1741710259514;
        Tue, 11 Mar 2025 09:24:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb/06oUsi5cu5h2BkX286HoUPd6spRXGBxkQEsEQoidWXTYp1CgE5/YUcHWXT5T4IA3c6k/g==
X-Received: by 2002:a05:620a:1999:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c53e1f1620mr660770685a.15.1741710259107;
        Tue, 11 Mar 2025 09:24:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733f8aasm8501795a12.5.2025.03.11.09.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 09:24:18 -0700 (PDT)
Message-ID: <10564e08-f8fb-4db6-b613-d01bc2a62899@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 17:24:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
 <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
 <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1Wh1bmkPmlYyr5LAArUItHT3zS3MkQFK
X-Authority-Analysis: v=2.4 cv=fZ9Xy1QF c=1 sm=1 tr=0 ts=67d063b4 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Sbx8LK-abD1ORSsONcEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1Wh1bmkPmlYyr5LAArUItHT3zS3MkQFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110103

On 3/11/25 4:11 PM, Vikash Garodia wrote:
> 
> On 3/11/2025 8:37 PM, Dmitry Baryshkov wrote:
>> On Tue, Mar 11, 2025 at 05:33:53PM +0530, Vikash Garodia wrote:
>>> Not all platforms has a collapsible mx, so use the more generic naming
>>> of mx in the binding.
>>
>> I guess, it wasn't even tested...
> Not sure what made you guess so, let me check why my binding checker did not
> catch the bot reported warning.

You probably checked the compiled DTBs (make dtbs_check / CHECK_DTBS=1), but you
also need to test the YAML (make dt_binding_check)

This change can't be accepted as-is, because there are already expectations
about the naming (and order) of the entries.

Because there's a difference, you would normally be expected to add a whole new
list, but maybe the dt-bindings maintainers will agree to Dmitry's solution of
adding a sneaky enum inside the list

Konrad

