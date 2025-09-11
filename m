Return-Path: <linux-arm-msm+bounces-73103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D74B52FC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 772717BEA9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0873148B7;
	Thu, 11 Sep 2025 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoBeEhRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170A313E39
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588982; cv=none; b=khvrNEswcO7rR1wkFMPrfsFVmklwZCgZE005pbZL+jkbBZP5d6nV1bIWiNnXMv8VWhYGK/K7VpUQHIafeb5eRQZJirPd9fKPl3D2sJ7kcLhPaZxkf2I/sB+/g/G7cvlNVC2+18d4XXZLLLwXw/YGV6KezmmwbEaWhBAmJpqXAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588982; c=relaxed/simple;
	bh=Uo9MRC2uhRSlB445pvUfFKuzstkfIB8Hv3SSvMmY2mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vrjr38J1igrMgKOIA9ZaPoChj6Vab0nyIeIpiHkjT4h4ZASMwju7fsV90q6KkOKA/gSFcmabUKyT91VdeWcTPpWIbtCi6+YbYR/cMgzbYVqTwoOysnO5JiFQgvNB6VZ+8uPARzeMzg0xw+qWNwURnoe0FoSXifxt0WhzLNPqrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoBeEhRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB8uCD031162
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qKSLFOaPD6IekNwgo5GkneMo5MC94YTBjYm9amO9S0=; b=WoBeEhRPJ7mVa2QE
	9EZbbIb8hlV9Uev33LHWbzRttDKoLTZQD0/wiGGZv3lIlTUxomMBOSRye1AeJSnj
	w6mut+J6w7ofDpYvOFatg62moz9p0b489fTFiYVeYRhmt7I9yGA7ffTJpQ5oWee7
	eOrCXb43hZyUFGJnFWgVWT9BnRCtbV31HIIxNUT87BlWdePyGSgd08oX88JSHOwy
	hiLVTyUTbyli38VXvrqv56gX5rk5/lJUTYeYAifW995EQOtlGE8/Y0MS5/AoI/5t
	ZPMlVFzQBPwh6VgHVST0/4Cdw1C3KSQzDXP0C0nxrrRrLgISQBWJP0M41vlGMruf
	ES1jMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg74wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-252afdfafe1so7481855ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588980; x=1758193780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qKSLFOaPD6IekNwgo5GkneMo5MC94YTBjYm9amO9S0=;
        b=R/Ip2wzpT9iZchCSP/F9lLHgss3NvuT2Rj5ucFj0ORIZn6bWyX2Q7lamHM4PEYrci5
         e/sgKgXWFS6VrWYQ1D+f28b9ljTXhE8KqfLN6ITdEPtIudL7IjtbgQfjdmkAUKNA5heS
         RjnEeyoji5G7sOxHhQaUrZj9hYc9XCUxzsZzgvdaBR3ewTxSM8xsOJFLcV+Uq3IeeA2w
         rjHVYgEZtHmHySRZrI+Br2KkVO6nTByRUx0AE0RN79sHP6ADPQcxse9R2yD7DECDnC0g
         mZYMLZMh4xgm5Dr3e3to0Vh/XUnfhEmdaGubM1YNw6YMOovqvUWS6u1nHe4FPyuTkKzd
         zjfA==
X-Forwarded-Encrypted: i=1; AJvYcCX0LljXZDBX/E+lJWLYSHWXTJsfQhmSlGNe7FNip4tWL4WMfbg/j/EJboK8v2Bqv/b4Var0a238ySF40I0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJInU3HYTpZLYzjaW0jGrOndjW/uegOnuSgS73kZf2LylA/aG
	mME/FNLU4KQo5CeUzV+mdMiitaKCVtHF1XZgDUNr8KRbAukMF1Vy5Ovj5B+pWeTO4kFHuFClob3
	NlCWB/+3g3lMRzZ60gLa42rcQ5qozWO0QgT2c3iG5hFQtX+a2Ag0WCq5H2XHDEXK/AalP
X-Gm-Gg: ASbGncvV/GreklmyzJiQ/pl5rgC7o7LLNq+ScBOFzQBftp223i0YepPJDPUDXOq9GoS
	jYc7BW5ii7ZvATneD1lODchvJ0o5h/Yyk/Qv9kW3B54Clu7owIHdOXPBJsIiHtxLr/0CxP3pST7
	AVpdaDnQHA99iiDeHxP7ObM0chgA+SqcjeVe/mx+eBbH25UxbO4zGVd3ppzqUsW284fjYHxa7mj
	23Hwh1uwud1bQLKxPS4ed+tmyxXk45qN8+NJynf63/GxOKcri0RyHymDrdfYcY8rMbDQdDwILhw
	30nd3V6wc1zxTfaIGHTRnbGvA72Q6LfScwUzQOJ9X3nyG05k5ro+bgT8bzxe5k4Z8wR7kNo=
X-Received: by 2002:a17:902:e5c2:b0:246:a56e:b155 with SMTP id d9443c01a7336-2516dce95e5mr225335075ad.22.1757588979882;
        Thu, 11 Sep 2025 04:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9eJ3yITwO8C0hGw9odVhehhJ4oqiaBxhaGW2Kn+yhcHGb4FwyIllb4YhuRN3w5QjAMjLOeg==
X-Received: by 2002:a17:902:e5c2:b0:246:a56e:b155 with SMTP id d9443c01a7336-2516dce95e5mr225334875ad.22.1757588979412;
        Thu, 11 Sep 2025 04:09:39 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6d14sm16305935ad.9.2025.09.11.04.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:39 -0700 (PDT)
Message-ID: <c672f085-2e7f-4012-8090-6d360f68a7cc@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: twCMFfT_NEkyHJNpLJnWl2wrXonJsz94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX0gGRs8+cTqWj
 CPA2AYis4sbZrzPZp/BzXQbcJ55EMMCEunu/fZy1Jy1V3OFohP0NQWOUPyxzbp/sUI1KW+TQhx+
 IQlRrk04+Q6nTWZYMaxHouHr//zHbjCBem8e8Qw8wCCvOtF9TJBzEezm3cbuB/4RdX9a+rkVopd
 6FFLA0cy7glGvU8okfz8qf7teUjK+byIgqj6wI99e/o6hVDFUpUkU21cdNfyuvj+ILY+5udaONi
 PUvi3cZVpOiTD7GAT1xDjJzUMeBQ1MKs7L01k6ywqCqHLfrWNslYFlncZWD3D/pZqDdzKsvtqiN
 hDzFT/BNNoDHEOOfvyoo9jCyk1gFPMrBapLV1lGZJ4Qrg/qOSYUrX3EVP0LVN/hXNB2bw9NYAs+
 aUS1bsik
X-Proofpoint-GUID: twCMFfT_NEkyHJNpLJnWl2wrXonJsz94
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2adf4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8250 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8250.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

