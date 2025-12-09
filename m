Return-Path: <linux-arm-msm+bounces-84785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0DCB0627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 16:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F4B3003793
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 15:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB682C0274;
	Tue,  9 Dec 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDz14uhI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGRa4g++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F52ED15F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293571; cv=none; b=fa8xW7E225YAvXFKMG9nmHsMJvXWwejtlxsnrGS4X7taosheYzeRDinW6fhAM6cE6uI23bI9p5xkYHk/XOZCMNLv1puk7jGQ/FXhNJJpSQ7XKCYmXuPnPmHLlFTxQUEo9TVMfCT1bu0IspcNS9qalw+Zbm4dCuwnrBAhnZSmnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293571; c=relaxed/simple;
	bh=nKorFV32ASimrfBxgnFNxkTAgsoL+JC0LpWZT/UmKPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkIpc1GgK8R1JD66ZcA1TVfmw4OOR4il8rlbt9BetA4s3+j87J/bn+eqEOOBQ6k5kJFuakx6ZRlvew5rkms/EEV+QXgw4FdHlwtaL3V5NkXOXJuLO12mhayOWcoZj6084CLc5kudjLhvhL7VY4EzooECgNlFTejAQQjaovCtnoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDz14uhI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGRa4g++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9F1H404043319
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 15:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okKXWkZhLTBrU/tTmUeDFhB7
	1hgvRlbsNvGn+dJTzo4=; b=VDz14uhIiDvdJGi5G70NQFbPSjumQcrN6SdyWAxF
	HCsOjOBOAYt55kqWo2FCNdW4x5F90LVlvipVw95HCJ7LhbuMi4hlXShypoFhGgXm
	wACRe9D9rmmNqzOFRgVQYosxMDU6j99hWh4Rg6EWb+mdohk4uL9IlWU7Mn2XJVBO
	Ug39DXsiKW3rhBn07rn0PvPQXVwJH0TN41uKYxvS8AwKJxVn8wjbEylfPm33/hcO
	Tk7QQAJqAX7ewUZk0S4hLbAl1u4xkD5vEA3O1ldBUe3zq9lCfLW9IcNgO/9dLCwh
	qd3MzqEL7N3bmYWg14j9HyJOjHXISj46GeDSV44WtkctdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axherh0va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:19:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so130344461cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765293568; x=1765898368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=okKXWkZhLTBrU/tTmUeDFhB71hgvRlbsNvGn+dJTzo4=;
        b=SGRa4g++RelxjjQlrTh8yc0dwWsJ2ffSvlJdH98lEugYn3KBlu0I9vvBr3YlaFrCro
         o4KIudi8EP6Y+32vHL/xPp29yFkyjKmnfhXaElQktUX4Wwq/FLI5g5GGfPZqxlxQVBMp
         O9EDWyP/jHkSszc+JwcM+90NJiEEMkcOiySaxoiwTgV/ltwe15gI+ryAJe1gurmgzD0m
         k25+0ODvcZS+6RmQUHu4l0Xw7dhoJG5CNSmG6NFnPPFbTq0a/EB3wg3/L1UY9zDEtOtk
         Wz49bTSbArTPLPvQVoVocF42AvzNHXPXFe9AnzifKkQnLO2Wj6GifkDYCjVtVdXZkE3u
         XUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293568; x=1765898368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okKXWkZhLTBrU/tTmUeDFhB71hgvRlbsNvGn+dJTzo4=;
        b=W6L2+kiNLmLdGtxU2zmSotisqLK9cGsvS9d4wkk78HnL4i9idlKS8MwWxfV3mI9FeJ
         0+5azpWxvXuncUD/dbXGjqtpawsWVi+/OLRexYPNAcu6Je1Mm3khIYv4oHcriRKL0aRH
         2SipRquqhjXN5e9PEKFUESeO7+n9pZ3euh8f9JwuDj7fJ/oQJIx1WFQucAmawJOQJqNm
         e+fUt1AY/3ysIUoqSMYdALnsS1X8fssCXk9pgiVVyWTQyKxiVIdXIir4r0o0+IA26hSo
         SjjQUb9IWX0ot5aUL6Swr6ALAhY1vSD/jmSnwZ+2eWFm1WuF0D9oZelSCHjyGv/+Zfja
         1tpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb6TmgOhP7tswaJlBotug1cfMXAUS/JsMNv2v/3zZw9rRMcEoPWSVab92WktP/jIyu1FGGR64I8U8XJt85@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqTV5Te3Fndf0PmJ63iOf6g3dcfcqV77o5wP4W2dI3SoeZyty
	t+G/4nMZZ2ifYKEIGlMJNkPZoS4k9bLEezJQNGbPVCQW8rAd8z5kc9W+1vcyLeB0t4hfdGbK4oj
	vXlfU7oLxWbGuF51wLnFgk+L3N8zWCbXr9fPVU9kVvFIQo6c7I2d5gSYzyCMP10+XVpSr
X-Gm-Gg: ASbGncsHLCqwCW16HIESNGag6EyfQcvKHc8N0I3MSvTNwKoAaqRwQwFDaYT8QOckjKe
	qEsh5UZB9/RwCqbrYjab9yqyJ5c2EuIseCpcfWJdgZLb/CLakYyP2cnFetbi8wGdhrzouGHmpN4
	yhyTld43m9K5CMfnIh+S1rpbx5RJE4U542qwbZS2oRM5iSQI0ItHhXNrgi1MDeEADkniFyAcqpS
	IqnhCfXlI1cXrKFsv95SH2+Zrcvnc1LnCJxeH9CGT50LLbPzU7vkp43gupS2Mpelr7hDwbPIdu2
	Ll/4so+wXJY82QDxWyqa/P/sjyJRU87IcSMBQbgxYJUDUd2XSkh5Etx+lVhmr31eN8yVMdahE7V
	69vu9mZ9HmcNcKV0gBTfu9m2Uzy08odMycv9L2BkLyfNQgaQeTz48G5sS+7FYi0f2AyUdJgQZl1
	j8t8CfqbXQfC/PupxzlB7DcGQ=
X-Received: by 2002:ac8:57cc:0:b0:4ed:659e:efb4 with SMTP id d75a77b69052e-4f03fed5a77mr176478471cf.46.1765293568097;
        Tue, 09 Dec 2025 07:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDxC6uq7BZu5vhZjDZB1hHmCNQ2Jt8NyNPPlbO5KmGFu+ouZrG6rdB2C74jFiKnt96MVIHqQ==
X-Received: by 2002:ac8:57cc:0:b0:4ed:659e:efb4 with SMTP id d75a77b69052e-4f03fed5a77mr176477811cf.46.1765293567591;
        Tue, 09 Dec 2025 07:19:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24a06sm5265927e87.32.2025.12.09.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:19:26 -0800 (PST)
Date: Tue, 9 Dec 2025 17:19:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
Message-ID: <j62ntbrmol7qjqcuey3har3d74gqt573ew67w7nrnnhv3pzrnj@hptvrfbeaobs>
References: <20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com>
 <6awlcjah2ajwzxzdvoch5e3vn2ztvxyjdbikffhp6efti3f4wt@swhugoqsmf6z>
 <34aabb90-c81c-43eb-ba95-024f97d91afb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34aabb90-c81c-43eb-ba95-024f97d91afb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExMyBTYWx0ZWRfX0ZxYhU51oHEJ
 jzC6uDzrM1OrfcL5LIpMFPwzNq8dKy9003tdbjvjiBOt9/I5yEYzjGXQux2qCkSELPCHtV+fqqo
 l9aKsBVxGIRDlKiGaaCmLLw/SruTqMQGHyNn1YfF5qwfHkTNpPHAQEb6Ed4DndM8yPKsmEq/LPU
 fUCMy6Q0YdK84bJ1tBu1KBZ3RvnEqjY0aU46x56Qh4oVCz98JaniuwtaNn4tJH/VSsWpiI/jm5J
 kB87Xl8ZdzNaaNxpmYPYfETLGAmfcsEFFW2rJG9CoNrNsllw9h7kwGzuYvIv1ldWCjBzn/2ApHf
 n+9J+bOmZccxmgU8Z4b+8UmYZnnZD6erRA6TRlnSu8RyH4SiZq0Frc+JdIyd9Gumvo48Kso2HzK
 g97i49ep+GAqU6Bl9G6A4HPIF8b1mw==
X-Proofpoint-ORIG-GUID: LlfZMO-GHkkIi26b_V5fLvnPSp3f7ks7
X-Proofpoint-GUID: LlfZMO-GHkkIi26b_V5fLvnPSp3f7ks7
X-Authority-Analysis: v=2.4 cv=P7M3RyAu c=1 sm=1 tr=0 ts=69383e01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XLm68CIjDXbqJcbZymMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090113

On Tue, Dec 09, 2025 at 01:31:10PM +0530, Krishna Kurapati wrote:
> 
> 
> On 12/9/2025 1:22 PM, Dmitry Baryshkov wrote:
> > On Tue, Dec 09, 2025 at 09:47:01AM +0530, Krishna Kurapati wrote:
> > > The Multiport controller on Hamoa EVK platform is connected to Two Type-A
> > > ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
> > > regulator, controlled from PMIC GPIOs.
> > > 
> > > Add the necessary regulators and GPIO configuration to power these.
> > 
> > Should this also include corresponding USB-A connector devices? See
> > qcs6490-radxa-dragon-q6a.dts for the example of how to describe them.
> > 
> 
> Hi Dmitry,
> 
>  I see same discussion that came up when we were trying to upstream TypeA
> connectors of SA8295:
> 	
> https://lore.kernel.org/all/CAA8EJppf+j6H8vPOrer1Oj6SuM=qHKXoBahtCaCr7an-cbpyOQ@mail.gmail.com/
> 
> There is no entity (either phy or dwc3) as of today that can read the vbus
> from connector-A node and use it. So keeping these regulators always on for
> now.

There are two distinct questions:
- one is how you describe the board and onboard devices / connectors
- another one is how to make sure VBus is enabled.

I'd suggest having full description (with connectors, graph links
between USB host and connector and vbus-supply properties) and then
having the comment before regulator-always-on describing why it's on.

> 
> Regards,
> Krishna,
> 
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Re-ordered nodes to be in sorted order.
> > > 
> > > Link to v1:
> > > https://lore.kernel.org/all/20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com/
> > > 
> > >   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 37 ++++++++++++++++++++++
> > >   1 file changed, 37 insertions(+)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

