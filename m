Return-Path: <linux-arm-msm+bounces-113258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +s2xGY9MMGo7RAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 21:03:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E736895A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 21:03:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XUfEbeJK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rj7xjFEg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D09E73020FCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DAB30D41A;
	Mon, 15 Jun 2026 19:03:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40421D596
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 19:03:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550221; cv=none; b=OCE2DVNHiysyVR8EChPFYaWVFly6wL2dhppKf5aP7xcX3CDpLC2ejKghZQahvd1V2f31ijkcrjFCj7qVdGyOgFeqmwJD5XWVFqYktaGSVqhhyko9lWiKdHMJOIOrdjhNy4R8ksQQe6J0XdOd/e0HQwT0sgVA1pTi2jstyikMzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550221; c=relaxed/simple;
	bh=OFp9ixkZywvv5M8yd51e17AcwX2Y+o88z3M+FRHLf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCn5namO21F5X78er+KBI6XseyF3OdPBNrHY0SkYColRJm++QrVLlZnLQsnGYrs9xx8I+h6OWvUBNKZS8j3slIA34UQL9dTM4OK/bhaYwQzV8+NqvKq7AZe+J7Uhjfpc3whxbZ2YHnmeSHR7hETc/LO0DKfCfhZAqqT0RehkxGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUfEbeJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rj7xjFEg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx04K3577888
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 19:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IDNg/6lzxX4ZC7/zodIna7Ej9yrMREtnvW0RLmjmfI=; b=XUfEbeJKwwDgiq9y
	C6wX75Jg6RdymT0T2OmFHhCVKdogBnW0AAahH/OcOeDfzn8WO9buPb/Zr8yqnhb6
	tX0G4Cjn8W1MJIIeY9s0kVNsg7QI5zGiKJSb0bEF1mku5HNXccEiTnn2rtoekZ0R
	3XfhaWrcVwSLa8llbrjLmHoHtvjMAGlnzEpEBm+zuMixD6B/6ybgZWRfQ38teW1h
	yDCdMAi4EunYi2upkeNZ5LcqtE3J1P67OwwbmgxnbOGVgLOR+F3MN+c18gGVgMY3
	86idZ1M7G4fgSLqu18BMn5qi8xHW5au6Z5l5/zaw1A8K8RH8S2ffgF67kAv0Gm/M
	Qwlc4A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete982na5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 19:03:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30761ab3483so669385eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781550219; x=1782155019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IDNg/6lzxX4ZC7/zodIna7Ej9yrMREtnvW0RLmjmfI=;
        b=Rj7xjFEgZ/cyDoO2j8dFUcyneVLDUXxd5MsCRiMAXQradt1a7Q9Kx/ZOCb9OCM7bS8
         NXv+IlGHUlYGx8M/FnKwztWEfEjNEARo/5m06stnhRazfbYMcCqo7AtEByY1m2fgh7Is
         2GEnLgnsEXUlb93IlshwnqN5//GeyHwUBXRJ+G8JCo4a+tbLTotK1pT+xIpK88hIkSYn
         f83FuUhViZmS2fmL+iENIydV2aunkg5Lr+69+FyM4JH6QjPld3lg4ZwScBhVrnryrI9X
         Mok7hjI6g/FE/ymZ7PfxcdTBJLzlGlP79wb9TZBxk1QFCb33G+cCwkhC6e+WNgrCJXW1
         Cghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550219; x=1782155019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IDNg/6lzxX4ZC7/zodIna7Ej9yrMREtnvW0RLmjmfI=;
        b=HhWJ2lcZCyzgReCudnJwiZkPiZBmaRuFNe8Lt2oV59G3Bmg3P4XnQx/mX/f1Yz6iYu
         2ZsoseDWTNdpifEKSArbs0nN6qX0CUM6SqZ5bkDteKONjL9VXxXTjoQPWg8f1ncqtgzh
         EuSQeA1W7lG9dO3ixAeL4mXO/G5XOxrBBCtT/biTroLjIULr/WYbFfgvL0z3JHWqdQJ6
         e29Zj//xNUWYefy7p8KliGwVCszg4PMLZRP5084FFjktxd4/a5Qi3KciWZ8nxmtYsUBa
         gT6abWt/dyuIDnWPD0hYyRv0NRD0Pdp+gUB44NCkPzHauxr2x8NJnt0SU7IP1bLmT2Zf
         NyqQ==
X-Gm-Message-State: AOJu0YzY9OP7lfG4YBLrgwUrndhJs623Nxw5dXwX20jiyq2aTbfbLkvC
	5JAFHLd8EHJhrzDlkWgetCdjCVzxw/kmsMGOn71dIvLEVz2S78f4TrjuOF0K1NhJKqXCQW/fHkZ
	8sPSW+z0gpiSnyVCtEEwuJBnkacOdNGqwbU0vzN0KwKTLCdz8fcDsnPZzG25fbzWivxlR
X-Gm-Gg: Acq92OEPkI9XNoyoFY3ruTC6b+arJXyKX0cHmNt+kcQln7HlpsPnukNbIRInUY0Gvsj
	PSiEVqpIKfJq7eHxqDMNew0yjq7TV81Z36AXXvHJQZQDariTcmzQw0QghOMK+2Y9UjjMHyCztHs
	NqN/n1BaP02/1DfqIZ6OZIxsL+Fdg5ssmgbnDfuaCzI8CNc9psHIIfNCgzHuKRdPQUyljx3bnut
	GHevdTjaK2fdXFk0ayMMHWmswdHTKExM9G7WjWMxoNVE9wZbCVTrEg+RoCnwqLyzjqZUFHHt04H
	SCWlQSLr5tAYT5Tq4xrC6RZqxNDaBAfQMotiAm1e9Ft2ve4ova9Bhj08/kchqyDebs4F3aB6qxu
	8eAS0xkAQUE9sXCwIS/1N4IQ37WLn5puq6ZToH/WRpXfMS49MFvLmNPmLn1mciilpk+GN+jkDi4
	0sTWE4m/cCQ06WWg==
X-Received: by 2002:a05:7300:dc0a:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30ba5f65ea9mr345586eec.20.1781550218573;
        Mon, 15 Jun 2026 12:03:38 -0700 (PDT)
X-Received: by 2002:a05:7300:dc0a:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30ba5f65ea9mr345556eec.20.1781550218064;
        Mon, 15 Jun 2026 12:03:38 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.240.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4f7a0sm14498431eec.24.2026.06.15.12.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 12:03:37 -0700 (PDT)
Message-ID: <7c94cd53-af84-4766-9e7d-96f6462303b3@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 00:33:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset
 used on Shikra
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
 <d2098b36-c514-44e8-99b9-2213c4d52752@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <d2098b36-c514-44e8-99b9-2213c4d52752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a304c8b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=6oJ3Pe8WsobediNJCW6FeQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=d00akK6jzC0l7pe6fNoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: dhSAWJxBS1RhRF4ldcs2OiSo1u19ft4_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIwMiBTYWx0ZWRfX8gS2YknIIzOf
 bQTUiWnf4OFLMewKhNbwF2b4O2UxGaiQQ2erums066USIL1EpBAa/1uM9zCrr5a8rEYpxY7W3Gy
 s3PlfCcZ5UJUWRez+Oi5VzXS7wlNigc=
X-Proofpoint-ORIG-GUID: dhSAWJxBS1RhRF4ldcs2OiSo1u19ft4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIwMiBTYWx0ZWRfX/RjvQJX1TBKR
 EGRr9Aq92ys9QLDQYWArtGn+QvkOf4+UK1Xo0kNH08+UBUAU+gpa/byYMU0siAjFpILWeWJ6MZX
 FCm5HL7eqFf2teQWsnQcRUj064cHo1WI/9EeuQMpY3k4xU7GbUdHtVozuUghIaMwvLveHYoeG3I
 opIbROWuKb6XPhPna1Nr/IJ3oUxhiV5B4dKKVnGuPNKHL0mq94SdUmuFNwOg2YJyWQOV9sw3bKQ
 w1p5nzdJIAlriBgqt+KDEfMeeFb64JfbwThVrcDYk+B9GCNM9lcgolk4+oZ7VreaGYKrmDzLmyz
 EJuKpfmv/TnAIG79fuN3KGUyt6zoqXs9iN8vjPxPPk7wvRjCXZhPYqndKzL3e8GyiPFcQseG2Sh
 5hYgRj4uoPLtBz3Ko0TLNekaA4CTX6rHqMhFHWnYji1TN4e8BUMfePia0yEpVVPbR8nm8BW1iFO
 0bNU0C2r6QtMWCu9ejA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113258-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pratham.pratap@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8E736895A5



On 5/27/2026 11:57 AM, Xiangxu Yin wrote:
> 
> On 5/27/2026 2:44 AM, Pratham Pratap wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Shikra uses three resets (dp/ phy/ phy_phy). Add the extra "phy" reset
>> needed for operation of QMP Phy on Shikra.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index c342479a3798..067e7f6e5642 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -513,7 +513,7 @@ static const char * const usb3phy_reset_l[] = {
>>   };
>>   
>>   static const char * const usb3dpphy_reset_l[] = {
>> -	"phy_phy", "dp_phy",
>> +	"phy_phy", "dp_phy", "phy",
>>   };
>>   
> 
> 
> usb3dpphy_reset_l is shared with qcs615_usb3dp_phy_cfg, but I didn't find any optional-reset handling in qmp_usbc_reset_init().
> talos.dtsi only defines two resets for qcom,qcs615-qmp-usb3-dp-phy, so adding "phy" here unconditionally will break probe on QCS615.
> Please create a separate reset list for Shikra instead.
> 
> 

ACK, will create a new match_data cfg for Shikra instead of reusing the 
talos one.

Regards,
Krishna,

>>   static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {


