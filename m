Return-Path: <linux-arm-msm+bounces-89848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FqoEftKcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:54:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8015E578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B31F8C186C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 14:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1568844D029;
	Tue, 20 Jan 2026 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dB3Pqwic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ds+KugBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A1D44CAF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919992; cv=none; b=LZWWUZakAKx1a1Oz+PQ5pDu94OuZRUKSkif7L8DQz/8LuglUYlZe1bdbR6kB0jSO4EdJp+YLPzl//0eLoZu4tUlsdwtgEkFwc0IjJbgagK2+RC34ndeTTONSLSLZaFf8DFl4Y8++DQ9/lMkvVZteM5UgapzrRqN77lSSJu6fHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919992; c=relaxed/simple;
	bh=aHpg6nyTgxgCsK8qde5p2NcP/Qo4o1W6B7uQhcxzfKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+irmDAzKm191SFT5d5cKxf2OryeN2Ba3zTdr9VOeONpeeiRkut6REVNuTBDddbvZ1q34uVX0qN9q0IbF3wlU8N/jc+y3mn6IYA0rWg42LrwulBvc3MJ6sbcUKSqoXRWOSG5heCOo1GHAR8TNjqIWb79ezDo/WB/rFVk4F3SIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB3Pqwic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ds+KugBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KEJkXs3154163
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+Ca6EiM2/QcRj/LhjCE8l/Go1/X4qNhdJDPChMt9p0=; b=dB3PqwicSInFkz0q
	ebBidClCZxU+TeyKKzzVQc+uxWBr8b1PV3j3y1ubiWK8xrMG4R4yKpslWiwXNN4/
	5SzE1NpicojbuQh2WargZOKWSCDDrWEtPNfoLpjnT3vMsQC1vWx9Hb/9n9TvFglZ
	jilvPQViBmW45Yvo0Ro5eRtD26w8EuWSujQr7zc4F8mOno1ZDRl1xsOcnULjAU8C
	7MYyiPvrEKUc4FSSRw9SGqwlea0QVIFCQ5rr479xxLT0BUd90G0HR31bGUKITQq+
	eId9+iq566UODM0F+es5sKZZt3tDyEvzpFLvJSPiid6R7pCtepwIUbDIVHFl+EHh
	CXNk2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q51d2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:39:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5265d479dso190073785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768919988; x=1769524788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+Ca6EiM2/QcRj/LhjCE8l/Go1/X4qNhdJDPChMt9p0=;
        b=ds+KugBUcOKV7bZpt62JglcNye2tYo/Rq8XAmgJAN3IZXDDPXkA83JQPUAXWuDPTHZ
         bOTHsUGehCogJKeogUncWKyg5Pjk7IxGxld2QKXyQDtJtKoFGCBAykxa77tHINDCb9TG
         PMVt2I7PkEvhT3H8CvAm07ofFR/3ZL0KE6qyG/5o2eJxOjwJ1lPfn/CRmtbKSJgrmqUc
         POuhv7d0gy/3i2cKovflywCqNv2nt+70WhBVniCkOrxN0XtULI3TKHGXJzvEwj8kkXGw
         AAY8aDiXJA9bLcSaGTKkMikFncDphrNEZFD94Sq/kmKGKfWlWjXHJy01GarFK9/tC0gw
         PzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919988; x=1769524788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+Ca6EiM2/QcRj/LhjCE8l/Go1/X4qNhdJDPChMt9p0=;
        b=dIrJsPRqSneYCYJsxtubGP9GenBx58Yj44dPVM1xavO97eVUQPHtDsMxiQnpi9upSn
         fbqoOo4r0qAqLhY/aArW57BdYCnjfXvlJ7nAtnQgv0JzNO1OLsCT0zNKDJ+avB7E+uDx
         xLwOvCcyuzPrdeZCMfe8UayNS2bB8NRz0nmF+8Mc0Y8rEadKh7+EIZMx9SmUxkTcb/h6
         e8GGA4mpA5wbLlnF2ciasvAcxhjowlYr25zbZgCESd/l9/uCGg1zaPUy+My0hSB9+vDQ
         kK/8kIohq+syFZieLrlMbD2VMWOSn16o5M0wSqFq3+f4xxkOF6uTxex8XTlPstj7pVbz
         kmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw4zqJQST+eTIUBCu0MMcHMVGK3A0/NJrJFVWMNGtkDC/pU/qPH4EsNiVC8h+HUIDelocxhZk6jpyQMu3E@vger.kernel.org
X-Gm-Message-State: AOJu0YwSV2Wzo7ebnRvL3DlDEs0cpp/SNxBKYmDXhjnL/PPNVWON3pKz
	1IsunwqhgEtlwqEcoYQADxrs7LaClly4Z4njBdBgk/eBFZaXzqj2zJh1erfwW644yUpku0HAa2V
	Gy6fNayOxmSgrbQIdCBohn9JUemgtpZm7pKEfdpQ1LAZzbq3VYe9kzxCDsdDTivR1/3Ph
X-Gm-Gg: AY/fxX7HV9owZHbS/w4rMQvc6KYg0VJiJkV91//YknvyVO7EHsqzZq4cVEFnAt+gt4x
	B23Q6m+j58n7JPXTfAU/iM8t0/JSiY1Yt/EENIn233LODHGXMrkuje5KYuKoPqH0PH7A6e5LG4R
	q+kxuWBtkA2Z2MCGR9HUePdnnxS7ORhLIkl6ENSHrkPml/94/psMAsmdN7cjLP/Kfa6ip0vqfIv
	meJNRcWayooj8jqldc39ohYHeOWsjJmZL/nINqkyMwYbTcxoV7eYrsfa3oT5K7UQdz1svXbMxnu
	QrwbX6E8Ihv3chI/dGOdD8zXJCJRX07KW3g94RklAO789eyL2i+F2FhhdhStH6DWsy0I/B90ijs
	uvLNYtb+6IsCDLtyJjgDeqz2R47W1SWI4OSHCzb8fDIXynhDWGFq7c82TjDhl+xYegHw=
X-Received: by 2002:a05:620a:4687:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c6a671b492mr1521242285a.4.1768919988174;
        Tue, 20 Jan 2026 06:39:48 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c6a671b492mr1521240185a.4.1768919987684;
        Tue, 20 Jan 2026 06:39:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fb973sm1387385166b.53.2026.01.20.06.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:39:46 -0800 (PST)
Message-ID: <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:39:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMSBTYWx0ZWRfX9ApSWXeuwrCo
 BWe8vb/pid0T1tfOjuMUww0BZmrAPmk6XXrbu5VgcXv6b3rr/Jtqi6alcBDB8IaruNrAyIGVA0R
 8VQOEGZmQNVjw5KkdHvnqXZItp0wC2f5VUK3kq68dRcKdYsNl7O4/ucZnviGzskumlm+L+elyS8
 F93/AquNa3DnbjiI7nQ/2LS6JkqJrPosm5qY8uZ/lIDIIt7l8fCRaxcMJCBpz5z+dXUjqKCb3kj
 6lIHvaM2D5+DX7311OBTYjQS0jxhAZTAMgJVibNN4k5SSWmIEIX7AVwOlzzmUppPZMVniy/CDhv
 Kp44VcAa4XJcuH1jfknCqgCB1swbP1XDIKXDj/enbFs05LBg6UUAf6WgkjdYoIJaDYg87mulUAS
 n4BPpbDOgzniv+1IBgAj5NYJszvmikIi/ug1F5JRy2dFsVFbrVcDjElUyAdpczgXOyyYMP+1AHs
 Nl2zqcA5wbt2QZQKjFQ==
X-Proofpoint-GUID: -9KO4Z_CMdnTxB5vMZ4IDbRE63hFXct7
X-Proofpoint-ORIG-GUID: -9KO4Z_CMdnTxB5vMZ4IDbRE63hFXct7
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696f93b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8
 a=XxyedzFJey02p2Jel3IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200121
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[31];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89848-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:dkim,fairphone.com:email,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[1.5.20.24:email,1.5.137.32:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA8015E578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/16/26 3:50 PM, Luca Weiss wrote:
> Add a node for the WCN6750 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 024e1c9992fe..80feb3e9d3e2 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>  			};
>  		};
>  
> +		wifi: wifi@17110040 {
> +			compatible = "qcom,wcn6750-wifi";
> +			reg = <0x0 0x17110040 0x0 0x0>;

This reg doesn't.. sound.. very.. good..

The size being 0 is of course wrong, but perhaps more interestingly
the base address is a register within the GIC..

> +			iommus = <&apps_smmu 0x1400 0x1>;

And this is a PCIe stream

But I see kodiak has the exact same setup..

After digging a little into the driver, that 'reg' is apparently
indeed consumed, as a base for PCI MSIs.. I feel like there should be
some better way to express this.. non-everyday setup

There's this commit message:

commit 00fd24089b8154ddf5b3e724e2c4c9974b9ba91e
Author: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Date:   Fri Apr 29 22:34:54 2022 +0530

    dt: bindings: net: add bindings of WCN6750 for ath11k
    
    WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
    Though being a PCIe based solution, it is not attached to
    the APSS processor (Application Processor SubSystem), it is
    instead attached to another tiny processor called WPSS Q6
    processor (Wireless Processor SubSystem) on the SC7280 MSM,
    where the WLAN firmware runs, and it is the WLAN firmware
    running on the Q6 processor which enumerates WCN6750, as a
    result APPS processor would never know such a device being
    present in the system and would not detect the WCN6750
    hardware unless and otherwise WCN6750 is registered as a
    platform device. This is the reason behind adding WCN6750
    WLAN node in the device tree.
    
    Add WCN6750 wireless driver support, its based on ath11k driver.

Sorry to hijack this patch, but I am not comfortable with this binding
as-is..

Adding +Jeff in case he has any thoughts

Konrad

