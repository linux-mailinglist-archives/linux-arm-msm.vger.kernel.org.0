Return-Path: <linux-arm-msm+bounces-60511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3D3AD0CDB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 12:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29BF01892470
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 10:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F94721ABA4;
	Sat,  7 Jun 2025 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/ze0UI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963320C46D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749292374; cv=none; b=a4OwpKNX0FoxOAKFSJ0UBe2Qxd22CvWBiHiApKvIYvqTkRMrUo32u2ZWH7AX34biBO89C5JR6KrbnKHEZxQ8Qr+M/HXIkLe2jkwh2OLcmlGPWUlKnd4jjrNDpW/YgrcJZ+GUbSvhJtS3/u3iUJKiSBAxx32iz+Fx2+rc8S33YNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749292374; c=relaxed/simple;
	bh=DfkiZuVme3n4FvzxhxFbP8GC088bc6XKMPvAk2xdFY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tq8zx2Gc0wI2eplOrJwyzj9va+FslsU0Gi6yDiz+wGnS7usqvdk3btmeJHCSSVU5/mxKok7I8XfGNUMjEQpRjuukf6MnXj7HBlBe9GuzNjck/rbmxxgkYIvlPrYQ/mC8cN2NmYgbF1a2Mb4Nzx+DvC9Z78GvUs2mBYkpFpi0swM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/ze0UI2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55745J4v006086
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZ6+dp0ad8amdnO4X+sS5UZnq9PAZ9SW1yad5IwngOU=; b=P/ze0UI2u6/lr+9O
	4Tt/m9mo8M793kJIEheDa3FRtgH+yUrbt2HBK1ywS4o+AXVTQAKRtQ2Tv9uuoV2s
	5PKiLyCh0rHApAhzCQVTW6YHk+J980mYs0D1YKXkBqOLSeVTahJQpIT8VBO0Z2X4
	Cn+tIulVyuqd1VZIp5vVaN8Hp5hZDDndrc8I1CbkSVxcmpQXlsTvdkHoyeXeaDVu
	eZ7eEM8Ct69kzkW+Ihfwe+5rgsgosusd9jRjme2Khq6jjtlqDQO7NKEXj6BEhsrN
	KQIngbd1Y4OPSObb1GYM7fT9jT80n7arlecSEiqzGQPsNrnI2fcUI2E0SD/goM/H
	0mG78w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9gdw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 10:32:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so529179585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 03:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749292371; x=1749897171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ6+dp0ad8amdnO4X+sS5UZnq9PAZ9SW1yad5IwngOU=;
        b=qxJkHYr94t9YYLZH7lbk6aAcPATvOHzeGrFk7QTc2uSF1C74KSScGfP7qW9eTzHYF8
         XPQEqzZo60xrXTeFym4CjhTNymLtIW6n3oR+PwYKar7g2xPvKefnSWKqBDQ6fkur4uUm
         PnVvzZQsvOhbljttAX7kMvWpsvEsTQpJ8mRviq103qrhZv3FWwcmOgkEOTwN5dHjA7+3
         GNmr071RzZHrJ/cI1NaqBRJBBWHF+PNrIZ6oMvnpK8u+G1JwHpEvzkmXCV6FkGUJLUAj
         hqoYqU93nMWy3m3fp1Uh27hVculB9XOYNo7hn+NUJlFw/yP6Rsw6/DCSDBYTZU5+3yLQ
         VOTA==
X-Forwarded-Encrypted: i=1; AJvYcCVEmIezU2mXYprXsq5eL/Hm87StJTwLgXztHcWVDImcPCqCgyranV+jt4Lcv1KalXNATf9GkNXCB7O640f4@vger.kernel.org
X-Gm-Message-State: AOJu0YwlciBHHU88HdqqY+uiwa9gSGRJB124ULvL6ua2OJVqhUhmdWIn
	sXuv9QeSdMsh39UDRjfr6rLYTUi9fxdKxJwgvGhZkGUEbOB2o/sm3NZmAQ6K/kduS7kcsUFBbV3
	zGAVzkoH3yKbtunSLxVuW0eMVI9GtFlLwMWiiwaCJDNdR03EY2v4i+Ee8L3bGKhcWiFrv
X-Gm-Gg: ASbGncvloRTuEhvoinSdpLyELVx2b6kFC7HbHGuzFp4O3/v7GSsNPk8sw/vCfaks4RV
	sQ6kgVQzJzoJXUxH/7oKKh7VjJDsiwATy5Xf+h1QTAjoJpNcoBfxe0O11YaqK0khCEIdpJ1CMVX
	oAyZ/lyPLIt8ZqViJV3lEw8rj0JSboRCCNkXUVySAx2uV3/iWU6ioqn4cFef/DjeRSS9LsL97a5
	yLAbBqOrKsq5N3gkXeLX/UUU/bAo1YrKgv/zJ29C4/hsu2BX+iW0y4G7GBNcESU0uOzJUSfb5VW
	nmtH85BI9QR8plQeqYWZvWcepNMqTuwzFeSaCwXsiIXnb2Mj5JiI8QyMPbH0OHvxZeRJ/UapmGr
	DwQMw86iWyHGCXQ==
X-Received: by 2002:a05:620a:3905:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d2298ca7bbmr832501685a.34.1749292370840;
        Sat, 07 Jun 2025 03:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEegvXUEIWt6ZR7mMr3jMuWc8lA4hAWqYVM4uXihi3Zu1Hg0GSu808Wsiprlc5zXotdcjP5gQ==
X-Received: by 2002:a05:620a:3905:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d2298ca7bbmr832500285a.34.1749292370490;
        Sat, 07 Jun 2025 03:32:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772240csm468780e87.120.2025.06.07.03.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 03:32:48 -0700 (PDT)
Message-ID: <c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 13:32:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
 <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
 <e0405dea-bad2-408c-a65d-f9a3456dd92e@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e0405dea-bad2-408c-a65d-f9a3456dd92e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=68441553 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=1BIh7cnd6DHUqvcSSZQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t10_2KLNqHU-Wv0aE5RaZfsqv46UyjP-
X-Proofpoint-ORIG-GUID: t10_2KLNqHU-Wv0aE5RaZfsqv46UyjP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA3NSBTYWx0ZWRfX3O+WZXkWIBm7
 3+0TpLr3xGiN+CUgWtRseGBTM4yH48MKBvfDFTf9gWKbGpEMTK0ZESd0zxth3fcx3WCzmQBH31Z
 H/msVdbUjNMp5ADpVI2nNU/+MF/8/7OstbHj4q2jvk2pdfLWjZ6ndl7viVf6tkzf43KEtYxn1H8
 8C3f/qq/Ps5qADVsGbvTyDA3ujwCwuJBIpTuBM8RVsgPIrMxjyBGM3F7Hu8FXuEU8neKcqjYJIu
 K2iIWrs2Xh4LXLH55hz9DdTM6a3u2Fk5IRubpL13ueruA9T/pNShRXWuqw016wEjfDdeCUsK5IQ
 EV7GdkrHWrBepmus2R/OzhFPqbXn80GTT79CfRbb6zDmVGGIGsYJ06CK8tbsHEgAx18C7JbgWT5
 LoMPbEkYynFIsq/X/hp2LyJRHYUh1Tez7CmKy9QKDIdOrgUCUJo119UrGziw7l0t5iomXa5+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=998 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070075

On 07/06/2025 10:16, Bryan O'Donoghue wrote:
> On 07/06/2025 03:13, Dmitry Baryshkov wrote:
>>>
>>> As we've established the fallback isn't a fallback because it falls 
>>> back to wrong data, so lets fix that.
>>
>> Why isn't it a fallback? With the driver changes in place, the 
>> fallback is totally correct.
> 
> Its not a fallback _as_is_
> 
> I'm fine either way
> 
> - Apply 1/3 and then re-submit 2/3 3/3

Let's settle on this option. I think it is the cleanest option.

> 
> or
> 
> - Enumerate a QCS615 table
> - Apply 1/3 here
> 
> ---
> bod


-- 
With best wishes
Dmitry

