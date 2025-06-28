Return-Path: <linux-arm-msm+bounces-62915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90443AEC861
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 17:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5CCD1885769
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 15:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE56218851;
	Sat, 28 Jun 2025 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPdaOyUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE466207A0B
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751125774; cv=none; b=QIVYB6oEPg74MkSxFlM4gL7YgCBEJJ5eytSx/d3spIOO8owquZnZMW/a6hMMvunqT3gk97D1OzC1K/p7Dnyr9zM05gq9yMhTc5Em9+E3733+RTFp6YcTYqvNo3zEmaIqJMP4Apf9QVAwCiXdoeqY6JGL8kbQatSRze2M2i3Le/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751125774; c=relaxed/simple;
	bh=WL6yGFxdYVn/A2aBxBxpKdgI+CtpIum5MIW6TKC+oDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bzmtc8dt/kwaeELjraDlqfGbe/8XUx+ine0Xkplz1KfzsGkrWxdxJ/7Y7pOS154l4g7MeQITMhhKMwE4yQ8B74n5lu68dLeOyhDkyjCo8IOWlDaZG0U4X0LSeWriwfyheRP2yML1U4bxS5FZJH+pguKj3uuQtYxBWpwF0JcyVLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPdaOyUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S2K1tB030260
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFYlRX1M4QgR0o+DfBbhVTZP
	AQPHZI02U/IaC0TWvGY=; b=ZPdaOyUd2qIF8lQKby/XWSDokyByHPqdM0n0twUH
	XlhP4QTe2E4bT5GjNFLGrTTBBY7VB6OxnYiYlmdzsIifZFFRYNf+DwX29A2nMxcV
	Ema+j6ppDZmXOoOZX5GLUoDIHcJmwx5S7ccvraD2X+0dCc1J8m+VQCD4O8KyGN8w
	uYWB87tbdOnrcs9nr1X74HrIhAuFzMnsIpFgGC1kYkhHJVcjHFOhUAxBF6CCOEI/
	BfkvG2P7dgrXMKVIjkEvItiFBAeYy6mcl13kp2ret9L8EKvZgJ2Fk4N10Y7yJ72X
	/ZFiePikev+RfwL+5INtyRSCkc1IEbX8/Y3smBIuciVEpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq11xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 15:49:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so67709385a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751125771; x=1751730571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFYlRX1M4QgR0o+DfBbhVTZPAQPHZI02U/IaC0TWvGY=;
        b=b7kWs99xKwhGYJvgwDW1p41jyFr7Z96ihVPN30b8nv22lCE83mq0tPhyNlGHSgfzxL
         NhlcXb+cJntcQ+84TyCUTw9974+IAdR/+0qh6FYOAaz9aoNTIK4WYj/K3XCSk1P3uiD/
         o5ILOFq8BHsY6++z2Wh0/C7YEH8YV98FoHn2ltvpJLgWwAksul4GYcI66bkyzUdmcvT4
         wspUQFHzW8sQioDOl6ev+o7kAgggKReNJt3nD99pv/+y7T4FJbcCRL+k7Q5KUQVNnPg6
         wGSXxojUZNnzZIYV94RYKWMiCh9uFok1t9olyBelFIdWs+Odt8lfcDzriMUO3y7dZ4oQ
         pTUw==
X-Forwarded-Encrypted: i=1; AJvYcCVgwtB4HSX2ROn5+Vq5jhnpR9RnpJ5teaX5cgiA4+jTVpovsqmK7H6rbivPQTozVRuj15ziqgbWHwHlEKXs@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrijueVxg3gS92+26nybhptQpcXoUMn/XtQs6gCthl6h9mVCT
	E+nsvgD3sbkncreeFK0XKKV5eB3F/eFwB4uiJkSmZMRXIqZsUk8rk+E34v2AXCSBrOeJYyCGlqw
	hf4pKe5dGVoWHqt9MmHDsqN4NcUhaF6LnDV8lxHX8xDODDzitEt+N0YuhIim18+1FGH+r
X-Gm-Gg: ASbGncsvUEj8ZqRt3u2M3lxVl+lUSuZaA0VJBzd7qhrCEhg3m1JEWjZw2WOn7Vlg+E2
	xYj5szn7wfMhOhpy14sQCEDzASNqcvd33pZtVK3gQsArHCs8h2Eooy8G+feQ2VflFYjs7ZNoXLL
	P6POSzmH2NyezPkXRNXO6Oyp3uc0Imm6C1NXiDG5ClOYncGTsUG0BlfAND8hR4qb9+dam31mN47
	XlUoUh/BO+es+eqNRR/ojSIo8f+Y3g5Hxbf3PpFAHHiH/ilq7SJnVClev1FhiGQHsCxDdCQ03CW
	DUKOSIWV7rF+EljgHoA8XWPW900XkcZAV5FLrqePNzQpUK1YmrT9NuFPX6rDIAXDrEsgFZf9hnR
	9Dr8BfOZqkS9vNwP81R3tsKxhDW30Rp2Vk0w=
X-Received: by 2002:a05:620a:4403:b0:7d0:9ed4:d269 with SMTP id af79cd13be357-7d44397de4emr1022353885a.2.1751125770919;
        Sat, 28 Jun 2025 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTc1GHFIXHHTe6OywkmfcHC6MJabIV0A+xXqmDPIh6fhNsR5dR6VvXgAtiOkV5DRj7Dqn9VA==
X-Received: by 2002:a05:620a:4403:b0:7d0:9ed4:d269 with SMTP id af79cd13be357-7d44397de4emr1022351085a.2.1751125770470;
        Sat, 28 Jun 2025 08:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2dcbaasm838063e87.224.2025.06.28.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:49:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:49:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: socinfo: Add SoC IDs for SM7635 family
Message-ID: <woo5nauppiy2i4xe4ewbsapuk6ixdn2davyrlmugwcqagjgdke@akj2ehtetlmh>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
X-Proofpoint-ORIG-GUID: v5wiBYUwApOmw-rwyQTuus7w8eYg6uu3
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68600f0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CBhOcW6rsiGSrLAFeggA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: v5wiBYUwApOmw-rwyQTuus7w8eYg6uu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMiBTYWx0ZWRfX1lmNj34ieyrv
 SFfIAoopONOXD/Ku8kQhteqKBNwzYXA3yJ9gTOHePrihCGAr2cfAB693Z0GoJqhk10fX4M0YHgU
 KeFpzf7hlWSdU07MqJGr971ja1D0/t/QHw7DLjsrVzVEIEmN0SZsj0ZmO1xuw1ehoAjTyq0tsPl
 huqP95zy9FID4NGDu4RdQg7wVj2LTemC9eFnFXZsqPgZZ8RjGxx87Ns+MZNT5OXHIuwUCVyjtDU
 L6UNipRqPP1wKVUt6Fvu0LlKq93Q7aUO8yTRsvIMKJqucw5v0dhKBIuozhr590FzfK8dWVHptPL
 H1yWcG4AVZT+GAowaENE4Xma08FGCobAPizlFmZSn9NCwIPnJX0kZaolVBs0ZD/2pcddJUi0zC6
 200zJQYDk3BHXo27T1bAXODXNWFPR0Hx1OkFOCW2HBiyG2DWheBOrZ8VKIIcvCQKMU3xrjU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=918 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280132

On Wed, Jun 25, 2025 at 11:11:45AM +0200, Luca Weiss wrote:
> Add the entries for the 'volcano' family, namely SM7635, SM6650,
> SM6650P, QCM6690 and QCS6690.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

