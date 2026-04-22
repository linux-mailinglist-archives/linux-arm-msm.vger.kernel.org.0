Return-Path: <linux-arm-msm+bounces-104123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJLNDJ/J6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:14:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1944691F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFC6D30BAFAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC273E9F60;
	Wed, 22 Apr 2026 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndwaexcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICSlxsyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173133D16E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863095; cv=none; b=YPXXbqumnLGFLB+70YM7EPD+90tfHEftMU5x+64UsibS50iOhv+coEvVVqfT1PXU2Jq7aEMkR+4aZugZPAk0uY2qOrjbeUvgH3KOVVibFRWYtJanfGAzlnsFqbtzVkVo4kG6d6s03+aHqOOVgP8V6NxRSoFhLOT58pyA42xf4mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863095; c=relaxed/simple;
	bh=Uje/lb0LP0zR6TSRyLR0D2Pu8TUWJgrjXuMKENG683s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toFtq3DurQfhU80LPhny/S35HM29b+NuUX8FyhOtQiUqW4iz0xLRz27so2Sc8VxQUtgg/esypZVcS0tKPa38nTTrdcVu2/mEE6Bl4Vj9PyqZJCHfNb70KVO6hhmjwIMohc0+7yOZ6EcsTIuOBVLnKUT5WN/Wv4Rp3Vx6T+7Sw4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndwaexcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICSlxsyf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96H0p664335
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0wNo9oUApJdUS22sohODrRZpFaVdXd2aEq3iFjX8xo=; b=ndwaexcSYb2IjqOi
	6QgFa84ab5YNYy6Q91lMnn2vC82ZkUBLGEV6kBA16fwca4JtmD805v9DruPhuoCN
	gpJkcwVaNwA6GIj6eLwCDNBI8pzwSsGRfoQMN27jGPETxNp/QzowMRnadXQyB+KM
	gD2em8nGnGm3RSzvVrT6V2nWlrn9IiFYIZPRzAObgQ3OotMJvNLO98PPJKtJyq4G
	gMirSg3hHtAo+CJBNK8xRKUdgKNQ9+OW//O7Fd/Oh596aaBlZ7lwlkxqfD2PI3Mx
	nkPNILov75KBAz+XfMHaMLWpG03nV6jShchOgp+QCzmw3c+L4EohoNsxPfCOZtyv
	RWc8lw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgrtp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:53 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-479df2e8aeaso705298b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863093; x=1777467893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0wNo9oUApJdUS22sohODrRZpFaVdXd2aEq3iFjX8xo=;
        b=ICSlxsyfUgs+GT6ycJLHb1jO/MiRSgti5ixFpkA0DIig1li9i5z8woHeNgh0oP3ekO
         Z5SReHj/qvs1+YG/mP7KLLOtBkdTXLtTfRUb9iTnbnJREt8R8DNGcugRJlt7tgKjyYaf
         oMoSqLia7aSoYJOo6M1/Y1J21uXyPJpgAmeayeBedp8lLFdhsKAOYHXl1tZUYyxgEgeC
         Z1C2A+0cVj+8Wk8nTdbcEWINV+1E6uCe3NpMbMxw+Oumc+WgvLWORsnoUMoOSNhJ4vjm
         jU4TahOUpgV1wseXFl7PrS4JYgjXcw5ecgNSQucL5yhXrtsooe+ugw8FSBFxGbvqz66Y
         q0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863093; x=1777467893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0wNo9oUApJdUS22sohODrRZpFaVdXd2aEq3iFjX8xo=;
        b=l9AUXEEo2BnRJisIQPkRdFNH1U3wp4JmajmjaYkfvA5+QtENGZEK2PV7gosqmEnWm8
         4rDBy5qg/MaO4bfjvHy7AWQkYsjDhHJ9AK9Y4i2inaAf/1okya8gGhNbOS3ztT2LS+QR
         so72/TFimQO1PX3o73TPlFnkR3+J7n2LVV98qZcChcbE6WI6FUOMxKBsawKhlZkWHO4w
         OUJDbr7LAgfP5mDi0WLcVgJzYhDPcJ1p3OXxhoF893l5pFZ2Wblksj/qgfY2d2/MtxVV
         rNWC4gjAwiZ9DapfbLa+EC39gXnsvSZ6D7VhX/zxHrZs3In3z8Y2VOCq/FslL7/N3ZKI
         ncMA==
X-Gm-Message-State: AOJu0Yyh/Vcy8UHWRjUyo9XV3SsRcXeEUGbQlPjA19pybWbfDIIqlBf+
	nT0AzwIRjnoChJP0YuZXnHHvixUOfnhgkjQqPJt/YvYvETsVClcAeq1SkZiP9DKr7F2YhKeWnhi
	fisDtqLFpsHpmx/d0PHCHhqCgK5fU6RNgh46+7j2Zq7XxGtnke0FjYA+UIXLp4iwhM9Zy
X-Gm-Gg: AeBDiesWWpox9Dscqa8lITZNmID7zzrEP0sQ5uR+ftS3azDedeeFH4RIRonWLck7d5U
	PFmf3EsyXGX6yG4BjaFHmB+baXQCysQ4CzP3QglYa3d5/XZUCBdNCkcxD6c0C3Z8+npAlP+b35s
	e34HjGvUolXFqdRd8AViTvcAXhMrWK9Q5SKSJK9bxMMDCbfQa1SrIeGO7ukYVPmYgkSeYtVsaWh
	7D3Im0hnEpcfEgF0fAf4CPkMnMjSjx9fUs8FYsFBYNGvSB88FSZhamldUz2EGj3vPPBPHcWkWhe
	tbJLh92ITqw1CF4Clm4ihq1xjxRR0SHLracXDfnfQQUDg5NdSsvTBA2EVLUeApsiDB4h62Y17/G
	WUa+8NSImWKPQiX6uKOSghCItJt55OKC5sd5SQU4RldXmQDDNlGL6XuovUdVObqnbbUyzv93iDq
	GDcnj45q5uyp2/tQ==
X-Received: by 2002:a05:6808:2209:b0:46c:e542:cc16 with SMTP id 5614622812f47-4799c615876mr6919269b6e.0.1776863092600;
        Wed, 22 Apr 2026 06:04:52 -0700 (PDT)
X-Received: by 2002:a05:6808:2209:b0:46c:e542:cc16 with SMTP id 5614622812f47-4799c615876mr6919240b6e.0.1776863092101;
        Wed, 22 Apr 2026 06:04:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bbb1sm534393066b.38.2026.04.22.06.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:04:51 -0700 (PDT)
Message-ID: <fd01ea28-e23a-4a9d-bfd0-fb5ad0b3d72a@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
 <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
 <8eef8d68-b059-469e-9004-39bfe44667cc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8eef8d68-b059-469e-9004-39bfe44667cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0ewVxPkDzct43jSC49KVAFGCI18kUYTw
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8c775 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jWp9Vnr_aMZy7lUlAP8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 0ewVxPkDzct43jSC49KVAFGCI18kUYTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNSBTYWx0ZWRfX5JzgfGjpx3YK
 EPswbN9VUeGp+T5+WRdfGkH7bYdCj4FrdRYMxSURxg7SmNTjUpX+p+IXS0Ef/GstiDqEmaws5YO
 kVd+5uqlxhwB4VnG6LYgi8c6lW+ebGcYgsX1a3/Nz/nzlmQoty3GGb84CVOJCouvCdXWD98hLR2
 fUjKjgLzXOBm0JTY/yH3I2LXefN0xNUERiJWPMRUYkr/JCCf1wsx8eT5rvIJ+OcvSwuUuo7V8MH
 byB5/vl/fl3vwus/o+41zY6OBJPZX7nzs8V0lZATffWJ6VhAyPcb9nfxI0IbH2SA3Il9Zi4O/jn
 FhipL6Betz4oS8PFnu6sJdT7OLxjqvvUfzhw/H68TPy2oy2F1hb+qw8n9II2td5a0YkRrA6xBaw
 KYJZrFW/svKWphEejjVAw3Y0om9mBTcK5JuuYRsr5/qSAYd2zjZwA0ANVajI5ua8VnePI4lvNJr
 JK4E8sEmxYFMoHAUh1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104123-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94C1944691F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 2:31 PM, Mahadevan P wrote:
> 
> 
> On 4/22/2026 4:19 PM, Konrad Dybcio wrote:
>> On 4/20/26 12:00 PM, Mahadevan P wrote:
>>> Add the mode-switch property to the QMP combo PHY so that mode-switch
>>> events are routed to it, allowing the PHY to enter DisplayPort Alternate
>>> Mode. Expand the DP data-lanes assignment from two to four lanes to make
>>> use of the full link bandwidth available in this configuration.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> index e393ccf1884a..0c180e49816f 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> @@ -789,7 +789,7 @@ &mdss_dp {
>>>   };
>>>     &mdss_dp_out {
>>> -    data-lanes = <0 1>;
>>> +    data-lanes = <0 1 2 3>;
>>>       remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>>
>> There was an issue with this on a similar kodiak-iot board:
>>
>> https://lore.kernel.org/linux-arm-msm/zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh/
>>
>> Have you confirmed (through debugfs) that 4 lanes are in use when
>> running this on r3g2?
>>
> 
> yes

Thanks for confirming!

Konrad

