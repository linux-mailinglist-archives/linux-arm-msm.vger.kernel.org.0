Return-Path: <linux-arm-msm+bounces-66790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A4B1304A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB61176240
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9783921B9CF;
	Sun, 27 Jul 2025 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldZrEYD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1401D21507F
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753632738; cv=none; b=App158MGL3qSOG5rPWgkm5bp8GbkuPzQ5qxpD8CGduz2lxVQwJIQCZrFojD2/W3XaeK5CfzO4LOU4FCWgEnqRJ6Gl7yipawbfpW5M7IYP5cNkjOZ/2gedZC2dXHalMQVeNkC6nR0Q0tdpR5bOqZCfcCbR3NzufCFpM4UxJ4NVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753632738; c=relaxed/simple;
	bh=RjNfiA81APDV4IT96AI7K1pjVGVOyfYFfry+faPEv90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmXjOk93Ys+/ESFAq1etyCxxbou3kbsMjW8DOVINPbDtOAGRPNf/+EONF0zcvtaiLo0o7jHSZOmYNJMlPRnlQeu8rMC8ZA94UjGxGS7W6MC7AG2kJLg0hBjRKVEbsTjpY8n6B8jytZSNQAylaNeOP+Pzk1WhFmvODo/7vTW7iok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldZrEYD8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R8qoAu004385
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=685vHDCtSGola1yY0CRVxCW3
	5uOqefWBiVFuzxBF1M8=; b=ldZrEYD8G3pn1c56jmZ2X5Fs48V+E/a7JXZSmxWN
	RutyLLaPFcJqhoe1a+DhgFqSAVQ3J8fZ3qY+5p9sFueyqPldAXTZiu9CPZ3GRN1V
	64c75QfcLE4nV2oRXbAn/3ZAGm1Qdra9cAXGHIUJ5sSxvcrySi/U9U54EvODa5nd
	z33uNCDZUDlgDeQizrcWfrJ8bGXTo/13c1UgjWx/OF/cORy1OT79TAw6R/fms43t
	yZiJLZEWdqOKN/p272DUhpdd+eNLl0GIugArMQGVFz+v5mIcUfH+yJkHsTjiYdID
	dpyZRUDb691/hXCwjbjSxLFavNRMo2MOITsZ3vd9kAo3hQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qj7yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:12:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-706f8cac6edso60965336d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753632729; x=1754237529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=685vHDCtSGola1yY0CRVxCW35uOqefWBiVFuzxBF1M8=;
        b=rR6OM6HcN7X64aEYmUJAoxCMzZqLMqceZYossq32xZfhmwP4/1pASWsF7O+qdvKP6Q
         COoUlai/+leu88sNaX7UXWnXCq+EBH2FwiylcaVipQep6j35dNpAAcjU2dPo3tRSt/Bm
         6qRGrNodNDs2NR3G1+/A9z4q66EkS4u0yvcC6G9xvI8SrDgISnoPe4/ZjcOM/96b5xvl
         9Kr0WnuETGJgU+jFUswK6/8mLoeuqhGn/w6B7yhaOGhK+GvLaXjLHd18xHTQHjWv8VN9
         pezx4D8JmiDr9ApqrnTgHYu5ICHaFL+s5lKaHJahdVR/lNPjNsfxtay2YIoFoKiYvhsY
         sLag==
X-Forwarded-Encrypted: i=1; AJvYcCVuD4OQ4WmBFcZ6dW55G+p2LPKa7hwb1fURcEFM2LcV2SFoB6roiDyN6GU7B/o1ZbInkON7g9pgMwGcYSuU@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgIHBRHiuNwhXFrf5ASyRS2Dg3rQAy9wkCtUyS50Ud5dwxxqV
	nH3ItNDawtJGZoOoXqjvSWddsFoWzsr7YE5d4kicEndwEgEh3jLgZSRXKwd5CeJVF4qAaZNcdyQ
	/yZbDsn55Bng50u+4RF5rGPJw8fl6QKzpM73n/kIBfX3aVQbmiOAk7QtiVchW7FhTqxCS
X-Gm-Gg: ASbGncsCH0olcxX2fpp2dnioYGiCdaE1/3zuw07vKlv0/5AaBQAX+rQwpc+YotghbT1
	9h4rDeebW9UXIYhpNE1lFIQooNU2aygSW0/67NR0W4rZ+2yNuk3+OUb2/HMEBUkLmjoQdx8H37k
	rJM1X2trm0oxKbcL3ncSxEmfskMCIelEqjWuZVadP4RjwlPxYeiWJn7UpPZvnmxBlpl+poBecxZ
	xvbsug1RRfIFptoqhtTb9SZkCELkpWobORUNVaslGLtYubHWiq1QJYYzep6Q9XMIoLMAHzXKkqy
	L3gzxv1Yz/lGRxAoW0CcBWwJP9g4aq6okJuuVLp2ktjW3FnE3ZmMvL4gmiCJ9e96L5lNkKINsLf
	3sXfWexX2LONSjGMoWNkr7RAi8AAjZJOC0dLfd1FDT7UAsvyNApKV
X-Received: by 2002:ad4:596f:0:b0:706:f190:f2ec with SMTP id 6a1803df08f44-70713d9c3b0mr193045826d6.19.1753632728964;
        Sun, 27 Jul 2025 09:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrgOtZO/BrhsYDwqI7MpuwYvF38Y6kA2ThfIBA0C1aFDjGfvO0v6UznSa+ysUHy7ifVbV1JQ==
X-Received: by 2002:ad4:596f:0:b0:706:f190:f2ec with SMTP id 6a1803df08f44-70713d9c3b0mr193045336d6.19.1753632728412;
        Sun, 27 Jul 2025 09:12:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f407b4b3sm8601681fa.13.2025.07.27.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:12:05 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
Message-ID: <6f43g2ywh26olthehlxmstnzfb3rrd3gavyzvmuad44w6bzvhk@vuphps5i577a>
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
 <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
 <8b3abd1a-4246-485c-9f2b-63ee37ef808c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b3abd1a-4246-485c-9f2b-63ee37ef808c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfXybtP+2Nd/JEA
 VT2L5suU7Lwjw9AZVxIC6h8tFSUu7VK1xgHeRbghAL91b99JaSINx8BIojUnuWdIUlMNtfFnnDU
 32Hm+UzSbc/pFCcfeBlnk0bVFty9AZfbIqzkS3sqJAjXJ7tNOi6svrhoQ3r5qYGEuUKsepUMM/c
 W3nvTCHANvhfJe5jmxkkeeMf8PeXoOtX4PhRM7b34TwCXeOacwv/QrlQ6H8ALY8z1bXee0UJxk9
 azCFex3fNoRPSWz+MZLXeFIm2NKD+YuRxEUqWCekqejeI+JZw2TymUU6M8xtI96155W7lGwK5qa
 3rnpr6U2p1/H7ZTpJaYCblBw32ViiuBxmqSYOahpDkQRKM+hS9yGxqasYU/llJr/Fs/wgSQCWb9
 kMPVxNqRbkKW7woxKdQdjaw4y5hT1/r49oWNfakZOjVCil6oWkzrrmY67LjpwpuiIHkE+Y9S
X-Proofpoint-ORIG-GUID: o00hGsWtj5GRDlFmHM7oFplfM5mKUokK
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68864fda cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=hECnEToTbSFRC2ly_LMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: o00hGsWtj5GRDlFmHM7oFplfM5mKUokK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=822 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270144

On Sun, Jul 27, 2025 at 12:25:12PM +0100, Srinivas Kandagatla wrote:
> On 7/24/25 3:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
> >> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> >>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>>
> >>> Qcom Slimbus controller driver is totally unused and dead code, there is
> >>> no point in keeping this driver in the kernel without users.
> >>>
> >>> This patch removes the driver along with device tree bindings.
> >>>
> >>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>> ---
> >>
> >> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
> >>
> >> +Dmitry, does you computer history museum require this driver?
> > 
> > I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
> > the driver would be actually useable there, I'd prefer to keep it.
> TBH, I have never verified this in full audio use case in any of the
> qcom platforms. This driver has been unused since it was originally
> added in 2017. AFAIU, no one is using this lets remove this now, Am
> happy to take it back if someone has managed to test this.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

