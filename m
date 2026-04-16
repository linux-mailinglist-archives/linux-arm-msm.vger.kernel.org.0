Return-Path: <linux-arm-msm+bounces-103432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOZBAdnp4Gl/nQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:53:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F640F3D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC6830179D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497F63D6477;
	Thu, 16 Apr 2026 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDuIPU58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPctGZyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCFA3C199A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347567; cv=none; b=hKDvBTho6Lbpj35RJmz0fKPmhDCkNsBriSe6tjoIWwsKh8e+faILhNiAYEjNTrdPwfcxY8wTTnbY5l2QdZN24RVbjEa9VPuBXEPpynZByDr1ZHvdbI7xuOe6o5a2xPoiOxON8v+evnO+aUDyJ3PH41aleozwXRwvGkoy7bXJSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347567; c=relaxed/simple;
	bh=B70FZ+Ga8PwVGy83BiIRKB7y4GG12RQVNQwTwJXCbn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utZbbVIXsbrSKTYDjxiDfyl42tbf7ZBCl2I7qf9+wnl84ilM60PYu/yzNLO+V3ohs17/FcOyUPsl3juraqVSGJlNVOuFCjlNodxuIrl/rA+uBjuwTT+rvs1dFAd+JQLnp1PWm9L8GVQ4y6Kgvdca9GUCf6w5n7XHKSH56W5PaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDuIPU58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPctGZyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Va391702619
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=; b=pDuIPU58c4TY3F7n
	SZFptInWYSXM0aMao40zBx1KsOP0xDNt7CYf0FMjjqrvHa7gWfVfiAhcR2x7KzZG
	HJ/hdYMcAhlutyD9Gn48ZQ9OKTqfO6VrNs+q8x1zSAWcpI2Thuw8Uybbr29VYbU5
	XMEZ0gFCtTO3jtOl+KxPs8skaGXHsqu8cUJkd+bxEBpgj7VBuvENRBLQuqsJ6rjA
	YMDkfpkHEuaeaiWLyB0OTmgO3eab9ILSsLXYrqRS4DpeMFZEwmim+bfsQA5xrOoV
	kBNm/snElZGuWNf/MtE9gU/3SLbZspvVlhXvHw2ixJAgZsoiGNRxWPmBSnGe9kRa
	xNOG4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamm1tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:52:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4966fe6so17154886d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776347562; x=1776952362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=;
        b=jPctGZyQpv37z4zB6wUgC/rVTEsPdobGZuD/silq0fWFNHWG0YREGQnjfeHhWk/vK8
         zMS/Sqrski0JYIJ1HyBOXwtJ/XLF4VHmpJJkbtKcVAvzAOnPdMX4iH7+HcgZZQBIDarR
         2EWZzd/7nxkrwb9yVkL6c7W6zyoMi0lnZp66mAMIDueP+AZ8mZyccS9FNu81H+ztkGRB
         CxMbflr5asYalAEskpbYToXy+/gEoUAgLOWpdFmEqnhoOHy2E+9NjWqSFMppHKoO8vK8
         ZNHiSgzRK/XsS+Gqph1XufejvUYO9fU74s/oAaxBZx3vZx5mnkAAgngVRRD+FQZfvCAR
         0nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347562; x=1776952362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=;
        b=W4P+gK6gooYhlmqw+4UIMGuZ+DFgXKPld2ZRWfiInv6oauC51O7BWNbjZtM2UQqoGA
         i/g2/BBb+rtY3mtr6cwnoVeEvpRbkPLuFJp5/yZS9MFDErsXdrW8iIDa5RoEmCrcTsF6
         Wzwc7AwL6yefiNqmH/dnte97zXsFy4LjHDucaUDpuRkpoFOUVaTQ73Sp6HuCNpviUoXx
         INM7zJoiVftpv+lR9pntfZ2ty0AygQXyrccOR3ug1aHhFpWLpf5Sy18rEP7U9sM3Z/DA
         cM8wH43rzMRK4+W20ImaSA9DiDdI64qYRJp5i0RxE62hlTBdvUvO3a/a6H+HrRREt8io
         4skg==
X-Forwarded-Encrypted: i=1; AFNElJ/vFUytSHNFI35NS6H0zTcL+bPZHi86oImXkGKtS7vPvoGBFcXWyEsCPAvdWY1XMjiRCtZQ1fvsUFw0H3JK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24zPgOpmBsbGFFVDAvlfEOao6EpfpujONvc662iz9zX2m0GrZ
	VwhFwxeqxutf+gTa/TNe2U3vAMD3wCRysXirYCiHHSZrl8HpKlV96vdGuKND2fNcRG2TXlGTlKj
	zNwTPQHXR0duLubsxcOfHdd+0iGIpJ/v6UIJ3KvibXmJk9pGyLXIKKMXBx3G2u6X76qNl
X-Gm-Gg: AeBDietTbBjbiFCojoiQ8fVxm0vBiwqeKsBcKF1vZXv5sgUzxQfGPBenHqNqRVJUgvi
	eqKEIklUV5m/pLkI8SH8IQSwAhrItozITuDvi/CNrnBNWjtI9zEKPCcBYAJu24wv93YwYwgTEDs
	XUBtqk9wnxHYz44P2P/TyFbcGfuRKH2jzgI/Pf/PO/JOnpAIwHgRoqVsqCzZmSs1LpQROePjUfb
	CbOfAjBFUwNmmeEBxmQFp0ZhD6BdhSCbIgjSarNjUVq1+Glv6+DyynETIdFSWsb+cTPHW7zNz+Q
	zMQdPWmuTKaqmo+j76OEUlNIPa/HyQmxX5dpuXampZroEVzMwnv2XQVNpSozGgXnmKPHpuWEHyR
	XPrdU1690PlIMsisRWDh9QLDs4HbYd95GEhPZhIRz47qNs0//cRMRBfCVjiOa8W+Na3ojfsLAQZ
	qgsmffNlnFIHDuFw==
X-Received: by 2002:a05:622a:481a:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50e28cf24f4mr24101561cf.0.1776347562454;
        Thu, 16 Apr 2026 06:52:42 -0700 (PDT)
X-Received: by 2002:a05:622a:481a:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50e28cf24f4mr24100991cf.0.1776347561884;
        Thu, 16 Apr 2026 06:52:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba170629d7bsm171699866b.0.2026.04.16.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:52:40 -0700 (PDT)
Message-ID: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u-wF6YlQTImjYP04fjIB4WZogve9TLF0
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0e9ab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Hal5A9k0WOgLizwzjeAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: u-wF6YlQTImjYP04fjIB4WZogve9TLF0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMyBTYWx0ZWRfXwddzdn0nRxR9
 xC1dYXIAeMWcPWAqZFe7XPr1ygFz+jsUi2CKMpaCWTvwsQXrFpZnFQZVu6C6gcfW6se74kl+Tts
 HHP9954y21dUQ1++pusQQa051yee11xXVBtAIDnmWhG1trKtztv2ZL5554Lm98HThz+DbamgcGN
 7bgLMd6MqV/hP5yAxxRbX+pf4K/SSb0ILiHQEqCyU3ktNdTUxBVfAgovHWqB5iPOMC8RwLP0H0N
 WJYqHeUgp7aGP5jn40jdPOSwT7iV/fMFArA2sDvp1YVGUehGq5NmJbk+o55CckkHknyUvZW74fe
 n4zcY3G3lt7jOEp9BthQwoEswwWaNywm9POv6r3xET+8AG8Fyc3gJbQ0AeKhkuAG/mDUzwIzjJQ
 5KSc+wFfPs9kGVCv+CZmN3/n9flTzF1vdLHqPTw6tN4jS3zkedVdr3HV/J75EGhJoZQo+2uXbCP
 NWDKP6zJFGBO3Q5EktQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103432-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 482F640F3D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> This patch series is marked as an RFC. Before submitting a non-RFC
> series, I would like to have some details clarified regarding how Venus
> works in order to improve and eventually upstream support for MSM8939.
> 
> 1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
>    for vcodec0 cores have only decoding bits enabled, as depicted
>    by qcom,bus-configs property of qcom,msm-bus-clients children
>    in qcom,vidc node. Do I understand correctly that these cores
>    are only needed for decoding, and not for encoding?
> 2. Currently in device tree there is a video-decoder subnode for Venus
>    node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
>    subnodes. Does this mean it should be dropped for MSM8939 as well?
> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>    now, it does not work. It can be enabled, however, it will result in
>    breakage of Venus for faulty MSM8916 firmwares, because the code
>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>    this would break support for some MSM8916 devices. What could be the
>    best way to work around this?

if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?

Also, you mentioned HEVC *de*coding, while the commit you pointed to
disables *en*coding (decoding had been already disabled prior to that
commit)

Konrad

