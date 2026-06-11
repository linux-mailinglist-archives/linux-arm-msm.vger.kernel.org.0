Return-Path: <linux-arm-msm+bounces-112627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xg2zNmpVKmo7ngMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:27:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7152566F04A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:27:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VQlzsFro;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lgn79cCj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112627-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112627-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92ABB31112AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D9A346AE8;
	Thu, 11 Jun 2026 06:26:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284281F5825
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 06:26:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159211; cv=none; b=hO0Pv+gQKjkoEao5p+NuKl61Hy8k5xMybCwzNVllpvy+c8tBT912wXEhqsbZDgrNyvXc4G8OCXVSC6kKo/N7f+V8CZj2Z5OToyTI2JHpIH1DSyMoLiP81UBwwnonyoP3KLenpQ+2sbt5Zyu7yXuiA0SFw2zuYvg8ZKdl3UH8hIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159211; c=relaxed/simple;
	bh=c0gfVdcZBAPqDm2J1nmV+XKKzpQFZJuvmQtQzLGbkwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqNGXFX0ptWTtlMDVBAErj/z5ROhw+CBgBxPlk99jNnQtCt2qkBF/J6jhfE8Hwcq/t7mQzjJ0Jvs1BAiGZZqEn/RpeG0vjTYmUj0Sne0ul7aFQlK9ZDTHTSulM/IoKWQKGw7YbSlkSlNk7IVMjRTvfErOdg/NzwLO0VWJYIyBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQlzsFro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lgn79cCj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GY393812629
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 06:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aw+cER8RUt0S3hhQ6zDmBZRatlG33rHLOaT31tiADIM=; b=VQlzsFrotTXgp53k
	631FHHcQmxxbNfGdK2AUVkZYXhC8KMi1lQ16hXicAlDZpeVAoII6AbzSIVmu2l66
	bF1bWKcJdgyfyW8LS+OC247mvY3MYcvPhkxEVQCuiS02lHv18EsVahPBRVhn/f8N
	x0VcW9WAnOxhlIw65mCYGdIKhPYywHgnXkjWXrKobwvCTOIr1u2iPmRI5s3MauXH
	6RsCbNSDRjiA+zjz7wzwh8C7iz+atF5jy3s5/+eGDlcS8cYQlj5MuBYApG72vFs4
	sc1wC+3/yXb08cefiehufn2Em/b5zRtqstiibzPbCXU3t12lI+ctT9Tc5YCf/8kC
	KfXbeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71j2gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 06:26:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304df51ff3eso8663328eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781159199; x=1781763999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aw+cER8RUt0S3hhQ6zDmBZRatlG33rHLOaT31tiADIM=;
        b=Lgn79cCjzZpWXM1lh4MfGZ0ZWnmGMLNtQeRPTsO4vtiV0MvU5QP77FkLa4+J2Bnm3T
         f5RbwoDG/KnXepusDD7yspC8OlIWz1Ci+kKkgKsiBRrz4LwGpCp+qPX2S3ZMvPlgzgbv
         Yi5vlZeWdpXRhgkiWGUvFnHoXloLWaCa2rMbuOfw+jr/7gSWFHp2VCzOfETOZbR7RGh2
         yJeWjTnxn6Nd94q7vLnIY8YocFXoiWIaGJoUfR2LFEblAlGp8C40ED/Mr0nr0L3DgF+8
         vTD7zKoyoVdV/BF5K5iucL/s/K+GAzg9J7+jg5SfIXgvV9Uuk3wXR16pAMnqN/8FvqrW
         W/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781159199; x=1781763999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw+cER8RUt0S3hhQ6zDmBZRatlG33rHLOaT31tiADIM=;
        b=QD8oA7W6CJ3rnO64lkF3g3Z3zOB6MSoOHQXe3QVkzuxmfabebh5UofcnodIeuGldBL
         V3DBfbiaQPVPrOBgiXmku4Kmev6OZT4UHjWUfrYxiebCFdcqJ/BvJLOzZr7iSbx3sovs
         x4xD6Z8wcokVMAAaJ7gd5IXls79QxbDpZW05YvKM1dhm8l6uA4c2QISl+n5y3SG9/nJn
         qekS7wayhym9Myxhv+5o1RDFJ/yg7MmaBSYkscg1ZT9712OPDe3+FMMR1FGV2st0pWTT
         37N4RTEoR9XkKSCxCIUjQzACa92cMoaVuqWRCX7T00OaPRYUcqQ9tXnyk8jDLlKU6oCH
         tKaw==
X-Forwarded-Encrypted: i=1; AFNElJ+i51mcvWbRFBn9/Ml1MLJLi5p69+7cjkLFCUjXW0GPao4FTVL6rAdG0Q5EZWpfkCtgdjttuxWVmJCP+IyV@vger.kernel.org
X-Gm-Message-State: AOJu0YymKviEAiV8Y3GycoHTJ0CAFUJ2AGWHBysMqnqzmcE4s/BL5UuQ
	hxRqkEW7R4qWIrhp4Cuq8et6EYadRVhEHAQkJO7LL361DgoRyCThqRXmer0N7IrwA+aRFV6jc4U
	oq1/iWm70CXmElhcx5kw9AYMkmgtgSuPihv8Bc/VuQ9wGmGHMMZ7qEJX9TbrNHtboDcpT
X-Gm-Gg: Acq92OGfWXN1P62Po8GHoaeQ9ONVv6aifkpJnAD/OaQoJeEg/hBjzLBZK9THQVP9L0G
	96ioF7i4J9STp5a56AcWH+VccADEV2tFycvp6oFUWVTkpKECnGkcGlYurkEGN3aSYWtTeMk3OlI
	1q5s/tARFU/l59noJIsO5PoHc3e2Y9ydJC+LGOlY/xNtI+ME6Lw2BLSw1TtDMUS7VyviYS2Uevl
	MZH3SS55ZBe00b9wjeg1jpxVh56wxrUZXUOgxzStniJwMnzAAf+DugZqX/BMRJwlYMnxwR3la/w
	bxzJVNzy+H680DLtaEZWTK6R5JZ2A643RqRNpwL40JV5ymHewCqBeAHqc4UNDDpFKL+XVpOwell
	e9bQTo+qG3wlJtA+Q+ksSTKdUgKcXNE04tPaH0M8Unuu5FHD/DFFnDJkWLyWr/1g=
X-Received: by 2002:a05:7022:128c:b0:137:64ad:a62e with SMTP id a92af1059eb24-13842400ef8mr899958c88.30.1781159199326;
        Wed, 10 Jun 2026 23:26:39 -0700 (PDT)
X-Received: by 2002:a05:7022:128c:b0:137:64ad:a62e with SMTP id a92af1059eb24-13842400ef8mr899942c88.30.1781159198714;
        Wed, 10 Jun 2026 23:26:38 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.107.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13842fa5f9asm919602c88.8.2026.06.10.23.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 23:26:38 -0700 (PDT)
Message-ID: <5a3aeed3-a141-4691-a8f0-fea03aaf59a3@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:56:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <ahEObi9ubGaTEcwK@baldur>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ahEObi9ubGaTEcwK@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LUUMQAspbCuXI1-FE660geiozxgWQ9sL
X-Proofpoint-GUID: LUUMQAspbCuXI1-FE660geiozxgWQ9sL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2MSBTYWx0ZWRfX6F544jUs4S8g
 0dOGcOuwjUamx2r+/d0r7p3r2Y5jPD/O1Uy3Xtv4dmSEFbeT5WFvr44UUXn/FLhNDDlzjzrFiRk
 OsE5sEGPmfZqeDDF5K2NXtHNf9l76/kkfEdYMxO7UKMyCm5i48FjCJaIUP5arG6ZxL8KxrsjSH6
 c+Pw+LoTYT4n0G0cPxhurTICSKM2aRBtwef7RaGO/OzN2zbzYhGl3IqQGAFWUKMf2nSVI13+GWm
 5ZCrNcyNbzSqu3ZC7hnyZBCNixewPqb2zACuvQC6QJAcHCLs75GOJwRIRgtqvYnm/z9XxX7nCc9
 Knl+GLN0pN+WlsHAaNxMGldLwNrtU23TplrKU75S9qPHnJvsCwgmL00VemTF5nY/g/pGSdyBs8g
 ipL/iLCFydBYNpIv1i72mwOwT/sTqTEPkdwk6wam80lSxNrOBZGTKRbRGEUCCJwpX9JBp5ZMr1w
 kLSBWSfiQ6xK1EVyGPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2MSBTYWx0ZWRfX1GnUW6HCaxZV
 CWXlg5Ee2UFfayzpcKIeWj2TWAdUhcjtTim6i/5cDAyxfr9CHD/d0aUsKSXCz7sT/lzt9fRqvf4
 P1GTJqYryvO7PUi+QgxJo9fqeaTEOfc=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a5528 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uEP1mZ4tISDvfoPjOx4BnA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uETz73-oS2rKXqHautkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112627-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7152566F04A

Hi Andi.

On 23-05-2026 07:49, Bjorn Andersson wrote:
> On Fri, Feb 27, 2026 at 11:45:31AM +0530, Praveen Talari wrote:
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power
>> and performance protocols.
>>
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power states(on/off).
>>
>> The SCMI performance protocol manages I2C frequency, with each
>> frequency rate represented by a performance level. The driver uses
>> geni_se_set_perf_opp() API to request the desired frequency rate..
>>
>> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
>> is obtained using dev_pm_opp_find_freq_floor() and the performance
>> level is set using dev_pm_opp_set_opp().
>>
> @Andi, I've merged the soc-patches through an immutable branch into the
> qcom-tree for 7.2, please find this at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260227061544.1785978-1-praveen.talari@oss.qualcomm.com
>
> Regards,
> Bjorn
@Andi
I hope these I2C patches can be picked up now.

Feedback is welcome if anything further is needed.


Thanks,

Praveen Talari

>
>> Praveen Talari (13):
>>    soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
>>      path optional
>>    soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
>>    soc: qcom: geni-se: Introduce helper API for resource initialization
>>    soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and
>>      geni_se_clks_on()
>>    soc: qcom: geni-se: Add resources activation/deactivation helpers
>>    soc: qcom: geni-se: Introduce helper API for attaching power domains
>>    soc: qcom: geni-se: Introduce helper APIs for performance control
>>    dt-bindings: i2c: Describe SA8255p
>>    i2c: qcom-geni: Isolate serial engine setup
>>    i2c: qcom-geni: Move resource initialization to separate function
>>    i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>>    i2c: qcom-geni: Store of_device_id data in driver private struct
>>    i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
>> ---
>> v3->v4
>> - Added a new patch(4/13) to handle core clk as part of
>>    geni_se_clks_off/on().
>>
>>   .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
>>   drivers/i2c/busses/i2c-qcom-geni.c            | 324 +++++++++---------
>>   drivers/soc/qcom/qcom-geni-se.c               | 270 ++++++++++++++-
>>   include/linux/soc/qcom/geni-se.h              |  19 +
>>   4 files changed, 491 insertions(+), 186 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
>>
>>
>> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
>> -- 
>> 2.34.1
>>

