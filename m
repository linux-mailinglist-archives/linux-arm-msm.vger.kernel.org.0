Return-Path: <linux-arm-msm+bounces-82906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 13277C7B7E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 20:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EC4934B287
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 19:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72162FDC41;
	Fri, 21 Nov 2025 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bf7nxkAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V090IMNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CC2DA779
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752939; cv=none; b=Kr61fiV9E+WLYY0cZohjOnmwE26mvePVMINKMnCtbVGA4Ba8oVjZPM/jeThFLKpoc3Oy7vCzY0/z4M/U6n4tjjBnz1mRuc4WFCDcQB3gRJnPMmFwvL1MZKMRZE1W7gp2ETd+coIfbnJq03fPw/FCmERyK9GEHj7yOrNEqhzmPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752939; c=relaxed/simple;
	bh=Iy4IGpI7H5qsGO3a+9olmM0/Um2Wnr3T2Tyl0OB5s3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liVIyy+KhyDeHyJ/Q5FgX9XDPafXxZfqVm+1U4gLdufnWb/FKYcevpQkFaDlogj//U7qvxQ4zRAYlE3/gbf5NUjJrkPBH0PnfxqKd+6OWk6B9uxP656PZIiu/H1DMj+utaw+on/7U0uyHZGsWvlBCRhhiSRaQGs4WEcYtsvATVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bf7nxkAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V090IMNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALFvkL53139698
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XX7sXDsrbKhM+8ffL4RDry4+EToKrTxEKsopkzgBa8=; b=Bf7nxkAWwmtR2nZY
	29KW1qmadAv7ZSiW/rhxqWAKE4RToLHZCEPEVQ4TTpGdYrPEd6TNVCLGNDu2XZAn
	7PUbN72asvwj4ZyCLzTKT1ckfsJ9Je2jr7hmS4DmQO3KDHmq1IKfSiv2jtFktbGI
	gyvIZSu9B/OWCJymc+BpTShJhUdgwQUBPhV+WN09Krp3scqpfElDy9w8OPgT46B7
	lH4CQ39/mzYlFlvzcJDmAYgjUw1ba4/hRazPt7+BtJnt2rde2mfxAc/cXUk5Vi+/
	K8c3bPwZscxEXTcXI/jK8IQvKABD2pTVpWTOrPeMuZG9GXoThdgKjrZmM3XKXDnQ
	liIxBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppj55j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:22:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so7849371cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763752936; x=1764357736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XX7sXDsrbKhM+8ffL4RDry4+EToKrTxEKsopkzgBa8=;
        b=V090IMNm6QWg7mKXIvmHwu/JfkkCdgBaCQuS8/FbgeASHRDsNGmmn7mMRwuwN4Heu4
         5Tm+h2PA2+xkpDTAk89ylDaxLXXjnIFeALiQZLMsoCKHXEv075xPCmBgeUXbAA1VcDwl
         xa34CRGy8OEMBOdq7V53dIS648RtVi7QDr/koKfMvYfLudi/U0gIr+p1Ux4twE1wGYjs
         1bg0RZ+OFZw/5QSTAUlm0W4D1sBoWmIzMWbD1d6dXIIDIjRd8VzQl/PJTt/P6FdNTgd0
         GC3tDiUr7uLuFeHeiSxZVmR+oiW5cdvbredaL/kLYXoNDjiXJJTKQziDIBhCFyD15RLB
         t6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752936; x=1764357736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XX7sXDsrbKhM+8ffL4RDry4+EToKrTxEKsopkzgBa8=;
        b=d5Jqbu+HKSEIqvLV2EH+1rnEl4cTX/Hr7W0y+Oqx0/N0l/2/KoSq/H4nxc49FRPHuW
         SFcUqaj3CHyqMTAtG/8FPSMiusEBgQJJi8DSqn8urQ6kRYfSPOsaw98ltxMu9sbdUyLn
         WRT3UMCSlLwDUUr0s/UKtLcM5isx7NhgzvKGlpFfv7oeLp1Eym6Jh6n4OR2oEpq41DKC
         ZW7zP84aqammsYoxD2ZFtnOH2YWphCGEr5g9gEvLtFKa6Qq0HqMQ/1VU7ZrDoIOt0+SP
         2s+nQSgQsr13iqJ3bpRIM/KIrH3my48RHvKojRcWOvYL/XgrBbGFP6rJDwpSeKiT2AbI
         f9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWkLr2PiEYwv203LiOtnzwFxJTotzWIZnDaKGCsA51rYwFH96NykuO64CBUQwSk/LLXeYUyWw2TQElogM78@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yyFQ04QxyVSBpJy6YclDJBl9JiGXoP8yofpKQLJNck0CrP1+
	de9xCgVP7TZUeKww3YkKiLomGFxKeYitSKcplNOpg0GyJ4ZxbAFuhcPHHrXBf4w4hFK4budS97G
	4kE5RJusd6KpfKHAK9wo+hS/ECzlsBTTy4RIEPv/6OTpMgBhXN460PavJ/mLaQPxCDy9wlDqRVJ
	Vv
X-Gm-Gg: ASbGncv5FoBXrgAv74kDvnrQ3NXZ8dXlK+V0R1eJXPNr2INH0/98xl0KAa9VH1dcaLD
	jtxUEABMVKhbe1K9ncHGBtJxY6Hn+Wn8mDwRBRyvVO+BQ13ZWn4EgYA9IdA1AvRXrH9gnMGyE5z
	NQ/m/L9XtiUBTwo+Hb5hQFnqWoGQtpqipyv3MELtOH4tidHRUnM9A74dW4+KWZZzZ+iCNVp5VTE
	IkKX/FIgTWUbOJRzNyLq54QbS2bpxxbz1BohswDhk6Ko8KfkbW2+Q0/009d0B5DvGuCv6PDXrzV
	2tkA4bKiBVgdIQqHyqkh/x5DAtrOBPFzTokR2yzinG+jA3N/YrdHSKf+hLw3mE2RmcYcMHKE7cV
	FsZbfDdZrHg3W8vhC+bk8PdU1WrbYQixdylW444rupH1NujsZfqkCw57vPJ1n8/X1dAA=
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr37429071cf.7.1763752936356;
        Fri, 21 Nov 2025 11:22:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfgdJkOmdykGWKgEItWkPqsIi3iNIZZiWw3FDbDb7CITKAn3UZkDUQ4HWd+o9GJZLvPlp+qQ==
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr37428891cf.7.1763752935960;
        Fri, 21 Nov 2025 11:22:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765f840a30sm376795766b.58.2025.11.21.11.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 11:22:15 -0800 (PST)
Message-ID: <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:22:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 98XLJcpydSDnlgWp44uwcREyPnD1rW1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0NiBTYWx0ZWRfXyaRiCeX1vBNS
 EyFtyuE9YyVUG8jMYgnZQK2TAerPozmDGQPs9AQMWnbf0TnSdw89YfVpHVYZOjbXjWYLONMbJG5
 +k7Mx8p+HqhbRg7DEDiL/LLd/fX+J8Ipk2vkcoIRmalY4dFs/XEoSGu3cndHlQRPHW8o5ZbprUu
 hvbeq0pfmigNar1UOqdjB/jW2P/Bj84eyB/b/xrwXzkvRHKimhCog1JVEKXm2zrJ0fbtw+VX1YX
 Ny9fXN9ICAoTBz7t44pqZsKlBRjrt+dMmf/TNq9CmdzBxJF6/YFAWZYFi72CMXPs+ASv8YBCV4f
 gxJYbh5AoCNJqVVUJeYCPMl9yeFvRVlAHdpD9s3e9nk/RE+Y9AUGRzsxXbVflz1MPeJWdrxWDEA
 8vuVPlmvgTeJvrsschherTYKhKEYZQ==
X-Proofpoint-GUID: 98XLJcpydSDnlgWp44uwcREyPnD1rW1S
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6920bbe9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SJJ4zdzgCMKjYh-QJOsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210146

On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
> The Venus encoder and decoder video devices currently report the same
> bus_info string ("platform:qcom-venus").
> 
> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> parent device name. With this change v4l2-ctl will display two separate
> logical devices
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

Perhaps that's a stupid question, but is there a reason they're
separate at all?

Konrad


