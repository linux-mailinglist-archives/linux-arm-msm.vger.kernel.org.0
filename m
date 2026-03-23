Return-Path: <linux-arm-msm+bounces-99180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JeoKoQPwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:01:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0312EF914
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 209A6300DEDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4835E3876CC;
	Mon, 23 Mar 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F661NEi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRnji1XO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383837D101
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260083; cv=none; b=uP1CERaDAyNrEvIErUZI5lq4LUU3YMOeucwchHZ8pdx+mqwCeA0Ekhne9EuG5EKm76vh+qO0dFCfY88EG9F3Yacg0iag/23ey9Y9RLsk4noWZYzm/adOB9IfK80sJaFY4FXu7Lf137A/OhmFgQ4Qlj8hukJMJtIO4OrEyIp30XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260083; c=relaxed/simple;
	bh=vViOxB6Cs1Vo4vecuWH5PX63l0iMGjGRSe4dXPzXc/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBTUb1/RTau2KrrwLN+56/SuJbC9PqzcfNUUfGnVuZnvwnnADjR9eFH+zec+OCPSG5CSVnntr5x+0bMfdhlfpksgdT+g0modviatlgOytNSSr9si6Oat0smt6thcH2H0EDFUH0oHqK/Yxr+KzQPOAnyLS3J4QoYCc9+NYVgdwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F661NEi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRnji1XO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83waE1364358
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDKtBGhEAchSzR5OWggdmnwzuStLPCYVysdJXOF8xT0=; b=F661NEi/LOsBPWf+
	OxGR/eqrodUaDt3erx8YjaeNl5TmgIX2/dTbUV5PdIORFJB9b27rWIY1unbGiCfG
	8okgxIcAwLcUYnKpe+DRPTMoXfnPiHeZlf2JZMn93I4p37OG6H/ygpGzOQi3dBJg
	E06/BI3Qa22BDBTgvFeg+82Kw4BmIOLRPizDqAG319HmUSdhoCGfmBWM3wABPGP1
	m4PSrviIi1PLqew05oa03/o+AcOoBG9P0Bd7K6myXbT7cVGjXR3QKYnWlrLu2vIQ
	/Wt/jC2x1cXq1/f7vtbfMwywMF9ClNIA6WA395zLQU7RPDAIiSwogijgYrNBl7zE
	NywOIQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78ebx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:01:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ba403c7c4so108458e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260080; x=1774864880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDKtBGhEAchSzR5OWggdmnwzuStLPCYVysdJXOF8xT0=;
        b=cRnji1XO1ruW4JKqk4JK6m4a5lSFR1945MQzMQLZvlp166ajkKgzh0IMGhYIPE3cve
         y5qNU6sXp+3A6GE0Pe/fOcXs/dno7kX/orA9aWHlvJpxUuLpU7FHCjP/US+zQnWZkKVI
         f2Jf8hqHSI6Rys78rhyvvjC7X9F2UPXViOgxj/EiMSsDVtmgfrMhhcpODNbTuCEQnwGw
         GxKnVv0cq/kG7EKpmjudyc6kaGATQl2g7rcisXifey6LK5uGr9U9yZJrvYE+AHhQX+V4
         tXS2L5nfxo0q0xZxwfC1LbNlGNx6u+e2Sqkjh7iJghTPtKKxE0RCVHAI2Ed8Q0mV6GCN
         jY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260080; x=1774864880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDKtBGhEAchSzR5OWggdmnwzuStLPCYVysdJXOF8xT0=;
        b=nxbOU/uAvSRSE8ja6dr/jAxfoZvBzY779z+ePWHBsTND9hMwKmLmOkxPqtLy9V8CWT
         P70v9hDCJh8V2KYWZ9mV0Ru+NrWPsWx4nevEBJSMmcSbaPGEW2jnBrG45Kfq081EyLZO
         /xUe4P2+Tug7MvuBmg7BdU0skdIb2hlO1kKE2ZPK8jVCCj2hJ+FTB4/ESfUGQkSNaeXT
         eOLFcKo+1uvAsmGcrsRLgYQ79mzEbjq7RHpJIp5swjncuSmaEClUnh6YF2ztBJ6zWAyX
         FTokLciG61Rj0RZygjf1dpY1fYhF1anp7hzi/jae+0DLbeGHlgSz3Ex1nJH1qltUKOiU
         JHvw==
X-Forwarded-Encrypted: i=1; AJvYcCWjOtBFsUiUhJv/CHcId3HfXZ8o16buDXc60fHmOW7zv4BQZuQhWVvVRZrJw5lpKYEPW/O23mTdrGQy/yAf@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKNNdLfER3Qv/samnTNUIdhViKhGm4pZwu0xOUS45lT9+9KKE
	9WYv2iQbZSTVRQ+jm5LR9lGioyYWa8XKehbVs5UMtjHS5Yid3bfcBVSDoM8uiWnuqfK4m/RCbHX
	8Gambngf4JoEyXAS58KCeKWvxgz9bOeFLX2AqkQ+8we88+WmndkEhYbo0RsJXvSE1DbwnoJbSLS
	Y2
X-Gm-Gg: ATEYQzxz/PCXOWx3AZSwm+qZWlUaBockQOXz145ua6+IVB6nt7lqr20aNgskOX5IK7L
	Q9ko3fslM1BZfGZtUZW0Rexsw7BLUVmMXdU5QBLExhFIhfwyPWlHdkfsNb2ElOZORCgrstkWFsR
	HjSg72aJacuug8PmI4Hzd7U5ovMPBg6seJJ/cxbaGjxaayATiHBC0LW98dTEBlhl1OyOk/Q4IY1
	FbyResMfj3gcKAEhFsP+gIzNS52dG9ytQUDP6jzWzjOIN4VgPtm1hT4S6/f3vvWRD81jf9IuL9Z
	Eg0t75w8aJv/eSL1xEGPtfO3oUomEENmWWndmHEgcyJI1E1d56RjUxrV+Mcehyol3Hgxk2o/hgf
	m8RXOtgjbHN/HQR9jwE6f0+9UvMJ558Xe+ZXuSL3Q1bCbYBIk8Y17HYgrqtC5mcE3s5O4o+1plA
	lmfdQ=
X-Received: by 2002:ac5:cd92:0:b0:56b:7252:f7e9 with SMTP id 71dfb90a1353d-56cde327a4emr2180262e0c.1.1774260079425;
        Mon, 23 Mar 2026 03:01:19 -0700 (PDT)
X-Received: by 2002:ac5:cd92:0:b0:56b:7252:f7e9 with SMTP id 71dfb90a1353d-56cde327a4emr2180225e0c.1.1774260078861;
        Mon, 23 Mar 2026 03:01:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm464744566b.60.2026.03.23.03.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:01:18 -0700 (PDT)
Message-ID: <d866cefe-817d-4b65-8948-4e3533ed7709@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v5-1-4a440594348b@oss.qualcomm.com>
 <funq3yjordebprhusdkkapw5m4fuqpavhyeguoo7tdffv2ebub@ozh5c7a3py6f>
 <pnd7eeijf5cmo7nmydsd7bvuxhhqbkup6xv2fgpb5gfwqyfnf3@dfr44uwneph7>
 <jpnjqvaezrqv7l24dotzbyz2s7scyltlhn7xhwtb4akkrggkyk@5epol7lyk6wm>
 <ophmftetelsmelaasdddans34xzvy5htxpphvsowasp2eatt75@gy7q7pv4swjr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ophmftetelsmelaasdddans34xzvy5htxpphvsowasp2eatt75@gy7q7pv4swjr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c10f70 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EXM5FdCO88UtrUJ2BzMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: NgTPv6l9BzAud739lGPQ4Z6yevIWk3_3
X-Proofpoint-GUID: NgTPv6l9BzAud739lGPQ4Z6yevIWk3_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX6zwOmnlW9Oga
 jJiLhSeS1MOgz9sgCMtFwnE8uMEHfdsC8syCPdoioSKxO2weroKexu/+lWH90jls0jkWvArwmNF
 b4QYY5RsjwTLyurFwWJcP5Q7FbBdXGEdPBJNJjda3DgASvj6MKzF549B9TBC6hGgw7cbJEt1sgz
 nrYglUW3Od69Du9kxC5Davw1IQQikAiL7jPu5S1bHzDiYoq35qjWPgsD5Hs0T8HX226Nx8DRsYl
 8iGLobNpWQYiYT65yPoib9vtLpoWDSNu/6aRneofzVjm1FPVSskKmJCfn9NNjTDfid/tl44sAgZ
 pFRuKPo7tcGgTvNncxQ5I/WW9B7Om4oZrIWCgrY7ccxt5HhUr1KDDTby3JrdjjjrzFznHx+uVyO
 ViHTjnmnkNBftgQVRE2g+/l1OHzt3dGslXAxz7Ys7E+BWfWioiUxytTiKW3PgAgHLvXGOPXmaVO
 ijtJLz/i0AHm+HNO5mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99180-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_EMAILBL_FAIL(0.00)[dmitry.baryshkov.oss.qualcomm.com:query timed out,abel.vesa.oss.qualcomm.com:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A0312EF914
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 9:57 AM, Abel Vesa wrote:
> On 26-03-20 01:52:06, Dmitry Baryshkov wrote:
>> On Thu, Mar 19, 2026 at 11:11:18PM +0200, Abel Vesa wrote:
>>> On 26-03-19 21:49:07, Dmitry Baryshkov wrote:
>>>> On Thu, Mar 19, 2026 at 05:30:48PM +0200, Abel Vesa wrote:
>>>>> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
>>>>> and all share a 3.3V regulator.
>>>>>
>>>>> So describe the regulator and each input device along with their
>>>>> pinctrl states.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - Since this depends on Displat DT patchset and since that one
>>>>>   had to be respun in order to drop the non-merging phy patch
>>>>>   dependency, this one had to be respun as well so that the dependency
>>>>>   tree is correct.

[...]

>>>>> +	ts0_default: ts0-default-state {
>>>>> +		int-n-pins {
>>>>> +			pins = "gpio51";
>>>>
>>>> What was the sorting order here? I assume you had one.
>>>
>>> The way I see it, it should be based on state subnode name.
>>> Which currently it is.
>>>
>>> Do you suggest some other sorting order though ?
>>>
>>> Thanks for reviewing!
>>
>> Then ts0-default-state > pcie0
> 
> Oh, right. Will fix that.

+Krzysztof dts-coding-style should clarify this

(pin state subnode sorting, IMO it would make sense to have
both top-level and the child nodes sorted by the pinidx but I don't
really care that much)

Konrad

