Return-Path: <linux-arm-msm+bounces-55856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7DDA9E8DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA3343B4A65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A04A1D61B7;
	Mon, 28 Apr 2025 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9JykGZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A591D63FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824171; cv=none; b=qS+sxejJS+1Hd2codD1CNC/78WN3TAZoH4Kg+v0DRZ5z1rk88M7pvX+t2azre+czgXU9AmxSsKXQoAPna5QEYOQgG03QPYRFjxs1A+zcHVzLpHLBmWR8OTgF2FHJlneSIHlL34mT7IFsKcjwM3TISbwmZE4ynsBhl9TrAjC8zn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824171; c=relaxed/simple;
	bh=41u4HRMaP6JkPojsFKHGpEIgdkeGnjTIpTm0KWVku4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOS5UNiTScG0fm5OAPxpx5f61H8YmShCcv8h0eSXlsU5IBoAfbrqX+AqUtUC4S4eS7u0ct1qtL7yXJLLZKz1GjQBx+jrL2TPPaht7L0exB6u5ZZp5MV0zRcIs1Kne4byYTsVmifoR0l3E292UUBAQxE8EjvnigevRZ3vpkh5UtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9JykGZ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6bTum023077
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 07:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+h+8h0LMixJeNURLesg+SbAYAWOUVYEBpd9t3xgGFI=; b=k9JykGZ3iiz4+sfd
	+RNYAEKGTkcf/xbDUTnjgOfoSuYIQ/jUuCUWKNjCy0qUNYJ5x2BTcJ0L9E3zhinZ
	WL2XeMgNaMg2YzmKHbUuIWRo7yxwIUb/wZf3sd4nxea7tIopUxekY+CG1y8niNPm
	2LEkrGCAsdFmp3jK7Pa3DUrGQQ700YETLZ3tQ4L8ubUN1zmiSmx+H/T0CfHYconG
	wYtxyXqxQeE1eRtGDBMnD0FaohqrBPMIbWK4stYzM14kLnFS7OPhTx+d2splqL8i
	IT7YY5IJObRZ4tWcXWqi1psYM0YsP5IAH4s1ST39xNAvOvGpDv2g3ciPJYZuCAAi
	UzDrKg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb6qqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 07:09:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9057432so92408386d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 00:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824161; x=1746428961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+h+8h0LMixJeNURLesg+SbAYAWOUVYEBpd9t3xgGFI=;
        b=ApBlMLm1pkJu6E8PYLaGnfh82hpmLJkGmfsoA9SQfhC4FV6pS1QaI/v79rTsSiD36M
         hl+LAnegYf69in6V7rjv8jiHdXMyQNVJ2LVPvqc/ssS+5qRSJXa272qb4TlGdNu+iWfc
         +kWLEe3u4B0r7n31kMxRmvC8aUBeBecVc/q11AsCREOgUc+aMIAmn8ZWuPFF0s07fs3s
         jX+B193hw/D30zPXdJx+1rPkCYGDQPqIBK4D2ndiinGJWFnBxLH1IttWQc8ODfmXJHmP
         ABxr+RtAf4dchfFAufEDx5rNd46IoZs51KtImH1TlLJU0AW+qmY0dhxSTcsD7JESJEu1
         Fr1w==
X-Forwarded-Encrypted: i=1; AJvYcCVz0XGIE7hQYPC5oNmMF5efl+1kSpof0ddQ54O2MEDSwQ4Nbp1FI0M1ZXXb54ASfRBi1m6Z6XwIvvSRNTM6@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCFbKojsKwaikYsgHwKiHtnjgqEk50Y2OGD50wn1yJT+wkcK9
	USW2y/Rt0E7Tzd3dcwoBAlqPihGINbZihQ9cvuVsZlznSkGqypPYDChmKgHh5JzkP8jROthD0Ht
	Vn7ZijVqJyz54hyHsoIATxEBLmEWC6fdl4DoEtHV0QHSzppNT+NmG1V6Rte3hymRt
X-Gm-Gg: ASbGnct28CCqAZf2q2IJNkchuHsKFhOJRKojIvbqsJJum7yL7bPasRDKmx8eOL2Ccf8
	L61SHoE7WMrr0DNIVK9XY7s2FCvb+3p0I/zdBAYHYJxomb00YN4HOPDugRV7JGHW61rsa4zdAin
	0ICG1puFf/LqqeS0XqqYMf/8vez2EMqRaK0r4dlnYAcvxEMVjwRYVDLReL5aYZOnBjiXkyBAQoR
	kV5Qog3/IlKZauIFExU7zSl1BYG7sJlM7DZZoCWC8dMDqvKNtf/G0VTpRd4o+HHKO52bbJzpFxw
	dgfWBR4Isavv+f/4mLOe4U+PGZcHa26YQAcXYDeFKBXIququCJ/ZuMswSP3m+wpF4iG1I94S8SC
	OnMisFWIywHx2+HqoqJ7/UM9LTRyDwsWdNnzVzH/9YxPkDtjr0NBk+SzLKluvuYg+
X-Received: by 2002:ad4:5c85:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f4d1f90d68mr115293596d6.29.1745824161550;
        Mon, 28 Apr 2025 00:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwfnsoBrLAILQfAhm++fx3/rvpDHPyHIMtORziW0tz+uem70yn1OXbhOpwYp+HbaGl9+r6w==
X-Received: by 2002:ad4:5c85:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f4d1f90d68mr115293316d6.29.1745824161249;
        Mon, 28 Apr 2025 00:09:21 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a5:9bae:495a:a192:5ac6:e42c? (2001-14bb-a5-9bae-495a-a192-5ac6-e42c.rev.dnainternet.fi. [2001:14bb:a5:9bae:495a:a192:5ac6:e42c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a844asm21018991fa.77.2025.04.28.00.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:09:20 -0700 (PDT)
Message-ID: <64a4698d-94a9-4b3c-ae18-b2872bdba6ae@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 10:09:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
 <20250428-prudent-hasty-pheasant-aecec4@kuoka>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250428-prudent-hasty-pheasant-aecec4@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OCBTYWx0ZWRfX6RDLbQgCzU6L M7AIm0YfKZLxvZAabiesOUG/Paznf+pnvEpAJkU1n3y3gfLirhZMleZ9P1AnP5dRfUMPVcZ7YtN 3rch/Yl6pnbUnTMYzjwmuQqKnHYWIVQQ55d3P/TSihvye/luXw5WNLwkIaTeV2JDQnC/UfmJMoD
 ffwCMaUZcV9VM+3uJjz3/0cWLaUV3/+sXvU+NGjHDXkgndrtOLEKtFsCQYxj8ID8so8vATVcImb ikQOTZ5rVlEdAVka0VkgrOGHtpkg92oDW6UPm9KAaPgSOMCxNZtfFCSCmO8vrxzN1lGKaf69qYJ 5bekhTDrDQRVWBWB5TzvI2gXPAbrDh3ApSvk73j8Qxpkgj1nqY61wghpP6AGw6XFtva6vchQZcx
 JvwUPbYcICLoFJInbvniQ3P5b3wRITigyNcGqyQ4jcQQ7bOCNTM3mCbnClISQfGYybgFnSd8
X-Proofpoint-GUID: TjnvVu9SwOmmFBRPEjK57ZxfykiuLtlg
X-Proofpoint-ORIG-GUID: TjnvVu9SwOmmFBRPEjK57ZxfykiuLtlg
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680f29a2 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Id5vWWJvOQx4gJFIPsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280058

On 28/04/2025 10:07, Krzysztof Kozlowski wrote:
> On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
>> For some reason Lee has mis-squashed two commits, picking up one chunk
>> from the first patch and one chunk from the second one. Rather than
>> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
>> Add qcom,apq8064-mmss-sfpb").
> 
> I don't understand: that commit looks like direct, proper result for
> https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> so where is squashing two commits? The diff markers have offset by few
> lines, but it's still just few lines and they do not matter - there is
> no diff/patch mismatch from that point of view.

The first chunk is about "qcom,apq8064-mmss-sfpb", while the second 
chunk is about "qcom,apq8064-sps-sic".


-- 
With best wishes
Dmitry

