Return-Path: <linux-arm-msm+bounces-95117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EKXCU7Epmn3TQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:21:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7331EDAA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836C0310895C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01883FFAA4;
	Tue,  3 Mar 2026 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d55Q8jtG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjuhsVj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7A3ECBFA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536475; cv=none; b=ed7soORn+lS0nEGhREwqEUq0qVHwVtR0ilH5z2+phM6Dx6oc7NvzjEf6EcsDKXPAarSzLFbIhC1LJs121Wm/l/lnHr0HrEd5Zzx1Jw3PbkLrDUshPTPl43TncCL8zkGqNWqlMhJ7XeDTapV0P/uYhBrI5ssmU+yEjP96VHaICbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536475; c=relaxed/simple;
	bh=YljFmeR70WqQRaMHHfK++kC2Lk5xogrFcPw5Bu9rtLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk71UbbzpSBPhmqBTF6IzvtqMASjaUVwKS4e+8VmqqdFnSOKVb9VxwCSFSVBqMjVVvEo4HR9BKXwwgjKUJmmdMW9ypg5ahlTj39kLv6tlfFH+TDQR8uNnAnYPqr86/pVUuj0neX1ktbQ7quRuiGn01Cch2lzKl9JF8o+EMJR6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d55Q8jtG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjuhsVj9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mxmm3996898
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+Ehs/Uhi5NZO8CagwJStesS/5PmHPBsRm/ob87Fnvg=; b=d55Q8jtG8vdFCXlD
	GY7hkGNE3XZkVoNu/HOJ8dSJ1GUCXoszztPDv+ZB8lzLL90a5s5GSkG0y+bkVPmA
	SAKIZjbhdHP63jaa0+jJRRUvCITEKGM3w8PgfhJpgtS+ax6+C8luyOGIP3LrFuqa
	o0/4JJ6Y8ZC5SJkbx6LOcQGk/0TbJBy2jxSgdWgvgE4p6RMx0H1N6M15KK9AIUV9
	L0EEMeetb83qTbNNt5rYVnMVPYclqOXtAoP/pTozzMQRtR4kgR2wDuZt8yTbivuV
	s6Etk14zeKjnZ1ovO9HI3yDO7G4oyeDHSDolPb5rMHjCxCiKRaagE6AshB4yooW4
	KF9ooQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fs7ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:14:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so453059885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772536473; x=1773141273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+Ehs/Uhi5NZO8CagwJStesS/5PmHPBsRm/ob87Fnvg=;
        b=AjuhsVj9/dbIfrAvGSQ1rNPwSAPjyvhd6cWlbQJuugAHDbjTiEOFMTvwhvZtEdSmYF
         WqI96xX4MK9aeptNEXhtaBGmLG/s9ta6mfOllO9i7lZ0VrGiNwP2DYYNI8EvSaQP1Ohs
         gVwOyb9dvg1oPwMIyc7/j3GmanJBcusf4nMvvKfdfer4TYtymigpBxXiyCy/RC8rlpeX
         ISgF0KYVSa4aXVsPFn3MoyBjMrX1kRYwORkuCN8NT6TvJbemKizoFaSiMwbCfm1tZeVe
         0JURi8W5TY8d6Z6hRHH6URlcML0xugoKtw7te9XSnt5R25P4uufe5Sub3TU+RWpxKsdl
         yM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536473; x=1773141273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+Ehs/Uhi5NZO8CagwJStesS/5PmHPBsRm/ob87Fnvg=;
        b=CBa0iq3yCOPZeYg+okQAsqyGPFCp3y8VX1cmWGww2FXDvEib9yp5TzTs1urANsOCrT
         zvO30MifnN34mxbWey2UrZaNXjYx2E0PfUcbqFFPS0J2MxUWjXCaQmIOjxLyFjSPQilG
         Npsl8C6AP+vfCGi49tgSKEA5p50dFIq0fJMDeBvjxI8VLD4GG9Vz9+AliNeg2IZxu7Fc
         bPwvE4Fb7+tUcPKeGup1S/cZEDlsqioW/mRXc1QJHHb6MW80faODc2Rrec6A7ZVoWuPe
         YYmweT9KMAoI7/M3fW9k7X140Hbs/wJcSxWFTj/SBpRiYxtV1h1owMnn08mn5ngAdEqE
         YDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZoSvfQ7EKwd/I/naVZckwbPuGEcfnOyYiqf8yJECT3NmzuA376Nu8nmobpnWdF1KQvOt6q3FeNdBGBvXL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IeWJzL5j37HPl9DjxkTmcCwW3K1nvEj5xetcb3vlvxrkPhGb
	eMq2bOKwUFoiihnBPymPLXTVJ6e5AxeSU6xphqwCV00Md5LEfc3yQOWG+CdYLvosl0luUuLfxRl
	esev4dXohTHJijwzrrmNWLZQ5Rf49o3N3q/lK34LVto+QzF9BjawCIR/HAUDaoWlECsT3jK6xnW
	Wz
X-Gm-Gg: ATEYQzy5thYMqb5iEygfJaZbRcLXr7Q7vSsaJIXHTuVzCIP0bKe6ngxXH4afqLzgXUO
	ZHd7GWy9CrzxPEoIEnxiIBw2IS7H+lXcVO+n6EI6ToXb+aRdC5Wx/5Gf7XuWYssPHL7sIoymWGs
	c5v4CWStGwmjYXbUCBgi6NAVipRv2oMgqfcEcLDYdNGXyT62U9HDmi6uUsHFsJ39xiJ4/vVKt6y
	/vwkwmn0m6zubU9ACYN1HCUJN+bD9BVQTcKe2Erut3MWDpQTHTL2N+kAwRBeU6Tr5KYPt74MnmE
	qbWclvjBpA9d3N5i3GBURmBt/L4JDlPmS/8wqY2ObQtZwQdN2THtq7uyli7oJiNkZ7SqSrpHGcy
	gbfdnQg0RDhkoKBTs4p4M13VnmXALbCUS4NUWWp5HwCuMqM67LkZ/3p0s0ofv3wTakiQc3FoMJO
	HUtgk=
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cbc8d9542amr1415724385a.0.1772536472446;
        Tue, 03 Mar 2026 03:14:32 -0800 (PST)
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cbc8d9542amr1415721585a.0.1772536472046;
        Tue, 03 Mar 2026 03:14:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935afe7d28sm564996566b.67.2026.03.03.03.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:14:31 -0800 (PST)
Message-ID: <578c485e-b7d3-4468-bece-efeb6db2b1e1@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 12:14:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
 <20260209-magic-conscious-seahorse-b81c8b@quoll>
 <aY1Jx5J8x/OALk5M@hu-qianyu-lv.qualcomm.com>
 <hcslao22elcihjw56ltu4yo54lotheqpikzsrq6tia33di4fs4@2ygrbwhcfx2a>
 <aaVkpKZcrNM7k4Xm@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaVkpKZcrNM7k4Xm@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6c29a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pnqVCfKAX2tXTj2rVogA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KXPi5lJUsj0-7qfW0w-jSnm9JIKIwjer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NiBTYWx0ZWRfX4WLoLjUqei5p
 oE4xtHMOLjzIJ4l342mLvt+f9OP/czA4yu7VJN/mkqk+EjsyiSKOTKhR3lzH1Jz8eiJIvAmWzWh
 vntv84US+W94qpvLms7gQTkoorAdNgIx0quzKYjzRyiCE5cvv0QISfikO0UgH5WfRlETiiWp7yh
 1Bq27yFZ5HU150isX9xlE3DR2G1rIqHy63ULrMY6Fgu6yeXaUNkyKw+dx+EQ28+fJhm/CiL7JES
 hnULOznu8WA1bs0RyoXb6nQ62yaQa3Vkmr9eIaJx2R7yKBsd25w9GvanKUkFKCTG1ltR5pNRubH
 UudxyghD5YhrsCtyx7uyGQ8Fns2lUVjm4QjO4wbipUTux+SBBM79KTfxK/7avXHnm1bDltqyJ3L
 ENVIlwQLJDqU7nypT2mFAQ1cJ8ukozrjPBDC6B5rCtjKPxv/gaoBxhviVFL4YFzGsTCSCd5qcfu
 AH1LCS1ZyCV/KUpMZ4g==
X-Proofpoint-GUID: KXPi5lJUsj0-7qfW0w-jSnm9JIKIwjer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030086
X-Rspamd-Queue-Id: 7F7331EDAA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95117-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 11:21 AM, Qiang Yu wrote:
> On Fri, Feb 13, 2026 at 07:47:36PM +0200, Dmitry Baryshkov wrote:
>> On Wed, Feb 11, 2026 at 07:32:23PM -0800, Qiang Yu wrote:
>>> On Mon, Feb 09, 2026 at 09:06:23AM +0100, Krzysztof Kozlowski wrote:
>>>> On Sun, Feb 08, 2026 at 08:49:39PM -0800, Qiang Yu wrote:
>>>>> The PCIe QMP PHYs on Glymur require stable reference voltage provided by
>>>>> refgen. The refgen itself requires two separate power supplies:
>>>>> vdda-refgen0p9 and vdda-refgen1p2.
>>>>>
>>>>> Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply
>>>>
>>>> How does the driver matter for the bindings? If I add dedicated driver
>>>> for refgen, then I change the bindings?
>>>
>>> Yeah, I know that dt-bindings should describe hardware, not software. But
>>> what I meant to say is that the refgen is different from qref which is
>>> controlled via TCSR registers and its LDOs are requested to vote in
>>> tcsrcc driver. The refgen doesn't required register setting and it doesn't
>>> have dedicated driver, so we vote its LDOs in phy driver. I will avoid
>>> this statement in next version.
>>
>> I must admit, I could not find references to the refgen in any of Glymur
>> PCIe-related HPGs.
>>
>>>
>>>>
>>>> There is qcom,sc8280xp-refgen-regulator so why there cannot be
>>>> qcom,x1e-refgen-regulator?
>>>
>>> I think we can and it seems better because the refgen for pcie phy also
>>> supplies reference voltage to other modules like usb. But I checked the
>>> qcom-refgen-regulator.c, it contains some register settings and there is
>>> no LDOs voting. I'm not sure what does those register do, maybe Konrad
>>> can provide some backgroud.
>>
>> Those regs provide voting for refgen, because on those platforms DSI
>> block doesn't have a hardware vote for refgen.
> 
> Hi Konrad, Dmitry
> 
> I tried to model the reference voltage as a fixed regulator but the fixed
> regulator driver only supports a single vin-supply. However, the refgen
> block requires two separate power supplies (1.2V and 0.9V LDOs).
> 
> Would it be appropriate to modify the qcom-refgen-regulator.c driver to
> handle LDO voting for both the 1.2V and 0.9V supplies? In the regulator's
> enable/disable callbacks, we could vote for and unvote these two LDOs
> instead of performing register operations.

Wait, so you want to associate the MMIO-controlled refgen's driver with
a dummy regulator that takes 2 supplies? I didn't catch that part earlier,
that's not great..

Or do we actually have access to the MMIO of *this* refgen and can control
it (except we don't do that today because X Y Z)?

Konrad

