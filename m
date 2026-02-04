Return-Path: <linux-arm-msm+bounces-91782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gECsBh4Rg2kPhQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 10:27:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD4E3D3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 10:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB95303AF0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 09:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABA73A4F2A;
	Wed,  4 Feb 2026 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaagb7Qs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCGEkuu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014313A1E77
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197028; cv=none; b=nNeKZfTkBheSkmFceQweBNV6VnTSPOO9/lEgJWcn+5kmXlPzaNymPdea+u1OOok/mK11DQ4uJ8JDWF9LQGe5X324lOBzqnrup9U0W2oDsQNIcmLGMxNRRRaTBzSdh7/gc2ls2377yfhb0kIAq6SxnZBGfEdK432o1ndlnLrjE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197028; c=relaxed/simple;
	bh=MN7Fo8S3YmMQdRgK1nzcy1NcyFMdbMwJEYa54s2vEjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8dQdPmwKUjeL2NoBXTyu/fStj9s6MBcx9MTup6u2zHU2mrQ9NvmbOdb/sL4Rv0Lx9USieklLgCYGujPZEbZViyhWOudsJTBugmjINSkGxLa6fF2dBwaQ5Ij0If2QlCyHqCa1KEmC18uX2V9a9uYviqh84lkxGUCIkjRTq/JBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaagb7Qs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCGEkuu9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6147EYcZ3735910
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 09:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjKek8fTnaejaJ/69hQwLRDeJ3NKA7RgB2j51vlUakg=; b=oaagb7QsvE6WR7vF
	ru9E6ehet2aD1szuLijNY4LYfSOFCc9szpyXZAtD0u5+LhxjzSNJfUwZmK2gJGC3
	3ZIbYcbnbXaoZcZ/OccNJ4pCXiIDb7fsdlepMBuyeqZrProjXCXbIXgHXBrJe24L
	bD3Lq3LFCTUKfLlUYFSjJ2JhvcPiN8D8C2ChmGoSj0Zhrq95OH1FIOchAkHqi3V4
	/KzRonGzwPWPjOOXJpOjR5Wf1o76SPSCEkqIxJX8xF0j7O5V0HW18pUHpu/E3sIj
	OR3VVMxuonQpcyfK0rLxRWbQ7LEtov6GoDKP4Z/jE/C9+mYAENEesbSi2SIyE6Sm
	sDGY5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3yp58rk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:23:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c709a3a56dso175658085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770197026; x=1770801826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjKek8fTnaejaJ/69hQwLRDeJ3NKA7RgB2j51vlUakg=;
        b=OCGEkuu9fkCOt/SXnc/kvfGeACznQzgiECqzuqe6igIJJJqV/2jXlLK978ccOmjb+F
         O33iWaI5I3k4hvcMtV/ER4K1+tEA42DRScgZ9NJnGWMQ53URv/MeaCkv/xknAQ32djQp
         cN6UoJkstxgCh6OjRgrJ5Vdz8ZYLGTXcdik6ocQqhq3i7Kv9TvrG6oL+5Lrw+Yl3uXGY
         wWh3We82ecj+TsUP8tYFme3GI6vTZ/4yWhUA6uSDXijwUw32gzaeI590xY5Ro7b4kTUa
         XfQ2MYwp9u7Ywvezo98aL8ORPuKaJKiiYE/TviGAae56u8cj8mMrc6tOLaR+evxLEMmT
         V7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197026; x=1770801826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjKek8fTnaejaJ/69hQwLRDeJ3NKA7RgB2j51vlUakg=;
        b=YkPxunkIE64huQ81EHTw5FSShEBypCOH3lgFODONCDroPTOYNWqdi+Y9N3bcmQdaL+
         BkWWNBVlfQzYhQIpByjYA9qX1B1cXQd7pL7Z3XRVJtbvkEj3lcGsXPaUpSeM0hqm5/aR
         5tvPJb0SoNFZbIWB/xDeKOnqFDRpcD/QgZOfM6Lzp8qHyGbotlG7hzYX1E9mON//cJ2O
         gKOd+7naCvBsKyRBjaRbEgO9GacEb5vxiUox0PFHQPMvTEJpnE90+ivwmcuipROStfTW
         P4iwlu58SZjMDeQXyVN+QYveIzd4zRz8JcAo3OlT4hPEP5ydexXQd4v6BGCHd2VtUcg3
         5SVQ==
X-Gm-Message-State: AOJu0Yz2CAXoDacNyr8lu7P8RAHZek15U10FohJSKSNH6qsOBNiUFlJX
	uKgfKAzIjS+wscxjVhCO7di/eWd7dErQmlfXC7k7919fk9NDCsGnuScBbiIpFKX89runxCBUp3z
	JUC0EbFkyyl5Jt7SEuX7KWR2PeOoFBTOXQI1zA8R/LyUFVtat07Xr0ZNOad8GSP7iJ9dE
X-Gm-Gg: AZuq6aJpDS1/CO82yNPxZHqPOdQbzdMIfVPGBN/vWvvUVVYbsPmUuAQo+VQLF82rbt5
	PmN5BWA9qlYr2hhoLB7qs5GFTDGOuBQfPVAYX5jAU6RRwI9NSyrWUfRrSXM0KI6MIj9yAj6Ulkt
	CrUSzU9v14Ngpt3x4pExAJWsYfKyGa2UdHvfpkPjd3s4KUyirR5q/03+1R+YZ9GPlYDe03vvrcp
	xM9K9dqH1TWGX7iHZXOMdn6YclOYauOgw0vciTlNw5aOAMK0gd5F5VAeWFtpPcJJT5F3fKN34XC
	j5hDjhKPvQBhqjJrYKqpreC2YeODlSapwhT5EDXrp3GsuYwggjmKpsxaeRg/JOx7ReWbCmhLtHn
	qXc2kIBls9cyK/XPe7RHkOyxtvDd75h2dUg4RNnvQ6J6z8gEooe0r8jwJwJUONBKjeCA=
X-Received: by 2002:a05:620a:199a:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8ca2f9b4333mr227324285a.6.1770197026128;
        Wed, 04 Feb 2026 01:23:46 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8ca2f9b4333mr227322785a.6.1770197025718;
        Wed, 04 Feb 2026 01:23:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feefffbsm106252366b.37.2026.02.04.01.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 01:23:39 -0800 (PST)
Message-ID: <5fc25d7e-2e4c-4560-baaa-fc95196466ab@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260203193848.123307-1-umang.chheda@oss.qualcomm.com>
 <20260203193848.123307-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203193848.123307-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kvh_yu3rWeavG_7fUEdgpuNiCxD35974
X-Authority-Analysis: v=2.4 cv=cquWUl4i c=1 sm=1 tr=0 ts=69831022 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=l294Hz_FD5paY8OFZukA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA3MCBTYWx0ZWRfX+tKh4GdCCx4b
 Osv+bZIRgc3M0Cz+Y7XCiNmkP+RUDAcKyY/JrZlLst2UjQ5JuLK+Zof+WMb22wFTcoG73i+f3j1
 0o3Vc+pS/Rs2+RijlwCz6yvIOiLMUWlUXW+qTc2CTCIT+DfZV2JH6NKWqBmgIwobYy4mQnQW+i1
 eblUtYGZJMArsAZzbEo0J7ZA1bImvAEBWVQNcwSC1LRhodB2oqrmrfbqyHrBoUHQtGKrQgy8DF+
 lpNnGS4iQt4O4mmGfasWlYJ0PypUximcW0mhS/7m4HjoTFrBqKYAjvcTaZH24qGb8O60+LBqWPr
 4ZMrQcKxOw7WE/NhrebxhVUh6v3dVogbUA7bRqJptM+gh3+vXVq4KbfC1NVepE7BvTW2A7KhTKF
 5LgiYRnKNDivVASQsLWma8Qdfl5xj5dEFUPmdRccCSNADD0eP5t6JyWx5b7oRay7s/ao6qMaTeM
 XDWtPnq+qjK/U3GPLEw==
X-Proofpoint-GUID: kvh_yu3rWeavG_7fUEdgpuNiCxD35974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: ACBD4E3D3F
X-Rspamd-Action: no action

On 2/3/26 8:38 PM, Umang Chheda wrote:
> The Mezzanine is an hardware expansion add-on board designed
> to be stacked on top of Lemans EVK.
> 
> It has following peripherals :
> 
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>    - 2nd DSP connects M.2 B-key connector for connecting cellular modems.
>    - 3rd DSP with support for Dual Ethernet ports.
> - eMMC.
> - Additional 2.5GbE Ethernet PHY connected to native EMAC with support for
>   MAC Address configuration via NVMEM.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.
> 
> Add support for following peripherals :
> - TC9563 PCIe Switch.
> - Additional 2.5GbE Ethernet Port.
> - EEPROM.
> 
> Written with inputs from :
>     Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

