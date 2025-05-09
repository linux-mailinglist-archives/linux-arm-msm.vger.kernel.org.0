Return-Path: <linux-arm-msm+bounces-57479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2FAB1B45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 19:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B61E172EDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FFE23373D;
	Fri,  9 May 2025 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8OpSNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D192367CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810356; cv=none; b=DRFpLrL1Mvs/xPeZfTGBi6xWxIwItK7m7IHwUswQyxozbLOtZRZI0b83z4bUvIcArqAyFQp61vFhMEegZE4AFJWSijkBqsizEKAtmXWaHTWqvt9h5upp9dCzyt6Zy3Tr0MHil+g+kFsatup9bBs1zDkRsaBcH5NO6NSWJpPjXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810356; c=relaxed/simple;
	bh=r0m0UW+PEU5BgL2NqVdok8cHtVoDL41wqAjRR1VyHgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzN4di8043SQKAQaebhWNTT2Blo2NF+wSQ6u0NO/514Qdh9Z2hJLJt2s4v1Fq6NnUWkQNxwmEYudDTm2jviruyEqRcIdoH8YbL+LBmKVgiYTSrGQalH6YdZ3R3JJdW4IAZy4MG/buyfXRp/Mcn+thdiXAG0hYoBKy+SML1ECHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa8OpSNk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BtTQe031498
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 17:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=; b=fa8OpSNk2ZXlXsKe
	XASyk+9t77O0nPWWfpPX3oIH7QD4tWzx26SShdjm5jDHdirNDGKgzJqmfEr3Isiy
	Vo87v3AxkR2wmD1BbYTEuiktxnDvYUgWXgBRV1PwvKAQPyxHm4hypCLiVYqkHJb6
	fQnt/jEAwyp4+RFheRMt1ILP/TMGXv3MADpwe+pPYtmMpmBHc0pzNmu4S7FkZeiY
	vv971hbuON/33iCIixZ4nFFrfomtPm8nHtfYdP+hftVFWELlHR4d9H2knvSCF3zb
	akgC3CkRgqn49bAEh2RRmujymXT3k1iHaDrLR6eMyOCBxFCSxL1WaG9JFGMjrXP6
	fy61Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgn9bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 17:05:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso53914385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 10:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810353; x=1747415153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=;
        b=dIWsxnTgiHHXQnDkwQRrfKZHfws1w+GpxE2zOsg+Y29d2d2KQdn/v78tWhcFj25fX5
         p4k0Pa3Q6Z6fp/Eytxe9G1hyfum5+12LkT45s5g05JvUhYTa7dJfeL21jF53ebB8jglB
         0Rd8fqi+ovoBEIwOrU92U3G9UCvW3TP7XUIKTJ3Qmdp4v3rXwFJiQxgiNopozC/yDBBN
         oksbt+uq+hm5Xv+/LqoxXKsnf0Nb5eepWs5VeMwvcDWn7cwkizCNdHmL8s5VBfASGyKl
         OTNnAXg+nKzmk/w3OsJFkYDP221ZPU7LzEJiHIgxmm9grDHY0vgSIXSLcx7lIyfL3uhl
         7wzg==
X-Gm-Message-State: AOJu0Yzjz3KmLi1jv83ab7OY9dq6U/1ORFGgtNfLpc10ykEFmBVdTrcb
	UxQE6gSh8UeYmXSoFdgbPv+N7dmcnr6v9kXbLKTTomyCpWdppaTMNfjb9npIR066qZ9ollW/uQg
	Lwv7MoZSUZv779Jl9JZ7MNIFweZlhHpFBFAog3WTBWagqDGcBovxsjyewbdmAasbM
X-Gm-Gg: ASbGnctUDJljjAm4vS0gO1c7IkE1lJsGrtAUAWUwmW36QLphjECbO7vL98ry8AyiQLR
	j2P0XLLcTLlhF7KD4SxFxi2SXO4MIdgetO9zzNu2+h9opv+tODWvTTeMmUHT6x+rdVtHhaPMgAi
	Gca8BDyw/3rnVyStG/FDQ40sdBsm0n0vWolundjupALYKrvpXLCwVw/yZYC8KmDBUwbV5g1tYq8
	EOkeZU23WHNr2V8OOAC+S10pxFd+62Ob2dCc8etrUbHYP8XeO9/mNKls4F6y5k5BCSHgUyKTdEi
	9aYS0iqxnA+2HIV26gHLYGw7xNZe/lY0QNs2f7t56VruGWj7xBVFwNy3979F1h8Ks9s=
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7cd01138c43mr237840985a.0.1746810352561;
        Fri, 09 May 2025 10:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbRp4cqQeIx22c94yzN7HcBSLTFgM40PIl1UVIm+gxSUeSDFOZOAzyxFmgxbh2fxCrwm5SDQ==
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7cd01138c43mr237836785a.0.1746810351945;
        Fri, 09 May 2025 10:05:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8ac2sm176736566b.27.2025.05.09.10.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:05:50 -0700 (PDT)
Message-ID: <249fa3ea-4b0d-475d-8851-5a31795f3b11@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:05:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm/a6xx: Increase HFI response timeout
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Anthony Ruhier <aruhier@mailbox.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
 <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681e35f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qaMJGrL2tkxVvb42h3kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2OSBTYWx0ZWRfX44UU4hYogNAi
 12z1+m8TdAGzlA7Vs43z7ZdmKX680OuAQukguiGN2MqJ6IJHH8KVOy0I2Kq+gMp6uUx2hmURigz
 c00qCcGkrRzDew9e0au9hT2HW06NUmeS8safzLQ19n7me+Ugazq+cOTiXGH6Mwamx0WeF/vNW/A
 2SaWH94AT61sjDsEr5eKrfY52qcb1ymS2j9D8TTkPf4rzcs1B9fJlI5NUOMuPwhomFNYvwuWZ9D
 bDj52rGkuUVSIZshbe2ALYnSFUNfzwMZU+DXEJj2HWkjBZ8Zk9EYpJup6jxc9vURqjFu1YuBjRd
 2lQjs9Yx+u3FGxrL/Db3TalDo3dKfdDsHCqnyhrrFUMreIA4p+8KK+pfIL1rqGlYqbcfzc5uM0m
 hCsbKknVvP9EpTu+nrBOPiKddkbJ5s4wfKrLoWSFB5S3DvpOU28rAtAqLgGwEU9ILw5l5E17
X-Proofpoint-GUID: nVUN5VE5_aku-iO0u8C5WXV97V4K9l0p
X-Proofpoint-ORIG-GUID: nVUN5VE5_aku-iO0u8C5WXV97V4K9l0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=973 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090169

On 5/3/25 9:03 AM, Akhil P Oommen wrote:
> When ACD feature is enabled, it triggers some internal calibrations
> which result in a pretty long delay during the first HFI perf vote.
> So, increase the HFI response timeout to match the downstream driver.
> 
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

