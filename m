Return-Path: <linux-arm-msm+bounces-77578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA9BE3556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FE765480ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9224832BF48;
	Thu, 16 Oct 2025 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqSGRYDU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023F030BF4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617365; cv=none; b=XQ1j0PCkHHoCi8HGa7nLEQoHtcFE8ZF5fxzeqr6jWJ4u1wC6xAUnw9EPX81ynrKh9HU9XR8va7ke/NWMC4C3yeK/MAvL2Q7NVplghDrkUP3Ftfa5RHWBT92PDGz16WA49d//PUtxbk2pOEmmbxnA0eVQSt0lrFG23NRKsKWFKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617365; c=relaxed/simple;
	bh=mL3AkCdFjfUQDFlySMvWUslbbK6AefBEqeQD4tfNbNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTRVV+wdxkBDM7r0l/ktcXxOpDo7S0lfu97DlgdesXPI+7JRnEGtw1MZXvhsV6hpVukVkQFe4AbH3oN1xjauSWzoKR9L5y9K2lfsKJCt0EdsdFmSEI0gU5S/zA8IHYWtlZuQVV+lvkbxWdmNUY7PqKGAgYjE+kD1P/fJAjxd/ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqSGRYDU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7rLqL002559
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9yQUnMu2HxE11HdeoAr8BU2ZwERrUip4hDHAbjMAn4=; b=pqSGRYDURFh5ETLu
	QxCj9Wj4Oj78wq12XoZq1sFMnC+NS0OROrZjGVGckFJd3k/60Zpi950reha6JZOd
	qWBYVZoD1lWOjW5GDkfCKi0P3Jk1GvNhWqk0mmH5XyjRwClsT3sF/OrzWn0GK4xv
	GUN6vmTBiLZ+qyCiUnhc4v6JLS9l+Uk1LIQI/T3NIK5F0XEwoXkh31GAyMeLsVG2
	jmPb5MduYt5pqujQzb7k83aoEgK0W2BcFX5ZI5j1wIinyBN7imPjw4SLKSNlopc+
	mwD/QMLg2W+Ip86t9vYkX7J5mWUrTZ7h/jKQvWGdo2HC/T0rYd6CufsEkiJSIpkM
	9hprBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8g9p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:22:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8645d39787bso244018485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760617362; x=1761222162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9yQUnMu2HxE11HdeoAr8BU2ZwERrUip4hDHAbjMAn4=;
        b=UoS6xPbGiKTll+vTRIzG8rzoftsllZfe0zbXR+woDTu5JVJmPfdkZSr8N2MYIZHO4H
         mZZL4kIPL8fy19vTQG0E7kBJRBXSFWIBItRn/bDNlUFOs8mtEBfNM4jg+4u4XPVuefXN
         uKq9isbT5ZIiolKqUlOkHLffWwL3+jpRol1+bHCRg3JijxuUTFjDX1nI9Dy9UdntsCep
         dAR4C4tkrK8nTGp3HGkidzCRqMGWr6+V7BZCNUeeLs2uC6E6drvmCazWnRE2EYKRQVAZ
         vgl2JvjQx7aoP4pC/9v/+PIZJzLb5LZORNhEFG0WDTBIV9ADTf2R883SaZp9bt81W5wK
         alsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuWyIgHMSi89eBtiz3SsYovzPEMEw03oRre8oOaWc2wSV3HWtWcTF5FnabOkUaIP7IXFpyV1ovKcDCca6A@vger.kernel.org
X-Gm-Message-State: AOJu0YyLO8LxC1pojWDwlSJ28VC1Pt009RtbFHa4p7NmnBf0sA6oCSXT
	3jWNEAQjFDTtEXZSQsy5wQIybWN9dzoK1zU5X9FL19ChB1Ip2O/Yr81UH3QK41pp0p2TKrgZxUW
	K2/5V1ZJRrEsAfoGRgM6sa8vdmrw5bjOGFThaOCpDWSIkB5Dojjj0Q8kalFtp+7kTYMk+N9t6c3
	w33z/4zwQ3wCsd2QrZlYCXqazflnL1EgVX9nJVA01XtWQ=
X-Gm-Gg: ASbGnctrE8CMZEyb2S2G/Nt63XXQ5WlnviuUW+hLC8xiQwNNBl4FNQoQGRxikZfUaN7
	tjwtb9+9x83MJFVfgZvE/HlykzbX2xqZPh1CWO1VM9N38yO4l32wzxDhEzKnIqqNJojTD6YgIr9
	FpZyVZMjWplCt6eaG8R5n3VYcB4awppaFqSHY2WNVftRBPbNYRNZ3Jx1ZaU+kWry/7fE29sFRJe
	BREnhcfmHiDFUCT
X-Received: by 2002:a05:620a:4502:b0:890:28c7:f669 with SMTP id af79cd13be357-89028c80073mr58576585a.30.1760617361803;
        Thu, 16 Oct 2025 05:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnZMb/cYhHwHiWYZwoXQy2OINpsvIKqNRNCU3Ket2voCC7bfHOUUrKU4B139SqJ5kxiGE/2fuG+XnMoA4Crq4=
X-Received: by 2002:a05:620a:4502:b0:890:28c7:f669 with SMTP id
 af79cd13be357-89028c80073mr58573185a.30.1760617361345; Thu, 16 Oct 2025
 05:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org> <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
In-Reply-To: <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 14:22:30 +0200
X-Gm-Features: AS18NWDp6vazgiHxY7kgFcW2LE3xKj8UU2r34EGJpIgpnAkFsDnwm-UZKPSoRe4
Message-ID: <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OIAt7c1vCsU0ZOpj7MWjIKGZgJOpOYiM
X-Proofpoint-ORIG-GUID: OIAt7c1vCsU0ZOpj7MWjIKGZgJOpOYiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXwamrtmoiSBxt
 O8rgAPgHqE6UNCwmuukE1Fo+O6e4I0CxCNtilGO2sVKvzZhcTFeLMEwab8Kw5DREPZyN7hAL6pP
 VIS4yRqwqxjWAxaQ2BTYOIHqVwnplXXS+uz6LbogzExviGuS5L+qvDmtEl5z30DjlBEmjyUanxw
 KV7u62Tvv3DK0zUZXHFxF0HUF0NQRRPgJHAVJSonSuaLRYTYt/lyxd5ojVxB2lvNmlJNwlJtU/c
 cCILF2BiYYOT4lZKAnPdXzDu6H0fQYfvo8gImWDWjMqdGPAbbPVxf+za99XEWwebKthf2fPtUfc
 saOKaS2IvocxozRtRS8GaWn63hKyAA7LkWVlAmRhKaWp2N+ewK0YFrCQdapI+yG9w4T9JE3JuGW
 YLzvbb7L+9y8kNmWYR1hj9DMllvLgg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f0e392 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=p_FccyrFFb65Td8MQdgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Thu, Oct 16, 2025 at 1:50=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/=
media/platform/qcom/camss/camss-vfe.c
> >>> index ee08dbbddf88..09b29ba383f1 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_devic=
e *vfe,
> >>>     return (!strcmp(clock->name, vfe_name) ||
> >>>             !strcmp(clock->name, vfe_lite_name) ||
> >>>             !strcmp(clock->name, "vfe_lite") ||
> >>> -           !strcmp(clock->name, "camnoc_axi"));
> >>> +           !strcmp(clock->name, "camnoc_axi") ||
> >>> +           !strcmp(clock->name, "camnoc_rt_axi"));
> >>
> >> Just use camnoc_axi for both. Look at your bindings - why do you keep
> >> different names for same signal?
> >
> > I think the correct question to ask is:
> >
> > Is camnoc_axi going to represent the other (NRT) clock in this
> > setting?
> >
> > Konrad
>
> I'm - perhaps naively - assuming this clock really is required ... and
> that both will be needed concurrently.

AFAIU, the NRT clock is not in use for the capture part, and only
required for the offline processing engine (IPE, OPE), which will
likely be described as a separated node.

Regards,
Loic

