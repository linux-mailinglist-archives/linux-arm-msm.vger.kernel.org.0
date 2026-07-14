Return-Path: <linux-arm-msm+bounces-119016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TeVMLy8nVmrG0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23175451D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:10:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k9RYRL/D";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IMfOISBT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119016-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119016-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0452309DA81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D61393DCD;
	Tue, 14 Jul 2026 12:04:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B471429D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:04:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030682; cv=none; b=Nh1rlyPYol8FtUQXGwLByrlvncPINehqUhezZAFFMWquAM4j+On2Tbr/47YHuTDArSpXxsIwE93hO7KbHyRd7+Lf/vSZTxq4yCmNjdsjKoUBUl3DpzctlbzVTJwOHkndAuj3849UgvInGpEKkFtkiqL7rSu0tl2dp9fRfzCUJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030682; c=relaxed/simple;
	bh=wsvWNahd+3JyEYeOYRayZ4Uus5PQGFu9gfDxjFlvWf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOiItf2PYLa750hJ5B4co3nEmCJdoPmsBOCa30RroItYKVykHMmgCiobtRu+8PcNLgbBi+EzppNAq+vzVu3KHwq7stn+D+eN4PDile5jTwTNbMGdIfYHvwISJeHfxt3JOr++cd4b31NlAa3m6nuX3tlAFClbu+dvzyNM1TO+BFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9RYRL/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMfOISBT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO3Jn378237
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ns5/2K2MU9xmQmc/hILCuPUMyhnQ7muUcgv0M6V8YmA=; b=k9RYRL/DvL9dx3SK
	EwDCYxBynq1p8t/jPOsudiVWx5qOX67RGW/i5qX7BGh5FJFQtp6oq/p9eWRRyMon
	juMmHl2zohP/joISy6YTr1lolrNTfAQdsbM+5e2ds+uQEaxOP8ChkW2Wqjzb2vMr
	mEHIYA3Iou26QJNeNBuY0Iv23Jt1KVYq6FmV8V72L1SMt/AIyspvfNh+EbTnysKc
	tR2rbHWqEjbJPbtKA4nMuLF25j4vRvA7VCIEGBLp8tjdy6Gd5A9Lt7x387a18G5a
	kOffn5iukt235JuVo1QcGFaYYQf+lnASBvo67sYUnfY7IqL6A795M13vx+gXBM2t
	+52UEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4a3eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:04:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc8bde6318so79452775ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030677; x=1784635477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns5/2K2MU9xmQmc/hILCuPUMyhnQ7muUcgv0M6V8YmA=;
        b=IMfOISBT2eVS+lXSMkhesarCjLSkko9ur2inDJUc7XM9qzRAqm4RB21Cuky6cj9kma
         iO1hhg+t160R8ogzlzrSNGMl7dgylRF5U2hr4N4qq2PCg1Z1UkwoHCFNUUPdc/iefcP6
         PLJL41QeH5yZU2EVKikBW5uhldAa1XQjgZzOwJw9LGUxt9VJh6hBeXAYYZ/YdskRJFkt
         6Zv47c7QWXKlVGNVt0pOh8nY5Qud6Ha5+lAH7+0pUcdtWz1iIzjSYu1nUwcY/7Lr1pvA
         /GKdi1fU0e/WroW6gYmJE701NNWU34cVUhXBCAiT/oOj66ZqUCpjUhSuYUHEeq+yPYhi
         OJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030677; x=1784635477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns5/2K2MU9xmQmc/hILCuPUMyhnQ7muUcgv0M6V8YmA=;
        b=Z8sWh8Vl5yB9UzTQ8A80SsDtvT7awn0AelYmK1X6PWsVCnhYNPuRmgZUvPQ/lDlHju
         RUFNjYPaD3YkENhVgSDz9vnDTf+lxC/3hFGVbLjAavxxFqO/Tg82rh5E8oHsHZtf1YFH
         cc19v+YtMiQWH9Ndzd/KsxCWxJZ4o7msoBtZh5wfvrKjUUvAFjqLXiGbhJAPamlnG9Wp
         yuwsItMwF7cEQOLCcT1PAJvwgHipj1omdpuFXNjqxrqCE2C2vXSpKRj/ztrz4x5HiPjq
         iBbz0QG+tqM+XG/JAuIo5qbqa//2CLod39uS/TmbKS6jTM/+qMzGG+UNyH9ux0Y6jAA5
         eiDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmBXR8g21AERoNd9TIkHrePee1qB8ZhUM5focUjS2JIGmo6mm8M0yE23Sedrv2joYywCODTGLzDpo5qamd@vger.kernel.org
X-Gm-Message-State: AOJu0YzafOKJk5SrJUR5758D6gWGOAmqiVD0YFMymbGe1A70jUJX8XPL
	og4bo5CFzWFzvOUMH6kFDJ6OAJ/TruHZ/pNlXmnlRql79WmMk/uEvwO+S4elP1H4qFYwSpv/vWl
	XfLetRvgo4PHmujT7uLES1+rpAyqW6zuiB1vAiSFc+Cv/vpDSohNaeGRXytyctdNJhwg/
X-Gm-Gg: AfdE7cnZqBeWE09iwfYxHZKQfWtsMunpsjCxEGslbCHgYbp7E9m+G90M983ZmHzxAa8
	SFgaBZwnabwyOIERmxs85VaDSqrSIqZ7d6whPEsrJW3qnbT307RPpfI8MU+uXJcfpKL9vLNXQDo
	X31ARQCTKSt4HNopWFw8flbWiajN2/RWlcPIDMlg34VtOn1gfef7aKrdf3J0TTAiBl2wzf/Y+Ds
	AD4/M9hna835SLxofhGXm7Y8hwxDg3c00R5SoVjtd5DEdyOPnzClZ8Cls/WKWHQZGIYn+3dZYER
	/vgQtn4YdOen5s6LNpvTXkHySjdXaJzs6edol2c0X9eDVRBZF1/bG9M3jOEHzEVgWgAT6i+bf1I
	026bw/vpibhzm8zXO6zumYXNTFsTWT0mAVZDue4Ws0OA=
X-Received: by 2002:a17:90b:184b:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e1ae9fabcmr2505718a91.11.1784030677422;
        Tue, 14 Jul 2026 05:04:37 -0700 (PDT)
X-Received: by 2002:a17:90b:184b:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e1ae9fabcmr2505666a91.11.1784030676707;
        Tue, 14 Jul 2026 05:04:36 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172e46basm1412585a91.9.2026.07.14.05.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:04:36 -0700 (PDT)
Message-ID: <27141365-9fbb-4377-9db4-dae281741d0e@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:34:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
 <alKYqD6yp97DV6R-@baldur>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <alKYqD6yp97DV6R-@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 47_WnZKcJKZgiSSzkV-5LuiFh4JOJx4m
X-Proofpoint-ORIG-GUID: 47_WnZKcJKZgiSSzkV-5LuiFh4JOJx4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfXwv+lM4Kwy7w3
 EcS22RJr5GR9CT9nVLVmONTq4VeugVvgsn5E5dO7GToXH2N/TmFqaY1CBFgRQxBaCflN6nuCncA
 w6X0Ta+Gy+m7EAYqXg/bmD/LE6fYV1gdnQu7wI9W7tgCagQjO8z4/NsmfZYgOpRiwOKP52xIC4b
 v+tqTvAHyWJlBIT+2FoGHF8EsnqOcDHUqggre3ikkTjPg/rrQKyAaYO6WFA8HbHMBxglJNTb/hq
 MJ6K2vwEAV/Xuoni1bHY67WweKPdqrMluaq97Sexhc/EuZoW8eUP4woIjtja1/lyLpPSI9WX+ok
 J0UjeEpYXCw6S3G62N8cVMtQFlnBKAw78jmSUJng3nl6rTbOtsgeQ4jZjarwd/lpW7V+9qm8fzX
 kOytPd1WcMinFHwe9HjVRWSdTgMZ/CQYMY4HskmWSp4ZCATj+hQ6MpNxWC7REixRY6mkeCL/DiY
 sFnJ21tgtPEnksudQGA==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a5625d6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xYWi_SFv9V9xdDSnKu4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX81duij5uRNc9
 8FL1BOT3h9OFQ/Kg9aXj6gq09zTmeKPGMMvkItTusKn5SGudjjhR+nRmOtaR3g5WryNb74pOFHD
 YGlnf83X7AmJwN20TZmXRXYRZ/Ainh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119016-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:sachin.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D23175451D

Hi Bjorn,

On 7/12/2026 1:11 AM, Bjorn Andersson wrote:
> On Sun, Jun 14, 2026 at 01:35:11PM +0530, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC node and define channels for:
>> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
>> - PM8550: Die temperature, VPH power, and system thermistors.
>>
>> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
>> correspond to the off-PMIC system thermistors connected via
>> PM8550 AMUX/GPIO lines.
> 
> These are connected to thermistors on the PCB, which would make them
> board-specific. In fact, you specify all 7 thermal-zones, but at least 2
> of those are not connected on my board according to the schematics.
> 
> So, I think the thermal-zones definitions should be deferred to
> board-specific dts.

Yes, I see your point, since thermistors can vary between boards,
it may be better to keep thermal-zones definitions in board-specific
dts files.

> 
>>
>> Also,add io-channels and io-channel-names properties to the
>> temp_alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 250 ++++++++++++++++++++++++++++++
>>  1 file changed, 250 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> index 6a31a0adf8be..2e746ede850f 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> @@ -6,7 +6,9 @@
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/input/linux-event-codes.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>  #include <dt-bindings/spmi/spmi.h>
>> +#include "qcom-adc5-gen3.h"
>>  
>>  / {
>>  	thermal-zones {
>> @@ -189,6 +191,90 @@ trip1 {
>>  				};
>>  			};
>>  		};
>> +
>> +		sys-0-thermal {
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> 
> As I said above, this doesn't match my board.
> 
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		sys-1-thermal {
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		sys-2-thermal {
> 
> This provides the temperature of my keyboard, so I'd certainly want to
> override the properties within - and perhaps use this for throttling
> things.
> 
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
> [..]
>> @@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
>>  
>>  			status = "disabled";
>>  		};
>> +
>> +		pmk8550_vadc: adc@9000 {
> [..]
>> +			channel@14a {
>> +				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> 
> I guess per my own argument, you don't know that this channel has a 100K
> resistor...
> 
> But that said, people have waited forever for this to be ready to allow
> thermal throttling of overheating laptops. So please just drop the
> thermal-zones, address Konrad's other comment and resubmit this.
> 

OK, please let me know in case you see any issues with the following
changes:

I'll drop the thermal-zones nodes for now. To avoid any error messages,
like from attempts at thermal device registration, I'll drop the "qcom,adc-tm"
property from channels having it and also the "#thermal-sensor-cells"
property from the main ADC node.

I'll keep the ADC channel nodes under the main ADC node in place and
delete the ones absent on Purwa boards in Purwa board files, to address
Konrad's comment.

Later, I can push a separate patch to add proper thermal configurations
for thermistors per board, and only for the boards we use internally.

Thanks,
Jishnu

> Regards,
> Bjorn


