Return-Path: <linux-arm-msm+bounces-85920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270ACD0644
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DC5830C966B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890DC33B6C2;
	Fri, 19 Dec 2025 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQV4bJAt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjqJV9LZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA66339B4F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155676; cv=none; b=Xd1HeRxoymMwFm7lQMinezsXYKqE+gSTAoZn/o164B08gQw0fBwpHTYoSb1FfOxaEg1zTHVRWRAemYdxf9hJo/+CMPEvsPI+vmqw/zLpIBXacD82KqQU6WyD7SHglK2MR6x2nuV6GxSpFgnWNigVcLDJVj9QlH8ruoXj0Vzm5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155676; c=relaxed/simple;
	bh=w78XjIOWanqGmSehKOKKJzkJvwlZgqHon/FpET6GQEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJD+fX5aPpO/EXeokSO+iyeOzMRcx+OKZX8Ej70pf38klZNgewsgoAwq6IwRcg68MvRXgpBi1QXaG6+kRKfm4AGbZ78K/FL1kgbckuHHlH8luG4w7GLpk03KPgPk8roD7io0TZlmpJ9mh0AG1GwqL4VB+yl84FTZlkFDvfLbut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQV4bJAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjqJV9LZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBE2PR3999351
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1iTSmIRUH3Wpm9nn7q/H7t7C7jp0Ciq3kOx6kXEZNY=; b=HQV4bJAtKM3mre3Y
	vaUtTH1JmSB3U5q7xeYIYfk0Ekx3gh2G2HZnZtfmOLrtKSdjM4t7aEhuDAytiKL9
	Fb+qqQacnCA+ngUVjr0jnxkHGJUD0IWtTN4DKhok0Pn70OZ9wM5RN7lV4/vE5lmK
	JcJA39p5v6tAPH84tQ53UW5yv02JGt5WciDffPtM6pOX5y+TwWD8jn2OAl211jnG
	Yr97OHsAtFIw6XweCw6eAAEpaM4k68e/ORMaM2TqEn7O9bY9G93Rz4V9CYKWixrJ
	PlTiZtrddYXKh5n5Narh0ZwzmVGQ7+us4WI7u8txWFNNEMgYAdONHPc8whKoZHOD
	M8a+tA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29k0vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88888e86e26so5103266d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155673; x=1766760473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1iTSmIRUH3Wpm9nn7q/H7t7C7jp0Ciq3kOx6kXEZNY=;
        b=JjqJV9LZ1rJR8Bdv82bRq5cHXCupNdkrARexkxwCl+FgQ3n2fWY4zl05tH3B9QiUNy
         kuCo/ZzFj1C7wwglr9TnVhi9Jd/Mx8FBYfe1os3uJoDLdaTBjVBStTlxAP4jvYasypWr
         XHz+tIpAUJsvVp5cTZPcvwobWZas/m6dm4olGqhV3NA+ulHbfoDPTp1PMjtUjk3Zhyi5
         /SrqF/aVMET1zl9HcqJAHLVV2HsjdYqa8Ve9DQlV4edHZOlw6MYaKwHCwFhhqFSZvH6b
         aF0l5HO6GgAjKyR+HOkFMHRbw0YQ9DUuhAtfePxJ5c0wK8NGVbzfEiN3+UbRi22u70YU
         T8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155673; x=1766760473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1iTSmIRUH3Wpm9nn7q/H7t7C7jp0Ciq3kOx6kXEZNY=;
        b=QcvWIQRu3xIeEv5HLM7knLb+sLNVhE1s+hngXG59mMq2t1XqPaajH/jzJgCyEGXAdS
         0zi0TIUV6kHkZEhtSufahLxMhG8RA5PXs1iXqPcBKSe6J3P6s5r95Y8EP01v2GJV/GHZ
         Vo0X1BATyWva7CwYgYiiVK0gGRA3H522HA2CD3vR/bemKyOOESNcQMof4jFTW9+ygbIB
         ASxG1RqhbHWynz0Q+pOFnQQjFQ+3276YMWFqqTRW1dklj9ZGw0Jt+hzyYfKKoSmXnJoR
         4UdLveBx8goQ4GF5/+dqCQ6VC3ikSoxA+NZCm1WPLQh5VmnUAficKwamtr2nqUXNm7Hy
         PxLA==
X-Forwarded-Encrypted: i=1; AJvYcCW+MK9AMQaSQHBNYMCEriZEFa2ZwikaCxr92cU4QU0JWUNA11s9oibtfHZKowh665ZwdfS9k/CynT2523Qb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe91aKL2/oF9G2mxZ9VtZYzXzPyYyJlBRUU8EuNlmM8B4CXQPk
	63b7Pvw9UpCO28gDoGR43FRff7ilsgzBQmEx85AQVzNVQF3OJRrbA+QBkyGhul+LljVBONtMOmy
	68z2gMStz4aZIV0TnVmuPcb4aQXOd3ip35OAmYGlxEd7DEnJ4LU2lCDCHZXF1XCnEEkQH
X-Gm-Gg: AY/fxX4yy/0+1HhHJUu1pdkJbqXcUT3pDL8h8H401/YRnmqx+hAdBT9Z8TT+hZqLMHS
	/QPatM2ttU+8Aol5AVm6oCWXpITVdXNPBmhromei86sYwZAba8lcj6xxlA9w875SlO+U8+vdx7r
	HD6BOehngE4Skk1einQPv/RBfW+Kln7jwAUMCaMiRT2JKBf3ZPGaXcw7GNXrAIwxAXkDFTE3qEB
	c7hq2QAjyV0TEzR+L1r8qS6p76RE8QfT7vuKCLXdLc3U0FK3/zTPECJmojgGNbFV80dN98VCWSV
	qVbbhXdkWEo8E8P/Mfv3aFEx7KoMLw5s3aFCq5FLt6CV8iitWJH8JXoDan8XSeQZ2n3a00fS9wE
	sFjaeBwWzv2msRvWpNor+7p0WbFhDCNvUPbR5SJUar8ODbewScLVaT2Svbf0QXIhUMg==
X-Received: by 2002:a05:622a:1920:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f4abce1e37mr30790561cf.2.1766155673384;
        Fri, 19 Dec 2025 06:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+xhK8ObNrJ48ftnc1jHWypPh2iebhfDTfbsi/MJV3ojoClN4uhpF4J2LSkP8s4i90fDCiTw==
X-Received: by 2002:a05:622a:1920:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f4abce1e37mr30790151cf.2.1766155672881;
        Fri, 19 Dec 2025 06:47:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51144sm247227066b.69.2025.12.19.06.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 06:47:52 -0800 (PST)
Message-ID: <9d6ba420-3d86-4f28-9e51-a239ade7b67f@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: soc_sdw_utils: drop bogus container_of() error
 handling
To: Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20251219142715.19254-1-johan@kernel.org>
 <20251219142715.19254-4-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219142715.19254-4-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=6945659a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9cGGZZSxXyOUeeFP3NgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: BoBlsrNFDRzxV8KzXyaPcPG89XZdU3eD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfX0h5VHKwYmqqP
 mkbWqoIS+jMTOyxfFQ8E4gl8gXUluIpmKBPqSnBQdZDPrWCo1cmYeIBfhIlJ1Whw+Ob39wOA6yp
 R9q/kQzTZRCL2s4OMg0jC/NSNj+3IA0XpDW5fnYUUrs+sps9ZurJBLnVfI9mrKw71UbZi3pnYs1
 bGflI7OYlX/bGMM15XXiuEZ9EtT09zjxq/lCSCE+PuoMfspuU6gKt4uOcfqrKMyTuw8oxkVtFh+
 mRG8j12jq7XqieXv5/trOQmjC37FjPy1L8lEQpPSNLZs34ypc/YuGUGc0jF1b3cE1Mk7QPKvSEl
 DnrNsLRjjJ3b4AHixELrYCWEYGz1innm8mlE5d/Ke+iTl1T0x/zFOXP2X+QeukiNnMzy4VRLNQs
 E4EM9o/asBblVyg/Tx9qug2OcG7zLaEiwI8hLF3DEEiNeJdW6TqW75HiWBpq7w1e0A0FyfrO6bn
 h1v13A+6TSL1PZHAXBA==
X-Proofpoint-GUID: BoBlsrNFDRzxV8KzXyaPcPG89XZdU3eD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190124

On 12/19/25 3:27 PM, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never return
> NULL.
> 
> Fixes: 4f8ef33dd44a ("ASoC: soc_sdw_utils: skip the endpoint that doesn't present")
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

