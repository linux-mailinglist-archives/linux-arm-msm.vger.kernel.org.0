Return-Path: <linux-arm-msm+bounces-100005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ33BmunxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:26:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2E32ECAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 486F33098CDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0B7399018;
	Thu, 26 Mar 2026 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PR00CchJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vnal+AYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E7395268
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495180; cv=none; b=O/ONL8lrZvlfaCxsSjNBQ+D+/CAYvRM9fcBfTJAkjBo69rLyfMos1u9RspvAozJ/EoTC5xD+1/ZdJUH1Yqk7HRk6YAqyXj/fsdAbgQ/jfzITDcslRe5/cXI+gvp5TvPRxwecUWucwH18XY3NM1ZEOfTjclyGoNINeYi8AHIshIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495180; c=relaxed/simple;
	bh=5oHB1SpLY34giWNL3+PmUhl/5DeELC26H/q1euYdedA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2XY/O89d9Z+Ki0NStW2bVB0TLQf2d1R3QlgZ0lhB60LxxS+5KCzET8bnJ58Dql7JiVHrPYjOEojWndFtZBTxQqQG5VzDIGHM3irSx371UlGRzAgtB/ZVWm8cW50QuG2nbt6E8/rVuNQONo6E3j85q8CTTymy4ku5L7ht9bP7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PR00CchJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vnal+AYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0kjvV3957911
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma1rn09jt7hRvwT+i2mRS9fJCw8LRFhm7fm7rOmJYqs=; b=PR00CchJ9+XTe19x
	EmaxhWPfbpNmwx5c5Q2DY8W06XBeVNiUy4LOo89dtC48xNgQMJMWZ6OW1J0NWwRY
	4wD1kNIHEPFmKXMQKeOBQwrP1KFS8Cv0PMD+H1e4J8dULW7U9Y8w4YJRI7WUugKx
	jjVtRCUP6VAlG6m3TZDi9Ixbx6+7m7s+7yCkyBmlluFDTH3DEICWFe1VQfYmQwuj
	Tlfxcs61YloolvxYEnscYqiu5F/IY3jbAfKR4EndiR3fbu7XebLoIEHoshJxKDIH
	NptamURJIAQJug2FAiPgWP2yCsyWEGk30HB1dkwAgfd0MI+odTB+bUhYNQWu0AMG
	l4WtfA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjagcgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:19:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b091b44795so1570145ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774495175; x=1775099975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ma1rn09jt7hRvwT+i2mRS9fJCw8LRFhm7fm7rOmJYqs=;
        b=Vnal+AYbuKbvCgx2B+b9eL8YfT6kmIMp8PI1NVwPzmcynkA77xIBVU87cZXd5DsUwC
         Gb6ZGPzKmLr/GWbKqAq/Oc3RmBub1lLcd69Au7vPmVa4Z7yf8CToNKowQr6DpcK6BMHN
         us+aYQYOK7SIX+cWgnCIoZbDxGivQ1BuWFC0Z2N+hMxssYs/1n9fLy15RE1UVwm522sE
         AlpvUxus/Bi1iOYq+O78jyrPPUWk9I0UIEPdgri8yGn0MNnrr+YHxp0ev3sVAuzm8MMA
         jXdsNFbVX/+2OgJdjbG30+19hOoUdScct9jDTYBf++u75ZL6fGZS72mpgFLzyzqAqbx7
         l6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774495175; x=1775099975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma1rn09jt7hRvwT+i2mRS9fJCw8LRFhm7fm7rOmJYqs=;
        b=f5jX1K0+Kgcb2ptQLHrM621iqX8A/fcnvgDwvXsLNa1pv6OCfcGg/MAvi3J8ifT8al
         c9S4RTnvhUEuqrpdTDYlaCZYA4CnmNrcCt9j3slK2ZZk3unqWCMjP6TOk+BlUM8rxw1T
         f2IEwlvNVOPqY+6xLyr8nyCKROa1dQQWjoIA2qwS2X2RXQRdJ68R9K7Ll/vQVJFLtC0Y
         CrSpLowWcB+QHmKFhFewpqjJqzjY1DnPSuf/yKwh2UZS8p0q1Rdq8/zcv1VmiK0tpK0P
         +XjmiK58mEstJMHzH9JPNdV/icTjcwJEKggHvtPlYGEigZGG9ce2/zbDLUgF7dlKVHoy
         JeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk8pOyBKccNC+wSYhD5f6r3iZYWz5G+c5V54V7EpDzCH0rtblWYDSJe494MXq7d39y15CPax31LKc0YZBG@vger.kernel.org
X-Gm-Message-State: AOJu0YwTteWLP0qMlE28azEq13+sjdoP/YUec5u1+ah72gXM9LFaMpuJ
	g3ZkKX8cHLIucHHpLyhzFhGD/F17ibA86MZMcL7R5brS5NNYXoVLvBgPjhjtmZ3ktZ6aKkpYfmS
	CX+eoQeciON/Ds55X2+Ejf99T5rut/+D0WuyWd6yMZ+CyLdhQOf4ZcB8ILpOUZfiLoF78
X-Gm-Gg: ATEYQzx5itOgPT/pva0XeDCGwIzpKBwCSKOSyXpIOuxd31bPo5BijQaH02FlU1HHcRt
	+UWeN2bnSJTFIAYB0PLVXMq7k2uBaTdTps4ZMzgKdl2FAve2xcg6QMiE8A4oAEyRzYH4xfWcQyM
	RQeWCgW6dCaqMPTB43gXRlqTP6WRYrtERuHQYlbkKBg2XwCG3P8g/rXkWg4pVMP+NWWQui5z3Ya
	p/C5n2fS9NEB26Fq+bVjLxqtuEsjd+MqRq6uq6kl+AqQFDVi2PSYVh8IausPRA0ecXMLOZshIfo
	/qhiD0pwOJMHDoOBy2HJfkInDnt4X8Uewsx9HTOkW7WZEu6oEFvkKtS+YGRPFqVwclUWC0dZcl9
	JlIfzw9popoNgYsJNRPryggeIvf5yKdoqB9xXZc7fnr2ktA3eFQjkVNDOGSbSyevIJxey26sER5
	lwLHGDHwBUuTBx
X-Received: by 2002:a17:903:390d:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0b0b2fed6mr47967005ad.7.1774495175333;
        Wed, 25 Mar 2026 20:19:35 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0b0b2fed6mr47966595ad.7.1774495174606;
        Wed, 25 Mar 2026 20:19:34 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7bbe57sm16802455ad.34.2026.03.25.20.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 20:19:34 -0700 (PDT)
Message-ID: <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:19:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -tur22ZgMMe4FM_rwouba4VNDhvul6qv
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4a5c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qsWkRSFgnTEi3_olH4oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -tur22ZgMMe4FM_rwouba4VNDhvul6qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAyMiBTYWx0ZWRfXwOlwC/rvq9t7
 u84i30tQxlUxFDjIAGwCkqeWln10PXZPo9KOTSJWDN9uiHkbyeHcV/IvX0n06zQ76oO/ywztezR
 jb+JoBtdjm8fauxURft8UGrjX4IVIpofdq8d1ioi/7IAg/nxvciGUT2F8eLbfJJ12OypyYMMSZv
 Lx8DBp1wtkTs3yMi4mhH8NIf0wsGn72ZfcSnH6WFH23/Jaj7szl+7sqg+y6zhxaXnhX4E8kjBf+
 Mc0zgexsgv1ZYQIXeuxk34OiQvDQoeanTEfl6tUSVGNsm8AFmDK+5k5KvrNaZkqFAAgHVmaUVws
 Prc8Y34XQoMvBQcpMJZAuiRO/z4cWchlTgc26md7lEqoWii/6D6VMDdv7pLav5u995mTOaRQqhu
 Xbd2yB8bSe/gRRz9XEhA9DojdpAZsiF/xR+ip9s7KnwP14wY9CyMUVo+BJLDu3BtcvdhhrT+hbB
 yIFTgFPsYshBKzXjDDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-100005-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75B2E32ECAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
>> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
>>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
>>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>>>>>> +
>>>>>> +	wcn7850-pmu {
>>>>>> +		compatible = "qcom,wcn7850-pmu";
>>>>>> +
>>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>>>>>> +		pinctrl-names = "default";
>>>>>> +
>>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>>>> swctrl-gpios?
>>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
>>>> the input pin is not used by power sequencing driver.
>>>> just give it some default configurations here.
>>> Please don't mix hardware description and the driver. If the pin is
>>> wired, let's describe it in DT.
>>>
>> give comments about that pin in this dts file ?
>> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
> It is there, as far as I remember.
> 
> $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
>   swctrl-gpios:

swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
which configures 'swctrl-gpios' within upstream DT tree.

 


