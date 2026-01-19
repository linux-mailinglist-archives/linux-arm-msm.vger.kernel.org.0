Return-Path: <linux-arm-msm+bounces-89615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A096D3A604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42E403002693
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80E73502BF;
	Mon, 19 Jan 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocbvuMh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlPe40LP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62396306486
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820268; cv=none; b=V5QJl2MD03O8+PKjqvsofAs5CsHziKhgYEdpbDXvMN3N0uFFL5FGnsTTmjFZN8rAFRbjew0OdxnyC0p6fTABAht1scE3kSx3aP81iEU7qkZwpCjk9sztmxtgo+nyfiEuXjDq6xqtrcBFvG7/pGEQ6C3rAamv6K40oMuJhSzfYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820268; c=relaxed/simple;
	bh=fM9anv8DcBa83lIGDKF80UDxfDuRI7Fu3UOhJM0kQAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsLLWMDZcWZPT75Q2XhvxmIrOTecjrQx7K580Ve3uJaBeXiTM+c7kc+KJ7HX2aPw6+FmVEmntYfbY1tcKB4WV1NSNHTnTBFQulF593pNkOEZnqslNCaXtJ9bLTN+Vb3DiYDkuKCID9fpe8od1uYH/k0R04Lm0BTAfDC3/FoFrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocbvuMh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlPe40LP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91H2j1561997
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=; b=ocbvuMh89UuSLKWV
	3fKD4orKNFo2fAlosJkH6YQOzLzidy2Ii9h0wFG5HT/sva+fsDNJ9hdZhyXlxbsu
	sYtfgmTT0npk/GREExUf6nsbM9/LzGFP+YVW8+Q+1XFYau2oRjbrgG8wkDIpuYW7
	5eQJ9c3n7hEFaHRDtPddoAXjLBAK8IwSpnbkn3vQxh2VJ/Z2MRVSwEHu9R6o5Rb6
	mHWsEvoUCtp7JtlEZ5ibqqb1qM8EJ2rh9ZROJthZqt+uuGekiJOGQGuN8MgbA80B
	qpg/fqJlZ3bhygUzz5T+zOn7POqc6HSka0qkx1/v+3MdfWERlxvp7nhYij39CMjT
	gAs77A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcsr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:57:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88887682068so15128206d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768820266; x=1769425066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=;
        b=hlPe40LPnUzzgVOkGghXrPK31d0sd1cEMwDL5B3HINAoFnoFuZuiDZfe4OwKRlJ34O
         bAabFSmt+hfyVHayEpfm+1Hync/jQFqpAM5qM32B7L8qOyzlhBtmOObK2JsNshgm8r96
         3bGgHJC/mF93JdyJ9MMDjnIkL2xN+y6R4WNjV6VxgD28zQAaAAYlJSsRcYsQINgVZhXP
         FqCGLDJos7Ska86dHYpL4EoRcRunfZ4Npyd1bKH5Ka4shV4+X8NIOeXod+ljbo8+UXrS
         Xdj8ExqZaQa8VWql7nvGBkVcMo6gKZx5iaqO1EDWHbb1CTsY0ne2hUnK/DvLj8tA1fTK
         96EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820266; x=1769425066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=;
        b=hsDOSqbBciO3w9pY7pFxYeLG2E7Y4Jo5OXS3ifr7jTHf6gyxb2gflG+LwmcdJcVoc6
         3MT1HsvNORT7/fqeh/RvBgMIDGSWVpF/iog4V6ZdXYARcj3VGXMnCoPrMpEWj0OHWiBI
         ++Qe0/kSXGY1ISfVEFrplgO2qT4YAoWD8PiSGm1T5AZDS9FGEPhrHHUvVBib/7nHesdA
         /pby8gcGC/EgFQYjdDSJrvt01thPo92uqN2LGTIzaHP9gwhKonZ4BZQuZNAJ6oCRwtJi
         dlPWkSWp98u436HGU8P7vrcAg8a0aHkBLVA/kczqXRXhujsK+p4g+76OkJJzbBoljVdI
         XGOQ==
X-Gm-Message-State: AOJu0Yy/cLu/ubrlEhSW5JDe2fkWq8GUmNRxBCldlWS8Dg6aSqMvxIPV
	17YehrJLykT0t0HNUHbLq3TsGUOzGwKRfRUiEAciOKpYR2ttFXODodolKTgLQidf4k5mR3L3vqW
	johUAo9ulXOhzRpaRQeKy5CFi9xmdzm/b0s94e/wEi4p9iiWIZ70Vl7XFLo+BexazbXv6
X-Gm-Gg: AY/fxX7TT9otIAI6YCD4PUUmCjXB+aX8BPspu9AG/ZQdhZh+bqa2YymuRDCONpkrnn0
	7/6xHk3J3YOtRZxymPBupReXUP00KG6MSTd5zUve5vD11/BpmhZM/zv/veZsR805Fmp56JuAtaI
	jFosI2Vf8N5niVYLrW7M6CxwMmuRRDtkFgZxGI4jRCd1MVVvnVGhJ7nNf4yFr3U/27KNU6c+Mv7
	LnNIG2rhMlPG+yAKOrHnePnxBpkvLkCpUm3+qMKA1pMBYIKqn98wUnZ9HMwKV6rhXHx/PK52wDM
	KF0wIOlOrFkOEUVocbxvTqKETQt9ArrlYtyE/X9/cOXhNkJ4zwQZIKm5TVHRoYJinF78DrbNb2C
	KDeqHWZxaJ55v7AFBl36WdNYCLkGMNitfz7K6fDSoR2xX+nQKtc7jtqNE3VVtmLG6Fqc=
X-Received: by 2002:a05:620a:288c:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c6a6705accmr1215768285a.3.1768820265748;
        Mon, 19 Jan 2026 02:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:288c:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c6a6705accmr1215765885a.3.1768820265337;
        Mon, 19 Jan 2026 02:57:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e8d1sm1102898466b.2.2026.01.19.02.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:57:44 -0800 (PST)
Message-ID: <16e02476-0c26-4ca4-8080-c494a89e58a1@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:57:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MCBTYWx0ZWRfX5uEJYT1vLXRw
 muAvACCnzsSfMrb0Rf/i6VC/BkSpVd4gLFNZrAuJ7MazfT/8EL6+x8OQpx2YH1SJmz0d6dWYufN
 gUvyeZ036arXL/beWlG150lXEnp3WyU8VkevJXuauVB+d5Jb3SN079XldHFvObXt61JgK1XvNbv
 Grd9sP1IMDTavEFTSkjzptQa2eoNl6pdwk/h1jvFf/QVWBf/pkuz2PNefRMGhTdOwbzdzVWPibp
 1NdEN5oNWn6QzU6s+iLhML2puom9Ok4Vm2ht400D+a7kdArFHDOs4QeybO1yc3l0tTt2jIonb2F
 J38mwLq3fdwsONuDIgu9ychigoavI7nOxDW11RblaIEdACFUW9YNSjyNGnLX4z3O2AhxKLBTxs6
 uvCblKaWQcB/YJR6oLeGH+A9jVGew9ug9w2024/GiX51SXi8ct246M+vIDSSHtbIJCL31Vfv2Rg
 Z+d02ZkzNzXnD6XwqJw==
X-Proofpoint-GUID: B_gCb88vut9dBJQX7zx6c6QyQ7lD9ZKc
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e0e2a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=X1d9jF6ZyTQ8TVP8WxQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: B_gCb88vut9dBJQX7zx6c6QyQ7lD9ZKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190090

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> Since DPU 8.0 there is a separate register for the second rectangle,
> which needs to be programmed with the UBWC config if multirect is being
> used. Write pipe's UBWC configuration to the correct register.
> 
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


