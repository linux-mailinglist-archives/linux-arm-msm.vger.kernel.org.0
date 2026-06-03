Return-Path: <linux-arm-msm+bounces-110889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fnyDLWi5H2oypAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:19:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7D6343DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:19:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tz4k9u8e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZSe6Xnvi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639B6304808E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 05:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF7C36495B;
	Wed,  3 Jun 2026 05:19:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61D31AA8F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 05:19:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463970; cv=none; b=C5PrcpZpd8X9KbOhrmAKpwOVSdLv0rrB1BHKZ6vPvay35hRr6ic5HOX+lgzOapTop6EemYfjKojNgW5/cUYH86DgO6Ud7aCbD2akT6gBO9lNS81vLpBCVFRiqJjE72nIJU2JZd3MgsIIV5+Fw/UW9wzBvw18cZEbJIukj5dpk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463970; c=relaxed/simple;
	bh=ernpbc8mYW3pnQ6ReVEaUvPZ/tMCJlEDj12Fyv3+pSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uU8bdu/4IiXV/42BGhXKXnT76YF3QvYAj2lZNDNHt5vCaS6lTlB6PKGGFIG4XbFjDuEgZuO87t7fyU/s9/C/1EUtXgHgDsOfM5XcCSo9URIk4z7xJsHU53VFzdGGsAXf0T7qbhVXsBlSuZZTCWc2oDIDSvNYnArSVzxEmCm0/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz4k9u8e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSe6Xnvi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6533goUc841627
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 05:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=; b=Tz4k9u8ewVkJrO5B
	99GB3NoAxaV/ZgnBI5djpO9t9CiuxBOwWbgiYZ15Dou2NkfUl8fwbVqvcH43VPdv
	CbvtGdm5wm1S3ktWSq+pyilEiuMMVToFEPobSTan3F5560/XS80pGmmVW5AVHTka
	O/8ly7e9RsUFprK66xn7pC6IE/4WSSuiMoOzXQeNBZA9BdpGzL0Ruv7bIJaWERnR
	odTUeR0vun/2F2aJVwrX5Lj/iykCVQFntqTduXCHhVjh1peZZaYQhw4J+Ygb5VP+
	qxFlqBpRupSQbHc59MIYsSyr4/NOmG4Txf3R0iRg1a5Tb03mfXePTk1nxr3pyR1o
	J6EcXQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw08pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:19:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so4028182a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780463966; x=1781068766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=;
        b=ZSe6Xnvi78f7dpCu/YQ3dVcyz1y9UvPqCPjRXeBmuvNrME6bADNhAc8G2JvM+zsD4W
         M3md03KF7WH5LuddAH1xANrgxB1jLds+y61j1pDQr/Se4zl1wJoMNSWcoCWs8iqi9Gq3
         GwhKMcMMkHAFGUIblHf543U3pMHkX5FAWke3OiR98Qv+WyaZepqGjPhYwsVIFYAnKhae
         cPz9gX6PBn9Q6ir5///3r5BBULeWKqJraHZ/fOLhLhDYi59hg8wGVnlYFXEky5DEQ0zR
         3rM/nhnRPltXzIUbl/f1Zktbn18asrgv8tfS24hCxE4yr7Ls4OAwCEcVX2p8ean3Ib9Z
         GQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780463966; x=1781068766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=;
        b=PrvxBdOZS0AybpelNaUV4LAPZxQYEuPZBYDg8XF5PQvdyVNeG51kNwcIXMjDqRGrg2
         PdPwzomrTim3m5YkHMjx7IFVj68k5m2K5811jFKmw8+wJtSyRTptoHU4duRY8Pj/tBMI
         vkixFpbniRApI9tt4F1hbxdIQFaq+p3upZV8fi8Bi1bIyb1GlZSbLB8TlxxHtP780a0c
         l4Xhgm2eXwgoQ47uVQcFtR/DURf0MMBNA0dUPFsh0RvbTNMJpdjrvBW15P+JY5elglc/
         cR/UWHC0LIX7vzG0hfTsbE8m3Ni522u1kVNNgjHC7LmeB3D7gUOynq5lhRG7ksRut3wt
         WVFw==
X-Forwarded-Encrypted: i=1; AFNElJ/OwgbmrLTrxNQ0k415qUhvce4uZ8ItwzMma57i89qDcyvfbLFqIgiCdKT4yTEV5Q1kb/izKXzR4O+LEcAO@vger.kernel.org
X-Gm-Message-State: AOJu0YznJRRi43mAHwUiGIwdS6VwSRX9ivFP/9nEH7Shr2BEzoprYRz7
	gPCCl8xxnVCCe4DRM1WTLIShj7dxGJBSqzEp+i3PN95SpcpQgG0GGkvER7dhLNDXPI8LV7Wr8bk
	EXZ5kwVEbqwfR5c0dUzTM+5S2xQANnBAfdSGdF/eBv18RCq1Egx+6x+TRNBqe4PIfL4hN
X-Gm-Gg: Acq92OGT4hWbQA+QOLs8OsP8Mh5x04T/UULva9rxpcfRdiFYJHCDxaDtZ0OEsAukIEr
	emOXbUnlkFjrdwtu/aYAELJ7dNoIAxs8KUHh/NZhJDhYySEoQzekuWrd7JZYRRjQhH2B/+EiD+9
	ROtr3vx/GD6iLBbj/DQ2tEIQUcqjCKhFJoErra7R64cBOrtdbfAmhoxtR/MukCF7aGQun0Yb499
	BGiCNOnw7SE8e140OlQu2R823K1hzr6IbD6wLa7rwXLJgSiCUuzPZY7PxvmsztwLTPm8m7WaxPC
	TScYZdMVh2xYQmksTTixY/4/b2nS+HqqId6HSjhvvarVwSQ5VyaZr6ckoVpITBxqfzZ8yB3H8cq
	TS8FRmcCXD8D11qHUUwrzfiJuQhRUjaR1PmIdIa4QMqSGlNXlz3akEj746Lxr
X-Received: by 2002:a17:90b:540c:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36e2f3c32demr2076752a91.9.1780463966262;
        Tue, 02 Jun 2026 22:19:26 -0700 (PDT)
X-Received: by 2002:a17:90b:540c:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36e2f3c32demr2076710a91.9.1780463965719;
        Tue, 02 Jun 2026 22:19:25 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a14485esm1695509a91.3.2026.06.02.22.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:19:25 -0700 (PDT)
Message-ID: <77511905-1dac-4605-8195-68ec770740d2@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 10:49:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
 <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _rhJV1w0KrhLVho5hlby-dpFHEND7e3r
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1fb95f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yE1-P__lAf5keu_9ItMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA0NyBTYWx0ZWRfX5Nl+yXpeRr8Q
 5z9DEVpCiFkejgnNcfl8B2rxwJ1kQn5I2aIMYFOc47C1lUX/YeHS6RLoyJr2lIx66kkxGlog/O5
 aanYDF5q9KK0gAVS64iClyVjRIkRyqgJJuO+G5PJxkRconNj9Z0u6/xlJ5GuqjykOL5fb/oE1ko
 2jpgMRyUFr1k/7fh8U8+mXgXLGDQTW+yL0Wt3zmN5hQpxXgLTX1+NtQmu0+gFLmXpBPzI01sfYl
 b9m7Z5Zq7ASKzHi/QviHNboeXbRRquZ8lPB/eBM2jMgXvqweyhZxyML/6lMVGe4gsjqSFyqIRWP
 4idkDOxCuJEpujz6XQRQ++mbgfI77jf+TYglf6gpe4cRmQjWqSuPwp7gOnDRc/ORhg5bg5zZgJA
 RGF0awA707wyxhUCsD1ze/dlKhVmKUZix45ivPO2IBhHxVxx8IaCr1Xb/+eMqiY6OgDrM4Y2WOg
 wKJpNNKuJ78updw5FlA==
X-Proofpoint-GUID: _rhJV1w0KrhLVho5hlby-dpFHEND7e3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110889-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,foo:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22C7D6343DE

On 20-05-2026 19:42, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
>> Documentation/accel/qda/. The documentation covers the driver
>> architecture, GEM-based buffer management, IOMMU context bank
>> isolation, and the RPMsg transport layer.
>>
>> The user-space API section describes the DRM IOCTLs for session
>> management, GEM buffer allocation, and remote procedure invocation via
>> the FastRPC protocol, along with a typical application lifecycle
>> example. Sections for dynamic debug and basic testing are also
>> included.
>>
>> Wire the new documentation into the Compute Accelerators index at
>> Documentation/accel/index.rst.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  Documentation/accel/index.rst     |   1 +
>>  Documentation/accel/qda/index.rst |  13 ++++
>>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 160 insertions(+)
>>
>> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
>> index cbc7d4c3876a..5901ea7f784c 100644
>> --- a/Documentation/accel/index.rst
>> +++ b/Documentation/accel/index.rst
>> @@ -10,4 +10,5 @@ Compute Accelerators
>>     introduction
>>     amdxdna/index
>>     qaic/index
>> +   qda/index
>>     rocket/index
>> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
>> new file mode 100644
>> index 000000000000..013400cf9c25
>> --- /dev/null
>> +++ b/Documentation/accel/qda/index.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==================================
>> +accel/qda Qualcomm DSP Accelerator
>> +==================================
>> +
>> +The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
>> +It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
>> +for device and buffer management.
>> +
>> +.. toctree::
>> +
>> +   qda
>> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
>> new file mode 100644
>> index 000000000000..9f49af6e6acc
>> --- /dev/null
>> +++ b/Documentation/accel/qda/qda.rst
>> @@ -0,0 +1,146 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +=====================================
>> +Qualcomm DSP Accelerator (QDA) Driver
>> +=====================================
>> +
>> +Introduction
>> +============
>> +
>> +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
>> +DRM accel based interface for Qualcomm DSP offload, supporting workloads
>> +such as AI inference, computer vision, audio processing, and sensor offload
>> +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
>> +GEM infrastructure for device and buffer management.
>> +
>> +Key Features
>> +============
>> +
>> +*   **DRM accel Interface**: Exposes a standard character device node
>> +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
>> +*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
>> +    between the application processor and the DSP.
>> +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
>> +    allocation, lifecycle management, and DMA-BUF import/export.
>> +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
>> +    between different DSP user sessions.
>> +*   **Modular Design**: Clean separation between the core DRM logic, the
>> +    memory manager, and the RPMsg-based transport layer.
>> +
>> +Architecture
>> +============
>> +
>> +The QDA driver consists of several functional blocks:
>> +
>> +1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
>> +    and DRM accel integration.
>> +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
>> +    layer that handles IOMMU context banks. It supports pluggable backends
>> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
>> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
>> +
>> +    * **``qda_gem``**: Core GEM object management, including allocation, mmap
>> +      operations, and buffer lifecycle management.
>> +    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
>> +      with other kernel subsystems.
>> +
>> +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
>> +    to handle low-level message passing with the DSP firmware.
>> +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used to
>> +    enumerate and manage the specific compute context banks defined in the
>> +    device tree. The bus was introduced because IOMMU context banks (CBs) are
>> +    synthetic constructs — not real platform devices — making a platform driver
>> +    an incorrect abstraction for them. The earlier platform-driver approach also
>> +    had a race condition: device nodes were created before the RPMsg channel
>> +    resources were fully initialized, and because ``probe`` runs asynchronously,
>> +    applications could open a CB device and attempt to start a session before
>> +    the underlying transport was ready. The compute bus makes CB lifetime
>> +    explicitly subordinate to the parent QDA device, closing that window.
>> +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
>> +    marshalling arguments and handling remote invocations.
>> +
>> +User-Space API
>> +==============
>> +
>> +The driver exposes a set of DRM-compliant IOCTLs:
>> +
>> +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
>> +    and capabilities.
>> +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
>> +    on the DSP.
>> +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
>> +    primary execution unit).
>> +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
>> +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
>> +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
>> +    buffers into the DSP's virtual address space. Each accepts a ``request``
>> +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
>> +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
>> +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
> 
> Explain, what happens in the users don't map the buffers into the DSP
> space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
> is the difference between those two modes?
I'll add more details for this, this is specifically required when
persistent type of DSP mappings are required.>
> Would the driver benefit from using GPUVM?
I'm not exactly sure how this will fit in here, I'll check this and get
back.>
>> +
>> +Usage Example
>> +=============
>> +
>> +A typical lifecycle for a user-space application:
>> +
>> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
>> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
>> +    device node.
>> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
>> +    establish a session and create a process context on the DSP.
>> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
>> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
>> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
>> +    execute functions on the DSP.
>> +5.  **Cleanup**: Close file descriptors to automatically release resources and
>> +    detach the session.
> 
> I'd have expected the description of the actual example. I.e. clone the
> app from https://the.addr, prepare clang >= NN.MM, QAIC (https://foo),
> run make, run the app, check the results. I'd remind that DRM Accel has
> a very specific requirement of having the working toolhain in the
> open-source.
ack>
>> +
>> +Internal Implementation
>> +=======================
>> +
>> +Memory Management
>> +-----------------
>> +The driver's memory manager creates virtual "IOMMU devices" that map to
>> +hardware context banks. This allows the driver to manage multiple isolated
>> +address spaces. The implementation uses a DMA-coherent backend to ensure data consistency
>> +between the CPU and DSP without manual cache maintenance in most cases.
> 
> GEM usage?
I'll add the details here.>
>> +
>> +Debugging
>> +=========
>> +The driver includes extensive dynamic debug support. Enable it via the
>> +kernel's dynamic debug control:
>> +
>> +.. code-block:: bash
>> +
>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
>> +
>> +Testing
>> +=======
>> +The QDA driver can be exercised using the ``fastrpc_test`` utility from the
>> +FastRPC userspace library. Run the test application:
> 
> pointer
ack.>
>> +
>> +.. code-block:: bash
>> +
>> +    fastrpc_test -d 3 -U 1 -t linux -a v68
>> +
>> +**Options**
>> +
>> +``-d domain``
>> +    Select the DSP domain to run on:
>> +
>> +    * ``0`` — ADSP
>> +    * ``1`` — MDSP
>> +    * ``2`` — SDSP
>> +    * ``3`` — CDSP *(default on targets with CDSP)*
>> +
>> +``-U unsigned_PD``
>> +    Select signed or unsigned protection domain:
>> +
>> +    * ``0`` — signed PD
>> +    * ``1`` — unsigned PD *(default)*
>> +
>> +``-t target``
>> +    Target platform: ``android`` or ``linux`` *(default: linux)*
>> +
>> +``-a arch_version``
>> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
>>
>> -- 
>> 2.34.1
>>
>>
> 


