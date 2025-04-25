Return-Path: <linux-arm-msm+bounces-55571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8BA9C097
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CD889A139D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E205B233707;
	Fri, 25 Apr 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeRG11e+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5BD233158
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568802; cv=none; b=OQ5211agXgJfNCVolb4uRddiJxBj/u/xFXLEbhpbSSA6fiidODaz5xU1dMITkFF0/XcRU9WraCTAyCj8m0MtExXlmw1vIDf+ieFlP4zkmOT6iNm5TP++rsxVUL9dAyZ4K9mOU7TVn8miXacJ5fS8bfN6KSl4RGQrEEfG5AOws4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568802; c=relaxed/simple;
	bh=TC6vrBqvgc2TnS0NJAFtEoU/7vyxC1oim3umC/WJ8/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnDIG2CU+7LxvhPUaLg8KAtnKOleYdngzKMsa5wYZX1bSEvdjQe7s4EbP0rdG2wphBQoiwv1r1NY6Xz5M7YsFq8otv+QYiSfqQbcgsXMBqA/LgoJ2gxgYxEgtB6iY84UQ2A+PEtQbYlsApcN2CZ4qwaMLYeoGK73hYvsu2qwqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeRG11e+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17MhU011507
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsFR237j1NOHksouUkjNnlXyYYIVeCuMxRlp+jj5qfE=; b=PeRG11e+r2fh2uOx
	NBSKgl61b2cnQH84TrW+MzlNn78K4gpGHcDgSAAHWVKeHlq2vxqpi6wqzxRuSAUY
	Al+uPRc57WRm+o1c8u4hoxGymXNbGyXMo+hi6UViIDI6SZ4f3tiBsQbv99kBn3eK
	d0FevXYnP6g9FiooWv9ea85VZ4PCvGqHuIlPzqF3oXFi0VeJlVctcSl4Lz9QwuNS
	MYVprxmWjM/SzsExoLOdjWYMvGNIEHDaVpbdxbbFk729VcP9VdC4LhzGyNa0IHeR
	BC2p7UdR7C4ouJjWgfimIqCDXxRKtmtxNYozjSQKDs1CbSow1zRvEGPCG1mK/JTJ
	uA02Nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3g7cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:13:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso43592285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568799; x=1746173599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsFR237j1NOHksouUkjNnlXyYYIVeCuMxRlp+jj5qfE=;
        b=KcvYTztz1+dZOTlLZGxcBGrfsjkgH9qwi+UcDkpe+DVTBo36MyTTGtE+z7o+McsrBm
         GcDdj/uGuZApcHgURYIO+pqqWndLbdktKaaF2UqSeYUHbMcVD5PResWwfjLPKPD99qvP
         iR4f2dfEs8mnMKIWjGvxdlGO3vrVWzZKBRyu9iXbyOqDWaqbbiWQVlSsMunB247M2vSQ
         u1gvUz200i5nKQpc/cbv9OSoriAI5f8ut3NlhnKkLp5Zat9+6VzhINNt7Fo6hBYbvnPY
         7p6WS7RbYYdxgTd5tskvli2kDvUoUVmVcGyNhtY+CResd/hFB0SUe5+bVzgTQy0cA6hA
         /4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5MwSqR89erNZSjWhx1f5RV9cNpRS8gA23qQ8WryJhuQrvxnQXrpr0mMUGWrs09R8yF0Uj+Lnrdjnvs5G9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwxuk7owKzq+59C5EB4mcxK2tA4gYFAZtOrqTo6pXbrtVCVy1x
	0quOBq6FtLPgzS7phDpUsQY6nDa/8oOpmMzhKjuDaLnY6ReD7C3Xpg2nFZ2glYhgVZEM6fkJEK9
	13joDauD3DUdCjb/KeP2i18ceG/wQ6p4OkWOYdTOgQZZQGNcpxbrRTSSW/dpwssrs
X-Gm-Gg: ASbGncuxTjwMIcZ3FxblaPgbGDrk+GbmX2ZGULUpv/borof/tVvcGmJZ8ZQP4pwENr3
	j8BdjKWHRTHNOwUeep63gou82wXVa17cxmxKLJEw8RlMSnOeFYFr2YKHpUoxx6PEneJczBCiZqi
	aWog8m7zJSyzKlNRwbTZb1pMX7sfkCfncpGNOM1JM9YPavuqdFJrlHh+Op4vebSwns7yoBfzt2I
	tl5zP4iKJ1vPutuiIVx9SgUMQkL8SD6QI5H096CCOqeZOeW3nXQ05e2XSko49XAstssirigJjdS
	k0Gysfjp1LEkM0UhOWMKGIGZmx0lWcYb179qXwJpNozJvmXhJZI17Y2ITRAW51nl
X-Received: by 2002:a05:620a:4250:b0:7c3:c814:591d with SMTP id af79cd13be357-7c9606a87famr86035185a.1.1745568798768;
        Fri, 25 Apr 2025 01:13:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRwbih+UDIJTpL2xeYb0vB5oeF2rMuGPT2R8qqV+rCOL4n+zcuKp7AfR2+zjUjXDCpwDFJyw==
X-Received: by 2002:a05:620a:4250:b0:7c3:c814:591d with SMTP id af79cd13be357-7c9606a87famr86034185a.1.1745568798340;
        Fri, 25 Apr 2025 01:13:18 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4fb5ecsm96926566b.71.2025.04.25.01.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:13:17 -0700 (PDT)
Message-ID: <0b5704f8-ed4a-4736-bd3c-1ed3640eca72@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:13:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: Update max processor count
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jingyi Wang <quic_jingyw@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Aiqun Yu <quic_aiquny@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250424-smem_count-v1-1-931cf68f71a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-smem_count-v1-1-931cf68f71a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA1OSBTYWx0ZWRfXyQOhX+sWzEUA Os7u/BjrY0xmUTeGfXYeLKsNNb2YPvYfkWtKA6P0ok0q1FE0qahVsz25TzgdXN8KsT+iAOgG0dc IgxphWT5X6oQMF99MTZXIZE3cDv3FAQ1hmAwKzgVswdHUH4zbHnvjhOs+gXVOjsiRMjp5aAfX5n
 n+bAmnr2I+eiCV78H2amh0UAklBRTVGl/vdUuzGfiLfJrOCme6gTTmAqyD/sbpxL9IlvAFYlqlT k4/VETBCo1W+fjGs4Xhpjw3ixuXqxRFoohJXppKuCpEdFEaLLsgo2C/4rhCUvDtFi6rm6T1kXaN H0Xrl83VLQsvy1gIEA9sKIU5vejJJOTsmYHGMo73DYqDHxC/HoZqqv0pkQvWClVUr9GKuCz3ljt
 LZ2WYdo4iQNA7HUx07Po3IwtMJ8ToM1OGoqnovaZKvRgSB4AF0swUg5HlMPZCvgykig5QZXI
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b4420 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=w250ENZH9wTvBGmLii8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rF9j8ELABrAcrZ6tFA8RnDUilmKdcTAS
X-Proofpoint-GUID: rF9j8ELABrAcrZ6tFA8RnDUilmKdcTAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=518 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250059

On 4/25/25 1:45 AM, Unnathi Chalicheemala wrote:
> Update max processor count to reflect the number of co-processors on
> upcoming SoC.
> 
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

