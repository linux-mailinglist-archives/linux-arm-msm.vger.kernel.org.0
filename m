Return-Path: <linux-arm-msm+bounces-116623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T1/bJKU1S2qkNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 06:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E270C805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 06:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j4LmCalt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SnrvUr52;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116623-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116623-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03478301C8B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 04:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2CA3BBFC0;
	Mon,  6 Jul 2026 04:56:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD73BBFCE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 04:56:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313766; cv=none; b=U3Hsrmhxc15dNH/4koLu2+juhBXIwVlCvcKaYfyFYu+xnax9s9fGFgWIFI/Y7FGjRpn6+bhRjjqs03x8TGm0JCIANU0Ytc55KbVUMq8RmrW2YT4oIKSlMcae+0bkOGvEtYaM6o+rPfkQBVE57Ac9qeANYPocZtuc/byP/yEeS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313766; c=relaxed/simple;
	bh=9b/4FZ+3+qRq+fXpfPVgslie5izhocjgJJoFMG79fvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0r0n6otqAOhn/6zF2fceMWfziQpZsJjrHpT5eymVQcwq14FVCgvJfp2rS73B3mcLhqYCY+DgKtuojYvPUmMj4T4bMLwohRnUo1iWqnjE/E9DUb3dKNuwyO2v/Avc/7ywhvbWG3s+1jJkPHKKLtG1axpY1GVBwVturxYLluE3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4LmCalt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnrvUr52; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666424GJ3624983
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 04:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=; b=j4LmCaltYE0CabBi
	kSx3so/eLQvWs3aD8BM2OdPb4VrmUEhXHPRP6PHTurRAUGApb4DI8wBbHohRNuzE
	DwjXosTJH0ygtSmymmyS+PfzIHWEovaj3Tbzcp44Siw+f/A4x/22UrYMU6Lxv48L
	B+P2XT3XZN3nJnu9J8/ccPFFbDqWpKHIyG4kLhhFKrPQPEmEnW+Q4TUTiYRJ5Fhc
	PItKcXkNHhckYJKE6L48DzrG6xUjuDMgn5IAT3D+VncxXz1RfXWKizgJejigU2hU
	5DUV/d5KE3tuU4YXMC3DN+8hnKwDazsWO7HG7W2lGXX2YxTWpi0fYcJEH/VWXwPM
	Cjfgzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4svg4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:56:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so2243962a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 21:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313761; x=1783918561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=;
        b=SnrvUr52EwfTpazaBmOhtcWGLTHGZaLb+86PCkDbNV4hRXiQIP5ADoO6Uj0apvX66r
         /UG3D2ZtE67N4L4IfWUk3YTR+M+zhTIPOMDzNtcJofS+TB6tXXBAvVTSxcmB4ESSoHxp
         o3qvnu6oRTa0rypi0d9TlLqPc0aI6UZwF2giZ7qb9/bAXo0c0nTwb4vLfDxesVA1AA0p
         urIHCBeIlnCXNZxcHJQxJ2ue2fKUELiN8xgJrXR7Ju1KKpg6wj7SWwB5LbuORb/yXXUV
         1T6pv7HkYB5Ioe+TU9JDWWu74wP1SICM8IxBxtaAxaM3E/XzBuJzbCrjreqjDDaGJB47
         aE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313761; x=1783918561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZuEm94SloL3WtfgsZqmYPrzPC054at/1BedQur6MUE=;
        b=nyiP1Dyy4BVhv1vL/Sy/5xBEj0OP3bpiNmMnIgQsU4xqUyThNTs77IZedElLwBLa5/
         bCxJQk5aqikL00Sk+6BerSyBGQETKPZqUZqQUH6VVs0xbGzFyPljKbhOHUTrkKWUKCRW
         RJBcztX4M9FbcpB/6AsjX4O0f3nUn2TbYqHIRUolZoVRhhn52XYkQPVDHveuV0RvmSUd
         GKvXLFTgq5zB12QtU589mU0sZitdc73CJsUzPjZDRSk2Apbav1PbK8WBgb1jxEuOrm6I
         flDOwkmZTzGXQr7tz6OSU1VYymNEtMWi102aaf14LpTpGAkRgZTLBRA9mw84byzWPXf5
         nxDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIFyC6KoAoxIWtUJ+BKn4gVUjwVQU1egFE06xB2IrMn0EvO5091ANii3qErGuLbah62IY+Ns937X+Dxarf@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFCo6OOgJzTwLwszfY0U1ojTuUH3PNhtv2veg9fiCGInRzpEp
	qpNXVsRICuO14Mu0Jf5/aZBGkQL211VK7dMEa6Kay4Cm/tKtz9ovzKRPv2tvDAHxMB9142VHZyl
	VwrxjB1yEw1tWnXmqGgPMbYuSTFIQ7hccVtrByFu9uh5HUA2+U211FisY7/CEpXeGxiuq
X-Gm-Gg: AfdE7cnHM5CWMRmFLibolCczgUCGQ/UIFzGAhIzmM0PoWHlcT5NyVGKdhdycy9nhd1C
	D+9jLtYZfOAWJdsnGGK9zVUjsMI/JocAhQKV9sOSv+zV0/SoWd3i3rJG1k7FIavjVjs2T/UO84w
	tR3/kjlJdPKGK7phWusQHBG0CUQHIGy/9awC0KDBJ6x9IgAtFIRiEQxZEOnPIMfekw3NaHDslNf
	Zkvya1vHQOISaLjrmPhNedEz5KhyCRyPndpWzG/TNfbqRKQ9KOddLyKerYLe7GuZOO5WLmJSJxS
	KeGdkS6KICXrLNm1+rUW4eEeOXFGRkUyyq7jyFbcHuHKSuM79TQVgobIFw5T4yhcCTRt2lWpIn9
	kduIs1yDBsIHNf3nYAy+bDMRXF5TT2B52quM6cZA=
X-Received: by 2002:a05:6a20:6a07:b0:3bf:bdbc:bb0a with SMTP id adf61e73a8af0-3c03e21c329mr9214396637.17.1783313761491;
        Sun, 05 Jul 2026 21:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3bf:bdbc:bb0a with SMTP id adf61e73a8af0-3c03e21c329mr9214364637.17.1783313761066;
        Sun, 05 Jul 2026 21:56:01 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm62052392c88.12.2026.07.05.21.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:56:00 -0700 (PDT)
Message-ID: <6b691eb6-07b6-48e8-9952-8a88e315a5ea@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
 <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX1ZIGvm+bKuoe
 cnwOufMi1YeVzAIyoN1PACNLoTMwKgWGrMREXqVuZM9iY0a09mT0yHZrTb0HMFXuIN8kXwk7drD
 Ixl13fuiAEU8pzRk4t1qwMLRJLekx/Q=
X-Proofpoint-ORIG-GUID: u8Pqbur8nhl2SBJowCxL97TZWsCLCbRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX04PN4RehrI1p
 dwCEi982AEhG4BkENFbEJwFpp9lSDC1Pa2OMEoQpHGUCU3h6+dHadfAGQgglV8IrWt+0jtbW9ZH
 39vCvOToeiHL2T7ruMmFgFEQ3R32bKDdhS+kvnB/7rwJ/he8+UHJPycfKkJeTAC3Y+/UW1IV30e
 CiodrgOpWgUnWRJVhmWskgpHQzHeJter5Sjjk3b0KKYo9zB3C8wi5yNdG7UXmeZ7aMJG/Y3RwEQ
 z3HbSGO2zTf27OPgO9vYQsroY0u9cJohY322DQIfZlfkz/5fM42AEM0aDkNXPGs1WXl9YhokTPd
 zG2Ij+trAPYSDJKJuZByEHoqsCqL64Bj/1XpOwpo2aXj/UpWh4mDl5arCEBRMqE7FqjutH8ly5w
 duPIqQB8UjT8djNmHg2lTpvrB5C0I3UfLb1+1xiOSIjVXmK8MZkP+H5m0O0Bj8YK5VLuHh/O5sf
 oR3F2Tq3256ctVquUGw==
X-Proofpoint-GUID: u8Pqbur8nhl2SBJowCxL97TZWsCLCbRp
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b3562 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=tZh_4sgZHyZb0SdsJiQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116623-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD0E270C805



On 6/22/2026 7:30 PM, Konrad Dybcio wrote:
>> +	/*
>> +	 * Maili-only clocks: NULL here to size the array to the highest Maili
>> +	 * clock index.
>> +	 */
>> +	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,
> we have:
> 
> --- common.c
> qcom_cc_really_probe():
> 
> ...
> cc->rclks = rclks; // desc->clks
> cc->num_rclks = num_clks; // desc->num_clks
> ...
> 
>  -> devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> 
> and qcom_cc_clk_hw_get() has:
> 
> if (idx >= cc->num_rclks) {
> 	pr_err("%s: invalid index %u\n", __func__, idx);
> 	return ERR_PTR(-EINVAL);
> }
> 
> so I think this should be unnecessary
> 

Though common clock driver takes care of the check of idx, in order to
allocate the memory for the new clocks present on top of Hawi, we need
this piece of code.

> Besides, is that new set of clocks actually unique to Maili, or
> is it bound to a QSPI usecase on the specific QUP?

Yes, these are specifically new clocks added to Maili.

-- 
Thanks,
Taniya Das


