Return-Path: <linux-arm-msm+bounces-117589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PpHgAQk2TmrTIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:35:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED856725A00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NzyVrtth;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GNjBDBtR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117589-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117589-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EE523025CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A30466B5F;
	Wed,  8 Jul 2026 11:19:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B41466B4A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:19:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509595; cv=none; b=jxeeWIaQ7UCmZ/4yv8FfY5GqvoawwpNPHsGFWqIpEmPCRJzruZWo3WxKbDVJYe3ns90ufRGkNThu+GHGJhceOtv5eJ7DMRDn6nfwIz5zNhwRkofhjvoUzdxixJpm4z2Mwj6Dv9v3giecnW41dYC3AdErjphmFetPrl9QP345PNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509595; c=relaxed/simple;
	bh=r/sZhonGWHV/OHpXFFvuNCqs54uSF0jXIm4ELTvu/1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV9TvSAM7cMGm7/0GAJ3qhuPTLIBMdKkGk9eLAOTJyzaaZTxnnbi1EcA/GAZmThnQjhe2angoP9CQJRIRqu/x0XggHAu01XGCJjTT7WuuUHrks9W97MamQ7fvX05AGUJFJyeQUtTmUVnXoMVMtnDpRhSw8vDwUrbQ7khXyueq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzyVrtth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNjBDBtR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889EwD2231128
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=; b=NzyVrtthERY8C6/4
	g8eosxowzO7/aH4DYu07cNpjN9ZTLMZhwUtgAz8vkNBLutc+5sFxoRVey4omQe4I
	OXLPojkDmPW588QoEVf9GgYTzQfq3ZX6Ou3ujWo5fIx38Nf6WcaetygHEJnqN+aP
	MdQ6fGUqQ3ejiQWSVLNwS/wx6fQztmLTWwWKjQwirKS8Ik4dFYE6oMjYPhCgbgII
	+r/O3mISp8E4oFB935RQ+RrGb+3OVz2GPDuNfpHcvYxUsoCzyQxJzoRri0a7/TRn
	XbQfhsNkFz6lcnaE0db+c7Z7sMjMUs5kxwL60HQT56Yo5AiOKly/HMnBfOlAupXy
	cekXGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v56w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:19:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1722331a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509590; x=1784114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=;
        b=GNjBDBtRLwAuO+CdOR7jWfettfGny1qdUaR5xZR/64c6BcYWa7XJC3nVGv0w8I/OU1
         DkgN3jgnbDKyNgUkjZL74slJR5t4ddz1PkfE/oReYV4jPxp8e9lnrjOFLJGjDvLUHNQu
         EvXbLgTkB8jj30aL1zJijKh/6F+5NbSzSvIgq1fCcAmkOcBSHgwEEeb+gLMRY5Bn7Pm8
         J+rtycYS5BzFXyaf3LZov9ucITizQg3bGBqNE2/Z0C8gzC/Clufqku3yoi/J5Bt1Mzx0
         wEwKx1lYtBvpxtUAXibx9kmNJQ6599Pz5l7hAAaBVKQHkXsc15067mStLoznZYgSKZoC
         Reug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509590; x=1784114390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=;
        b=BT4r27asF3WW4x5YmylvgG3cnONPUfIcoId/wZofBeEJAH6kf5rolvGI0cLFHTXMXp
         l97RF1OStt905x97r+FEHS/aByWHCv/FlJT+00VQvboVxeT9fSFXnUV+0LCp9Xs3NSYe
         chXvH7dTfd+oy8K9kB2MDZUbdCEWrryX0Imt/d1Q8VKTj6pHssd+9QITVTYLHWeY6syp
         uYLzSayruJm4+z0TqYitOG0zurR7Qp3BF36nEcBRIYHuk0pYHSnFiO5DHF7j2Kkpt+8v
         UWRzefUGWa0ph9fjcwVtkrmpJKgaNQwGlXFuhhvvnP72NFZ83RS8s9ZvswBtunVwBkHZ
         VFLg==
X-Forwarded-Encrypted: i=1; AHgh+RqDcJT8pc4tdfNffwcfj0l3QRO62+ThniSo5xc9JBLQWfIMuvayqnp1W1dpEhyzJdGfpHQFgTYLLd1CvlfV@vger.kernel.org
X-Gm-Message-State: AOJu0YxpN2Z5eKgrWXch8tt7Ou3hnH6q82jqfWgdF2DxT2iLhXuSjBUA
	Os5MP0ahKBj/4drRNf1FZFjhyxLcjW9XoE2rJlD9VM1ARBkKsc9ldS2ycn7QuEndKpjefmqO7Gj
	V3z50rsF93mllrwv84VUKLo4mn8Fn5+amXBTxPWc8e1mPerFTQ1rY+mtwePFLUlD/V46k
X-Gm-Gg: AfdE7cn2QnOJSSoFpJvNIy2Pa3TkZOFd1TBJF26t4wsMVowVR1kTU3tICwIwzTTasY2
	bZV2Jc0zWKMQnOSZhCmmnGfmyUzp7nkm2mQO5tuvEe5wVRn8KuNatpd9pTzj3SOEhZGLgHOgrRG
	eer3jgikZX1tIkRRtl3jplCRUbdJJeizD9JIaHmioUJfdLnZo4suVN115Jsf2FvyTJYolU8mU9T
	+5St84gEw+i3lNhYV4Fno6klHfX2kECNgAA7Qes+M0gDK+Bjlie34ZNZducJWbq05csb2uOq4c0
	gcCT5ORnF/JZPEhaUfpliciCXr5urNWYMxtOsLr8gEkoWs5iaNzLI5a/MqdptXCsYlzcPaOn1u0
	D77sLDNQfoIENVtHKbSKLMz6tMMMQsyu8izm4vuA=
X-Received: by 2002:a17:90b:258f:b0:37f:bfcf:fdfb with SMTP id 98e67ed59e1d1-3892db5376emr1958262a91.8.1783509590026;
        Wed, 08 Jul 2026 04:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:258f:b0:37f:bfcf:fdfb with SMTP id 98e67ed59e1d1-3892db5376emr1958242a91.8.1783509589584;
        Wed, 08 Jul 2026 04:19:49 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d2585f34sm2632880a91.17.2026.07.08.04.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:49 -0700 (PDT)
Message-ID: <87c50f60-23d5-4987-a521-347614b2f596@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:49:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
 <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rUoh_ljGgvm_dnlVLyaYIZqdlxWWbdzw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX4jwtClFgQrD5
 vuydIFAaOusGQ7lTjLl3vwN31jSr6HaAaj3ECzBS5FsWd3JEFtQ53BcKtFUtkN+PVAgDAIgk19j
 Qs6TuxMwdNC/ri+1mj2XJ27yFFOL4qA=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e3256 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Nhb7zu4WCAlJpChbyQcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rUoh_ljGgvm_dnlVLyaYIZqdlxWWbdzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXzlUrP8l6YZ01
 QH4N5F6z3Yp1E6cIMapAVgeHv4ZOxmTv8v1ku0ViWYlUhJgC0mOpJdZtOTTkVdXRFfkkOjCyjRe
 aUE/3Kel2AqxgVDs8mwiOD7ZLAEzpgeldbFhCrNnLf28JVVOeYdZCYiBCTxDVMHZtz0fKOQyyhn
 2AJZWILxaM9mh402Jj19O+nr3OwRGTYSf7kwMXdoWcz5rgRG+48esjyh9QOmekO1UaqW93AaDOa
 NpjUwG6sCZp12S1gwvDBDiuoeAGYFRThWYs++3HfZSeAwBrFJVPxqqTvDnOYx29L2MFnBTXdBkP
 /4EO/aKu9QJlwgfponxNEblYQCVM1wtjmWZ1lLnDxaE/FsSnolex6U0aNmc3pMs9+eMnypkFF3L
 Rr5Mycs2qwiUmGo0Ey24YjjV4QukoUDhgYzSKxGyCCP3WhWJsJZwUrWl81KcbLcIqWsP+cUZTJj
 xh7nBxSKNPcMtPnRObg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117589-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED856725A00



On 04-07-2026 05:48 am, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 12:01:31AM +0530, Imran Shaik wrote:
>> On some targets, the GDSCR status bit may not reflect the actual state of
> 
> Which targets? This is all about Agatti.
> 

This is applicable to the latest targets. I will update the commit text 
here to mention Agatti specifically.

Thanks,
Imran

>> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
>> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
>> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
>> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL_TRIGGER,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>   };
>>   
>>   static struct gdsc *disp_cc_qcm2290_gdscs[] = {
>> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
>> index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
>> --- a/drivers/clk/qcom/gpucc-qcm2290.c
>> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
>> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
>>   	},
>>   	.parent = &gpu_cx_gdsc.pd,
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = CLAMP_IO | AON_RESET | SW_RESET,
>> +	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
>>   };
>>   
>>   static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
>>
>> -- 
>> 2.34.1
>>
> 


