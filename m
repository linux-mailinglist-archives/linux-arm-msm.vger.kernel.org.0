Return-Path: <linux-arm-msm+bounces-84514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5121CA94D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 561D130819E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE8921D3D2;
	Fri,  5 Dec 2025 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMcAOc95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfhIuXQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFD2581
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967999; cv=none; b=IbJWHeP9Jmi3rPBfceP9GkMHOzNTlAgl0vnZAhNsIcQt08MR/SrzulVfnYN8aDvynYrr8skB7BLREIdWNYvaLK7ieboMIq0OuIk8PwmjLr/hAJxDGvxPg6zqYrvW5Gyi8J5j+ZsPxxEEoJ78dP2Ss8kNK+piDPT3jR1NMq/OAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967999; c=relaxed/simple;
	bh=VcPaRvErv2s8ZH5ML/MQ4Xra1e7aZmd22soA+euMXjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkfCMyPaAOWQPEJOnqbqE9MvHyAOCjjUHK2q80v/N3lPHoawkiXTVowrNVTFBnCCMMgb9NELgUFhpVwCUu41QJUEHuGHtxkB3z/GRARb8li+ASxNyZLogCoUyZ4UI86ffxVPfG3nURaBOfZ7FUYBk66O+g4jwINaE0IWpOlWOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMcAOc95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfhIuXQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBGAi1075454
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UYQU81Y6HLQpXXtuKLRqLyYo
	i+qOhrx18gQgzC4wJlA=; b=LMcAOc95i68EA+FSz5Ad5U66KYVwHQfWGYRnQCR5
	AaDoPGBp97UdjnuT1evFcmQOxipcQ6UqUmJPHk0EpMK+ZslPLGfC6OD51Cxn2AnI
	lL1TOe+rACGupzr0WAb+8Ut5YtVd2uPnBff/slyeCXcV0Zk1OL1LhdordBYmZ4kv
	P0e4slboGpVpnDiBwEhPsVAycuAIaAmLlAhNt+WbJvsh0Fbj2lxdXqHogciLgKw5
	lEDVGxo9UBgC79Pw6SrtL3NewyD5dTIAJ9ObdEv6wfnJHshcg8momHoxkXKQdXYZ
	rj9lantuVa4RC3hsBZquyexr2geIxkLZAeLn2sAx1okTMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngs6ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:53:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b26bc4984bso888909285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967996; x=1765572796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYQU81Y6HLQpXXtuKLRqLyYoi+qOhrx18gQgzC4wJlA=;
        b=XfhIuXQ2x6DtYfETwvJPB2oyX6VnDP7mJFP9DY39OGDNKHw1Wwc8Gs7utUaLo/b/XB
         cTMUgAI5c/tdziiTSifLJBJOOmDdgU1Tkzozw71fWgoDiFSnQJdLkgyLnOD5b/1h9L92
         /nsM5z1FUrTC4r0BEe6Q5UZnah5hsTgLkMQcV/kAA77mP46EcZr0WUP7d3b5xAyEIyJK
         QvKAgs3UJ591GV5r1vw529W3/x1LUTJQzfAcYKyA2JJVbO4+wpXoAnogRm0qp7rbZA1e
         fm693Asg6RHgZOIiV29MF4GRicwvBNkR/2x5BnXHdeq0coMThe+BIQJiKNpOc/6gt4k3
         bUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967996; x=1765572796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYQU81Y6HLQpXXtuKLRqLyYoi+qOhrx18gQgzC4wJlA=;
        b=VU5t4JJMJ97Ge82ShfOJvY/W48GHQnjsF1oDGhsZzmZZarKwLXNNiaLSk6P6KY3DG5
         HpuTAD4pclwK3k89OUherai6qWm/BVhVZFhFx53VDkdFZ4KbR8jBU+IWbNnFY46yU5aV
         4pPZJqU4fHGqtT+NB001588ZmeXt96rz6yKx/QhOzHi6LoveWKqY1p6v6s/9X8dVjazB
         axHXd9kICoN7YzAt+0PU6Jq8YWlyOoBvL98k2y8v7nbF083iCRut9rkajQdT867oXUhn
         SLlX4EZq1keD4gvsxBGEKEWi8SSVG5xNGSVlYi++FiCU+wScyn5RpVsqIBERBCjP47sp
         7ibw==
X-Forwarded-Encrypted: i=1; AJvYcCWWAfYtT3qaxdFgqn8Abvf6wUvxva5gHxntUqm0cU7TmnSDSpNjXJxuDRaPufs/knRLz/5nBqn9kZpRm6jv@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIfcfiaCk+CTqJgkaunKEFL5P7wyFTkTWf2bhGpsYy8h9UbJT
	sj33l3a0nVnCP2szWlpiXzyfsYmajSxw801izl7y9oKsEloDm6uagBFMYW0qICL5I1QJlCPh+YF
	ArioBx7gXP83Y7inboKq/fz6JS3hcXHo61srwzjjhZqe6MyPgldeUZ8DW7Yfs4dxF23fE
X-Gm-Gg: ASbGncvDqWxmMfU//MYDCFldv8dNNzRryrG/t7zG14Vki5mgU/uGwcXIojWGmNIvanI
	j/A+sz3YF+CmYHAXLEvLa0urj5E/ciTBERWKMt9FyVyNb+P31rzNyEgl48wmj+Mt3DuuQwBSihK
	K//Pps4xoyHP4eDHXEMqUbHJ7VLXfKsfwmd1GI6l817w/imgTqrKLaxbf31SqVoP0DCwfeE3puR
	EUx9ZeTnvfkf9M/iozTNaYfweMX276tWXsfPcbjhe0bFOYqasORak0CuzinuoCri3P2WpoaL/Vy
	B9MOdrDHNkG3fsYXDXBGM6FzYSfIHVMWjz0B90YZ5TfRlGAexP7pFgJXo9wsGz06199fRQQsOOX
	A8k1mDruiU6A7/TvP+fskMxY6FimTa/XYJFO6fY1K/6nzGznIk1+HYeH/Wd8nPDm3ds9lcTHxjc
	L/MkNjca9RTZjhhWRYKriSRPQ=
X-Received: by 2002:a05:620a:480c:b0:8b2:9765:3a69 with SMTP id af79cd13be357-8b6a2586080mr56196185a.68.1764967996448;
        Fri, 05 Dec 2025 12:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe1aQZfNJvea5YgqM/l7S+IW0I6k1UQ3u3irgB+qt5cziGghA1+4KgLqtOSq6Ucuz6XlhljQ==
X-Received: by 2002:a05:620a:480c:b0:8b2:9765:3a69 with SMTP id af79cd13be357-8b6a2586080mr56192485a.68.1764967995983;
        Fri, 05 Dec 2025 12:53:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2fasm1850723e87.60.2025.12.05.12.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:53:15 -0800 (PST)
Date: Fri, 5 Dec 2025 22:53:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <iowdz6u6fw6cmgqkznxxmksz5tufkbgen2k2f2k6xi3fzwa5qx@73jldhd2yoab>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
 <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
 <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jnHMBIDZGzjUNEmUpD-Wfy-zefDElUkp
X-Proofpoint-GUID: jnHMBIDZGzjUNEmUpD-Wfy-zefDElUkp
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=6933463d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6r3IkYRDlMlQpd4nI30A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NiBTYWx0ZWRfX27b9hUoZVRgc
 +WlWN5dXWfwmI05c4Da068UGOoJVEzvSCfRUeXlO1+67scPXVpEHO+D6AJb6V8b4FDAuTZiTTuM
 U6/FvLeJ1K97gxvVmbJLBtB2aLF33NeLgDrYAvgvNCKJdd+9crPJ+6pyMoIgSKSJhdbIR74HRK1
 maCNqqESobQAdbRwQKrWWeRO4Grc62cFSUV9zpPqvGT9OBFoSq8II54r1dYO6pYy3QNAIYWM3Pe
 9dyobXZBPueAGSA13BOygp4lGtztU0H1LC2MOjs1bnQXkssO7fw+QakcOId6y7UK4PU9YNC3GyM
 k4+dk2bBwGZrPw8++lcPRM3x6pOVM7XhICpbVH71Kv46vjd6O+Nrnwkl+3ZhDNUwB4UWEMOj1aX
 JImD6u0UrVyqVK6yw7Yod9Wy55k0bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050156

On Fri, Dec 05, 2025 at 07:28:52PM +0530, Akhil P Oommen wrote:
> On 12/4/2025 9:04 PM, Krzysztof Kozlowski wrote:
> > On 04/12/2025 14:21, Akhil P Oommen wrote:
> >>  
> >>    clocks:
> >> -    minItems: 2
> >> +    minItems: 1
> >>      maxItems: 7
> >>  
> >>    clock-names:
> >> -    minItems: 2
> >> +    minItems: 1
> >>      maxItems: 7
> >>  
> >>    reg:
> >> @@ -388,6 +388,32 @@ allOf:
> >>          - clocks
> >>          - clock-names
> >>  
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: qcom,adreno-612.0
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: GPU Core clock
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: core
> >> +
> >> +        reg-names:
> >> +          minItems: 1
> >> +          items:
> >> +            - const: kgsl_3d0_reg_memory
> >> +            - const: cx_mem
> >> +            - const: cx_dbgc
> > 
> > The patch overall gets better, thanks, but I think I asked about this
> > already - why you don't have the list strict? I don't see reason for
> > making list flexible and I don't see the explanation in the commit msg.
> > Either this should be fixed-size (so minItems: 3 and same for reg:) or
> > you should document reasons WHY in the commit msg. Otherwise next time I
> > will ask the same. :(
> 
> TBH, I was just following the convention I saw for the other entries
> here. We can make it more strict. But I am curious, in which case are
> num reg ranges flexible usually?

This might be a historical leftover. Feel free to send a patch dropping
min/maxItems for existing devices, if they never were flexible.

> 
> Just to confirm, we should add this here for adreno-612.0:
> 
> reg:
>   minItems: 3
>   maxItems: 3
> 
> reg-names:
>   minItems: 3

I think you can skip minItems completely.

>   items:
>     - const: kgsl_3d0_reg_memory
>     - const: cx_mem
>     - const: cx_dbgc
> 
> -Akhil>
> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

