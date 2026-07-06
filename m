Return-Path: <linux-arm-msm+bounces-116758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wkBsKFyhS2pjXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:36:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 150527109BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:36:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ENQWdUF6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J/fYGRXA";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1361831A006E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00E63F1AD9;
	Mon,  6 Jul 2026 11:08:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D940E3E1230
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:08:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336088; cv=none; b=sx9BHTGMihBmbnp2TDL1ZGgoDP//8feRyOIeJAO2rPm+yOno/hyiHE2mEHrd5HpsFkCyKoj5vj+sd+eoBmEhEgT3/RZY/3PbaVMTERTumYEWEJtB2vFeTa1T8Jx2u0sDYkF+RoKX/ebIHuqw8n11UVUrwx5a0NPVftosGLG6rhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336088; c=relaxed/simple;
	bh=lnCRP++C8hi3TQVnzk2JF8NMeYP6Qggb58ii34Am7s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pb6A8URwK/54iBOPj+ukctX1wuiiNXFZJ9c2h6PiAkyp5wxtOEw670lzgM8hGwgwNIDLvhl7V58wELlCGBpwwRAlECYyI1UmDng47/XZuXTS9VAvZwENnayp4iY3N3v9oto2i4y7BCYh+nFdhbcT/CS/NuVc8FboHdGwnf8n4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENQWdUF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/fYGRXA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax9ds391059
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=; b=ENQWdUF6x1jx8yL0
	TK34NknB8KymeARAmE8QPgyereYZDw3jnXe1q0/8g8VIFp52NHROi3RqaFudgQWB
	5zhFcvneVdsjzC4lAtz+xN4hN8soi0D0zrkeozEht9CPW4BSfkXXGS/jD9U323y1
	/ogrS24EEAoedojh9FLljIPmZiPkg3Je1RtIU/U/X9Y9YxRXjiwi5R8cE2hJs9XK
	pm9NYzofTI9ptS+Zy118aqiLUxsiF0BAVbr5c+zxiNtevKsFrT9hHyGN7ggwLDOs
	TYMKWyTD5JQoP8CysdFe+g8AbOM/w9G0UIwT4QyYEOOxbQ9xwEiHh/esOHlx+YT6
	Ywkprw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrdps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:08:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so11420511cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336085; x=1783940885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=;
        b=J/fYGRXANYlQ1HpMVlCZORBi4F/OOFccPjF+EXOxQRw/b/MizcG4uRwLBEM9ErxYdF
         HPO+/cRb0ALLMDVxiIorlmaiso0qO4g3eqvubB29uspC4E+pFQy8wjNeevWNpLi0mDZg
         D+Q0A1vY2eqdCnEwDe//gzHlR1nLeBsvJYH85bSVf1hkgO2Q3G6XZ3lH/gRGZFbOVrYl
         7yDqC0VBmicERp5SSp5SXZLNARwmwdaHv9RP1K5PFawGGwNJlW2gtZxVNNfsLiO/LZ29
         wqoy5HFPNqic2Bq2yWfAfI4dPlwFfQhc0FOJ9sjPWxCTgldug3HJ8RWC/g4SaxYW53p3
         dSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336085; x=1783940885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=;
        b=Lb9PryIKClM2DYq4hWuOo03/DdEG3sBee/WgUtxwGbYavb1pPZ2jzF+Cf+A5sGSdaW
         BNySOVTMETSK8tgikICMOvTHaKF4WISo2Pj2vvi1hmliPUaH60WtIkPiJdTE6jQEf7XQ
         w99iCsWopxns6EqDjAV8X0tMN91neHfo0dJ5X+R4BGnb8gng6BmO8DKb6UhRC98x7S4j
         ebTrgcSTLwXBYG+yFaqzt3WtkNiPAAU4PKRmzHJJaXJs5+rBKTdeBvPSMbQYB5gmA/4S
         tJS0TCN0UAOyKMPQXkUdxXoKt78FagXgg9/vppvAhpkXqBUR4GH77qhVGZBgd87GuGU+
         hxSw==
X-Forwarded-Encrypted: i=1; AHgh+RpQ/M1v/cQJd1m2CrhXD60bot1Pce5e/ZPK9ylRmfUu+PfZtLoz3W87khwQicU5Z0VKt9OCBoOSXcrL5/7k@vger.kernel.org
X-Gm-Message-State: AOJu0YzJBbURteBjS73zRS+ZZTDsOmFuexK49bwXQXDkRmcCVeiVq0te
	2TxeR7RRSW5GqFHKaot4VTVA1xl1o2hzSXZDfQiP9szKtYftL+8edwQPGNk2Ko/AEutzOU8IZGi
	9RxVfMfYI9x7dxH7MzzZfaGWdKD+ekZunYWvYq10OJ8c4ZvaAXlpvchjoyRm/cj8g1L2p
X-Gm-Gg: AfdE7cmIuRr5WPDNCEQV+uoD7gQlU3fSnb70lbDtbMX0XWHqry/HKXgJ3Wksj8Rijhm
	/h/5YfRPAoOAlEagYejq1kMmW+it3oEFGxEy9JpL2me+tND4MdGvJHBH4iwQ53qkNAKSAYLI8HA
	2XXZsRfJnZ+7VVSQnbtHms2CHWYsRN6JlZ9ctCqOh8YuzX+fEDfoictLGz8gl37K2GdqfKYYFJ9
	AZ6lTKNVDZG/2yOHF2mNJulX95GEJYkdt2fCUHmoyYpZAnQoxoCuToSgV9Y/+AjOsbsrIJTf1JL
	tRSxh0w7k3arg2dwVA7s24B4CimEZDXZpKs537ISk64tElrWsCtbPGT73cmaas4E+Lr0xkVScII
	WH76NmVMPrNY4dGdrLOSoWfz01bJHE/NDpXg=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr88275281cf.8.1783336085172;
        Mon, 06 Jul 2026 04:08:05 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr88274771cf.8.1783336084718;
        Mon, 06 Jul 2026 04:08:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1c7sm723146366b.30.2026.07.06.04.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:08:03 -0700 (PDT)
Message-ID: <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1S2Yk9RQJQKPtf-B3J9OeArqf16EfJeD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXw7lDXmtpEYmE
 mM9altBGeNRT5Zc7EZZlyqKeCLXZM3YpbvI5TxJl1vWfRY4tEI9wWCiM3HPHFh96+ZcCgxggHOZ
 +YihseixZxZ+A+DCcU7yzsaYdEGMURYaW3wr9F7eVhjbgCnHcIP33ZReSZ0gtUsF9f0JdLX3djp
 dYn+Exzk6K4GCI2Z9odtAGIxMnqGpXY0RWxB7tKMMvxdIqs3uFj8rHqkTww2VET1mok3akbpdGd
 d9V9Ma13vwQLSWQGLNDsw6AFY72GcsHiw/6sNlwcnkhqW4GYPqFPRkMM2cfoEbkkXV1hICPr7iz
 7xf99HfwCKJG1V09aS4JATFo+SPH9t0PI+jnBEc5ANjhm6+P8HJCDjZ68SuFiBu2Czj8xv2086F
 dcT6+bPmQfQ7magZWR1e2cbeloO6Qf/72sD3MrjwaFum1GYxCITtMQZMpHChCTLT4nFgLm/IvtK
 nfQw5HhmPJQGaskTGJQ==
X-Proofpoint-ORIG-GUID: 1S2Yk9RQJQKPtf-B3J9OeArqf16EfJeD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX5ACaUXt8BskS
 5vl5xYxkhZTuOjVera5g1JtU3FDIGmlcNItGPOmedGsse+z2pmc0Kf3i3R+YOEFwHayt1lqovVa
 oJ1sI1S76xLkJYUrl5Q76BJcAV9+M90=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b8c96 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rL6LpJHDE9oUo6aHBFIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 150527109BF

On 7/6/26 1:07 PM, Konrad Dybcio wrote:
> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>
>> Add the nodes to describe the GPU SMMU.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index c5635f22e2a7..e5b8377e6c3a 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>  			};
>>  		};
>>  
>> +		adreno_smmu: iommu@3da0000 {
>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>> +				     "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <1>;
>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> 
> 674 is the correct globla

(modulo the issue i explained below)

[...]

> This list is not quite correct. It must be sorted by the context index,
> to which a given interrupt corresponds to - the driver relies on that
> to give you information about where a context fault happens
> 
> Moreover, I see that the interrupt sheet has the bug where some
> interrupts are offset by 32 from the base vector, and others are offset
> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
> out which mapping is correct with the right folks

Konrad

