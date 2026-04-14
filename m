Return-Path: <linux-arm-msm+bounces-103069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BcLF1/73WkemAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:31:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF03F756C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09428303FDE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB9C3A5457;
	Tue, 14 Apr 2026 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiH8ofOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU8HEa1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6620D3A257E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155228; cv=none; b=t2y5d6fUda8tv547Cg73Mqk/hR/eykujpzO8XEAgxzVZRdo9jSpxda9mnjqt8179jCFv05D4fuJ0PR3oczTrfubz0c70fZwlfpeaGW1FIAPBiVY5UlVJ/jfa0pcD8MGYMupHCajvbTt85/ebsH4aZQE30ugXlkSOhFO8sywV2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155228; c=relaxed/simple;
	bh=F4paP3AYrGUdXYxOVyHozv15q2PNZRMdSNaf9srxWgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMr1Zycxe7dziKBb6aT52Oe1xv+EVaPfeE3B6MycOmses/aGbx0xvFF86Xx1wWkw4WHj8tEN4hRIoof+xej7T/EisgAyBRDbLUz0YrfDvKWEXO7zi4QXX8amrXUc/3C31lF2rOLlw3ykY/uOcVpiwccl2aFh9TN5g0RBPSBKBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiH8ofOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU8HEa1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6bPYH2386512
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDT//1wLOvhRQGRYA5N8g1SyqlnI49rmAoCo4iiPEqw=; b=kiH8ofOIHJPqgGzs
	k8wLk/jOHYJ/xn6j9pHkqxc16RAhfp0kgrXWhGSt1wDKjQz+THZy/sxSiFyAiDRN
	34NLXbb3wEAJa1TlC7fc85kwViSpVTv5JdvQQLomcvHQ9yMTEnfOU/aEbqaMR0IM
	u6kuFzqajzFCIOjCEWNp/98x1xL0m8nlpK+9AFjLoJEZIyfvaf7ykhgesQL2GZ0z
	GzZvtoAYPsdEO8QMsqdVkhRbA/8qu/+pqIMKVcDZCSoaqwrS+81+SnEuYqG+jVGX
	X7mHo2gWkWyKvosVu6Pv/1wGBCC9M8IqCWFu6Pf7GjEf+E1BDRFhGikIQOiwYPW+
	tlyAfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w1sc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:27:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso152822785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155224; x=1776760024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDT//1wLOvhRQGRYA5N8g1SyqlnI49rmAoCo4iiPEqw=;
        b=UU8HEa1USsEA+BcM5WyK2HtFNCuogwN7cGe5ibPgRtZEufHm2JVzTkgSW/tRt3/iyF
         aVmkJBEr8WUfzPScKRc2KvUzkkBwQB3lEFomqHX3j4+f4/YI4tPpp2/VfZbLjvAid/WQ
         2LrC7yt9y2BYHaePVCoae8tGlju2t0rwHciN0cxxSnc1z4anQN7+ZcSXhJvXe4LhIscy
         E7lvTIdLdT68ENN2D7g9uocMYmokcWDicOa119VgRfsXq8mLriBlWUlbMt7X3csY7rlL
         RAiSfG217nVrs/94ITs4gX+GIrDCFkOEjSOU8zzwbbWDhCiQVryxQHdzPENwOqKpOnZI
         qruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155224; x=1776760024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDT//1wLOvhRQGRYA5N8g1SyqlnI49rmAoCo4iiPEqw=;
        b=LF9VIOLBwi4WniI+Pj4oqz0+3+clgtnrt+tDFKemPYXPcQhjAo0hgmmk83HERl41+r
         uzZuDwciOENMbtnl0eHp2dcJ51GhPpCeNms2oz2MD3kZmzwLrRhWl4KdOYtPZZKzk3qI
         y2V2hfpnfNdc4QfvPlRJzmR7mvfmsJthF2Wd1FhmYDlUUT9vsBDmUkfIVN6RCYcp2Lst
         7PkDBQhuK75nuvVlwglVV3B0asdAURsFtq9uUEu+S9Bz/1YfhwrvqNH9QSFQuOYcSq+o
         biZahvUPZ4tjftqezhuyjHeu9GD4S1hRDh9za/ZdWiVc2/ggTL3cBVoIt1hjQ3SKmJ9M
         odRA==
X-Forwarded-Encrypted: i=1; AFNElJ+CZISUQwoRLS/kLGSE9QqMZFbbcUs8IDwAbYBL6V+1zMmRcD+GETMx46EBZ1t16Q1x+UFH6Ar1tzwefQd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJsnOCGXxpjyLmTtmSgyHvUQwT3lTnqHx/vmTFTd10ZRKkBjK
	tOodCWaKavgcj1QVLwJxj4pso2jwWpDZCqzuVRK9JQN92R3sd4QkgXNYm/NyE9nFzby301QVfI0
	wz1dI4JcJ1USFf69QsszP5lxOTUBoKsP5ZaJG7YKYgFLaNuVhd6Jeao2xR5shpWCOgLL8
X-Gm-Gg: AeBDiesP34LnxUznAbTU9e3R70E0zj6gHMvDEGH4LrV5qClWCPCzB0vuqzC4kSvk2Ue
	faRPy3PHQJHdIbxZR2qx/49cZiQJmzer+LU67RqYbxpC4nF/nF/5BNLOZYOWICyMhPQvfNz6IHt
	xw6KWgsflUURAky0WJXVKQIhHvf4XzqR4Z6YFBTDRAnmiHnCVrEhrpemLfOSr/W2D/cXgJ+wPWl
	b59OXpwuREqSiCUnZtzl+U3AnvZ29+A60mP3EpqXUtV3rhhB4AtkqnqCJy8tuHjORrGk13oCCjh
	dj75s29T3DPpMWJ20YqIWmM2l3hq1JuoILr/5WQ/qes20TJsDzQxfCdRcLTzPTesoVkF89ECMgN
	qHYDP7VNk/aSfRoDOeuM0RkzmTYlV9ntUT0W04eGtQYQ+lsfH2M7fhmnk9F9LS2COnesIqA/QTw
	KVAPF4wEONssXT3g==
X-Received: by 2002:a05:620a:1a0c:b0:8cf:dbad:263 with SMTP id af79cd13be357-8ddd00a8658mr1644298185a.7.1776155223937;
        Tue, 14 Apr 2026 01:27:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0c:b0:8cf:dbad:263 with SMTP id af79cd13be357-8ddd00a8658mr1644295985a.7.1776155223432;
        Tue, 14 Apr 2026 01:27:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm2847759a12.24.2026.04.14.01.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:27:02 -0700 (PDT)
Message-ID: <fac86ab0-6479-422e-a9ae-27d643767a94@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Make all VRMs optional by
 default
To: Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
 <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
 <4dafae66-1ef1-404c-854c-b72d3313f5af@oss.qualcomm.com>
 <70GGl_MdOrdjIh3ZXqqz5y2NU0HwZ-HIZIzhglTAIpsyiFeyFKqDUUQe8f-krzLSzirMGLjlDsk2YK3-Qo5c7XGqv8qq6NK5F_UCPdt_hqE=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70GGl_MdOrdjIh3ZXqqz5y2NU0HwZ-HIZIzhglTAIpsyiFeyFKqDUUQe8f-krzLSzirMGLjlDsk2YK3-Qo5c7XGqv8qq6NK5F_UCPdt_hqE=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8ZoJHsDs7ZRd1lPT81i6u5ellxhNqdxv
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddfa5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HsagrseOr4lGoIFxeuAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OCBTYWx0ZWRfX/MxS+rcB/KvP
 1u7IuhyNCgIpbyI/RiSIAk4IBGtt3vDlsBQF1QmkTiG90ODOH7cKthgmrSxUus8JWj6KU7SXlB/
 hFiN8TuQRUiLCaGEPqlIfqr71ZTu1nMWoCoj2wUWk/Ct+oQbBpm60xN7ENyCwvuUG//yV5Dau1F
 RQQgmvP5WniQD/m/SRphxobS3ovRzaxCjTzwuQaymbO9Y513TqNyvIkDuNE7xH8HdsEvfUZau76
 IRyQ04zCQkntEEKTKyfs5W1efpy1aBvs5N57e3kqVwMjXNkKyHXWfgt5ORCs7nU3Cg+eUowYmH/
 rlnSUJIVBNthUCouilSBajog+B0zC4gUH8c8YZR7tUtALFaOC8bNH+VUV4RwtpogKBXivqK/Cg7
 aC8k/gswF/l+LuBlmMbd6aTJ4q76TeyL0p1r8My61965AxiheGET44HMq7G3nmscm2I9ENQr8Ga
 u8qQc4eCQZz2jjymUCQ==
X-Proofpoint-GUID: 8ZoJHsDs7ZRd1lPT81i6u5ellxhNqdxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140078
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103069-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDFF03F756C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:02 AM, Alexander Koskovich wrote:
> On Monday, April 13th, 2026 at 4:48 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/12/26 5:30 PM, Alexander Koskovich wrote:
>>> Some VRMs aren't present on all boards, so mark them as optional. This
>>> prevents probe failures on boards where not all VRMs are present.
>>>
>>> This mirrors the downstream approach for this issue.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>
>> [...]
>>
>>> @@ -976,6 +982,11 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>>>  		rpmh_clk = to_clk_rpmh(hw_clks[i]);
>>>  		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
>>>  		if (!res_addr) {
>>> +			hw_clks[i] = NULL;
>>> +
>>> +			if (rpmh_clk->optional)
>>> +				continue;
>>
>> if (rpmh_clk->offset == CLK_RPMH_VRM_EN_OFFSET)?
>>
>> That would let you drop the rest of the patch.
>>
>> This also needs some additional background.. I would assume this comes from
>> a slightly different HW (PMIC) configuration
>>
>> Could you please do `grep ^ /sys/kernel/debug/qcom_socinfo/*`, (perhaps
>> censoring your serial number)?
> 
> /sys/kernel/debug/qcom_socinfo/accessory_chip:0
> /sys/kernel/debug/qcom_socinfo/boot_cluster:0
> /sys/kernel/debug/qcom_socinfo/boot_core:0
> /sys/kernel/debug/qcom_socinfo/build_id:
> /sys/kernel/debug/qcom_socinfo/chip_family:0x0000009f
> /sys/kernel/debug/qcom_socinfo/chip_id:SM7750
> /sys/kernel/debug/qcom_socinfo/feature_code:2
> /sys/kernel/debug/qcom_socinfo/foundry_id:1
> /sys/kernel/debug/qcom_socinfo/hardware_platform:11
> /sys/kernel/debug/qcom_socinfo/hardware_platform_subtype:0
> /sys/kernel/debug/qcom_socinfo/info_fmt:0x00000016
> /sys/kernel/debug/qcom_socinfo/ncluster_array_offset:228
> /sys/kernel/debug/qcom_socinfo/nmodem_supported:4294967295
> /sys/kernel/debug/qcom_socinfo/nproduct_id:1135
> /sys/kernel/debug/qcom_socinfo/nsubset_parts_array_offset:232
> /sys/kernel/debug/qcom_socinfo/num_clusters:1
> /sys/kernel/debug/qcom_socinfo/num_func_clusters:1
> /sys/kernel/debug/qcom_socinfo/num_subset_parts:20
> /sys/kernel/debug/qcom_socinfo/oem_variant:0
> /sys/kernel/debug/qcom_socinfo/pcode:1
> /sys/kernel/debug/qcom_socinfo/platform_version:65536
> /sys/kernel/debug/qcom_socinfo/pmic_die_rev:2.1
> /sys/kernel/debug/qcom_socinfo/pmic_model:PMK8550
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PMK8550 2.1
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PM7550 1.1
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PM8550VS 2.0
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PM8550VS 2.0
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:unknown (90)
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PMR735D 2.0

So you have:

your phone	vs	Abel's Eliza-MTP

PMK8550			PMK8550
PM7550			PM7550
PM8550VS		PM8550VS
PM8550VS		PM8550VS
PMIV0102 (90)		PM7550BA	[!]
PMR735D			PMR735D
			PM8010		[!]
			PM8010		[!]

And hence the difference, makes sense

Konrad

