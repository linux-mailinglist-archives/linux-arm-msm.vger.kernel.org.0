Return-Path: <linux-arm-msm+bounces-108119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHx/MwDGCmqa7wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:55:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48575568325
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 585CB302F40B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707A33DFC67;
	Mon, 18 May 2026 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb+4VQqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9qzpSmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5C33DC4DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090638; cv=none; b=QklmWiPw2iZdnINCMHn5Ay5T5ttcstHXAhjnkYLZWxwPngqDkf/Yrh1JAe9LIbOi817JFbl3kfDiNELOCEaXvg5gElpMlqgWuw/4WUce1XShNvHNrFRCNcZqf70h4wDUCK434g/I7zG5tFc3XRAvxGMUCD/TZs4YXFBSRbHGPMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090638; c=relaxed/simple;
	bh=e42XBPD10MnyssBj+iInx905f6nD7LR/IYxUEpTUH+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBi3cqGJLz8TevfrEOgvJV0Qev3mRPoG4xmXuTbCqr7DL0e0+AGsxLeX01bJuwRtAf9WEDqUBpffVzudBpr0EZeEJPVBrgTM56V6FosiXZ6t8RwLo0D0OYq/KCvq7ucnot2x8CNbgL29hnu4awFjvRg0e+mT5SH6yZNs7xW/PLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb+4VQqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9qzpSmX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6bUad421525
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJBnHUl957hvKo+iTLPq/Vl5eWX75Ini9s2OOopk20Q=; b=gb+4VQqk4SDMUVAP
	8X2nIptoppQf4gkU6AIYiy4R0F3qV/gQYIl1eEqsnfKjXrOAq/EJbLFCAWM6p3id
	J6ajsxsIGRYxC3VbhLhACTWgUq42gvRyWnstqSPUD0VHRgUL6gLejmBBOQ1lK2K9
	aJW99VWZsoeVSnENfGjQt4JLpypoSS2skuMVDCMnorY0zlgs56UnWDyjjcaAOGRv
	q8H6DP1QmtLBDBAJn/YzuTsfZyd08vqulpz8vgYF6vbXUeHPFfZVhkfBzQqEmPaQ
	LQp0LlFrWV7qOG9UZ9sMX9gIz1UMn7EjHdUTpplvl+vk23PsrsQw8SAjI0ruy0sH
	Ho5Fhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcm5j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:50:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f04f07227so27504485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779090631; x=1779695431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJBnHUl957hvKo+iTLPq/Vl5eWX75Ini9s2OOopk20Q=;
        b=N9qzpSmX7FI2E7/3x9w5qM+R1cLO1wmWCIMKkKaiplYG+9qcwGD8NoeVUCFGRa+Wx/
         u80TAG1fT7dyER57tFl2pgsrppoCHdACYyY9rOUvNjWvlK7GB0gPhNyOlwqxvCt2CXr1
         omCtBsG4VizmQjeRhdTM+U2IkE09VmDVFBbnC/hXJj7zenp3RTTHnpWe3Xa1EZfW0yoM
         IEpWTLraLkcCmKzyBktv/kB22sLygA4i5z3WWUO7613+jODRJgNhKWzMMiDEbYKTQ1Pq
         LmVYjmezaEz0UmzC4trDmufbAsf1jDqWfkNT+xNUUZaxOImdRHULmiYqztYRGNECaN5G
         lWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090631; x=1779695431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJBnHUl957hvKo+iTLPq/Vl5eWX75Ini9s2OOopk20Q=;
        b=Ijss2RsFrludcL3pRKbFl4LkE9Ud0uCIb0lMgafrIPxQU6cQQO53Q8AA3Pavvjb+CA
         PqNc7s0jBH1u88mH6eQeacEyMQy3wPOLeQp9iskyDpQqsOJdS5dBPJTEydDFrT2pUMIv
         4BaNmCBpN4isXdt/chKq8AC4ZDJSbPnplR855UqeFdubnuAsoFm5aVFHsdI628wgAsmi
         8IDxHZHfgS5FQBi+PWdkp1KA3WD5/aAA4wAHWyrCOH0js4TcKV+IlVa2fV3f8l9B5ziy
         I7t0tVKwuRW79M5WfAp8XHrf/4OmkUx+oFgEZlaafi/vH1lSmzmhwLUv7WWy30+5KOO7
         pwcw==
X-Forwarded-Encrypted: i=1; AFNElJ86bYO0NF1PYopJ9jiD7pcz92PGncMm/vw0lhTgqBHCZ52ejwK3Zj88/nQKOQ8IIf2KHEkRiD6h/Feou043@vger.kernel.org
X-Gm-Message-State: AOJu0Yyebci7naqmhPe8sjbM5EN7PrnYO7VnEUVS8Q8+Rj9oHdJzBOig
	NmyqUgbx+Ypp03EDfczr0srP7aQQ4pjAsBKqHU9WMK6/J4eZkV5iHcdWVAdDutYWCkrkcO9BPBl
	Jh4E6rDbyMwjhdo8K4ybu2sU+ljDjsA3YvWl27Zif17JZMhgm/nsOC64GE/v65E5tmZUg
X-Gm-Gg: Acq92OHXbRfCIqgLxnZBb3EMhy3MuLYOW7OqKiaehSXhsqQYwI4IhDvGIoANOHMImcl
	qJp0SpMQTSvDEG6cHg7liqNPCQNJ7BnQQZI30pXO2cxE+wFpzr2NzyhVe6DXbsBRPK/Viz5mDvK
	9rhemr7OWqcMTdoX46spHoyzcMrYD3z/4NnJuqGP1/I1/vRKx/GhPdhcASatmgFBcsGPW++X5DD
	bzbuTHC170eA7lAROOhuFLjvt0MqAZdkwwkGLvYKltpkb6eRCr0Mx3/1QCX66+oTzfK+p9nUER9
	eXmLlPXQ/Tp19NGqpQiRc8Eutdluxdye+yvNyMrlDxmZyhM/jQcaDdSXsCR4A9acOAcrzrIjGpc
	KF+l/9HwNF78DemQrZfhiJWG/FuLpiY2b9LQNeheNnbbe4Mo6NtOO8JAj/knhI0q5e6hYQO6Cgs
	9hijk=
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1481345885a.1.1779090631454;
        Mon, 18 May 2026 00:50:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1996:b0:8ee:7878:af34 with SMTP id af79cd13be357-911cda511e2mr1481343685a.1.1779090630941;
        Mon, 18 May 2026 00:50:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6834ba6af5dsm4592787a12.14.2026.05.18.00.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:50:29 -0700 (PDT)
Message-ID: <a7278ad1-8315-4efa-86a3-c42307ba041f@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:50:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
 <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WZr__Y62k9AbWq__qbVge4dHduFXxmeZ
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ac4c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=S0HaN-TvR45hvm6jBKcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: WZr__Y62k9AbWq__qbVge4dHduFXxmeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NCBTYWx0ZWRfX4EJk/dfy2thG
 rOiV8DM5pJJVA4biL4qVHb1oiclIBKB17B9pWnqhOoyQLc4JkSG0HYhmZu47OHQlMwIY728W/gv
 DCpdF2K9Xrum8Rsu6hmbW3FEOO63UML5ooKZPyz9blz66SDsEXz/BOrRFXqZxFurB9dd2BvM2gP
 rUx0TWwbJl5pH4/YSjYaiw0cOQIU0vMHuDrmCoJkd5hVX3XyJqUDTH/Yj1M9NG5Ccp+Nhvf/mV8
 Df0HGPN0cwIHvxQhIwjgNU5JGSDSHQoMhl1AoKJEzoxJCGbzXq+5mkoAl5xjlazEMaaXi+zWkYc
 eZb3/JxT9LWDecrT5GaheGPtx+eUd+1DHwEe53OaYeBK0FR79O2YbiEFOzPhgE4KHAP/K9b/BS/
 ezTJamn4TQyR41GfeQFDN6ejw5XjSdzp3zUs4nUpACfVUaMKDZQYaQw5DYktNtp8M3Lqqjxh+pj
 DXX3k1tFdb4XxXFYgkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180074
X-Rspamd-Queue-Id: 48575568325
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108119-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/17/26 1:59 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 10:53:56PM +0200, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> The usb0 port didn't switch to dp altmode, investigation into DSDT
>> UCS0 device resulted into GPIO 100.
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>> This patch amends the enable gpio for the usb0-sbu-mux to the one
>> found in the DSDT file for this box. It shows a list of GPIOs in 
>> a certain order, and it has 2 buffers with conflicting values. 
>> The one deviating is in the second buffer, at the place where one 
>> would expect the GPIO for the select pin of USB0 (by pattern 
>> application from USB1). The GPIO previously used is also there, but 
>> at the end of the UCS0 buffer structure). Changing it resulted in 
>> a working dp altmode functionality on usb0.
>>
>> This debug effort is a result of work / testing of the 4-lanes patch
>> [1] on all available devices. Independent of it, it enables dp 
>> altmode on usb0, and with it, also 4 lanes, making it even more useful.
>>
>> [1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> P.S. Might it be that you need to set both GPIOs? Might the other GPIO
> be related to USB4 tunnelling?

On the CRD8280 schematic, GPIO_100 is N/C and there's a comment that
at some point SBU_SW_OE_N was moved from 100 to 101

Konrad

