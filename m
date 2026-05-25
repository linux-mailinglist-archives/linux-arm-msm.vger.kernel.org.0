Return-Path: <linux-arm-msm+bounces-109545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oZJBAXTCE2paFgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 05:31:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDE5C58DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 05:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D8DD300574D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 03:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082A7254AFF;
	Mon, 25 May 2026 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BR+YA7ex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkhI+PGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1D22538F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779679855; cv=none; b=N/PYBAza9++cub0I5P4BiatERMf5WvqArEPHNoEdCRDpZvzclNEcx5bLRghvsMIzEMWXoTcaoaQXCtx8YoOm7jL0JkshGZRMEzYAp2RIXA0imzCvMOPLljdmCATDIxtRUVGcViFMOmk7lRCizmV4aE3WZIrTo6coPxQdXYkiO/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779679855; c=relaxed/simple;
	bh=YIsDSV6yvOZUdMHZ75MeNvg1gtcsZuqWcsVCfApJFk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Asuw/XK7jDsavlEWK83IMrfUbbkgrt0WEDS0QqFRjooJr8wuXr7hTAufYp3pN45Di6SzVxwX4yAI26GtuMqEjqTHa1dM4tqF3WBYgjmk699tcjJzEcipnSAgool1g3lC0AqgBHS5iksiq+6i0REWb5fhw5wwLyERB05YzJ/0oB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BR+YA7ex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkhI+PGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O8FcnS3282561
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ttDcIawSn5wHGMPcjxnIGUJLNBlKWRE6XzhIGYw9xo=; b=BR+YA7exBKoqJfyf
	IwhZWGrr7MBmRhR6IS2jPPb6DPtFRw5dIpxJ2IDCDzts1VBmK/mBbFIPeztpYkK/
	/qNQRmYiLV5Jt8RdvMMRf3vgq6+BZWjF8lR7mn39lf7BVA88oVBg199rBHmB25PV
	OH3wWIniaymv2qPCP31bfSNCBygBxwcMZ0wG+H/G+xQ2XCVxdDfN0V9KAPa6rm2E
	T96WgZKmn1oM1hs78DjJy1cHj6YMId3NBaTNtjo1eBG8vVXJLEAXMZPsxNu4+Pm0
	emrTDaeRF94MMRhcCT86VYwquaaknBhxGHg9NyIbkyfzKPytkxI9MLyuXrThJoZG
	BaKGEw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3cq1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:30:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso18710301a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779679853; x=1780284653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ttDcIawSn5wHGMPcjxnIGUJLNBlKWRE6XzhIGYw9xo=;
        b=gkhI+PGnjE7N41C38syvIBvuXTCl+PmmTWZI6VhHBdVcODGlGxLVsTAz3F1Rej89KA
         yhFt8on07sB3WAGewdZaPYvSDB0R+TEbwytW54Lvp4AHb2Qa6ByUAtsBrSx8EeEBjJfV
         XlZlImCUOcjt6RRuWpHTy6/wKLdPscE4h4nUdTm6zQvT4ey6fhQrXkj0nvrk/Eile5/G
         Abh7l24MmDeUN3tDhkP/UjcPR4Nz0xHjF4s0SJpneVAKCY8cEPj11Pqit2nhTOgClGIz
         fHK7P3n4fX8CpOJmQrjtCxvcNHKuKZAB427iT1U8l7E4ONRT/uwzaIvyHwat0j2UCSOw
         dR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779679853; x=1780284653;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ttDcIawSn5wHGMPcjxnIGUJLNBlKWRE6XzhIGYw9xo=;
        b=sB2H23vV65o4legqxnJvZ+2qE2R3cTmzGe3TSYyLg0UgOIldeT9ef56mGhiypTOhb5
         NK5YL8EE0QNCZHNeaMzL/Fwp1COD+ZEprC0PU9s8koh+etSKUNBzfoxyWperuH8kNGI4
         DY/6tuYDQT3POUO+s+0nqvAsWPCoPm+dtnPjvYU8lGORXiqLfjmUmGBAyu36kQg6C1l5
         /V/+q103sBN6EwEGR9ySKKhhB2/JPicyPrc0/bKOqcH72W/PKzcrwkYF1x4BWvXIWefQ
         T38uqeqpAtM/u7ZO0/ezRzOHvUaCjr8oKfUZ9H3/DKwaIB9CkaI4M3csmQceJyQFFNBH
         MGuA==
X-Forwarded-Encrypted: i=1; AFNElJ87zfSL5EKYqED9LKF9c+sv+AsbnwmQgZXCIbbTm5DdmUZV3kI/vxcBZfY+wa2DqBd/Q4LUF9HZusBuKV9l@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRF9B8VEb35Iq8RXsyl/oqAeVgpbaMLOz+5yKvefMqN8giKG8
	s6zqxSkW65eSc+j0ozKRXpmOTudue6JWqlnIVb/MI6uqvlW/zzo4a77dVng3e0YmOLIun/JTZrP
	hBQ4YKmcx6uI9FiVv+zv3GfPLhON0yOpyrIk6GyhW+mqKZGk82rqTwFJFcVsUPjQTSHNPYTa/LM
	4S
X-Gm-Gg: Acq92OFGEUKcCEcpsNuvF8N9PtYayprJMXDx+6KCjZAXyl3K5NWvBzLzJ9KROCazKrP
	vCxrlAqgug7nMfduTCBpGR7FXGWZmeGuENImPUYyVNQIE4JziEOcAkL1hHeRPiYvVs+jbL9oNdK
	oxyxNC0X8ki0eS/xQ1kLiiqZwYabxLraNbgjXWJvKF7DA0HjQxffXCzgn31wqcJd5P3sZCQZwTv
	98KXyyNxfkc1FlYK05xaM8POrkF+8rJ4+TEYb0Ey3iLkoGHPAvo5Jgnv1acZTloq9S3wD3ETVtp
	lGUKHwet4a9ocUhnbyGllR2uQrszAV8+EDDTRg8CIMQ9JfVGV4GHswLOx8uQGHLOakjuuDd6b8r
	c96eBDnmoITDjKAG4vIc9EJGIcALFy43v7698LzDJ/CrYS+muc+XsULcYCYosaEyLnMSkmxY+lh
	LlD/sDeDD/zzWV2qDv
X-Received: by 2002:a05:6a21:164a:b0:3a2:bd1d:d679 with SMTP id adf61e73a8af0-3b328fd02e8mr13103518637.48.1779679853475;
        Sun, 24 May 2026 20:30:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:164a:b0:3a2:bd1d:d679 with SMTP id adf61e73a8af0-3b328fd02e8mr13103484637.48.1779679852995;
        Sun, 24 May 2026 20:30:52 -0700 (PDT)
Received: from [10.133.33.205] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202903absm6598010a12.7.2026.05.24.20.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 20:30:52 -0700 (PDT)
Message-ID: <d9248bf3-ef48-4c04-ad7d-debc8854bae5@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:30:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Greg KH <gregkh@linuxfoundation.org>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
 <2026052211-pavilion-compost-5fcd@gregkh>
Content-Language: en-US
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        amahesh@qti.qualcomm.com, arnd@arndb.de, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta
 <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <2026052211-pavilion-compost-5fcd@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4J14ucr2qtKDV8k3tcySikI2n_KYrx1b
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13c26e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nYJ9tK4vUQEl1fWjGX8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDAzMCBTYWx0ZWRfX7nemT2UeEG/p
 hxQoL43lOU2GY/3TRve9dMqtK8ABSSfddI8DHbbxKrgoQYjJDz/zPQzIfyXbyDme8SPODvsyQ2Z
 bSjmtmrCscRV/ej2Gz7GttjoBCX7PtFlH4YtjsgNXW8kKSXetELv9qKOFH+bPLWlaOLx6FxTwLG
 8yi9i1L7gPQif5V5oKoSBdmzCh8ZdfyPbRrYNaCdTYjpotD2M+wwHUFNcIM6TcmAZyO7gq/UuWL
 VE4dkFEs1oX2XZA5q/yCmvAbWQ/DC2VVw3Szkyj4rySB5VsNOTyMWEXT9qAOwwN50GAps2xZGrb
 T8PeWETmBANhHrWB9uX4GjOHTGFYcO9+Qdd+c/++iW/3iWvd5hhj/FfKE252Y/+9hWk0dhDBT3o
 1/cHASOyPzCAiq4R5lbWtoISY8uwVavahAuwEKpnokHsMhhB8KEWQVQs6pZLAhrt4zx3UQl8APN
 dvgjqBHozTNpr1RjXbQ==
X-Proofpoint-GUID: 4J14ucr2qtKDV8k3tcySikI2n_KYrx1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250030
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109545-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50BDE5C58DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/22/2026 3:03 PM, Greg KH wrote:
> On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
>> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>>>> getting removed from the list after it is unmapped from DSP. This can
>>>> create potential race conditions if any other thread removes the entry
>>>> from list while unmap operation is ongoing. Remove the entry before
>>> How can it remove the entry from the list?
>> Multiple threads sharing the same file descriptor may invoke unmap concurrently.
> multiple threads sharing the same file descriptor is a horrible
> userspace bug.  If you do that, you get what you deserve :)
>
> thanks,
>
> greg k-h

I agree that concurrent unmap on the same buffer from multiple threads
is a userspace bug.

However, the fastrpc driver is exposed via ioctl, and any userspace
(including any random apk) can map directly and then call multiple unmap.

This patch is not intended to support incorrect userspace usage,
but to ensure that the driver remains robust against invalid or
racy inputs.

Thanks,
Jianping.


