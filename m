Return-Path: <linux-arm-msm+bounces-98430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBUwHyCKumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:18:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B42BAB10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EC5C3015893
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0A82206A7;
	Wed, 18 Mar 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTwMZSDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cO+rqxL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4298338F924
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832238; cv=none; b=fNhk+NRm6LUdpQmI+xnvGmI1c2jWt5onH8G6odqA/ZpmOqgWlQ27FTzdBULdiHC4i2VhmdOm7BImLlP4SYprgPELBGvfq+3DC0Kq8qS6znllOGYMFTzdRcNShI9o6/puMcZzrGzSpPBtQK+sGgOzwtPzCFbg8OEY85zovBpICYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832238; c=relaxed/simple;
	bh=Wzr/px40K4PZJ3ZIhvRyyB9TlQCt5K52nBlPY+y47xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWKgvYnCGdy1QAFHDHT69SZ3bD/NGgnaWm4jh/YPLKvmPOaryiKlRSSenoUj6/aYlMHK1va952I1i9R0yj0r8EkCog9k5qGL1GKeorNw4ZOLSqCB+6JFceRWq3eYLxMOH5MnXaHJIKmK2nykHGmDUSXwcYdxoTAIQRVtVXp0guQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTwMZSDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cO+rqxL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZPSg2878329
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3VzrPi93tJPEaiIzqzHIrAU1vCpGSCKRnAoqPfFWwo=; b=NTwMZSDqcdIfNaxC
	8PV7Av0Axa9If4zvBpa4qrzRX9TLxuzbYfODS5iSo5IVxoEDGDWY5OetWS/yq98Z
	hLdBZEYId5moW1+Zbw7+c1NdgFUsVuTPH3zI+Fj2ZPpRMbIaTO9BhqxzvB1tFeJF
	4N+6laAfA1mWUs25zb9xVbQtYjacV5illucWT8y6Pq9+tgZ2f03UEKomvwXAQqYF
	97tmzF5jJBZKMHraW5UAEWs6sVOL9Jqt4SIhrn/Uz1BEHSytEaQwoYwGIJ4rB/go
	cycWrWml4Lkc0u0dTbSqieXN2Gzt35HxuqxUMTqw7HcG/zfzvI8AFKjx5Qctolu0
	sJs++w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr16d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:10:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c68ac09f5so9802556d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832235; x=1774437035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3VzrPi93tJPEaiIzqzHIrAU1vCpGSCKRnAoqPfFWwo=;
        b=cO+rqxL5PS8AyZeEMKQPK4nYeNbPZgTaGg0WdO8RnD6W6pRf+ERqOwUoFZNjYQjA7Q
         Qarwxwio7uvJe104khpN0L1y4SQOtMxQYni2M8JdQ4j8DJ+mKal3OelpBCV6HdmtEjM7
         0FbUFCeqLQ9HmI6G2LgtxVpnvSoHotCKr0WHghmpZWNZM4095a+dEnKV8FdVK40v18k+
         VoIbENQJz/qQcu0YkfQB1HHuNPkKU/JQXHoHoZGOpjitof5ZL5Z/uH9Kwr+XpAIEy0R1
         pg6ZdqfzfpO3iyjETp3Ir+4sY6wx9TNY6RwK5imkns1PsmbjTr4YAMBCWq+qbRB6bhE4
         F+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832235; x=1774437035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3VzrPi93tJPEaiIzqzHIrAU1vCpGSCKRnAoqPfFWwo=;
        b=dxWUi9yz/tBHkjdNK6BCOSTZ9TktBV91F1mpr8hLgiPIDRpLypK/0FDE2xVfqPDULl
         QBB7FKIfkhXm21GWpIk6tJGdSNQ/RwlrxoypWDCOgIloDTVqBgT5W3HxCHlljtFLndQK
         QyBGM9z46xPEJyxw8hfUTAGjw2LQF/2zj5BiEbw0/VQ/tMl83Qh5eLrj9d54iAa10uxE
         Ew3MZMnW5x/4lUPsOXASbnebD+tjTf9D7KUrmCweqXEHLXb6xqVq84//oee6pem2IIPl
         Dm661Ez/qo+ugv5ASLvOSVW4Ir0c4DIObB4YcS/Tne8dH8Q+0mObVfMNdFqkGEBwOaE8
         PO7g==
X-Forwarded-Encrypted: i=1; AJvYcCUL+Qt/LOO6uulq8KTiy4zuCW0X++OyyWeZCHH6sgMALJza7gLxkKsw7gA5An080ssQzu23rd5AXmRg2JF4@vger.kernel.org
X-Gm-Message-State: AOJu0YwpC4H8KhcgH3ZmJD8V9gm+RiqPRj3estuIAkXSuJG/XY+ZD8m7
	ftarumuhzqoEI+t29f7fSl9aPjYnTxKE5vCoUBwQ4g4VoPZlBxBSYj5aKgah2+UAZ0o/Wc6ErbM
	9Jue9DZWLgp6S9MEEIADcG/E2tl9DIr5YZ+xMG8NwleU/vSTueQCCZvoxBTF685bO4V7G
X-Gm-Gg: ATEYQzwd45FRFssoWv9uAhW86A4NyVzknZ7shmN5yeLpHJZ30oVN4uJ5KAHPoh2Mwuu
	eCkExPdkSjBHU6arGo53Ae9DmxcKkdQSQXErLniVE3a56izfRdWQjCRQ11leT3lsVeShvSvLyw2
	oCbo4qPO4hT9g4OuRAH4lOPxdQOPksVUEoMEhr8KqjzbW22NuH/EFJUmpccAcVeA/0wz13hRbNS
	Vy9i6BF2VVEIKyTbtwM44rFT36xzRAvKz/D5wByVBlduvid3n/eqD9ZaoPnc5jPVK/CGZgGnjYn
	zJsVO/cVkbuBYQ1K/LzzE6DLXi+DJ35kY1eEajF746/a17bC9jBCMMucLnh9HzTyOtGEM77G248
	xCrUv4BlxN8cu1yLwiVLZ2YZGRxxYyEAtKww0BwnKxqkhPuK5MUxfb9AZDsxWpfhRrqja27v2lb
	ErQgE=
X-Received: by 2002:a05:6214:238f:b0:89c:5a0c:9f70 with SMTP id 6a1803df08f44-89c6b5dbad0mr29678756d6.6.1773832235367;
        Wed, 18 Mar 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:89c:5a0c:9f70 with SMTP id 6a1803df08f44-89c6b5dbad0mr29678356d6.6.1773832234863;
        Wed, 18 Mar 2026 04:10:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e8e9dsm191715266b.13.2026.03.18.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:10:34 -0700 (PDT)
Message-ID: <78efa6d6-5204-4146-b95b-9ebc18a546f5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:10:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
 <20260318-eliza-base-dt-v3-2-8a50bd2201ed@oss.qualcomm.com>
 <7a8c31ff-6458-4840-9b8e-a540a84244ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7a8c31ff-6458-4840-9b8e-a540a84244ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba882c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=g9LQQ-Mqx3jMhqGx0noA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: WsJzqHsy0sPvUjPSKKq8PKW-WgOAECnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NSBTYWx0ZWRfX/9k06lKEo7gi
 pWTnnhljFF8xlml2x84OncUDXhTOpRVydkl0zfmUOnncYnJSsESp7ZOODzPx/Q9Ijjj399dmMB2
 Z9EGYKWiJc52ZvbDlTy+4LUy5/ghqNE2M71ynJHd8sfUhf6nQdTlQDSIfERu3pf537VfvJCm/i6
 nGDyvJkknpP/V4iGW+K0lLJPj8dOL6Hze/7EGxDO1A+PH5REuYA8qORB/sDTYFuDqNGEFyfKFvL
 2dewdAzdBTNIU4MciDG3qCgKlfNUFTPYQVoxzWY7CfZbmpj5WQjxLa2UbDO7co4lFm5QTwb2R98
 D8QvR0d6j4V669lly1Ju3XwHEaa0tgiyUZzLtmbL3ERjpd0hM8z8nzeE9esqv3erY86es/DAPYF
 ycyh7PElkwJlGYmenI9SO6ffFPjSSaOT8or3TcYuUY14KQ0KJXwcTfO1zxa0VUyPW9OnBZLsuEa
 mLJ+pAG8sA5ZOIsG+JA==
X-Proofpoint-GUID: WsJzqHsy0sPvUjPSKKq8PKW-WgOAECnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98430-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED8B42BAB10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:45 AM, Krzysztof Kozlowski wrote:
> On 18/03/2026 11:19, Abel Vesa wrote:
>> +		};

[...]

>> +		cpu_pd7: power-domain-cpu7 {
>> +			#power-domain-cells = <0>;
>> +			power-domains = <&cluster_pd>;
>> +			domain-idle-states = <&cluster2_c4>;
> 
> ...here.
> 
> Each cluster has different entry/exit latencies, but @Konrad insisted to
> represent here only one cluster. I believe it is not correct, but I am
> fine with it, however my question remains: how does this work in such
> case - which domain idle state is really used?
> 
> It's more of a question to Konrad since he wanted one cluster...

I *believe* cpuidle functions fine as-is (i.e. each CPU gets assigned the
correct idle states etc. and the system/"one big cluster" PD is also correct)..
I am open to being proven wrong

Konrad

