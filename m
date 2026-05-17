Return-Path: <linux-arm-msm+bounces-108074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOSbBw4UCmq7wgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:16:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3E5637CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EFE8300B450
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64592F12CE;
	Sun, 17 May 2026 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZIqDeHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzzEY1DR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717D2E975E
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 19:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779045382; cv=none; b=Nqd+OKMqpRRkg43DD5+cjHIFeWYiNcVPRu/KyERttqJhZHLzcsNyz/xsL/wc/M+jWWkTqh1ZbXLvmoUirLcDxq+UHHOEjjOK7cB1SYlSvJSo+8F2Joul4bcL7GXk18jUqXog2hVuAOPIyv3n4dzrca4oF2UZ56tMVsjRsfF1dIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779045382; c=relaxed/simple;
	bh=ajcVKkMSh3HZ2O9xTbj8ouTeo9knFGZ437UqLJG3YRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZkxMHP6oC0jeeUGW9QrXaM+6euAiNW/bbM9pnStOKVzet3Usl0kKH5Qtx+nPa5fegUDKqDXOGwGaV0S7nTY+o4wa2mh9VSOSYerDGrOcelknugeyVoPvEoWCewx4nj0e94DPPk00iHSUHNhUjp3rab7bYbwORfxV8tnrvPnD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZIqDeHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzzEY1DR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2UaP82626392
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 19:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KeNI/0Q/nyMCZAXDQZlUbcd+
	LHYzCauBoa5Eblz37AI=; b=YZIqDeHFpAJuXKL3OBh60odkfDfjg9Jyfa2MqQZr
	u1z/O0nStxEF5gSLuw9Tal5cKvt/KIhqG16k7Wkn54IENJtd1sdYigicHZ2qlStW
	qNOUXBs2BK+11hJKpFr7v9oiJZFqTjkx7WOShepvOW5K159JbqZFiW1Kk9XImvGU
	y5Zpm6KxnTBBdAsJN7YyqKyCdAYv0CDkOVRxMBf0Xnd9d3fuXgZ+EVbIyUPzy7aT
	67SZFR8QomevJ59Zgbb1Eqh2tUNJFY9zGN10HkspMB2l1qvDfSUsCq88hIInk/YD
	RyihQGuY60oosEQY1aixBTmDTKshWf0TAyc9RqviQE8SnA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcjam1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 19:16:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso574858241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779045379; x=1779650179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KeNI/0Q/nyMCZAXDQZlUbcd+LHYzCauBoa5Eblz37AI=;
        b=ZzzEY1DRrVUr0h+Oc3zfvnHu5iSiK+ccHDU/wD4MTgmms6L92JmG8yd0GCLUkbvddw
         qWO4fpnN9/rRLKJW7aH3W+bRtcKsGMwmi4GqH7rrDxr1+hK31ONszOqCArSJ9WlAHDn1
         /LcP0JQ3TOxguDz8ZWRP1QkDKIGMt0/Z0SPuNUsOw+fXGquCMq5wkc5Qx1HaGQBm2TuZ
         ftU5LE/SuN1QnBYmtGVoBzByPdWwfbHnS9o0xWf90m+OEt7qPC3x84k+pYGcTRaXQOH5
         o8f/W4tUrI7o5qGc1FBwBMpG9u26xw00jL4Sjjg4MR9UxoJdrfz7UuPTk4efXjv9Rzcy
         5uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779045379; x=1779650179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeNI/0Q/nyMCZAXDQZlUbcd+LHYzCauBoa5Eblz37AI=;
        b=T/8Rkj6pWxb9rnDozWL9esVVYWPutX+TPzzIcj5qsxXNlWDCU3VIanl5SH/hBYwnES
         x9JV0odqYjIvHacDS+HhGfXQPm5IPM+LgegSZUpiYF1GiF69cC7iWh13XDwOQd+wizTf
         BDviPZ+O/t67Sh/yIATtaDlFHSbpQehB1BNhwaUU8gGI4iA+1k5mk032syTVJ4KD8UjZ
         9Ia4ReYvLceMfpRStV9hAE69qdWLveNXxJcOhVfHHmA9BA3Mss2tIgJ8FJsq9FyypMYI
         AYFJJg+3OHD81jGARL+J2deVWVsoZvWRRwMuJ1fYokEKeS/9w5+iMyXX+3vcgro1wHR4
         1Lvg==
X-Forwarded-Encrypted: i=1; AFNElJ8Wsn+7VdnyuEWXXXsGFc9RlS/10QhEUbX6WBMjaCAHrud29OZGWu178Tn083W2sEzXavHdX5HubRVKDr+U@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfHKEdvT396k1w7djCiCZNBlJrEigylkxR2B4tDOPxQHqbgyb
	qHeu+76mlK8i1RmFFS1c85CqjcdfLARfC62OSpsQt2OnCnK0T+VJ/RocCVccGgY6GPSktx4kngM
	0JTs4oVDUyUVx5IRuZMwKZX02+fMxm25BfKWzkM9WmndiHLtSGCwoTbAKd7S0X5JPi0KF
X-Gm-Gg: Acq92OG9hA603IE5hY20RFZ9bxVoDjw2Vp3CI/7XI9uL6B2qkvsV/frUdaTQA3F067W
	0Q+k6NvoKVvIz07xbW4k8Jzne6likuS4+zWpF2GJwxBKczQwJdg9/MaFhKlK1ONewwnY8IZ4OF3
	hEG9VNSFyX/Zn1zkkG5j6Il3amIYur97QHumtJIysbb8HERf+/ATXDA25T7GXFusBlJjVC94o0g
	olKVCk6kbKUrUnX5OOsZNpymxzgcHiOTCL9xrH/BRoY4M9sMif1PGHPqqQ7y/Bf6DNm01NebDZA
	a4BRBW9rlSoHsU6zsh1lPdUdihG5J3I4A8L3gMSRwaGZ6ZEJa6sj5xaHpxLj12ehsHt0RJhj3kH
	FWx6lnksdpgTjxT576Tk5NxEomIRw7DxrE9GQQJ+YLHrerTvLxUpCePfdVT5CH6pAkebPqZzulJ
	bm5D5CO2ds8TNbDmQ6wpGNiaFRcTYBX1OMwLOWvr3sS2gezg==
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr4184973e0c.9.1779045378668;
        Sun, 17 May 2026 12:16:18 -0700 (PDT)
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr4184948e0c.9.1779045378156;
        Sun, 17 May 2026 12:16:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc171sm2864994e87.40.2026.05.17.12.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 12:16:15 -0700 (PDT)
Date: Sun, 17 May 2026 22:16:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Message-ID: <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
References: <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: J5YIRNeQFBPHh8RWPS-Z20zRowLFnNNX
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a1403 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=X9ApwIYagb19aBUu7BoA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: J5YIRNeQFBPHh8RWPS-Z20zRowLFnNNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwNiBTYWx0ZWRfX4nDBff3l77fu
 PCdjkzG/xsJmP3LoG30EibG/qSCXJ+cgcnHHjmeA9Dnukvyoha6NvrHsceiFlXM7d8CtDxnAQFE
 nVNLzlEvqcs0SGqV7bsdBpSpDXaIgL8TDfWjzDGNEY3H94lvXSkFs1+P2/MS/G66H9493SAksIg
 iB4mpqZOdWGa8GE0d662WZdoe/pI0XCqZCf7CRrARmjbE2CEi8ZaPqwQJVH+sXrW6RhB/KLY8Tm
 KTClsljUWfTP4MAXF4cmKZPiOrlqGJ27rFx0O3cJs14h8toFUSoPaAHiwf5+Dq46UsIwElIvBlO
 ZSFeICE+AVqtIezpa1Ji8AAS3J5Uu+PKxItWcvxdtTFO+/dGpnJ9fFJuej/2McuJlgRlJB9RRQp
 XwW2FAllT2k8SJ0OjB0yZoBZRqE1SaSY25Vj+v/W3yccCFQrnHC1897TGy/JbBiAwyg3Hop5aNN
 QHz626REy39De4l87+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170206
X-Rspamd-Queue-Id: 90A3E5637CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108074-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,infradead.org:url];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
> 
> 
> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
> > On 14/05/2026 08:22, Krishna Kurapati wrote:
> > > 
> > > 
> > > On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
> > > > On 07/05/2026 13:37, Krishna Kurapati wrote:
> > > > > 
> > > > > 
> > > > > On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
> > > > > > On 05/05/2026 15:57, Krishna Kurapati wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
> > > > > > > > On 05/05/2026 15:27, Krishna Kurapati wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
> > > > > > > > > > On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
> > > > > > > > > > > On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
> > > > > > > > > > > > Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
> > > > > > > > > > > >       1 file changed, 2 insertions(+)
> > > > > > > > > > > 
> > > > > > > > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > > > > > > 
> > > > > > > > > > ... and then I looked at the driver. So un-reviewed. Devices are clearly
> > > > > > > > > > compatible. If not, explain what is not compatible.
> > > > > > > > > > 
> > > > > > > > > Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
> > > > > > > > > 
> > > > > > > > > In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
> > > > > > > > > GCC_USB3_PRIM_PHY_AUX_CLK.
> > > > > > > > > 
> > > > > > > > > Hence, I didn't use a fallback compatible.
> > > > > > > > 
> > > > > > > > This still explains nothing. How different clock makes interface for SW
> > > > > > > > incompatible exactly?
> > > > > > > > 
> > > > > > > So I went by the naming. AUX vs COM_AUX.
> > > > > > 
> > > > > > The naming does not matter. If the clock is called
> > > > > > "no_one_expects_spanish_inquisition", does that make software
> > > > > > incompatible? Why would the name itself matter?
> > > > > > 
> > > > > > > 
> > > > > > > Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
> > > > > > > clock-names mentioning "aux" ?
> > > > > > 
> > > > > > I don't know, I asked what is different in software interface.
> > > > > > 
> > > > > 
> > > > > Hi Krzysztof,
> > > > > 
> > > > >     I checked with the hw team here and found out two things.
> > > > > 
> > > > >     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
> > > > > regulators used) is the same as agatti.
> > > > > 
> > > > >     2. I thought we could use qcm2290 as a fallback since the phy register
> > > > > init sequence is the same for Talos/Shikra/Agatti. The difference
> > > > > between Talos and agatti when checked in the driver was the init load
> > > > > settings. I checked with the hw team and they suggested using the init
> > > > > load settings which talos was using.
> > > > > 
> > > > >     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
> > > > > fallback for Shikra.
> > > > 
> > > > Then I do not understand why you are using qcs615_usb3phy_cfg for
> > > > Shikra. You say that the initialization is different, but you use
> > > > exactly the same initialization. So in a meaning of compatibility
> > > > between hardware for Devicetree they are compatible.
> > > > 
> > > Hi Krzysztof,
> > > 
> > >    There are 3 things:
> > > 
> > > 1. Clocks used:
> > > -> Talos supports AUX Clock since it supports DP over USB.
> > > -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
> > > 
> > > 2. Phy register Init sequence - same for all 3 targets
> > > 
> > > 3. Regulator init load:
> > > -> Different for both Talos and Agatti
> > > -> Recommendation is to use Talos regulator load values.
> > > 
> > > SW interface wise, shikra is comaptible with agatti. If we use agatti as
> > > fallback, we would end up using the platform data of Agatti where the
> > > regulator init load is not suitable for Shikra. Hence not using Agatti
> > > as fallback.
> > > 
> > > Coming to driver changes, I used qcs615_cfg because it has required phy
> > > register sequence and regulator init load as needed by shikra.
> > 
> > So is it compatible with QCS615? If not, then something is incomplete or
> > confusing. The driver uses the same software interface.
> > 
> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
> the two PHYs are not compatible with each other.

According to the memory map, there is an (unused) DP registers part
right after the QMP USB3 PHY. So, sofware-wise it is compatible to
Talos. Having the different clock input means different integration of
the block rather than the differences in the hardware block.

So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy

> 
> In the Linux driver implementation the match data is currently used only to
> affect the init sequence and regulator init load and here Shikra can reuse
> the Talos match data structure.
> 
> Regards,
> Krishna,
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

