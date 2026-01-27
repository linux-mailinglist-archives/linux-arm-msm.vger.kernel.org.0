Return-Path: <linux-arm-msm+bounces-90696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGW2LIKSeGmxrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:25:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75092C0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 481E33002920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AD8301468;
	Tue, 27 Jan 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys3cOYxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+o4f2xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF080287247
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509502; cv=none; b=N/xvXNU0ORHGeAwJSaWZ9YINhIYaR12EreUoO67P4qApoTnzXeKHOoHjNOb1svKwNHhjbcp4mhpjVhjLcFFGMFpGiaJquQo2udLUTm6sm5HIejyGuB2pqNLD+8i5aJgzoQCN8+V/a/rUC6snHmDqV+arzUOex9yK+9MEYfOE8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509502; c=relaxed/simple;
	bh=IOS6xV+OeHw8fMslk0XbrQp8mwln8QrzL5RKSwd8HA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEZgr2d+9zifAqmaqZVkWXmvWSTgNiNseOrg1/y5WCBzXpRQP5wnYbKwp6TYog93+5RHX0s3cpDOOAqLQT6RL1KWEBZ+5sVZINXqTnwhjpVyMMosyTgLuOivknTThHQcal/3qiENp0qL+efuKqkh5KHSScCVQdauXbPGmNAJsgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys3cOYxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+o4f2xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAN5p8184778
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5C6QV1uLRhHII2/wqeqSku8ihAuKcZEtsdj6kphoKg=; b=Ys3cOYxrtMQQnw0q
	i5cEPFgL3yCVYM2WfHXINAWcTsUU8RRh4/+ycsakitQes/6d96shszYGX/vTclVi
	824+u7RJqiHT/3zkWOUFukoUMuygf+WPjLHvu0jp5VqbNvxnwhQ5Om0bFJyS0DLM
	PUkxVcAPyDiNgtkNLNcdryvkpGP/X0leuuKCH5SGaQS3WL3/nbUxTTFg5rc4QHLq
	LbKn3R+5aPHDtmLzLHxGQG+GClZbXklLM05BF2HTpzNfaCmVnaHuadCVT4sefJjV
	Y2RNZysXohYG0PxylXyOq/uC5MfX0WZoxKuvlLeZPBI5sUvwRd+YG92zQVgWRjNU
	Lk6Mlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jnut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:24:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so151107785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509499; x=1770114299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5C6QV1uLRhHII2/wqeqSku8ihAuKcZEtsdj6kphoKg=;
        b=J+o4f2xcKtvHHpVB3ZbJrC10XFAU8h12a82YfpPiVivKcqRE6dUJJDxM2ersXLo9Vi
         XVRFi8tU/eU+DmS+ooBSuhBz3/xeC4go37Z+OYCmEV9OftwmWrdjruDN7YhIIMS+9prJ
         6FwlMgdvcqzbQmD9Y9xO/SYEQw7Pkv1bln5jcR+vQZFxmPXrMnMeCDlx+Q1FDt2y5ghx
         ORQf2zqtwRwFydx183/sQHF8q+K/s8TUa0J9Fzf+DRJIyjDT/WHpjQePymYJ20qGGDXN
         aGrsOagnQDpgI6w36e8vzyIKJo393bwrnXvqPjIyJq6DFUcwtAibKZ4BLtsOPBZAjbjv
         v3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509499; x=1770114299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5C6QV1uLRhHII2/wqeqSku8ihAuKcZEtsdj6kphoKg=;
        b=QpD1vE0XOVhyhPpyV8P/YGZ1DRRrTyGZqbCgRB004C2Gb53UG5xTaTIa/qA/QwK4B0
         vyCPOjvmPa9F9wFTVd7qjxXDjswQxX3of0CfdSs+be8hWwPHiiJPZayxXTkzrqWIcpV6
         E+OXTUAj4DNxtXJO++Hnc8fcJjdI3tgFMUn+t74HjIivvp/j5qxLL1H8zGPpUoYl4WVf
         rZyR7Kl+ntxeuOb1V5Nn2OJGkQ9LghfXCaPEICcP9PstjqMnrXV0LDss4UeFdQGMBsLz
         Q4PFa2gPYOpCTLGzhRleKb1LjlEkI4C8e6Rd27Ojs2cOthJLVBeY1day0YEGQjeVYj82
         lOIw==
X-Forwarded-Encrypted: i=1; AJvYcCUw6RscYYkWsI/kcwON80CbBQUHoJ52at7RJxCwjlGo55qf7Xhn0xJb7qz0MfFpMcSJMKJISexqF6XreYI0@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjxKauCNpYJ947m6zh7DZFHCqEjpS5M3YXAINBgvTSJgwepft
	iQwzVlWsVxo1mbXImHE/Sa0dsMCLIoQuMucsPr7xC8SsaP8BxlyiNOko+vVeidS6fzCyrWiOlY2
	yoNVD0WrmXpAtvAkdUbPyFjsw2cuYX0rPuCthg2muJyGEHrKKkFpX15d7rRXNpb+BDAFw
X-Gm-Gg: AZuq6aIVreKmLr3ND9F1RSXFQLYzxxPGj8yDHhZHeadeEwugZ/ytLWkpEhidGbg3JlU
	7R519oHJNrA0d/ZGxCRbQzSLvzMN5ciYxUx1j+N7aJ7cTqvKhJJ9OpvO/MaRNezBvgvXPc/46ef
	r4w12hzBe1PMNSMmdkifw+wwLmhWgge5pBqkne4FeourPq7gx41GgnXdjNPaDR8RsT4GmYhjm1e
	g8Lo5ubi5mF3rmPwFFSuoz2pWu6JjaAKlAFiOAdIUr+WQjJlLWJd0ttuNKyvZplgKY3VVl0jp4S
	eFmuEObtZR7tqT3UjJ0dsxzvqOK3IZ0tSdY50GUzobhn8pVeoVZ+mULMxT8Eb67MIusghCXz7d2
	8q6CfE8czWjLZOIDBpz0OBr16rYfq93drWUouusur0v2192O49Pcwx1Ks7f9137U+948=
X-Received: by 2002:a05:620a:d85:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c70b9000c0mr99628585a.6.1769509498951;
        Tue, 27 Jan 2026 02:24:58 -0800 (PST)
X-Received: by 2002:a05:620a:d85:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c70b9000c0mr99627885a.6.1769509498563;
        Tue, 27 Jan 2026 02:24:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3d9ae1sm774697566b.13.2026.01.27.02.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:24:58 -0800 (PST)
Message-ID: <1507ca50-52c6-4b60-a0ee-06e873bb509e@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:24:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: qcom: pd-mapper: Add QCS615 power domain
 mappings
To: Le Qi <le.qi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260122111318.500262-1-le.qi@oss.qualcomm.com>
 <913bb253-f040-46d8-ad27-51d7485a8ddd@oss.qualcomm.com>
 <czyzzq33huzyemqjkicfimmcdrkh3a3dvmxd6wub7q2huoi2uy@ifasxehwrb2o>
 <aa4f73a0-9342-4b02-aff6-df88abf836db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa4f73a0-9342-4b02-aff6-df88abf836db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978927b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=P-nssPGzQfnoLLjzvpoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vqVsajH-YMxRprcIyghptRzckPiJLGJz
X-Proofpoint-ORIG-GUID: vqVsajH-YMxRprcIyghptRzckPiJLGJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NSBTYWx0ZWRfX5V23HXXqV9Ep
 W54Laj5zFUQ5f65gWIEDXSdMafHMu9NHP6jPUWhqRATnBI3yeZnY9StGNpFwICer+8KKhPnurrt
 aUgiQQMuzE6rt5IDEfVvkAH95eom4uYULKoZKMFgB90aiOwY7/PtDAHIqAHkXLX6m1lm4DQ+AcL
 Fpn4zSo6Ax0ylyYwIXdZ6faShpZ+2T7g18qz5/14tS1+VtzrpH2TPI4PtXAjxTYJq4WDowYSprZ
 wxngFuzcdr99lCE9bKDbVXatI75s0lifwXX/9AcLkmC2Yvo27wfdqE/eBsUHOxhy1ab/VSbwXzO
 tOGTrW4K4wSnplTmV4AYGkDVs1bztmtp0UcdKEN6BsERzR1u866fY39bm3XdOONKkYEbMZtzkCd
 VRU0nZlQf1mpe0oyNeMpnMOIrS0ivwQLWmzXYj4jBytRi/oglGEGuxIdbee8dboJ1LQL3SS+zee
 4k9BRBCFpLYKNR5HJoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90696-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE75092C0C
X-Rspamd-Action: no action

On 1/27/26 9:03 AM, Le Qi wrote:
> On 1/24/2026 4:03 AM, Dmitry Baryshkov wrote:
>> On Thu, Jan 22, 2026 at 01:07:45PM +0100, Konrad Dybcio wrote:
>>> On 1/22/26 12:13 PM, Le Qi wrote:
>>>> Add the QCS615 domain table to the in-kernel pd-mapper so that audio
>>>> subsystems no longer rely on the userspace pd-mapper daemon.
>>>> This enables proper initialization of ADSP and CDSP domains directly
>>>> from the kernel.
>>>>
>>>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
>>>>   1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>>>> index 1bcbe69688d2..884a2db9bb08 100644
>>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>>> @@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>>>       NULL,
>>>>   };
>>>>   +static const struct qcom_pdm_domain_data *qcs615_domains[] = {
>>>> +    &adsp_audio_pd,
>>>> +    &adsp_root_pd,
>>>> +    &adsp_sensor_pd,
>>>> +    &cdsp_root_pd,
>>>> +    NULL,
>>>> +};
>>>
>>> No modem_xyz?
>>
>> There definitely should be mpss_root_pd / mpss_wlan_pd, otherwise modem
>> will not load WiFi firmware.
>>
> 
> Hi Konrad and Dmitry, This board does not contain an MPSS. WiFi is handled by an independent WLAN module, which has its own internal PMU and is already supported.

Please describe the full set for Talos-with-modem, the "S" variant
will work too, since any "extra" domains will simply remain inactive

Konrad

