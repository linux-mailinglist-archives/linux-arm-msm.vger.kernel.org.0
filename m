Return-Path: <linux-arm-msm+bounces-61535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3CADC344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E8EE3AEC75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 07:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD831E571B;
	Tue, 17 Jun 2025 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpORaIv8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A33C2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145445; cv=none; b=D2Vwrrc6yvc6WBsIYY7jyg+b9HzhRsXRU5TiTAriqv3jhqhRMLjAch3czHemo/NbsJCJLnoZogSClVMblQs7J/jF/aqmlfhEN6G7yXGsHJrN0BfyXsdu27EOA+o4k/0HJxEODCa+yk55PDwnFLsv463ZIfXVIjm/CzngUSw9+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145445; c=relaxed/simple;
	bh=dM2TTVKJwJ8Zo2heyJgoN6TG38/aaJevmoTu0ZA9rqI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTvEZQ1Zp1J1yvpsqQl2farImlY5EVBpc5bA+VdRUPWh9Mwj1d2kwzlnXCRSi1fPT3Quq+e4zYxBUplKW01fKLwT8KC/iZ5MnQlRSwxGbvxiQUoHVFlMYRKPNFW9AAjHYxfxJVACbwG7buoDmTlXB7I7TSuh9zC3pe5LfXqJjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpORaIv8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7JjtA021241
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 07:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ou2meu4q5JqCycbsz/5svBw+
	CBSBiY5gYky+kXLdpUM=; b=gpORaIv8DFDi/bNEJV+EjJovRPvjw94V0YCQNgCr
	i2TkGJ5g4myunJb79uogv/Gh8OPg2Ao2PxQ3t4BkJTJamaEHFO4ZeCQUHNwCZOJe
	HmLY8sMeo6ScJsh743JIhpzsLZS+HttTyHT3n2pKlxdzMIyxPJmaGOeh+pzFNOkq
	51xfRsv6EtGP46FgBYv4c5Kik8kFGpVfZ7dDUS76blHCUYkm8e+98gg4Q/ddyA2k
	6LAtYuQggV2ZN4cJvP+EPbEzkU57At4D1+lw9leUPcGFVNxf5HxBy7hBtHDY/KMq
	OOXJmv2Cf8v/HLSmQN4Ooajj6tLbTlNnCw15jy2I9QZcXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5nvsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 07:30:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb3487d422so74977486d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 00:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145441; x=1750750241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou2meu4q5JqCycbsz/5svBw+CBSBiY5gYky+kXLdpUM=;
        b=PWlelV2EyFXyH3HVBm7LsG49qWJ9p6MHnKvID/cUgIJYyt5a987keaFMUGvV/WEbj5
         568ACNp7HH9DvUJyhvr+taEEDW8o6KnZQOjWb9W6+Okh9UQClJva4PFS4HIox3RSG09K
         xb44EGm5bX2zKGmL1QiTiAr0S7a8IlXuAnHZlXisnxxwYCDqNpsoOOhCjQeREeHSgh3l
         hJdSMl5wFopJWuC92WLwe223cj8E8+XUKbS+lXxkwNdBzWfOFw5L4vJZKBbxTRXrB1pa
         3cj7lP5BZfIDtadAPpQKbVnXcPXK2zV7ka7dMYm9mtdk3U9+1zX7lzqJ/YEUF3SvyRP6
         1gjg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbMsBdJ3ZU70iwdXB4fKop1VLBkun2tW72n51Zc9pRTGqCgx72Lo8IlM/gl9sLiR8xmF1fKrLhY6sWdZC@vger.kernel.org
X-Gm-Message-State: AOJu0YwMi5O+T92eV1B6W2+haO0qWaZ160tSjHrHhSAu30tI0F4Xrscd
	S7qaOGVZnPr0yDRMvqYw6/OKoBewiqvKpxS5atL5i1pSect7oVShRv15kKpjElLpweWH5U/9XMt
	k7NMZjhfc/rISrXMJnKE2ivUqZ1T0xkjXKLmVXo5pfKSVd+CdeEm9MsJ5rVYMO7p/ovrn
X-Gm-Gg: ASbGncscQnsXPwABWMBn+Ds0fRosnkQpZhdi0T3YwCS17+5nrZ3iUBoD9IaY7808wQ7
	VgxJr1QzXoRTdO1GJDZYZBIiEuU0sJ8Msj0DidRYEDBgXWh0de1xGBME3WLv0M89eX9AGnuLWic
	PYei5RXXtKEEK16hsMcwXDCcF4UN3JnfEF5zsp2cXRSDZvGbwO/uYbhjpJIZPeFxutH5hysSqZK
	8gBuT2YW3hc86B/GQ87VP9b6kwbtvHgPDxDYefhUwc/koZtS8nx1QHSuxPe6szbfWl30jOo0NeC
	cEJAxYw8NfKUxXPHfl9Wr7EdHng/ZIkKCh2Ej6SZb7EnG3LBlJxmXnBHBQ==
X-Received: by 2002:a05:6214:ca5:b0:6fb:414:77af with SMTP id 6a1803df08f44-6fb47735c9cmr226038526d6.7.1750145440852;
        Tue, 17 Jun 2025 00:30:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMbriPPLAVF3Wu0uxdS6oEm38NLd3tCbk9/+2DP0ncJPG2QVg1Y0lymt3E0FVsTJWm8JGQbg==
X-Received: by 2002:a05:6214:ca5:b0:6fb:414:77af with SMTP id 6a1803df08f44-6fb47735c9cmr226038006d6.7.1750145440371;
        Tue, 17 Jun 2025 00:30:40 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08e21sm13260940f8f.52.2025.06.17.00.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:30:39 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 17 Jun 2025 09:30:38 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFEZnrMUH7qorvnt@trex>
References: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
 <aFBDzWLkKC9MWGoC@trex>
 <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
 <aFBNVjl4n7I+OkO5@trex>
 <c7aef6cd-e07d-4422-a34a-ce04c37ad2e8@kernel.org>
 <aFEPfjJLEMnIriXX@trex>
 <0d381ad0-85d4-43de-a050-3b9ed03bf5d8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d381ad0-85d4-43de-a050-3b9ed03bf5d8@kernel.org>
X-Proofpoint-GUID: veLcNqdvmq-eySSd1lGDcMjYb8f9kq8_
X-Proofpoint-ORIG-GUID: veLcNqdvmq-eySSd1lGDcMjYb8f9kq8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1OSBTYWx0ZWRfX4dp1quCxMjAh
 yjNVzgtcJ8/URXKz0rLg6nAmTA+P2iHGhmLrcwqjd0UK5QOUi/zgEu/OKHmXWul0bDH6n4UVErq
 UucqIukIyBjGFBkfIi/mnI9tItaIPQQOTl88477WJ6QzEp1tXWIE7heI6cPRY+rDe33bczEAYM2
 V0jeDsygRQdFdZA9AeUlkWxQQOHoLAEZlINEUdoWw51PrDEnyLw63RBo7zYYVKJTsy89a6AgsCs
 fKXChP6FmGHrEdXEn5lpVN6uR/1rijTFyTk9xhCEuxjBCohjdFIwPH94tG7lSKwXAInwAVVd9Px
 7busbSTvMvFtryeFpTW4tahsEoik/QizxJ7/HrRJ67k56aLt+69JhisbTDbjBheDHdm/V5FfLOb
 ZrGp798a18BV0GIKRcbUEpsru700mIPMtf5h9nyr4bfKpMcbGltdVLZxJ0iUlzWIpsUwLXeK
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685119a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=yUlweYfzrcrx1Bc2Vu4A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170059

On 17/06/25 08:56:37, Krzysztof Kozlowski wrote:
> On 17/06/2025 08:47, Jorge Ramirez wrote:
> > On 17/06/25 08:14:23, Krzysztof Kozlowski wrote:
> >> On 16/06/2025 18:59, Jorge Ramirez wrote:
> >>> On 16/06/25 18:23:18, Krzysztof Kozlowski wrote:
> >>>> On 16/06/2025 18:18, Jorge Ramirez wrote:
> >>>>> On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> >>>>>> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>>>>>>>
> >>>>>>>>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>>>>>>>> +  on Qualcomm platforms
> >>>>>>>>> +
> >>>>>>>>> +allOf:
> >>>>>>>>> +  - $ref: qcom,venus-common.yaml#
> >>>>>>>>> +
> >>>>>>>>> +properties:
> >>>>>>>>> +  compatible:
> >>>>>>>>> +    const: qcom,qcm2290-venus
> >>>>>>>>> +
> >>>>>>>>> +  power-domains:
> >>>>>>>>> +    minItems: 2
> >>>>>>>>> +    maxItems: 3
> >>>>>>>>> +
> >>>>>>>>> +  power-domain-names:
> >>>>>>>>> +    minItems: 2
> >>>>>>>>
> >>>>>>>> Why is this flexible? Either you have two or three. Not mixed.
> >>>>>>>
> >>>>>>> please check 5b380f242f360256c96e96adabeb7ce9ec784306
> >>>>>>
> >>>>>> This does not explain why this is optional HERE. You cannot use for a
> >>>>>> new platform an argument that some existing platform was changed in
> >>>>>> ABI-preserving way.
> >>>>>
> >>>>> thanks for quick the follow up.
> >>>>>
> >>>>> but bear with me please because I dont follow - why can the same logic
> >>>>> be used - it being applicable - and therefore result in a definition
> >>>>> similar to those other platforms?
> >>>>
> >>>> Because this platform either has 2 or 3, not both. Unless that's not
> >>>> true, but then please share some arguments.
> >>>
> >>> as with every other venus schema with more than 1 power domain, the
> >>> argument is the same one that I have shared with you a couple of
> >>> messages back (DVFS).
> >>>
> >>> verbatim:
> >>>     Venus needs to vote for the performance state of a power domain (cx)
> >>>     to be able to support DVFS. This 'cx' power domain is controlled by
> >>>     rpm and is a common power domain (scalable) not specific to
> >>>     venus alone. This is optional in the sense that, leaving this power
> >>>     domain out does not really impact the functionality but just makes
> >>>     the platform a little less power efficient.
> >>
> >> That's not definition of optional. The domain is needed for this device,
> >> the device is one way or another having its rails routed to that domain.
> >> It is not optional.
> >>
> >>>
> >>> Seeing all these venus schemas follow the same pattern, it seems to me
> >>> that this is the correct way of implementing the above.
> >>
> >> No for the reason I mentioned earlier.
> > 
> > So just to close this story up, were these two commits wrongly
> > reviewed and signed off then ? Please do notice they were also - just
> > like this one - new additions and not a change in an ABI preserving way
> > as you characterize them.
> > 
> > e48b839b6699c2268e545360e06962bb76ff5b8d
> > 8d3a1cb32124eaeb3f2efe4889de214d3b658d8d
> 
> I was waiting for this argument: there was something similar some years
> ago (but even months ago...) and it got reviewed, so I can do the same.
>

how could you not? two opposing schema views can not be right. If you
knew this, you should have raised. There is only so many hours in a day.

> You can even go further back. Take commits for DT bindings from 2013 and
> use that against our new review. So many different things were accepted
> in 2013.
> 
> You can take any driver code from 2013. Huh, people actually do! People
> still send .owner=THIS_MODULE. In 2013 this was reviewed and accepted,
> so I can send it, right?
> 
> And then people are not happy that they patches receive too much
> detailed review or review takes too much time or whatever other
> reason... Yeah if any review you ever give will be some day used against
> you, you would think 10 times and be 10 times more picky then necessary.
> 
> This is like an ultimate, super, triple combo argument against reviewers
> and maintainers to discredit their work. I will not play such games.

huh? You are overthinking this: I have zero interest on evaluating
anyones work; however I need to make sure we do the right thing when
merging this - discussing previous interpretations in search of a
coherent story is not "discrediting" but the obvious thing to do (do not
assume malice let alone throw straw-man my way).

What you are asking me to do is not consistent with what has been done
in the past: since those commits were signed by well known maintainers
just as yourself I needed to understand the delta as well as making sure
everyone is aligned.

I understood your point, but I also understood theirs as being
accepted. hence I need someone to confirm which way to go. if that
someone is yourself, just confirm it and I'll move forward.


