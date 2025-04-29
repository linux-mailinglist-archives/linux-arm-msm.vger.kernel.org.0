Return-Path: <linux-arm-msm+bounces-56121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD31AA0B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65546165C50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198D52C1789;
	Tue, 29 Apr 2025 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jepv/vp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743527F477
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929434; cv=none; b=rdzChga0RPEFCgEyujlT2tl0asb7PeyFTI+4OYW7wU5UfAu1K43Q5WijOc/nWS2/3cesmgM/Yj7OeL+ek6rsxsF7Oa8L7r1ZC8dE6Rf7mm4u+phRaizRwAsZ0ENw+ej+SRzt7FsCYP4oJBETcfJJfYQSU7qSupHFZZKT76j+tx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929434; c=relaxed/simple;
	bh=E57J4dCmvgqlt1ThO9CEVN44k9zEWXIKqQnEEIIZA7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUGKe+Vj3MHiOKOIyvHA0tFhMg8y5ZnH0kY9B5yuBjjADZTnDwMjoEuHBTuxTCRjEOQO4BxaNH4vIRUaS6ZPNAe48Gbn+Xad/ms1GGB0+j4ozpW+wSwQaNtn166TEmIhcdugzRzPXicWJ+Qz281C6wqq9iPCK4vkaJpicGM+CgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jepv/vp+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T861Vn028068
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mWPI8IBrH7hlnkBmEO8Qt52b
	2JZ2LdgusDzm/ZmxwCM=; b=Jepv/vp+wV4PAFttjELu8cAbXFsPwIV29w+Gx0Eg
	6S+1lTWzJKVUDMIkSbq6iFufXGAxdwdKKH0zRx4sHPHG6oUGySHVy768YCLlOjP2
	rtNOBox+emSg593ZEVQzvX63vlYUoH2ss/j6MlyHNXdUgFAAXIFLffIxRHsue1Fd
	xXRd9NnBe+c9Cjbzjru6lrF677kA5dn2oj5SFr40nVn+fruysjAKcfM4fSLqnKut
	K9tqjhzUxj1ml3GGZ/rTteRcjB5eTMK0W5yu4qKSsWJfuQmfCicudCMvJvnxqN1b
	GNqm4yJshWEACANApoM2uKrrekgVxI4/0RGTkjSDab5XWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmq7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:23:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so1113289985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929430; x=1746534230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWPI8IBrH7hlnkBmEO8Qt52b2JZ2LdgusDzm/ZmxwCM=;
        b=Kx4w6h+s3gYztvcb8PNHUdYdutIxfzwrKQfX6X81L/LtidN9m1Xqh6V2wA4c4rcpPP
         F2askJi2+1S59r2Ebl6wtr7IPmHl+osJgptKPXJthwJOlxJeDz3BswwHbxjC0L1HqurK
         WFtBkVrGt+xnFYblshMgL14egF1dW70GuHgkMi1olIkbJocYeJxE0b3fDLAR/byNN+0K
         /gqereQy57Z8t40pugjCvuX4ABE8cl3s5UQDtuHuw7J8biVDY3OIXsc4yWPh4n9jB8gf
         ypwM6+aPUsiwwseg/VQCnbq9F4qE65XU01OxADQwarL4dU7QK/47pngySr08d/a+jFGu
         GasA==
X-Forwarded-Encrypted: i=1; AJvYcCVShqTSFmao9WClMUH9Wv3/pkyXRud0+ZEcwmiMBEQZwKrE0PA+hhIBNInO+zlP8QeUkSDqbODb3eZ9ytWU@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHlbC4y/v9BcvXjt/u2UcZAU11Ry5GaqijqfKszGinzztEwiI
	mbFu+e0cJJ1FQUM8qNzg7n70z6uvEdkfL0XP3YbnrQdcRZmp+1UF2us9pVVPpHGA6jg13kjPTwN
	sf8dp8N5aoOGy6vE/9ci1eJ9xHNd/SRfwAGwnJjOImCs7NCrIFOH6aGpCcfc7I1Td
X-Gm-Gg: ASbGncuwjKrRbybjsDui7bvcklm0FQAOELBV5Oc65sscmIa6PG772YWpV9e0wLL0MoM
	52diXTTudEkeW+OdFLCRFYKsh477PV1ziKEvCk+a3VuO9nYe7Aw8Ji/JJzaBMD1Cgxd4rFpeikF
	gs8oTCxj7P4UjMmlREVdyiB6AWO3p8IBsJqT4X59hl3fxfRlxuYICwm3mE4Yhs/aaqBWyuF9hul
	ai3FGOTQaQn35qMqZK4u9Sa2xs4ZpzFisB+0xyXpAd5CPPa2eK9tnsQxFGCjkCAtMHerdtuEB4R
	/r5t3IUNLSuXLmfwL2UyO2mplyuW6tswYrCq2XNWZb/fau+S4aXeK4XIZVIqhyYtVYl+Pb54zL4
	=
X-Received: by 2002:a05:620a:6117:b0:7ca:c5bb:3007 with SMTP id af79cd13be357-7cac5bb32b5mr25637185a.37.1745929430403;
        Tue, 29 Apr 2025 05:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/YVYTF7AsqT0sUlkNbluJNYqiS/QEjcLK0UlrF+CJVw0ltMIa46t+oqSpGCfKt2bt7Fmb9w==
X-Received: by 2002:a05:620a:6117:b0:7ca:c5bb:3007 with SMTP id af79cd13be357-7cac5bb32b5mr25634585a.37.1745929430043;
        Tue, 29 Apr 2025 05:23:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb49872sm24408651fa.35.2025.04.29.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:23:49 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <igei6wspjs7qetjx7nrhr42kbvb25yaldpfx32hyrjalajmcfg@qcshsrzwejxe>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
 <20250428-prudent-hasty-pheasant-aecec4@kuoka>
 <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
 <CAO9ioeUo_vO+-wuC4JGi4JfSMZx+JZkvLvsi=ppBD_LvuV2ZLA@mail.gmail.com>
 <676324e0-43a7-4227-8b6f-3fec97a484b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <676324e0-43a7-4227-8b6f-3fec97a484b0@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX41fjCCycux41 lEcdjCyXl++n/vLCceJKaNzbcP1KlQCy1vxTeqCP+hQu2NRe+fDnRrOZll5kEj0C+Iqn+EbW3Uf jkSI/mG1bj0ZYk4sVRQZfBZ7ImFR7oefRzFaraf5EU7QWNHaHirhy/1k4vYc4wCy5MpP135qcDc
 S2eOUu0IC4vLUddl3xEyeOkPYZV6mtPEzH0IaMX/huBxC6hZI6A/KN6BZ9ARLepisCKWI+eGaZd 2P9M8LCcLpL/HUAb/yq0HWlIEWjCWA5qmvbdUMiMODBzw9aLmZRCdZO1VV5iwoRf+1hFaHfbkVP XV9UBIqpYzf+S8FQ9MFDWcsI2r8ZcEHCmJ+ZQQ9WbdK7//l4We+3yDq6A1Ssb4kiNG4IGM4qbP1
 2KdT70ORsaQ6qjwzdH8ONlsem4JErHc3DnGP80k3KCQ0u+GpNCnvC6pIgivDcBUPBaLu/IUm
X-Proofpoint-GUID: nPMkcIiADqab5q-zggTU0T0fFBNivlGg
X-Proofpoint-ORIG-GUID: nPMkcIiADqab5q-zggTU0T0fFBNivlGg
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810c4d7 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CcgAk7be1liTUAj5SvwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Mon, Apr 28, 2025 at 07:50:04PM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2025 12:49, Dmitry Baryshkov wrote:
> > On Mon, 28 Apr 2025 at 10:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 28/04/2025 09:07, Krzysztof Kozlowski wrote:
> >>> On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> >>>> For some reason Lee has mis-squashed two commits, picking up one chunk
> >>>> from the first patch and one chunk from the second one. Rather than
> >>>> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> >>>> Add qcom,apq8064-mmss-sfpb").
> >>>
> >>> I don't understand: that commit looks like direct, proper result for
> >>> https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> >>> so where is squashing two commits? The diff markers have offset by few
> >>> lines, but it's still just few lines and they do not matter - there is
> >>> no diff/patch mismatch from that point of view.
> >>
> >> Ah, difference in compatibles. I see the error. Anyway, I don't think
> >> revert is correct. Just add missing compatibles.
> > 
> > Why? The commit that went in is invalid, didn't come from my patches
> > and was produced in some weird way.
> And revert is pointless if you immediately add the same changes. Just
> make the changes.
> 
> When we see a bug, we do not revert the feature and then re-add that
> feature corrected.

That depends. If the original patch went really bad, we sometimes revert
it and add a clear implementation rather than just trying to fix the
damaged state.

> 
> Instead we correct the feature.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

