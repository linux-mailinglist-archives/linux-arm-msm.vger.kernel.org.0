Return-Path: <linux-arm-msm+bounces-85835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE34CCF70E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48552304D553
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090D73002D8;
	Fri, 19 Dec 2025 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aa9J8c0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwVbwrXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368B27FD68
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140769; cv=none; b=AecN2tghLPAzbnGGuFNjNKcJbPy+igHehcHf245YultIaqKGdtNPi7EJgll4WAR8V3q6DrKGoNd39nWFRhScVE8z/sD54pu6XYwbl7r48rg4sgoncqN1aiK5xzY9WpTYhuaoOBBziYZK66Vt23I5NwCTeH36IimwltrhSA1dq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140769; c=relaxed/simple;
	bh=7q0eIdDp8G82SRQ433htFrFQ84ddqO54CFoHF+D8ubg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBz+nTecYze/b2h1q+qfG+1KLpdabeQ5MZn6dDm0HxHxpji41NzNUo8tf4Ot+UNz1uDRV0h+PZVX5xgxWrdpDnmN/5d4JeQmb9C+6hU06Db7/OKA5i3PY/jvFtFNoDx86tEnJuUROVj3f2HRk4saiu3MSL6ySrheVFhlitSdiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aa9J8c0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwVbwrXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4bwnU4153896
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=; b=aa9J8c0Q+s4A6fxi
	RpB373kzsso7Q4DLJJAahDc6UK1L8+3B/dd30QFSYPUNyd11k60pNBjPqqI9B3Yq
	k9hh1cYboVg8HxEOx+SHQxG+7aCtLGwD69FHnHSBaae7Nr1830F4ORaQumyakOci
	fHNg1tao98C6RYYEwl8Gg36E9Dym4oGvnhDBk+auUrBBx1URKZUvFDqLSNQkpqLo
	yO1/RnyvPBp/mV9CL3v+LfhtYy3U011LGADnFG5GAxi4HttPfqUBM3zaBL7p7KTd
	YOlN3fw7o83aej3k+KIo/67qlXOS1n/Pyz5Ial4QDyws2HkLIYBgFnoaOK9ySDrL
	YMfb7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctcq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:39:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso22785825ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766140767; x=1766745567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=;
        b=EwVbwrXUYxi7dZ3iUimA4RtO3+r6B6vIKpWblQXoObl14ZYTRQsmRrApoNecCalFZn
         AauYymHV+H4B+7Mxi7OdoBspsxzEb2kKKNxCKNFzTXfXJxIgv1mVVEOrMEMSve7aFNA6
         zGUDrmC3AgdVZg9QgTW4vEDaaFboF6UEv5ylJMKWqrtUQbrOPVyDUzvpl7b+ac0SiF7C
         PGnIK2VKPnPjruRHWIUl+l6jlTgSgoxjFfsf9cL+o8MpLu9UPlEaIM8+fPno3D5zBcjx
         667i6Ub3YqxzZEwvRRXyOEMGoYi7nyQZu59LTv/PPKdVUKEqVnAPdjycgfukTs6ZpFbf
         paZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140767; x=1766745567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=;
        b=ojHkRWro8HMg8EmUVX1rAv3ohutdPgQeHst1K6tqK3IueXUoBOyM/JfgSta0e21O5y
         5c6/PP/F9f/jIVDuC5RF1slz/v7EuNLULf0xGXrZ8o+dgevrT7vklJRXe5FfvRt8SFbU
         9MPHHtwS+8PeehBzImE0WT16OgtX6k5zRkgwAUiVPkGbWna2g8ih4WoXEpm7w8Mra0Nb
         zILoPSt7B5zyZsra5r72lYSCAvTo+Elbu5FSLYOkUiPDsokv83vfkuH05HP1M+Pllqxs
         2PyBb+X+3lluJ5Pevx1oIa4eXaAFabX3FwnFsg0OJKzD3A7WH2c9kV6lK4S9qQFQHiy0
         XH7A==
X-Forwarded-Encrypted: i=1; AJvYcCV7Z0ar6waCNxgvntWyAJDrjZi2OTJ+wNvvsNrvULV2qo7YqyelBpn+RTN6fzQvBjqhCI2Bdfi1KGus+F1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6l/8oXFj59RL7TNGTJMhOaiqVO11kKVa+elSRQx3OIRNpTASq
	R+SUrqIja0GET4soGlaJuH/xUMnBK0KaypdrhoCTkGkqECbIrWmo6tUzDzQKT+8H1y+WqGhn16C
	4LcDJUGhpVb9JGUIL5PyWypJzqZnKILY54PPQabdoN7QKNr7mxJU/zJqJxrvKbH86nUqz
X-Gm-Gg: AY/fxX7qMqfIsS+0lARsOJw7oFppr2H3fIEcqBPdw0zrkjwvkDplcSHZmujjKI0PaDw
	ewIqgOpqK2HMJ9cVo19WPaUaxMyvKoWGMXAjdTstmLQ6OwhhAZhi+8iTbSCPlpmd0/2UhhsRRtX
	DtX3fhrZI90Tn3x2swX9I1fNP8jQKOyUxYEk8OaaB5TVsbOelV5yebkmk2Ss4Ynzk14J9Dd/Lbc
	7W/sDbThl4HESwJIAstRyc66Hc9A2N6OYjdyts9Qr6SdkO2WjcAxRgsqVRNfVrgssdbdMw1pZ7I
	SBYj+iGk1NvftHTQdNCmrpdLTiLdqPOW0uyXa1nDnuRvSCa8esLUF6aI0zk8KFBrD7nDjC1M0Kj
	DlIaAcKNdUdn3Nt99gRAhxM5D18OGs4yj/+yT/w==
X-Received: by 2002:a17:902:e884:b0:2a0:b467:a7ce with SMTP id d9443c01a7336-2a2f27352a7mr27092925ad.36.1766140767105;
        Fri, 19 Dec 2025 02:39:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHjjNmZyZL1M8MmrxLZpRtoEvO3hbj9TdfoS3U+i8ntekOrSW1gOPRLwiSGrbGBtNeQBc0kQ==
X-Received: by 2002:a17:902:e884:b0:2a0:b467:a7ce with SMTP id d9443c01a7336-2a2f27352a7mr27092615ad.36.1766140766585;
        Fri, 19 Dec 2025 02:39:26 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66472sm19494225ad.13.2025.12.19.02.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:39:26 -0800 (PST)
Message-ID: <57ab2d5d-5aaa-4f9c-83ae-0f7ebc1e648b@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p637w43JHZkCDKDyCki_Or83eIF-Ynh4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfX5AxENkaKxfhk
 SZ89yc1n7OkbWtFdJe+YW+ozKQXiNq3NO2+tr3+e0JWMgESH/6F9bdfagYz8oVOO5lfem2KZ4zv
 48Llmr9hdrjuXSmmJ7cXN1hv2cQxED03FAwPIvE/PLCJnwSdMKGo6f06/PhDGF6PCpAEssCAWxi
 XDWuhUky/JVUqBinP4bQWp46xZHFi2PFYqdwoJVR7GXzVmOM6JHvQq0IvVLtaTccdNnbpp1XIFc
 BtRPMjPQonl6ylkQRgOKBqKdkY8Ly2SH7g7UuqrCpcYT7VG7auQ6Uun+xFYIVpjg49zfXRaz2s9
 AO09WREhv50gEtOUX5IjB5xW08fRhmvco/VyQRzMwAa20P6X1jDukyiCogjPJAdDZyxPSnmN273
 YXbWvKsbccen3M6lorScIDg5VqM9qp8hhtrtKKoohYiF2VVe2KTTCpW9ohMR1y/MICt0IJTPzj4
 LiL7fjjWrugsTA33Ivg==
X-Proofpoint-ORIG-GUID: p637w43JHZkCDKDyCki_Or83eIF-Ynh4
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69452b5f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bZysObWQuULb7_ZgAGEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190087



On 12/17/2025 7:24 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:21, Konrad Dybcio wrote:
>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>
>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>
>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>> matter for choices made in bindings.
>>>>>
>>>>
>>>> As it is still a clock controller from hardware design and in SW I will
>>>> be map the entire hardware region and this way this clock controller
>>>> will also be aligned to the existing clock controllers and keep the
>>>> #power-domain-cells = <1> as other CCs.
>>>
>>> I don't see how this resolves my comment.
>>
>> Spanning the entire 0x6000-long block will remove your worry about this
>> description only being 2-register-wide
> 
> But that was not the comment here. Taniya replied under comment about
> cells. We are not discussing here some other things...
> 

I will review and add support for handling #power-domain-cells = <0> in
our common code of clock & gdsc. However, the initial intent was to keep
the GDSC phandle uniform across chipsets as this is a clock controller
by hardware design, which is why #power-domain-cells was originally set
to <1>.

-- 
Thanks,
Taniya Das


