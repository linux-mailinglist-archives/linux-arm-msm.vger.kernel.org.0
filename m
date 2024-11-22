Return-Path: <linux-arm-msm+bounces-38847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A79D5F7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 14:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A46AB20D8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A3F1DEFE9;
	Fri, 22 Nov 2024 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6vlWPsy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7522309BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732280765; cv=none; b=uhzGCisKP9/qSa4CH7nJWxmVU6nL7Od9+PGC06l2SZjToGyabC1exr+dcR5fWC9zcu4l18FsmMb0v5ESjtQAxLV1UbzgVsvyzCnyBr941PEEj7Qq7RvCQaJTw2UBg2iyfYWGO2LZNrtBh3COBWf+wX5aqARcgsqIeS7CHbNbxRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732280765; c=relaxed/simple;
	bh=/dlSRdirAmXldQET2Ge72ybo3eTzSkqiDtwo9z4OH6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0pU6I8uGoA92D+l1BFxz6yEvWNwZC/L0gNL+bq+YZv8dy92RsHD2Lim5ZUYaooesgWLoRu+lcXKpVGZAgEAW6FZ4X+mN07lEQdyLK+tIbk3Myw+s9x9f8qGm32z6mNVcgbfaq39hbDA/GBxup93cIkDQmM/Rky7En20qobErxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6vlWPsy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM3nkwL021660
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AaHOhFj0Pi9aA28279AVxSRISiCPQlgDopG/l4doSPc=; b=f6vlWPsySXRWFdVI
	5d8H0BCO81pc9bio5up7KvMApRgzFdoP2+MX4H2BW2GCIQx7TMqAkQMeNBQu9QnA
	rLy2KKkDYX1+vSzZPM9rZYx2VoWkdjmbQyNdCIblYgEqaAADrHGH8HXKYdtLJDzG
	ZpvHzrC5Sq+E8TqWZifEHXGgwBz2Aifv9Nokb+YHE8zkmgNtH0+QKGSqc+slNJfT
	sE+QI5Q33jtEuRYedFzimpK6viF96ooEOut7pGqD0BWcvzkYuRAOyJAk5Ai1S90O
	EhwJMtZDSsCItq5NIos8x3lejiTa2v6849Jv754+80PRCaljX0SIlNrkvtnO5lrd
	fRvqOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326atb5bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 13:06:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b37a60ccdaso14127285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 05:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280761; x=1732885561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaHOhFj0Pi9aA28279AVxSRISiCPQlgDopG/l4doSPc=;
        b=KYxVFgjxLgjCaABjhIcfJYGAoh7+4DCKj/KXPPAXut+sITJpBOqpYmFnp/s4eHHFW0
         2GYWvBcPuPjFp1RaWPwkj2WCDU50y3+0X3Mz9ciuzLbrb67nMLzKFRSwn528a1Tngl6R
         L2B0fyg857X5B87luGriAk7E1WIo7yPH4ZLoXb39aJ70nvOqhvR9tbwCs/dIkiDLDRKZ
         OcVcTsIekB5cBnuAYDO92H6ImbyF2U7PdPK6NHNhUPbzOovBm3I3YaTw0or7DSNOwknK
         bEN5RQlj1Exwu88cxBDwdhNN/aC5tvRq0O+ERo8F9gGmkSO8qUDmz+89pkXZLR7hl6Df
         ynDg==
X-Forwarded-Encrypted: i=1; AJvYcCVRsT3JjVVXsOExY0CnQSvMGnOFvJlBBnNtxaGUz3HKDwtnnDVPChzij4ju8KbpKt/YUVseY3vNVpNSXgjF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hcnqoyLu3jiuLhBkBmEFF4EmW/CHVXULEb/7+WEXPyXizhUf
	U27bf5Mlef4CypJuhC+ZM26RqE2Hd0YvBHRJIb82F+n95RqSEuGsd2dOakKdpLhEor8Urp1CXK9
	PMBVGmICHZJ13hIUd7kyO9kVtLIbeUKbnoKA5YTakjq/59OytNalKt1IXjKsseuMk
X-Gm-Gg: ASbGncuEGZjC1iCX7m85aAIiyPgdsxsVgI0N2zLwFJw8+XFeS5we/HF+MZjrIVFQca1
	ChJmoStxFwdHbfn23AVFLXyRWOdRPwAXqCO58BssO0YNA6rOrX22RSqzEKUipQXvuRtlnUGp21P
	dhaNWDRBftHaDuXQ8b5rRv720E/FaxJ05ZXwt5Qv5I8ihkQ060gXFk6RkNhu9OO9qpmDLYiiRy/
	Y059sbe5uvRimOD4o56IVHGB4mKq05Mw4RFavC7ancJu4/9clU9Uwb9keE1A6xBielXNhqI7NhN
	S74OwoQhltWYNzS/zqNwxsIgyS7cTbo=
X-Received: by 2002:a05:620a:2982:b0:7b1:4920:8006 with SMTP id af79cd13be357-7b51459e2fcmr143208785a.11.1732280761248;
        Fri, 22 Nov 2024 05:06:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7jXetbMhOkrobfsZwzS9OMeNJtv9q6mIqwiOPbk/X99BrgD/3iA9g6QNlS2xUlHcrhl5i0Q==
X-Received: by 2002:a05:620a:2982:b0:7b1:4920:8006 with SMTP id af79cd13be357-7b51459e2fcmr143205685a.11.1732280760662;
        Fri, 22 Nov 2024 05:06:00 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f41d1sm96992966b.59.2024.11.22.05.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 05:06:00 -0800 (PST)
Message-ID: <0eaa951b-5eed-44eb-95d8-8220bc6c0ca8@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 14:05:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_abhinavk@quicinc.com
References: <20241120105954.9665-1-quic_mukhopad@quicinc.com>
 <20241120105954.9665-3-quic_mukhopad@quicinc.com>
 <lkovymvjsbd44v2huij7paikvnmo7i7rrmkmvpha2wn5sc4hr3@ppr2dgvhzy6d>
 <a741b71b-af04-44aa-9e08-a3f852b8a801@quicinc.com>
 <qpdponpaztryzacue5vtythr4b4cu6fohmgiwlzredm7ky7caw@eose6vpy4e7y>
 <4da87d98-823f-4781-b138-c6f6caae38fb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4da87d98-823f-4781-b138-c6f6caae38fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xCI-Hoda6C_Bq-hfR-ttJjV-i0G6qaVd
X-Proofpoint-GUID: xCI-Hoda6C_Bq-hfR-ttJjV-i0G6qaVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220111

On 20.11.2024 12:53 PM, Soutrik Mukhopadhyay wrote:
> 
> On 11/20/2024 5:13 PM, Dmitry Baryshkov wrote:
>> On Wed, Nov 20, 2024 at 05:05:50PM +0530, Soutrik Mukhopadhyay wrote:
>> > > On 11/20/2024 4:42 PM, Dmitry Baryshkov wrote:
>> > > On Wed, Nov 20, 2024 at 04:29:54PM +0530, Soutrik Mukhopadhyay wrote:
>> > > > Enable DPTX0 and DPTX1 along with their corresponding PHYs for
>> > > > sa8775p-ride platform.
>> > > > > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> > > > ---
>> > > >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 80 ++++++++++++++++++++++
>> > > >  1 file changed, 80 insertions(+)
>> > > > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> > > b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> > > > index adb71aeff339..4847e4942386 100644
>> > > > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> > > > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> > > > @@ -27,6 +27,30 @@
>> > > >      chosen {
>> > > >          stdout-path = "serial0:115200n8";
>> > > >      };
>> > > > +
>> > > > +    dp0-connector {
>> > > > +        compatible = "dp-connector";
>> > > > +        label = "DP0";
>> > > > > Thundercomm's SA8775p RIDE platform doesn't show such a connector. At
>> > > least not on a device advertised on the web pages.
>> > > > Are you referring to this product in the Thundercomm web page : SA8225P and
>> > SA8775P
>> > Ride SX 4.0 Automotive Development Platform ?
>>
>> Yes
>>
>> > For this particular product we
>> > can see
>> > eDP 0/1/2/3 serving as the dp connectors.
>>
>> Please correct the labels then. And also please mention why eDP2/3 are
>> not included / tested.
> 
> 
> Sure, we will update the labels in the upcoming patchset.
> edp 0/1 corresponds to mdss0_dptx0 and mdss0_dptx1. We have validated only these.
> edp 2/3 corresponds to mdss1_dptx0 and mdss1_dptx1, and these are not validated,
> as already mentioned during the driver changes for the same.
> Should we mention the same in the commit message for the upcoming patchset ?

So the box on the store page has these 4 ports next to each other..
Please take the additional 2 minutes and plug in a monitor to the
other two ones as well.

Konrad

