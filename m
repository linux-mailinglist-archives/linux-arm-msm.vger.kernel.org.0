Return-Path: <linux-arm-msm+bounces-72285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8EB4581A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1E5C16ADEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D47350835;
	Fri,  5 Sep 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJrdYtEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998362E3B07
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076414; cv=none; b=tZWEjtS65pY1ppQ6OYQvkIJxZ6FArKFd4HuiIb3kDsPhjAyatfbNXTIxF0Jrh/7Z0Bhjg9yE861QwIeN3Zt8Ai7xXQRczTThZgXP+BFmewBj+lLKOru/M0D90KPBcTf2XBak5vNUSnSteOryVWpeTBnsW+0Yc7AO1caN4dHLTJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076414; c=relaxed/simple;
	bh=WdzrylW6D5k/Tf3MlXm009pxRMhKTuh6CF95xa9C5lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGoCdNxz2Sqv8PByMpc2NPmW5QsxRTpoKzZP8xXgiGb80An2K7xu6IjFx4lwnmm/uwit2SuOY6GpdjgsYw5Ua0wjjLBW1lAPjG4V1+nQ78dJZj0mjYwxDdvO5EovXxSMWk4KqQJsE7GfHPzVslga1JvUIEGXA8GFPybCl6i6b74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJrdYtEt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585936wi014923
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SB7U/jII62BtLsfK3kvMJLkTFF545hw+zs878TRZ3c=; b=YJrdYtEttXAITCPY
	4qYd8AMnHHfAG/l+5jjnZLO8fLK6foNRQnVcZp67dxmdhGF0v7r/eqgP3l46j1sl
	f5jXTVz8d87UBAyagvT9l4cMu2QYvBRN5g2ECHq9bD8vkEfaGxuIJUri/OKQ+q85
	QtWaRis+ADqBGL6KORlALm3UJHwlYbMylZ+hmz5XPCoCFfcEc49ZdUQm8mstRF2W
	4BSiMS/mdr8nHL41mM7cHXDtjDBjwK/G6kiB/rF21aGgz/90cbrKk82TNLYJFmgy
	/9BIYzY6vn1BDyOuw8brJPIbvKsudX6L/f4iZ9XbZtK1P++x1E5r1SlDlIxMhjM9
	5ZH+Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3b1ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:46:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8051d4916b0so76103385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076410; x=1757681210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SB7U/jII62BtLsfK3kvMJLkTFF545hw+zs878TRZ3c=;
        b=xH0EuELC3hUcVSJoiA0V8S4iLuKQnKvURIExO8wwe+g/ALSLwablxgfov6qPWaaXgz
         yxwQuLfL5IqEDUdfoiiPzL8Gh36WQdzy9GGJSB75IgRNtO7oI8X89eRom/BKYM5Mmn7P
         VKPdrgPyMCVzm7v9ZPhB3Jf0LbzBZP3Oqtq4FmwL8gRgO2Eo0z9ohgnHk9d0uWeL5dbw
         ftUgddvZGqq0d/a7/CZxCQzPRv5Z5gnJJ6tOMc2ELXCiSpo+nli2MZe3Qf64fJRQhzC5
         qS8Rck1p/V+su+WCr0Sda+dSOWxjuIdtP6W1kKbQaOVfGpufi+qhpbwZUUXUc7+E8U8g
         PHew==
X-Forwarded-Encrypted: i=1; AJvYcCU1FtsUHQLApjmJLQNLYDb5cxRM4qmDqZ+1oi6W8EKjDWCtOJASxfklEd9EBPMkwJTZWEzMkWxrwBoAB54o@vger.kernel.org
X-Gm-Message-State: AOJu0YzLyEdCAJYUmjkuy8pBngZNlqvLTGd5SbLJ4YNuhDC+IJTkOb7H
	NdQhoSAInCBSbJUfGI6UFNnhQWUZfQJxJ+s4mz0RYhJ/8MeYWnLZkYcq55Ko6Yvs8ErcQQtinef
	KMLyt2O5eq0XIh1RuCl2ah4Mc3prXph9mNFOzDmvREa4cDaoXdBDrYE2aSpp6cvugpUpS
X-Gm-Gg: ASbGncuqovIIGQY8d0wtnpXRBOasEuaJLYsM2B+3BKzD4VBLz+PpEEuSBuXsH7VEIYF
	s+2MmWHXLC+lq4oBrL2FK/7SHlT4RN8QvNJp43lPHF3OG7Kq8K37uVolSVdthTDhwPsvereaNmm
	0f7a4dfKYD9F1GgAIWpKegSJ+2LNWWfEe0TnyxclQEmTxIPSGntNX/eoIoBwHwKFJIEa8TEl1KM
	CzHGreyIp/TEJr7Q83vkmWLIcAE6o+lhzOQCScKofACG69LEYPnrafmLAhW4dI+P5y2VcL3oWQC
	1E3zvYkKuUqtG4cJOhTFUVVwXbwSSwTZygsy//XxRtCjCHMEVvna4qcuPnlpWzppbWsy4APpnGv
	UCRFOBk3TOq3g8JiSKNd4iQ==
X-Received: by 2002:a05:622a:50a:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4b5e9b60fa0mr18609621cf.7.1757076410262;
        Fri, 05 Sep 2025 05:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED88BDkAu3hHD2gZnrUFPzTysohw+/x37Lmb3zruLYrQfgSkQsU1HdrPUH85++Pzq/cKzFMg==
X-Received: by 2002:a05:622a:50a:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4b5e9b60fa0mr18609281cf.7.1757076409449;
        Fri, 05 Sep 2025 05:46:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0cb2cb07sm1727752366b.16.2025.09.05.05.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:46:48 -0700 (PDT)
Message-ID: <055bb10a-21a6-4486-ab0f-07be25712aa5@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:46:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX6v9MKbWVVHqI
 Jz3s5SesVBY0MGKN7Nj9BWXRIskV4A+6NbauG5IugJhuCpReJumHD2z2tYm/m8sImsQDVWqu9qL
 6XyoORtZ/yERDwSXweBlwjHXe/Nq/Khjca1p9VnX/x02Mkdl8npp4GrtOoeAbKxsDpzm7M4+OQZ
 WdoU4aFGKaQ6bSVsywS84wygsO0BtFrO1QPyxJTtvsuiigczxBnNtXyD/+NxH7AlJ4i1MuaHVjs
 GZiSZAPKP0pRn3kvepQe7yyst00cPVAeS5OpjnqBRJXwy64ZKHueC9Cy8zVJ1M2gzNiJsXAgeSI
 xAIwcMoTD9hlrrLJn+QCoYCRw/e3RLI6iod0+6QKEPNFepFQLQcEBJq/iKVoK+qmWvUKDrrY2aB
 3JaRcrHK
X-Proofpoint-ORIG-GUID: YUuidp92OemdBOhyn8n81hU4Ca7PwsL7
X-Proofpoint-GUID: YUuidp92OemdBOhyn8n81hU4Ca7PwsL7
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68badbbb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3WfgD9H-dY_QjJaUS7MA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> Enable remoteproc subsystems for supported DSPs such as Audio DSP,
> Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> firmware.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 17ba3ee99494..1ae3a2a0f6d9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -425,6 +425,36 @@ &qupv3_id_2 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sa8775p/adsp.mbn";

Are the firmwares compatible? The current upload seems to have
been made with Ride boards in mind by +Dmitry

Konrad

