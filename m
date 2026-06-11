Return-Path: <linux-arm-msm+bounces-112666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /DWIOXV7KmrKqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:10:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF76703F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ues5SqUY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hHQzHOri;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112666-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112666-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8EAB32DF7C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEB3822A1;
	Thu, 11 Jun 2026 09:04:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC44376483
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:04:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168676; cv=none; b=tMUyUnC5kHVkmCzpGhXxNxQdmhkkmchceWT+g5xUMMRpFuIWNcWVHvv2U/BTJxlyyPLYSuRk2s6oKCyWjWbRBTTsy73X4uAY1STOIbvr9OtqNuivhMqbXE3YTe0nlJ8rUt8YXUyFtfs6FfJS9fHO9vTtWnUfs3nl1yLjckMiXC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168676; c=relaxed/simple;
	bh=/AdZWHYhLwWVo5OoYwNQWqZPl4Dl50Q7xgUMHMZetvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hotoz3KyJsWrR6Gsiy2eXCV0I/bHquW7OTMrDdJdhpDLBcshIAPCeuR8wqcLmGJDWWl5jevRfjxzTySKTHQOV8p+w0mMq9DBKK8QES1BfygLzMontRMwBon4NhUJ3Xi5cJZa27EcghYqHnye4uGi17lmGue65Ymv0LiCc7kpeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ues5SqUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHQzHOri; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQEi3835154
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLylx6RET1C6BLRSx4uIEDpkfcTf14FTcGVjhzwW5Sc=; b=Ues5SqUYuWVsI8kA
	dBKOww9BskKCPxoiHE7tXF+DqMoRGNFHHtwVZ/D0vlx1AF4RB9mm0stDB0EJKSf2
	QYPrPeXeirCggPQc68THmcP5xGze0mO7g+kPIVhAGmFHwpv8f7zD+fUxRIQmDD/V
	JqU5ta9NK9g+b8mXfHNkWOoxmyaY8HP0Dr7dBvWC2LZibu3ydUfaOt84JoKvIZ2A
	oVpmdtPQB0l3Xg6wUjb4Ipf5TNRoG684F1IYeSFhJdkniratP7RwVt4zWfXQfnbX
	GXXdHSIvGRXf3hQtWT9gPgC/sBov+nhi7Qb6MnKeKzTt5GkWMaZ0egvcraT3vYya
	aqABHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tjmrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:04:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so25545981cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168674; x=1781773474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLylx6RET1C6BLRSx4uIEDpkfcTf14FTcGVjhzwW5Sc=;
        b=hHQzHOriNb3y6d+jFsx5znlo6VyU7qU0ITswuZyLqg2O0kYxhMCShnhXaVv6Ki405p
         rhPq3TzgDoav9OywK8a3ckiEYJLITIb1YrqvPNMZf5hyuFMuLTDjTRJ1Gvp9NDsgqqW0
         syLC51tpB5i1Y1wCpqJbsqQmDbZaNR1X2VqfshTVIQLdnxAHGa5DZTLOejqpAEdWrf1b
         yEBrEKTDGnFFaq/O2VtPjrW+A1mQQs+hhX4m2K/CCOnVObOnbjxvt46Q3gbLyd9//krN
         2+uv0JJPYJEDhryoBD1mg2FJEi/YkAjw1UHb65iwjUtZCuYQaPe100Cp5tfFUq+jShdL
         zZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168674; x=1781773474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLylx6RET1C6BLRSx4uIEDpkfcTf14FTcGVjhzwW5Sc=;
        b=tM7HI1QKNS97PU3wGqHIo54ob9tNBuJaSKgBuwJ+4nLKe9g8ExbmZsUZwDePycH7Z2
         duTlXcu7+FmdG0XdjoCp+IM0CwDbtVsSmQtZ7MUDu8K4vU135ZPtu9iv+mx4uFFgr95x
         ucfdPDk8uvWsDkFfDFOUplpZo6GxBDqrmQ05SqQGKBKRvAVDwNstMdqsmbEuxHQqfU3U
         7X8MsIBMJGKYeO4Cb5g2xYsZ3R8LMmtcCP2er3eH7ZFTEJpyspgXB0UW4cY6+EW9N6ZD
         rYhhTVJyF13nk5QU/BgxbV4Iupri2dU40mfyZFASDH4YYAyy/ZBJBrc9D+qFeGAAxeyD
         vVyg==
X-Forwarded-Encrypted: i=1; AFNElJ/btQJ30PUoNKvfML1OlGzBXjwkN0Zw0OyjpcBBIYjejXreBX4mn/tohxaE+/M2g5i4Q64ylsGRtp6ccqY0@vger.kernel.org
X-Gm-Message-State: AOJu0YyIrYMBBqfookQ3qcggJWZuywKktCtGK4frvFYr5RWQEca1Jffm
	+/8r2gHvjqi09sVZP4zTdRnIbDoBpsVRXB5ChtsbRv8sqdnImg+84tRMQQ+6arn1QXr/SPR1aLD
	wRrtYHz/aVjoTVSFkTIawbTNSuR8jgS44pUvQrIaF4Aw2jMn2lWkADKfxUrJPuIlSUDif
X-Gm-Gg: Acq92OG6JdRHNupGRW2hsB80aL40yzbgxrE6IJXHFaeTJCdznrsYxKZrNuh54MAzQLA
	2fEC9ux78kQcrx/xq/KTQMLIIMrJQZxqjHhIDLU1z0h7L3Iwgg++jSWWE7n74XXLmYo1iQHJmv8
	/pVJG/dK4z5mnLBrLUTH1m2xSUUiuCJODj5Ms3cf2yJKM1K6POCcfXdcx/8prCTBZA3SISYJFyX
	cgbcSmle9LJqZxFU9Y8HSxzi5S7J1qbbBrE8jwjTWnQIaJukvTBggk21u9AA2MR3N3JotTStVSd
	H2/h/ljQtfRqEKs39IxB7w1Z98L9NsLgnQ+Xl6AdE+AsIrquvU12ajFM3QtoMdE35+ZQGLYoVFg
	nbINuNO+/zFntMVbJh2PfrOvwq75Kz8HwpbxjNi8fnOymDNy0eKY1AJhn
X-Received: by 2002:a05:620a:710d:b0:915:f92e:86 with SMTP id af79cd13be357-9160ab58ad4mr148963285a.2.1781168673608;
        Thu, 11 Jun 2026 02:04:33 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:915:f92e:86 with SMTP id af79cd13be357-9160ab58ad4mr148959085a.2.1781168673107;
        Thu, 11 Jun 2026 02:04:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14315sm37209566b.10.2026.06.11.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:04:32 -0700 (PDT)
Message-ID: <6a1fdadb-6a52-427c-b65d-70dbe80ccacc@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:04:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX9GpsjZH/kzEx
 PufVyA/AOAWD77cIZugmHzAlprJMVG9GL+efBkqwKSmo53sk3u9ERL/6UJmU0Wu+CT9kl4z63v+
 HLkMfsLGOvIN7VJs2fQuA+loLvz+8V6zP6j20N8nDDsu+Q4Zk+NXJwVx4iVGIquNhk8erapoC5S
 E3EYgj8uLMueB2vodpavbpGwP2MQJuzb/H05nbLW7E/U0n7RlV2E6/GlK1XzZds8c9N9dzYExTV
 tW/SLIlKHBUe4St2948c1JS+CWsR9VmB5P+2rUdctXPpnpGNqE8zciR/oslrMHmzGgrYQ2cq6Wv
 fJpwteyZ7DRaEKUKSUbMWK5Ek7F53r6IsTR3y3d4NYBA45IiKcgDy9XtovTios5vpIUmnIYs/uO
 tssscHCAfvIqBdfwyjo+HKv0esYI6LgpUC112/jN42ziKKwrIu1/ONrPPqPnDZHXu74hkbF8Eds
 o/ZACXQq72lI9hTtdaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX/FuvbaRp8ux2
 08qjWomXQB5Ylp3oiXZCfB7J14I6R4qxRLJQJxYi4j0RPlgeqg5FjcTkYzSANslAv6rCuDPWi+A
 XGOPy0VugER/oHntsuUzrNhRW+yENd0=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a7a22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wWqRLLJhWDTYxtXTZgcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ybTzFij0AGJPslOYL0xyYrCTcYnxMH1d
X-Proofpoint-GUID: ybTzFij0AGJPslOYL0xyYrCTcYnxMH1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112666-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44AF76703F8

On 6/10/26 1:15 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>

Firstname Lastname?

> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..0989fe39e7ef 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
> +
> +			reg = <0x0 0x08804000 0x0 0x1000>;

nit: Let's drop the \n above
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			iommus = <&apps_smmu 0xd00 0>;

'0x0' for the second value as it's a mask, please

> +			qcom,dll-config = <0x0007442c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			bus-width = <4>;
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};

The SDC doc says this should be 50 MHz> +
> +				opp-202000000 {
> +					opp-hz = /bits/ 64 <202000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;

And that this should be opp_nom

But the clock plan doc has info that corresponds with the content of
your patch, please check which one is correct and file a request for
fixing the wrong one

Konrad

