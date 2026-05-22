Return-Path: <linux-arm-msm+bounces-109353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM14EwR5EGoZXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:40:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 906415B70B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 379CA3006015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E753B5F66;
	Fri, 22 May 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8qdpqXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpJZHWi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA5037DEBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461630; cv=none; b=fuliPwL01DKRzajp1zeGYikelrJ/vygt/v7d2VR4iSyhqJgL0UqrrvhQ3i9rmJgGyNHDIqYFFxmxOpTCONTIf0XhzE8omHM7Z45A76/dzNpslE9l5hketJeUnm9zdkq4n+ry6bFKkCtiBoBLNp3003fS69+HPiHQop+xVR+Wg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461630; c=relaxed/simple;
	bh=/hE5m6idKzPlu3vSzifAN7VDr9wafOIGeMe/a7NlIic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNh3T+xCFF325luG3NYqGQfNNb8OhPMrihLgOSgakWyLU9shBAzsMIBOa/oA6PkHy4UCh+SXgfDDPti3GC4TaYp5kEokv2nfWIu4PYGIKUgS++sCAH6QW5HMwyBc521MYXIrCiq8cBC48oV/Ur63cCnZyY5pVI+T8Rn3k/zmrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8qdpqXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpJZHWi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M92Kt53005120
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=; b=A8qdpqXIdD+wK2d0
	ChuGOZuBtcHbqljrLdX+7PwkYJgrw1VaUaDQeupHtAmPznVpxewtMFjg/BVWORqL
	fpm+qwNeIieM+uSkNNEI02Bf49zv1cWp/5WnD1ZyBmtq5cR7pJv7spbfqdlcWWlQ
	p/YW9t8iKcBwnmyCIin3L2GTQHNsq3LRgmKHBv2YILtM0wQ9xz5wcY4E1K4l/t1b
	IXlGqQCdjeFv6kUwfrNPzzd3cNvQT/uqf83dnCxuD3uHbQtQ8W/58FKrkN7UmIWZ
	Ke2d0gw2ZpAdt5fhapSstGj6nyD3wRyBRlYCmT1XdjxM/gve6Ff6GeoVgyR8mEy8
	Od+NlA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtaguu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:53:47 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7cff695e4a3so79064297b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779461626; x=1780066426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=;
        b=CpJZHWi/+UzBJRWHTGCY6Jt/p3hoyW8ERdsuu9iG1gFuLaN5nj3GIlwOpHSC8Nitcn
         6QBbIF0JSA+KUxymRUig1l+jZuBolWZtxkzdoLMXd1Ql4e91UXnbu+FQF6KxXEYPLGpv
         wjlsIgbGzZ2ZQfKUlw8N8R1Xjh2EHvvZ+SsGKJeomvi0R6INFQ74fr9WqgRQTYwd5R4U
         iay7VdMcsGh4vHkUvaUpTMtbqplPD7KFQPb15Cf9nGL6ZFHyTMmV9llC0nyGN5SA3CxJ
         xR2AcBDBx+9sBkrQln4g85RBfxPVioA5R9VGJR3ffJm+U5VST/iIAip2u1fYg6Gn94sW
         WCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461626; x=1780066426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF2WmMrpz+Zv5qLWFq7G/tufi6Y015PPpGb54Rf2fho=;
        b=IncgX6gEpEt5Hq18vdCcdkopSKVsijbm9vxrAwyTS1BW8syJxxi3g55UeXZlzzDMQk
         lZS1gAPVoqHNt7xprijMKNIehcX9cThV4+aXpGZHFvXGsJsNf5KQCJce4hwffFR9+3Pn
         tlbmcPq2hSIEczLwxX33gpfCdg3nZqbjJSJRLWlxe803/LuZZjcmaBNiZlN/mkPX6XJ9
         e2of7BRfB8m2AcadkWi54XzCEoHndBfwpZ1iPLQsFfWEMlXRvMwLzifNyHov8ME7XvGo
         IV4TzLfBVrCTHriGng2OlBEwKfrwc+lV16QDHWZcRGAuK3keZiG2BL0umvUMgNdqb/9d
         znsg==
X-Forwarded-Encrypted: i=1; AFNElJ/JxUDcq/c/Ljg+TBn3MlOhptP4rf5PorrhO7/0xeDk3A+IpT+s79sX8y5DwNMfz+u7kfE/CLjvdvqmhujH@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEJah+6SgRQiKOPH5h+S1mB8uVfRHH3hox7XeNTUXoVsgG5KN
	QTbORtZ7rYqgZujb0PWEUVnQuvr499DMYfhwtz5boLgrc4BCK4kV40C4WkHIaqBZOwk/yfWimDH
	Ne83z6RtIVBjb/Rs5ptqNuJWuyOYNwQvDID9nrP4HECiMPsliUzyIn/5SsTJ+Pmlpun6w4D5Utd
	zB
X-Gm-Gg: Acq92OFg7FEgupWJRfoCxyhl4lqf1wzyHK3LyqVI5njIQgJJky7IdzY0YrlW0Xu/9dA
	Ttu6Wflrtry6FhZjMR+5NC3OANE4U8+9gwaDD2MVOlRaXjsfd7GUbmWaCUB8K4UKSOT7eruW4Md
	MOIrvd2xfSvrySxii1o+dNWK+4yAn4KpAsNRMEUBcIiOzEIvC7k8tx9dM9IqM4WjGRvNQo2fi9D
	elVbFOGXy6oxBU8ybDxahazbKOIaJaRbXUOUVlSgLpbsU38O8H4NMbrGzWPa2kQSpTWGW80Fzwb
	9DtsU9BGsyBpnnAj8c2Z35wLMJTUQ6+bkDwMLs3vEGgZhZC8tVJy04LXxf2VToIDDQo0GhcP6/4
	HNrTJ7Qt27JFcT0IokDrEsbkwVFhJeCbC8f1B+8qHfX9r+3J6
X-Received: by 2002:a05:690c:6084:b0:7c0:d0ab:28af with SMTP id 00721157ae682-7d3343d787fmr44563907b3.21.1779461626435;
        Fri, 22 May 2026 07:53:46 -0700 (PDT)
X-Received: by 2002:a05:690c:6084:b0:7c0:d0ab:28af with SMTP id 00721157ae682-7d3343d787fmr44563537b3.21.1779461625912;
        Fri, 22 May 2026 07:53:45 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be2dc9csm8941917b3.24.2026.05.22.07.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:53:45 -0700 (PDT)
Message-ID: <c265dfd2-e077-4ac1-993c-e1d7c4dcca8d@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:23:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
 <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
 <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a106dfb cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jH77VO39CjRCDWMup1EA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0OCBTYWx0ZWRfXzj/Xdbbg+PT7
 zwEpQ53+n4Rhk+KCkHYLqi9tTzWubxZX+LnfGZwpVeesYn7iucwPMyArWeh9ZbUbCkvFMdTYk3C
 KH0tNO1XibmifxpuKuiJEEs/pEGzuruSjPPcF3KPEqH2xzAEBaTKzpf0om8YOHQv/v/1Cp8yHi2
 ydJe7sa7JsJYjMt7KmkIIvTsKH1d4Fe1RCjpAg/8+hear7Jq0iP2Bl96qz7QKWmD1Ly4fvSLH7X
 sEFzgrb+/mYJD9Jg50M3AwSJIXWJD/91uGMacaanv49hpXgdu5qts8u6yFvK/FoyfMzD4OizOvd
 MKrL40AuEt2Ar2fwOM7a1lcVzCPfTRQD7plo15JoWNf8eXW79K8YhWM+H8hrrfGiZTPffccOVc2
 VjdSy4iE+dko1sjItWVM809AXrrwbjGogVRtPD5TM3OOLORMn5NK0ty3U9n193EIZpF11RK9AnP
 PWtVbIwIX0lWeyPFJBg==
X-Proofpoint-GUID: twqvq0KfEEpyQp5sQirHRB48lcrWrita
X-Proofpoint-ORIG-GUID: twqvq0KfEEpyQp5sQirHRB48lcrWrita
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220148
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109353-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 906415B70B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/22/2026 7:48 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 02:13:08PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 5:03 PM, Komal Bajaj wrote:
>>> On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
>>>> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>>>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>
>>>>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>>>>> for the Qualcomm Shikra SoC.
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>>> ---
>> [...]
>>
>>> Ack, I'll address it in next revision.
>>>
>>>> point you can use sc8180x_mpss_resource instead.
>>> minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
>>> For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>
>> Is there a chance the same ID would be applicable to 8180 as well,
>> just that we missed it in the past?
> Do we know, which platforms were the first to support minidump at all?

I am not entirely sure from which target minidump support was 
introduced, but SC8180X does not seem to support it.

Thanks
Komal

>
>> Konrad


