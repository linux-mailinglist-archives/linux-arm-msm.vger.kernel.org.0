Return-Path: <linux-arm-msm+bounces-94214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHmYGQXQn2lVeAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:45:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A11A0E33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 05:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFB33301D957
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BD538551E;
	Thu, 26 Feb 2026 04:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XG341JVB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geuKUBK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1B2AD37
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772081153; cv=none; b=aOyx+OnboGp+tGGHw0DGT/8KgxuhrnIJ2iolGePgWaJUTIL4N7FNOOvb326+L6CHRj99EA/KbJzygoEOXWVEbqvuTyO2WlIkCOy5qn7WTHmoC+XTuyIbwSh4RtlKSGDAv5aGoJwNwLSUzHStObUMKXDWtldUE5Cia2kBYCm2QNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772081153; c=relaxed/simple;
	bh=0n+P4MmSpe0QWlVztj58VkuID13p7Stq1zkRVOvoaqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCmBlU7czNLqs732BGXhoHkpirdmdkTpgLRps9tjZWvXXadgCAAisxQ508Mf5WtO9PgVEfUKxUCYQ62yc9g3gFz3qcRzBaM7V2/uTQrVt35QrrULaPy735W2eEaKfWpVFS5bPWsgJ3JoROIf6eUOM7ORDb6y5rn5bZkjetLAorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XG341JVB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geuKUBK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VRmd576488
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wkpa8xuDXDf7dfh9n2vR0UL0ygp88oAfJyptUfvj/o=; b=XG341JVBiu3eeVv5
	Cei99YNwUq4ZzlWL9rY6V1EDGOzpBwspNEfqkSNKTkRNNwlMioFVv3FDVzxHhXk8
	8W7uODe6hUJ7wQXHtCKvPkG1VN51F+shYxIma7LLHo9ecrOHCSWdf3Y/zepQKTgK
	+gVO9lXzuY5aydkyINIUZCxqbL2v5iKGtWTT74YfvPUebrOyyGFOYbglwH+5OvPw
	FAcXAOL/2XI7kEuvIqYC/Qra/24MTidJWZkF+LhRNeDOhM+yAoWMlETSrOvXvQ39
	VWLJnAdVGhktwb4o24MnKEC6Sr25I4jWoeeSZuMIVSRCGXK6xxEBEsbjPHQwNwy/
	ad02xg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350j7qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:45:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35464d7c539so403035a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 20:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772081149; x=1772685949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Wkpa8xuDXDf7dfh9n2vR0UL0ygp88oAfJyptUfvj/o=;
        b=geuKUBK7C4tMszrfOH8nLGCrwEZOC0i6MlUJHSmqQjcqprOVJMOc06I7uip6BdrZCO
         6/kvX6eVi1uPKhOhMG+5M4bxfrhwXh5dPhZkYHAMkaZYsqVWAQmE1nph9GI6rVDgZ+7a
         qudscBoBXSU4pqa1CS1QyzEomNphch7iCJl0T8FoKPC5RcZRddULL6xjFdPu8Y1Jahqm
         NTIna7ZPke/hCv8+rR/ZwpDmATJ808515QH1jDVIEIFH/jgbwYwQETnX7WWiYiJVulF0
         bfAHM78Klg5ZescaCW8ddFqAL0b9bDL02ELdYz1gTzp12bK86A6DwpQZ/o2Mh90QbQUJ
         SCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081149; x=1772685949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Wkpa8xuDXDf7dfh9n2vR0UL0ygp88oAfJyptUfvj/o=;
        b=KtVouJtzP8xPHsHIxGrDnY9IAv7rGp4Os90PBrZstVRgCt6hA9AN2HDcKnoCdLcB/Q
         Z9nzKCiXJYTN5Qs+kI2EIx6st/XPnrr4CQmv3BbPI0t6VjFed7pygTBiulRFTSnWUIqh
         G0QdExTEcJLGGfATE/vbwAtn39ORCd760wOwsgs692L6paN1Vi50eBW2Sf2NDfz1jFOp
         cwWS4QyJNlPrN3jPXa4BiHfLdoEjm0yotKeOxsQrWw0ENqnZ/kWD+hzTDPtZCnu20E8I
         OgiByoqO6085kqy3tpppLSDZiJfC0o2BRwaGVQFioWo/C2ZEd6SIZ9UOEgyqouhaYX5d
         8jfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgfy6tqttAG1t6ZGSz9cVdzdfo/k3BUyB7lOIm39QPwFXfEDQuYgOPZ1piGD68r5/208X45xPFc6atxHTB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk0jnJzxP4r0vDYFVOq5jqfCXhugDgWbnHWDRSAwxtm+gbiqQt
	LN56WuCsJhoQMKyNVt2Xaf+JBqiDZic90ZGhUqn78oZh2ovQL28syUH9LcA8jERNPxMQouneewS
	6JWpOISmCMWcE6gbzQxwWX07HRObYUV3kbVxc+1AVLSF5DHHv7fHu0dBwUZaRFu13FZZI
X-Gm-Gg: ATEYQzxe0+0eDJJN/BISsHK47HjD25tlnkbtlROB8kBGINv5m6ddiDZYn3tVjtZPnkV
	+/wQyoCkyJn8kNu4jgE8hEhC/hFXENxnxQ+XVyCJPX+kkY3goLBQ0ACGVuqoDBMwiQ89qIvvtL4
	5JLUfxYCU5yOIB48IDl74HMJ3+/QaCpuV5IRSzWQAZoac137agmMh0CQEmACUb2Gg0OTkHnLuQ1
	qOi2eMc3JzliIKVfbu9Uk7tZXSamYZ3wc7MEZWG1F5oTcj6NJm4wmqC8z72SpeQKwNtmwLqhD10
	AKKnoXUR2L+/K+qESNc1eSINQj2KiKbqoKA3ZOvrx/k0q2rXN2G9dvlO34Vir/u8y2ZBSq5kF9u
	pjG6S3jkuSVU8F+Bvy3Rr2n1BO99PcoPyQEi4CO5jwCtgX4qXuQ==
X-Received: by 2002:a17:90b:390f:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-35928a5832cmr2322844a91.6.1772081149454;
        Wed, 25 Feb 2026 20:45:49 -0800 (PST)
X-Received: by 2002:a17:90b:390f:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-35928a5832cmr2322824a91.6.1772081148977;
        Wed, 25 Feb 2026 20:45:48 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35901883a0bsm5712868a91.6.2026.02.25.20.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 20:45:48 -0800 (PST)
Message-ID: <745022a3-ecfd-42c8-a01d-5861a9f479f1@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 10:15:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-2-6c5408564c3c@oss.qualcomm.com>
 <pis46xtmxgopk4w4kvu2qbbtcwchnbepaqaw3lbtfbon2cbjls@xjsfo65uj64l>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <pis46xtmxgopk4w4kvu2qbbtcwchnbepaqaw3lbtfbon2cbjls@xjsfo65uj64l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WKt8tv7QsGkOo5Q_Di1C9rCvKEfeJj3G
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699fcffe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6F_KMvjuWJjJSnLB6NgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAzOSBTYWx0ZWRfXyw5gCWj+DFVl
 ohTW8Agl8NHTTID0AltCQ0mVzLp4pI7VWx3CF1IJfmR4p+HW/V/TuaapTqZK7u+iuBm7Iz9xRyK
 GP4c6nxmjNYJ9mSynZzaHBGagIlyp825dtJ7bsj2C++scLH2fdjn92zGRjbXOLyKxDNU9dEikDB
 XSOx7HXi9Xyh81sOjGOTJKGH3as7wWjzH79FjdC+P/+CR4/PVLp2ueUxJhR9nPDoZAwvR/U3fe8
 cYsfhVHAAvfvzooi1xd73m19nUhX7t6W4BUnpyJS2rW9++0QiHjE/WGKgqMVSLnDeZ7AdUYqvSK
 lJxF+i+5YVRiFpiHLENGDtbyO/kdNwZ9hm+1gb2siskRP6M741Z4IwXDBOHGitLVi5TZkcWViPF
 BC3SvgxCRxQHLNHfFBuqgITJ+qfCrZR7xjgQXylq89fFEQlsnbuNN4eYlUgBhepKtlHChPK/gKT
 5mFf+RQjQxkQkIgVtNg==
X-Proofpoint-ORIG-GUID: WKt8tv7QsGkOo5Q_Di1C9rCvKEfeJj3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260039
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94214-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 289A11A0E33
X-Rspamd-Action: no action



On 2/23/2026 3:06 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 20, 2026 at 11:24:21AM +0530, Taniya Das wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Support the graphics clock controller for SM8750 for Graphics SW
>> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
>> block dedicated to managing clocks for the GPU subsystem on GX power
>> domain. The GX clock controller driver manages only the GX GDSC and the
>> rest of the resources of the controller are managed by the firmware.
> 
> You missed patches for the gxclkctl driver.
> 

Yes, my bad :(, I missed committing the change.

>>
>> Update the compatible for Graphics GX Clock Controller for SM8750 as the
>> GX clock controller is a reuse of the Kaanapali driver.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig        |   9 +
>>  drivers/clk/qcom/Makefile       |   1 +
>>  drivers/clk/qcom/gpucc-sm8750.c | 472 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 482 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..817b13f5e78cb534e165b09d95e70cd4a58b12bd 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -180,6 +180,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
>> +obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
> 
> I think, If both drivers are built-in, this will result in the object
> file being added twice and, thus, a conflict.

I have tried compiling both kaanapali and sm8750 as built-in drivers and
I do not see any conflict. Please let me know if I am missing something
here.

> 
>>  obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
>>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
> 

-- 
Thanks,
Taniya Das


