Return-Path: <linux-arm-msm+bounces-112478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J5FMHXNpKWqnWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:41:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6458669D5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:41:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TcacYaBd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TDaaMin1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112478-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112478-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F47932DD196
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEF140B379;
	Wed, 10 Jun 2026 13:33:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699C40B396
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098422; cv=none; b=rmZl85uZwV5XtDQeUsX3RwW1mzwDbDJHRyk2iX280Hba0kPhdZ3IWsl367CZiD/u1vsag6EFm6U2jF3lrz9UO+GYMTBNg8fRX+Hc2fSzVd4UPObHz3N0pU3fr2AU6Dl4uPQk6fsE3xD8LjnYHFc+Vz+26W+qQI4CkcVCDLIqWRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098422; c=relaxed/simple;
	bh=7SY1PH293lcA3bYD35gQnFOlWsjpROvUy9VVFgIsYBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awFTvhPlw+YSXrc5u0ZQX5lWKGKl8JM+xMV3tRCmZKTYT0l1EC9CFI0Ki/TcAUGcZsjR5HN0gxs0PEs2UvT+BifggQ6qbmxO21iOIUUTo/jLMa16Vpyt8brytkefHrmLLYFO7YwlBtZOhvuTScPssIAsuX6zULKbrjGM5GYUr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcacYaBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDaaMin1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgH71138094
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wir8yRgBm5lDK5u6u5oiz29nk7aruaK9GHY7JmhUKaM=; b=TcacYaBdx9GGqTgF
	GTgKtvwQLx94hjGwJLd5UXoXpGAczFvfoinq49yxWMBqiYOXxZiBnSbw6nZrTuea
	2ZenQ08LWd/+rCLvB4lWJPOV14hGhgyvP0lIsmvGaq/kOHF/AdH604BP8xPajjsZ
	vrTImnZUW+7k/q6h1CzMC6AY8e/u8UxSGcFjL+4FSfZqguDq+RdE2PnFUU7Ovvr3
	gff3CjLQR0+qb87l9YZT/Erh1ddJGoFX5KOxwO2escviSbYkq5aSzcR4A1CKQq1U
	gJrv56lYdWOTyyR4SfCZOC7P46bkGFn/FoLi+DHqVZNq0qPd6BNaIu/8TqKmt/TT
	1IbG6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jmqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:33:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a4ca0a4aso202477985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098416; x=1781703216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wir8yRgBm5lDK5u6u5oiz29nk7aruaK9GHY7JmhUKaM=;
        b=TDaaMin1qJtWL1o/G9ifew3zILitxFsQ56krHXO5cW/jZPGSfDr9qcM7XjfD3Scm3X
         jJzQZZurIwUFaSD3PbCgmAgi9HB9za9bl98MI5TI4PMDG6mkPdcNoEcbXnFO4lMpD/4U
         rOwxKwZiXvecUQoBbE6zlWrkB7pO8ZXwNpnWeMA7Ip2VJ/+zrt3hIEYWRYdu8yBSsPip
         C+yeurH6Fibhe9KMdmK8LpQO1x5H7mV/V9synx+zO3G8qLWqqumGJGieWgh2IP38jHe9
         Umv+eIGUhaObeG+gNt5lHYnRlF9mPt2KeoI5GavWzdtaEIg8qIMrOA+II6bDt9O6rbhJ
         OQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098416; x=1781703216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wir8yRgBm5lDK5u6u5oiz29nk7aruaK9GHY7JmhUKaM=;
        b=WKszEw/dpFa556BiTzSQHs59nZao/5zH3EPMJd3Xt07NSsYzdip6acFLkQ9nZwgmGZ
         7IqjSGvmXfVsaybWaCy4Hi1aHeNg2iDyl+FEUUHf4dU0PbLdu5xDqlbGNM3PgD4pBNc+
         imCh7SMtx/1WqAe4hWn3x/OWgrD+ZxSAKsHukM4iuHNhPhjhm9BVxRn1CMGjNhLnmp1u
         wrAI5vhGQqdOcb7JhrgNckXTqNUhB2XA/O9ZDwNXS/zqsvlyXTTbLYKcOV+tkAr7ydUw
         87CPuKH/PJXkBO40jRfBujTV/i7X1yzq4Q+TjKub8SCIecQaBBX/7c6MI0a07iqDNVy+
         2zQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hz6yP30YS1DmtkmEos6a8Rdy6I6a2heWIVZAv1oHD6PPmJJLoo0d8Xdwaq14TWhdeKrbPNnZ76uEzlfgc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XLvKkGIJrgZEnm1PifttDBA/C3Xpr/5EWn4X5e1FXLtmA0yf
	aXdLqWjZXAsnLTFlSEu9EF/Lxl9ezlWjeIB8uK8ORTXK9gkiced9Mc6+VR7Ep8U64OFP/MWCwwQ
	QHmMl9w35BXUc97rKxNVOr5mmNwIK6QnX10JOMd2fukWNnot52AsF/3rHsspzBz5qF3Ns
X-Gm-Gg: Acq92OFWotqyyoFQydcRpcOhdGKPLDbzL7tm4j4DmYQFKcutvM+4P0ZZXYJTEqAdEGW
	A+M4qso74WBzAnQZeR3t2fxnLJwk82CciZc7ShABS40OkbM9aBdEJpKMU3zHALoDioC9BZS8Wjh
	GomLrzbTzFDVhStGCloqrENpKLGS6ROHhhRz0UuKjL1IC3FVTjr7ONaVjPSyYwBj+Rjmt69+hGA
	JUgfEdQ1Mzh/UeAUf2JR1Oz+JnahfOzAvzhxaljSP3DhQRb7rkb5KlsEMePlGwxOr1l2mv/W94K
	wrkm8dIosMyVldwMGZsuD3TOQ+5PchP1etSk+R4GeF9I9naWfxna9ijaGzpBViBIqQ0XTPAbBaT
	0S6mpgX0EWP0tIkkl1+c+qrHk5npwdxK4dwn069cXnqY/ieeHaQqmAQcT
X-Received: by 2002:a05:620a:28cc:b0:915:4ca0:1210 with SMTP id af79cd13be357-915a9d9a69emr2525540185a.3.1781098415748;
        Wed, 10 Jun 2026 06:33:35 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:915:4ca0:1210 with SMTP id af79cd13be357-915a9d9a69emr2525533985a.3.1781098415251;
        Wed, 10 Jun 2026 06:33:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed74asm5362236e87.13.2026.06.10.06.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:33:34 -0700 (PDT)
Message-ID: <2e90f4e5-7151-482f-bdac-4cb210ecf6de@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:33:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
 <b24o5mc7cwljy73a52r5klagfnhxldkdpvyq2easkjfmgmqyo7@o2oazxld2svl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b24o5mc7cwljy73a52r5klagfnhxldkdpvyq2easkjfmgmqyo7@o2oazxld2svl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2967b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZzvzhfFT30TdYZK-mrMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMCBTYWx0ZWRfX5vr2le9vnfOT
 4Qlo9WKRQRhJQ7oZrU6UIaoZKHzbzvR31zx8SOdxcf7r/XIzLv/4osrw2XaYK8Y7UhXeBXdMbpn
 GuZ2bOQytnD9eSG/CYU+kb9qPdc9KrZGYfnUGKBs899sx8vl2U6P/3wZ953iOAv/9C7Q8Pqq2uO
 HZFs6GQawGOMauHTkaUsvgfhHsMbBELUrVUoe+3HJXUVIYjHzb3OZsmHAxtWNN9uos6ZWBU3dQO
 2NuRZoGnieVfWgr6IIH280x1QBNZaZXt6FHpx9x01xETMbR7L849F0ecttAxG39dwVeIpMRYQJa
 c/0PHhgAjlX7EAgZ6hLeCRrtptDAmu/NsLcLo0HfUbcQYBzcNfRb0Mo1LInxzbnXQ1rVu4h9fr6
 +eziXKvuLaYRJ6PPWJ0lTOUHrG/D2InraXll/7bNS5KcHOJOsZXhH/vLj/81JAQhK+7uiXV58s7
 gj6KYASmncwNluoc6ag==
X-Proofpoint-ORIG-GUID: LaXqGjIZJbsWDmNp0DLE9i4drsER0tUl
X-Proofpoint-GUID: LaXqGjIZJbsWDmNp0DLE9i4drsER0tUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100130
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
	TAGGED_FROM(0.00)[bounces-112478-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6458669D5D

On 6/10/26 3:21 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 02:04:16PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
>> Describe that in the DT.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 2f67e665996f..b7cd1928335c 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
>>  			clock-names = "cfg_ahb", "ref";
>>  
>>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +			power-domains = <&rpmpd MSM8996_VDDMX>;
>> +			required-opps = <&rpmpd_opp4>;
> 
> Interesting, might it be the reason for QUSB PLL locking issues which I
> have been observing from time to time?

Possibly. I'm surprised that this is such a high value (4 out of 7,
whatever that used to mean in the olden RPM SMD times, maybe NOM?)
but that's what msm-3.18 uses..

Konrad

