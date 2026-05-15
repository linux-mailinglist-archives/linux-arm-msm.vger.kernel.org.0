Return-Path: <linux-arm-msm+bounces-107751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP4zKMXtBmrOowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:56:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85954CD73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5756C302F24B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE22428837;
	Fri, 15 May 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlIGxUNE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krZbEpqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9D3FE67C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836501; cv=none; b=a8Vx2mskwyUccv0PXuQtwM03HLAlDFet5ddVe7l37Ikpb0CHynFmLNSVEV0fqHSD+oRoWeh7OedjF8AHnpyAM5lhlX3vw/lbXCFqjbqXU+l+5DCFUiySr0OHbleBa4yA2uxBjStbI+JZ7EVyFwF1nmVIyHto85jTLxaGLzQbOBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836501; c=relaxed/simple;
	bh=g5kGUiWHPBmIFKNCVPz3TG21+XrsB2dThBEvILQdT1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWusLiQumEbWfiAzxTuF07XOpihlaqhfxzatueVF6FY5QWEIXZUwpeU7LvWEF2nwa1hcs2EKzHipNjPl7M7ZBy54EKf2G4NY37fEtjdXWDCvtO4yRUJK0Vh/iaCbd9ijcaEvMTWz21H25JOovYVTMiTSUULPQ54vxH7AU0H6fjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlIGxUNE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krZbEpqy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5QJJs3671020
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6VZQSmrRCmQeI2T/naPP3fN/hWWns5mcty2cli7xjw=; b=DlIGxUNEArVBMkFu
	oDsquN+MyKm+VvBPkSxCUJUo579qBoQUflfV5z3aY2VfRsLJyEp8lqAhlReuTJxS
	05dHmdhVH3B6xr74RnPKy4wthtfhlIHBq6dkP+Fzz9JWpfGDTbGzQvcE2Evlo/vE
	mZyfWPFyvu2ZbEeUXf1ae1RYCzo7TqRrYd7/2vbgYwkCDrKoeJ4ohi1i7LV74Vse
	QjsY11V5yBZU2stC8v2xUd7qheT6GgajaW93kLe2r+HC+RcVmVVIj8whIwcyzmHC
	AfUu47g2oNpn2sbPFdAg7M42vn/RFHZMXobZz4pdCo2/0wrIge2W7i47Iyec0H6P
	CkV5Nw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2m5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:14:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f85179263so10239228b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836499; x=1779441299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6VZQSmrRCmQeI2T/naPP3fN/hWWns5mcty2cli7xjw=;
        b=krZbEpqyZoZyMxDrqMxJI81eKWCqxd5l7tF8rM86TguhNJqtIya8qMaZDcEQqA4FRt
         8qO/UFnD61xKRwqdfebe6W30ZHV46DoUXvvgmUYZIudSxhUpsxrk4oqOI8fZdXb3uj6h
         LflgZech7ZQsyY6YITaRNKmMdGfm6y/uxWl5u0VaFMOEtznE5oNuxFnNGSSnWFaSz4FD
         Y/kNbO6C9lG8feNwE+qoOOI/1ejJLA/bGz7rnPng5rB43kZToW3iDXNYkjm5I0v8R5dA
         R/bkkQmGH43RXwDXEkYGuh4lQt1RDKqKsnC8wMnZ/yW1k34Bt874XhKB3z20JBWt0pMS
         92Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836499; x=1779441299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6VZQSmrRCmQeI2T/naPP3fN/hWWns5mcty2cli7xjw=;
        b=mHIvMYXF9YhyOeBxnlkbxPO6BiwuLlijSK4z3bzCdZWIAR9MoyYwM6mJvZ661nVbWz
         JHYgxLo97KK7rG7x6YDLIplVjq8mSUHzOBHYR9WQ6CIPXUmBqy2Ws+W+38SmXAvrL/Ug
         bGthFN4axowZ2XJGRvtgDav4kT6x4gjYW3GTbWiXzKtqzh/AXEAZ5udwEUXrMXVVmHrf
         yew4DR3VQDMtZZmcO9vXChZnNilH8h1E7T2I3J57PO/t/CPG0u7TmOhEvCbzWjgRrEl6
         1KwXCH8ajuhghP+VSrjC1GPVHRCuskTCqiwrCWygsABqT34PFsl2t6RijtPbce6Azl8c
         PQ1A==
X-Forwarded-Encrypted: i=1; AFNElJ/ergnNRRZ9g70ewTQp0h4HeHqGSkgpUGp9FgfodVpLu1UsAOed6OnoM5sg7NdkgNYDBipLiOFIGNWwNtb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxUW/01R7Hp+ksrsWkMmDqMUCfQzD5lbuHxaOeUnUbOB9lBwEBb
	06CiMD/p879VCAfdas6d3kE38M/nd1W25OeoGlpuFXEx+IaNYI7bd9V7YbTUBPt3UzkPn+25woi
	wFZuJcT5rjJo8dBT5HoNh3bNN4+fW7dRjcIE5iMzpKgvTaelqItfSdZ1u8RBSVa7FnbNq
X-Gm-Gg: Acq92OG8hpgevWGfSLdTxXgkNaRpq7QGmTUarEu/l4Er+ooDLyY3VsVKZq3gIcsm69u
	qlhz7AFnCzC6a4D+cgmJ2ZySYw4SKi/UJVzfbwAQIE2Ajosjb2PGTFbEZ6yIx1zgaRCzi2GwAHa
	RqEi7KqGdpCPiQ6TCQrL60tNhwGqyiC1GVWxAa4nMiyv551Z7Q4KqS76IxtcDf0M3HZGHet++09
	ccqKRfXQ0ezVmd2QaJPGCdCHRs6AymmiyFiiA2uzeJwblQBbETxLOfrmjFFU2o3ur7sLfap6mVq
	jzLC+bgPqnm8Ovv8KsGSB2TWBKt3DXtOh0aWaIhyc66VxJiq2SliKbIA5iofDYSqOAdUw3fLgnD
	uQKDcbX11hvUY5Id91cIQsXqbX8Bhn29Q/WcXWVHMIBJQ5s9T/7HBFae/J+rkv4FYDxLq43evSY
	C4QkaG9ymhkfiQP665OhN3gNjhJIkD1mqp6npwvNtj
X-Received: by 2002:a05:6a00:4193:b0:82f:a6bf:bee7 with SMTP id d2e1a72fcca58-83f33d0d040mr3612571b3a.49.1778836498839;
        Fri, 15 May 2026 02:14:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4193:b0:82f:a6bf:bee7 with SMTP id d2e1a72fcca58-83f33d0d040mr3612539b3a.49.1778836498353;
        Fri, 15 May 2026 02:14:58 -0700 (PDT)
Received: from [10.190.200.212] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197815cesm6391376b3a.24.2026.05.15.02.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:14:57 -0700 (PDT)
Message-ID: <05c377ab-33ef-44e7-8708-575647de088e@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:44:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
 <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
 <hc3bkodsdzq3to4aaax7vaeahhlrisk3iytuaxu46bjm37p75w@4e7c4a3gh3lb>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <hc3bkodsdzq3to4aaax7vaeahhlrisk3iytuaxu46bjm37p75w@4e7c4a3gh3lb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MiBTYWx0ZWRfX9IgSOOe4aoCm
 I6WKbNYc90dyWEyekiPAXQQJ/vwaQMAA1WjbxAZZUjFye4KmJJzgHUgGBpn4Mxc7vZKf+I8m9RT
 EIV3WLOoq7X0BIWeR+g5wRxWu6iSsuhqHcHUhvAltOy3fTuzsv3fjoagN5KOTDtbBSKdIbNsT9X
 r/RKyFf7ib+wADhxddsjmTZEA8EqcklHdeWnKlivbI5VrjlHxut0DmEkfZt2XchuieiMREKUmzN
 5JF3aLz7vq3n9MCl+E2tel2G3cVDVNVEJeFwvqjL9EI/qdI5/IHa3NDdgSfOqSqIgHabicXWbTp
 7RcNnzRDUIWorqIk5Ju/eSdFOPRDuGtWAdXiKIkXGZsegQmK8tsAkH3GLaGDzp0VvxX29a05R2B
 jHjmmuRETPhUCRN4gqA8USkW/yVF35Kl5xW1UMwcUqXsoyu4OrkHv2N0ECRp+dvvdyT31ERhixK
 XpvcSYmwT/EET7Ito4A==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06e413 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hMRrL-lH2y_pzHGVnmIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: iSIK6Wes2iKRuaTncjdAg1zLPLKo_D9l
X-Proofpoint-ORIG-GUID: iSIK6Wes2iKRuaTncjdAg1zLPLKo_D9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150092
X-Rspamd-Queue-Id: 0F85954CD73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107751-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/29/2026 4:27 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 06:16:59PM +0530, Gopikrishna Garmidi wrote:
>>
>>
>> On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
>>> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>>>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>>>> dependent device nodes are common to both Glymur and Mahua CRDs,
>>>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>>>> reuse.
>>>>
>>>
>>> Same questions as for earlier tries (why this has to be repeated?), e.g.
>>> x1-crd: Please describe here what is the actual common hardware. In
>>> terms of physical hardware, not what you want to share.
>>>
>>
>> Hi krzysztof,
>>
>> Thanks for the review,
>>
>> Will update the commit message in the next re-spin.
> 
> Before you respin, you can actually respond to the question. Do Glymur
> and Mahua CRD actually share those devices (in case of USB that would
> mean having the same baseboard with different SoCs being wired) or is it
> just "oh, this looks similar enough, let's create a common file".
> 

Hello,
Yes we've verified across glymur crd and mahua crd schematics, the regulator supply 
and data lines are common across both targets for the nodes in the patch

Thanks,
Pankaj


