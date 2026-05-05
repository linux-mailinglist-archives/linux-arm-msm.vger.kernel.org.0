Return-Path: <linux-arm-msm+bounces-105979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH+BNEj3+WliFgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:57:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBDF4CEF00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E51301C589
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133F347DD7C;
	Tue,  5 May 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tn8GXoMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7XZC2JC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1835313550
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989445; cv=none; b=LwhuQWPFcF0mxIfqdd7DvrYgDTcylSrJFHSt8ehBVphCsWnTFuXs/JFzcMm0CPokZMNsaGf1p4IJU/1UFWlt35T3iHSFTOrcJgKOfgeBOR8qraQBJPeR6Kud/m4YzIcF6lwCf4AuFl10q/x4J5mNm28RfRMDqjhnLhL2J2L4ep8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989445; c=relaxed/simple;
	bh=CZSj9ZWmQ5ooC/B9lWFk7QyttBbZH8/ZO1PvhsGrAXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUadXuL5zLhwPA04PmTJmtualf58ibO9wgY+3sf2eJcPQtDx6MIxyRFw9nBcYwuI/TDPwYWCEbb1S5UM4yCbc831MvxarFqNiNBm8lgaPRBAigJccDoCVH27yTvyPzN42L2w3wkWBNcybSTCcP3NfZ2H2ltgUQswQsRpn4DgDsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tn8GXoMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7XZC2JC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645813DC1960845
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 13:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0RVLE/qSnm/P09xzKEIzQY2p15aCFp93vrBJQ6M7zY=; b=Tn8GXoMj4m7fmcnO
	OWBAUFznqkPVw0GeGafLrUbyX4O7fAFIKI/nRzmorbY2qwT0+3l3gOtOZ67jl1n2
	C5u2nYtv+V47IfR67l9Xkk5YqGfHJmCC9hdL+JdmsFNqRnBHvEB7CL6C/isw6zPE
	N5qN5+AqpxPDu4GfL43OwtlajZwGlRdjgVije1mrexJ9IIrXkDcpXEtY+kwd0n15
	7sGrinXE5k6yySahlNSBDE8/Dkbx5LDRVnZO8C9NSzEDW4SRtffy60itHVH6tWd7
	XM5MqkeoCCOwJLbUB2wiU0ClRqDA7pXMmFSwMoSQVBpIMpeOY60oPsZAup2IxqyZ
	leXscA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dvng6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:57:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f485961555so1302389eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777989442; x=1778594242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0RVLE/qSnm/P09xzKEIzQY2p15aCFp93vrBJQ6M7zY=;
        b=W7XZC2JC9qgPIM+2Uz5XHvpcRXdGmS/DKHMT+d07e/QjBVKZFo1MnGGBy7g9Db6bFt
         QwHQBUgO008e9twcr4+jNJTdK/kJaezxZUR2NTrF2sk17pa4LkNxRXTa/JIf/r8A02Ei
         jD63+b04ByjD27sOnzvyT3yvtnoedULrXmSVc9OuNtuZsZ/zXA1XFuh0rLNugrjIodwc
         Mu/hlUBHVD8M2owmxeeejM6S1WCPP5ntWnRKr1Dw3InutM0jZm8GxFuNXBZSR89yKmzX
         pNa6nuAgjc0hfRCTLZMKdRK6K+rEquvR2jXfMeZAbW9l215+2D5eefplGpNybvSyMXKv
         YquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989442; x=1778594242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0RVLE/qSnm/P09xzKEIzQY2p15aCFp93vrBJQ6M7zY=;
        b=MTf9GsEE/q56Lhv1nqVFgyLnoIkvyxk1z3WrBRq5BsCjafhItW0Mbbga7ybJWQArSy
         lrt+Xrh1j/JlnJPjFE+s9CU7QY1llWbUXlz2xUH7D5yZLnxLrCX9WVLUrM9DpaqPdqJB
         5UTSNvvFSXvTVY+7Mwb+7BZDbtI2+iUJpzIxfRgx+WJ/1kPaislFBHIdp04ssdXv1HiA
         VqCo7mRN7Xf26hdDc4V+rPmbieGpad+ZplzYJ0oZkO+MdUFmyU/Z9EIGJbhnXWTkBeKy
         sMPKcYkzvP54ul18J21cjNw4dnTzQdN588GEHXGseUS2K4SS1Di5n3CddxwAiibaLZU4
         zjWw==
X-Forwarded-Encrypted: i=1; AFNElJ8CXOrdeO5rCwjMaE9EGuFhcnqYek7Ulrcx+l/O1niHGV2UcPQef5hDbcsBSjm90+6SCKa1MLKXuPcD2hIX@vger.kernel.org
X-Gm-Message-State: AOJu0YzxcTcbXTmC0ZUyrMy+1I29K9XjC0B8heFu6jvqgLk9e+vsdeHt
	JFiVzodOgU77hC2rrLatbSXahZ8h/wlhPp3eZ4FA9qwz0QXjMoJBp0IGxL4qAFSfouwUVaGFhiq
	KppW4irAPFZeiTZ/OKqoS0gU2ms3IIigjz1GXpH0cAfRgRBcUggj9YzDPcwy9W7vosdAC
X-Gm-Gg: AeBDievG3PbyiAAR4EWY3L9OEH8cr3eFfOu6yy4SiEkGM0dErWGZ/ctgwpLpz64qZvw
	L0/jAmOfoe07m+IGHIrh4q6ICGVt/gpUsMR1oLcXc4fz5sX7V8R7o/F5AlL2R8yrtUQDwcKlZX8
	m8WFEjiDe94ss9UGg1VSBcu7vBOJLe7D+9FaSLBozC+4w7gzoN0s6TByx7hK0fQXLXvPDTo5KaR
	vSIIRV0TDUdkvyJU2OiiotQ5uRAnB+EvWhvWd+/9+y4Vy9Y3/y7mj0olmWPCNdGFG9WkNyrnBK1
	k0KKkra9anfi/wfXfabFxjJLeuCn+gQw9CrMQMXPaJRW2GKKg3s7KASEnfP7c8LW/hAKSONjgel
	K5qZW95EoSZPzADDl2gv1r0uN7olia+XunSgJI3Z4Y/U50qgXeT/7egI7C3Nh71k7A9oawaVaae
	CRWRV9uQ1A2NNgee2bPdYJehY+
X-Received: by 2002:a05:7301:2a05:b0:2ed:e17:d50c with SMTP id 5a478bee46e88-2efba7b5047mr7274296eec.31.1777989440983;
        Tue, 05 May 2026 06:57:20 -0700 (PDT)
X-Received: by 2002:a05:7301:2a05:b0:2ed:e17:d50c with SMTP id 5a478bee46e88-2efba7b5047mr7274258eec.31.1777989440393;
        Tue, 05 May 2026 06:57:20 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.242.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm23836987eec.26.2026.05.05.06.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:57:20 -0700 (PDT)
Message-ID: <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
Date: Tue, 5 May 2026 19:27:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzMyBTYWx0ZWRfXwwd/Y/TF+Ue7
 DCAPBR9bK5s4lz7xkLjr1e0e8dezrx8FxJ9lcaKsrzGojQT9YwnBl6mXiCl67Owcj1nO5u8QLCV
 lKKZwWCqY6fVlUhF+rvreqK9TS/AH7rKPz2Ux1Xn+FRefPvpV2veRv21HembDBLs4jwufMKezkd
 mhbIvdsvBNC4jHLK4moLG5jA1p16XEyXQmCPE8SMW1WImrYshFYxjxGzH4ORVCQjptB1eS6mvXZ
 84K8lp7sF/l7Kp9DEVIfohsdogqxFHc71amQMkVdaesAp07TdBn0s5co/aZHZPxKyhqYKL1XQEO
 rAREkmI2+VYtI+pDasJcdhL2jLFomGUf2wUmCKWBUgc1JgYXYAswNAdOFCAAfS8Cq1EjtStVJp7
 fnnqzm38AnAu+aCNwA/xLzdp8JDZ0QJ3+zzPVTQN/YWoHl39j/t6QtWUINFvUEjYpePRJh8qDnU
 4nQ+JeyamPx3l0FWx7A==
X-Proofpoint-GUID: UW5rct_3tWluzzHHuzfrJpo_tuuXC494
X-Proofpoint-ORIG-GUID: UW5rct_3tWluzzHHuzfrJpo_tuuXC494
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9f743 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=1ETSEvoV01wl5CnlN8iVEw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kvxTIm3NsnwSdPV13ywA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050133
X-Rspamd-Queue-Id: 3DBDF4CEF00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105979-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>
>>
>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>
>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>> compatible. If not, explain what is not compatible.
>>>
>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>
>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>
>> Hence, I didn't use a fallback compatible.
> 
> This still explains nothing. How different clock makes interface for SW
> incompatible exactly?
> 
So I went by the naming. AUX vs COM_AUX.

Can I use a fallback compatible and in DT vote for "COM_AUX" clock with 
clock-names mentioning "aux" ?

Regards,
Krishna,

