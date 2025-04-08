Return-Path: <linux-arm-msm+bounces-53514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE85A802BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A23384604C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E59267B10;
	Tue,  8 Apr 2025 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUpQTWNF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4A25FA13
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112662; cv=none; b=BsdthRUgGEbgIgTP92hbkC30bpPOZE0rfE8tpgEZV75v+sdqbJDOGnByeq7wmUfSQy+VRPJ3tr7X4SLbON7pszkXA4S6/CNZPyb9zLrWwYn/0gbqzLkn0vyJyRiwGlGSJmnar6uuZAkf12/65iJkFKHN5SaxH1R6tJNs7494oqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112662; c=relaxed/simple;
	bh=DAkJSOh9oR6R2NnPl6o248WpYSHSAEwaTPnUb+BYUBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnmoT+kFWOtblLhjYYi9aKqj36e+15Igb8AH/AYoOfjTPq1t3vsUYyGz6b8azqgDcLu6d/GfbAOZ6IB8hu+ZvcUzQMTM4YhQhxjrX1krFdV9QcmVTJaI5Iec3kN6kJFP5xMyz4XNK7dWsR+cXSamWWyEEyZaTIjgvS0fcwsXgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUpQTWNF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BgwcA014104
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 11:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QiH0xgG4cw0AZfAy/Vvm2ZJJ
	V+VbLE6k/8voYBHRRpk=; b=EUpQTWNF0QGjiTo5X2CUR/GYtBQCAM9kje5bNJN9
	7w6PzBw9QzAnLVlko7o/QmN5PcSfHqy2A44CsEXISrPWbijoFz+Dn9C6+SJIyudi
	3SjrY8xKY7uSwSoQNhD7xLhUIPW7K8u2jEEwa16LB8F6aneBmvMJT8jc3rD+MWqr
	xagh561hbh8IWhPdTmtSzqXfVVSTnJnNj8s9COV7vvx9nxcwELPHgT0T6evxo9qN
	bOyanp+H2LMmb1TsA6EXlZeUcSDJ8KpdZ5Eg9ufPBJU03vQcwby6wwjL1AA0Zza6
	VT7j4O191SllL2CKQYz5bHsgjVwgcl2A/vcG2w7E53SY8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm7jte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 11:44:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f7210995so994847985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 04:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112658; x=1744717458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiH0xgG4cw0AZfAy/Vvm2ZJJV+VbLE6k/8voYBHRRpk=;
        b=X1h8L1wKvyP55tMplvmfJ8PNCdSBS6i5/LPlNGoqGFncBdN6h1fKL9kPLyldDBUUgn
         TpEd9kRzDURsG4NEERZKrFu4Y6Iq4PGajnnrBoUfgoTrM+FFRehKhx02OTbwkrTv7ODX
         4LWqD3uHRyjvpAXi3FMeRf9Hk4d/9dvSevGXsb6zFMzRKY0OKunssRPZMj8SD6bhZcv5
         4ooUw6lAu2P63GbOG5BARTXJ8ZwiMG1araC67cLnzjtRzE7l80pMMf945+Hj5l4227KK
         Ys0Ve3GiEZK06YZ/UOJm5z9BUVwAasoG8Y+mVCqGVzRp2nMT/zeXq8Og0FSjoWnDyGEl
         xotA==
X-Forwarded-Encrypted: i=1; AJvYcCXitXeIKYBzEwdo4QSGPNI7iyaCCnVfW0ez925TjQ+djSN2lw6laHauSNGYMvyMljqKUOvOuRztzX36JDS2@vger.kernel.org
X-Gm-Message-State: AOJu0YyyGqP+RPx6f9MiNG6Oa+rSNuOsmTH+F/3++3RL5jh0KI7m79Wi
	TKK5ZQYosi3cvQvCJvYB66BtiD+PtoxbKk73SRFWIAztS1JIGKjrm0RV/vDW4PT7ddaYNu71Ox8
	ELWl5FrADtx838N5Oqu1lEmyyBXEWGyzMp1mo/viAovLH0CZp++x0SqDhncKfRkjJ
X-Gm-Gg: ASbGncugmveMiQnIq43Er/0/xdUO8NDh5L2ldBEaOXtsjWsSNPxwAtumKsbQjsWHRcH
	daZX113zOPaKyyKih5Dnof2W1iY7rYuo43zcbeeS/LdgT4qVlrTw0/P9NMjSruP4/kiYh+S5+V4
	iUcNQdTb34mHPxinFPSUONE1WEygs/TR0dG9JrTODZRj/2Ses8RNo/PbxrVxuLDSK1eTg/i/sOC
	414tigRU4zIFtKI0GGW8Hev2U/Xb1gXxBVtep3wF0pEBUI2FiLdsTU2kBIAKYdy8IhbpBJ5pJsZ
	8q2GHIXmqO//XBzFhxW7OqYYrBEA7ou889ou+5HgvQO/GIAbsfG0QMmunnKXZRPBvtpPqR2E5wM
	ttUk=
X-Received: by 2002:a05:620a:1a85:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c79405806amr399835185a.3.1744112658525;
        Tue, 08 Apr 2025 04:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w/HQSwcn+z9yoY59a3SkR++9C/Xa/l18tIcBrY3nXcExKTwVPb0rBd71tZyAyXxczD6fRg==
X-Received: by 2002:a05:620a:1a85:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c79405806amr399830485a.3.1744112658207;
        Tue, 08 Apr 2025 04:44:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031246acsm19338721fa.16.2025.04.08.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:44:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:44:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
Message-ID: <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
X-Proofpoint-GUID: MQ1J8woszXLYICxxgsu1a4EkQITNoJqi
X-Proofpoint-ORIG-GUID: MQ1J8woszXLYICxxgsu1a4EkQITNoJqi
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f50c13 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VUUUEbkTROAwnXgzEp4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=748 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080083

On Tue, Apr 08, 2025 at 01:03:53PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2025 12:38, Ayushi Makhija wrote:
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>
> >> contains
> >>
> >>> +          - const: qcom,sa8775p-dsi-ctrl
> >>> +          - const: qcom,mdss-dsi-ctrl
> >>
> >> Drop fallback
> >>
> >  
> > Hi Krzysztof,
> > 
> > I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
> Look at SM8750 example on the lists. Keep only front compatible.

Why?

-- 
With best wishes
Dmitry

