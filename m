Return-Path: <linux-arm-msm+bounces-97444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLE9KX38s2nWeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:01:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA7282980
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 277B73044959
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8861B390C8E;
	Fri, 13 Mar 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtF5t7GB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlmaDAl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291A939023F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403193; cv=none; b=h3BaO9rS7xWaJcQlZGfNLMSjDV9bS1z1v7uU9VvU2wzyev6Tkcfdsa8boyB5nSyNiSGAXQ3nJqdL0ai49CvpA28iIeZnFBBSjri110Sdsl13Dn4/WmenefekskOm42ZpwibaA3CDa/cX4aWdvY0IAs8Hf/8MX6BstE5qSkjFHzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403193; c=relaxed/simple;
	bh=z0sVzBAcv13vC9l86gQlsXV87u5QGlJTtmJZRwdqpj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGFhmrOU3SBPPtujTEMbt+iRprklNnUHNe5beBK9LrGJXrIaMGhDpm645gcYgBewXSDNXRg57uhOLlFIQbwo5bE3pIUd1Uef+xZbvKXCXNMxLR9V5QhmtY+Rn1FBMsNSFouVUqn/tgxMi8BlZRNLYDv2ygQqMZXAI8oZYljVAB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtF5t7GB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlmaDAl8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oSPA793119
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAPyYNhQ7Nilvok6h06J0gKQb9GOg5VVQtkr6R/ZE0I=; b=BtF5t7GBYwJUfunD
	K43XSiJjqXqPrGS9E8flXCr/CG5vIzZB66CCfxSHHBaYu0uwieMm12oxuvkNOvfn
	ja1fqd3U2vZCiW3Y2q84CzAew3ijeJVFVuXE8q02dxQeLmSC/U35nIun4/hmsow+
	nJ+GO+Q1e83yw5oaj2VXlWSDhAIR+ibLLDcmtaDgISq5duMFyJCELzm4PVV4UY4B
	SV8LUlYila5uJookHMR4p4SvrL6NiWFc3JWjX0wSHLWFPXNJJIAK4BQlerda9t1B
	ZkjFryzFs6FJxSgd7s57853V0JBinDvp3wrKXg1lOh3G0zcuEbVTvDDA1BhnosAh
	AIyQAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt120v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:59:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8e89d19bso114413285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403190; x=1774007990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAPyYNhQ7Nilvok6h06J0gKQb9GOg5VVQtkr6R/ZE0I=;
        b=PlmaDAl8vrOd2KP38BpdysJzWxfF+75kyVkAxGmJEHGPnKNRdH6k/G63rNmIKdIb3B
         kpqmfloClxBuLzhSuEBjE9mtlr5mgJN5F++0B7/j7Ze/2yl9eiLpPaXqQyIjLcy0LSXC
         //BO/Dcewl3WzuhdQa/yY4AcfatDnTOxKS2QyOXpHcU7102cULuIx/plhz6ovMx2gRxn
         D3RZMiQppcRnTY14InkrUrcoq0pg98sIiMZv8t4hQlez2+5ZIUA+3c8mfMHs3Yr9+IT5
         NmHUaFcAP4hsM0IRUqlbDztR3wssT5K44vLRd8OSrQejJ4LM3pfKDVHKnkOzJy8NM/E1
         uCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403190; x=1774007990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAPyYNhQ7Nilvok6h06J0gKQb9GOg5VVQtkr6R/ZE0I=;
        b=IUu8VpjUO6YzeE2IeVH0EPYpzYK7ghcTjRHtFiuf19gAyyfXFOcQGCio7pgXaT3A7K
         vrmiaRIZs2grEm0bT+Z5r8LD/ADhGbo/9RalS5I1OdthCO4ebBidij91LHYqtic2o7vs
         89GHECGhP/q9cF3VjnbiqigTjIUZW0PbVrPkmz8sHE3Qy4LhPdlIALOvyIfXy946l2lN
         tDn6mcgdyrLJqhaNBf2Ew9Nq/AEAf6rDyrL0p1kiR+HAIBmK2hsnhi20CfcOTtzOcRSn
         knUc7PF6xp4+Q0TWT2K+s/TBf71HpRvjRxs7NqtpezoV+++w7gaeaKK+gANfo7IzY3/W
         Q5BA==
X-Forwarded-Encrypted: i=1; AJvYcCX5cNFOjLOI+V7fy681mEA1pHZ0Nz+xhkTSy6MN8/WUNaDRl0fmUNzEz7EKUwN/p9xY2JqZVw2byebTnE90@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2M8GSMHdVI4N3MlUKw2dbQUl7J8cfkle4v0czlKAISIctZlNW
	cVi16V2hUgvQb+fzIxUi+t83KItz8EJDK2oV46zhi4pcSwykh41SuqtgjtGxgvkW0hPqYNv0pkb
	QGpHl58tWoZRTAzm2osTp6IC96TxEAzeMbAf/fxhvJjKcDjN5ZzFwcDbOEHLxv6xSsbUc
X-Gm-Gg: ATEYQzw/yqrpMzVCAXrHdueHWFbMc5Gjtq0hNKjgaAYzqB7pTRyESjaOl5wJ0/rBeGr
	HnshS+FKFAl7OZnP2OlHFGMmeE/e/ydT3oHTl9GQJtXxN4AtS7sAO1TswKm6gQ9Y94WX4dIAHHg
	k3Gm2WkTvFIicB3cjkM58lWFBlywDG05HsbSKpbBGj2IelooKbG9nOxuIRCiY8GAWymmL2lSyHE
	Zsj9txm1gkOKbGCCU8R3TC1/EmU4+B8iKG+GiNckrkCi3SwXy6TcXI9RGn5YXfTLS7097Akbqw8
	s50GUrWx6Fv3Gdqk49wvfdxtiuUNq6MRXBs7cU7jBm1njLW5qKNj5HHyjaLPrNyT+wd8ZOZpk4w
	pW15yF32xEVop/6uPvhcimjcM1Bp0o9nVA94taf0eRONLdCPTOYREjKSLnekY428121iGAUEHhZ
	96HbA=
X-Received: by 2002:a05:620a:1990:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cdb5b42e6amr292516485a.5.1773403190150;
        Fri, 13 Mar 2026 04:59:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cdb5b42e6amr292513185a.5.1773403189637;
        Fri, 13 Mar 2026 04:59:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm39747866b.58.2026.03.13.04.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 04:59:48 -0700 (PDT)
Message-ID: <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3fc37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=D3rGKGdzeZ1DfF1dGIIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _vLLgVrTdew4d6hJ_tm8MvD6G-ui-YNf
X-Proofpoint-ORIG-GUID: _vLLgVrTdew4d6hJ_tm8MvD6G-ui-YNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NSBTYWx0ZWRfX7y4ca9xyrJCR
 SlJKXjk//YMSkKyakJ8WKSUw7bNHmv4bZNM/l97HSWYUEhfKugl8X8jrudkK4cOaEWo4cohpJUk
 mnQtPiio/rpmGEeeqbJyI1BhsOuMDDZs0gpCpBZuCf0FVgD4vZK2u7nZ1+o2YlxWfuRC39eAkY8
 lu+8/tuHKbANLjfZVaD0jja2YhJWOrBwKKYf+Yp+kjxmDaS0DNTKEabDu5LoJ2nRYKcHTmlqdnz
 1kzDCsIjdjFe7/fYqefWDra6v6KjCPEL6nzoxIGWq1D1/qeHCqNMpbEmT8AZqNQ2adeSj/plMpY
 vvXwS9B0dSe7xkfehobbbMoRJVsw+8CgXUf8GD92iNtCuIrAEaMQnO0wjPEPQni+X2v0bXfZJ0F
 m1IIpZmwbc4sPtF7x/RgVGYMWF56hbAUPaa7370LKe7DYIreZaj+SBtm5rU7e8Mv2q6z2hZ2ENT
 eLCtWmlGh35EfoxEvfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97444-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2BA7282980
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>> Interconnect from SCM device are optional and were added to get
>>> additional performance benefit. These nodes however delays the
>>> SCM firmware device probe due to dependency on interconnect and
>>> results in NULL pointer dereference for the users of SCM device
>>> driver APIs, such as PDC driver.
>>
>> This sounds like a bug in the PDC driver. It should reject being probed
>> before SCM is available.
> 
> The SCM driver provides no way to check if its ready or not to decide to reject/defer the probe.
> A new API like below would be needed here,

There is, qcom_scm_is_available()


> Let me know any preferences from below options or any other.
> 
> a) Add the API like qcom_scm_ready(), this has been tested and works fine.
> b) Move interconnects from SCM to remoteproc PAS driver for all devices
>    Take the vote before invoking SCM API and release after return.

I think this is not the right decision. The crypto path is only necessary,
because cryptographic checks must be carried out in the TZ in order to
(dis)allow a certain firmware binary. This is not a characteristic of the
remoteprocs themselves, as with a non-prudent TZ, the firmware loading
would amount to a memcpy() (and some SMMU/XPU configs via reg writes)

> c) Remove the interconnects from SCM and rely on crypto driver already
>    placing the vote, Route the remote proc to SCM call via crypto API,
>    This would ensure crpyto is being used and it would have placed the required vote.

I think this would make things even worse, because instead of waiting on
the interconnect driver, we'd now have to wait on the interconnect driver,
the clock driver and the crypto driver

> d) Add separate SCM child device (with interconnects) under SoC.

We'd then have to probe it as an aux device or something, which would
either delay the probing of SCM, or introduce the need to ping-pong for
PAS availability between the API provider and consumer, since some calls
work perfectly fine without the ICC path, while others could really use
it

Konrad

