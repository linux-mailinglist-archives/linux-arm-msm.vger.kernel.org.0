Return-Path: <linux-arm-msm+bounces-87724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2CCF94EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 17:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D056307F01E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D56723EA85;
	Tue,  6 Jan 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n97YMzi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSDl0Q/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873DA1F418F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715912; cv=none; b=PJppaNTJ4HOFpmM75ZVkp3M1kVmzgqd0AaPkllyrayNgoCuyKE6cGd0E2g/CqsVuEVsuIWsV7koQlYoYpoP9gaIi4eZyldT6fhbqUI9ai1wSBjxT+wfW8ab+1fMeA/x/DgzRMfHOesfkMuHbxbcQ9eklpZezul3KsD3C+j82taw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715912; c=relaxed/simple;
	bh=kZAtNkxcv9VwF6rLzyrF0CTBPBAllpQKs44XUlqYna4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBLWCBPdjEvg8oOzk0corqtIS2jY3NazAengBIqoM1TWw5Oaa0hDuyCAUU7j6cDuE8vtHmuJkK1qRWLOSWP5SAtDbRiqOqLTnYXdzvZli/lsrY+3QClV8BbZI/EAdHeumZTGMWvPd7c3YKkR6MkeV0NisNUP5h3V8M4zWdOXzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n97YMzi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSDl0Q/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606BBvPC3271611
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 16:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J2OsZw1mwR7uhMWD2rOzlNZA
	sP8urNJZ/6RGPdx2j4I=; b=n97YMzi4zW304AEXGQq1FGYV/gGV1YdF7qsOerHC
	7Wc6SUTcSXTOQBJfikCK9WEpp2SD/YNEO7UlUNhnP9PK9NQi8k4RgBVCZEWZc6cw
	68I+cDm2t+XnTQLaGWZr4HsonFU4tXf2+3qpAPwwAg6cHN+ftrWbRZ8ooU48UuAm
	dq1YFAWdp8oGxX3yUHbepp91UQOOTwdpaxULZ/7PochAjsGVJjdcKgwcIig2g6/W
	72279bQVHIhA29TjRgGCKhxC2mBy9nfxc09YhHZ2/mj162X3iahx6G6pPnfh2J3g
	4mLhSpSTWiSWewWGIg8I9MCQJd00/yFqW0xobQyxQSoB0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv03w6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 16:11:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fc0d0646f9so43839571cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767715905; x=1768320705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2OsZw1mwR7uhMWD2rOzlNZAsP8urNJZ/6RGPdx2j4I=;
        b=ZSDl0Q/gYMe0xyZcszsUgltyoK9j7tZaq6I+h3z099fl0VJ+Fe8VUgA0obojxcxbxx
         ucNs9FaN62Pg0GU9vzgJsloig3mDYPJcHEWkrRAZiwcw4x1BT/QrDnirb8QrDzhLXIXU
         e2RT3neJD9yqkYMJUhxlyfcDIFlfQfjT4e+xwIRN3ivmc7EAoYXXPYJRGbjarEcyEtzR
         7O8ZiCOyOjhwV7ff2o2qPimbTUjk68hVjZNK7MpVm1mRQuALbpG06fiqk/z2nt1RuaoT
         iDcDorYPpXm3OpE0RRq9JxC3XsqSf9yhN2GhullH9ORF28zO3xzgAj720QjeJdUoLGgU
         7sTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715905; x=1768320705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2OsZw1mwR7uhMWD2rOzlNZAsP8urNJZ/6RGPdx2j4I=;
        b=fDQH4bWfnKttpUoSLo/ROzVUDZ8lfnOQjc84AG8S4naARzkGnBpJV6ZeCoQJ0s7LX+
         w5AC4K9JHTfTnKbTjtD0V8e+bVrTs45QDowI4nM8my+pkkxR5K/xZxg2m1btsH+8tKRe
         DXB8Gem0yFYKymXYwMjnB3AIgzYaJhUiYYrf93tqQqGY2u0tFIjcRtRGX8ST6wZ3iLXm
         0Q/O4GvlMt4FVBiSUHT5fMMN0hDbmYccn+BddNBy7aeTBx9HHRjmnwqml5TbP4Ufu3h3
         OtrdhTAADC6KleX/E+LWllV9PfGDjFuAWBtJKevQIYEdTK9/WwftR+rWIcjbkpeEPB9C
         O8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUqdU80KYP7ZsZO5I8sHssdNa7M/xrkd9BRejzS8pARzksBzEC6zy8r/g4pjmowq8YJtX7oxgNFxtY4E9ov@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5nb+iPETLrsRUfp+izA0a3w5N7e5P28Phs7nUlOYddMVXHZpd
	4O5rU+53Ms2XRMYo5XxZUXFrcddvPp9YLScXchkFfaGBWZwIr30JAaB4sO/KFXmFgon2ahZFzdY
	ZImh4mv42RxzM57jG50Zm+edHMPQU54t6N9+XXAhG577vc/iZm4vPhwUOSJDlUOMzMkbt
X-Gm-Gg: AY/fxX72MhfOc4S2gd0pvE2iRDK7h4kCAPQKitmKQo0cv5n9TDQn6elLAz0Clv/RHWi
	DbDzUwDFAcCDmv7921j3qQU2CxFvB6/SDynfsOFVVok6CDouU9xffqLXxBY4J8d0pgnagNnRmq+
	6dm7FYq5sj3IPBr+9fI3R1Ta2Cn9AMeN4bAogVBle74xlpRaGxTjQRscGtqmjbfeEvEtiyntg78
	vMkJV7K7WgUzuMw0JHiNcyowyNVto+kETwpPXJKmEGXo8/vgTHuaXWIHIFqyjuvCpN2FM8RPGOv
	lv6hkt3sCdy4xQcHSmH7jmVGrZpoFRRk3pcubM1TCLKhX07xN6DHL2hf2IYWCEwfnsjs9ZfZG/n
	atMP0Xjl7GSWEh/jysjNUQhzgZif9I0s6vF75TZFuxJ1Uy2xXMyJbuK8feod7KGAlv+jfydTW7Z
	KeQUcI0eNGlhc7Np8eQSIPRzg=
X-Received: by 2002:a05:622a:2505:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4ffa7822b09mr47889271cf.73.1767715904755;
        Tue, 06 Jan 2026 08:11:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJimvHir7EfJnUsNQVjQogGub7Vv8k8sPUI6byhYtpLHhCYNvjMIshMY0ypBffsk28UYXAJw==
X-Received: by 2002:a05:622a:2505:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4ffa7822b09mr47888811cf.73.1767715904378;
        Tue, 06 Jan 2026 08:11:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8e7sm678067e87.18.2026.01.06.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:11:43 -0800 (PST)
Date: Tue, 6 Jan 2026 18:11:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v9 1/6] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <rpijefy67qokw2ehe4iv6msewiwayiqdz7paalgspg4ghjwzlr@7q6gdoohuuis>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260106105412.3529898-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106105412.3529898-2-varadarajan.narayanan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695d3441 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EDSBdl3HVflM_WRIKtEA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JqFG3EcYNcOsKkXQCGPo3CoZu4W_3JFE
X-Proofpoint-ORIG-GUID: JqFG3EcYNcOsKkXQCGPo3CoZu4W_3JFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE0MSBTYWx0ZWRfX9oMBT5vfm9q8
 H7AYNV+JLEd6snw0vVgtux2dQk/Omab9BUjd2I2+7QFotXYn8GL7q5dHHG8O0VEK7Log6A6IOFw
 QyI1h27huxag7yVLkV6wNjCxwKV/+YSZqWPjaXQAL6sAQX9xs5N8dwxjiEfqFUcP1fRUgtYUAaT
 9d2y1g2jM9SoC/QNNqWEo1NYPhoummgj0/GXPRyZyD/BxDy9MuPKPQj+R2WWtCuDqm72O6peFNo
 0/cj8vU32mu7O9i9huNsdo764Xvj/B1pLo6g7jz+P/qEJ6DTKqATYUht3A1a4ec9n/7TSFICqXR
 7i8yndloLLO6C97AGSM0ByYGe++AVKeVWTAlqHx8RZDMRl21R3wB0+MsQiaAOqYY9TiSTXyZZOb
 RCo56jeK0oNK+Q78tGn4RUtQZ/5/Y5Dc/sTYDooXC1g9r45kM/Vmm8sItRjtw10gbJ9Hc+n418Y
 3eDNNlPrnpztHH9TKvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060141

On Tue, Jan 06, 2026 at 04:24:07PM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v9: Added signed-off-by tag
> ---
>  drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

