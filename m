Return-Path: <linux-arm-msm+bounces-97395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPlPFq/is2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:10:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B7E28130F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC7630CAD4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6155938657C;
	Fri, 13 Mar 2026 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJZk8Aqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZU0s0534"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F03845C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396415; cv=none; b=J/bAfiUA9G6lkTMrUyG63sjplzC04KOrkGc2iplDSQM1Kl6yh3gA/QjW44clxSfC8UTgUCElxUDkX0l6dPdP3x+pj5sw4z9TY/wbYHasWemQHl7n4d2y4KiZV3fwWeftEJI0uxq8b6zDi5JYdNWWOj0CqQrY2uoPofB0zccN5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396415; c=relaxed/simple;
	bh=tXa/OEAWu89VDuOIqA0e/na/Kg1kVtF1gk3FRsDY4i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFrs1P+11nf4xH55vMuJ7246f6Td7jtUL8FmhZXBZzVNM3OR0Ge5Ev7dqFUzhN3HG9gdSDxHX8ruc9IALUnL27gMJFrBx8MZ7Mm+qsfS3jIOtyE5BHkEUeduTgsPaat2OMzrUh6sxw4SmGhtrUs3jgpIsoHiRwwmXg34yVGX2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJZk8Aqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZU0s0534; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8M8481447
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVfNUFtzJqATjUJItm1dkWkeABw7OLDD5BU95A0zAjY=; b=DJZk8Aqg4GoWiseO
	nM43wp8sSKYNXrdLYR9UO7Kf9guTjLgjvBcyrMkq9uRyzVekcngoAmnRVbjbgdrj
	K+Ve0Jli0OokuOtFY5cfw+pFDHC8XZ1X3x9/WFVo4K3OeelyhiPrFmdSXM84uORE
	jKu36N7D6XwF8MUGVXRLRepIzbNK8iWJ/AyukzNmBTPH1KqXwhcJB/WIDXXR6spC
	8feYdEXlTIOe+k2RId3w5myU0eZBKrB0pstXuxr6OTO9YjuRe5DevtMuKsLCBx1z
	oJ6sU0ERF8EnITRHHZPSkg7VFrRXmJTa2EiDsSCAi58BRWU2M6v5EzZPzx8GmPLZ
	/1eUPQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7r8wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:06:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954b9b5da7so14412136d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396412; x=1774001212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVfNUFtzJqATjUJItm1dkWkeABw7OLDD5BU95A0zAjY=;
        b=ZU0s0534hkiqaAVjqCpIhFRBdSsh7SfiUovyCZNu3dDN51K9PJ3Zsuu0jZDrxkiPe3
         HA8QgCqZDiEKBTAE/Td/8ssODH8DMlyDEZlKFSchFSzwNnIk15JE8Y4Vc9XVSE6PjHfG
         89Gv2d1AcXEY+8VN1K5kDoqkkrBtJmXU/SQGflEoaiWXnd3n+joXFltZYacZxbMV8ImI
         mU1Xzr7qG7HKvZbY1qCrO2nvm8NJYfM/p8CMNYJ6Z/Jf03itOM7GHDecIXO7IW2Q2gVZ
         FWrUXTgw2gzrilA2/M+mouIiQTR62a18XdtQOJRiYiiUfR8Rue0EHtv3Ghc4Tge/EbVl
         njyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396412; x=1774001212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVfNUFtzJqATjUJItm1dkWkeABw7OLDD5BU95A0zAjY=;
        b=VSve01+w/iZ40I//D70QdrnyR7EYFfMJvmH/Zatwq/5YM5ClULlyjGr/+fkWkAzv4m
         kpAookH0PseM+RuRh59pAtFIAqBP4nF7YFrOt/v2gVdtxeXpLyMOMvYSBvDWJZ8Iblhv
         20cAgpYOcq4ZUB8+m9FINlyTJSWHd4H5BY/nKCe5+9wT9sfHG7q+GMr/2Aw6IMK15GKl
         lHMqsTf76yzMUyWyACgo5wBuJYJTNFMxdbNwNEE2lgWtcQYxYrnrh8n/YHBafc15eh7/
         CK26s5WfPHouxfxRvo0RtgH/chT1KKetBM5/EUScYdTzMR5XZMR+HyqoZRKqtgJ2G1Mo
         8ZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUfiorI2mjPdvvceDfNG16VShfcbuKrn+x5WX49/ZX5J7e6lBzXEslOz3ogMFsh73Q0E/yNi3XtRMCaJXzx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3old9MTPkm7L6gymiVANnl0Rqwstwui5eQ6MqKcbz3CctalAV
	uND+gYwGo1CI2PKNFUO2gYrvptuhLWxZdiTGhE/uSSognPH/B35j1oAoLrcB9zj71/6fW+Wc7M9
	VDVYJamyn5XJt2kUrpQMy8XNVNmYkYc2A2s/icz69uZDKC1ndWzEDkQYq65dsbmO8hl3S
X-Gm-Gg: ATEYQzyWFHlProB4ZmIydcN5z68HjHQiUj9uoqQ4xxY+/Sub0NZcW2cLhauEjMntw02
	JYAXiyIECCVtt6ubXMoI8kEny6vuPRzCl6qysDsGZsTX6HDwGGKF5xjW735qnNc2GncH5Pg+7+S
	i63Utxul0+1iFYuZSK9sNicc/haodOUSUgEKlu/p9OHNJeGfGQZ0KQAcyp6PqljH4XlQbrOydcO
	RZSSaRdJSy7MlU2/L/wxHk6dLfjdwRx6UtSH4oUWOfTfWMJQK2Jh2KnEOzqJbFR+/j0In6JNQwq
	hAZip+yFvPi2yRMQMxHUwv/2XEzrXMiDmjt2vzQ7Besohlj39FAnP9nvPWS1jZAaUkftRt543el
	UsM/K5L2/dsp4A4EEEafCBCjcPh8r8nop3uyF1QY3GqDT1b3bztehqYfNAyoDjto6P1PHWROBPb
	KIYgs=
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr29643646d6.6.1773396411780;
        Fri, 13 Mar 2026 03:06:51 -0700 (PDT)
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr29643306d6.6.1773396411367;
        Fri, 13 Mar 2026 03:06:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf02b14sm35182466b.51.2026.03.13.03.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:06:49 -0700 (PDT)
Message-ID: <454580f3-7459-43f9-8321-a716d55cdbf0@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:06:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-4-gopikrishna.garmidi@oss.qualcomm.com>
 <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v0TY7FRcPX6VxSDcXrqQvwb3JOovdBpO
X-Proofpoint-GUID: v0TY7FRcPX6VxSDcXrqQvwb3JOovdBpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX8zoRpwbJcQCX
 vIvSkL/omI26KFuEX2QOLGJPg7UXrk0IkQiQ468VhKbyomko1PEXbkrqzyZ1LSzANnviUJuABKN
 gnFqzwG/pHSQtyl4rGjrAc9+bUuIHe3+5g0IAbBkYE6//gsr/nJxVJTqwl/iNKifQ1SbRRXlddv
 OEdtHoYaCiSngPMOm2PAcvmOtvDUo2g8Pmb51milR3ZIlJ/PRNWAcU4+ihZlxaQe72YHPYuQWKP
 imjLflanlFXEEFQ7N8832RBzDGFMayMccXEQveCOHlYDpgc1TDFofLYwzLP9x5vb0k9eT1ZGq0G
 jZEi4gVqYO/UKLLIvH1ikqkiJehv09eRIr5uvd71NHq9OoyRSBgQENI0kpgwq9vZRnafN1mkeWW
 uizy4p87j+QV0NufOiBEpHs+l9szdrGU55XqSRmx5LAwIrrL5lUIIPqgm1Rhsxi+oMJuQ4j4A97
 DTn6AQ+mZoQe4TyFMaQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3e1bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DFKRy6B7JKFaKvUKrFkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-97395-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6B7E28130F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:02 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 10:49:47PM -0700, Gopikrishna Garmidi wrote:
>> Introduce support for the Mahua SoC and the CRD based on it. Some of
>> the notable differences are the absent CPU cluster, interconnect, TLMM,
>> thermal zones and adjusted PCIe west clocks. Everything else should
>> work as-is.
>>
>> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile            |    1 +
>>  arch/arm64/boot/dts/qcom/glymur.dtsi         |    2 +-
>>  arch/arm64/boot/dts/qcom/mahua-crd.dts       |   21 +
>>  arch/arm64/boot/dts/qcom/mahua.dtsi          | 1040 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |    2 +-
>>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |    4 +-
>>  6 files changed, 1066 insertions(+), 4 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
>>  create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
>>
>> +
>> +&tsens4 {
>> +	#qcom,sensors = <13>;
> 
> This matches the value in glymur.dtsi
> 
>> +};
>> +
>> +&tsens5 {
>> +	#qcom,sensors = <15>;
> 
> This one is indeed different.
> 
>> +};
>> +
>> +/ {
>> +	thermal_zones: thermal-zones {
> 
> You've completely rewritten thermal zones. Can we patch them instead?

It's more messy that way, sensors are reassigned because there's less of
them (and less things to monitor)

Konrad

