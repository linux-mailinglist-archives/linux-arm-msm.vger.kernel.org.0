Return-Path: <linux-arm-msm+bounces-62688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35106AEA64C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 21:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A2E3AD352
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 19:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD622264D3;
	Thu, 26 Jun 2025 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRwBVy/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106C2EF9C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965635; cv=none; b=AV/mPqBVADgbxB8UeLH0PYyStqQGLuEZ7rpjWSu8INBeaf/Ddfc3LnnaUJRRwQJ3BMfeQwPfO2tI8Iha8Cv3W6Xyablk6e6zwOvrYivcM/tJu/WdM2TpJ2MHUI05yWX4Zkj4yvPCvX2oweyXYVKghtwpNC0KHQboesFp+04RFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965635; c=relaxed/simple;
	bh=5r6q7+0wAzu943Z2jyQlPtPeKr7oOGYM95kHKprWAYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsvrUTP6fL9bNsrSU5Gek2ApdzrItw5PjAV7fyPhFcqRjQJsKQkgfRYMrlbMlVI9J3D8ZTivquPuWUSyPk4/nZ0ZkgwYM1BBkth4dIz+PqYeWgxIkce4+dsxfN8reCC745h3BZbLjCnQ/Q0M8+HuYf2ZPfpCefteWrcGQLnR1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRwBVy/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QI8Upk019078
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=; b=WRwBVy/BtSis8QCO
	+/YTVUH4/AFeUJ6+bhVkZHelz1uZGyqE4xdOZPVNtH8jZmnVxa5jGJcxnCWamE+7
	HBd++lNOOkubJ+YLzLbZcMWIdzkPpq7QPqFRvvPJVwh6BYgZrNuM2xle0Z8tun1C
	yvsn+g5n3fjdpFdpQPTHsxFXBNTsVLhq08jQCrcsrpUjc8vFIWlDVP2arWcJZpBK
	pptfx20PTEbhP45gUMvi6QsCL+wT7YrhHLesFWt3+MJpaGZIb54m1Qe4WmD05oRS
	doqv2ikFoLKbJMvDoRnPaxogFK3s/yDNGGZPAZ3ZcdSOMdOtOv/mivXnwLy4Fb6v
	11zcVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26erv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5911ed20cso968371cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965632; x=1751570432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=;
        b=cEtHFKbpL7H34ZNlg0Q87gTeHC6q8pBWcbJPMy/1+XnD6IG/ADuEW5OmFhDuYUZVa4
         JSy4rK6r6wMgh1oFeGLq1Ahrz7zrkx6M1gZndP9LGmwhubO8vUROit3NX3MXx9hYgtO5
         TB1mU1OWbXYOJc3VrCAZtAA7TJAro8nx5PueNGkImUbfVfBdZ9R+GekXK/5PBmX/qhUP
         fhn5z7xR318RchF3B36+7ZbM7Dj5iTXCUVML59zij/4mgIxiERAmrs5DuQZL64vjdGD3
         9gxHgUrBUndvd2gKGNbLMGNGAd1EWb3mD5uacGxljPEf1z/Yw3sNCuiVAoBjqKz/pLXF
         lErg==
X-Forwarded-Encrypted: i=1; AJvYcCWwm5KE46ok0VIdo6a4gdvq5EFagniteSGE6uhZu3OExf57mmMsyIhlIDo/JK/BJtcva7bakE87N2rQLZKV@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjpFV9f3oEKHEvOO1BcTVzQ0XTMPrht0CI/ro7nYlK6jDVyrg
	Vw3ANq+DpbE+uwOV0tkQi0VnpERuI7NguUDeeYUmw69pjASvXDNzD/AizxWr3otG48tkLqZhI6l
	xOhbRoTOOKd+/5i9VNTkIlaLghu+y8Dljx7Z/QSPli7iJkMnWBWSR8bE7XCzmhhs/nXX7
X-Gm-Gg: ASbGncv4QjdCc5do4GGeRhEH9CZKGxwOW70X02c2fPBUlAZBiPCD2BuZm5ZbReASM+H
	t27sB1r2wstChbWupUsN4DMN7fICE54DELqq23PP4I0YnAsfcyvGdWTLCcpdG0gOaNdha4v041l
	+7OJh2dBz/Y+tJTfL+dLEpvKB6F3+6IBqhx/D3OO+iWzF+YurgrP63SRUpFsgeAaimyQRkp+1jT
	u04Cc+ak3Rc8qhjGKGVD59WhZjObk0mPVRMvC6YNTV1ZCC2kpiwD3bafMXLF2sA0ZKENOK7iFYO
	vKCgy6QoR1X/fgkjcid1uEX2nkk4kIgTHlcv50VaHQMBrJpJfM7LAsKfIaqRYtySTLiP2qsvyT1
	vycs=
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100691cf.9.1750965631714;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpEZc+VDoThophGjf8eCV3b76cou4xRyhNwgBBJqRGzQLg/M6WUxJq4j+uB+jHeRoCTB1C6Q==
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100491cf.9.1750965631159;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2140d91aasm44338966b.64.2025.06.26.12.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:20:30 -0700 (PDT)
Message-ID: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2NSBTYWx0ZWRfX+FjBSGoHabOH
 LIHMpZR9fhB/nW8aN5DHqTOoOHDFM2izVg9ck3UGt7xo3pXhuGgnPgJpK7kZCQFM6nM03xdO4iH
 xQ/LQ5zmzrv0binz02lMVtfmv+4wWO5q9+KhOxkLjlwLSPfRwlST2nliYkgp90yu2Qz7/f1xCzD
 svb0YtYnwIJU7GnKXPuX6U10j4MwyzNwdXkPYR5GpZ/TyuCIufUdEVY1+mB3JksD8qD9Busgsl+
 Mw11p3m+5tnqchQ1MOhCgkhe7cAoEB4LS0Q5GzzwKqyFGlNgWExsdOw+OC1HUu1Pmr9meM3dUo3
 rp9wUcQN3nKhHuA4MS6JXY6w0Aw/WzKjfrNtpna+BpeLC4NOH88qhknLJY+yBOsgkKe+xf/vWr4
 FWGt2kfj+/yBD6VcjoJ+Ap3rnSqLCz0c941/dNR8jAxb581YpQCBVPityvw3cWoXcRd8FETh
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685d9d81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=qm_u-Z9MdHEKZBNG23gA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Pf_CkjYH7f4N9QuKJauhlYycqIl0Axxz
X-Proofpoint-ORIG-GUID: Pf_CkjYH7f4N9QuKJauhlYycqIl0Axxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260165

On 6/25/25 11:15 AM, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
>  	.ssctl_id = 0x22,
>  };
>  
> +static const struct adsp_data sm7635_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mdt",

I wonder why we're not putting MBNs in here..

Konrad

