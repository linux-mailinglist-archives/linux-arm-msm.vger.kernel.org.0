Return-Path: <linux-arm-msm+bounces-109793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD/ZB8uDFWoSWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:28:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD85D4DD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E44F030DF165
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD8F3E0249;
	Tue, 26 May 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo7nAypP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fhe6Nfv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413293DEAF9
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794532; cv=none; b=kKRq8dyBoKZVzYM0GaRdksykucdxH1JsWTF1vsHdDJLpq0to84dohpPXOPwLEQ6qMZRyxMWXUIOC+Kld/hJ+7MUc9wPYVC/BZLH74fjY2QclRp/vzUnMAFktTfJdOYGGGz/NBIcgPLUP1GCkDYYPLwItbnaSpeXem+/pbc/eXpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794532; c=relaxed/simple;
	bh=HPoC6rJteLMphgQNQ0wiQJqIp3sHCF1ZNTePGRjNoQg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kWFg2NYPJQOt8B6vD+slO8xrOs8N87VwJJ0Vi0atDUGSKR1uVarSVAft2AJIb/TPL+aTJHWdrJBIeiRAUQpR8BW2hgSmpLMJu3E8vXYUJYqghgEJPB7NssghsqAoYLQAOdEFIA+Vj4WOhRP9tbr8QOx4uYFmtTyJrgouIwu1aEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo7nAypP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fhe6Nfv2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8VNr24117526
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4C2vpU+djMgOS/HeGKfY8kZwd/xIc9o8k0Mae6RkgkY=; b=Mo7nAypPes/lIvzv
	xVR7JEO73naddGGHYfHcC7+NItksSdRYHLiTWENtSdhaPPrRmgpfJpg0Gio8H9zt
	cERv4XL7qM1im4bZEHhVx+nZje9XpWmPS6MCVnYZn7XCdOG2BKPu2ancoPKZxyaZ
	A06CMPWJLOCw5WjpJaTMPbgHamf35EpLlKbUYBZUEsSDGqNBpgl/ymClPxaQv3jt
	c+Vf/OoGaF/3mKtXcPyvS4gsRxUwlhKkyNyoumwfCdo/QOrrnhxMxCedcxsUlWeP
	etB92piqhdoM5AE+1SEu03IHOMqPpxNQG5ypXR7ZehpDZpb+gFZIeZHXMb4HD1cG
	VRYCog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbmar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b68a33adso15003624a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794529; x=1780399329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4C2vpU+djMgOS/HeGKfY8kZwd/xIc9o8k0Mae6RkgkY=;
        b=Fhe6Nfv2DIrwozQ8c1bL0GA3d18jEhH8gtgQIB1Ez/ByIT6fQcSVZJem/1YnrPqHqm
         32LdzbjAxXx68yeAVlW/mJMDLWbSdSkW8pJdhM3YQz9HVGMss9Hj51fwl/94kfenCU4m
         J/YJl00iNm4vqxEtDvcaA9peKSFubK3tnsreWyMs/v1sq36j5boQ0Eos+u3HfMFyxeor
         kgGo7tw4urH5R30UTRr+8N7IzjnJ7EQenb8+yuRt75S8DHQeVJyB1cswuNurWpl6lA37
         JcgyLGwkmZIAQHAWNeuuz7C0f0mQvRn01QNc6dHJPdIbvyGtQ2K5A/W1klBniZmP40Y6
         klkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794529; x=1780399329;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4C2vpU+djMgOS/HeGKfY8kZwd/xIc9o8k0Mae6RkgkY=;
        b=YdaaAnWW9D4JUuvE6G3yUJmtOUM8lvICWsHhWo+EaQzj1xFF4oWJmLScKOI8M7phJ3
         IxNbay8jjGEfipb4IL0KP47V6YBQCkucSbwi+2QjqrcN0b4FvTUKnM1OFUrMz2WVaArE
         kR4gzJLnRF8zlsz73O+rJ4Z/NNJSivF0w2bwhSF6nihCJcHATir1uMRTexPSSK6BrvCn
         9AuL9Z0Ou+Ld5KpHWfNXHtqSjHSGpwK6tiP7TQadX5sO4P2wy5EHHRv4qTESlFCrYSCj
         ParsFZhLl8f1C470XCYhvo5Fd/3KM5IVswcz9ph55uThq9P6Luus0am8k/xq8pS93hpL
         Oheg==
X-Forwarded-Encrypted: i=1; AFNElJ9sPt57rJe5bMdOD7u+kQmmM1bHJmiRQWqpoC84jJkijuUaK5axxHPUj9EYKXmiVwTGeU5N2cUmprnlJllc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/1/XVRXXVq0YNRQe5VnDtWhHV/34U4ycrCdpWxI9uURXVk3n
	6pSKP9fGv/VavQnwXOVfuh/0y6AzozhVnL5CY93PuawdkRKfSEgsKjiCfdhtJ1GQwviGtxYVp01
	/DEgl0p0F12UQoTxKji6nVXvIuHb0dLPWKFH1KRzSRPmKFHVfM9UIKPOT/V4nfHForM4i
X-Gm-Gg: Acq92OGxhuPMTHGoqYkQFmpzF6m9kaO3K9piKXdAq1NExySJlcXjYeYFOYpGPg5uV0G
	MToPE5ly4Xx9GO8hH4yEr/AaUSFaPsmJMs13vyU0oUidzwLurXT0vDVmxj1A+7n6/K6R8Bd50Lp
	SFXdp+9r6GNKcu98VquuspE9ZPRhDe3O+loX98JHPHBb4JUSpxUibdfHdOiiVok7WLz4Uz8ppNn
	CMC3THSEI8vZEHFlyO8FdPazLia6aKxhmc+jIo71fxkzZ1KTWWf88PyLBAPX73KJIgMlLsUezSp
	mCvhzOS+B9pUjLFuYT2eYui54umSbglQsSTNfmEjuqo+Yb3rLlGMkYcas8Mv6Oi9WCZgQsFmRdM
	/5Ktw6PPOby2fJjXfIZPaWizQsHA66Y34jKOd8TU3OaF2V3PoKSswnw==
X-Received: by 2002:a17:90b:3c92:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36a67626883mr17354836a91.18.1779794529228;
        Tue, 26 May 2026 04:22:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3c92:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36a67626883mr17354800a91.18.1779794528749;
        Tue, 26 May 2026 04:22:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cd92sm12727620a91.10.2026.05.26.04.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:07 -0700 (PDT)
Message-ID: <b863942f-9c3d-ed28-aaae-542f230f8d2a@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:52:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
 <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
Content-Language: en-US
In-Reply-To: <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vlJKk3obrN9Q1ZspflrTSobUC8LCN4bZ
X-Proofpoint-GUID: vlJKk3obrN9Q1ZspflrTSobUC8LCN4bZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX8kA/v69Ojxyu
 4v1FCnMIor8Z5Ia1DdKV1A7iAdMvfvfKbKJU/leMK7hA6OYSfiqHM5h/uKJGaDn11kDrxkXvM+V
 4EsZWes2SyIYjNy9U++8SMo7Vtw5H4fHjTmL/QeqG06b2vf8oVSOZ6sAKk9GAhAQAvzgYYGt+F+
 /k71t1R/5I5nxaDpkaKXMqNmsfo6n9J/Xc+za/mocH5uReWPup42KT7qvCDd8uvuNH9RJUgtlIF
 6b8J6J7mv/Divtwhyasp1yF1gWrgpoJeF+NJwp6cQ1n/sWgtMi9+bqCrwWjG/VqSG0k0nL8HV8X
 vfN3zZY/9xjKfqK+ljFtYhDpFAk9qCF0mELo633iSB/OlUrmx54obtm0GoXjKwfM4FhozFhb4Pj
 3rtjPiKI9IYeTAQnshCR3EOD4vSS3Vhchx1SsqiuMDevottNdVkALxu8Aa6JMuxYm8vqsyR4Wjv
 yRvNRSjCRaKqXsZIPJQ==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a158262 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SF19eQfGBgBI_wA4TrIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109793-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73DD85D4DD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/17/2026 11:42 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:29PM +0530, Vishnu Reddy wrote:
>> The iris hardware block is described in the glymur SoC DTSI, and enabling
>> it here allows the media iris driver to probe and use the video codec
>> functionality.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index 35aaf09e4e2b..8d6ea857634b 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>>  	};
>>  };
>>  
>> +&iris {
>> +	status = "okay";
> Could you please make life of distributions easier and include
> firmware-name here?

Ack.

>> +};
>> +
>>  &mdss {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.34.1
>>

