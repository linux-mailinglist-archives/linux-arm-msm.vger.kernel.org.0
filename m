Return-Path: <linux-arm-msm+bounces-63761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B487AF9923
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CD23A5F39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0716F1E8326;
	Fri,  4 Jul 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhOaiFYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406F2E370C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647533; cv=none; b=QNopF97RWaeEMr0GeZjCmJva3UwyPH6qNCjTXwJZJX4IbBJvGt5uOlkFb1LT+3+xTumwzLTbfrpyVYlZIn9PywmRmv8FIO+BWLmHK5QoSaKZnAMBi5xbHr06bCMmb58+pveHLIoTzi9gKvVOlArfIJxECgtNz/2NMWk9gJz02Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647533; c=relaxed/simple;
	bh=efxW95d1hJnhDlayhSJSGsI5g4f4Kegd9gwqv/org9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPYwAf1ZAbOr67QZnmeMxHd3qU/tX5RMLWVNZDOupjyym/6X3eqIY0FJ88gfBGCXuWD46bbwejFENSPlTmyJBNwARUbMzRygoVPzvmtwsOTtqAe+uRmJbasQKmnmT41Wv7gUW9VsBcJEsk/F506B0qSiClFkQSDzJ5aEElTgqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhOaiFYx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564E4Hvq016379
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VAC/S+4VdSYdhbOHm7xI7QR
	qaC0xVlAooyQOl6+PVQ=; b=JhOaiFYxFeZjMHIWhsrc3wziPDCTVFJr9fYZOMt2
	zjYZIvjgxosSwVIMc/81m9F7yiNyI0L14BUi32MtOfLQfJtXBl2HFrj3XT1Iqj1L
	QlSX89LBfKT2OqGt6NE3BsY+IEQVql8lKJIFhcRCIKfagggCcwulIdifrClybNIC
	+OQ6F+BoiTFa4Q6Ay67m7TGaP3GbRO+4uS+J9WIKWmKEDMFvoQYnsEEQ0yk+4Vxo
	7zbWJXXmjeYCn37oHrqqOxVZPMKgxZsbnsr5V9xj7luDpuHSGY6cRpzAF3qxLLwB
	2TMWmghuAG2wDhpXRMiXf0w/mZq0z2X++MwdelnP6QLzgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802c8dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:45:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so194770285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647530; x=1752252330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VAC/S+4VdSYdhbOHm7xI7QRqaC0xVlAooyQOl6+PVQ=;
        b=OSNSDXoGldwdQ+akqAAQljwsynVB5mNJ3L+Id9qG+hww6i9phmSdSu11R7lbz80m5t
         y1fBJH9QQhNRDdapUn5FH6nJ0Q9KE4I7DDk/LU9FR4cX/nfuko8OH73pWoCg+sX8Bg2e
         rgoFkimtfhAcdFCYw/j0bMgdZMaDd5NE5IXqzOc8tDDkjV6lpN7NDizJNTqCWPtB/25U
         PCOnuCRsOZcmGF49u1ukLGLQ/D0exdhZMw8pNVyTMdGuFBacq3HnjxXJoIqE0+FCt4wG
         KSIdNMfkK9JbhNTIB8ush8kszmDQAk6XHXPndYw6oprauOUIoFhpkU9xTZ5adXwowh3Q
         hnlw==
X-Forwarded-Encrypted: i=1; AJvYcCU7lulLk/8zqFx5lersLHtVXsbl/57Q2NJRElnt4eA649WCi0bHMJOxTuI3/yOremNV3gEnz78dDG/buHYY@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQHj3QNt1vr1rfneixAczq8d6St+m5HD66GAdkXdubjtsWwRT
	saD2yjbVl39MN8qfyx3nKERWQC5HbrCDFNzRYQwEV6uvlqR47ZADOhOTqhikz8mN+JcuWytF5ZB
	HmR8NygkgughPoACPbtLzPuJEGMzfCQnxIfSObr4f3ic4lptQufUIdlYa734CgmZFYVJ1
X-Gm-Gg: ASbGncvnc6XCtiSphzViV62+ZSs34foWM5gTgLodpcYRBDt0nDImHmNd7oR+ytOMqMR
	oXvMsIgaqzydewz3fkgfADHuu6wm1C+JFd3MZgA/40svWwY8Frj/JRphrM4XyTGCmGGU/XBrD9t
	zdLG2fT+PBeFKxnsl5kW9iT6l20pFvXT/6w+Ro7jyYxww82cX07yygXnab1Koho0xc6SZOPhW5t
	lEjP2d95WdLfuV6G7r57dtZbvgypOX9ezUWBOxqbEp+3TEHi0ZlWsimGsFO1NXhzUqrEOFQFSYD
	AiFr5e2uVbX3x1TKiWNbcyGPpp4dlVE+ZYgAzt5RJABPYpyQ2kkTcq6OgSlNIU5F8sAFs4pOKXD
	jhqM0ah+qNgGz+ISClMv5s2qiS4hSnJB6Sbk=
X-Received: by 2002:a05:620a:199d:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d5df15c997mr351631385a.56.1751647530263;
        Fri, 04 Jul 2025 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXVTxyDQ7jF4VUHv80E+WzOGv+qgK+FdBwwPCg/ckJv+F86O0+XNC9EdNDKn9IWqLbhOUFJQ==
X-Received: by 2002:a05:620a:199d:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d5df15c997mr351626985a.56.1751647529802;
        Fri, 04 Jul 2025 09:45:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2843901fa.6.2025.07.04.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:45:28 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
X-Proofpoint-GUID: nTt4VlZxiFEBldmiMBkZ2jMUtdzqiGHk
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6868052b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=DVKtXGnjxsSMy4abO9MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nTt4VlZxiFEBldmiMBkZ2jMUtdzqiGHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfX+lAcgOnZR5Cq
 ycowJ00GQt5hJBzhaxBT8EJaaYRmDpN8vv5lqWONKT4KO/IMKpDeEZGrZ/bc1Co8hE/249SbUK8
 6u3tjdcQViV7nwSr1Am74fTFliXCfyU+n2g74ZWto0vLivuL/cuSgeqLjJVzu7SxKAuD5nl7qkF
 nGrIMNK3KwSX3os52KJAs5Ohf8i8n6Hd/BAIMC60OA0QZ/jDVgAaU7X6xxHBpBYwlcieKL9jKg9
 3HwQFqRvLzTh/PX3LR+EURKM76pTIOm0dcD+8RhiBV+goOcitSXdyYBKCRvOYGj5lJJdCwafdkp
 sZARkTpalgR6VFUlQZl5ccaEGyr7OI5YBRLjJoo8A+4P9UN6vJ5BZVDo5lg8PHDjnpO5VX/b/M6
 plXvi6Nl2G1MHeTHDojx/6yi7aE23bSE1vST+Fz84/k413WHKtmprMbUqMDMwofEiHuzM8T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040127

On Fri, Jul 04, 2025 at 09:23:06AM +0100, Bryan O'Donoghue wrote:
> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
> > > I still give my RB for the series.
> > > 
> > > To me the only question is should it be applied to sm8550 or to new SoCs
> > > from now on, sa8775p, x1e and derivatives.
> > I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
> > and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
> > once we do that, we will realize that it also changes the ABI for all
> > SoCs that support either Venus or Iris.
> 
> I think a dts change is a non-starter as its an ABI break.
> 
> So if ABI break is out and reworking future dts to allow for a new device is
> out, then some API change is needed to allow the driver to stop the kernel
> automatically setting up the IOMMUs, create the new device as a platform
> device not dependent on DT change and have the probe() of the relevant
> drivers setup their own IOMMU extents based on - probably indexes we have in
> the driver configuration parameters.


What about instead:

- keep IOMMU entries as is
- Add iommu-maps, mapping the non-pixel SID
- In future expand iommu-maps, describing the secure contexts?

> 
> ---
> bod

-- 
With best wishes
Dmitry

