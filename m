Return-Path: <linux-arm-msm+bounces-103614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AByVF6kc5Gn2RAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:07:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A44422A7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FA8430269E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 00:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9291EA59;
	Sun, 19 Apr 2026 00:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtHj0f9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCFzxFGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C248F9D9
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557222; cv=none; b=WCKp8sHCv3l2sU2zTZtlhYRvnc1gWFmdj4fY4C2IvnUXxXJ3ofxrNVAc9BPHl2E2arBJX8Jd2y0K9dvw6M/T9R5ioaJiAwXAuUWsA1GMmyF448qUoPm0m+JuB8Y3fx5DVVMVmfzQ/u4vOvBCg/ekcNXporpybvG3W0AA3bimGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557222; c=relaxed/simple;
	bh=V4QUMsG/PTAxz2Sl6KkrrP3lnJnNvR0z+lYEcRPv/Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgDU+mY6b/httfrSIJUl2l23ABBMb9Nkb+rNzk6BImFBNFZhYqakXgauMs0TJynr96O2S1A/zOUNKmrPK/UzOrFF7S2PvkutOmMjEeJI9tanZlu9m2VKfTSMBIbq+n2OMNKVOSapOXC7htUDPjlQ2tz/ropgn4XkJ3D11W/LDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtHj0f9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCFzxFGW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63INOaiv3556953
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MkAC+H0Z+C3dkQ5Mg5CcrE7x
	cC7Fu7ljERZ1bBizm2w=; b=OtHj0f9v2PaK4AXIFrjcLxIQJOjENW1bJhlXahfN
	/KEKvMqd3sWrsZ8zLWfA+CdMHq1bMRfuLxle44svL0W0yIPk/Q9HGOjP/FQ4D7OL
	e+FQnGRz3vWP3mWac16VJtXcOcGLdSb8viICUyvwN1Tj4B3TF99saop1ZocW/OUe
	8d9twJ/bX8mfZM6BgJLnGKtSGXY1pXCMyjL4BZMKUqjV/5NzS5LBE2No0Ak+BZn0
	B42rkl3gehs3KdIJG4tmSoKgq3tSavox4+iFxkGh0zwdVUrxcBh70hi0RDz9zB3C
	tunzw45O8rfce/YFxQ7yJZ0ZXDe8/WAcAg2pos4Key4Lwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fsqqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:07:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acad256115so44825286d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776557219; x=1777162019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkAC+H0Z+C3dkQ5Mg5CcrE7xcC7Fu7ljERZ1bBizm2w=;
        b=ZCFzxFGWFQKLyUVO/CS2eJMn92DONUejsU2yxuafZDAm9THuDCG9CvyjODdcpzjf9H
         scZ+sPeQCCNPBj9D6Dh66BJONTNfMrkMJaYYqNrfKneuGY7TvwJibIczua/MZs1qG+gI
         jYbRV9wVr9QChYr+LhutdpRq+0ukBPuo7ofvKj7bLZ4S4SVGLrEnVLneKhPLb45wj9HV
         FQHbGWIn5hXkboMbW7pq14xS0pBjBduppexmRL5Db/39K7GUdVRIKggx6JSy1V//0dYV
         J/iXlUMxoSk/v0Y5L8+uBVgKRm8b0lbhCDFjuGnXzjjzuVKcrjfzPeWJA3WdK0NCOFAm
         sTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557219; x=1777162019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkAC+H0Z+C3dkQ5Mg5CcrE7xcC7Fu7ljERZ1bBizm2w=;
        b=f7CR7yxU0eq/0qM0BvCmFcyuzxG6iDrLtbIuoc9tDU8LgctbVqWaxiQ9zvay6jpVIK
         Er0rerXOOvYXoyxRwCBjmGpWTq1ub60Ux0QQKsXgqDwII7FIQaFYofhfPcqe1BuX+j/x
         kChixjiUk6EsFOXrI17GTZ2cxba5SLF8KJnPPK7EDDZxhRPDSoWB8EPPKdanInDOcDeG
         Xi5NhRKGSKhOYFi6pGJG2Y+2Hnh9/XOT4urmoa1MCEkOmkVadrvZ3xLWR2jQQ1pkgTfY
         uJUpw8maPJDMP3zCHxT87G9gUiELMppqhDhws8b1j59uPfXQA/mHxacZz/8iQam27F4O
         q3kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gUjU/a9YxdoxRl/vY2V9BueCP3paxHmUrRomuDGOaMAvqjX2MCSoUzQMbT1lCsS6P9zrp/CAqlKUDWJ+V@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1+mHC5NhoQuj02idGHWH6+YMUGNl6sI9RZMz7NAiGtjKSlLe
	7N9KNCgUxjMU/oXrdFJqEWX/Tv7W8FZu6w4GVMFU0j39JzrDqwn4cxJf/nv7B1gHvaatHrjxBaQ
	LSQH8gQrrYI8hkJhe4wUJXyZp/L7EZijNA7C4n6JPFeLnheKPHFu+Hjy2CfF20fphGxaG
X-Gm-Gg: AeBDiesuipuBhMWN0pql49Yd5aOi+zXcEG31L28jjra70DxymgL2uqYzFWyTa3FZSLq
	Ey8SaPfq7Ro+cBqJjeA9LMvffdXB+xJuJwI537kxEapA51fZAAnED+uY/AH275eD8JOjAaytvUy
	bEovc3WoUBOe00NNRTx5/NKUoRnTkGxV2Zn3zHfJWBff3FRtvKdHXJ3ZrX4SQynkJK/Za2WTS/P
	kDSiPGoXOZEzlQMNRT0QBpMrYfbwtKHrs6I/FhgwUl932jJESAjjuYE6j52VJAKkTdnPHSAIu1e
	Ne/gA1T4o2BUW+8OWcjx5XdOkhBi73KVU4Q+DHDh7vyNPns+Ofn30CtXJeHcP8GsUoaaDInYBJl
	ObeWS0FnmjJuO6wxyb7/bg+gToNe6SL1cShBtonTjboC9O7Rj5uVMRpR63FMXISpQej47eYPKUs
	26+XW1D2axjjYB8ut+BylBYxqrEfntgvnCL7cqqVhgCMyNLg==
X-Received: by 2002:a05:6214:2a47:b0:8a7:16f8:442a with SMTP id 6a1803df08f44-8b028139a98mr136126886d6.39.1776557219564;
        Sat, 18 Apr 2026 17:06:59 -0700 (PDT)
X-Received: by 2002:a05:6214:2a47:b0:8a7:16f8:442a with SMTP id 6a1803df08f44-8b028139a98mr136126466d6.39.1776557219076;
        Sat, 18 Apr 2026 17:06:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec153sm1739580e87.79.2026.04.18.17.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:06:56 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:06:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] soc: qcom: rpmh: Add support to read back
 resource settings
Message-ID: <mnvijxaycfyd3mmhbpaoc5nc7fxpcrgvy5iqd75a2drsujtron@snb4txf5lfmw>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDI0MyBTYWx0ZWRfXyr8zhVJcyQim
 7ruyz2OD5HVEirv4W2hR254lqPyP3NoTNHCN5rrWTOrMJ4/1cNIwirEcnoWl+SmYVmfOdkurYJf
 yiDtT/+qxb5CtzMXPsYB4VRX4Ugo1PxnjBTpxvi6vFDv5oKTON4xk14EWvTF835ynUF8sYH0NVg
 7u+Jb/Hgk+4z5Yh0cVyVgZfwaKhykfb62Cy2kJ6c2eQs6iIoNil2H10EHf0qM3J1a9Bn9vYgaCu
 Cfu530H/gr0gmtfX9RZNaZML7MP0Bq1zVmqsS9g6XjyDtS+l45EOI0kM2dajEohJ6w8PAtxY+OR
 HCstInD21tc4/zxhaalpLp3ZU7BVTYSF64rx6ClK9kDVmuPVYmKDFhvgOjBW46Mp1675q3dgSqs
 QG2FG+p09jfLduPSaSQpdtGiNrawXFIslDFxRHpiR1hZxPuqhBK0g0nj1IkVWSW+LhgsYtrJNVZ
 3QxfwVcI+3eUbvLEtYQ==
X-Proofpoint-ORIG-GUID: CcW2uD1UbdkMLVxMy6MZWIVvGB32ciS1
X-Proofpoint-GUID: CcW2uD1UbdkMLVxMy6MZWIVvGB32ciS1
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e41ca4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m32t04jroMyMv4Ds6yEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180243
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-103614-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8A44422A7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 10:13:29AM +0530, Kamal Wadhwa wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> All rpmh_*() APIs so far have supported placing votes for various resource
> settings but the H/W also have option to read resource settings.
> 
> Add new rpmh_read() API to allow clients to read back resource setting
> from H/W. This will be useful for clients like regulators, which currently
> don't have a way to know the settings applied during bootloader stage.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 13 +++++++++++--
>  drivers/soc/qcom/rpmh.c     | 47 +++++++++++++++++++++++++++++++++++++++++----
>  include/soc/qcom/rpmh.h     |  5 +++++
>  include/soc/qcom/tcs.h      |  2 ++
>  4 files changed, 61 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

