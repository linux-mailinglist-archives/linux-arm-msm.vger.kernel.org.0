Return-Path: <linux-arm-msm+bounces-74993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D8DB9DD46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A69B4189EA58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87701DF27D;
	Thu, 25 Sep 2025 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lB0Jjmgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533E235959
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758784661; cv=none; b=ct0Ptkq0hDxFV9s2arptMy8KM6FCVJfu5GjEQGtRG1lj5eX6CpD37HrnSe1bisRm33iRS7AAYqO+h3de3vA+IGhCzTYxMftcpqD/DlyVAtYF6BJ4AeB72LVp2WHRi+u3zj7FgTZeo7z/6KVjFm3U71q2r/lVrt4CFYV64nUmp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758784661; c=relaxed/simple;
	bh=CXRyNKP6B9Hs0iPs4O+nq6faZS2xwrDVFGArkTY3S/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2i1JyIzcJW5wYc0X023Z41A/X1pmtAXzxXQcz83hnS5EpDkiYkh4B+H/hGJjKjUO/TOQs+vrhFPfNb5zkVYj4VnqRUl9h0vx7O1Nt/5zLvCpuLjGO8gY/RBzDsoryJ6fpmey2qxF9ISJb8okjhvmR+U42IGPwG9QcklNcyLY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lB0Jjmgo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0EvBk021670
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeIvpduIcfu5QlApNMAKw88URFM90jVyb69D62V3Fyk=; b=lB0JjmgoFkYHt+lZ
	LPHFrZkQABPjhqIEOEXCxHX8prP4S9x9P4jGrjscSFB7XgMraRQL3QHE8NxIEX/1
	NxwwrOLP+IVkwmnxOGRpkJJ9IZ2z1Db+FfTv0/4UaL+SRlE4artP9jgJMxH0sBen
	o5UaM/U0WPUh1gtycmSP3ccmxoneOeP10XI2qHJYhIhLYUnYwT5sUUIfSzVXwCgT
	Lqdgu3bNCuos+VjcTGZeDmNcTphlVFstrLErtKtfT4n5w35o1e62QN+Emc2MfBqB
	Hl0DJWN4b4e//ORWt99gNvXX/KmZV2JS3qmU+6EwZM1IscyyAf5PCrNLm/5Uu3i9
	B24n5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaeqtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:17:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eadc2b473so201180a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784658; x=1759389458;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeIvpduIcfu5QlApNMAKw88URFM90jVyb69D62V3Fyk=;
        b=LselXQJ+XzrNLMh1vohVw1eaz01IJue8IhKou0qJb20JyvUtFVlKoz3khrD/g+7e/F
         SPSIxJTE2vayoPcvjJRu6/frV/gW8DCqxHibYA02hono2ZxyMas4TFqep5yBzQNhm2DL
         NbPXji8hJv17TqMhX5X40VQ7pH3uVY/4wHEB7YKuGisD+A5Kd7pKJNho9EGBq5rF8zat
         GXoxuPl3uuPOsu/6PNjaS80QA9uHd9RZi65NbejxuPKaoqiSlzpZpkwGltob1HkW741t
         dCMbrvYI3PFUVNJdIo3cZU6Ht/oldG5CwhOrM9mQB4r9/1hDSENmm/b4vsz9E1GLIk0v
         rQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYKUFwr415CuN9YXCdKCKv32mCljROiNAamwl1nHNgQoXaISw1jokW5vaIQ6O5nsEeIdw93Es7v/kFW4uP@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuC/rIxYXdZIjQVLcN13M95sxz+aqSIeHeR0QtiOSKXlp6htf
	+XbnO0HWZvn0zio2gLsiKMEJndKjxljupHv/A899WqK9btQ6WpF4USMrLskyPJ6Au4xv/+92WsB
	xDqovymiDaLdLRaSoG/7XpjHeoAxmglIQG2EHs4wUwb7YEEOTt13cjG8iDM4NwImRgMbB
X-Gm-Gg: ASbGncsA4TnKR/B2DCC/AFIcYkT3neKnmCBIA3TuXcVVH+9FTOFtDbtVIwTwqeZ8NQT
	UFxkclRRn21e7whnKLDlyGfCa/nPu0IReaGDz9yLPlpSjY9mDn9qm9Myje0iU5xZkwgyjRrior2
	lee73XX0ugDcc1W2vmbCsouph7O/D+OtlrcdTxFi0Ha4mEJ8RYzXvAOGDmPHZAh4DYgAjUFGWfP
	FtWyc4BlElWwemVPpBYEs8s5e3Ok/trR3VT7k+pYv8K3lbpYTeiAP4NDi8hXcQKAAS0ov5VP/WG
	Kd5MDlRRVXwNJ9FQmgj6hxteEsM49Exyb+gSpHIwK8ES9/FHbzOSfO+AlyAGoHiIu5E+xfa47r/
	Oh8mHT+HuQExAKKRe5frMDuuHhgQuXvM=
X-Received: by 2002:a17:902:db11:b0:26b:1871:1f70 with SMTP id d9443c01a7336-27ed49df69fmr17433735ad.5.1758784657946;
        Thu, 25 Sep 2025 00:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHUr4mt9IG3Sd+jOvGuI5XW5KsNRIWQZv0nF/6TvnWeA5GnWV8PrZpn5dWXV+d7VRH4k52EQ==
X-Received: by 2002:a17:902:db11:b0:26b:1871:1f70 with SMTP id d9443c01a7336-27ed49df69fmr17433475ad.5.1758784657410;
        Thu, 25 Sep 2025 00:17:37 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ab6547sm14838015ad.129.2025.09.25.00.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:17:36 -0700 (PDT)
Message-ID: <66f85b3a-7aee-4a61-a817-3715ca23cdcc@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:17:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] arm64: dts: qcom: kaanapali: Add base MTP board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-3-3fdbc4b9e1b1@oss.qualcomm.com>
 <cifdab3i36xlb3xspyoqbq6o2nz2fvmuo4p6pz57bff3hakz3m@lylbyqavrcvh>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cifdab3i36xlb3xspyoqbq6o2nz2fvmuo4p6pz57bff3hakz3m@lylbyqavrcvh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uXytBJwiKb0WPmGA9euMLiZyMFVkZj8n
X-Proofpoint-ORIG-GUID: uXytBJwiKb0WPmGA9euMLiZyMFVkZj8n
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4ec93 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=hhnAJiO_VNtvmY0_vagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXysViOFBkePlD
 YaxycV/Qw+nDUQFsZSloxnV0lCkFqzqsmH7IPFcKYAPbglEAnbWClfPLnGxyl0qYUMqWZij4q/O
 9VhIXuxUrQkJw2nSlKJH22pqB5W7k33Kl8H7bPHYgoMcpOu5HHUwJjpqI+PogWBwKchr4h6bjdZ
 fuGd3Ky7S5BEhaonfSnzoqGLUvGVIenXWw8OYNeWvFSsRmKOTriC0+VvrSxn3tIN78jFmPucfUJ
 eZrUbdB3JdyM9KGalNOVSB7ROlIt8hv7AJ37NOyHazl91VHT6gtzpVrbXd9LDZEV3gMmSqbyqmG
 MCtGIe/GggOA6LjuuRv+LAAAucUg5S94T5bNvOWxshnxLUK2kRjkckwV34oNAHMN1ZL8EZSwDkN
 Ej/cEsv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/25/2025 11:18 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:20PM -0700, Jingyi Wang wrote:
>> Add initial support for Qualcomm Kaanapali MTP board which enables DSPs,
> 
> It doesn't

Thanks for pointing that out.
We had originally squashed a more complete set of features into the base
SoC patch. However, after an offline review with Bjorn, we decided to
split it into smaller patches to make the review process easier from
Bjorn’s perspective. Unfortunately, we missed addressing this part of
the comments during that split.

-- 
Thx and BRs,
Aiqun(Maria) Yu

