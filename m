Return-Path: <linux-arm-msm+bounces-68572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1286B215E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443DE1903149
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A69E26C386;
	Mon, 11 Aug 2025 19:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="acaGdy7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E27E18C322;
	Mon, 11 Aug 2025 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941775; cv=none; b=AElb4Q9bb4Gbo4q0UOpVdyqTzPBZxBNHqlMt1AUsaVlajF5/oUgJevtAPJnVsOhOCDPq1ss65U5V+IiwGqOoK+2EMIOSaSXZzpz0DU/IQlHLq0PkItLDUs+F50rU9IeRujnUw5NA7EmuZRoMF584ELWdaBna0IrIeHXP8xhPAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941775; c=relaxed/simple;
	bh=BKJRuShw+ifPGO5zDJ02R/+RA2ZGWjS7IyXGvaWV6UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RX08xdcO+yY2Azqf8G7tLyhpSiANQmSsMFYceGXfwp5uHx+mx9GDFiiLNAboiC5mB1N9QTMI4N35dHh93GErw0Yph50x/CiHk98UmgC3ura28raq14iXAdwfq7j1DA+Oidk+KE5IVP9y5Eq3w4ZA0Qd92tEMVYHEyGSPl3BdoQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=acaGdy7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BG6vD8028837;
	Mon, 11 Aug 2025 19:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIQNEOr2Ctamux622lIofJF12/gwgzh0TGqzjOJ7sbs=; b=acaGdy7mfCdoKpKH
	gGTzErvMTs1iyBmeboWlGaYrVtCzeSyBCtkzKXJCvBWKeYwVNhudE/ZAeNstCuZC
	gDPGWzppNl6w/flyFE4wIMnw1vg24hFsSsQ4OHv+ukIWZCbg169I3UurIKPR7tiN
	qUo+0eJU6xdwh2ogJtVZdXZrKEgv4K2DxU85UVCUaafauIEqMwxJTAmgiGvmk7uP
	tlnWOlevlYWnMX7xcrGIC7+IDh7O8vcoWAD+pxcp+HEjxKJR44QM/kGkDxCNDES1
	/zNEivytx2OR3JPA701hBLiLY3kEElXml3KY8MesfzJOlXHayUVEOMQyWYXfzD63
	slyIGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9snsjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 19:49:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BJn7nW001114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 19:49:07 GMT
Received: from [10.216.45.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 12:49:01 -0700
Message-ID: <d072b19d-bc01-45c8-8cf3-bceb53ca9b2c@quicinc.com>
Date: Tue, 12 Aug 2025 01:18:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
To: Bjorn Andersson <andersson@kernel.org>, Mark Brown <broonie@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <bvanassche@acm.org>, <neil.armstrong@linaro.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <8c7f8cfc-2090-449e-b6ec-688a0021bac4@oss.qualcomm.com>
 <14566f49-7f7b-4583-98b7-8a473054f7c3@sirena.org.uk>
 <kwp3q4r5rzahzro5f6l6ml24vbiutyxokrhjsbtzcb5kvanx5e@elagxv6w5dq7>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <kwp3q4r5rzahzro5f6l6ml24vbiutyxokrhjsbtzcb5kvanx5e@elagxv6w5dq7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689a4933 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=goew4TiO_d3vh4neJagA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: z4j3y0ZhEyzLxSi9fxUT7xqILUrZh4A5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX6P50+mmJI+aK
 CoiF5vfBJWYS8JXs+7MDfglj4szRXReknGLhkUxFcJCSAZkKMLhD6lCDs0gWJ/GVu6Kvz0ZuemG
 PA8leKZ8ZrYWoRqH36Kr8Uv5QuVQsOyhTuTBNGI/67wP45sBy1VgnSKj3xVRYC6BB1mXHm7LeIa
 9kYTav9gn5majOvH/0QUNy6F7ay7M5X8LfbCKkxL9yf2+bzrAN3IrcSyQgpsrUZYZquB5MMXfrR
 VdoPFsK9TbtzMjhWMjVHc1NwrdecHqgqdbUqmtGGZYc6YuL+6qOIOQajoXm4K6RDHSbxzfPy6BO
 lV9xCbdyjbqXpfGFfHLzozVr1slQG18KrJYLqgHMx3jUMtLboEDBCLD1SeG/peH3f/zzdVns+PL
 WZh+fo7+
X-Proofpoint-GUID: z4j3y0ZhEyzLxSi9fxUT7xqILUrZh4A5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 8/11/2025 9:20 PM, Bjorn Andersson wrote:
> On Thu, Aug 07, 2025 at 08:09:56PM +0100, Mark Brown wrote:
>> On Thu, Aug 07, 2025 at 07:43:15PM +0200, Konrad Dybcio wrote:
>>> On 8/7/25 7:26 PM, Mark Brown wrote:
>>
>>>> Note that that's specifying OPPs which is different...
>>
>>> The microamp properties are in the top-level, not under OPP if
>>> that's what you meant
>>
>> I mean the OPPs use case is an existing well known one for dumping stuff
>> into DT.
>>
>>>> That doesn't mean that it's a good idea to put that information in the
>>>> DT, nor if it is sensible to put in DT does it mean that it's a good
>>>> idea to define a generic property that applies to all regulator
>>>> consumers which is what I now think Konrad is proposing.
>>
>>> Yeah, that's what I had in mind
>>
>>> I was never able to get a reliable source for those numbers myselfe
>>> either.. At least some of them are prooooobably? chosen based on the
>>> used regulator type, to ensure it's always in HPM..
>>
>> That's what set_mode() is for.  Like I say it's becoming less and less
>> relevant though.
>>
> 
> set_mode() just applies the mode to the regulator_dev, so in cases where
> you have multiple consumers of a regulator_dev things would break.
> 
> Further, there are numerous cases where we have multiple consumers each
> needing a "low" mode, but their combined load requires a "high" mode.
> 
> set_load() and its aggregation of the inputs deals with both of these
> issues.
> 
> 
> Whether mode setting is becoming less relevant in our hardware, that I
> don't have the definitive answer to.
> 
>>> That said, our drivers cover a wide variety of hardware, built on a
>>> wide variety of process nodes, with different configurations, etc.,
>>> so it's either polluting the DT, or polluting the driver with
>>> per-compatible hardcoded data (and additional compatibles because
>>> fallbacks wouldn't work most of the time)
> 
> If this is our reason for putting it in DeviceTree, then we should write
> that in the commit message :)
> 
>>
>> That's really not a persuasive argument for adding a genric property
>> that applies to all regulator consumers...
>>
> 
> I agree, even if we determine that this belongs in DT, because it needs
> to be tweaked on a per-board basis, it's still only applicable to a
> fraction of our device nodes.

Hi Bjorn & Mark,

I had a follow-up discussion with the PHY designer to confirm whether 
this value could vary at the board level. Based on their response, it's 
a fixed value for the SoC and remains consistent across different 
boards. Therefore, I'm comfortable removing it from the device tree and 
using hardcoded, per-compatible data in the driver.

The only concern is that this approach may lead to driver bloat over 
time, as more SoCs are added and each requires its own hardcoded 
configuration.

Regards,
Nitin






> 
> Regards,
> Bjorn
> 
>> My instinct with this stuff is generally to avoid putting it in the DT,
>> we see far too many instances where someone's typed some numbers in
>> wrongly or discovers the ability to drive the hardware harder and needs
>> to tune the numbers - once something is ABI you're stuck just trusting
>> the numbers.  That said I'm not going to stop you putting something
>> specific to this driver in there, I just don't think this is a good idea
>> as a generic property.
> 


