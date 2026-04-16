Return-Path: <linux-arm-msm+bounces-103365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uObFIku04Gn5kwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:04:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135740CB1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B8EE3027D8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF6D396D15;
	Thu, 16 Apr 2026 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMLlm0sP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vt1XosU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E7381AE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333276; cv=none; b=ndGV2RmTEUm3RQHAH1Yv78CgrpnSY17fz4xawvcY1DKe3F5GBDqqZAJq7Ji45COk2iBGOoNxWVBeqXzsRGBZ/9fTQgBr+0GRP02sJ21PzY/IdQ4Rn71qkdsPwYnkGnomEnvT5NZnRi5mZX5wZdh6NotA5j6IMFUgWlb4V2djq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333276; c=relaxed/simple;
	bh=UIXp/sGXuLKRINEvgyEHx7Gzfpv6ZaJ1YnMeey6+Hz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjiF/otZVjI0eBtIOQKl8vfRajxuAYElQU5QkWmmigkiDm+ev1aLlFsfoxUlAiiI6J0CWqTx2xNu+gCpHR6oiAwNvL2tRXq+FIE+pbcQ3QtfyfNGThetl6dAVB4VO/u1atdbpRj2CgmdLvhLKr/m7bBmZKRsJ2kCu8/UIfN2T6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMLlm0sP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vt1XosU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9NGqd1554426
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=; b=bMLlm0sPF3Xf5EJw
	0zmffa5AxDTQ6BMQu0NptUkSXA8IBU1kwUpTiHi2l7Kr5u4JMjo/znlBAnTzG8AJ
	o07x2uqXw2EVig+e2uhU9+d8V/4/ZcG6lzHbLVVTXg4W4kCBjVOtuHmmpoOEhjbS
	LbGOgBVuskYHcAsyifAmTxR53eleoua08AxJASv1qxHqmGDhcsTlh6cAW6Y8eG9p
	GZEYdxsFoa/MhmYNEHz0GIi0LUPaiF+XbGk13EFBe9lQ4HFYNat6/Gh7xmqPQsDi
	RT1B1bcFLq19NF2pgK9U7Rv/mUMPN6YsUG9scrOITtXAjOqIR8L++MDee0NC+9hX
	M/INQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn95gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so105322935ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776333274; x=1776938074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=;
        b=Vt1XosU12SCLp8MbC49qs904R/TEHXtZEWZ50Lj3CyR+g712TXzSX1TNu1YM7hDZUq
         O08kzdkvDUL0zsn+tnp+wpaVZMUORdMJdO8YjeDfL2yZ7ZjyeHJsdtLh+cjwYfj4ra1t
         frkQ9gGK6QvNULsETY96aTk9xPc0/2JR2x5VEDzeo0q0V/Vczg9EE/RAlQmzBx3gQCQI
         v/4Cv2kNAENKicWZhvblW54THQ10UN0SzfRIlH/gLchRpZw1+eywDGtxxlt4H4A1CGFb
         pbj2gU1+qVpoeGO2WfyTAACkeWC90QeCBDqytxR6V/e6zaNY3eAo2DyBvrH1K4z1b3AW
         YCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333274; x=1776938074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=;
        b=aEVhviwXll9+NqnoO/R3Hkg2kYJo4hNMEI17N2MC3A6rwXPQjy+DrMZrD5uM3Anbae
         BhPxFi7D2FeFSej3wpg7gnuYb9LI01YRQ7i6d4gdDE1FYa6wIO/WMN4mUgpCs0809KgB
         XjgMSdVolgaSM/FxH0UzkOkvlCDfMXvh6ExtVYrsDwui7Lv4OKeH/gMwaHgpl8ytmZ7k
         kC0IsIClFPwz2YbU3f2PctfBRt91l3ARjy6Bjki8D7drRGwt4rH66BTFBqW6TSwLzzSO
         pvZHn+3TDo+XI9wS82G+3BwsRaEiiuEuRPN746XNHqyIGDScG7kTtOZa0oZvK97QjsYA
         NaXg==
X-Forwarded-Encrypted: i=1; AFNElJ/y3i6Wymm8Kv4pOleqwY0lAMJ42RZRU17TH6gzcopNg30653Oqr8P6Z6HChdWtAiJwnzPnVvKMAz/pZHBn@vger.kernel.org
X-Gm-Message-State: AOJu0YxBRfmVDxASMrJ7B7l/hcRB1QET/gLqlhP9CSUEC4uMhXEDlOHc
	gvORFDaD/c+K3A/jsc5FTlyiFmXt0n/uRP9SOrMO1i2UzPT45+lmnmpkWtqn1FGFLQIn+K9mjjj
	nlXqTftMLigQJcQACofEiLjbBA/9O9AizkOgK98Eiu16/Dl0yYZNjp68G0moxRAjAFJLZ
X-Gm-Gg: AeBDiesgplD+GKX9kJ4dfbyzFdsF8dOF27OSJSioCvwNi5TA0LgKvDH6+WIPd8C+noi
	I92jTpHTzxDi/3YCuDl8hEqPVDHt/Nl+qPmNghHc/xdlLXD8eOeNCmOomGrWsfqa0N57pThsN7z
	HCPwjLpRAWO8dJTKGpqUhNWj6t+IipBmaWwZMltNGgaPQFlIyzMD6vErlBD+MpQ3ke1NDRwy97P
	Sd40t/xod7Fwa91VCfRqnsqg15X9a3cvTJx1mylgcZwVyE37buB2LbZ/svOq4co9MkUJIhcwfkF
	RGAAlqEo1tBjOzAXxIxVDJYfOqG5ohiDdgUaCc3r1EX1lpKspRG/WK3t5/dFH1baEODDpDutGAP
	C7HdxLQ4otdUxMQdKk2h6+BkL7MdFzIWcwFRa+QeFql7GxeQyM1bQHh1cnujY784HQg==
X-Received: by 2002:a17:903:3c44:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b2ec46e10fmr182420255ad.31.1776333274301;
        Thu, 16 Apr 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:3c44:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b2ec46e10fmr182420065ad.31.1776333273837;
        Thu, 16 Apr 2026 02:54:33 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e23dsm60434955ad.39.2026.04.16.02.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:54:33 -0700 (PDT)
Message-ID: <6928a3ed-00ac-4e86-b5c9-c3b27f3027e2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:24:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <20260416-khaki-goose-of-will-ec76bf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260416-khaki-goose-of-will-ec76bf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SQlar_1cNwX3b9aBzdr102hqjQAr50_g
X-Proofpoint-GUID: SQlar_1cNwX3b9aBzdr102hqjQAr50_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5MiBTYWx0ZWRfX6AamGiNixNef
 gZtIpE/7ggVthMSkd43JI1KWhGi5trPYsMUoFPU49WJ1lL9HX5tLfCipwhrR4PRqaf7lcSVbJwJ
 M2VUwmdTTlehUPnhT2X1d9JTuNU1Q4G7UhAFaWAaqREJ4wuR4sEhURWBkvaI/5kZ/IOK0Z3K9c0
 K7NOejlSsYOyUGxzUtlcWvlZXshrT3H5U0Vuhv9av9RSWZ8CEyKAfRHMnOTM8pPqYL8stXoL2Z/
 dclCtJP2giWgP+ilI2n7rXz0MTMZopLNOdPExZ16nTS7cdwxf1f7acFHoAfJvkZ7L24adZnRblm
 gspLrKNqF5/K0V+aX4xfj4HmfhWSDJosdrbTSQcW1YvNtsLuN42Qg0+s94Ow4eRpoMytpvlEbx9
 HRigUIcar1wYH3NTWwxVHmLdn02OAGExTHJqmRXrune+9j9sH50JmZo+djrue54Y2kaVI1/cixj
 NGmtgftitr0h1H3tCsw==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0b1db cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wHg0G52u6mwEmVL3RUcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160092
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,0.0.0.0:email];
	TAGGED_FROM(0.00)[bounces-103365-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.219];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0135740CB1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/16/2026 3:05 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 07:03:19PM +0530, Kathiravan Thirumoorthy wrote:
>> +		xo_board: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> Labels should be lowercase.

Ack.

>
> Best regards,
> Krzysztof
>

