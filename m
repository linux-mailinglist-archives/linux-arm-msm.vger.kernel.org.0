Return-Path: <linux-arm-msm+bounces-102131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKMxJcTh1GmZyQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:51:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E383AD40B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E9D3013258
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5F9395D93;
	Tue,  7 Apr 2026 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSWstHUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QG9b9pbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D333019BA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558735; cv=none; b=ZgIUcvU1iKFSvD8c4DdstsvER6JE9JwmXMGF6faqrTj7UtO4Nd6uvti28vJovByOcxbbGFBjOXR8SRFGosZTavu3JK/Xkgow+zwYn+qqnEJgZcEXvoOP1dZBt1siiiAsG8U0te0T197UUrYuENpP/HmZC3WYDX6+Uwt78nao4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558735; c=relaxed/simple;
	bh=G9vKaY+yEYWG17l4tqx37r4ujYP9F/IMOkS4T8bzc8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2O0kcbRqqh6ly7Phd1ZIEgc9M/UeSqQs2pdvDdgxNoiBVQZjMivFeXa2wsCKUw5jrbTRdz03+9g8fDv40f+XVAwcdQRyJ3isV30oSulK0XnjLWXPYcXWH+DEQ6MN4S+OgEo66nsFJZoVUfsDTVwgn3KgHVkHjgKmZcf4fDs3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSWstHUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG9b9pbA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376nrjY492864
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0QRW/CLDGG5aY4QVmFE9nt6fhBRgakmRPRc9ekvaIs=; b=BSWstHUHhuWj8pyU
	jkAoIHvk3RB9OI7mRHI4xwnEBYC3kRi78YctQoJZ2YQzVqKDq7hX0ICUppqCl48t
	O8qm8d0K4ImQQ4CFX0A1ZpfDQe886OOyceiN4/wXkx9ujlDbWj/dWo92sk8ydPbo
	M19Lh/a0H+C6BiCUrygWOeiZDB2e2f30ZbtEv56yReHPOLElaSL+VaV6zL7iXfgI
	8H6AECS6Amcgzv179tULYzWkJiOS0ys8iqo/2vfWO4+vP4lJawNbulvXEXqNwCFJ
	6MEuh6SR2SnHLekbpBw9ESVg5uUDJeXBlINUaSW4ugT95GZJncXb65fIsH98UKlV
	d/P06A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8ta7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:45:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cff2297253so102274985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558733; x=1776163533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0QRW/CLDGG5aY4QVmFE9nt6fhBRgakmRPRc9ekvaIs=;
        b=QG9b9pbAuifcOVyAenl2FOM493jONhwI5bCOAU++oBndUiut0sJ8B6Et/Su4FpSgPY
         s9ih+SNJy8+UQ+RdFN8zg5j4k2U8C0lSpwdJ/HU4qTzl+h4RVmYg2XJr44dTPM/dOL0c
         FfOfGgUExgaY76KpMDtTvkKAOSwDaafSvagdd/ZLgijZSf/pubOy6cxX5ZAb3eVImG97
         8YbLgBVGylc4lB5mvhQfPZsBZmGf+gG4Bt6kvWdrPhIJ81HvvuEZ8+FOxo/ftiSfoLLO
         6uPZ/9lKJMPtJLsYli648LUf/SFdd0htedwzJ66zVK3srP8/tB0tAsnSmYEJ3/KZ+s/Q
         PD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558733; x=1776163533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0QRW/CLDGG5aY4QVmFE9nt6fhBRgakmRPRc9ekvaIs=;
        b=a2sfHnywkfkRSHqPhOoWmeOikv/MlxHI2jQnvxtu1IjiIeKYS46eEE/RfD8Sfs0b0S
         Zka+F0W2R5iHS6he7evs52A6JoGF/NtTwn/BGdt6ekQSHTg61aoQso0vzTqOaTKphydO
         jQUV2SfmyZDsdmmHP2Td2h8qd5Vd+riJg62y1wPWYx90s96fb0BwVGkfbW0JP9vLnxe8
         9CelRgEbPg0w8u77VzwUtuCpurfh+/2pucticAVhQXo83qlx5k53FUzlJCkRw4GJKJp7
         5s+uBZI52drU2spctdgBJZdCb04W9hAc2EYHL0je3z/87OQxiaEHXJSV9xFuc/pxDD/z
         sAwg==
X-Gm-Message-State: AOJu0YwVqzZzxE7b9fZdbGHzW2F4uBdaKYOL7z2Gu/JN8MSYGX6i6yDN
	sCpRI6FQZXY8APwTDQeN7ur3ICeg6eY8A7Mr1c0yZlSs56xZ7nzyb2wOiQT8CaxriG7xmYRgOcE
	qKz8wq38okRip9TLRvej5Y2x4S1xSLkMRX+Ki6lxEdJS6CvlhtUgd6TaFR7W2mdaMuRjw
X-Gm-Gg: AeBDieu5YlY6q5AUb5CpLy1IdBK9beUkZHweDKXfcPI8TCJfRy6HLBq2LfBL+SFBoaO
	h5w9m6eaX2m2qCKtFXKct6egNE+cHQVw/42VceSfGG3Spsl6qF6gaAGCC5b8FkeJ4eTxY8WBgZD
	VaCwFbx8lrtopgXotCIK474m5cUgNjeGEDqXSuF2NMFOKMPDTx09cmzGaJPhVVKDAH1UEQvCYDM
	dXby10QUdm9g0/4kU8IYA2QgDdzt9UIYfFU3ABXW3ri5hx3Otz8ihqvVC/BNhJ1JUf8HleySnjh
	BCo7pK6LvopsV+yA9Rla1fppmYqFodnEifjlcZek5NyEgxj6/LAUljUbsgFHL5JkM7V60DNeX+x
	DL+s666i9/tng3ogTurqZbxQhI2yb3hIc5Sbc0YEtY1mxp+APcZddsq4vV4bfrb+ILAJEl7mvc0
	JK9gY=
X-Received: by 2002:a05:622a:124d:b0:50d:a92e:fead with SMTP id d75a77b69052e-50da92f060bmr7603681cf.3.1775558732698;
        Tue, 07 Apr 2026 03:45:32 -0700 (PDT)
X-Received: by 2002:a05:622a:124d:b0:50d:a92e:fead with SMTP id d75a77b69052e-50da92f060bmr7603521cf.3.1775558732248;
        Tue, 07 Apr 2026 03:45:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b976dsm4286446a12.23.2026.04.07.03.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:45:30 -0700 (PDT)
Message-ID: <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wUOmcI9-VzpkZRWFo0x5LDX2z7mifSq0
X-Proofpoint-ORIG-GUID: wUOmcI9-VzpkZRWFo0x5LDX2z7mifSq0
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4e04d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iZwa8WBptBBy-baP3AMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMCBTYWx0ZWRfX1LT/soR+EAXM
 BizGa573CQejYZCIk+U3acqIZSvOk+3OxGBrHmBBvdYDT5VKZt7tF+2IMf0+k3/wfKGpPbmzxI7
 851CH5wiQNdStcm/UvW8PYPmbye1OCE8nuA25sCdI6c3YghYAcj5t4/8X7LSeY6sSUTyt74ylRc
 r/Pkmd8QNhvDbkeekd5/W6/P41oO6/4CC1Vmyw1AhaxK8l11cJAh1M+WEBGFjslb1yiFIGN8+k9
 whFjTBjDvdbUmPrElLtRiP4fWI4ziEl9segzj2RfCJ/IRJZlVhXgNoujgfI82lWETgzLYT6OWJ+
 /gZxj+/PWZFK3bvnJLFchae9aVvZw5WlKwDUlxAOGvW1je1heTYq1AFzdSXyPjwQ6fmAAWqKPsH
 rd0YHGZHSMKhnU+GoujZ1jUkSlo4rZvVK/yFA+M1sudNVy2D1oqHFAnJOR+KX6boaIsf2mfppLv
 XmALr33MEwXM8PckakQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,7c8000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102131-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7E383AD40B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 6:30 PM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver.
> 
> As bindings allow to specify 2 clocks, add iface clock now.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index dda4697a61b7..5e6b659e8719 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>  			compatible = "qcom,sc7280-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x007c8000 0x0 0x18000>;
> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core", "iface";

nit: one a line would be preferred, please fix that up as you seemingly
need a v2 anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

