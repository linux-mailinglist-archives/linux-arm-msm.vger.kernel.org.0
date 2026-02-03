Return-Path: <linux-arm-msm+bounces-91626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J0IK4S5gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:01:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E06D6870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7D9130523CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C5930CD91;
	Tue,  3 Feb 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="na2lf2hi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1NEu/yl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF4D2DB7AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109249; cv=none; b=Pfyk9mR4aiotxPVwmwiU/tVqfzsRxUu7+m/RKk4Hag7D0IdR53xfKd211SnnVzvn1YX2KBmQmmaH9HTzvNHDvjNljdsK+FdSzD4sc7apSpbVS8zY+ZTbg3mTYhoMqkBPLlaYp2eHKKpeuF8yPJEUv5AestvHowYoFRAbkF+bf8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109249; c=relaxed/simple;
	bh=ByTzeh1+59IB6tckkD39O6T27cP2fsdPQhji/EmRgSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TG5Iyym9T6WFtYibwNk/5Q7XMbqLWKsgHUbOxhqqOy17Zzg/a98Rj7Z/PjDilQ7BN4H0GKwAoawh/eFetuSxop7aq7CELg58yQ0q7drY3IHjhpkj3Ax51msSYHiPOMRxecEQee76LeIdgX1uoj6lQp5/XBBrdrK5Kv3kqh7RvRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=na2lf2hi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1NEu/yl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138nqSi848678
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=; b=na2lf2hin1J5RDcm
	3eWG8e9BXLp71zRhDCNVU3ck+gB6Bmpj8KP8rkKlHTDXCIw8JHhQNCpWgiGYCMu3
	6IsRwF3PlfjUWSPDarbxESpyLOdiWPP/YgMCCdrRQMt9RtG2W8JiaFyejYa1cMsu
	K0JCN2BvlCWKe3BTQqNS2GNgXQInEUgtJkJKd43AMngXeQSkMDvgdYeZ9RSgtk+i
	mGwv6sq9G8X1GqhOh0Ha/Ram9YVK1DnQ/hz9H2WC6+lDR9bNMZrbOEPpXrGxLSot
	ZlCoNCJ/FPArFk86c2pQ/RTEntF6VJYcln7W3H1niTpiPfyJjZgMWJAJ2xYyp7yI
	RgqibQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutg14k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:00:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2945092a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109246; x=1770714046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=;
        b=f1NEu/yl5WBSHPVNo/LpkfQo3LqkDd7bf0hA8NNxsJgpGov57f6J7VWi0YSsz/DL9O
         RGDkFPx5gacUImcnWv4Y0G20rl2mt6YVrYUfBLqA/UtX6+W2OAp5rMBRyOI7iNbnQSZP
         mFzU2jz0phu0WpqTQ6waJrD9F9ey+AilWr8rAI0ib5yUAMTKhz+es/yaKbEgrsIvQqxH
         i439adyNJwR8y3THmglRVC0nljdOY6zcBnie+uRICioVg/eXODuLhIRywinF4ohWkumy
         Ro3UmQ3RWoQxJoKDbSn8rVGVs/dUI/D4snT8sYtb/dug+w1KlgrcEP0kLXHPTLnokEVn
         pMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109246; x=1770714046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=;
        b=cSGitE+mW1Apu5QU7VwZiFj+uDXnFQGFz+VcR+vHLP2cNfXl7yotviKgN20Vtyzq2R
         lC/9S0QryrAYa/27FkoM/qYvTnNdVnqcxCNBLLWl+hZW2m0fcoiNFktYH5+bMsEjDbj6
         TLxOg/exfrBWJ1IMIQz1Ohqkuq5rk1Ck1Z5O0QpZO7cm2dsZ/p+e8y4Luoi24wec2tgG
         TueYz82Lt7yR7WYXrwQj1KVBfB3zlAPUsIFxII6eJWNT6zhAvd3J2AFrEf+rH6Z3zpFR
         2Pq4p9vsLiJJE0F1deHx85wOQeuoXkcmAqreSNX4psK8pbXTbPjkZLYovcN5VG9vrSJ/
         wn1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD8IbZb1US8Eqgadpar98lhD9vIeO7K1x/dS/gqlg8/6isA08INgZ9xXJGrSBWU34fGdKl11g0VXPZULMI@vger.kernel.org
X-Gm-Message-State: AOJu0YwHq72HVCy85KM6Xz9XVbJF/+UU/2mqHXnkx7gjuM2TOP9k6ake
	+fhPW+nP1yHhw8Oo4yPXEZoODTvcyH5lzZ+Q7Ll0oo1/V1miojucmRvrR+DtEznMeMFneWzn15p
	rw4/YIH8v/VLzmi9DdohWUWlUH7XmE/23sqDx+Slfbrh4jCUDYIz63TXTUAK6jYrJWVr4
X-Gm-Gg: AZuq6aInI6JHeOv5ICrikrh9NvLJc5C+rMY+3jj/hOZuuPCl/xiQgiCTPegslmwc2Qe
	7VR+TZgKqoj6GrS2iiG3DHCi1OISZM9AujRX7hVcMOPJgTz/OEUcIhGJs/W8aNATe0JVrJV8ErX
	09IiuCrpEeIw1qaTkz2Kss/hAe9HIvQueg9whD+8pI4VV6jFI1AaSMTdhqu5oMuRqdLGY3SD4hv
	VgE1f1vUFQlIIFpSmy8SlSWDR7i9esizCKHoadjOHoP54CqKG9ebOrJeOmJOiz5o7Yb9E1ZqyH+
	b21XP6Ga2L8d2xXvvH0w9W4bMhjOHsQvGWFyFf4kL8ZAQbZ4GknZw98Pvzy4hl1HlDD5KWVea2K
	DehW8WtwyUsWEr2OJJ0TAkaLsBVTMqS864jmbCLYIM5RTFYps78KlDvHDN+zWrq1j+fHDKm6DgA
	==
X-Received: by 2002:a05:6a21:700b:b0:38d:f799:c4dd with SMTP id adf61e73a8af0-392e00652a6mr14659635637.35.1770109246398;
        Tue, 03 Feb 2026 01:00:46 -0800 (PST)
X-Received: by 2002:a05:6a21:700b:b0:38d:f799:c4dd with SMTP id adf61e73a8af0-392e00652a6mr14659592637.35.1770109245911;
        Tue, 03 Feb 2026 01:00:45 -0800 (PST)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356b4sm16583717a12.17.2026.02.03.01.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:00:45 -0800 (PST)
Message-ID: <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:00:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfX9TXLy/naC3E1
 NdWRRKX08T8miKKPiL2mb99KWINdqJ93xJy0+0R0+1WkdyCkBuDqPH43RxdOhiElmgkzfkgdyWk
 5VaJ5czrjW0vVlcL00i6cQqc9cZyIR15J0ssWsiiA8BjMSARTWBYYp6a/KUm+glU8AyIDyDIX7H
 3keJehWRHUIsWmF/akawpUGDv0UKHEzVdQ9LSEYo11NQ83ResXtyHzkVHyHdY1iKaSP821g9x+i
 g/ocUgDoxgj5BWVT+vpDndIXVTTJomM2XE8omlzETom/wCWQDe7ziH8Xnl7stVap09/ZwAvS1WP
 yo+DP2KbTozSBmdWf1nheBLn4ZpOdCPC/Gnmb2DilOE36Jsxo8b1qdzchLARQFJrxvki4egei3j
 dsZY79eXVyxfQoIGGDFPz7pK8JpTXxcwVA5tZPzAhiLMW1XAoiPAWh+mCvgmN1PyHGm0D5Oci6J
 jnDwGi6nQxOeTo9ISZw==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981b93f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4RL_iPhj091x_p4kUjYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SNWuHUM3FYMIXqfe_2UHO04kVFDhvmMC
X-Proofpoint-GUID: SNWuHUM3FYMIXqfe_2UHO04kVFDhvmMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91626-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: E9E06D6870
X-Rspamd-Action: no action



On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
> On 2/3/26 9:08 AM, Jie Gan wrote:
>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>> compatible for probing.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> index e002f87361ad..68853db52bef 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -29,6 +29,10 @@ properties:
>>       oneOf:
>>         - items:
>>             - enum:
>> +              - qcom,glymur-ctcu
>> +              - qcom,hamoa-ctcu
>> +              - qcom,kaanapali-ctcu
>> +              - qcom,pakala-ctcu
> 
> Platforms with existing numeric compatibles should continue to use them,
> so that the mess is somewhat containable

Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu

Thanks,
Jie

> 
> Konrad


