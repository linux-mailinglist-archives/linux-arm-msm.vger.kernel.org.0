Return-Path: <linux-arm-msm+bounces-83696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEFCC910D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618F73AC9D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 07:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186082DE6FC;
	Fri, 28 Nov 2025 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="md5u341Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkSoL8RU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC902DD60E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315584; cv=none; b=rcxZASLN6BL1DbNgu8nayrEgb6eCKubktK22G8AGCO+3rPIQIIvFcI6ha4SuBrfYSXDZV9ql5GK/LkjKix7NGvGio/6KuKbsSqgft+LJL72fyjhxk73DdeuwCANpoK07ZtjY4xolHDk0hw6XKH+5EQTOmJuZGbz0YtPmk6oOFXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315584; c=relaxed/simple;
	bh=b4l2XdgiJCz4txAqhmi+KFGdiUiAyXjxwC2lZOU0kzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc164zXU7KS06bGG5yoJlXPL7TUZtC8XdTfyp0r3ouYQj58zqvyOCle7+6lpzLmfBO1rUeAWGt+ojTuOptGOAKUPBqajGge6fVAjOsy43GrXzd8sMED4clgvGmhDZ48B8v1wGodWi82LmGKbcpi8GAXd0PLEZ/TJe4qvpZS2Gqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=md5u341Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkSoL8RU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMFl112362522
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHuOHsRfz9D3H6DntFLa0BtUuCpbKw77TMUjLG6NoBE=; b=md5u341Q8k8XYjI/
	g1/zNTzg+HulQ3TaCX+/LAEnmQ7XBeRNV52220PikJ1XfOfI4faVNNDJcB9Hr4pT
	srOYifx3FRuE2IJHzv4k7VE7d2jraaIo7DWT9PLjLLnUzwhiyxSDdgglGawAMUMt
	NBN+AWzrExUSvhlrewNPkKLZDJiAmEhLmwSmEmQMKje8OQMxIGZk9Bkef7HaRQIg
	NSbzOV7uv8k8GaX8odw5o2yUPKEvQ78ea+CMO+RHgRE5xJ3FiUcgvPJGw781qzu+
	ve0w4zbouDpLEnIsqFm0Ac6ApMxpz8sE60c3cgyeGFeShe0u/owKaFZZCwPlweJw
	mqXqpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmyntga4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso1557518a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 23:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764315581; x=1764920381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHuOHsRfz9D3H6DntFLa0BtUuCpbKw77TMUjLG6NoBE=;
        b=jkSoL8RUJEt/YlHRGT3YGceMF5GKHoIrxrPUo3vQPU0wI7ONKJl5vsEX/fepfrCKz4
         +KK2LELFJpqITjI4DJe3hywvsNkCeQBzmf3XCDU7WJWtuk1dn/SyX2D258SRHVxSChSg
         guhy4hvFK8o+UZveURxnVkUzTHMeOpRIt1MjpiS9Dc5wtTPhZ9H1Bw3fsLHMXCORipeW
         4KsJltgp55z9pp4920vidhYR+2lbGhlDett4b2PWqe5iCXD9Uqxtlod09PMh3QtK59UY
         bu3+tVY1Ljzd5EFpskH5/OnwfslNKJ84OY14t/9jhMGHRNmyiadMgwrR+TD0MxEYeWmu
         xZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315581; x=1764920381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHuOHsRfz9D3H6DntFLa0BtUuCpbKw77TMUjLG6NoBE=;
        b=ipZCvZyk+QWCo/Zp4F58nDO7nRTUje+SrHpWbWvheeHm4HMPjykFPNLO44K1DIkG8w
         v8duwvZVjrV4G4HNnzCEy/nHHMUBfydiC9Jyz8yUIljeVbjhb9AMNrEVSBkf6ZZKGbwC
         Q4oCvaVZAWv6cqBSpm0AFiPGbGD6Fg13tfZK49WWpbfeszBXjFFa4k4XmmoB4iqe1JaI
         78c06jYJ6FKjnJ+gGVxcHj5C+4XLS4+y/YDgvmJMamnd2ZLKfeRV2gqZ5oG1WwEX739G
         /dGlx4Iv6f5Fa38Zh5oZ4uZrgqbqqNhcwgFV/4S8055MHZT8evaoyZkJY1cCMQiRURGt
         l9/w==
X-Forwarded-Encrypted: i=1; AJvYcCUd8/pXKRNvfWV2Uz58wG0EPEK3uRv1/L7vABLw9J53PNziPj9WR56aYMn9oZe5O5xt5s7TEmk3PAYWDSCM@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsV8d9Th2Ow/ry9Y9kDURw+esSWKrrM/UlQi7vqG8rHdaSMSN
	Be7Yn2GTRbSXGt3uBFYb3/QxEb2qAZjv20IwPKOV8zXcg5ecmkQSDOsVZyyvHs9WJz7gO9Wz4O/
	2xkx9KGSb/ZAbEkEREvC3FXBPYJql29kAHF2lEpIAuiWEFYdK41SGPPDDixijHFVCXbxS
X-Gm-Gg: ASbGncuFsRa1HBpRWEQ61jJyB9WYgSVbMm3BrwC7mEqGOu16Pr5pSTk1RsQP552jo3z
	jwDB4vQMdPexKCiDdewz8g0BiHWaM8daVJYAU5N1sE1/nZBsAWQ6E3zX40ZnXoPlhvBUKbN5YYF
	NNHAsVk+zRo2O1yEzG7wGXFaeNLt7C0FPwJXlum7VxpfNdPa37YjNo7UpjOVMOPjSR4eTouiVL0
	AFYnYw8l8O10C3WssBV2TqUPBaD2bxNx6I4Z1AzujdrDLq8EsTP+WPumkvwSIMnpu801w3NTgdi
	2uiHRTEoAX+8F0y2WYTk9+01KI1dgvOWIL65MpyIVrdTbJ1mnAVBRBme5umSTQiHjUaCo3+5ZnW
	0z8/J/PEuiJsRqroNdQvgSNrhShgNMpnbPClm
X-Received: by 2002:a17:902:f707:b0:292:fc65:3584 with SMTP id d9443c01a7336-29b6c6a667amr282622075ad.50.1764315581059;
        Thu, 27 Nov 2025 23:39:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8xWGzZeD982OnlJIUsHi4lE8FAwDHo50JtnpmtHmyaUl44RLmlK+j2dziv+Vt1lN2Y80scQ==
X-Received: by 2002:a17:902:f707:b0:292:fc65:3584 with SMTP id d9443c01a7336-29b6c6a667amr282621905ad.50.1764315580591;
        Thu, 27 Nov 2025 23:39:40 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5093b5b79sm3793383a12.25.2025.11.27.23.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 23:39:40 -0800 (PST)
Message-ID: <7f1c9721-7191-4588-b267-404d199c0fbd@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:09:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zw_W63HaTXF8LGzrMCs60_MFpUUXybcs
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=692951bd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA1MyBTYWx0ZWRfX/fqtDDrE8N20
 WC7/poa3Pth4ydrUq4p2jp2+E+nWA5Fq///Wpj/DzbqIbhDpzCVerZtm1lBNFhK/nh1L3ETidVh
 Usx5dySLEf9GJBH+qshL+wJrYgQz8evuN/iEPki/ZH6mU2WQoR8kmB3N2S1VXE/z1o6Kf871B9Q
 176W9K2RhOdjeanvGKl734Xmdb5jLPv3WG3ilvoqioZEf9klKyWRMa52BX8rr8yxx3kapnPRtM1
 K7CtabAfTgqYZXKh32LwiBpaH4Gs22Q6V7r6oUtVjqQAKOZxtdv47k2bGrRC4bWjx8LHsrWA5Ey
 RTkd4eOxv5TNmT+9DlXf9rWp4B+6eyu29WdySlpzQaDBnT4J9e37t8tDyNQc41jHT3e/6MSCR5h
 dRwIiRUg6I4KwuIYMTlaJ9BgzKycBQ==
X-Proofpoint-GUID: zw_W63HaTXF8LGzrMCs60_MFpUUXybcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280053



On 11/27/2025 11:27 PM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

