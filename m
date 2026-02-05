Return-Path: <linux-arm-msm+bounces-91903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DT2JCR92hGkX3AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:51:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74949F176D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 228D53019044
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D713A9621;
	Thu,  5 Feb 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0wS2sXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7TEO7J1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211EF3A784A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288668; cv=none; b=ovZwAqZw6q9EIx5GO83NeGiPB1Oikw+vY5/Tb3V3epN66Jp+S9K/1YpVVRvmvwRWKJiaIQzJPsz/Lnn+7HTMFPnrqeERv8tlvvakNKEmt9RfoyQj7+Lm05lUiQmcvmN4/yLirbTq2NmM9gZKGktdptWZU4CeqmVdxjq0DGemtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288668; c=relaxed/simple;
	bh=w82cuJogvmAtlnyTMJ0dtkRsLTv/YyrjrcgtsGaB4/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEvyv9jhGsf2Z+DyEVL3XnCaqzbalN64cpr0JdYivHNxb3wZgTib8xXFBctsvQyWj2hb4D6OKbDy4bvQnp1Y43vLRVjExAh1cAK6dDsmSHeKajxnWd/KaWVqNHmNXgMRC86G01o3dH/5I/Ol8jMx0w6u+Cfbw0kR51SHVjRQ4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0wS2sXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7TEO7J1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157MiPY890373
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 10:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c07KdBpCk0oynCm+8y8fUcH+9LrRngoiGgHIH2HoCVg=; b=V0wS2sXzOR9O09tB
	jVFq2ko8EpLJSzyxa9zWjqPpasxxYLRvQ36mgOMkFeebTmkwPar2Zc43H0lOSj3d
	TMnpKc9qLIVjVf3ZzQ4HV3KLesEUDlPEiPXNv7GK1o0p1LowrZY6ZzbXTYRz3R0e
	Wr0I0tMForApnTWarpuJKhYUCNssNJZdimcpeEOAYlUUnGq5QHBWCCRt4y/F77C/
	IS+6d3EZtwF1UnlWRyACzcG1jq+UUPKsQSZuxcSV4sYS9VB9Yg1zjTw71tP9q61/
	7KoZ2YjMO02TKkCjHxjHEMsY3gaaTbSzRpHGTRyooZ0lgBr7E5GuTbbWPz76j12O
	pGnUSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx8nmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 10:51:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c709a3a56dso34364485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770288666; x=1770893466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c07KdBpCk0oynCm+8y8fUcH+9LrRngoiGgHIH2HoCVg=;
        b=c7TEO7J1BIA6chfYyS5h0JFsABJ42XSs5eVe1/jx3akGaA+1bRUEZqa5XWfq37BXBI
         PspC//zD501wtfddhmWpuCjT1r0qqn7d7FkUmM1ObZ0LUK7KbAlstg94rvnCBllX0Esv
         rGu7JsCym5xI7qIg/c3RH1dXB6IeVzS0gtZ1pntQt9WVI4gmWMgeMa++4oro383SEfqc
         nV/mom5OTE2uDo+B1YWFfsJZHQb6PVm4rXfyCi5vVHC0AYNClGYB6BnP+ymzDIWKT4tP
         p+iWkAjUaEvhMbqAKsiKXDzk2dWGTUyctLTQQgmdMePyPrmQOcvJF8qo6rMUjS3LppRz
         w2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288666; x=1770893466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c07KdBpCk0oynCm+8y8fUcH+9LrRngoiGgHIH2HoCVg=;
        b=YDo06bqfIZsSkaJLR/mKJVLSTr7yp++uKABNd+BWq2nLqss/+boFTbkNZ6i+qRO0nX
         lGaBvrW8H1WIqqipoYtE2/z29+GpijpgzlpyZwGtghCx9skPqisqznzGPIHCOi1zskY7
         xtvq6hPMWZnqTSEKgjgET3bAVmBeizWKkp4/Th9LILmDxHGg+vFqdZW+SqAFUOEu9MsB
         NcO4Je8XUW5LKucums0rn2Rb8HWASiDI2zoJKWwXjPFfemBjeMnvWJtK3+mTZ5mlsRi6
         q0o+d7zS3Wxdz0mFs1hGXOuoCMPJ2y6t4XMmw0S+Tb4DbLr3uWiwX/+g9woRnvG9ayzP
         iXXg==
X-Gm-Message-State: AOJu0Yz4DCZltGH9PtU+Fwwm5jfC9U9r+LT9BWaJga5JXUl62EC+vp6K
	CgK5MmQ2oZuQuzxPX9y+6q3ddyjHSRjCqoRD5AjhDZSIrmMFXxoHEgUKqHodpbAnuwvTLieb2Er
	efO2NdiPNqpbz6B8ku3bASkh5RhVsNyTmWQTmkGOwtzAwlEfCW782lG77z81CUie3xkJW
X-Gm-Gg: AZuq6aIrvTsClFFLAMGqFD3O7bU6A1P2N0BFs7yw4V0NZI1Cu4z0na98nejIE5MVsKg
	If6TR+iEKmmd4Hq+o7KWbs0m7a191ofdJ5l21mZcD0iC3e+riBieXC+trHbSbSM98tA0mtyV+HG
	IS1AdHcDotE8Q6A7sjB03uR2sWMx1zEgD3tmFTXAKzps0xDdkPh+1/fZNwF8L43ThHNMXTeM8wt
	9ZGTyieckUqqhlEZCSwv2ufOgov2F4IQ3yogQHJRaiHklDFxy4Qh+MGFtU/JxeAplo99K3xCgOJ
	P3AT1UNLEjkZwy9LUush32YbaUNdoxsb50oq2GE5bfbWCOTZN1TFTQArTwsYqpKG5Lhw0IHhU+q
	fi8iSbBEAaR34cMs3arnRpf6gk8aw9cScY82mtrLENKh/k/B6CHb3UDkhm1caxPSMABU=
X-Received: by 2002:a05:620a:44c3:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8ca2f826c1amr651267785a.1.1770288666233;
        Thu, 05 Feb 2026 02:51:06 -0800 (PST)
X-Received: by 2002:a05:620a:44c3:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8ca2f826c1amr651266185a.1.1770288665816;
        Thu, 05 Feb 2026 02:51:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0073117sm211208666b.71.2026.02.05.02.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 02:51:05 -0800 (PST)
Message-ID: <ea4877a6-3032-4710-a563-99230b6f861d@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 11:51:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] testing! arm64: dts: qcom: decrease WiFi antenna
 regulator minimum to 3.0V
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260204-oneplus6-wifi-voltage-v1-1-ee6fd47f9d02@ixit.cz>
 <d800d5cc-0e57-401a-a62a-42e9c40125f6@oss.qualcomm.com>
 <851db388-61dc-4916-91fa-32b96113d4aa@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <851db388-61dc-4916-91fa-32b96113d4aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cb_om2E-C1eldd8l-PpnRAum9KgN1c8w
X-Proofpoint-ORIG-GUID: Cb_om2E-C1eldd8l-PpnRAum9KgN1c8w
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=6984761b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wKYZdr8hRx8ZL1f4wtIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MCBTYWx0ZWRfX7EHP3Q08LKjB
 ++RNUSU/enbkLQOvZTo3I6Q8/w/RcanigAvcRNGl0qDQk5TT+0wBZbRqg8PXoBOLYJmBjK6tCnP
 PO06UCqpFUtdghOkw8HEbh/A96OhSQqEpigRpY4RfLeLqwlgxjae1rO7fWBCOpZXpLxSYc5HDci
 gbB1k0jnzhyXY1QXGDcXs6K/o9EfQVLfxcbgEh5EdRoQY5HiT0StblFiutz2SgwNI+rHm3edbNi
 9axrmg5oIPPBxM6b5mR+PwLVjVPgX3Ac6SEX97Np/GlII2wjPfDeRkeF+EXI6eXIcPXMV8Fo2P6
 BYhmOcIW3SCXPkD3aQnLlT0qiyQ01vM5BWTi6fpW+0uLjgVa5un/id/SXD+z0QkL+6ZqB3SimAD
 Mj7YMwYFG6l+V3blJkFJ6AggIiInKrM8DhL4PiGiff2LQG+ByEOXNd+A2MN3CJQa70JATl924Cj
 KsxpqtCjif4rulPbRcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91903-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74949F176D
X-Rspamd-Action: no action

On 2/5/26 10:58 AM, David Heidelberg wrote:
> On 05/02/2026 10:05, Konrad Dybcio wrote:
>> On 2/4/26 6:03 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Downstream defines minimal voltage as 3.0 V, while when OnePlus 6 was
>>> introduced to Linux mainline, the value was fixed to maximum 3.3V.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> Tested for ~ 1 month. Seems to work well, no visible issues anywhere.
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> index 5b121ea5520f5..e950db41ce25a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> @@ -307,7 +307,7 @@ vreg_l20a_2p95: ldo20 {
>>>           };
>>>             vreg_l23a_3p3: ldo23 {
>>> -            regulator-min-microvolt = <3300000>;
>>> +            regulator-min-microvolt = <3000000>;
>>>               regulator-max-microvolt = <3312000>;
>>>               regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>           };
>>> @@ -320,7 +320,7 @@ vreg_l24a_3p075: ldo24 {
>>>           };
>>>             vreg_l25a_3p3: ldo25 {
>>> -            regulator-min-microvolt = <3300000>;
>>> +            regulator-min-microvolt = <3000000>;
>>>               regulator-max-microvolt = <3312000>;
>>
>> A datasheet tells me this is out of spec for this wireless chip
> 
> As I don't have the datasheet, can you clarify if the 3.3 - 3.312V is the correct range which should be kept?

These settings are OK.

Konrad

