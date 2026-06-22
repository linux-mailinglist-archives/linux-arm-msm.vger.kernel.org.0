Return-Path: <linux-arm-msm+bounces-113943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r0ZALc/lOGpKjwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:35:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB16AD480
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:35:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RVLiRqn1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TikzPBox;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113943-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113943-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8AFC3009FBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6405836D512;
	Mon, 22 Jun 2026 07:35:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA73655CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:35:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113710; cv=none; b=GF5RQ501Og8Ke7YPCU2BneXHORvvOLncuhTs1t8EipMGWsPvI2LGEoWp8YcLL5plS48sM2M6O5TbExhXk38AkqSlyDUgCLi9ATvOoWhm1L51rGdntwZI5vT6Tfg41AoFBWYp7M1oxWRtCYZEC+dOVtjA5mZirVOXlupweqJOKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113710; c=relaxed/simple;
	bh=eiI5cD8k2ipSLpc0njJMRUY2LdZCbvWpnnCkpiqTtcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVlBUF2Csn2KRc0gQ5Hj+f2kS4+qJcv4zJpX4rrIAezWnxKtu8pq1Ckb4t29N6+ey1d6rQzqddgJLKHKCT7C3kBxncn9I2NFmhxEq3BqxRJNfA2CnP7KEh/j+IkXqzy1OQPtw5qSpO1rJCtdUj4F87nVaLvarG1wZb/pb3+d7w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVLiRqn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TikzPBox; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59MbO3800818
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0no1m7POsI0BGgkniWdTWtOx
	qadJtjU/GaTYTTA+k+c=; b=RVLiRqn10Q8niygYmbrWTwjOdldWadZoMRCUyjld
	kTIzWMdLbSDWpgDAhDZJqy6s/ruDgBEMlAwvnbJJhJHDV7JKPuEfEm32C0K6iThQ
	5B/n0V8bppB4SrWAZmBQhMER1fcA7zJjgXnzEmfFRZX9m8evWO5mOc2ugpJksD9z
	fTJ/ONFIRlUDj7EV4FtrnyP/YE2TeNdZOnY8o3nISn+LxhT8NiQPBZeCr/pYFZfm
	pn/PLwG6HZzgChfny/1C12wWUb4Su3+VAuvbRyQBw/TRHYYrkwIYiUZ/GkqR4H6S
	JasetESJvLuJmTQ0zaoSI5leaSsiZlwC8cnUVp8m1u5n8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k55b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:35:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c896349fe5cso5689638a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782113706; x=1782718506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0no1m7POsI0BGgkniWdTWtOxqadJtjU/GaTYTTA+k+c=;
        b=TikzPBoxqOcbzpQR0gLjIUKjeiCWcW82DgtfwYFjm4HQCGqbC4nnUvD2WFWOFhu69w
         F32+U7LJir7Rvh9RSTceionsgRqarIi1PlpLWj75dgmBF1tLAYMZzFC4f1q2wBJems9D
         xLz5SnVDG3YVv6dIMUd5M0fz28b/HmAPJqBtRnIsMz/z7gHNGiG+qGchP5ONk88rJQbP
         LomNtwqk7V51yIYy9tJ4DiZnQyw85yji1A/hMR/69+ptdvgmYvvpeo69VpJ/oj4N6vZ2
         0mPExkiDaU7fzD5ntMKBzz6KxCGTl88BEuJhg7+gB3aBu0LqgGHKIL9CgGxNBxvEeKcx
         MITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782113706; x=1782718506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0no1m7POsI0BGgkniWdTWtOxqadJtjU/GaTYTTA+k+c=;
        b=JTBuqD6mWSPam4lPRoZeuAY3Ur1WCLSqsAuhEh0d57HH2L7Htlnc19hbqU4/qEP+aS
         A4SPI0obP0gC9Me6oMtGfURUu4PNEb3mltU1CQ5bu+Z0iY4ck62FxjMjhdaBDxfhLa9z
         BduUZp8Jtd+z6v3mcHAQM8+bCebISWlka/aKBgLs86JhpHLQ2piPqJqffT6qZBpqDOu3
         aSaE7jWbWuyTqnsRT/l4tw2OhtQESbZPGpIRV0TU3fDY7j1TvvePheu9jSc0nPnJH8at
         AUkh33MvlrI5qXyI98E6eTB0nxI1FvQI+sfTbNlSkJWs2JpAyJxG/r7vVDNPqe3LbEBk
         P5Cw==
X-Forwarded-Encrypted: i=1; AFNElJ9jLbBisElbClMicPyNrGHtQz/dhQ9Awd5qrudRmxPGYBDF39G5IpDKWBVzPoSbWu0McReSzCi5mHKEMtmS@vger.kernel.org
X-Gm-Message-State: AOJu0YwXoFhkdLBPqvvEjXd4meQAPehgSYUivAMItQKAuuYDIgW6N0GI
	exwufPA55u2wF9X0mqvC8xUII21mApoFBM+eNtGD6SdrbrLH6jIro0xXgVtZdejBOvzbz+qagDi
	lEx0Wh6zLOL474XS6GD/InDaeeD2LJ8fdF/YGvkiJuMUpn9kbuL4h2jvqWitS6ZMEg1tH
X-Gm-Gg: AfdE7clPkUqm3RQi5W2++5EDMmCBCM7nrNJqO39x0Wfoqulk7d8k9shbzhffIvQ04FY
	dv+W28h+hqr2ymXwZwX+RQanaVXqp8M7yIGM6U/Ysa7uT59dpaWEYmwQCh0FTeUEkKcEnrWR6p6
	VzpLpFNE+d0kk62/oQawVX8iKSsP+ykqg0T5KMcJLqbkBF5Mi/67Fz1+GlmpjcRQCwZ5alO2Hve
	A6xg0Nyi2yGoUHToNWpvASmQk0luCjVF9KyeiUbeLiFevBMgmcn6YpHw+aeRpZXXm91vnIQ6yTt
	kX1vLJf4pPDjD8M9AhjnYUll+tXl1FGt6TnVQ4t7n+T0shBoU74gGWMvXKJIKAxXCIGtetJ8L22
	smDvz5630UDxscuMSgovIHekOnCqrEfB9eR8e4LlnmX8WU60d
X-Received: by 2002:a05:6a00:4104:b0:845:4cb5:2343 with SMTP id d2e1a72fcca58-845560ac301mr13520271b3a.19.1782113706488;
        Mon, 22 Jun 2026 00:35:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:4104:b0:845:4cb5:2343 with SMTP id d2e1a72fcca58-845560ac301mr13520230b3a.19.1782113705945;
        Mon, 22 Jun 2026 00:35:05 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8dddbsm6607972b3a.19.2026.06.22.00.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 00:35:05 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:04:58 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <ajjloqm9eOkrr5W9@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
 <d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com>
X-Proofpoint-GUID: qXnp8RSZ90MDmhhfX1RX9LG-KtYA2-VJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA3MyBTYWx0ZWRfX5NDmvjnBn+YV
 mw/VpIA7e/2gHAb5pTSRlNG2cYUz39yxhZqVIQL5mldSV3luxGHbAwLpMt7T5b4j7R/O0KlE/ze
 lIGPDhTMNeE7qxfiPHTdVS7t0kX8Sm8=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38e5ab cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cYz2LKHLP3dAwZc2OesA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA3MyBTYWx0ZWRfX+5hVcuPppJhh
 dsBKQy37zmS/o1/2+O62404RuqhQ+Qc6uvjUAjOdpyPEHP9zm3voxdPGUiuS0KUxl7DjaZc6fk1
 hfvlnBS07eEB4Qbb8tpuIPuSUVp271fLGVHr9bwjMVxznIkIG2qn0J2nCoWt1Y7zZRpmBBZnWOU
 x19NXrLXp5g0oLe7gvJJtP233vcoSgaBSfR4rHH5+3fz5SDFvrHyBxy9NbWxVTXcPLC49wUlsjN
 5ELXC+hU2vSG72Kk1V9GAJhm2rUiXpy+fDA1jrqHWV3FqjrM3432FccD+cfjEseLveVjsN1435Q
 abXA8bLlpFl+WCPmlfE8tugrlVkS65lgkQeyS/2aU1ZjTaqDM7ucodQ0XX8Q+vLuZbI7nXG+UYv
 5tkcb8k8Hmlo7Aif4kiAkMDp0HDniTIG1K286bDyW2llgy2a57U2CBaE52ANir+7X9EiVoZwcjV
 JYEG5dxmJAYRkbsJ4wA==
X-Proofpoint-ORIG-GUID: qXnp8RSZ90MDmhhfX1RX9LG-KtYA2-VJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113943-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,hu-arakshit-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AEB16AD480

On Thu, Jun 18, 2026 at 03:01:54PM +0200, Konrad Dybcio wrote:
> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> > Register optional operation-points-v2 table for ICE device
> > during device probe. Attach the OPP-table with only the ICE
> > core clock. Since, dtbinding is on a transition phase to include
> > iface clock and clock-names, attaching the opp-table to core clock
> > remains optional such that it does not cause probe failures.
> > 
> > Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> > core clock based on the target frequency provided and if a valid
> > OPP-table is registered. Use round_ceil passed to decide on the
> > rounding of the clock freq against OPP-table. Clock scaling is
> > disabled when a valid OPP-table is not registered.
> > 
> > This ensures when an ICE-device specific OPP table is available,
> > use the PM OPP framework to manage frequency scaling and maintain
> > proper power-domain constraints.
> > 
> > Also, ensure to drop the votes in suspend to prevent power/thermal
> > retention. Subsequently restore the frequency in resume from
> > core_clk_freq which stores the last ICE core clock operating frequency.
> > 
> > Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > @@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
> >  {
> >  	clk_disable_unprepare(ice->iface_clk);
> >  	clk_disable_unprepare(ice->core_clk);
> > +
> > +	/* Drop the clock votes while suspend */
> > +	if (ice->has_opp)
> > +		dev_pm_opp_set_rate(ice->dev, 0);
> 
> The PM core will quiesce the vote as the device suspends, this is
> unnecessary. Similarly, the rate restore logic will become unnecessary.
> Especially since dev_pm_opp_set_rate(0) does not actually do any rate
> setting.

This section was earlier discussed in the patchset v4:
https://lore.kernel.org/all/7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com/
The intention here was to drop the RPMh votes once the device goes to suspend same
as the storage drivers such as mmc drivers does:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mmc/host/sdhci-msm.c#n2946
This was done to leave the hanging votes *on* for unused clocks.

However, I get your point, due to mean to say that once device goes to suspend
and GDSC power-domain will be turned OFF, it will automatically quiesce the
performance votes?

Abhinaba Rakshit

