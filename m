Return-Path: <linux-arm-msm+bounces-94982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF7bJye1pWkBFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:04:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4D1DC558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6D483061ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD301421A16;
	Mon,  2 Mar 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hddlJQUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFMPrxQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218EF423A8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466853; cv=none; b=VSYImEcpN5x4/ser1ecJxRCQfK9DFMuMUN8gIt9vKNUK5GrgSH+guChS8V43+udkcyVdIsJxShb6aRi8419im3dpjHutHILXeRF2ifwXfRK54jHeGxDgZ/TRUKOwBQvrHhdaBr4Giny/0rCwPH6QiUkKq1WIoGFN+1iBM8SF95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466853; c=relaxed/simple;
	bh=c1xMkCTDruvhrlx8oLt7TUhDeKUR5zoin0Bif4o/3aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQ9db5BWAwvw393cP3rSSKI8emIeLURJpdYgIXz0EadfQkI6BQlV6PcIKxuiGiHy7sDHaQ03FaL1aJv73uQyp3kbANLOcbpqEhDuR1AbeVYZ/B4CkaH6dl9PulDYQaWcVDo9NfH0AfQ6N6QrYSkmANyB4xWcTLtPPmhvQwdiKqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hddlJQUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFMPrxQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622CbhxF2504612
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	la5I8dVQxn3iHbOp5WZ/xYkxDrzi1OHyKEOEuCNbIC4=; b=hddlJQUnI8kREgCC
	Wf45WI+aHD1KWJ6ei/lRWknLNZSkxhI22iahtCpHjuC04phaCJ7AKKEAnJkPm+zc
	shRpXZscYrLTNRIUPoyD9b+ZEjmHtz7LQV8ErQOd8dXlwgJHvXOPkDi1Bq6yaJUn
	o4EAdNiLSISU1SJzgGO2c9YTDaBMjPCzgx5G8MgMp7PbC82sGpjP5EHHv0Ptl6vq
	3qypEl5Y0SPCNi8z+4DLzaOLsfSy1DRhQTCImpMbn++Akn+3VqowKny1ZrwVyvl5
	Cccsd8MYv6z8ohDmIpSWkGaZ8e48T7z61zke0PryrZCN9YRxHtNtQ/kDI/dHtkPV
	i9Jviw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hesx9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:54:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a012f8ab7so4265756d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772466848; x=1773071648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=la5I8dVQxn3iHbOp5WZ/xYkxDrzi1OHyKEOEuCNbIC4=;
        b=FFMPrxQrJX6F0NcvPN41YOwrdCNvfqf17s7QcBnGee8gMvlp0WuYpyRdd7Pk/6PNbF
         Y5pNKCYFOdAdpiKr4k7WTAlTidkH+2LSAoAaEQOEsdnenV9duKO+Y+V2SiZBcPM4UDYZ
         QwftxlD0Svme+lpC40uWIIitnZ/RRNnNq2H6M6gZIicsY0zll8AoA1Ep/Y/kyWJEfm3r
         PFndf74xvLqJdIHXdlMF8vSZuJFt1+8kSoR3yGHifCCttRZyfBRgG0q5GkaXOlovVfU+
         0Hoj14xahoPeVOtfH7vYPIjpvWCIdf5nsYDInkb/a62JKc+BU9sASo6ytx352btZmxRk
         slHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466848; x=1773071648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=la5I8dVQxn3iHbOp5WZ/xYkxDrzi1OHyKEOEuCNbIC4=;
        b=jqOV88SzBRpz47gGhrhkmYf7oqJhbtS6JtbGaTFZoniPzwpokSRgW+z7hftMLpxlMK
         0vcvk4J2lN44CsvCDfQU9P7u4UG/UaBJhAHiEs67FxEl6khP8sIzXzm0Ihf0O5DvrPm8
         xor6Mmou3FButtrV12YtmWmoUO95/PDHFN4QGqwClAQAIvMxOd6QBlrFwEKWggwnrZsn
         OSSba52C6bcW8kMCMFlYCD46M93/XlFFRu7aA0QJdcwqNO9RoiylYbbrKGX0cTyXL+IB
         qspzXGUxev46ZieK0sFl9HzyeosXLXCdd+Bp7v4yyav0xq8Rzit9hGtcAJHbTcfrn4HW
         L4MQ==
X-Gm-Message-State: AOJu0Ywh1U/Q+5SEUMhify+ad+FSFAw/EbWPXUfVdO3dz6MCYcrT+V7/
	Ixh84SYlb5eQoDOJyD8IAmp4eivZFdksZxcZPGpNcqrpyriwuDlEmH1PP0l6CTgfj7XT1kJahqo
	ny6YCF3mjQjsqHhRqQ8aAR2pxDqOncP8xVOyKj+iQKNw339NrLM83vfgfo9WE2XUu9Sto
X-Gm-Gg: ATEYQzx6/jNMrPG+1bB1Y2MmN7/ztQToGwOHjPjMHSAKOWfMOhjPGolugaVoI9ScKNp
	OXUcTvDV0qC6WbmuHdSevy3eb2rRvsL5TESzFb8m/jAWFUAxq/i3JkDTWgOGSJHoIduU2X3khvU
	xc9v3MeBp7vMCnKmi+odWVltTD+JQ1sVhFNJAu79FmT4IwkXEkiN1msCWPwn0zk3P2LzSERVyQW
	qmWxbg0AQG5VkGusdtKBZVgk7WAa/aABuykndFVSt1FE9bubIeUdbxgI/wjnOdOWE427qrQal6W
	uQx/983vbdP/e6s5T6/Lch2NedbYDvy90lQm4xpMES8CdmxU0E3TP96VyF9kpD9gHBs1zrpnts+
	XfOFAQO/0mA/WIUxXIiJTyTkDpy4wtxea9SiJC4puy5nL7ze1tUw7rAIqCFFEITtcSWsY83Jjha
	5LlbI=
X-Received: by 2002:a05:620a:2945:b0:8c7:110c:762f with SMTP id af79cd13be357-8cbc8e6f60emr1239019685a.4.1772466847833;
        Mon, 02 Mar 2026 07:54:07 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:8c7:110c:762f with SMTP id af79cd13be357-8cbc8e6f60emr1239016485a.4.1772466847348;
        Mon, 02 Mar 2026 07:54:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae95114sm487705666b.49.2026.03.02.07.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:54:04 -0800 (PST)
Message-ID: <cdb322ed-cb1b-4c7a-900e-31bf5b13cfa9@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:54:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
To: Tj <tj.iam.tj@proton.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me>
 <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com>
 <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me>
 <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com>
 <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me>
 <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com>
 <3e67a37a-3a51-40e6-9608-2641101b6ee5@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3e67a37a-3a51-40e6-9608-2641101b6ee5@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5b2a0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TBS7MlPccEYcaZQwAJsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: CTMFobenbbvKM-fgVE1PEzMixWLQdvdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX1Me3SI3kAwUP
 1cwNpvctU197iURLzEB4yAGpa9UonAFV0TlMRLMwKlCT9BmU3YMQZlXtq4eg+ImLAQkA1mwFiyq
 3gl6m4RH1wCAgGiA4rzAVrc/puFEQl+smNhYti7e5+TQFILdGFAHLTiuQOaphUTaaB45AaNs44D
 4o5vuQsxlgJ+TPW4j8GRl9xiVlt5tC3jaQCvrtmkyEITKoHErb8kjYSjAUL7snDdIUS9phRrlGq
 Op902LPGdyVmYApMqpDsE5VS8FksFtFd+QF94NLCEyp5B3X1Er6JCJ8G4VDwvsGyPf2tAzwNtMC
 d36f1SKNOQLadTCeKO/NlkjQvflzlrC7XZIU/Rb034/4gYKFHxu/rgWJDwRBGyxeA7Do6RTsbqi
 7rTf+oQap6rA5aTPZI/DFtLTV4MsWpKGMUjPc8qSR/QPV7/jl+o1RoIDdasKqd7+ESjO+iyTUdk
 l1zxWsFKShNzvmhfr/w==
X-Proofpoint-ORIG-GUID: CTMFobenbbvKM-fgVE1PEzMixWLQdvdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-Rspamd-Queue-Id: 98A4D1DC558
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94982-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 4:00 PM, Tj wrote:
> On 02/03/2026 14:47, Konrad Dybcio wrote:
>> We have this line:
>>
>> 0x8BF00000, 0x0D600000, "PIL_REGION",
>>
>> which is a big region for all the remote processor firmwares. This
>> unfortunately doesn't tell us where (and whether) the IPA FW specifically
>> must reside, but we can take the conclusion that it's at least not fatally
>> wrong.
>>
>> Please try just disabling IPA (change status = "okay" to status = "fail"
>> in the DT file) for the time being.
> 
> Disabled. Leads to a couple of different traces I was able to capture in 
> photos. The images are 3.2MB each so not going to attach them, but if 
> you have IPv6 you can directly fetch them from my workstation. I shall 
> send you (and anyone else that requests it) the link privately.

I am not connecting to your computer, not a chance.

Please use dropbox or something similar, or even better, some OCR
if you're adventurous.

Konrad

