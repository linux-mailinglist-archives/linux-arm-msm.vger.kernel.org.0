Return-Path: <linux-arm-msm+bounces-112118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNurOLfpJ2q+4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:23:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9165ED29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:23:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nlgDO/26";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V5+VleG3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61E88305AF71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1B239B951;
	Tue,  9 Jun 2026 10:17:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1247B2EEE8F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:17:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000225; cv=none; b=NAijI/XH6RMd8ca1H1UucMzpvE/IzDbUc4U6BSp5DQaomuPOxJszrMRuVhLayAxzPZ4/26FFKNAv2ovsZvqt9shwe2NX8KA6D3+FpDG0vQpwy6EykA2boJR1lLyrzcsw2Sv+J1crLtcN2WRNZxZbWc/YE7IhFza8QoqR/z24Ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000225; c=relaxed/simple;
	bh=60lbSBPHLuPejyGJzFkNlNTtgRn0AxS2NaXpKwq4/9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcLdW3TFtXGXjKF/fNsFaneRc3OHZ/N5HH/l56uGlfsfsjnKU/esOJc4DvH+9lscu2ai7WDI82hyEZKAA6151zff4sadiAPI+EJ/9pgqfV74ALbhAFadXJMmjWV+kvh4jqz0Tm7onQq4tbFmgqfuUe/FGz1oFN5zKcwCIfCGyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlgDO/26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5+VleG3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vHqu1868616
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JudsusfDtbrr44rlxP7/oBk73rfyE1SdPB/IQf+KXPc=; b=nlgDO/26oEBjtB33
	e3LXmHI/I+uVAz0axQLW9DaSUmE5W2QolchARMtMAxaOv5oCsHMA9BanvXAn2rgj
	Rzq5mUiXmTCa4pNfaKyjrBpcgC3ZoMpdJXTtJre1w8HVbEU3n7lQQn2jEG7xbHEv
	NtjSa71NrurmuRmGEnKlHmteCs0fRGu6YYOy/BtMQx4mmJJaeduh8RSvYmcUU3R/
	L7hLmQ0bL2KGK9Od26tveYRWJxYm4N64xOciOSvHhfXkrW+FXFktHpi5TlLYrYAG
	opVIE8rTihmgBAAboS14MA8z98EGrJ4UFyS7mWuyMX7NVPm0Gnomn33MTNELmDnm
	/PNbBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wg74v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:17:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3922139a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000222; x=1781605022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JudsusfDtbrr44rlxP7/oBk73rfyE1SdPB/IQf+KXPc=;
        b=V5+VleG32ERvBmUt0YSAraRb5W3R5M+snEPbUaVDV/8Sm+8/2FDbw1ECKCqC3TUCPm
         dItXu3aLGTJZ6nULo/IdKg9rdCnF3FKTX7/M1DAjVU5DeKyNUNujI/95O0KQA5bUFNEJ
         +ypE0bb+YTiHaH4pqH8Ibz/yzgho45pzVfHeZhXAXZRuIy4A16imFcBBFVqfAwZG4HQw
         0R4cxBCfVzgwW5NszIlgNxwDdahl0ADGzV5nJw6LmzrWQv/kSA4B8dSPaN+KK2TqBvTS
         eUI9qN5hnejS1IEXN10tLdGpZkeQKPFE2j1j2iVmFvyEc8/czNjiMBa/W5ujm44/iv3t
         9+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000222; x=1781605022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JudsusfDtbrr44rlxP7/oBk73rfyE1SdPB/IQf+KXPc=;
        b=GdDhEe17qFh5Nwserd/rYJ1XgqXL1pZssx77wuXhQN65nMjAiUWqdGNokTlFCNiD4b
         997jsZuwSsoTbr2MVVvS1SqkMFeGU/9Sir93Wd2LDANTpMUTuJQJMEJuazaiE6ZV2P9t
         BGTxSMNaFa2LAdtu8J7bLGRhpNwWhEMCFCenyuhmnLbqwUMF2xIUfDAVAabC+D6Y1Fe3
         vwlTtVr6Rz1K89wHV7J8WTef9O+Hl9nHAp4OhQuDmG6bYC0mnUvEEk1ipObkEvJWWZxc
         kHTMJPe5I0a97/0jpyjmhQTnd67KR80a9XA/ygTybkOtlhw+1Jv7pYLUkxBAVbhU8ZwL
         T59A==
X-Forwarded-Encrypted: i=1; AFNElJ/pbWkfLV1jQrAP/kuT1JE2jxpAekqbFmCAPQxnQKRL51iPF/EOpjPa7UHQ7pKVopDMnxIM5cytLH6+ne4O@vger.kernel.org
X-Gm-Message-State: AOJu0YwuIEFSUoohEUFfRvxgo3zrdEB/gl4OkptUeW+ZoVglktPOvXKh
	4uz42w0mZnf85fDOw2SLzAadRMICWXF2heUqqiVZqXXSuX9rBizI1WgV/KRJ/miz/DQG33lkMYA
	u40zyAfAHkK8Fa21BxdiSYdSkyklq57Kbjr1/Ao9GEJC3ohxLcJJ1YJv0buBefXUAdiDh
X-Gm-Gg: Acq92OEpLTUA7pEXBIWWkTitI+z9gV1QivFTXumEDCkcGMoEgKIZy+b9QdRJ+N2WC8V
	LArlG2+kMucA3R0QErX1A71xwy9g+MgWrkEjIoIByGBYHOVwGuamFXrXoDQHyFF0WuIcJRoCack
	1xbCf72fGbYrwiqI1HbUkULbutifAT0fauS84ASVJGTwe6viIw7ccKDBzGQyLa5K/bdtpDiEJgl
	TVe7nmg+FLTQy6B+E8jaRzj/qNtr91DTJSWv+UdcYIdiUgeQS/XTmXmVfXFFT4Hp+I87yY0Q+0P
	UbqDDhgdWf810rKDUlnY7cMqNPblEK+UMqo1jHHsr6Lhs24VCUx3Z0hoT2VvsNojsD7WwkLKtfW
	JyJijLRiMXJqv0WekvNEsU2cRQFYCAqvyoQ4NgJNXmg8a3hIbDY5uOfGrf6GohrRuot2oz3hLpP
	VK
X-Received: by 2002:a05:6a20:9398:b0:3b4:640e:f6c0 with SMTP id adf61e73a8af0-3b4ccd77534mr18165461637.13.1781000222549;
        Tue, 09 Jun 2026 03:17:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:9398:b0:3b4:640e:f6c0 with SMTP id adf61e73a8af0-3b4ccd77534mr18165419637.13.1781000222095;
        Tue, 09 Jun 2026 03:17:02 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b374fsm17704239a12.25.2026.06.09.03.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:17:01 -0700 (PDT)
Message-ID: <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:46:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NSBTYWx0ZWRfX6p0E9mPRVfSC
 s5Z4hahrIzXPL9e7O9TIWLyISyCe0GAkAV9bndMDPoOCDqDTVwwTwe5bOs3PI6kx3LoKPquY7fl
 JnDqXXZUP0b2yJQsvH8H5g3rPgSTOlosssa/drHdOPIi+yc26L50ujsV7u8xkNv2mPz/HdfCjd0
 SQSOFdRqlKwRJiad5XowqK/pPf+ncovxw5Q5nGloczOK2zxwCWMgvZyvwfGpL8s7fKO2YO3WgTI
 6h/dtGI8noPDTRW3qC+7bN2NZ+XJa1zaB7ImVPV6XCa5QN7thZ6VspMMoCbLbb6UT0r44ih6QB+
 hCu+GoHDIkG9Qf+GBcI90RPtWMkDJWGtm7yzlYUF5cvSGtNVVLlN7zgnRsBkD5iEZkAPafK1sO8
 pibFYai6UWprNY8gQFrIX3lTR84fMxfCr4zeYbGqsHKoBWZXoT/OI/SEtp+kfV8TcfaN0LmyHC2
 bqEPm5g/POSgCebGhyA==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a27e81f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qlr8FlQxwEk1uUl_DVUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _V0jye_D9vtW9bDpgRhH650BInSuKySG
X-Proofpoint-ORIG-GUID: _V0jye_D9vtW9bDpgRhH650BInSuKySG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83A9165ED29


On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>> supply.
>>
>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>> refgen regulator supply.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>   1 file changed, 220 insertions(+)
>>
>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>   	"vdda-phy", "vdda-pll",
>>   };
>>   
>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>> +	"refgen",
>> +};
> Now vdda-phy / vdda-pll supplies?

Cross checked with HW team again. Along with refgen, there is a on-chip 
LDO which supplies fixed voltage to the PHYs. It is enabled upon system 
power on and no SW intervention is required.

regulator-fixed doesn't take the resource 'reg'. May be should I create 
another regulator driver which accepts 'reg', something similar to the 
qcom-refgen-regulator? Please advise.

>
>> +
>>   static const char * const sm8550_qmp_phy_vreg_l[] = {
>>   	"vdda-phy", "vdda-pll", "vdda-qref",
>>   };

