Return-Path: <linux-arm-msm+bounces-112135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sW9mFbnsJ2pS5QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:36:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F155E65F037
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gJvZHNzS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="OlozP4Y/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 245023050F7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F303F4117;
	Tue,  9 Jun 2026 10:35:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684FF3ED5DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:34:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001300; cv=none; b=AVHgoEMAB4DNEcv+uSOc7m9ojUvzLwxlV5PjfyKf+/jqPSXm9ljrKVPGU2iM5jwnDCDJTHNL1p5cNmLWdtbegSTXvnpxcEmE/TEq6LguDBBqq6Yixw50OA4hA6CFrRL1FRIC1rnSrCzejaXoTAArga1vM7cc1QKAy4/9HtQORRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001300; c=relaxed/simple;
	bh=JtA0re8kidO3gfQkDn8ChGhRgxdcG02cRmDUFQXfcrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sr3uwvhDMQK1S3eul/Jt+amNwMdLKm2FsL/nu/jl4+yD5268rSTmI0V2loG/CVaAFSluMsPBgDWCOQBVabp55O6OZh442XYPKJQJWLHjOgnUpxnxVhn314rU0TbvCk5/SJaSNlCH5ohAZFrTtvz+88EAE3KXMHI8rRLVMa2YOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJvZHNzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlozP4Y/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vDn31868514
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPr84Bdv3vOiH6osuLFjd2Cuwh2MgJdCXKl5w0JclkE=; b=gJvZHNzSRI49RMSG
	7NfTKi7GFGAwCQ6LJNWNjXqHMvLvdSyRQCgqkxgjidq+JZBsGFI5805Z4wRaKvP1
	nIhPhzAmQPvyomeyJI0tDyNt/i87Q9hRA+wT+p2NE5GgBTlWvIMWB3STQBO0jkfd
	QA1gCjO1DxKoNk+UN4Me71NLjIgwh+D7X+q/PFW0BqwLbPXRGgjJoESKcAXgRVnS
	BxX590lG9/lfzviTH4JA0qJurpB7CN/rHBX4p+YXHYfPx0pzqDVOIddVC59xSXSM
	3B8oD7C5M04OgTvIosZfNeNEBq/k91iXUCul0FmaEIKLVw0jY/+Q+nu2NFGX6wzt
	cILigA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wg95a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:34:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf55c3f44aso49721015ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781001298; x=1781606098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPr84Bdv3vOiH6osuLFjd2Cuwh2MgJdCXKl5w0JclkE=;
        b=OlozP4Y/ah00jnADkGG1tUEHnHuvL+nQBeYidQRl1E6GYKQ2bnUTc6KrAVw6srjceE
         VzvDBJrtI8TCKemA2xpmEqxs7uI6hGBRpTrVbFNkLUpNpK8SFxSyX/fRwmij0Dur7kQ1
         DvBBZSrEgj3pMyVmd+VLH9BBALPxItuFDyKQmIetvimQaBwqUnkFWgjgEhjV6pX//HxA
         hEkJXH3xBqsQMdvjW2yTmQf51XqBSjUP9mxCyu22rgkLNK3GHgFfdYjo1QzcJDbBRSX9
         1/HKNGCrL2ToEs41cGGJdaABTWzU6PmoKGmYqG2xk+APJsMezm+XhUnaPpdKq8DG06QY
         nlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001298; x=1781606098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPr84Bdv3vOiH6osuLFjd2Cuwh2MgJdCXKl5w0JclkE=;
        b=k/blOj1CwSa3pUbpG94DitVQ5fTD2r8xPEDFtfZvyhQ38ma//1S3wYBL/6S8Ukv8D0
         UTdhOe9ZSiX7eT12FX/TMEcbxjcS1BP1hyc7Q2GYws1Z5h5IhMOBzbnzWMwGin5Vc3k5
         yJPJMMmvYv9xzGBqp3AUCw9kTJawyzL2lftN9I5VZZodcRurN8l5gitb7uzdJnytZQcB
         dbM65Ns9mjn6bocqrw+yVFoJEh+rxRfXgXG0c6ez6NCEgz0slkIaUKcCjicn7LFM1uXZ
         nfK9G7jQF/5nsvPpL/hlqHMAT6idilDc1JDv+jnWW1DN1rjnZvi7dfP0Kp0QZizGQZuG
         YCAw==
X-Forwarded-Encrypted: i=1; AFNElJ/b5D3Y/tzUw1C7TudOsooejNZ8c55bxlSxh5pysfaaVWm6MhDyk4RNgrbsylOF46HTiVVwOypTgH9LtTN6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnwsm0KW2Z/x4EyJp+4qXit2iv0aRibjbXl7drh6ics7yHYkV9
	19GYSgqcEAzgcsYSdOf1bIif571KP/X5dGbapZLOPDW03LXiK/96CYco99nrckE6fwDSsZv03F9
	oYclk7NsIFur9SM1frSxU77WM8hVU8uS0Qo3qMomjbe6VaSziN+f6M9McOlWuYCtspfbv
X-Gm-Gg: Acq92OF4pK41BIBB7WEaieXv622FeU2osQVYp/WcWB3ge2daSwlCbZgsNXjc5wgkt3B
	yN9rGCWADIB7e5ECO1CFOzNBaR02emDrYEq2yRejq/L6Cmh6vm+whRjSeREog1qToNBHwNp0Z1v
	CSO+8ZxqERsq2DOMYNSgcDNYAg/h+Qv6pHR138yjJS9IsxM8CEX/nzV2waCh9vYGDM79Ekl+yQ6
	ejDgUw5h/EuJrFkAoitso6cRa1w+/M93jFgXDJCGOYT/Cw56C9+4BVYy9csj593mmRFhFe7vEE6
	686E8HtGV1pr+yUrqCBffS1Iwyrs95WHXSzMyBsjLkVm8W7G6HIVzuop37Wp+pJx4Mo1vMk9JXj
	/YwtpkGSnCBFs5Vh87BFcCvkcOVAsCxLA/nHBwIZ2BEYnteS999hzb6k=
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr177538855ad.7.1781001297850;
        Tue, 09 Jun 2026 03:34:57 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr177538505ad.7.1781001297298;
        Tue, 09 Jun 2026 03:34:57 -0700 (PDT)
Received: from [10.152.201.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d042sm217458055ad.60.2026.06.09.03.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:34:56 -0700 (PDT)
Message-ID: <89a95a6f-1dce-4141-9b7c-12d7ab6bc0af@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:04:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dma: qcom: bam_dma: Fix command element mask field for
 BAM v1.6.0+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, lakshmi.d@oss.qualcomm.com
References: <20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com>
 <agyeh4PZwG0Mu6Wx@vaman> <aiFXPPXtjCHj0Ged@hu-varada-blr.qualcomm.com>
 <5c24a3f3-a4c0-43ec-9653-bc374a9c5e22@oss.qualcomm.com>
 <6qkgzmrr3oxzj47so4jqw6gk6stzjkxbnaflajk5zw5fgf65cn@yj3d55p5b7do>
Content-Language: en-US
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
In-Reply-To: <6qkgzmrr3oxzj47so4jqw6gk6stzjkxbnaflajk5zw5fgf65cn@yj3d55p5b7do>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5OSBTYWx0ZWRfX23cHjzBAGj2O
 9rRbF2rrBud0cm/I3UoFyDVy7C7/IYwPqnuThlTtvvxGCfukAReLVkeUWyBd0J329KLNnICN9e3
 8KBu2vwRQiU7mGEMV04ELneBortuSrn1Ptt+LyQu4Rr5161B1ASSCkEotwOWAOtkQF1LhgByIBL
 BBUjJUYmV/GqtJaIt1+7Qxrd/9AOfvGYhIGor0+L1Bb1KoVmm9IUe/tzvXB0E9IdJ5ia4IAXsqV
 PM+6BvPb9QovdcljBbrFXtPhrLW/F9DqBgndwAMRpFiocKHpj9csU2tEiU9MMFtQ/+rYd6VctTC
 jLTQCyyVSOsP/dLcCm9yjc0mm4oH+D8OdfZhLXnRqOI2PeCbzgB//ixPANUOwOVzImRVnYKQeyC
 TovIu2BrAbXsTgmnI1mSEz/ZtYlQraOo9EUmxls7w4WzaEo5h72iwGUfe7ylSpFOODgsin1YKZP
 aWPJGcIPZLy/gJWfIIA==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a27ec52 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=I2Tm49LE0oniHcX1gG8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NA2O_Pm0c1-8eB8kZhhi8kpx8kBwi49p
X-Proofpoint-ORIG-GUID: NA2O_Pm0c1-8eB8kZhhi8kpx8kBwi49p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112135-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[md.alam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:absahu@codeaurora.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lakshmi.d@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[md.alam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F155E65F037

Hi,

On 6/8/2026 11:33 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 11:20:01AM +0530, Md Sadre Alam wrote:
>> Hi,
>>
>> On 6/4/2026 4:15 PM, Varadarajan Narayanan wrote:
>>> On Tue, May 19, 2026 at 11:01:51PM +0530, Vinod Koul wrote:
>>>> On 14-05-26, 12:09, Varadarajan Narayanan wrote:
>>>>> From: Md Sadre Alam <md.alam@oss.qualcomm.com>
>>>>>
>>>>> BAM version 1.6.0 and later changed the behavior of the mask field in
>>>>> command elements for read operations. In newer BAM versions, the mask
>>>>> field for read commands contains the upper 4 bits of the destination
>>>>> address to support 36-bit addressing, while for write commands it
>>>>> continues to function as a traditional write mask.
>>>>
>>>> But this changes behaviour for all versions. What happens to folks on older
>>>> versions, wont this break for them, if not what am I missing
>>
>> It will not have any impact on older version of BAM controller. Konrad also
>> had a similar concern. Please refer to [1]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/2394e63f-1df7-764e-5489-3567065707a1@quicinc.com/
> 
> So, you got this question once, have resent the patches, but didn't
> guess that there will be the similar question from other reviewers?
> 
> Usually a question means that the commit needs to be improved. Adding a
> simple "Previously this field was ignored for read commands" would have
> saved you from futher questions.
Will update the commit message and post the new version.

Thanks,
Alam.


