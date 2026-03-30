Return-Path: <linux-arm-msm+bounces-100654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLK9JcD+yWl64AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:40:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0C35552A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 033FC3006B3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DC43815F9;
	Mon, 30 Mar 2026 04:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNplJOve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTtgv2tC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B3286D73
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845629; cv=none; b=srWeLr/eG385c4X/EmKQ3Et2M8XlauRE15ligm3bpR4xXaCOoH9X599R00gsl+eUgfeFEEug5gCsdmrU7jRC3piZVQFwjWGU404P6MesGwJMHlSL7Rjr9udJfi4ZxkfyIjJbqZL8T8Fng8Jszi0GK4RrI360kqug/IZd4wsnZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845629; c=relaxed/simple;
	bh=R159vo/2gogafejfPEcTUgl2FWXZNcSUzLIw/hjie44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK1W4LnZVuV+0a5Fx2sLSL2mDLc7Ckh9HrsHgobjhHMT3Nv+doB/xVfYmyjO8XDwCbzRMuXC/KQkfxI/0Ghi45tfcs0WLf2W2VPdOmx74KNChnPlvQQddr0Tme0Yz0hQup1IdxdkobXUMV9tPorXgZ4Kxn3nXJr7lODKEwTsEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNplJOve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTtgv2tC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3u8UV2195654
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxIrz6lqgl8INlv2CG6vKfWIRSC2AzWItLIRoJEu4xc=; b=pNplJOveWazggGEJ
	03skUawdUr3uoJLHDAwXeBMGCB+TMSFFVg5Cb65AtwXFEg30aTKljlLSnJN4b/mZ
	7/z38cU0NCt/VmQ34HD7RmMudgg641UqDkGrpkKsY6UyxCL+A3DBKqyc8JHolze+
	MWFcIGqvSJwpUyEg/1UhlQZJIA+Q4eUsxQFNIeOEV+MdotFMw+23fzrffi5a8Cc/
	D9rC0NdqrxGEthHKUhpZvCaCURZF2HikjUFvcDrWKVyn8+PNS1JDkARTbJxT2szB
	ocY3Pv4IdoS3m9I8p1eJUHENCqhqP6UxgN+jfbgqXMuynGt6LG04JTDwHxeGjgT8
	otY1Bw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c2aeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:40:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c699d8caaso7737056b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845626; x=1775450426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxIrz6lqgl8INlv2CG6vKfWIRSC2AzWItLIRoJEu4xc=;
        b=NTtgv2tC70f99ZO5yxHrZCKxjxiZm8mvVeelTQ7NRLGBc6GPST5bJqcCv7S2Jesjyb
         PQYIbgTgk3QyU8zn3remSZz5V9Zq2Y9DM0TvqgZFSYGeSq029XL2LNQEmfxntPAhMggQ
         23hZJdrz8YiLmtJfKJ2bpaOSRRI2kM58zq+O6SCQt4jtwMgy4WJ90nZwkqwcpjDfFLeQ
         k4evPfTz50ZqkhxZevM/LNtcptQLfzX2cF8WXduclSF3ez+DJcNcTqFQ2knCbLKHc3za
         mQ3QxGnX8rFlxtpPPixSO1g9ZLhQqRAQBpu1hsbYDKXD0u1QmEEuLFTbuhH+wR9kvxy6
         aAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845626; x=1775450426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxIrz6lqgl8INlv2CG6vKfWIRSC2AzWItLIRoJEu4xc=;
        b=UobyQggMqDaN3O0wIDjWyj1oYJbLcsHU6kpfCxLxfB+00yv9yn8Es5SDAZZ4BW/B6+
         5xOJITILXRroQpv3G5ezXxn4nJT2JUNHgmtOOQVwzb4Nlxi1KT7jvDazfUjp9ELaf1sE
         npNKD3wax2CPtzTxcl8NWFjY7OO71RBs/6faVrOt7d4N5VVGXH4ZZF96W+UmOCsJVFMR
         PnfN6Vh3ZjvpGP/3M7e4iYy2l+yaTf3Mn5ck+BDtDK1PLHQmU7BUGP3apvjAelHPdM8z
         tfwARrm22AN52wVYE6/sDhzfL5kcoXiQuwpEo9XUv82k8wfCp8evQAVJGTThMbzctJHf
         VbkA==
X-Forwarded-Encrypted: i=1; AJvYcCWRPRc2lTxNIZDbx6MruUO78AVMHFoSPxlApt2DeVjdObULnPrwXVBzKW812qsPfbchmurqDCdL3QURm2/N@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGlrdWNaFwlkepklIoqWR/58vjJpBdQtj+kuODqaGVOmzqunm
	mUHYOovg2OMrjtlTRmw1MMARDWoovZHWneVSWwTKcB5bKLSDWoeGfG0s9eLGZZQtJz5Mz61+Moi
	R6z4cmYv22J3eaAFI/z5w8yMdt90aH7tmI1KyR2ol9zVroJMLuXyXOnzF+a1FmEVIHxxg
X-Gm-Gg: ATEYQzzMrU8IHEuXi0V/y/s7CNMenCOZQVJND0d9F+Go8gtl96nkVA0h6w8KIGTxzYD
	hmWsMksA9zgYVS28zgVqIuQ48kJc16Z0BPB9R6uYEEhxw5lxdzWauv++9+g22F/ECRWKqxp6/Yk
	0l2seZxVXA4cqkA5IfPHF6ggTFK6jUoGHrM+6KhL+0EDH8/ZGvOwJYGmU891AiSnMElXH1k2lvz
	0W7be0j2abTO4aueghpNonBsuWvV44f4b3jRr2VS/TUPIQ60pBhSFf8wQZcS7bbRYkX1pASSfwg
	BEro4EVtvw9RSKh3UIji+RFdu0R9VWDUFjCrwI1/ftVOFyk394lrSrJym7HHl66FB1JNQYzry4H
	t02w7XZo9Z1yiSiSJYo1zlmlQajnggyW+X32NsPt89ddpSIRP0wDzuA==
X-Received: by 2002:a05:6a00:4c0e:b0:827:370b:2695 with SMTP id d2e1a72fcca58-82c95eb8cc1mr10649772b3a.29.1774845626199;
        Sun, 29 Mar 2026 21:40:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0e:b0:827:370b:2695 with SMTP id d2e1a72fcca58-82c95eb8cc1mr10649745b3a.29.1774845625706;
        Sun, 29 Mar 2026 21:40:25 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b20csm6926179b3a.8.2026.03.29.21.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:40:25 -0700 (PDT)
Message-ID: <2212d12a-8ce6-40ab-8bc3-ab8e3b9111b2@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:10:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <20260325-dancing-macho-coyote-deaa55@quoll>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260325-dancing-macho-coyote-deaa55@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfXxnpSSQVY35eh
 kqiyh/act9jP3fua3KhtQB558OH9xZBfI1zbJ6YKPMuUeSfYyEryktZ7KdOu5LJtxz6L+juR8lX
 gaekTUJnkZtABZRo37k6g8Pb+YTm3STPY4jXVsdJjS8fUutwkksS2gAw2MZUCTDdeNFu/tjfaTK
 EsnfqFPdzCCEp1TFKQ5MjzJHgLQw68lAddl4ZOYG64SjhOjmuvOhf7cd7shhz9gjXJ8MKoJ2h88
 X1A4C6yR80W+UF9WOVPTla1DAsr/zvmoKQSmF48fz+VvOhENvuuFhLfdGAP8qffwmfeCLlNgvgh
 X6sg9Zhn4y+KHGh0lH1jewqeMygDiNdl4Cx6xi4Bj7jJ3LM2a7+O2salpPINrd7HSPRvYyC4aS+
 n4iC+SiMplZO9I00DDfFeVN69A1DDlKZo9z7DDJ4d36bhAo7yurJ8xIo+wccMrMFMjFV5EvTNcx
 lPjc+i8NXnTUNMXaH6Q==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c9febb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dPh6dh2MmqIcn93rYEAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: JyrcJPGLG9eoJrSoAN0-LjAlbsyTh-Tz
X-Proofpoint-ORIG-GUID: JyrcJPGLG9eoJrSoAN0-LjAlbsyTh-Tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-100654-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57E0C35552A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 4:43 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>> the QSPI controller node to enable support for this hardware.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index 75716b4a58d6..fd727924b8ca 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>  
>>  	};
>>  
>> +	qspi_opp_table: opp-table-qspi {
> 
> Does device have only one QSPI? Then table goes to device node and
> binding needs "opp-table".

Yes, it has only one QSPI node. I will add the OPP table inside the node
and include it in the binding as well.

> 
> Best regards,
> Krzysztof
> 


