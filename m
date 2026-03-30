Return-Path: <linux-arm-msm+bounces-100802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E63LdR7ymnk9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:34:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA135C0DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AB3730AF01E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23EC3D3CE4;
	Mon, 30 Mar 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2k1iVls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMMkKS3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994713CB2E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876753; cv=none; b=aE0u3PA8xmbVWcxxoxuRdP7vGXOX1XWI26npvxcmHBgxQQGAwUrZi2QAk1hvrHMyC8yLgw95YbMscw4ZVNUzP0mtFW5ZfR2974xnwA0SrlDk+6cCR7Akrmat4ZFtwvkNjkIL+wIMn4tVB32CheRDjZ1G97oBcdWH5Tu98CJ1g9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876753; c=relaxed/simple;
	bh=fa0YDhKwhZ5+jDZZzT8LMkH3gOrvByVwmZV0YEiz/uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mo9DXGQ++vzEn+KhK1saH7RGz0V3lEVktuC3au/80X4Z7Jhn/cZEykVtkPuDybhkWsWI4icqiQUpWdb5xp0AlKRKwYAl70RzSfix5Xc1nG9sK+13SRCHmmZ7XiPEVWZZ70X0QTRlbLIa1NbqIoKIjtVNys20ctj0Y7QRnUcoRSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2k1iVls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMMkKS3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8Q7iw2458515
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gp/uAhNpvhPnAUsObjj3qF3uuB/aBnDtd70JcAQP+kc=; b=B2k1iVls70uAYgIk
	snrpdmdAwIqq5Ojpgb5vsRnNgpo4fqn4ZmsyTwxCfeX/nPSyMl12kudsfhVzHIKS
	SiI+xOKGVgq4E7iAMRWpLAUccqXRDmaIa5PnMfcp6rXrNo0UIgTOd+oKkcnDLpc8
	3743izqBfYbNMM7NR8eUXeeIUW4ky2xY6MiyPUfCpIaqGnsODOuUAlKj+1MngQEE
	GDHXLTtVPvjC6kiEAuzeLGL6T4W2FKAE+rqv/3IZu/VUjgssMVZpGOWCYEmUzvO1
	2dVtrZBmYaf7GTSGl/qmoYi4Qoyr4PoPV89I8d3GHUjSjuKGEOPsQv9/Oquz9+yV
	UdYbTQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnms7ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:19:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953a3a63509so26419241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774876751; x=1775481551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gp/uAhNpvhPnAUsObjj3qF3uuB/aBnDtd70JcAQP+kc=;
        b=cMMkKS3AcTvUhMpFBh9tvpDQnK443y+t8cMR6PEZbv6VOE/CMmD+r4QiFIlkkcpFYY
         bMRVEcfP6EcAKe2KZo9CgbkoIhepk/JRq8rf6htlmPnPY/xfMtRfDHb5xbegXRs0h5Qz
         aAziCFMeWdh+olLqRU4CjlDD8gW/0HvN0a9umMrJ+OYPE4j2kroFHufJyJSTqKQSpDim
         TWvTZCuy+wGIO2oPasiW4OKAfqg8Hw62P3kVpLJNE1ERI9UEMwMmloXL0CkWh3W+piNu
         h4B8+KZWfQo6Nu/TPxip13FT2oQVxrsNBv68ts8vaMEgph3419uZAcyhDfJFFj3G3NzA
         Gotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876751; x=1775481551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gp/uAhNpvhPnAUsObjj3qF3uuB/aBnDtd70JcAQP+kc=;
        b=Yt/mHkhbuMMcDpe4myPbiUvkDjwvjiQWzAU9FY7DHXdG174e95D5MzY2Q70qdNRp/N
         /rJRrqU+qGQK56ir6lTFjkwbpalzZ4Ir0Rrx0m2vJ6Mk442tZIdXlGtmun8N0kzQpEq0
         RblT/pmh3rPXmoBX7C9Uyj7vTMWvVDsBU4Wz/z3SzjNbTJzSZcIGCATl/JFkHetsd+/K
         L+2E9UO77aLQrAzFbVCzppBCZT7D4xkGAvDVBdY1ZbmE6Nhda7WWL2RPKtaitaw8eBbl
         jr/nJdcSlvDSOLC7PH9i5z94JJlEYVdtPHyy8L3mgtL74UP6qQ7jjv1HXOF91jscG1LX
         3nVg==
X-Forwarded-Encrypted: i=1; AJvYcCW6hRoDN7K9XCmTvtWEqa8t9pYVd+ZABZ1N5TLeO+sELrRqvygkFprsfIbI5+hLyWctoF7LF8H09iAFqIwi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7G/q60OQz1XE0cbYWlSZZm5ooK2ddwcTpkTEFyvYnyneIRAog
	ab81vVgBcDIPUXxudIXp5BeLurRO+zLJ7pSCvuVH4wX25PPA98nQhojAaiKD4BvBTB2q8jbUWKt
	bqyRNVrxTPs3r+MuZaoxQvm4TMwlXBEbHqUgiSEKSIWQCLUoKFVY7waaiXEq2nByYcxEw
X-Gm-Gg: ATEYQzy+Vp5OIIUyFinFOiYrA4xcFAxzr/Na28rLT/dqBTR3VVKxRNSSFFd8nSON6Gh
	aF99voEX7jerm4HjnqcmBlnww/j3subrUTpKc+2Z/EWPy4pQpE3/8aIKX8nAbmiZtPxUlhG1eDZ
	sc4y/J9+wLOHt8XS/dEiBhdOpNbZ8l5gnG8SlwPFJt1ZjYPWjD8k8ayl/7ywlivD17rA9Trs8Pz
	n6gKVUyd2jsIsrgraZ+n63kdS968LGXbgXfOMmGqT3VI9AIwiQJT55L+e8icT9N7c8zfP0GKWjY
	Yvj7bIbx3V7m1ujSyFDYoRVhXBAXVaAFt/tYpBpqoBd2P+XgX6eOxw1rg8QgxOzkLalXAOHgitH
	Oshc89fn5KYAH7kcsV0deWv/aMH2OPTakCZkKhil1Ss0PZq0r+ictvfBYQsv5+8XbY/R7Kf3eHK
	zgxDU=
X-Received: by 2002:a05:6102:5cc:b0:602:9acb:64ed with SMTP id ada2fe7eead31-604f92f2a6dmr1649193137.7.1774876750963;
        Mon, 30 Mar 2026 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc:b0:602:9acb:64ed with SMTP id ada2fe7eead31-604f92f2a6dmr1649182137.7.1774876750536;
        Mon, 30 Mar 2026 06:19:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838e171fsm15451261fa.37.2026.03.30.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:19:09 -0700 (PDT)
Message-ID: <9214ca24-77a0-4597-9c28-12574452fdd9@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
 <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
 <20062190-609a-4977-99be-c27df90ff321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20062190-609a-4977-99be-c27df90ff321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMyBTYWx0ZWRfX5h5gJjXe7cwb
 NiKC7RK6WdPTbbZsk5fRDmppZEyLsErF5LJTiehy4xhX3LTgCcquCfF7WtbFhyJibzLaToZ1Bf4
 /6F6HoSA8dRwr9v/raGvZpXSMHqKIpizwROMq4Km/Km/y9W8h0SbUusDr1lvI79lVnPDdX4o7oA
 L39vSvoLtiOZCVRzYu7VJ+zK8dc3NoTyxPv2CW78x8yabtyRRBfHY866iEyhiXIbcewM0sRUhne
 DZvoEdRGJ4yn1B0CvI2x8cMwjmr4bpB4Yb9gkGQXgMXSsXPkOLKOiRiwU9IeJ3ztvDvi1GROROO
 H8qp/dJcl9GLSTjYkVUQj5u9oK25kRE9/9Ivj96NVT8RLKRQE6s9Ix/gQkCsOoW0Z015LK5d9R5
 skXZ6zi9KaIaO/aw7aJ4Fg5O43sw0dtFPIEHlLzVvxSxS9fR8/VLjALT8OD3BUnyz9RqZECSS5f
 flODKLTQAw9SmUi7abA==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca784f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_JphER5ef4O4mSyQYpUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: lJmQAOw--bLjbDFnKHJOM0-u1GajrNL7
X-Proofpoint-ORIG-GUID: lJmQAOw--bLjbDFnKHJOM0-u1GajrNL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-100802-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,88dc000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57AA135C0DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 1:23 PM, Viken Dadhaniya wrote:
> 
> 
> On 3/25/2026 3:02 PM, Konrad Dybcio wrote:
>> On 3/24/26 9:51 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>>>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>>>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>>>> the QSPI controller node to enable support for this hardware.
>>>>
>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 80 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> index 75716b4a58d6..fd727924b8ca 100644
>>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>>>  
>>>>  	};
>>>>  
>>>> +	qspi_opp_table: opp-table-qspi {
>>>
>>> Why is it not defined inside the QSPI device itself?
>>
>> The QSPI device has #address-cells = <1>, so we'd get:
>>
>> Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table-qspi: missing or empty reg property
>>
>> Konrad
> 
> Yes, I am seeing the same warning when the OPP table is placed inline
> under the QSPI node.
> 
> Given that opp-table nodes are not addressable bus devices and therefore
> do not define a reg property, what would be your preferred way to model
> this while keeping the DT warning‑free?
> 
> Would placing the OPP table as a sibling of the QSPI node (for example
> under the same &soc scope) and referencing it via operating-points-v2 be
> acceptable in this case, even though there is only a single QSPI instance?

I personally don't mind it being in the place where the current version
of the patch puts it, Krzysztof?

Konrad

