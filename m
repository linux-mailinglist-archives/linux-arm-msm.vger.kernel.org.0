Return-Path: <linux-arm-msm+bounces-97542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGI1GZgutGkEigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:34:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6A286178
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E837305E443
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97CE3126D7;
	Fri, 13 Mar 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSKbESfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrQ3ikHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA38324B16
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415057; cv=none; b=W43MksJ9wD7mkh90pIdB71j35YrOdKrWlH6BsKV40auwL+/ahPKNoeSmBCbnttjyjtZp27T6bqrb4h6GbHlAPzyDkG4HfifK3HMFWeKBIomr9wumr+6iV4FRYu63znGx2mIvLS4SxnaRMA4N963lq//Y6y8lzGjqXUGfse+nE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415057; c=relaxed/simple;
	bh=l4HEowm5Fwgt90UaF5x2GYpYEwjxSinAsmsMDdusFdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqGmMJRz4RLSm78Kqj5qyoa/BgpE/jruFIlSNpRdqgQkU2dFQrY/gLyfqarPCrzACM2YBcHx4EsVrLcpqxJeUNYJOxiZsz/x/ybjpxUfoRzGLfNEOlRDKQLToATLlcMGHCOYLF2ct8jcahhtyDqed9cav+b0fGzrWwIFrVcSKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSKbESfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrQ3ikHV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TqcE1499087
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8W61Muwi7dV63yRzThS1OSpPDfzReo082YGSyg6OME=; b=DSKbESfPijDRGU5Q
	PlLfExsCxVuH3htsE1f4t1mJ3nX1w5/rW0u/r4JFCXkpBSKNWl5jvu9rZaYcM9Pw
	EDBK4geza49DvwZBNkZbT7FuqnXwSIAu4gr0L5b8kI5uM64O6EXUi2YlQmu6DwfL
	FamQrNjhN8JZ0iVoaYjgQZRMdCBbZz6rT+/zW951Hxk2ZkehzwUqfKlcOZ+5tBGL
	6ynZVvhLT/Y/bLzqfKb3x/iEN3sNJySMszUcLq1bSjKhDwZQSwfRe0do89RfgEWs
	xbnESEgGaBeZvBRDOGOIhDTs834FXqblh6SMp7wbpm8UtHmBSPV652Qmw3oBkXjb
	+3fHEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hh54c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:17:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3568090851aso16817863a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415054; x=1774019854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8W61Muwi7dV63yRzThS1OSpPDfzReo082YGSyg6OME=;
        b=UrQ3ikHVDfXr7kIn7sSq2BkeCXNhqjjQUr0cvZ1JCIcEX6tjbfqpbZ2wnuJM1n6J0S
         4AsmaJ8AjO5JiI3zygSRhMGfnrp+2PmCB4aNsPVCQRDaTS4XyAxsGu9sxFK/bH2/bRo+
         kAdd5JYvZwYwvs9MefUpydUe0DIoW/s0ooIvtsuyEgRQHr9pIe1Eapg1i5MLoxKC0duL
         /VN9oyqEbeQNip4ivmezkZ2duRGucKArXANeEkDQOPFAESXyz2bR+wO5ySty7d2iug5P
         OdPT78kJRha5Vre4evbak7bYQ3qmlU7dgUKtzdyiC7HDhCaJbiBSMfkOiq0fnamcOg9i
         Sadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415054; x=1774019854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8W61Muwi7dV63yRzThS1OSpPDfzReo082YGSyg6OME=;
        b=B7jMw8m6TwH3kd24ij3F/PSErdhPq556tvNKkXd9eOQKKJV3QsJFYSlXAiVmaF6Zcv
         Geh9nxlWzSfkI5J/V8IDzn1DpVu3ZmidUJZUEwIM3hM8oicyFBA8BBixC/+97MZgEL9s
         31sM0J3W+8kUaAoZQrvqd18hZbUFhZImKAd8LsU8mpyAUf/jqaYxPL3N+MgOL0VPaZbG
         Grw9Va/UAV7Tu1lqipOGrfAAqf3wpdsxQToSgM14+nVS9Hjamh6LMbmYOg68jOMcag3L
         NNUaWB2JQteprCMxaX5XDJKSMPEcEEEGIUXyiHf9cF8i9FltggvVSc+GA9R6WSGMDqdw
         +7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXLt3WFki0DIox45DxAvTuifZo8x6hcZKPxIXXQBqPwR/C4MfYptUXIqt8T8n3ogsf/h4OsO8qDfk52kuGq@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgqjZhnh6jSHCEAe4+sv7u2ZTypa5xLXZqQeoxHqo4p3YVou1
	mzMSiQfrUuzC2oBlKtFvK/wiaW+tFexv/lB2O5i8X183RblKhOdPamXrq3K1kTxCg9ZIjSi56kX
	lIHZaWGiJTReN8vxJ+rt6eDoQ7H6iuffqO9qRPvo1jh7Nj3TWDD6tzVTzhTHClswoYQ5m
X-Gm-Gg: ATEYQzyQUC0ShfCgG9ZgadgX5dxTGp2Qpd1yp4AZSjGeYLOBtCmNxIZZOi80EUWKo93
	zPWO3g9xqHqvLvbwTE6CIP7NdFKm1b7nnh3s61yXCOVTNQ1db4cQDFBGytDptQQ4zFkc3itJdhX
	rGeD/0g8lO5RmOuEAtU99ruUbRnDRlzhq0iJU95qA66ye9MTgZH+406yyiyYt0revpJD8fh3+jr
	LkPdh7aRKnSF8uxDoS8ZkDj/RTcCcUXsu0Wdoi6jOgdBgUqm/kKn/5FNmZ9XqmSkSHSfE2fPg/0
	ZAUCEBpH+GHGycyqcBl2Im0c8syAt8q+aiYlc0IjJOE8KodO3G6+uwXG6T0h6Ei9jKcayp0IJPf
	Fsf8s/L4zFx67IHchKaYPfv/r11ePlOFPdZrTckYQhhPClOUTfC8=
X-Received: by 2002:a17:90b:1b10:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35a21efa8cdmr3431185a91.9.1773415054460;
        Fri, 13 Mar 2026 08:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1b10:b0:356:3ba2:122c with SMTP id 98e67ed59e1d1-35a21efa8cdmr3431152a91.9.1773415053961;
        Fri, 13 Mar 2026 08:17:33 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.225.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a17be605asm7039006a91.17.2026.03.13.08.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:17:33 -0700 (PDT)
Message-ID: <8a857ccf-1aef-4214-a1a6-cbd910ae5ecf@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 20:47:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b42a8f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=G0zgsK738vOuM7T1zJuYQg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9LLCEl3WuFZl3W-Eh58A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dJ2RNOahgHjWVF9G7DCknxdMeKv4Zg-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMiBTYWx0ZWRfX28vomBsbE2aq
 TcDM8ZLQ6ukmllninMF1tWYw6yY4JDCYf43Xr8BHp3bJvt5t1zo5VfpkjXJhSvMAcXc2oEJeCzG
 kj6FTAUWFW9HD1dAdeWd1xttiraEoSTvfn6ABNA81Dir0XoQkbvmvcqAPWWbVpdea5KEmwVi0zA
 kCORoCfFmusuS3mxDMbZ/WQieBmYxsVrEIUaUNUHuiWK3gmszAven2LdHa+8FIz9LCsSplg2GYc
 W4JkKqBuvt5oiumFqTHMUIWSe/0tUK5SNEDmKfhlc/NFM3HVy1kc4MSRp04RoWZ/Y4HzdGY6DOe
 PKPBZfxj7hbavv6hPR8yEV3XNax//VfVQDJf+b4zhYs9c000/pPZuEQvPb93aenfbie8LdkJbqA
 sYFPN3LTDspOEHkn7U0Qwoo3FJocTBsYekRCfdY6T3eAsCfQkyh2Le/q2CoVOX6ABq4fAKLSsTl
 LyNq6eB8OSA6x5psJ4A==
X-Proofpoint-GUID: dJ2RNOahgHjWVF9G7DCknxdMeKv4Zg-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130122
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
	TAGGED_FROM(0.00)[bounces-97542-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67F6A286178
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 5:29 PM, Konrad Dybcio wrote:
> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>>> Interconnect from SCM device are optional and were added to get
>>>> additional performance benefit. These nodes however delays the
>>>> SCM firmware device probe due to dependency on interconnect and
>>>> results in NULL pointer dereference for the users of SCM device
>>>> driver APIs, such as PDC driver.
>>>
>>> This sounds like a bug in the PDC driver. It should reject being probed
>>> before SCM is available.
>>
>> The SCM driver provides no way to check if its ready or not to decide to reject/defer the probe.
>> A new API like below would be needed here,
> 
> There is, qcom_scm_is_available()

Thanks, i will use this API in v2 to defer the probe and drop this patch.
Deferring still delays PDC probe significantly but it would unblock this series.

> 
> 
>> Let me know any preferences from below options or any other.
>>
>> a) Add the API like qcom_scm_ready(), this has been tested and works fine.
>> b) Move interconnects from SCM to remoteproc PAS driver for all devices
>>    Take the vote before invoking SCM API and release after return.
> 
> I think this is not the right decision. The crypto path is only necessary,
> because cryptographic checks must be carried out in the TZ in order to
> (dis)allow a certain firmware binary. This is not a characteristic of the
> remoteprocs themselves, as with a non-prudent TZ, the firmware loading
> would amount to a memcpy() (and some SMMU/XPU configs via reg writes)

This does not seem to be a characteristic of SCM either.

Loading and booting the firmware is part of remoteproc and not SCM.
(Documentation/devicetree/bindings/remoteproc/*)
The votes required to (dis)allow loading them faster (such as crpyto) should also fall
under remoteproc otherwise any driver requiring SCM API (for other purposes) would put
the burden of placing votes on SCM driver?

> 
>> c) Remove the interconnects from SCM and rely on crypto driver already
>>    placing the vote, Route the remote proc to SCM call via crypto API,
>>    This would ensure crpyto is being used and it would have placed the required vote.
> 
> I think this would make things even worse, because instead of waiting on
> the interconnect driver, we'd now have to wait on the interconnect driver,
> the clock driver and the crypto driver

okay, i was just wondering if crypto vote can somehow be leveraged so SCM do not need
to place the vote.

Thanks,
Maulik


