Return-Path: <linux-arm-msm+bounces-101027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBu4Ncijy2kUJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:36:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F708368185
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5031319EA8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F403A7853;
	Tue, 31 Mar 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQE/cA33";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B19BCBnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79E3A75AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953022; cv=none; b=lRoS715a1cvCMiGOWvTUXd10DPUNmOilpd0wfpj5/0TirsbdgbS24PZqaTBLUp933kivZaHlyvkVi8SmfWmQ4D/1n+TY7GFYFAIDAqiHNHmiBwPK/s3dZuKYXKJsx0wO42QgPa26BofD45pTKi8zgnuhu6bhagOJZCLV+uvBnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953022; c=relaxed/simple;
	bh=sT/82INrgaQ47OcLWnhG2YToHJyu+l6v8Ft+2/PQFs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nKJOrv6y6i+F+xap1Pz6qN/1kYjS7YDIYJFo6Ci8FyIwazwp66HGgo06isVNWfGilzBEGp7T8QFqwh/OLld0bYaNgZOS2Zst1GHJ5Wdn9MR8lBY/XSpK0N+NIdJa0N+GhaspE7eyPEQ1Cxos/s/iOif0DaPpO/eaccV8tWu26Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQE/cA33; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B19BCBnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9130N2761368
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=; b=TQE/cA33jnncrQR7
	9aueJB+7igAtKck0CD+hZbqvEQG07r8biZ1TWTl3u9vId9WGvZWEo0v+sgqnh3Yw
	v92NcOd3co23QDQ9jg9HEFC5EmKiH6wr9xDaMhxdPxODZry74YKbwBTy5/9P8sso
	annNJe4JblQMFfEJgWLZbVUCHc3FIatSfiCnn280jaAsoMfqwrvObLz4B6j9QxKi
	40ewi9Ib6IJHm/ky0V/idNB3tGxGYiqd9BLwF5xLH0jzW5tvxhNptxGavBgt6ZBx
	xgnWsfunLj3EhEJ79okI4Plrp/tuHuemCZD1vzO7QeG9DAsAo8nLREn4y2Pzl2CV
	8CKgOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930cb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:30:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e9d327913so14856166d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953019; x=1775557819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=;
        b=B19BCBnZVllmAdYN5O8NA4KXIib/ninJH+tPJmVG81m9BCIWXxzgC0URHRLrJ+spDJ
         Wsd2o8U3KXKsUTc8oPHmuBkfqp5gyz2KptriD0cxr4jpQlZf+V4enMVpAmgJ+wGJtmlv
         gnCB0h9IZuvP4bkbvYzFkZy56fQwxKASEVqy4zH8jyhG7l/6gfOGe8MOFHElLNpsF9OY
         aQAFIIwQbc5YFEBftr/q6tCOKfhy6Y3Vp8zal0sSHgwvElvJN9+YQ1xBjjRjkTDChebd
         gbHtWgJy8Zj52eerfgSVXI826lnkCPK4VdU/1PJkl5k2VapZAHuw5F4MVlfakjMz5wxy
         aIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953019; x=1775557819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=;
        b=NsRPupTEojfxOjTg407BLOlrmzbftbO9H/GerZjgoqAxX4z7+7fQyuIufs9/zngWw4
         2sqhtyX5ZAolCnHTaENxnd4jvbg3E7+g8oKQ2cQ23QErjtRCk37uhN3gJuFRzSe9PLNI
         1d3Epi+qeFKiEA81QTxuVl9IlLtVFpLL374rRqVC977QgD0pBOwC4jxbOPH91K5sXhd8
         DhgTudKmxHn7mwHEmLIbqjlntoVpkWxwwbZ/BvuY/EcQT8ssSjR8llkS2THF+N1+ihTV
         caNjnyw97HyqOlED28FRXfSWyzFJuNsIZ6AM2NQDEp6EREs7XXwd4Kc+63cXzcVGflCh
         NUaw==
X-Forwarded-Encrypted: i=1; AJvYcCX86b+OpHdnlfhbkzeLTLrN1s66lEWtE/JLiLhzARvo8AG8s98s+KcG+FgvNq6bYcfQaRoK+gLZ4fmZzACS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz49qZLaU9MsFYMo8QxASjJ1kcIyKd3upUgNN5hMo465jH8Loon
	/IQdcquPbExoTPMUDj68denTk6zXd0bdqkIpUWqhSty7yBUIvPcy2Dj6+Rj3QBsYQ6NWf65TTws
	0qOxG5y1+VHm+DNYC4kfomSZ3ggRAn4sHSZA7OjZO35PkDFacVXbA8sSlbEBjV+DEzx+O
X-Gm-Gg: ATEYQzyzqEnhIG4Fwh92BIBTdYWtidHxxNNz22y11vcJBvpitIfTFORzd5EzPJjixh7
	kazFwEWXF8SF/dvZk7SpyxazIuMACx9eRjMuOtkQvHLTEAVnYZoTJy/LW+iTKfMezOMA5xxz1FZ
	NM1OnPfZpPKBFNk+lHANDOKxc3NxK8UYiVbpUVOL9HXe7oA7pX6UONNk1pwaFUVVZtOSUNAvRBw
	kWIrSRiGupl/HpTFxDcqD848oqUklZHeRX3w9GHQEyxWiToedK0SFyBJgZLU7ScCAfPZDCmg1WB
	WXotUa5JhUzYL/bDaDDbffCDARNal6UIqsDedaQDXq4sVIs3t0yVi1/jnczb/F33HWhgApqGlXQ
	Ordb0e5xLyoaQ9US2GhPyC7kpLgs5kUXABaXYJAmnAxYxXCQ+wLx41ZmTAoPyZ8Ni1/sHiUtrNI
	eOSvo=
X-Received: by 2002:a05:6214:2466:b0:89c:e075:9558 with SMTP id 6a1803df08f44-89ce8df76b9mr173233866d6.3.1774953019011;
        Tue, 31 Mar 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:89c:e075:9558 with SMTP id 6a1803df08f44-89ce8df76b9mr173233366d6.3.1774953018470;
        Tue, 31 Mar 2026 03:30:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm382655966b.6.2026.03.31.03.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:30:17 -0700 (PDT)
Message-ID: <da6bd52e-3bd6-4938-81b5-8bfcc6874e22@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
 <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMCBTYWx0ZWRfX3WJwbr+Fh49X
 lD+7Cekx/uvZQmTSO2NERjhXNIwD9bKbCm9v3D71QvaBNi//QB0lhsFICobVF3BLgfkdMBiEbfv
 cJUTMuV+TZnAHcMW0Ltm+zntmtz/gDdNrGseV8wtlY0h22feWQ3yKtHhhEAKY09wigbdGHtlvrJ
 p6KlkrsdWuO0bVXnFLwcT76Sicj+dTwm2Y+IXgv7Wb+NzA8BBHFjTvqXGBGgXPrqTuzNCTvPp8R
 ItopCnuaUXxTrDjOiy2qs+uE6Aki+VLNmvtfh8Oxwpk7lQpsM4zLJgRDaMpPZ/lfiL4xdTtGdHD
 QlJA2kIW140gMvqWWJkBXJUjPiv9OXoFLCmyg+IKU+1YD/lkSD4nTSO9Dbh1JPTmKnAPmIS5/sZ
 cuO4WmXsL/8j+XkZNKNwWzWBPp2p6uhJK94q42EbWO/JNqBSXie0Tqilt/a9IPA67gUfItmFeVZ
 MB95G0mX6+y4Fz52+zQ==
X-Proofpoint-ORIG-GUID: 08vXIlvXoOrRMqT18pH411fffoE7VFBO
X-Proofpoint-GUID: 08vXIlvXoOrRMqT18pH411fffoE7VFBO
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba23c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8ULpatOiM0j0TomVWBwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101027-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F708368185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:20 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
>> On 31/03/2026 12:10, Konrad Dybcio wrote:
>>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>>> code using it.
>>>>>>
>>>>>> Make it const for code safety and code readability.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> --- a/drivers/clk/qcom/common.h
>>>>>> +++ b/drivers/clk/qcom/common.h
>>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>>  	size_t num_icc_hws;
>>>>>>  	unsigned int icc_first_node_id;
>>>>>>  	bool use_rpm;
>>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>>
>>>>> This can be a const ptr to const data, even
>>>>
>>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>>> they also could. If doing this change, let's make it consistent - so
>>>> shall all of them be const?
>>>
>>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>>
>>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>>
>>> So we'd have to duplicate the entire struct
>>
>> No, that's not a problem. Pointer is not modified and we speak here
>> about const pointer.
>>
> 
> So to clarify what the code is doing now: I constified the pointed data.
> Not the pointer. If you ask me to constify the pointer itself, it's
> fine, it will compile/work as well, but do you want it?
> 
> It allows only definition with initialization, no further changes later.
> All existing drivers would be fine with it, so just confirm that's your
> preferred expression.

I'm actually a little on the verge. Maybe let's keep the current
iteration of this patch after all, as it'd be a mess to undo if it turned
out to be useful

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

