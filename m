Return-Path: <linux-arm-msm+bounces-104119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKuUG0rB6Gm9PwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C17664460C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 002C9301BA47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C043D34B2;
	Wed, 22 Apr 2026 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzoc9u1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMJkvZYH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A83D2FFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861075; cv=none; b=Hz/GPCndhoITJQfbPlnCvx0b/jZMlteX9UgCMwY7gPounPPpQotEoh2IYYTwPYHjgmwkXpLdHAiyTzZDy8ARa9PSWJVs36abVS5w0CV6Z/VFq2Rv00DE323gqp9WrtpVRKYJYODKg7UDub5dMBVr/vXGk6KfDyliDkh+iOr8PAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861075; c=relaxed/simple;
	bh=IDlEeuHzxHj9ZO1GlwcxnPRo/I4fE2o8P9OAQl5PRy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GinN4NK6E2OHKvHspfyEhTn8y5p4FrGirI4UWlZZdcDhNQQ8ihs50DgQCA8c8bMPkScWw5hqZAIUTcVQTvF6PDJUO6TQt9Ti1ACEBt7fAjaxGXQhF0o4w/06sSrklZRKceWsKAppXCuxkZxcJr4VgAZbCiZWA5fZ8Vs5cvXov5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzoc9u1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMJkvZYH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MB7NAG163850
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftRI+Wwm+la8ONR/zppm5Qx0bLf2lP/aQLOmdyuyKuM=; b=lzoc9u1ZN8uoKgNp
	ZC85vr68nWU2FNkKFZf5XYf+X5xbD5FnOvVAeKmNi9zEVzZ6pRfc5wMdjnAvNiC+
	I3CsvcxalWKwaYbao0k/CLto5GCkgc96ET1o8t3wdYX0Gcx5KiD701Gg1DFvsvy+
	+kmApaziU0aNCPRDP5QhAzbxU/05jzKs/xqwAAC25PWDD+OmcQqwyt0omQr1ACzC
	dM66TiVrmwuN0LRCZvIHtKmlNPXHLIT/Ml8gy7S7ve68zLRnHO8irxJoR2dKTFoy
	V79JvO3Kjudm1ZoOso1OZMf/qCSDIjkMM+gSa3ry/OJdyC/u+9RTEViMoINxXbvX
	VB71ag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhkcsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:31:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078ff0so3666491b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776861072; x=1777465872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftRI+Wwm+la8ONR/zppm5Qx0bLf2lP/aQLOmdyuyKuM=;
        b=KMJkvZYHtqFZfBRlFB95kgL8mqJj/zMSum5PG3KkxrEwm+QhcEY3XWZH6rz2gZ0SEB
         EBqvX8MbRqQKuwvaHScyPAabUt8Qmz8c7nv57KJWkhWUkDvi/tAArYzzHRloB/XjawsX
         l9iXXJwcNZEOtNkw9zeQE8J5MVJh6ShsOfC2jKkxH/VKns6zFninsEXCwfOnGugo+OLY
         ycNGLmDxuQ3qNdw6YKewbjzziYDCpzL6h9vV7dt7X/PIGrKJvTI8QkXmVavDn+JLbfvj
         pfusoti1/gCy868xo9R8/pqCFr/lOj5uabYVMlnWAD2B1YSzyiLL2eDMunE0lDVTW07p
         TLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861072; x=1777465872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftRI+Wwm+la8ONR/zppm5Qx0bLf2lP/aQLOmdyuyKuM=;
        b=DVZm675qefYLuo15XUdYA+b4JfkCcPlqgXT7TiPOEz0UbIkK1nfcJdv/GN75AZJsRG
         q4x8x109OgL7SXYMMA1V5dIm24h78N899b7GN4WrasgeRzu6hGoUH1Xqd6J6nM2HiwQU
         sOxFVKip1cWtL2DYUQBZRUqudWN47jYq4fugfjbE/PZTXuegXM44W1MyaCt/vfXFSGLF
         PM7pKxEQ9JQwgC1h/rjlxtyzt22z47bcmyaR7VXX/ECTx5jMqjo8GecTqvOSd16+icIs
         sUQKMh1ZTUzJMswZmfob0Uw25MDmNq6HVCd8AmhJ0PPHvB9tZot5F3sW+GlbQv1Io2Za
         Yh6Q==
X-Gm-Message-State: AOJu0YwXEyHdzjOlU4j+hOfu8MxYARoMa88lYizvi6mbUVklr9qzE09j
	URQ9qeabzF1+IchdX1NfNDPPdSN4GFd3Uoh44SyPbOmSfmD+hknX7ue80aieYxSTEB9NiHlOGJU
	KB2j1+8qaLaSbpFBP9vyIUNjV2oDLK1C6f7XdYX8bPLs3kO5h1BNRV3IMQ8K0coeStY3C
X-Gm-Gg: AeBDietpQKKa21YE1KQyI25KeOSzGadrGGIU3siNo+Or2kF9vdEDnezfdZQb9tDpuLh
	Tig74Jz0E+7OKCRavc9WF5IeHpiJ4IL97MG0zegDFuZZY5SUBpGKVCaSODSBKL8d0f7bRPx36bY
	LgMhaNXZ5nkHVPgCSGFWj4RykMIGRUrt3QIsj5WupO8hTAhvXR83/u67QXt6PGaC2D+oKrymBOr
	62c8HTdUPHMTXi+MSBMoAdwRi7ftgiikUUCWRJ9KoiyvDUb6hQECA+wMKgqZIHrmJwgSVtOHK4A
	/DrOThqY7CDB8qBhsZnwLPfPoiuK5Ecv9AoP5PYyzHl9zlAkhm2WVc6Beew3oshQTjgojVA11Hl
	GnXN//cPf0cpwJY0kwHQzDW+BQi22jwX1y8un78c23Dv2l4LyVUZYIAjDIfD6yw==
X-Received: by 2002:a05:6a00:e08:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-82f8c8fb888mr23014169b3a.25.1776861071759;
        Wed, 22 Apr 2026 05:31:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:e08:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-82f8c8fb888mr23014131b3a.25.1776861071210;
        Wed, 22 Apr 2026 05:31:11 -0700 (PDT)
Received: from [10.206.104.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm18564102b3a.17.2026.04.22.05.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:31:10 -0700 (PDT)
Message-ID: <8eef8d68-b059-469e-9004-39bfe44667cc@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:01:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
 <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wmdDm3YHN8WAjN4dUVbUdyRbkXajEWiz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfX3qRQrYucvhrT
 6ZI34QOXJtKGbW1N68qFkmDfISn7Hk6SoGIqYxELNMOTyzB7JRbdgVfsGqVzvIk2IJ5ymxyO40N
 gkIaf+jG/I6a5hn0R3dZj9Ulws0vMdYd9X29qoru6yA7i7TXL4JJLl8guEQER2rggQ4iGNajr8k
 hWI5ZRns/zx5U2DzrUlt8THBUs0aoZXyRdYtFff5c/Z+mM4SUmZmZt+14AQkvT50fGz/2T8sW19
 7jbjx46JbUHJ89YHVqFKkEDPEAh4XMcZUmlAfaIHVAlM9rxzTyYBwsN2KyU7m9jcJPLDAH3rdmr
 nXJMHf0zEFuthFasm9GtHSThh1IQiDvHO2HbXBB9c474/+1xjtrtgHQDly0beYLEZNm95YK2CaP
 AsArotvQ/sqOT8TNe/02PEQuNhvsT8YSHWxratv5PFbowQa9YxpflzkNej8G/DwSvHafK3i+Gxq
 PnXeC83sXDg8/04rhDQ==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8bf90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fCkYvREgeGE0EZizEysA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: wmdDm3YHN8WAjN4dUVbUdyRbkXajEWiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rb3gen2-core-kit:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104119-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C17664460C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/2026 4:19 PM, Konrad Dybcio wrote:
> On 4/20/26 12:00 PM, Mahadevan P wrote:
>> Add the mode-switch property to the QMP combo PHY so that mode-switch
>> events are routed to it, allowing the PHY to enter DisplayPort Alternate
>> Mode. Expand the DP data-lanes assignment from two to four lanes to make
>> use of the full link bandwidth available in this configuration.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index e393ccf1884a..0c180e49816f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -789,7 +789,7 @@ &mdss_dp {
>>   };
>>   
>>   &mdss_dp_out {
>> -	data-lanes = <0 1>;
>> +	data-lanes = <0 1 2 3>;
>>   	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> 
> There was an issue with this on a similar kodiak-iot board:
> 
> https://lore.kernel.org/linux-arm-msm/zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh/
> 
> Have you confirmed (through debugfs) that 4 lanes are in use when
> running this on r3g2?
> 

yes
root@rb3gen2-core-kit:/sys/kernel/debug/dri/0/DP-1# cat  dp_debug

         name = msm_dp

         drm_dp_link

                 rate = 540000

                 num_lanes = 4

                 capabilities = 1

         dp_panel_info:

                 active = 3840x2160

                 back_porch = 80x54

                 front_porch = 48x3

                 sync_width = 32x5

                 active_low = 0x0

                 h_skew = 0

                 refresh rate = 60

                 pixel clock khz = 533250

                 bpp = 30

         dp_link:

                 test_requested = 128

                 num_lanes = 4

                 bw_code = 20

                 lclk = 540000000

                 v_level = 2

                 p_level = 0


> 
>>   };
>>   
>> @@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
>>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>>   	vdda-pll-supply = <&vreg_l1b_0p912>;
>>   
>> +	mode-switch;
> 
> This should be moved to kodiak.dtsi
sure
> 
> Konrad

