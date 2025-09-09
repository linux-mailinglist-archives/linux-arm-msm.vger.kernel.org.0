Return-Path: <linux-arm-msm+bounces-72705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3EFB4A5E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8440F1C21E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64D1273D67;
	Tue,  9 Sep 2025 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsGKWoYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F72749EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407681; cv=none; b=nvoIfKhF9L6L/gzd0dEBl/3OWtxu6lctq5J4PjEmpYrWJaTZha83ZqBnKJKWaYHqtqwznF5RjU0G0eDyMed20YooAiaEDCiMZFpsxEaRJwVOdBw6fh+zOsoa0fX8gYI+df2bwjus+6rBwe7iT//AobHayAXdlGIaIGSP2eVareI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407681; c=relaxed/simple;
	bh=Kx/ttkJLLKYRFVmgllThM47tiA9M6uxgKLcDhYmE1p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/vMfp6V/PecLog63EFPJgvxedeVGg40CQP82QU7mA3rhWrepF5YVKSOMo2Ep+ulgpVRMwuaFvhb7XB/igLp1hzsfrPQFOGI9Tizmv5kCZWNKZnDCEdCrgOC6Ydmnk6nNLN/3tZNIj6irSISHHu2z/nn3rdruTgQ/3AUIHVpX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsGKWoYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SlG8028202
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kb0CUgscggYSZpxpcmC4xv4Mz5gALmhi0zSX0+xuhwU=; b=hsGKWoYFicuyoDCf
	Ti04diUy7hLxVg47PJ/7DkxpbSIECaI2OEtcGzUtb5VrnzOOFWoKoY882YtZuz/6
	4YRLVlQpTk/vS9WSKf6PrGMJfW64Q9nfN0WaMbYIkIxQF/zl+B4j19jSQMAYM1jn
	4s29BNyiQ4LiGJQ4zRK82D4SCcd3ywYN+CxVgH4IPA3F/TYIz3LGT6IhVO23aJny
	tmMKspzb1qCJMF4LphD2nYCni8ipUU9YVn1YmgxRGGz66lrPCIN+9+cEVq0CJufh
	bkAHEcZcRqD72nuvTdIJMvVnZu3RWVebcGhgJWpzFaWYV4CvD9+azc7xAuDmEFcb
	1v3FDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfyduj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:47:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b6023952f6so11548881cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407678; x=1758012478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb0CUgscggYSZpxpcmC4xv4Mz5gALmhi0zSX0+xuhwU=;
        b=P53qnF8JTRSfBmLwujVP+Wgoz1xJ20U0SLk4Gkrw76cKq5+97a1TBymPv1uOc/RyKV
         WaIz8vECQ0N89YC117q+hgE9zEB3WNPf3D8Ry/90BsUef8GgS/0EpyigM+gg8hKdhYTG
         7+rwf0n4/1CPfQu/KTpcppmDVpmzZZh6w7gGP1sdvCmNLj4qkJz7bII4sCdo1iPwMSZu
         xdhLl9erNZ8ZTrMiNg+PvGK2bDh58TQs0xFarcdlQIkEvGMT132zbcymt1tKUaAlHB3x
         3QA8h9mtHptpCSjA97bDKyPatMQ6ES2oQae2BGwQoEyqOWiMdhyAIc57BWWEbEu6GUsR
         fPnw==
X-Gm-Message-State: AOJu0YxX+yZ6k+kyvk1ULoh/54N5WHYSqR6OjfAQDbwzdHMdAz+so8vL
	Vh1iRsv0LRqQm347FUE38s5ts7WLgeUcLe0huLnl9v8v7z4TxiTC3J4UztJcD9lkKBs6XVcjynv
	7UXzwhUMIhC2kYNrWjZzJ+jHyAC8PhUN7Z7CfcTzOaO9aIb7lcSSkgLYiHWrtJi+V8Tpn
X-Gm-Gg: ASbGncum+fOogWY+XSrCcfMPc876YNiqibS07QdkMI3h8CqAAmiSQ2V0v0kOlGWhjsa
	mjLTn4hlVna8U2Wsd5o+FejyaZZ8H+dym1gfAmQovLMYZ/aU+m3SLEf87D4VLhks6GIlMcHpaiV
	O6ReqccfSvIRx6n2l2g1ZHUSb44pbmgeQv0QCPP0QRyq9DI8QNh7FL+U1On64hYGayMM+/RkKcd
	OA52Dq6Ycxe2V2lxOoDrhN3kBqzs8xvrb6bMp1KtU9sWglWbXiuipA7FYfGb6I73FtKfyvp16IQ
	Jjd9wbMDrRlg9PbxSJfECr8xLL8bSV5Sjxt3SzYsl57BbFpaHXOhCgMTOJGY32/u2uKF5KUfw76
	24z9uuW0LV3dnKqJ1mK4Q1A==
X-Received: by 2002:ac8:574d:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4b5f8485b15mr71231931cf.7.1757407677915;
        Tue, 09 Sep 2025 01:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8NeMee6C0kM9sHZRCMxBaDlxp5DxwY+VBvze0KUdNj9nDNquj32l32DlypXhISIsSj6zokA==
X-Received: by 2002:ac8:574d:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4b5f8485b15mr71231871cf.7.1757407677406;
        Tue, 09 Sep 2025 01:47:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047a90387esm1308826066b.0.2025.09.09.01.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:47:56 -0700 (PDT)
Message-ID: <a4f339f1-9490-4ff8-bd92-9b03c8f62ccc@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qcom: extract common code for DP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
 <20250907-qcom-dp-phy-v1-4-46634a6a980b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-4-46634a6a980b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xY0xS3E_xKoYEcE0q-4dmC8WFCA3Zvy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX5KOi/Y+C7y3w
 5Qh7zUkdR+0x73CcAOoq61FRlufqm1vtPcTX+vAt06ZIv72wSrIBcTkbLCcIz5LxI8Ng8zr7NTr
 cxH+cC0kKKkz++aolM3wl0PmNosoheysESZwKL831JcYu8HLse4JNLot9TZDIWHVoPhrsGQDO76
 ARkD5mn3qEecUwoSy9QXuyldLFahAgCEZ6njtN7IWpIPcYmyXE8BbwlXUglL7D+Y16ej0CdoFOU
 yFkdbQtpeAr8TfDeBSKl2+4c3l35np0a1tXJigMklDoIBvtMGePUoNPUHbWaE+Nk/FUkh1aq2uu
 hxVdnrxMaqRqzN25x5Br1Km9MHEPF1/4N2aZUTS6wXeKaD1RPYYh3neC4TL/AHElR4QzvdpMRuq
 rurWFSqN
X-Proofpoint-GUID: xY0xS3E_xKoYEcE0q-4dmC8WFCA3Zvy6
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bfe9bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eeBydtCU-ummJPyDYfAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/7/25 4:52 PM, Dmitry Baryshkov wrote:
> The combo QMP PHY and eDP PHY share DP clocks implementation. With the
> USBC PHY gaining DP support it is going to get yet another copy of the
> same code.
> 
> Extract common DP clock implementation to a separate module. In future
> we might want to extract more common functions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]


> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+

div6 is oddly misaligned

[...]

> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	switch (req->rate) {
> +	case 1620000000UL / 2:
> +	case 2700000000UL / 2:
> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */

"(2.7 GHz / 2) == (5.4 GHz / 4) == (8.1 GHz / 6)"?


anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

