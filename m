Return-Path: <linux-arm-msm+bounces-84205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A0C9EC9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 11:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC6C23A9A30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 10:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFDF2F12CD;
	Wed,  3 Dec 2025 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqL0ySGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZ9a0bHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5492DE707
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759453; cv=none; b=dzHv5GYtrLW6/7twA6jZH6VpINLQDKCxW/wQuu7bLE4mXVnfPENcLn1Nzr2W5BTl/VquYZ53s1FM6m6kunrQ1OhzOAL3eCDyGAi3oXPCAhMHcuOKa0OdYA72m3A3POYN9ZmQ3v1kBxPDnPyvKnaju7lhEcSt5KLzgvbBECH/pSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759453; c=relaxed/simple;
	bh=bwTUPNoVEF+5U6pSdvmI/nM+ny/Ay4sOV5KJyfBA1r8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWHZtoHX2Bw3Dtb1XAMq1GL1Xnizs4siWLtvukKFSzbDT7XBaKD7JG8hodt3OWGOAzTDa9QSd0qc84rkYiq3Ym4fy66A64wsxvrP21zGsdc1ajO6Mnc5JazGGrxdvGyzGRYkXCyU6M4y5mBdR2NK5wPrrL3h3DnJeaK1+fQ1Stc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqL0ySGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZ9a0bHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39QJHm1970541
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 10:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//zuba0FjMkEQv1I5ML5VsO81WIfc6Xa+3BKz/qoV+Q=; b=VqL0ySGXrkUBmPv9
	rtxg3+l9pD3DXuwQPxiCmOPEmGFqPCBDM+EwAzUo7Cg454TZpobPFcSky9wTToCS
	UAe4DJzTLW04oKgaeX+7f5kogQVgzXdaxjH9QlMrwdf9a1HAh/QAmaXMB+w5lnh0
	07uHLXGx9PqcXuDHAJ4Dr+RDWNjy3Fp/21fF+Vr+Rqrk/pqIBuKkPgZcBWVA46lg
	GxGqJERu5Jq2Enfi+mZ4kLt3fniaijMzckOEoNl6ZoyUXYeCH7fjz+Z3FCxM3fLf
	3Rt/GwlXl1RienQ7Kh9ChQ2hmm/nUJRtrF39urutMveGHRd+Wjn6XIXBghw+eJ25
	nGxSbg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0atb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 10:57:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so9539258b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 02:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759450; x=1765364250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//zuba0FjMkEQv1I5ML5VsO81WIfc6Xa+3BKz/qoV+Q=;
        b=AZ9a0bHtT92TtCdE9c/Pn0q+dvZ5CvM3Qc9T8GMK1b9tSiuAUfOtVdZBpWei/vatKV
         9BNywoNwwNJ4QrXDTNMtFOyD5YOWgsE1c/YEhvEd1GpmlY/UiPvAfGzrO+63Q3etXfpa
         4vmhZni0Xq+KBctL4SftjZb2fUl0AfpE5+L3+JAZKM00LCiCFuiPxBbNUAqyp5mLrYxP
         6PTMAb3yRrpvxDmoR8a2+r6i8X7oxxQRobHogrNocguUPEyJBGMrd5Y3miztj68dCEFB
         oDva6thWs+tWdWLhjs+wFfhzymxBOXNXo5maCNidzQShKSOG6HcI9k1FqO5bTs0wKllt
         OR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759450; x=1765364250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//zuba0FjMkEQv1I5ML5VsO81WIfc6Xa+3BKz/qoV+Q=;
        b=ABCqSGyDgiNRddA6lls6/JWok73oOsKBRJC0QbufOPdH3dmjtjm2PWUsXgS6E6CKWe
         6CuTAOOR2+CHPQ6M3T6DIQVbeA/7GG5hdiyocl8JZrKSsNZlhmbPCPY5L4uSYRNICqtm
         i7yBXHw57iwITPm2khf3IO1goLKxatXB2ga79s8Q8/g7b/LdQ8JpZX/n9oK5AuWOpTf3
         Mjg2p6nc8uYu7qGIr5tRGkxb/CGIdOYHNpm29iKMK89RJxjXHmmoMvJUThNU4VQco94A
         90YZ/mCpteKh8GGxG1al7/1WOrfwO0p02pw2a6Kqj5QNun+xfKKAbmeZBqfeVS3YmWoc
         T9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWUSVMr4y7wQfislbtMwek8bbuqRLSNirVwyjvuBtb1Cdjy555CSJRYaJNKTD1dV/n3BIi5+vPHKZd5R97u@vger.kernel.org
X-Gm-Message-State: AOJu0YxPTp1yA65SmYU0LgUrVx1puXAB3hO9U/sXL78fxWOewtYni57D
	n1g/tGFRbTDBoubQvVrZ0P2WOPoFZBAoPxwRtrdoN0yUyRaGSUuFKQtxccVFSLTm/KGI/FYEMe/
	r8v18VYgamA45CRIbkgDWFwG0e3izaPwTFhGDx8ueAnmdzQhR80JvliLOxgiiu/D93T3v
X-Gm-Gg: ASbGncvVXzhHe9LQXjhh6rijtjIr4Sw1ShKsJjtQoaAHAr74IFgbfjOxsUUfo0bp0QM
	Bly0XH91oAFzDONR9p/WBVewCx2SZBj9nczMQvKph27eZoy4nasMgK8QA6wEb/Ttc9lAZyp4OkG
	FgOJVd6ZWl01slSj8re2Pr6RPElVpG5Qze6kLd7fdrPrDvb/m0hRHbWvhUGFyG6Fi01zAAoRMXo
	LvfiPBKtZR/ox69FcvFZQs1k5eYqFJkOD8ugKAKpBAYqmcb+tH771EDVpXqDVoPY8KYAhjWCA6G
	kEEGYSZzDGcnVJpfAkwaNnDIVC+HplZdHvFf5PRYOlosRFilmbellhTOSTu3bYNk6glEWq6Efdy
	iY0lcnBiA2qcYhCu57CTSPj9vR9h1tKmm8rfuQ9WgO45d
X-Received: by 2002:a05:6a00:2e82:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-7e00dde2240mr1995694b3a.20.1764759450076;
        Wed, 03 Dec 2025 02:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGON+DKrGmDx6X8a3rsGfHfj4g/ExqWhm2qZjcJYSHF7dP+N1DiHu+CNc05pq8LHkVjReCR8A==
X-Received: by 2002:a05:6a00:2e82:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-7e00dde2240mr1995676b3a.20.1764759449616;
        Wed, 03 Dec 2025 02:57:29 -0800 (PST)
Received: from [10.219.56.177] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb14876sm19902091b3a.62.2025.12.03.02.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:57:29 -0800 (PST)
Message-ID: <7580dd6f-564b-bb26-8322-5c4a132f6aa6@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 16:27:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 3/3] firmware: qcom_scm: Use TASK_IDLE state in
 wait_for_wq_completion()
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
 <20251130-multi_waitq_scm-v10-3-5a5f2f05a417@oss.qualcomm.com>
 <20251203083132.lpx63c7oium52sr6@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251203083132.lpx63c7oium52sr6@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hs8uZgl5NRml4fAvvKSpPlIUVs01SWeq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfXw1hVSiBAjL3W
 xgUHcaHN76pZORYQSB+REYuahKJaCqooauDFgoKvH2sPuQyfL3EB8RhUMVL2ZzrPo9QSbtLStUb
 kQmzJzkaPhsd3LU8zhoDz6+ARcSWichsN3yQTIHEPz/V6ZAdguXk0E8Hb+dYXBJeWWo9dMJaHsV
 Wa+QJDQZe61MscbF6UsguRS+TSKqM3RbuRy3utz5hVfYobONzUVnMe9YNaqjxCGrXf3wADxAOtq
 aJgCIF+eMFb43/tT/ECsMW1GgH1La39KnPT7KYbk+iHW3KIcp1wkLizp98tEFJ67254cwjj1+km
 aG3aWOd/KReT0L9R7PHmDgbUM+7tkZWwuW/o8JsZxqQ9YwX71zpEcDl+URG1rBcxOQW3UoR8WCV
 1H0kCH/Pg+ebilMg3pwenJWIKNJVmA==
X-Proofpoint-GUID: hs8uZgl5NRml4fAvvKSpPlIUVs01SWeq
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6930179b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ADvd1WbFpuWqqkTu3eMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030087



On 12/3/2025 2:01 PM, Mukesh Ojha wrote:
> On Sun, Nov 30, 2025 at 08:11:04PM +0530, Shivendra Pratap wrote:
>> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>>
>> When the kernel issues an SMC (Secure Monitor Call) and the firmware
>> requests the kernel to wait, the waiting thread enters an
>> uninterruptible (D) state. In case of an extended wait request by the
>> firmware, any device suspend request, cannot proceed because of the
>> thread stuck in D state. This blocks the device suspend.
> 
> Not only that, it is stuck in D state after holding a mutex, which is
> more severe because none of the SMC calls can go through. However, this
> has been the case since the day the firmware started supporting waitq
> with a single context, which is somewhat acceptable as the firmware does
> not allow otherwise. Since, you are adding the multiple waitq context
> supported by firmware with your other patches,
> 
> Do you plan to support multiple waitq contexts i.e parallel SCM calls,
> in SCM driver as well ?

Yes. Parallel SCM can be enabled once this waitq enablement support is
in place.

thanks,
Shivendra

