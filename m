Return-Path: <linux-arm-msm+bounces-100070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAr3DnD+xGny5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:37:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35933270A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B33503010B45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DCA3161BE;
	Thu, 26 Mar 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QdvmmrZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8ED33ADA3;
	Thu, 26 Mar 2026 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517827; cv=none; b=Mo1myVWFUagg2mFQrVgFQVQsWUCx+6KixlXqbHWFvxBxAW/CSgAxg1XTXCBBoP11MnGlknBp56mVhSdV0mObDqfxwcN39ObjIdpZekasqKIKSW3mMFXeQU/cNWrow/jhh96HU5EdcYOtJpGzgTbaumTPUZ9q/fv0VhSYej47FvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517827; c=relaxed/simple;
	bh=3B0MO+KaMT5HfDmnnjRTTwozCgoMU98Aw4cpgeqNca8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sbOwnnnbswPAKPHNBVYFeQddfN3DTCHshYKtiJlsQo5BR+fchlDBBVWUAvBo6lR2Uhtww3on1SqeFs6WP9tlvV2Za1QhJiBkT5i0MJMNEr6VEnQR9kS0O7aSpHoSZ1musTUhaLGnbmn9vaOuGxusH7h8e1LT13VekE3IdCal4sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QdvmmrZT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6w3CK1060910;
	Thu, 26 Mar 2026 09:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si1WQGu7D98ZY9SBeUQTBSa4sqGBk6dnIALYoyrzyqg=; b=QdvmmrZTFLcBkGdj
	Z0Cairh9lfQ44JgQSL0m74ZRef8YjjNUWmAfMfim/c8LZTZyNoi+2uZbbwUNjp97
	fEx3HFOd05zgv2Z2jbvfOirREskoaPyox3Dl934po8+/ViIHWNluUBeGkaTkCV8Q
	0dXBHzIUGH2ryDVoYjkW5h1fwy0PDtBz147iqdMGC4sn3FExNftfnQk9sblIqW1G
	RN+6OmaiDoa0QUIo1JGWiY9BERGoAzREK6Cab7N0HpMCkjwTtt+BjTMifyPuoU45
	FKHLP/vKDA3kSP0bMYN3rfLd5aUwqAZTmY5G9cB1Aqb35x+HSVHSvt3fdNoiQ6rY
	Co4mhA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkst2rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 09:36:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 62Q9awhE005195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 09:36:58 GMT
Received: from [10.204.79.33] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 02:36:55 -0700
Message-ID: <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
Date: Thu, 26 Mar 2026 15:06:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <acHwvzjcvqNxUjm3@baldur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX4wn0AcuQ7rg7
 5BROEAxqbXQcSB8YCfB7emHawKdH+b7rV/aeddlRPzPvsTM6Aqftat1PFqarxlg4u8agOTpo0M7
 BljeIiUWXshHUL7RUF4QT2dEVIEGV0ttaO8H1dqRj3YtXKc6nnZ1ljLfe0JR/sNDhhdl4J/LMpE
 lYJzT0sAVaBGqKXAjolkJDUi20kN7LM2cPuGsxoTBT9RzaGUYxiTeaFfM1th98dxH5jMWg7IkCS
 UAjQDYT/Hz8+qUMeBUnzQ6uFdRr1FpUk0fUR38/cJFmEV9MgXB+Skbmij1Zz0+cdedJH9rw5K5B
 DOVbZ6ddPmX+t1tJDg42XRRjUIuuk5tWh2hyaqLYIaJe/LmgFJeSKAWJaM3iQufZmtE9lG6s5vE
 +MBfMkk2TEiHPjonaObKf4E4kZ3KOHY5nx44WixBlvxouo2Dn6XzWEw2WBcEsBJ09AFAHeP+hgz
 uk39MiJlyuNmPZCC4fw==
X-Proofpoint-ORIG-GUID: V78TK3gKM0R4oU_XDdcJIlyprYxnUQac
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4fe3c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=3Rd_ledAG8Ua1yCYJBgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V78TK3gKM0R4oU_XDdcJIlyprYxnUQac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100070-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:dkim,quicinc.com:email,quicinc.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[quicinc.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB35933270A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>
> 
> Please add Fixes: tag.
> 

Hi Bjorn,

Sure, will add in new patchset.

>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Please start using your oss.qualcomm.com address.
> 
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3837f6785320..6ba4e69bf377 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>  
>>  		vreg_l12b_1p8: ldo12 {
>>  			regulator-name = "vreg_l12b_1p8";
>> -			regulator-min-microvolt = <1200000>;
>> +			regulator-min-microvolt = <1650000>;
> 
> Are you sure it's not supposed to be 1.8V, given the name of the rail?
> 
> Regards,
> Bjorn

There was already discussion regarding the minimum voltage for this regulator on sm8550 target
on other upstream patch. 

Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/

This values is according to the NT37801 panel sec
"The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
VDDI=1.65V~1.95V."

Thanks,
Ayushi

>>  			regulator-max-microvolt = <1800000>;
>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>  			regulator-allow-set-load;
>> -- 
>> 2.34.1
>>


