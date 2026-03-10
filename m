Return-Path: <linux-arm-msm+bounces-96504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEU9Hh3Er2nDcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:11:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F03F246288
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4AC9301EBE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5EB3D75AD;
	Tue, 10 Mar 2026 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKGGEOvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aeiixa5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E13CC9F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126668; cv=none; b=ppiMOflfAZdqetNEm6Tcq2Gvqto4QtcUIcoQkGn/rVqR219VKrfEpNoi9WPZFMrzqK9k8xUYGIrSciRvpcjjTr1aqEwzXhtN+423mipGaNeIXnKR/0hffSXdUdVFrW0c6Z3RRZeQFYz9n/EhaWXq4MT2Fa3xuxqU9fFLvI78F2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126668; c=relaxed/simple;
	bh=pPsVnGpOk4qG6+VcTy7J0ELkfiFzp+h1SotxmX/ICbA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OKUrrrJ/jOiTYibGoFaUyqTJt695YHjsJM8E1mPH6pVPoMH9qDRzQERh3bEkZDhzFqJoKLP99aaXk/9hmiEXQIoNWWjCOEw4qk4iOy+M6NsayAuvQH2RChGairBPQr5njr5NLJqhYquGUqz8fdiyDb6Mr/f4Toi64V/9MUyw0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKGGEOvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aeiixa5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Ed4b3587484
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVkLm00HhPjsOGiwCmfcOyAgMbGBSuN51lPh4PLo0kM=; b=eKGGEOvQJ2dBH437
	JJOw3EWOyPCZKLKm92sOnXFcFUCcogdP9zQHjfFFqlz0fZhN350yeRFlRNXuv8sa
	D5rHDz7udFXeZh0O2KAr2fPD1l/mHJCLzufVMiDUU64uAxVyop8KlJuVylocF/dW
	CW2NAXySDZT9PJzBOJYHY8Mib7RN/sTJ4wz/MgpgXOdZX/wkWS0+BXLiqPtltoYy
	jHZ6eHuI5xVOADlNrUM/TjtH0qkTqjeVGtAen4b6YTL1IwwdA+lqAN5u2jN/eaLU
	tR5MlMjEtQvONYkNg7I+/tsbNFpW2beKu6V243b9lIAuc6z50kJCAgsT59hArcZm
	lG+e+Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ektnkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:11:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829c331b4ebso881356b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773126666; x=1773731466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVkLm00HhPjsOGiwCmfcOyAgMbGBSuN51lPh4PLo0kM=;
        b=Aeiixa5A9jRtghh1wAxMEjsXsOcSWoFqmfLV6aflDaA59/JChTZqO9XdBFKd11gJYT
         Tty1WZXnU7+PEVBaXMIf2MWErFPl2MUEihVInnuJvixTh14rpNo0Ho6P/MVF05sNlpwW
         ROtEDtIlTJCDmS1fFmVbsmRHfZOjaaCMlKMEmZp5GvoNZmMnAY+c7O7GtD8iYdWunqF8
         Oxe4WTUB9pSRJ+lHbCYm0gL8J/Dq6QeyXQMME2hltvuEZXZlTHZXIp8jYpsJLtXu6fc0
         uK/71++hqNLiZ4wkbQ+H6PSpmrR1/pHLUOrhX+mRzUJwj9nKQsGync7FXnin2u9gZ9jD
         jMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126666; x=1773731466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVkLm00HhPjsOGiwCmfcOyAgMbGBSuN51lPh4PLo0kM=;
        b=fIlw7wxeFBlsUFXtDMmDdgn5JHwSCJuqDsdfeLXwd7NMkZsXOnHKR9nCYzmnkr0tUb
         7q6+ICIEXDmPRguB8KjsNBaks1kTzHfblX3m4j7XUly2eGoYHFA6zlVuOhLc9/V5FUDu
         SmGBVw5Sa2LFt0/IFt601ytQmlKZroJUt7BafMAyVYqtLWRj7KDqyeGUpC4ZnFwn1ORL
         49Z+cR363ZPP30db8uY81zuLIQ1gQ5z3FAXyRmE+I3UrVVLp2fjfWoN997xvrYoPwuHH
         DPawvHCEz9sa9Tm1R8b3zIcyl3eXgkMy9ZoKsos14FSezFmCdwcnOBYM6FMFL2LKDSVy
         UvVg==
X-Forwarded-Encrypted: i=1; AJvYcCW//MmrWDRgHE49fpfkUDkOfVSTQi0KK5zdtaRwmBw7hXjENkyHjeV1ybwEWbv4zRU+Dc9FC1vkzY0aXPyu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1eWdB3FuoMc0xTmMP+Xo0YdP1xqLPMvJJTNEKTp25nREcIOPY
	46HvTvVkgy7O+ayxdQBWAo8qSGY9DZxy2qqwHvUeK8lqNpg/ms6ODxpXtzSanRDWjs1/unKTSuo
	6/d4r4uVnx4OKVZ+8ft+hVKCqEvuAwtnzmWgfoKEuv4RvqxF+l47/OpKDpiAIFn9qkl5j
X-Gm-Gg: ATEYQzzBpM8v43TvWpTaTzoNent5NgzJ6xDZVBO8lrGLQYXGE4mBo0MbxBuDWpbYBt2
	vinwzgOLhbJvbcrxVDrpu7RF/QRvJC140+0JjqEjozwb1U0vVG2g1aWcQibat34LQ1GE9/xWF74
	UzVRztamGxHPOd0R7MM04eWmrqBNj/68NZn171CiP2kwNRQkQYdHA6+zAUQRBreEvUja5RaXOtW
	Fa/+CPg85BnOy1IrC4NK5QZ1xqYzFXhHBg3DUmh7N323z6kp+rW0lUq60WE6cXMi+Ixm2GFk96d
	UTpAqFUUqcRlL4/0LzjvE51RtBdRFdsT1JsvMnv0HQhRhW1/R/tR2VbYgkGocmAR9JXk6XoX6Ms
	+5ET15VNP1yiwMoIiXGcGFAfT7RxLlKN0HimwMebOXDJZamo08KV1hqn0SzdfzVS0EIAiCcKsyi
	1rQcEwtjrcM+XhbnU=
X-Received: by 2002:a05:6a00:71c6:b0:829:8e51:505a with SMTP id d2e1a72fcca58-829a2f7a0d6mr9389310b3a.45.1773126665887;
        Tue, 10 Mar 2026 00:11:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:71c6:b0:829:8e51:505a with SMTP id d2e1a72fcca58-829a2f7a0d6mr9389287b3a.45.1773126665399;
        Tue, 10 Mar 2026 00:11:05 -0700 (PDT)
Received: from [10.249.19.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d372esm12756272b3a.61.2026.03.10.00.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:11:04 -0700 (PDT)
Message-ID: <f0aa45dc-cbe7-47ff-80b2-bdd5a8ae1585@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:11:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-2-75fa80a0a9e3@oss.qualcomm.com>
 <3dcfac27-4a6a-4322-bb39-089b934cc371@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <3dcfac27-4a6a-4322-bb39-089b934cc371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3EazwyzJ8wyJQZbfuL0TybHMJSVaEiic
X-Proofpoint-ORIG-GUID: 3EazwyzJ8wyJQZbfuL0TybHMJSVaEiic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA1OSBTYWx0ZWRfX+gyyMYJEF2ip
 t1bhUR4LJEZuSZ+nb8D8MCUnmWFpXZPo157lxakuRPFnC3zEyxYgRLkD1sAzZHpjgQmiqHxpvpA
 XqyquUaz+ydhoLFG9r5xlo84jSrZ7JExoKZt9FQtVCOJNTPA1RS+QoQUsewTP1JEGw7DJQcoVSv
 kx9ApPAyxLz1aPdac0EH/Ozv2GL2VEEQqgC1RWOOgPTRmhd1xYaEJlVtPRmFRdoukcNgNp8gCBM
 jRa+IgdAIcWpH3O58RcvEwVQIYbfHtoEeyrRHb7SgC2kSOLUZdKK11D6vavHTeggm9ipXrmSBhR
 4Ph964YhPJ8hdSa4ku7SpIcn64VrpNo5E72AxPRiF7awjCNyd7+JP3Hp2Dwx1BsiJPUzZN77RAJ
 NHJ8cNk9PWTJBXEHNFMivB5H/YzMxgyXF/SPM7Bhhoo24ZoWycTqH5ML+WkqA7HdXsv4byYqURF
 EHVwqeNwMflseJYuQbw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69afc40a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lIHO-FEEoKl4Bihg_moA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100059
X-Rspamd-Queue-Id: 9F03F246288
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-96504-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/3/7 21:15, Krzysztof Kozlowski wrote:
> On 06/03/2026 09:44, Wangao Wang wrote:
>> The Iris block on X1P differs from SM8550/X1E in its clock configuration
>> and requires a dedicated OPP table. The node inherited from the X1E cannot
>> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
>> be applied.
>>
>> Override the inherited clocks, clock-names, and operating points, and
>> replaces them with the X1P42100-specific definitions. A new OPP table
>> is provided to support the correct performance levels on this platform.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
> 
> DTS cannot  be put in the middle of patchset. Read submitting patches in DT.
> 
> 
> Best regards,
> Krzysztof

Understood, thanks for pointing this out.

-- 
Best Regards,
Wangao


