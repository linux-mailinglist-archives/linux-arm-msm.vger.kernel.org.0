Return-Path: <linux-arm-msm+bounces-107753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM+BKbXlBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99B54C50F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C16F309B0CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E0842B72F;
	Fri, 15 May 2026 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbwIn7/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+hWoWlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59ED42883C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836592; cv=none; b=lA2Y1U2pcouEk1ennJiPxjvqQ0TucANhP7eguu92wMJjpy/P2H9ELUZxkAejuGMqoQQjuUh2aw8UbpmwXX0eW9FhDaw4F6K0copd7S39/jJy5QmMYumIaFRHSL1wz7gZzOYdkgjTv49ZLAXq8lMp2+2AusnnTTcW00ILV3AXmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836592; c=relaxed/simple;
	bh=lTltjPlWC/LmlpHNY8mM+jmNxZu6sAszVV28ZApN2ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tan2yC55BGqsdcHJ+IF3nqf/6xxvX+hvXz6XmervvMeyJGb43GbuVmCjKmezn5PJB6kR+aBZIb1eADxPSPaX8NnpGbDEaM7nKfugowxhFtA3Q0z8AZE2rKEqbz6pEuKEiDyoyoxw12melI4OB7+YOkXFEHxMQBf/AqqZG9TO44Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbwIn7/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+hWoWlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F55Ulc3512721
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvhR2weDmub4Q4ZQoD//N9gjTjMPd6c4Apfti5N/kTU=; b=LbwIn7/BxVuJVr3P
	Ulyq/JQtjrKNn8CmPNivSWjv7xJ+PmFk4MNAO4h73KYHYshYyinnTdukVJ6Jktel
	CaL8lrsOb5bRl6LTKVsh7Zop1kLsMeIhrvkhlBVeYDZ+V1BMf9X0Sq43xgXDd/PC
	al/V5h09RzS8i63L6XcP0f50G3quQMipyD5lTU7877uBFy515ND0fLDGy32u7Vjb
	AqyJQSg1rJrJ9fJxWPFzVoIlJlJaeuyMdgqfsTBMNEy7BgQYTjgLIFWz8fftHgTA
	cscZ7QzXSaqD0P35RchLfSBTo7aOCGijMkAi978u1f+aqiUTcDs5Gqoglg6Cjiuz
	tbu0FA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vajky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:16:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso15931571a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836590; x=1779441390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvhR2weDmub4Q4ZQoD//N9gjTjMPd6c4Apfti5N/kTU=;
        b=G+hWoWlNNXri6FbQXo9BVkrnp0WSyDBCA8ei6vH2VYrSoTy12SCjBv96H2vTiDBC4Y
         cWQ4hZnzhm0h5X6q6mYOiv6XYDl7JHXz1hJ/iy5wqYQMAvfrFnHLiTcMNCAWfbE4zy+c
         +5gXOLhPrG600Ceyh0HWn8qQNPjo5tUzL5/AFkJtjXXtoDj7KCHoWyoqKnEFaSZCme1+
         xBSxvmQcTYs/D9n9fqWvwWjEFLio9j8ASWQ9xsSBDH0sg72hd1dQf9kop7Q7RuYRCXmL
         av3Mi11DXZgJzhojAVC544nq9Yywy+qvgaxjgRxXsJpGeM8e+Kr2HyYA8fWnDu/HYERp
         dEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836590; x=1779441390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvhR2weDmub4Q4ZQoD//N9gjTjMPd6c4Apfti5N/kTU=;
        b=LoKMJacio4bAWlO4ZOnkwJ+ZpO7Oewn1F01RoKIiHgs7wbrv7GTdSDQ203pBAzw8cK
         tqZelXBiJGRrJqTy/CgW426s2r4nkxjBZYWHu1Khxbqa6NSlet5cj/a6/b0aSPHgOFhG
         uPwzOxI/Cthn4rd5XMgRc0fwTjv87E2VMCJukcQPrp/f41X23C0ti598iXYjJ2zerXCS
         sWZnY2zSeTDelzQ/fcKtYOaAnEWCEXcIv/rgFcsrCvwUuBnTd2kT60+PdEOschbGw24F
         /qgM4lp3iY+ei64VHk0kGTVDfob+xAs8hFfZs5o4xlZVncIKe1GuHjML5bo/gGkujGT0
         TWrQ==
X-Gm-Message-State: AOJu0YwnlAEi1E0LbeolFcpwJDYpnEGhHvbCy7PppCplvWnvwXaw+OoO
	KcNTTen6EYb2rmiMQiM2oBrHtGHpVZPRYG2JIkUXawKZOoE6jt53t+iWJNN2vgQVQOeSuOkg0Pb
	Vd/3jPoDRnoNnOfl0xnrCH1g2OHIylv5ZKJR6cUXjDnwUUkjaL9krwn6qTVkaGR016Y1b
X-Gm-Gg: Acq92OG+Gn0W5/Fixeo9MGeG4UdfcbxOprQzZIsYBFcXcoVo7TBjEw5c2lZXKBic2C9
	f5Kai3QbQrQVh6Wl2q+86suq7s6JsKq/GAiLyU7zLLzby7P+Nl8ztAKGTjG6fQo+YWy27dQ4EIq
	z/nm3yk46+34M1f0yA7l7YBE4bGgvBZmHZ5IyoPfFmMwB6qEiLf0IkM+ID8FdpUHl8wN4vSCZUP
	piGTS1i/b5S2veo7wmaqq/MH0Sd5Js3q7w035IQ/x7xaDUS/pkp6JzxZtNoUUwph9ex0tNTvSUs
	Ypt8T9Svh/6SdMal+FCTZsUr5hiO6ACEL4UmPGHZTBcs7OM1amJ6Ua15vvEU0QAWv9MvXqe+FZt
	oJt9oTJzsOLLQZrdAZCAiAj5z2JCTFxitGchnxEo8T+FxMJkFuMIDRd9QGoppZ2Ny2w==
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36951b88708mr3007555a91.17.1778836589597;
        Fri, 15 May 2026 02:16:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36951b88708mr3007523a91.17.1778836589119;
        Fri, 15 May 2026 02:16:29 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951434eafsm2165324a91.10.2026.05.15.02.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:16:28 -0700 (PDT)
Message-ID: <c8940496-c63c-48aa-9ac6-752bb2c54c4c@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:46:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add the download mode support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_dload_support-v1-1-5609c6b8330e@oss.qualcomm.com>
 <7a0d05fb-48fb-4183-9eb3-9dd316f4cc62@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <7a0d05fb-48fb-4183-9eb3-9dd316f4cc62@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MyBTYWx0ZWRfXxYWjQQD0+HTs
 /LrjjdH+nn5XCY/NOpZeI9aH6iNs2Le9AldetQBGWEe0NFvyUwoDLqbZAXfkBvBNGUJoDTrLqzw
 SnZwSrBqzeaXMkgihgHMIzXvoBKSWi0J5LEtthTKVdWjnJfeYlX0rUvJcxVF0hiGJAul1tcIHhb
 gmzuKZkOEoTzt1A/1ACFj+HJXqj0cvglOde8BxCsQvpgzqLv7w7wznReWpu9TGg2EcAZDqdJWJD
 GNCp6W6qHRMpuZdDeLr97yU1ODDYrw2BNMC+U4IjgrVnxk1cMNF6GjiATivT9ehc+67/ZU7vbz2
 fOd5fpjG61xYM6E8NFC+f94gvcSSyRgdZPaPT9z2jt4V2S3wmMRfz06/XczijlOqkvWsbnR5g0y
 EWrkrh7nbb72NUQK0ys8nGp1pf8pbrwpYOmP3f8HM2HYShCh1o9+D7epxnqPl3Y1cSXHDIlqEsE
 wS/fMnrwqfgSxWF3/eg==
X-Proofpoint-GUID: k4EK-f_Ejxe0ADgbAi4Kep29SUkC7SEz
X-Proofpoint-ORIG-GUID: k4EK-f_Ejxe0ADgbAi4Kep29SUkC7SEz
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06e46e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fdgjUL4clUkD61Hg5IsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150093
X-Rspamd-Queue-Id: 1F99B54C50F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107753-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/15/2026 1:53 PM, Krzysztof Kozlowski wrote:
> On 11/05/2026 13:01, Kathiravan Thirumoorthy wrote:
>> Enable support for download mode to collect RAM dumps in case
>> of system crash, facilitating post mortem analysis.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> So you sent ALL your patches separately. One by one.
>
> This is non acceptable waste of maintainers time.

Agreed and apologies for the same. Will squash all the DT changes 
together and post it.

>
> Best regards,
> Krzysztof

