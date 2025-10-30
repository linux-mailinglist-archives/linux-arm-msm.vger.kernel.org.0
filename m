Return-Path: <linux-arm-msm+bounces-79658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A2C1FAE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244DF404840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446CA354AD6;
	Thu, 30 Oct 2025 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIX6zeQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThQLHN9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC335471A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821999; cv=none; b=JLCQLgzmlymknsgs3cmIj9Gqu0Gs2BrMdrIYEUjO75/FiW1dGDRdORjLdkdEcOW5PO/jneNZ7Cpcr1NicnYSYF1eK4Xu8MdldCDZxStk3g+oV2nx9uwim+UpeQcQl6swzNi78SffxS+RBsieyoIpdiAwcl0OxX3rUbZOLt86Jc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821999; c=relaxed/simple;
	bh=goIcOyK65O4TgDX8/vKQnKMbI1joFOw1m9UymKJdhsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCybSIIIqzIeMqALrcPV05Kxcd/mVv+OJWyGf4yPjAvEpF0lGIsEHHoQW0paaimn1Sz4Y3nbn4mPSGFTOKkNR3/gORbYr/fYDoOMcKUQEA0iVu7Efc0CgRixh8qXCVyX97iZzetVvNOHaWYXiNxJU0JTM/8G0rIRUPHksHau75s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIX6zeQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThQLHN9t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7Uo591579442
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4Li80aTvp/g1w+wUXqfMhurwLUlh+lPbBgOPzmRuh0=; b=ZIX6zeQgyJ2gorIw
	ATy/MgBGFHO/mwzXZJGzcs4CMUYAxUe9f+GPwAuT1kY5FXKBD7POXDuErLZjlInw
	+ZjLMZfm4x7GZN2p2WevCjF8LvEC09C/a3Ud2/0zgkFJ67bZul7JkKlyOfsDuEUe
	R7f3w3Nh5jm5M1xAl9u8/xNn+T/GFN0FOIAbf6YnPM+xPjDxTVXTXn8yBE2HsbPH
	8TPHaCm3eINx17J0YP2ascCUEksQ2ayt4ETLfcHkHNf5P09UOXNfr7d3/n2aa6Vt
	hp8PNvRC+n/aLoaAsnZMz8tuc5ebMtqqZ5/+XuiivnDTfqNhLAF7i2pNXGIH+gVA
	e8PXKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjej356-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-890921c382eso22973285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761821996; x=1762426796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4Li80aTvp/g1w+wUXqfMhurwLUlh+lPbBgOPzmRuh0=;
        b=ThQLHN9t2mKjd0/cvjD5eBb2xMTQx1Nmruif4G1Qn9GBWyMw4/Wp9Z+tec5Sgqqmy5
         bEnbGM/JGNJzQNZVk7Jp1e580sfnS8S3VHelNyAvovLC6PGpwA399sIHIIqD9R28uwvG
         rCmHiGoA105Ab9XvrxvexepCvA8KDoWLGyx/wpBRuDzokoDTdFBinFaY3Z39x8eEBlS0
         rqiNQ88c8p6b9WHeYSBEukXmdXunfOw5ZLQe5HaCS3+iFFN1nOgu2m4h25AurZK0UOJL
         6DwzIIiq4WsoOg7fpTKAtq4dlY1cvTh4WpvoenSDfpeEOzvwULWG3OFtXmbzqRGgGRL9
         wlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821996; x=1762426796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4Li80aTvp/g1w+wUXqfMhurwLUlh+lPbBgOPzmRuh0=;
        b=tRUsGnmkQbmmUBh2xLIVVOyfqpHRuGE6ETc9zCYvqK+hnHJKumMjF0T1iSyzDtT/1C
         GflnWJdtXE7Z0/NNzO3rOVrnfK/2iy5ei1BNuIuYGdk6A4rj3NS7TY7RH+MDnwelwbxK
         CSX1bHenHbhMIn2XNNAwi5G77tatRfBolyihhZX9Igy8+q1l8c+nfJn6hON0AuwpZxpQ
         sIA2Y+b26kAVf1UJVWEp1yq9JU4yHVLy5T5xrehiG/7J/mxjouQOadFwxMsgP4K79kCL
         crHvDkFefF/JxNJ4HsfEr7tB2q9MVwa2xpBrcR0gc1TPWtihZEyhOM1xttGHYlpLQE4+
         ejVA==
X-Gm-Message-State: AOJu0YyEGs/w5N7g9MN+E5FOhIj02dAwHkPlA6gBUJ/y63fMx7BblJsE
	YY4a3MMmPKisNDUlN/wkf+AW5xug8+yDp7Fgftly+qVj/OdZifyoGxFd73l7LjZ9HY73HS93FWB
	YWCDWWQiM3IOBdrbE5IAQMbjtOVfH6ajtzq9QNZ9S1G1hA0AVH7RhHwWf9Fy8SyQsVQNn
X-Gm-Gg: ASbGnctgPGv0tBveAMMgIyD3ZGn4RH89esgmHIpMXyvNF2DA7eqpZeimICJdTbZ+P9K
	d/yrJBBSs0iA16zYa6uUsDvUbcn6IfbbuTZ2JNb+C9qt3+Oi3TgI5K8SEpYL6VGjLAxlNvWvRWu
	zar46kFpeiqjq6tWF2DxUA1jiYjySAGtqJU+T37I7qK6Hm2XXsGifnWBvEmaKEcidLcwzfk+5vH
	gi/vEh5jb3yFkAhgiHCOnlRXdrT3iCoqgXGAzRptoRUTrK1vROnG2HYyaLreuJbSRg9jqlaZfjN
	a2s1T5cWpQUS2voD1wKOxypZxiwgDYJxoui6xwjea5cHeJTCYEe1DSVDDRrgF7BF1htgqP0yQJZ
	zUt9niPUoYEfzu0c52F0Z+hHWy+TO08x0MeQOJRdfnouz3qpR6sMhqzvC
X-Received: by 2002:a05:622a:8e:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4ed15c0e6fdmr49741601cf.8.1761821996097;
        Thu, 30 Oct 2025 03:59:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm09HK/SLe5Y3f9LFh1BN+NjQibrJjNIWqbjAP7w16cB/HL9cTyvykV9a0BC9Cdc9C0OuxdA==
X-Received: by 2002:a05:622a:8e:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4ed15c0e6fdmr49741411cf.8.1761821995667;
        Thu, 30 Oct 2025 03:59:55 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e8036cdd4sm14478512a12.22.2025.10.30.03.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:59:55 -0700 (PDT)
Message-ID: <7f807543-35d3-4101-8b39-fdb255b64f2f@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:59:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8250: drop duplicate
 memory-region defs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-5-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-5-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hy9PFRuO0D5LH2aOSkidXyxgfMXUF7XX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OSBTYWx0ZWRfX3xnFkCx8FJpm
 yl+1Dj9E+sCzO8dpgUzbDY+lyIqZvWW+FKIOadYPOO4H4gQNCdQCZFDicvh+Krf3fCfBxQz7OP1
 BbItVil1VZC5FbD9xNBzPAd545Q9uNZgexv621irWsQV5iYTXSL88O5DGX8r3N7iSdESHxq1JCg
 HtDXjsiENOSR1fWNuPZciulyZqF2ffFARCbsj5aFoHaBoi3rff3RyxG4rh5uVJQeFd6I2uZJqa7
 CjEBS14qA9uAnjsO9U5lCx+iXoyw+OqGCeFWpEfdMHvGDy+XWNoLQY46RLrkREt1vX7SZFJOAua
 fcvP7zAqwN564JLJ8yPnwyIIKA/BrYiXV4Mfzhzm1TXl0eSW/24CEJD+PFTN4xjSAQI6UqSARy2
 bHh0JBevGTbPdfp61N9vc9YIaqiIWA==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=6903452d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mq5k8ySLyEHK5IPdJK8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Hy9PFRuO0D5LH2aOSkidXyxgfMXUF7XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300089

On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> The base file, sm8250.dtsi, alread includes memory-region under the
> GPU's zap-shader node. Drop duplicates from the individual board files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

