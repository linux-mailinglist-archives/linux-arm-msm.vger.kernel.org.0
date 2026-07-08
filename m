Return-Path: <linux-arm-msm+bounces-117567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jjj9IrAhTmo0DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:08:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6C7240E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:08:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oltHG4ZG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iSCCQCEB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0B23301D072
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA27388880;
	Wed,  8 Jul 2026 10:01:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873C386559
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:01:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504896; cv=none; b=n5xNvLQbkT9uVO46LEiHRZtDg1whnnBvUAV6CP01DOlrxLMX8FFtP4BiPCCaNv31gX0rE0qo6SIjGtezRSQV4aQKav+Zzl6d+d/pUet75o+BaXC7A4lpcffsNo85ew8DwRS2GLYhw+Vj/PpYkiwv9DdH4l0/KgyAaJEFjJ54dBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504896; c=relaxed/simple;
	bh=oKVfH/0Hygcklu+R5xYMT12z1eblv56XDMwOFHZZNzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=og2Jr72dxx7ikhHyracgl/IrPrJZ0kM5SDc13vpabU2YgB0YN4hZUSSGdPqNy/hOI0tIGd8Od/BW2SxUnyxZCaiBr/dPcmSemW62nFv2PZyyljEhUbegfIc66UGpkzotrKguTX14U6aK9wu+IYoi5Foia/WFI0q7wSaFwaTsh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oltHG4ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSCCQCEB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889ffm2051950
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=; b=oltHG4ZG0U80gfpJ
	tYRua4KBzGf901wPuYRVh2i5a1FPhwH/fr5a0zAjX3VDEublxoHPSvbZVaHRjjT5
	CVNGhLqADIgdvEh+ShfpeXP7RXFgIQ32QbejmmRBpxzEg243jUP69Vl3QIpt/3ue
	wOlVnwQMI5cMt5cnRPvam1Gpq/+FxAldRghc0cFUCAhGcdwDssjsTTQtE/2Cv2ZD
	IWjMXV6OPjWh7LeTjXNlTovAKeiijLRzgWQqQQt4W9x5DEJhXHA5z98Sm5mYdGVJ
	a1ACK+xTymCfENv1pL85ypKsPEXw7JDCXTDpWaCUDQ4ZEwRMav11ZN4OetgL0ZVW
	+LRCmw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5ga6cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:01:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845e6a11332so893036b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504893; x=1784109693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=;
        b=iSCCQCEBF2iep+w3thlr7rHKWYt30xzMplEk9qjon3uBwp6Ggx7LN9IShcbHOqg5Fi
         A1AvhZENbeL9oaKGsHRbL9sQDTxP9leUs6tz4dwrmUOYnEG8bTSP13+aLLHM0EyTDENQ
         wkpdvUmIa+RW3SoHIBpzwf0MBnePNzOqL8Vxic5bsSPIdFfVtO/5+Czcjd9hnUosSVkw
         ys25jiBE3DxfZGQYr9RnNQGcAPi9AbGoOTwQEQ6SYuA7bRKbuWv/EaokTg/zIsnD0AZ8
         l5v24dJ+ah1q00WOOOwjTIO0DZXX2IeR+tptJ8PyVO5UgufJpWbv8PFxCU1dGFkXhhRt
         eSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504893; x=1784109693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=;
        b=XG1+lYWHWqV6Z3ZOfYC4HI0hnkiS2mvH2VVuH5lRKzn07ZLeBhkGPC6qHekWT2xrLq
         1LXUtIdrno7g/hgD+/4kLKf8W3+zWfbLNHyEkxUFV7cFMx3l50tUamcGx3Ya71dXS7VQ
         rRcqAoCk5f8d9aWl+Io3gavseVAavjjuLpn7pO2dAxIxoP8nbOZkRNGO6UuBTzVYT/Hi
         LsfZ2mEBEIWp7icP8phIZCPDG8nfsIUUYrDR34QVZ98eDDvGVwBF4TVGQgZb7iuGBz/l
         HRukJIaC93DXcyAhPL3MXMDPSftvjlBo0AFHrw7IKi9wCbzHGUZ/166YSWzSrPyJoaDu
         IOSg==
X-Forwarded-Encrypted: i=1; AHgh+RrywMxBW/Lu82cEwu2Ad+87CEy90aVURerZXvDtFpRfUFrXGhDo+SRkdGjnIf1bBnI95BTzxsuoIhGDyXIw@vger.kernel.org
X-Gm-Message-State: AOJu0YykkNlEzVX/5lpo2Sr1aeVIgisa1UoFow+yHcMLcOxYZ0iuwtCF
	c8ZwjWU9//AlCAuT8u2V6iVQrXhFCN607iD4Km8k67HaFM3vUEOB/FvpOEt2faVjGRvMKoDZxVM
	YB7WMIdZcGEHbjzGo3FO71r2BZrRsVkliBK4HYLRzraa5sOLeFTMt7qsYRGCeOxwLSDEp
X-Gm-Gg: AfdE7cmYfcSSZPbAJ2XGWyo9S3E08bNmlNC+++B9IRf5DxpP2OR1jUWBHuaz1FroyLT
	W1/4ldH91ge/lqpSy/iZj5/dNYvIhtq0aRNiDcbh5EAntuhnxmkJN371NNE/IhoxTRFm3acb+ag
	3nufO38EYTtfKCNL5NQztFE5AU/WstP4KYi3eP2DyK7I54vRF0Q5AXMXa9JGTvtzpl6SFViLZKt
	AuEuBBepyOlfs6lQ9y4OFlI/NaCYXG5WLcM7fmqWSE6UkNx40YuyMbFLe+z8lIdD9qd2rPLDuau
	osJ5GRi8eLoYuQTnTcFnOqH+jwigc8bb+IAnlT9K+WaZvTfEiWJLuaV2KM42xT1+4tqF97X5Eay
	gAZp/orYCmPKFVTfp3qgDuOxJKODKppfHGDghAFs=
X-Received: by 2002:a05:6a00:2e24:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84842ee9c8emr1865561b3a.22.1783504892624;
        Wed, 08 Jul 2026 03:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e24:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84842ee9c8emr1865535b3a.22.1783504892128;
        Wed, 08 Jul 2026 03:01:32 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm6916358b3a.28.2026.07.08.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:01:31 -0700 (PDT)
Message-ID: <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:31:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXz3I/IRCy3pkq
 LRg+tQgPOQXCEPGnd+f8zUsPrClrdPYEBnV899NMX1nS1gqgM3gnYb+rWdRJIJjREdlKorGkrAP
 BXvWTY9CskcfBPO2nz/t0czF6L0BvgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXwQ59mckUDulI
 CzD2kzMb/qgDmXoluodqnvANwTMXo4CxJ+8yj3zbQv1gNfqs6soTcj2e9PDYMA5wGo0Y9ZO2udj
 /RD3QJmxGoqRzLk3r+JbQI7rkPssSB4ky25SHLH+VVQUJZZEEr5lfiozkux1yKmk0c5L/j3DBMP
 b9bMC1TB4NKdUZBMARqHzEYbLFXNFQGXTB8/NfyhjJBTA3luOAW6jLGZxmh+mENXkI4+4BW8zVD
 ulGsiiueCN+NdmkEOGbSyNsqU8LmpJwu6PDR/hiXzBOd7wd3E6BSQ9RcitGgp2+ZBzFMfxYkAJq
 lKhG3SacyoggMA8yRI/fSCFWzseuEAq6BnUlyfqTnkkk7Su4k3FcCKJVS6dFiXLCzCGBOEas7LO
 SUj2eMmiYyypxmwd2xRvV3tLPkDuVjUBoCOeddle3d1kgdXDt2dTIsIbG2wPYPps7T6xd/sqDGA
 2CokkUhMXWEY4fa5oPA==
X-Proofpoint-ORIG-GUID: B7QoS2gP3RZ795YepYhjt6dVEbb_hNuE
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e1ffd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Gb3r-SE-3tiIfwJ9XNYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: B7QoS2gP3RZ795YepYhjt6dVEbb_hNuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096
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
	TAGGED_FROM(0.00)[bounces-117567-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2D6C7240E3



On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index 90e50c245c0c..721526f023dd 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>>>    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>    			dma-coherent;
>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>
>>> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
>>
>> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
>> preventing gem_noc going to sleep when icc_set_bw is being called.
> 
> _why_?
> 

Now when i think of where we implemented the hooks, ALWAYS is not 
needed. We should keep it ACTIVE_ONLY since we are already voting it
back in resume pah. I'll fix it in next revision.

>>
>>> then drop the extra suspend/resume play?
>>
>> Not sure if I understood it correctly.
>> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
>> or in arm_smmu_device_shutdown() path?
> 
> runtime_suspend/resume. I might be incorrect here, but I think it is
> exactly what you need.
> 

Yes, I think we should go with the ACTIVE_ONLY flag and we would need
this voting in suspend resume path (For the same reason mentioned in 
commit description and cover letter of the series).

ALWAYS would avoid the need for this handling, it would keep the vote 
active unnecessarily, but still that would have been nondeterministic.

Thanks & regards,
Bibek

>>
>> Thanks & regards,
>> Bibek
>>
>>>
>>>>    		};
>>>>    		gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


