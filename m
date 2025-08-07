Return-Path: <linux-arm-msm+bounces-67961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43669B1D211
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07FE51886AD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 05:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B7B2116E9;
	Thu,  7 Aug 2025 05:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ED7htlSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DB1EEA54
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544982; cv=none; b=JKa2ua95L7NOFkS1DoIqTNqSWJW6VDwfrWSEmpP/DZ+up9hIbT7QSfUt0UsIRTHAXenNIj5HVImPinSG8JhEyfv0tJnpOt8c8NwxotmhwW8/87ThjbDRvSsMM4M2BTaaMA4UYyzOmLxF5MlyjkWE7O5pMSQo9LPx9e/3aWqJIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544982; c=relaxed/simple;
	bh=hBdkyxc+SMi+zWG2hEQIQ7ioQV7w1x6uk/Zx2DS+uKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq7z4s8qPfQkPDPzzCYAi36NUvzIhJCcPsVHouZD2u4dnR9FaNtRAddk5ZXDRKXdwsMSWaqYgjtZvQSiDjHsyo1LdvvPni0VFuXztry2ckVIOe2cjA2PxU3KRe6n7GQjg+0+CJJxba8o/G5ewSaa2GuLKUpBvV8nZrej3UfmddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ED7htlSd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57723AuG010872
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 05:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UxZeQQVAmBavdpLJSCBxurMh
	Vns7iRlr3w0iJRJhDDw=; b=ED7htlSddzgYdLewfK9+dghQeRB9D2fcgN5QpsGR
	7itCFpfsule34dfad4JJ4K6XQOHfQkq2xltTUXrvZPnwFbSF4DF0drY4xKt1UoK2
	H/dkcBBV0uBQqOn2hxkHb8cloOFvHIVZXODYG5BnlK2lwfawPpAk65IZ8+gW4HBx
	IV1wenqR57x1BMujGnfZATPk+SLkF0T2+7CGEUM9Y4MH4l3osJ23YZBd4Eihmmjc
	fPo4AW+xNOW2JwplaUPzHgRvAVwPRbxMxe8n42baslouNkaD0ODlbfwlTSCW9r4B
	6WwVnVqM5NHa7fFKiVeQq2eHqeQk1S/Y4Oj33Y+1byatSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7w5hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:36:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24249098fd0so8112115ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 22:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754544979; x=1755149779;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxZeQQVAmBavdpLJSCBxurMhVns7iRlr3w0iJRJhDDw=;
        b=bz2cvhHxlEs8uYlMLqX2rLI5m41dmngFLqDj3S1hMPXBLPAkv4HT3pGx8004ZvNOza
         DzzRBrT8rIBQPMEe71pYUrzRUdB2W4h1SG92k0pVYZdvMa1ZejIkx5bgRkAJt7SX6z79
         Pj5gI+UMeIyieco+9ikDJXZzdHotYIwAYclLYNMJ7VufjOyScYWVpsRzgiDPa0iS2YlB
         uPuVpAZztqE8PIjN5ZD2rwWeb6MYvgU+VtWqIbsSu04XLEoKzjRIRhD12Z5vnNCmbPht
         xas3Sulzlhxhqe9VGTP9pQwvLKUZOIVbDAibiZMP8Lzuq4NIgNHTAgcgY3Qim5+R1vPP
         Hiyw==
X-Forwarded-Encrypted: i=1; AJvYcCWcM6FO158/4ko4wijlPjOX3syv2ztzSl6bfo4dVaG+sYNvpuo9XOd/P483zVgfqVQRHZWGLtfaknFilJgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0Fr2ZzWVcF7sfV/PRjbVVlzhLjzwobIEViZb63tYPtwribNS
	6Orf5v7U+dR9H3yV6KYt07D6RRXd91nakQc1NNgNuVfKskio8JAanEoZH5sm3ZqsRUepZRC3X/G
	+qdRwCRS21lTcsQFvD/0ftSBMMZCKKvvQCvgmtyxoHy4IgHAJGIvpdWC4N6zqWk0p8jLw
X-Gm-Gg: ASbGncsh3kIsPwQc3suxQEdfQWJrgAKWxTsgYWUKyqh1dJM6kvDnR2NAimQOXswlnhE
	wVHTUhnhSJMlHg5rvEOSJYwaw8aMr5THrEfDEgkRu1DfLob0yXiFrBN2YJnatH/qnfAEh7jRvtk
	gXL880kkITGXvzKBr736dAlPOWzOdmOOBKgAr+Q02Q13QWDdvDIxziIHFk/oRe95aK01oMHsZyF
	gR0A5b8+MrOkX8uaPF4bt802bJcUnBDxrS38zbWO+2jcpXSowhjsQ/jlOUP/ZpqMac3FBCrKcmV
	fFIpfNpsx5t+DHjzOyvKnJKQffgh3BbYlZzpLujSEhwU9ybO2TnFO0QpYE9l4FXYCX4=
X-Received: by 2002:a17:902:cecf:b0:240:3dbb:761c with SMTP id d9443c01a7336-2429f6256acmr95522395ad.32.1754544978895;
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNnNfGxhuNTArtU5/L07BRaCZPrejbjIclynuCefSVipf8dv9sFPtvjvfNzygxX8GedWQ6Nw==
X-Received: by 2002:a17:902:cecf:b0:240:3dbb:761c with SMTP id d9443c01a7336-2429f6256acmr95521815ad.32.1754544978443;
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89768fcsm175372765ad.82.2025.08.06.22.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:06:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250807053610.siel2gsvl2igc3ga@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
 <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=68943b53 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=6krb5mtG3PrLwc7-ycAA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: O9-d8v9K6hFOHZ-u-9Y-ZrtRQZUDNdoD
X-Proofpoint-GUID: O9-d8v9K6hFOHZ-u-9Y-ZrtRQZUDNdoD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX2x15OWDFPijB
 zfFZuv9FGR18XEm30AKQ8eOs2xjqY0H5P1EAQc87+7abA2xID399CvifKpSXSiNbbbk/KtNwcl8
 A0dXPsfx8vEcN907GwnYoktoEN1Pqa8mo+tVUEMKr4JOcG+ZVKovOAxKQf20uVn2Vd6JCWRCTpH
 nrTUcuAOHrxIzP3Z5mlJt4bPXkgqoYSm+aSQXqBngcBDLlZJoOHx0+snqGYHTDCZYVZNaefAUDD
 lmo1meaqRKkjsDuGlHfGtS4P3BEdth3kp5/np3wsvJWBI7F4auiQf+l08o3V8bBkwbrUlzpjWyp
 fIUFRzoaHVwlv/DeYHFoCTCrngzpX5XxpClOyaLL/JE2P+VGoxirhJKheIjpYnapvItwQ1B6FYy
 y1Hb6NLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 06, 2025 at 12:07:05PM -0700, Jeff Johnson wrote:
> On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> ...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
> struct firmware *fw,
> >  	if (!mdt_header_valid(fw))
> >  		return -EINVAL;
> >  
> > -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> > +	is_split = qcom_mdt_bins_are_split(fw);
> 
> this should be in the 4/4 patch
> 

Rush to send patches!!

-- 
-Mukesh

