Return-Path: <linux-arm-msm+bounces-90518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILH8McNAd2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:24:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58086CCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B76E43001CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4950032F761;
	Mon, 26 Jan 2026 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWv4yEiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvDe8sQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D224A04A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423038; cv=none; b=hd5tKnw15VODMhcZ7iSObjEgbcZyhso1io8WZl5vKKQxiMfjQXlOJ+gwk2nAcLqW5KSXLDhkOEOLk2OQirH9Dr3yBKEsw51YiQaQ2aNDghdV82KMMlF/5bEGvYAsB1aTtuZjLbVXh6MZlTZ8oCZ7qG2h/SZYWi6yUMXcO0VQVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423038; c=relaxed/simple;
	bh=94ux3DATjgnyZVByJTnPpMaLj5Y+euaNR6JNSuQb85A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9v7jUh/2dKhoV/8oZIhKv4bxfd2tX2KmK89kW110Ml8wT8NHq7B9GM9pukWjb5FSzke7jEyBtAl5g05lDcRWzAfBjVNCsL9+Z1BYyIpN478PCn1iHbmnd3ok7GQF/hgtjklmLtIMRreUIzv65aHL0lglWzhCVNptogKs5QxUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWv4yEiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvDe8sQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8ctiE1016264
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLqLV1YDeug/efmj0GLJptkf3ni7N+0r7HGaQFhUIhA=; b=ZWv4yEiYOlJL48E0
	X/a13NNw9PXNE1e3doU9Y+p/3e5dbrOGNer71bxORX3dP3qzFfxHPoZMZvcWVjLz
	Gp8oZNUxk7e0/MwsTa1XcYUC+vlA6P2iSbrnzoY5d8apvTNm7q/vJ7qRw0RXeFIw
	XGYYsHLZFizjPqNU7hSuOmnFZJAvKw2B0hCv7hFKkfMzIGp4FOvdkFC6j6kHppqe
	8t+H5vY6f57kxxAPYhlnKp/zyFWKXj3OWuAFxDhNiUhr43NtTwc4oTnLEfxjVRho
	2hRn84PiTwvbqdVw1DASxVMjzyTLefOnUto8BQMno2TzHLwlTLybmlqbsdeYd6Ep
	XQrmog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hc6ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:23:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so134349585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423035; x=1770027835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLqLV1YDeug/efmj0GLJptkf3ni7N+0r7HGaQFhUIhA=;
        b=VvDe8sQU0K0OK0qXhOd77FjOjadB4zNnsMy0zWHzZ999lbc47zYe6tQMytnQDMp05F
         BvuWymU6UPSmfdASDX6xzvvKWxfGmzn9ZVaMYQV4OI67eIAbuar21cYQqtzqBzHKxVIB
         Ay02o+kH58pHZLLTZ4VvHrFqn34AVm6cmh89Db4YmlIrZWVH0oxBjG6BOCLJ9SY1ancu
         lOvyLUK5P/eOfmY5nspxOa9yx+Wcr1TSZyX05h9IEc6E4WOe5rMxJFmxmZLuE2K6Di8+
         bquE/1JovgyMXYDjnc/Ga2MXvI4gcufDZFX0K96LHJTeiJ+n0mWrmZqK9csAB2G/OjNY
         R3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423035; x=1770027835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLqLV1YDeug/efmj0GLJptkf3ni7N+0r7HGaQFhUIhA=;
        b=tXh3MqshqNYSGNB6GSMhnULvX7wlyHLA1RPa3zFS/hropzu0gugri7+OQ+nYOUbLTV
         jd5SLmdyBiYCkdy6c9ZAJgy/xF4td2f/e9EpeXzQdNxgbUigUBFOjOe45xEBH+yDi+4i
         fk7CYNDvFVAE69AJi0FK1oWk5Iqf4cewfRML3N+UaGXQVlH8IcLVxzuwI+vvy1DGj7KV
         /Lzn5sBxI6N2a8qfDfVy62NenQpbpX0EWcEiIEgHbqu9b4RiIu4hs/WBhjXVWGv3IIim
         /lV6PoccHeTuxgAlhaE+t+wWmaitfLAhGIe6e5m+KXsRa+dI+Exj8mG9JVsTxT/hxOXv
         gb3w==
X-Forwarded-Encrypted: i=1; AJvYcCU/ssi19ydEOEj1YAK1TG/wUawVoJlDSOkVRwHStr29DACh+dnecR6p2HWUbBprdOHZpKhcT7zwPM0MUV6n@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVinV6g+rQESYKapVBwlsRrUAsplxcwh3hOXVZdWXV1p/CchX
	Oj8eLWDZIkpWRexifgNpU1kcG+eytWCRTg2cyEmLiChQcdajEoi54cgxdgi9oemFrgbb99oOXsy
	rlYkY85Y2TZgalHE2stGbcz3wxgS4Ky/4y9jMzPiJeP9NyiQVgdGHZHJaRckvQcNdxeFt
X-Gm-Gg: AZuq6aJnbjpTOWYtAXZ0wYrxUVdxYxS6nhdBx+i8SIe5bdgvrMJ0MZvx2XaldAs2Og6
	gzk2t//DBE43dFdH2ozFXXhxLBI6JE1wAWOhpadLZw+Nvsw0D95TAWAPYyYn9HzZnEBgoJcOf7Z
	rfuMTxC0jZEudkT2J4/YnP/UaWihQQc5/eDu0E3kJE0Udr8FYDq/6TqyHNFAww0m15M1foWOZ/b
	aYEoZ+nt3cZ1NneBcBEAsiF/LxEWa5Pt0H4uzAfJU/RV23wfLBmu6djjimJ9EjNQLkVFWpWKDoN
	GwKoi9pzcGhwKb27726vkgsz8tNJmseCf2PRbtOuL52cc9A5P4vMyMAmomO0TH1s7utD/UbUcHV
	VcMfX1oH3Oet95aThWPl2v4w3o9AQBkAA7q+sWwv2y7qODOo66c2Uq9St96JmAZM3hGs=
X-Received: by 2002:a05:620a:4688:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6f9677c99mr336821585a.11.1769423035261;
        Mon, 26 Jan 2026 02:23:55 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6f9677c99mr336819785a.11.1769423034775;
        Mon, 26 Jan 2026 02:23:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b66dsm5153265a12.20.2026.01.26.02.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:23:54 -0800 (PST)
Message-ID: <cc89a22c-ec9d-4660-ae78-7d0323c99d4a@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:23:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
 <20260123-enable-ufs-ice-clock-scaling-v3-1-d0d8532abd98@oss.qualcomm.com>
 <gfqpfzulzptkrbcrc2zcnqv6kmtdgwwxqc2rxnbq3rlh7azilj@srzlycd7wv4d>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gfqpfzulzptkrbcrc2zcnqv6kmtdgwwxqc2rxnbq3rlh7azilj@srzlycd7wv4d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OCBTYWx0ZWRfX2HZf5u93u+AV
 tu71zcilb4AIl/arf/u8xeRQ68X24kFwaF86PB6kJrtESSfbfsy9gXM63F6nBrQCUkkTzHaH8Uw
 2+qU6OkkgapSNxlIvM3gAaRIH0qegkf2XGgUoDIFI6PqE/YWoV3aOlXc3bUicRJxQuRDlw1KpZy
 w3q7mWyDDbghnQ8SepmmZ4DpG+M6ItYzzsIoP+k6hUMUi5y2IdU92IVX875u9a0WASH12ixozUk
 Rxr5mzvV3hALHGlT/rp7o2iIyc60DGKo/yJGkQW3Q0Smw2EKk+yb4EJ8kr0FdlxVUQaZC8/isZF
 CP6Wwy1ewmDVx/xcGUQsKiKUgC4ustOnXggtUpwMF8HUcOlEXsoMc9EbbViMyaFopCzGmAfcKvX
 DNT9UqI/KspZ214IpSJ6Tn8lN8sUTn9lXaBMWHkUeeRobhHG2ks1qLUIY+r7QOExZbOHocG/LE5
 9OiOtUuORQFVViqbC0A==
X-Proofpoint-ORIG-GUID: BgQkuaDcIYm1DhvlP-gVUGLCH5yLYJUx
X-Proofpoint-GUID: BgQkuaDcIYm1DhvlP-gVUGLCH5yLYJUx
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=697740bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oXxr4s8vNUwlBxEnOasA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90518-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB58086CCE
X-Rspamd-Action: no action

On 1/23/26 8:21 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 23, 2026 at 12:42:12PM +0530, Abhinaba Rakshit wrote:
>> Register optional operation-points-v2 table for ICE device
>> and aquire its minimum and maximum frequency during ICE
>> device probe.
>>
>> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
>> core clock if valid (non-zero) frequencies are obtained from
>> OPP-table. Disable clock scaling if OPP-table is not registered.
>>
>> When an ICE-device specific OPP table is available, use the PM OPP
>> framework to manage frequency scaling and maintain proper power-domain
>> constraints.
>>
>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>> ---

[...]

>> +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!ice->has_opp)
>> +		return ret;
>> +
>> +	if (scale_up && ice->max_freq)
>> +		ret = dev_pm_opp_set_rate(ice->dev, ice->max_freq);
>> +	else if (!scale_up && ice->min_freq)
>> +		ret = dev_pm_opp_set_rate(ice->dev, ice->min_freq);
> 
> Do we expect that there allways will be only two entries in the OPP?
> If so, it should be a part of the bindings. If not, please design the
> API with more flexibility in mind.

hamoa:

LOW_SVS: 100 MHz
SVS: 201.5 MHz
NOM: 403 MHz

Konrad

