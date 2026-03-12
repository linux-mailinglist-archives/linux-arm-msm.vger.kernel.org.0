Return-Path: <linux-arm-msm+bounces-97160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKzIDKN3sml/MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:21:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B7726ED4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 104EC313BCBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBAF32ED55;
	Thu, 12 Mar 2026 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQxRmP7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJcrJSYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC332C316
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303623; cv=none; b=NHi0EPb+WacqSd6OY2Al1AGZJAxO3/nI+aaW5CFwxphJ3PDCQypNtiER6m2cJZM3ZdhlzGZaSU7JKHr5Dnsc12jPAgrlKNN/UYHRHRSHt4aP8stKUTg+4z4oOT38N3HRNmtwB8HzXDdob2JS5+JbDcBhocRy421qqfHp2ZZeEJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303623; c=relaxed/simple;
	bh=YIP7f4qN579W55j3EttKa5ARTKr7JhLg8jg9J0KDXH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QF3Y160hktZKi9lKVrcPGCZPkXEDpLp8lj8Tka5ctXbpUjlwbklQqDyuA9iXhn8VRa5kwM8sqA4yI79Ryv5whCTwwvDWreB4RiMCDA5uowpbJ8O1ypmi2Fg1H4BvTo9+MifY6c0MubMVsaIPzoO7ZZUg0jFx4Ihyf4beFqnPTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQxRmP7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJcrJSYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMpCt1922473
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRGNKoI3XzOmCahOVQOZ7Zt2GDZdozcsEjWlaOBsPyc=; b=bQxRmP7sHOBIQiGx
	AwAwvvBoxhZY6SSkOym0jsDg+aPLABTTu79uLrd0xRKDkm4RnVpBw0qXd+rTe0h6
	+2MlyhQhBKir2ygWMJnr8v4UddxF2j1vxOUH3WMItmw+Ng/Th48vEQBdKTQNWK+v
	y+asusuffH7bjIiwunJP/+pMfPWvfwShkKxeHP7dauBLkNWoguC2u5LePZwTs557
	2/xnRHuP6Pwplk+Rs10rMVWXvU/yE/xkEyQCok/VcrrYRz03iSCz31YpAzpiBCBE
	SeNWzIGkrlrfrP/eBuPRNXX9m5Ymp0wCjwigSS4fzpbfQiqA9+a//21PkV1/xcb7
	pcPqsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wse2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:20:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae59e057f1so10516775ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773303616; x=1773908416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRGNKoI3XzOmCahOVQOZ7Zt2GDZdozcsEjWlaOBsPyc=;
        b=PJcrJSYZmwS9SrKNdJ+HvX0sCK6EjsXimrS/p5A8J0GyCDMhJVzx4cjz0FIkMm3fsW
         1442J65c4ffqqquLUAy/bCWyJgTDvlGnTgrbkxRe0bS87zQJQPQDmUoN7HCtMf9l6xIA
         N9SRMR79AaUfLvZtqxaBHh5OiiZuv1mOlCJJDQ/6wVEvPb6Z0GZAqb88rIn2kO1AcAr1
         jx1Gs9TU4e0r28oOQgDsvmldE/IStgpDCGb1+lSZ89PWfK++RKQDV9CwHg8hxkITDi4n
         +OZDMnIK7unrhrdoigSXjISYfdLFPujSBHhRpNjTvw4Ku0SuImICo0u/G0/HnQP3khBQ
         uDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773303616; x=1773908416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRGNKoI3XzOmCahOVQOZ7Zt2GDZdozcsEjWlaOBsPyc=;
        b=ltGA+MvrYICImdhm7WuHJeSAUx5s3sNXNQjz2uszHYNW12lLL6Ov9RTnjAbpHIuq7e
         o6igssW5MTvtlHaurcL7qVjvQiycpM42ewcyvgtXkiRu0JVt7bLy1C63EYxUZufiZZQa
         xLncz/965PjPZfCzQ8mydoGu7iAdeSo+DQDxb6VAOJKLSVpRGJ4Cu8Dy5ixMuD/4ovGo
         jePIVKK+RyB8vH99SORfdnDmeTVY9z5ag4mNY5jzLytPe8m7bhDkJlXQFBu1uLq2XoZR
         uCAnvKUhOH9hQ1U9jsGhXY1cIF+bqYxk+02JqQzKu2StN0Fi8vfZEi0dNw4NckqlHjSM
         bCzA==
X-Forwarded-Encrypted: i=1; AJvYcCWYX1mv4fxqWpKQOF6zyIELiUDioPPHTcXJt661JOUquJL8bOnHEj0SQozHMCaT+fL2Snej64e2xzpVrTW2@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjyI3NnJjAuXwbNtRvY15YR36s5fuZ8MDRuVOrx384yWNc/wd
	VK+qiTOhmrSv6ehkRrciaCRQP57QO2/sbG6Rz9VXuNoNpy029aRemsjzcCWpxXzN3O6CUHxCwxI
	2Dv1SFAbqJRpl2KqzJd9ojUTf75vfdEWlSU1LetflsGzZtN6rnRzlJLD4AHxqqRsT52Uv
X-Gm-Gg: ATEYQzxPXOUI0H3lKx0hLwBmySXs6eIuLdlkx1oPtrMQ6wqdNCaFj0z8G3Jm5pY0C8F
	16IFXoz+43wlEodVxrjOP4gkn1HfKYBGlIoBj65r7PusKtMBaDb/Aq+35B4DIHSB7el3RRxk0gQ
	DvUWQngaZLk4jJZ+Gsr19UvqUiPYKdrIb2wo5WIHZbd7s31fCNkSVDUoaFdLpV14e53qii+01dB
	DB+RFn5XUwS85Qq1qvMOuOOpotiktvdFfV9wuY8RIrIrm0NMNxtGK0jQh/s9C/NZHuTlSTjH815
	IDD19bzKZmRhVPtbQ8MJZoF8/r/fmhq0wm3Zsrkkox8jLO6rftD3GsDxOvQJsnyWSuOQQzpYWj9
	LkTYb1a+IcKkc5m0H2Q9PL4zDLjboTk9MUNlhVYlw9DUmu0+wfw==
X-Received: by 2002:a17:902:ef43:b0:2ad:da28:98d with SMTP id d9443c01a7336-2aeae8ba653mr57061955ad.37.1773303615941;
        Thu, 12 Mar 2026 01:20:15 -0700 (PDT)
X-Received: by 2002:a17:902:ef43:b0:2ad:da28:98d with SMTP id d9443c01a7336-2aeae8ba653mr57061695ad.37.1773303615456;
        Thu, 12 Mar 2026 01:20:15 -0700 (PDT)
Received: from [10.231.216.91] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae36128dsm53495685ad.78.2026.03.12.01.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 01:20:15 -0700 (PDT)
Message-ID: <c4a885bb-6526-4f08-9187-bd6f1a10fb71@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 16:20:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
 <dco5knujhpt6rm6e2osfxsuqr4uqjz6tugkhvi7cnx5wbbpmum@ejjfx3d7onoc>
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <dco5knujhpt6rm6e2osfxsuqr4uqjz6tugkhvi7cnx5wbbpmum@ejjfx3d7onoc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b27740 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LBH5BBKA6MF4hw1_HmoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: V9KKjGIJCjP78OacrC7zdIibSwDUFj8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA2NiBTYWx0ZWRfX1SgCYDWI9Q1t
 1eMGw+eGFw4eUEkZEBSEUB8Vu6pyjpyjhscYcIWyIUNl5yXmooXp0+q/cA+nSj5z6zPiKm2ozZ+
 s92mD95NrzfVxTuBCc3yjb7eNjT2m0Is8I7AL+sZ7+p/xh5eQUZ1Lm5yexgwOW3i1oBEKFcPYAJ
 FrG5XIRUmUkRnrr+NFYKBY/fIQETkPh0vip1E6e0MNq3W9mPbu4UDoqKsSpWexVhe3FVZb6zuCg
 K242WOdlT4R7aIdN3THV5dZ6Mv3Z9ZiF58vTey/1aN6T4jvlNGoERgOju5yi9SsAw6gwbGdIw2T
 aSVbhPhpVwOu4ldA0Dxq0rbr+dgIrdJYEpbH4OhVNS/06tJB/RLeCJBgnA4bduu9QteP6bD7pRA
 bJE/++8CliBC24GdmQUgVnR/f/QtVn2eTE5z/9MMojp6pNac9DuSc638q15Qa9jsOzTORkJgAl4
 i1EZhsTcUy1yQrnJdoQ==
X-Proofpoint-ORIG-GUID: V9KKjGIJCjP78OacrC7zdIibSwDUFj8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97160-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87B7726ED4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/2026 11:07, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 03:04:08PM +0800, Hangtian Zhu wrote:
>> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
>>
>> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
>> mezzanine platform, PCIe0 lines are moved from WCN6750 to TC9563 pcie
>> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
>> platform.
>>
>> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
>> ---
>> This patch depends on:
>> [PATCH v4 2/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
>> https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
> 
> If it is a fix for the patch which is still in flight, then stop posting
> it as a separate patch. PLease work with the original series author to
> get it squashed into the posted patch.
The base changes are merged internally in QLI 2.0 already, it can't take additional changes. The base changes are PCIe specific, and this change is WLAN related.
> 
>>
> 


