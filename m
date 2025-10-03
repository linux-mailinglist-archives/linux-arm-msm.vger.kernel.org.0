Return-Path: <linux-arm-msm+bounces-75944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FCBBB80D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 22:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D69B51B208A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 20:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DB1238C23;
	Fri,  3 Oct 2025 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctDr/41q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A22343B6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759522473; cv=none; b=U82/oW24XN2vNfdFLnnVHDsl0VFeYgPXLYJxSyud4RNv/5glKPYpQ6vXCinJ+qsor+agaPcNWTp89BNm5p9nhXfQJJfjtIvIIy9k8kVjUSFmhYUsf2Pqt+kiMq3/A4wQ1M7czlifsoHD60veND/u6AxZjOsyNuYdUIcDVt0XQ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759522473; c=relaxed/simple;
	bh=fD8n54ZX9M0RRQRWUXO3tmRnzc0ewZjTWlfVmwaUwfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icdf+bCpL8/J05GeiFsRygVf/j2Lr1ypYs/AGDQemMmeXe8d7jWcKfOyE8XKNYIDJlbwuR4gyFz0omWUWP/0C3Bmz7EPhK9LZ3zy2OWVGFhQDxu5juiocW1MhzMs87bVVjGnmOni+CtjINC05Z/UGOUDSfmxnMgos8M/LRceAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctDr/41q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CG55O014922
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 20:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3d9SzCzSMJIBbQowA9w6QpPw
	22iAr4U27ZeiUZsWKrA=; b=ctDr/41q1epOH8JmCATKNMFwBQJA361qEiMbkHGK
	Vu+8JQ3OS9BLn7HIKjNVx3K45tPXip9z2SKTlASdb69+mpI0zQEeuZ9+BP+1J75f
	JPc1phAtYdf+uAGL48vI0aJEl+d7LIteaJHTzoNyzBN//KgHtIMZ/PzhLalDrOxA
	PsysQPT6TtqgrLmC9D1xSjA4kFm/1xFTAao897ajXeC0LiJRQHT6z/T9Sme+H4M/
	VPhD/POypn3o8R/h3W83hZ9E4MZwdWsOqcjTApMk6JGM05iCntwrgXmfRtvLYFA4
	f9ANutiIlJ0c/4v2KvMpM5gwKAXTebEM4X3UxzImI/thfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jeb7h4sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 20:14:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de801c1446so61311111cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 13:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759522469; x=1760127269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d9SzCzSMJIBbQowA9w6QpPw22iAr4U27ZeiUZsWKrA=;
        b=FOQSoMpyJSvrqZzt6Tccnv5ES3UYtWIKXS1rjdHonp1i6sXtfv8pol2gYP5hPDaGRD
         VuskWVNUF7UH4UIk78LBjA5SNJ0JA3wcVE935zV0cSAYAXU1EPWy5c/0afoosQkOGsR3
         ubKOzasx1Vl2m8piPMsK1qM+9ICvuMeGzF+m1JJ3mgJGKzFYs1twnBccs/dt2uiVkvj/
         OByRB2S10zejcsmcZJSQte56gf8WZNRMF4+HnvxWHGpedDipwJiscg9MfxKzzvlCSrdH
         /UJenU7kOuz2sgsQVstL+CDsUoyXRDIcPIr/3bvK4LGHh8r+xeDHVZsJNyCohmsGC3fE
         lCLg==
X-Forwarded-Encrypted: i=1; AJvYcCV6MwSOwlFAWC30d4RJsl/Rs2cN51bM3bPUn0FZYg2AwoaFrW3Uy38ZNjuMQfJp6yimvrXR1Hd2W6JfPcl8@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkgSucLSx/ZLLXLg2Mr5zVyAfMaHo1LLy3t9WBOe2DoibEksr
	V1s8mN0WTVka//hu3FIVkC7pEYbbMLBFQtif1pV9dQ0rNnB5efjLaPs2lebKYjcNnFZ984D0Rus
	YyeBNxV8JID3mQhtAwAFCPF65hfedRhtz2/lB1ElGEycNmR+k5VZ3kXBZv00AuRVm7NUuKC7VUJ
	l0
X-Gm-Gg: ASbGncuov+PS0tNrdq68YK+BH+yZ+62V0FFnjivXX8udRthrIEymqCys0wT6OPigKYc
	kPBN5VBYOM/Lb+4/O0+6Gzui3/S38jcalAka9YgR8ClTEW217PxyYdFTTNHhQCQroCS6VirckbU
	FI8skHHHgupQq/+aKf25zZM+e9Eyo6sjrq1PdbUTdBNG4bxPzt+M8C0M6dE2eI91m+rBtI8bTlt
	zAaY4EanDmh3qvNr5dY8EoaqWp7z4PWp54iV2+Pfz2k1egqQDEp3lMgXleICwOMuvVEq82B7w43
	8AECJZZAvOe+L8Vx6UNqd2oh+g4m0rj+hAPKOkgFppWcsdXfsd6i/SpgLZyv6z66ZxljROUE5z3
	jaAhQBqwYJX+y4Rj7blO4OdRNhwA5J9dO+RAFEdUh3q0FT37KB84Fupe0VQ==
X-Received: by 2002:a05:622a:1482:b0:4df:1196:f56f with SMTP id d75a77b69052e-4e576b43357mr58964041cf.83.1759522469110;
        Fri, 03 Oct 2025 13:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQgFtCLDGX+O3PJbNb1GIypKvYOnVxRVaWG1pkNYoNTcWC/bmJvu3v1drdtBBMjl3H1gE3g==
X-Received: by 2002:a05:622a:1482:b0:4df:1196:f56f with SMTP id d75a77b69052e-4e576b43357mr58963591cf.83.1759522468538;
        Fri, 03 Oct 2025 13:14:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2b79e9sm18024371fa.16.2025.10.03.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:14:27 -0700 (PDT)
Date: Fri, 3 Oct 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <wudkpzky5sqrhqjfm3utrd2tcmtalszmyw3zts246pop4a7aj5@oro2wyqhtwaw>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
 <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
 <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
 <budxy3xza3ieykmrp2anpiz3gktq6mc3pqohkf6ew23jun3po3@jv2em5mmhjts>
 <4db4f0d411cb250db2d513690c93f0ff5a6dcbd9@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4db4f0d411cb250db2d513690c93f0ff5a6dcbd9@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDA5OSBTYWx0ZWRfXwk4Fjhsrnwtb
 L8+x4gdR7qTTBboWB9YCT5JLSthrxX3pBB89rt0Zt5buLYSRwQfMFoOQHYI+HPJF8jvGfPvmuYj
 2KeKnS3pVCNuvOB8xOaQuz7MQziAcwmfmwX9wx+vUUAoSVep7FSPmPTBW822DP+Ac/sw3ailpyB
 wApjF9Ph5eM6sBw0Tt4/MZ9U1DOh6upYPur/tf4bdjNMvnP0b5CfQ01B2bEXqqeHSSvMHMpJ7Cq
 bQlQO0uWwczvJC8IPUw8wtsRs8Fm9A4OYuW0Y7RePAuCMzZlfLcpqxVDRdk7JWVZb2NBeNFC9Eq
 VwFDhmEbIZU0QZdYC7W30yXatp9w97OC7bLhMDkRLnhM2PbNVsHDfR23pCRQaePLdXX7qvgBfZ+
 dcw1UggzhiWgrZ0920HjfjYEL2LnCA==
X-Proofpoint-GUID: hOIj1YwxIagM63wHehIBKbF60sH8X07C
X-Proofpoint-ORIG-GUID: hOIj1YwxIagM63wHehIBKbF60sH8X07C
X-Authority-Analysis: v=2.4 cv=YrwChoYX c=1 sm=1 tr=0 ts=68e02ea6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=p0WdMEafAAAA:8 a=85DtlbXH99wPiBcwuMQA:9
 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030099

On Fri, Oct 03, 2025 at 07:55:21PM +0000, Paul Sajna wrote:
> October 3, 2025 at 7:36 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On Fri, Oct 03, 2025 at 06:52:03PM +0000, Paul Sajna wrote:
> > 
> > > 
> > > October 3, 2025 at 5:13 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> > >  
> > >  
> > >  
> > >  Regarding the MDSS. Is it being solved by adding reset to the MDSS node?
> > >  Or are there any other issues?
> > >  
> > >  Yes I'm referring to the reset / pmdomain issue. Joel Selvaraj is looking into it in the sdm845 tree. He said he tried doing what other SOCs did and it just got stuck in a reboot loop. More investigation required. Currently he's reverted the pmdomain commits in our tree.
> > > 
> > Which pmdomain commits?
> > 
> > -- 
> > With best wishes
> > Dmitry
> >
> 
> https://gitlab.com/sdm845-mainline/linux/-/commit/002ebddd695a53999550e241b71950f1aa0e1ac4
> https://gitlab.com/sdm845-mainline/linux/-/commit/09813cde376d9d8f30eaf761534532101a0a7755
> https://gitlab.com/sdm845-mainline/linux/-/commit/0e789b491ba04c31de5c71249487593e386baa67
> https://gitlab.com/sdm845-mainline/linux/-/commit/13a4b7fb62600e1c0738fdb0b7176555ff05aadf

Thanks for the pointers.

> 
> All got reverted in the sdm845-mainline tree, I believe related to fixing mdss
> https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845%2F6.17-wip

-- 
With best wishes
Dmitry

