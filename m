Return-Path: <linux-arm-msm+bounces-105667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLgCH8RV+GmWtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3A4BA094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 701CF300139B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE3531F993;
	Mon,  4 May 2026 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQfN2is+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLkw+win"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A831960A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882554; cv=none; b=CUDolUzBO/4PN7Lu5PJ99b444TLcsM1Hwl3jAqgtioMwk4l86MBjOIGryDGtxi6/ppKZV94r0JbXxJj1rZy2aszQkWIMlsCX8cK4ncIggiVIqHoeGriKmJPNi3wQCdLoTsb++TdJrRBYzQEUO9pBJBZMK1APQvETnRjX2/jgzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882554; c=relaxed/simple;
	bh=qqWBD5eaFIU9KizaLKzjtpxmiA1BR9WA4pFtTXKxQYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZd8mwrZQbzIEUbBZs92pE3OLg4p3vVLCkuXRKvG91+s4fS3V8iUXjPn8rLLttXs3VB/cU6pS2s99BKmgZudPEjI0dN9oUTyQFmJ2kw2iboy16ZlSg41Q73Fu7whtOT8hzJqXnWul/4l9OmR5tkqnubc3E0bJN6mv5RzPGHkzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQfN2is+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLkw+win; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D8Gf117899
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEN6qE9RlmcD09uj7xXZJ8VNTzvkyWhISNHUq57QSeU=; b=lQfN2is+SVU+nUJq
	IZloRGWJcBGAscEfNGPk6m2+Wd50I+BwQejTpDHcgilinJaYSNop81R0s53lbWoN
	4qPzxP7IeU2TRrYbT4TETpY0nLxgRl8JGylxMKh0e8w/Iguqk1nx/EY7jCuvutlR
	Rpi9VWjrho/iJD3swwtXKKagz/Q/tafrFIrXYdlgNtzjYQdmikPBXywLRnDJvYuQ
	EgISs+ko2BJhFdsi24UUYO4mkK6Wu9etD4m32Vw9hJqrKEvIc6zCncUpXdPFUiA8
	3LE+AnzlKGmVScFbw+NPY5gw2nhoreGxBmZuA9D8YOKEeBKa+NXyK0u/MxyyC1fs
	AjrKGg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejmt9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:15:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62f3211fd6dso28846137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882551; x=1778487351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEN6qE9RlmcD09uj7xXZJ8VNTzvkyWhISNHUq57QSeU=;
        b=TLkw+wind4OgjMMWqizylQhu081a3S/RN+Sd9CcNJEDEZanZjiAaa/JEeKa2FRyloR
         KwaoZdq/w6aY7zgXdD50mToonnoFCosPafhzSLAYitGlkLGYJark/TR+wSUBQjwtcyHE
         +nUvg9Oq0NVT5zKssa3GJXn3L5KwoP46MfQvTjyccimPqaT5HfhrQ0wZ7j2bYknSkJSw
         VZft3+vzNINanibQc62ppO7Lx5J1q1ovGOQDpJzqY+XYFpOIMXT1z2By+BmWSNKOBpav
         yY7GMK+3/dNffSd4rHle3ThF+ESZpcbZU4R98rHkmi0maDMs5NhDZ4txAUxAyT6Sogy7
         Mqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882551; x=1778487351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEN6qE9RlmcD09uj7xXZJ8VNTzvkyWhISNHUq57QSeU=;
        b=eYK1bWN6glekQ2R3Pz3SrdV8qF3uObcJDDOflmrrEWe2hkSJZoinDeQsDyTNZkh+sE
         KBUQ1mWGLb6MSJLN2bHSmJYDL8dTxlKx+DSW9ZBjJhh4bbtuH6cuvexm3bL9CXEHMb0j
         GOL3eUsDJfKAiXJWN/AHyu23+DkNl6jX7tElxRxRh7MAqs3/Ksa60z8GVmty2hOJ6Clt
         x590hKg4uMPMYZzBEzrCdU2udMrtKjDqwcUoLnNFf6hEQyYmMEQ1BoRHqPVaHvBpdNjZ
         8UBlVwYFSIk9P8rMPeaRWnqa0p9c43sjacyOoucJJGWO30+KOEAJ+EvnaROk6wIvAUeH
         v1pQ==
X-Gm-Message-State: AOJu0Yx/RBLqHikk4qdqbQQnuWMTIu/DqgvxyMcuCMLuU3atJz5qk7gs
	Vo1YCRLTIIc82WmX5WWPJ0WPZhG7tFHERfFeifLw2bZiYljoslabWa/8JERXqBlopZl++Orpr1u
	9SZtgm1EECvtd3HN0Jnqi41LhWWsqG6ldQTg0BXc2VYlTZi/NHNNva1iJQ1Wp8g30BNNv
X-Gm-Gg: AeBDietT77ekmSbpcfhMgg3oxYyOAVM+8OZfm06cB//WiSylHGsatIuXewk+JURzN9T
	BHfENqV0Ynqjyhc5cUfXA+3k7cWGLiAX8xrHeHStnS4/PeWtbBRPWCmL+HG6NFSd5R9iBBizbbZ
	phebN8R6nST5pVjmT91AIGl7QF7/waxS/DO/yCDX1AJJkGSfmGWlBtv6PCFAhf+n1hKf/tHF7pF
	YH2wSylrrFluedd9hDnArtGGgP0b2vel58RA7LHIBOjoED2m+7uAXqJa45CgJEXS/gYtVlTkQrZ
	H0Y8zAT/Qg6O9N1X6Qjm5whbDfuy8WTer3q96/Co7Uu/NOCTogeot2FYJ2Ier/GxB+b2N6eSb/1
	/8hV236myPnnONZW5rpDQjM9PSx2NfEz2nIy8LzEy460/pZV+cFlEpZGrokC0JsV1MRkJPA1QeS
	eYUT1xdJNlWn479w==
X-Received: by 2002:a05:6102:5128:b0:62f:2f09:6039 with SMTP id ada2fe7eead31-62f2f097073mr652041137.6.1777882551485;
        Mon, 04 May 2026 01:15:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5128:b0:62f:2f09:6039 with SMTP id ada2fe7eead31-62f2f097073mr652031137.6.1777882551144;
        Mon, 04 May 2026 01:15:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1dd343108sm112820566b.63.2026.05.04.01.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:15:50 -0700 (PDT)
Message-ID: <a7eb675b-977c-4165-91b3-bd31a6d89ee7@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:15:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom_smd: Add PM8150 regulators
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
 <20260429-add_pm8150_regulators-v1-2-9879c0967cf0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-add_pm8150_regulators-v1-2-9879c0967cf0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OSBTYWx0ZWRfXwdWjpq0kQhyn
 AlsNegcoNmvmw/0VC06Pk+MNPHratTAVXr8Fw3OeO59+xcL87N+lDBEh8/+7qUUVB6SKWNoST/A
 6HX9mXbxzTrZMOie7T77FwEDS+2Jkg6R2kcXml7KVh4iFWFx8zRd8VvThp3N6PVn+unlS2ymrtJ
 J5vStnM24ZjQoT6sCvS0qzuN/D02+9jouZVEJSBbQWWNof/hQsdg1W1Gdjx2RI2flWTk7XfGow5
 HPuJd3gxQvWe79BjBZF5E8Y1rF9r0SWQt7Gy8O9tsgRreQt9tHvb7rDG+0SRYmhA223vA/4TD74
 PcFBF/C/22oYuNrOD/UKZNYOA6BiFyDQ0mh0nMdCm8kkg2fa64+Kygwl5pH4j3SkcJ5zXM+fi5V
 B5+8v21iouPMvhi8mOLlxQSw2RXMaEYPXRF75qv9AiZI8AossirsPmqqxJUwBd8g1lKM6JuCoCy
 RtxiWuDW1OWVBsTeKWg==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f855b8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D2dM7-3mFIAQKa9iRAQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: SyuoDD4u5xdY8GxPtYqqWdUPytBhqnng
X-Proofpoint-GUID: SyuoDD4u5xdY8GxPtYqqWdUPytBhqnng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040089
X-Rspamd-Queue-Id: 75A3A4BA094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105667-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 3:26 PM, Rakesh Kota wrote:
> The PM8150 is found on boards with shikra SoCs and It
> provides 10 SMPS and 18 LDO regulators.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

