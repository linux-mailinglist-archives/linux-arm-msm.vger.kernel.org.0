Return-Path: <linux-arm-msm+bounces-71538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5120CB3FB9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AFC83A8B3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0705C96;
	Tue,  2 Sep 2025 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg6usMRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D50A2206A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807288; cv=none; b=rePrgJ3iCQDPjR9XUiMnWRnGhfB016lOtUpS0klHjhktHyDTI8MVt4RNIdn8h8VJSMFc0xMea4mT++2oBoaKRZc4NErT5PGRlqu16a5OPuRChH3+OcNfcnbzHv0Bq5BYfzf0Wlf4B16Ct/AYnA0NZkC6X8KV1VlFYe/xTcVlC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807288; c=relaxed/simple;
	bh=b6S9aXJNB9FiVBmBPI0rNYFgxKArdGV25PtMwNxpkC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQv7QhnJP5FMzM489Gv5ZmlFFru1dRK94IXrv1bSI+Ks8wMdS/hkoVqEcvtibIQ2sJxOvJWl+whcQbknj99rOYFdCOkZAhJMo0wPlTTpdTxsOe/QgFR+k78chDd8F/kJOPcttEywoyn5vXxe4frI7SM14KkXn0shpGY6UNAuK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hg6usMRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5k4010330
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnQNdYjKaImdUhh2EuI5V2L3ZbgZUQIXMGDK998UTcI=; b=hg6usMRPaHWKB0j2
	HP6v8tvSgV/t3chlAA9i/5ahJV4ZWkb3gpjRJ8PizQOE7mzt/l8AvFZHdYYzKVHs
	+JQ1GxBaFb9wB9+koCx+8rFUzObZq8WgdmMLzEV2+/IG1wbuCuwNm35AU3YAHgpA
	HTq/i+W9lwkPtNOLXFWfvwV/5YGPnTab2YtDy8kip+ZyoiUP3edCtUf8OdEYxfwP
	RwfT/nFZaoaROr0hdz4R1sxSZ/07I9QLPahXlfdhxhoJDvN+XBQzrxL4xvi80mk0
	7AOT8DHsEKq7QOPJKsF183WDH7fM3NqSmSzjsofX0AiDrGdec4eDzbXr98CafUhy
	cOBkBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfcru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:01:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b331150323so7440271cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807284; x=1757412084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnQNdYjKaImdUhh2EuI5V2L3ZbgZUQIXMGDK998UTcI=;
        b=GOuYwGIeCx/tpL7patNKx9GLc/HK89g46PoQgUHwKwdlkaarjNb8P2aZP48323wr5s
         8d/2f5EsLJ5XpKFiBcgd357E4OdUZsnLtRlz85aATwRWFEQkRj1FJfHGP2O4Qv4lb186
         +zEkdRMsbh7+3VVrvTcoG7ASE9+zeJ2XJ9npBgX9GPDPwQo2V7gWbSBUyx7skWPpcIIu
         Wp79zYI0yjrHO/WnMxcu8fUD6jFVmy6DtD7JfrT7gsC2i3ocyjbOHz8cTXUQI6i81VtB
         zDprA/1oDgeSeniqQODlovPlU3AInmm0pj06BozfCJFa6vpEMSL6KVemTaLU4PrgJo+3
         zzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW85J0U+lFkCrJqr9/5Pv5mwQuHLBOsIYxiwEauDfo+at4SR/nKnhIHJqhru14cnqHigfg2tkhKN+rGKSIL@vger.kernel.org
X-Gm-Message-State: AOJu0YzORySHw8227PHDws/YOdZW463NGnQ3UsnwkBtzL4PwA2+pTX/H
	wPbfvaLUPLwZO+GpKCpVPqXSvakiUNWtmlUVL3hkOVY5enXqUsYsdN/t+e6XRWuuEB+9jGLC19Y
	vf3T2b4/jjQYrvnmMJ7Ayoz+k3czOcwWP74UTAVgWn+QSO2Ln3HMf44sUPcboi+Ms92zY
X-Gm-Gg: ASbGncsoGrAyj5QxAQAop2YWUSsEBzVZ48T8M3PAvmeQRuGTiVvwXMiXH4UecpzHqvj
	u1axP2lOSAHxnkx6AL5uR7tILLvSqKKy5NKxM5vatxA1w7j/kU69kpNJYysYHoZDqsqwsWpBKUr
	eTugCrY3MPxgkYIsfRLN9kuMBeO3ivQZbZbWfeMAFnNpOxdzwJwNedcv3qS0NF9nciwEg9Gtv/6
	Ry9tJ0uF6KO+QwsoPdLTRiflQ+1Zli7mJeEBLmDWfsHU1QLsLVh8KM5GStrTGv94nxNexPRrgL4
	0hrIeIICajx87dthFJEq82VP+it1R9asGyM1wiXnpDHCF7DSIhlaEGK0TEW7DWthjgqQjrmRnPt
	2ZlHieFP/B0yTdl60dguGOw==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b30e906341mr107308981cf.2.1756807284323;
        Tue, 02 Sep 2025 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqXLx8JVOaMKleJHkt/Tpo2I5yJcV/rljW8zQPxddy/yHMAylistjFE8GUMWq+nIvbZOF7NQ==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b30e906341mr107308451cf.2.1756807283676;
        Tue, 02 Sep 2025 03:01:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0432937d7esm398015266b.17.2025.09.02.03.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:01:23 -0700 (PDT)
Message-ID: <bd11cb82-d8ad-40bf-8bed-82f9e8710117@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:01:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soundwire: qcom: remove unused rd_fifo_depth
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6c075 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EBKaaXEv9MviPiDEuogA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g9buXAdtFU5K0i6hESh49Qq-DQED9_5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXyqZrW5Q/FTkf
 1szaAClmWfOoWgmEBsZ7XnlYqjw1gfRPTZyFBNXPccZ7UYfMM7uEkGmTQeVURunLyDovp3k2NVJ
 BhT/6pmyWWysODpBDMUuKltKqNsYycCKi2QlT2SJodDT8fDHulKqZMHm2zU8CtE4RiG53Ihuzjq
 64r0b+dqUCH78V5XAPnlH+7e82KRngZjKws76vfRiHjgUQ8vlX8FXuabEYWl2hOGuccY35P1bVh
 qCyjn1gd0fCdIjqmJYOSn9/HZR5mVi1MY5cxHExf/C8Y9hnD/7WK4COTasf5vNE82e91Mpr5vIm
 EEx35QlRN3q99utFayhUyuinjSSfREv4huVoY3v3CLU9Tm+69CHHWRTBUcudtAvvgM7jmSOQVLE
 08rSQZVA
X-Proofpoint-ORIG-GUID: g9buXAdtFU5K0i6hESh49Qq-DQED9_5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/1/25 9:50 PM, Srinivas Kandagatla wrote:
> remove read fifo depth field parsing logic, as rd_fifo_depth is never
> used in the driver, cleaning this up would benefit when adding new
> version support.

The last sentence is mildly confusing> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index bd2b293b44f2..7f19ebba6137 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
>  	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>  	u32 slave_status;
>  	u32 wr_fifo_depth;
> -	u32 rd_fifo_depth;
>  	bool clock_stop_not_supported;
>  };
>  
> @@ -898,7 +897,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	swrm_wait_for_frame_gen_enabled(ctrl);
>  	ctrl->slave_status = 0;
>  	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
> -	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
> +

But my grep confirms this remains unused

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

