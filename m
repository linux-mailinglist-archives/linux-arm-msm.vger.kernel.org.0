Return-Path: <linux-arm-msm+bounces-58941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B1ABF9EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2EC43BB4F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6D20E33D;
	Wed, 21 May 2025 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7G9z/bS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB45920C038
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841751; cv=none; b=a07+Cq6VzxuuZ43ly7aFGBykUnvgcPfJnreackNgGzbDXqCbzLApb4dg5z3pREAUE7CjNuLKdlR408+L4IBWmGqc+oXVUE8xISBEcc/h/xRXszfByvGcFS3eqAHZ/u9kbqdcmYybxLc6//ORk5u6891oNMlDfTuIrFjjyseKwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841751; c=relaxed/simple;
	bh=Ji/NJC0jS20Z218vWjgerhtA9zNemwT1VchT19GibRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL8NFMFrWV/8zjC1Efc6mvI+kC99Ikdzvzj6koaDnmbf/YcSWfkpj3vHJBU0hIAKPOjg78WiL27cWODEwfj4AZiju2dIRhMgTvtOA2p4BElgd1fw6PvcaL94h1iTQar7/O+/lZYwwqo6zbCo10YvkGAnZb+wP9QDj2WntUpfZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7G9z/bS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XnOm016898
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 15:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZqbR0fKZ+8evj8gXjmb3Yq6g
	rxO0kRUezTH9ydk9GVU=; b=d7G9z/bS43rrmEoAfUML4SvB1LjWtrdwXZ1o/Sho
	QQIwI8J7T8TUppmC0ukO4nnMJ3rC9+HLEMts4oONoxr5Z3RcHpLVI+zw9DaNURHl
	C84FUou8xhctHDKCF9WMwTAdCbFE0NXpIZbNRgSRjwMlWroTYtAQWYTiDqEr57Hp
	q3iEvJDtxd30jF7+3C3StUN47b3Pe84qLGzFXRSgvH5gA+CaR8seKEAfhVfCfrSB
	K/I6D+OebToFtS6EnkPtlJ/x/jWPVwbqnziHWBXcO+0J5eNCMB5JTA086Bpj4ZTX
	tahmepDCBoNqI+EQlOMjafQlD7IyDA635ZCzGaRsRcAbuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9uest-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 15:35:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990715so1894484285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841747; x=1748446547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqbR0fKZ+8evj8gXjmb3Yq6grxO0kRUezTH9ydk9GVU=;
        b=OIv26rucI/oLUu0jTmQ5lvapsZK53lbWQfOwDeq6ZVoUv9wImoyvz3Jz/28HbkOlJP
         XZbq9CfdxnmeqrB3Z3YL7MmEWi+yrdh+5RJBf/fb37513yUW9IDZiBC/u+M/BBotmDbT
         IWzT5yis5pDrX3V0mHNTyFQ9rLjtf00f6qdKpXCvs0RaY5zU+O/3h+cDsAqyqYlpQfGv
         ejsDLbQGLaVaWbqb1LpC9ZhW07mJGh+SZe0is3k/mp7lgbaEfhY1u9bjIJZE+0RA0SzE
         9PihLpmcSD/qzv1xNe00vnmIdfWvLS4UzCCLSo0qWwur0dA0gQrRZ4LxCtW0DTRc1CI0
         kSdA==
X-Forwarded-Encrypted: i=1; AJvYcCU6MUwt3Jeq6j9MvvkkvCMoc9l8LV5V9hyxA1qQ9bk97U6CytWJQVw6Pvxonjnp+b6fRNpaywTGc81ci0Yz@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5U/vJlZzPZlivvYs0BXl616aoJ/mQmYDeQwtGVtUY3UT+s4i
	aTDfIeK4EOCmvnOg/DhdsLTDaF6u5ixT3c/KV7SZ5nPeD8l+xpiHgfxpSZ/Pgi6RezKILx6PPZY
	sVaw9fvK/7d/Ya8mBIJdIE+X5ey3INyns0TgyNzZN5CV0JmVysKtNvftaeosVdYwv8WQ7RxAMVF
	0+
X-Gm-Gg: ASbGnct6rxYayHi77h/12SYiefIPQYc06Ieyl7vb6J6bAGMGPZ4/h3YUOgg+waFRDSh
	0MfUA6XXw/7+ziIQ3EBYlgZ6gWggvicvU+EtUFUvZn/Ltv35Kbdu/YF28z0kVaNq80UXj6wGIqz
	SBCYm7bBjJZtQsKIILiGbuc6IlhE0NzUMV51f1Bc0J88uqdaBUrJAFFXJUkqXgCYiZfBdnz8L8j
	U3EuR9+C4hikdsyLDXWfdrXfqqzLddHj+z6js3OETx3f9Bbl42hZdzK/SOdVbnK+QdGN6tw9/YC
	SvTEkxULqbwx/1EZ4O4Cqb8m2vA5DcLSCjnTR01IOPicxTy0QCWX00piJCBiwlVVuBhrJmsh0gk
	=
X-Received: by 2002:a05:620a:f13:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7cd46718919mr2924691985a.3.1747841747261;
        Wed, 21 May 2025 08:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEif88mxj+wAdT9xL/pZzi6HaDSZ1ONvlON73ZZu7ioxiYyL60zLC0ZSOy7v6VGihut3FvXnw==
X-Received: by 2002:a05:620a:f13:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7cd46718919mr2924687485a.3.1747841746729;
        Wed, 21 May 2025 08:35:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd099sm28483211fa.57.2025.05.21.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:35:45 -0700 (PDT)
Date: Wed, 21 May 2025 18:35:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <u77g7yhjr3ruwkmz4qnmyssuypk46lvvn7oiqdgf5lnofpczj6@y7qa2nx6ss2x>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
 <3fbffse4iqkegqjheeptnmsofz7fasqgnpbhhbzlzibv5qjxx6@dft4vafwlkfr>
 <3b498b4e-7159-4cb4-bc71-78f32feaf402@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b498b4e-7159-4cb4-bc71-78f32feaf402@quicinc.com>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682df2d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=46_AkE07xEbgfvBdi1cA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: B4mAWx1ZAZhTKoA88egDXJMV5SRrl-t8
X-Proofpoint-GUID: B4mAWx1ZAZhTKoA88egDXJMV5SRrl-t8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1MiBTYWx0ZWRfX43T29r6a6McL
 Dhfalcr55pGjZI95BNkYyVU3mfAGg92/r79XQf8Y+qGQLXJU1e+qpW5/kgiaqHZxOGODhUmZOLe
 nUFrZRo75wtBeqfK8hZo1l/GmLJ1HXtDnsqBcluxQVp2xWAdDXW8EHhkV8949QJx5QM4r2PSmEM
 ipNiK0pBCvTMHj1Kv8uKkb+1j1XiltQ+4GhAkMS2gWp0mx9XbDIAb0A1IAY5eVzP21is0D0/4iP
 RcGKrk6Ugxt+yUf2C1sE+slFE/qZD3Vv4UgYyCFQ+0a1L45j0dVR+aqY0gwnflEg2MISzSYCl2I
 e0wQLGTCoYJ4+vlMTNogX1hyBGo69F0b7AzYGUG3XnTAHmAyFj/IdauSAehIKo/71FHQy3SqrwQ
 NvAEYKkliI7MQlFJ4JbC3QI0h/TbhMstHZfaGRLlxhev0R+HEunrjTgx0vWCku+F+7MybJ8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=654 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210152

On Wed, May 21, 2025 at 07:36:31PM +0530, Prasad Kumpatla wrote:
> 
> 
> On 5/21/2025 1:33 AM, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 11:56:16AM +0530, Prasad Kumpatla wrote:
> > > From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > > 
> > > Add the sound card node with tested playback over WSA8835 speakers
> > > and digital on-board mics.
> > 
> > No WCD codec?
> 
> Yes, No WCD on qcs6490-rb3gen2.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

